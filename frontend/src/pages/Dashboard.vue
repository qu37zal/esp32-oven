<template>
  <div>

    <!--Stats cards-->
    <div class="row">
      <div class="col-md-6 col-xl-4" v-for="stats in statsCards" :key="stats.title">
        <stats-card>
          <div class="icon-big text-center" :class="`icon-${stats.type}`" slot="header">
            <i :class="stats.icon"></i>
          </div>
          <div class="numbers" slot="content">
            <p>{{stats.title}}</p>
            {{stats.value}}
          </div>
          <div class="stats row" slot="footer">
            <div class="col-auto mr-auto"><i :class="stats.footerIcon"></i> {{stats.footerText}}</div><div class="col-auto" v-if="stats.footerButton"> {{stats.footerButton}}</div>
          </div>
        </stats-card>
      </div>
    </div>

    <!--Charts-->
    <div class="row">

      <div class="col-12">
        <chart-card title="Probe Data"
        sub-title="Last 24h"
        :chart-data="samples"
        :chart-options="usersChart.options">
        <span slot="footer">
          <i class="ti-reload"></i> Updated 3 minutes ago
        </span>
        <div slot="legend">
          <i class="fa fa-circle text-info"></i> P01
          <i class="fa fa-circle text-danger"></i> P02
          <i class="fa fa-circle text-warning"></i> P03
          <i class="fa fa-circle text-warning"></i> P04
        </div>
      </chart-card>
    </div>

    <!-- div class="col-md-6 col-12">
    <chart-card title="Email Statistics"
    sub-title="Last campaign performance"
    :chart-data="preferencesChart.data"
    chart-type="Pie">
    <span slot="footer">
    <i class="ti-timer"></i> Campaign set 2 days ago</span>
    <div slot="legend">
    <i class="fa fa-circle text-info"></i> Open
    <i class="fa fa-circle text-danger"></i> Bounce
    <i class="fa fa-circle text-warning"></i> Unsubscribe
  </div>
</chart-card>
</div>

<div class="col-md-6 col-12">
<chart-card title="2015 Sales"
sub-title="All products including Taxes"
:chart-data="activityChart.data"
:chart-options="activityChart.options">
<span slot="footer">
<i class="ti-check"></i> Data information certified
</span>
<div slot="legend">
<i class="fa fa-circle text-info"></i> Tesla Model S
<i class="fa fa-circle text-warning"></i> BMW 5 Series
</div>
</chart-card>
</div -->

</div>

</div>
</template>
<script>
import { StatsCard, ChartCard } from "@/components/index";
import Chartist from 'chartist';
import axios from 'axios';
import moment from 'moment';

export default {
  components: {
    StatsCard,
    ChartCard
  },
  /**
  * Chart data used to render stats, charts. Should be replaced with server data
  */
  created() {
    axios.get(`http://localhost:8080/data`)
      .then(response => {
        // JSON responses are automatically parsed.
        // process data into bins

        var labels = [];
        var series = [ [], [], [], [], [], [], [], [] ];
        var bin = [];
        var last = 0;
        var sum = [];
        sum[0]=0.0;
        sum[1]=0.0;
        sum[2]=0.0;
        sum[3]=0.0;
        sum[4]=0.0;
        sum[5]=0.0;
        sum[6]=0.0;
        sum[7]=0.0;
        var count = 0;
        response.data.forEach(el => {
          // console.log(el)
          if ((el.epoch - last) > 600) { // 10 minutes per bin
            // average bin
            series[0].push(sum[0]/count);
            series[1].push(sum[1]/count);
            series[2].push(sum[2]/count);
            series[3].push(sum[3]/count);
            series[4].push(sum[4]/count);
            series[5].push(sum[5]/count);
            series[6].push(sum[6]/count);
            series[7].push(sum[7]/count);
            sum = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
            count = 0;
            last = el.epoch;
            var bindate = new Date(el.epoch*1000);
            console.log(moment(bindate).format('h:mm'));
            labels.push(moment(bindate).format('h:mm'));
          } else {
            sum[0]+=el.t0;
            sum[1]+=el.t1;
            sum[2]+=el.t2;
            sum[3]+=el.t3;
            sum[4]+=el.t4;
            sum[5]+=el.t5;
            sum[6]+=el.t6;
            sum[7]+=el.t7;
            count++;
          }
        });
        this.samples = { labels: labels, series: series };
      })
      .catch(e => {
        console.log(e);
      })

      // async / await version (created() becomes async created())
      //
      // try {
      //   const response = await axios.get(`http://jsonplaceholder.typicode.com/posts`)
      //   this.posts = response.data
      // } catch (e) {
      //   this.errors.push(e)
      // }
    },
    methods: {
      createConversation: function (id) {
        this.$dispatch('createConversation', id)
      }
    },
    data() {
      return {
        samples: {},
        statsCards: [
          {
            type: "success",
            icon: "ti-dashboard",
            title: "P00 (Chamber)",
            value: "215.12 °F",
            footerText: "Updated now",
            footerIcon: "ti-reload"
          },
          {
            type: "success",
            icon: "ti-timer",
            title: "Cook Timer",
            value: "23h42m",
            footerText: "Last day",
            footerIcon: "ti-calendar",
            footerButton: "Reset"
          },
          {
            type: "danger",
            icon: "ti-pulse",
            title: "Errors",
            value: "23",
            footerText: "In the last hour",
            footerIcon: "ti-timer",
            footerButton: "Reset"
          }
        ],
        usersChart: {
          data: {
            labels: [
              "9:00AM",
              "12:00AM",
              "3:00PM",
              "6:00PM",
              "9:00PM",
              "12:00PM",
              "3:00AM",
              "6:00AM"
            ],
            series: [
              [110, 135, 182, 197, 203, 215, 216, 215, 214],
              [70, 72, 90, 162, 194, 126, 198, 195, 152],
              [71, 78, 93, 140, 187, 135, 135, 142, 144],
              [45, 48, 67, 148, 190, 139, 137, 110, 110],
            ]
          },
          options: {
            low: 0,
            high: 350,
            showArea: false,
            height: "245px",
            axisX: {
              showGrid: false
            },
            lineSmooth: Chartist.Interpolation.simple({
              divisor: 3
            }),
            showLine: true,
            showPoint: false
          }
        },
        activityChart: {
          data: {
            labels: [
              "Jan",
              "Feb",
              "Mar",
              "Apr",
              "Mai",
              "Jun",
              "Jul",
              "Aug",
              "Sep",
              "Oct",
              "Nov",
              "Dec"
            ],
            series: [
              [542, 543, 520, 680, 653, 753, 326, 434, 568, 610, 756, 895],
              [230, 293, 380, 480, 503, 553, 600, 664, 698, 710, 736, 795]
            ]
          },
          options: {
            seriesBarDistance: 10,
            axisX: {
              showGrid: false
            },
            height: "245px"
          }
        },
        preferencesChart: {
          data: {
            labels: ["62%", "32%", "6%"],
            series: [62, 32, 6]
          },
          options: {}
        }
      };
    }
  };
  </script>
  <style>
  </style>
