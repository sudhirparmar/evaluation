import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';
import { Globals } from '.././globals';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { PerformanceReviewService } from '../services/performance-review.service';
declare var $, swal: any;
declare function myInput(): any;
declare var $, Bloodhound: any;

@Component({
  selector: 'app-performance-review',
  templateUrl: './performance-review.component.html',
  styleUrls: ['./performance-review.component.css']
})
export class PerformanceReviewComponent implements OnInit {
  QuestionList;
  constructor(private http: Http, public globals: Globals, private router: Router, private route: ActivatedRoute,
    private PerformanceReviewService: PerformanceReviewService) { }

  ngOnInit() {
    setTimeout(function () {
      if ($(".bg_white_block").hasClass("ps--active-y")) {
        $('footer').removeClass('footer_fixed');
      }
      else {
        $('footer').addClass('footer_fixed');
      }
    }, 1000);
    setTimeout(function () {
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 250,
        itemMargin: 5,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel",
        start: function (slider) {
          $('body').removeClass('loading');
        }
      });

    }, 100);
    this.PerformanceReviewService.getAllQuestionData()
      .then((data) => {
        this.QuestionList=data;
      },
      (error) => {
        // this.globals.isLoading = false;
        this.router.navigate(['/pagenotfound']);
      });
  }

}