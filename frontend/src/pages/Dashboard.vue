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
        :chart-data="asyncChartData"
        :chart-options="usersChart.options">
        <span slot="footer">
          <i class="ti-reload"></i> Updated 3 minutes ago
        </span>
        <div slot="legend">
          <i class="fa fa-circle plot0"></i> P00
          <i class="fa fa-circle plot1"></i> P01
          <i class="fa fa-circle plot2"></i> P02
          <i class="fa fa-circle plot3"></i> P03
          <i class="fa fa-circle plot4"></i> P04
          <i class="fa fa-circle plot5"></i> P05
          <i class="fa fa-circle plot6"></i> P06
          <i class="fa fa-circle plot7"></i> P07
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
  asyncComputed: {
    async asyncChartData() {
      var data = await this.getChartData();
      console.log("Data: ", data);
      return data;
    }
  },
  components: {
    StatsCard,
    ChartCard
  },
  /**
  * Chart data used to render stats, charts. Should be replaced with server data
  */
  created() {
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
    getChartData: function () {
      return new Promise((resolve, reject) => {
        axios.get(`http://localhost:8080/data`)
          .then(response => {
            // JSON responses are automatically parsed.
            // process data

            var labels = [];
            var series = [[],[],[],[],[],[],[],[]];
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
            var count = 0.0;
            for (var i = 0, len = response.data.length; i < len; i++) {

              if ((response.data[i].epoch - last) > 60*5) { // 5 minutes per bin
                // average bin
                series[0].push( { x: new Date(response.data[i].epoch), y: (sum[0]/count>0)?sum[0]/count:null } );
                series[1].push( { x: new Date(response.data[i].epoch), y: (sum[1]/count>0)?sum[1]/count:null } );
                series[2].push( { x: new Date(response.data[i].epoch), y: (sum[2]/count>0)?sum[2]/count:null } );
                series[3].push( { x: new Date(response.data[i].epoch), y: (sum[3]/count>0)?sum[3]/count:null } );
                series[4].push( { x: new Date(response.data[i].epoch), y: (sum[4]/count>0)?sum[4]/count:null } );
                series[5].push( { x: new Date(response.data[i].epoch), y: (sum[5]/count>0)?sum[5]/count:null } );
                series[6].push( { x: new Date(response.data[i].epoch), y: (sum[6]/count>0)?sum[6]/count:null } );
                series[7].push( { x: new Date(response.data[i].epoch), y: (sum[7]/count>0)?sum[7]/count:null } );
                sum = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
                count = 0;
                last = response.data[i].epoch;
              } else {
                sum[0]+=parseFloat(response.data[i].t0);
                sum[1]+=parseFloat(response.data[i].t1);
                sum[2]+=parseFloat(response.data[i].t2);
                sum[3]+=parseFloat(response.data[i].t3);
                sum[4]+=parseFloat(response.data[i].t4);
                sum[5]+=parseFloat(response.data[i].t5);
                sum[6]+=parseFloat(response.data[i].t6);
                sum[7]+=parseFloat(response.data[i].t7);
                count++;
              }
            }

            this.chartData = { series: series };
            console.log({ labels: labels, series:
              [
                { name: 'series-a', data: series[0] },
                { name: 'series-b', data: series[1] },
                { name: 'series-c', data: series[2] },
                { name: 'series-d', data: series[3] },
                { name: 'series-e', data: series[4] },
                { name: 'series-f', data: series[5] },
                { name: 'series-g', data: series[6] },
                { name: 'series-h', data: series[7] },
              ]});

              console.log(JSON.stringify(this.chartData));

              resolve(this.chartData);
            })
            .catch(e => {
              console.log(e);
              reject(e);
            })
          });
        }
      },
      data() {
        return {
          chartData: {},
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
            options: {
              low: 60,
              high: 100,
              showArea: false,
              height: "245px",
              axisX: {
                type: Chartist.FixedScaleAxis,
                divisor: 10,
                labelInterpolationFnc: function(value) {
                  return moment(value*1000).format('h:mm A');
                }
              },
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

    .plot0 {
      color: #FF0000;
    }
    .plot1 {
      color: #FFA500;
    }
    .plot2 {
      color: #EEEE00;
    }
    .plot3 {
      color: #00EE00;
    }
    .plot4 {
      color: #0000FF;
    }
    .plot5 {
      color: #A0A0FF;
    }
    .plot6 {
      color: #EE22EE;
    }
    .plot7 {
      color: #9400D3;
    }

    </style>
