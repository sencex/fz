var dataJson = {
    objects: [{
        //地板
        type: 'floor',
        width: 3000,
        height:10,
        depth: 1600,
    },
        //控制台主体
        {
            type: 'floor_box',
            width: 750,
            height: 50,
            depth: 100,
            translate:[-475, 100,50],
        },
        //控制台拐弯
        {
            type: 'floor_box',
            width: 50,
            height: 50,
            depth: 100,
            translate:[-825, 100,150],
        }, {
            type: 'floor_box',
            width: 50,
            height: 50,
            depth: 100,
            translate: [-125, 100, 150],
        },
        //信号机房外控制台
        {
            type: 'floor_box',
            width: 200,
            height: 20,
            depth: 50,
            translate: [130,80, 330],
            rotate: [0, Math.PI / 180 * -8, 0],
        },
        //屏幕墙
        {
            type: 'wall_box',
            width: 780,
            height: 250,
            depth: 5,
            translate: [-480, 10, -360],
            color:'#FFFF00 ',

        },

        //控制台电脑
        {
            type: 'pc',
            translate: [-760, 150, 50],
            picture:demo.getRes('wg1.jpg'),
            video:demo.getRes('wg1.mp4'),
        },
        {
            type: 'pc',
            translate: [-680, 150, 50],
            picture:demo.getRes('gf.jpg'),
            video:demo.getRes('gf.mp4'),
        },
        {
            type: 'pc',
            translate: [-600, 150, 50],
            picture:demo.getRes('kgr.bmp'),
            video:demo.getRes('kgr.mp4'),
        },
        {
            type: 'pc',
            translate: [-520, 150, 50],
            picture:demo.getRes('pp.png'),
            video:demo.getRes('pp.mp4'),
        },
        {
            type: 'pc',
            translate: [-440, 150, 50],
            picture:demo.getRes('bh1.bmp'),
            video:demo.getRes('bh1.mp4'),
        },
        {
            type: 'pc',
            translate: [-360, 150, 50],
            picture:demo.getRes('bh2.bmp'),
            video:demo.getRes('bh2.mp4'),
        },
        {
            type: 'pc',
            translate: [-280, 150, 50],
            picture:demo.getRes('gf.jpg'),
            video:demo.getRes('gf.mp4'),
        },
        {
            type: 'pc',
            translate: [-200, 150, 50],
            picture:demo.getRes('wg2.png'),
            video:demo.getRes('wg2.mp4'),

        },
        //外墙
        {
            type: 'wall',
            height: 200,
            translate: [-1200, 0, -500],
            data: [[0, 200],[700.100], [1600, 0], [2200, 0], [2200, 200], [2400, 200], [2400, 800],[2000,800],[1600,800],[1100,900],[300,1100],[0,200]],

            children: [

                {
                    type: 'window',
                    translate: [-400, 30, 500],
                    width: 100,
                    height: 150,
                    depth: 50,
                },{
                    type: 'window',
                    translate: [-200, 30, 500],
                    width: 100,
                    height: 150,
                    depth: 50,
                },{
                    type: 'window',
                    translate: [0, 30, 500],
                    width: 100,
                    height: 150,
                    depth: 50,
                },{
                    type: 'window',
                    translate: [200, 30, 500],
                    width: 100,
                    height: 150,
                    depth: 50,
                },{
                    type: 'window',
                    translate: [400, 30, 500],
                    width: 100,
                    height: 150,
                    depth: 50,
                },{
                    type: 'window',
                    translate: [600, 30, 500],
                    width: 100,
                    height: 150,
                    depth: 50,
                },{
                    type: 'window',
                    translate: [800, 30, 500],
                    width: 100,
                    height: 150,
                    depth: 50,
                },
                {
                    type: 'door',
                    width: 100,
                    height: 180,
                    depth: 26,
                    translate: [950, 0, 500],
                },
            ],
        },
        //植物

        {
            type: 'plants',
            shadow: true,
            translates: [[-800, 0,300], [-850, 0, -300],[-50,0,-300]],
        }, {
            type: 'plants',
            scale: [0.5, 0.3, 0.5],
            shadow: false,
            translates: [[-230, 140,10], [200, 90, 320]],
        },
        //半透明隔断墙
        {
            type: 'glass_wall',
            shadow:false,
            width: 500,
            rotate: [0, Math.PI / 180 * 80, 0],
            translate: [100, 0, -100],
        },  {
            type: 'glass_wall',
            width: 370,
            shadow: false,
            translate: [220, 0, 275],
            rotate: [ 0,Math.PI / 180 * -8, 0],
        }, {
            type: 'glass_wall',
            width: 300,
            shadow: false,
            translate: [550, 0, 300],
        },
        {
            type: 'glass_wall',
            width: 500,
            rotate: [0, Math.PI / 180 * 90, 0],
            translate: [800, 0, -50],
        },{
            type: 'glass_wall',
            width: 200,

            translate: [900, 0, 300],
        },
        //机柜
        {
            type: 'racks',
            translates: [



                [300, 0, -200],
                [300, 0, -200 + 62],
                [300, 0, -200 + 62 + 62 ],
                [300, 0, -200 + 62 + 62 + 62],
                [300, 0, -200 + 62 + 62 + 62 + 62],
                [300, 0, -200 + 62 + 62 + 62 + 62 + 62],

                [500, 0, -200 + 62],
                [500, 0, -200 + 62 + 62 ],
                [500, 0, -200 + 62 + 62 + 62],
                [500, 0, -200 + 62 + 62 + 62 + 62],
                [500, 0, -200 + 62 + 62 + 62 + 62 + 62],
                [500, 0, -200 + 62 + 62 + 62 + 62 + 62  +62],

                [700, 0, -200],
                [700, 0, -200 + 62],
                [700, 0, -200 + 62 + 62],
                [700, 0, -200 + 62 + 62 + 62],
                [700, 0, -200 + 62 + 62 + 62 + 62 ],
                [700, 0, -200 + 62 + 62 + 62 + 62 + 62],
                [700, 0, -200 + 62 + 62 + 62 + 62 + 62 + 62],

                [900, 0, 0],
                [900+62, 0, 0],
                [900+62+62, 0, 0],
                [900+62+62+62, 0, 0],

            ],

            rotates:[
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],

                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 *- 90, 0],
                [0, Math.PI / 180 * -90, 0],

                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 *- 90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],
                [0, Math.PI / 180 * -90, 0],

                [0, 0, 0],
                [0, 0, 0],
                [0, 0, 0],
                [0, 0, 0],


            ],

            labels: (function () {
                var labels = [];
                for (var k = 0; k < 23; k++) {
                    var label = '机架';
                    if (k < 10) {
                        label += '0';
                    }
                    labels.push(label + k);
                }
                return labels;
            })(),
           // severities: [mono.AlarmSeverity.CRITICAL, null, null, mono.AlarmSeverity.WARNING, mono.AlarmSeverity.CRITICAL, null, mono.AlarmSeverity.MINOR, mono.AlarmSeverity.WARNING, mono.AlarmSeverity.WARNING, null, mono.AlarmSeverity.MINOR],
        },
        //屏幕墙
        {
            type: 'tv',
            
            translate: [-750, 180, -350],
            picture:demo.getRes('pmq1.png'),
            video:demo.getRes('pmq1.mp4'),
        },{
            type: 'tv',

            translate: [-750, 110, -350],
            picture:demo.getRes('pmq2.png'),
            video:demo.getRes('pmq2.mp4'),
        },{
            type: 'tv',

            translate: [-750, 40, -350],
            picture:demo.getRes('pmq3.png'),
            video:demo.getRes('pmq3.mp4'),
        },{
            type: 'tv',

            translate: [-600, 180, -350],
            picture:demo.getRes('pmqws.jpg'),
            video:demo.getRes('pmqws.mp4'),
        },{
            type: 'tv',

            translate: [-600, 110, -350],
            picture:demo.getRes('pmqkt.jpg'),
            video:demo.getRes('pmqkt.mp4'),
        },{
            type: 'tv',

            translate: [-600, 40, -350],
            picture:demo.getRes('pmqws.jpg'),
            video:demo.getRes('pmqws.mp4'),
        },{
            type: 'tv1',
            translate: [-430, 160, -350],
            picture:demo.getRes('pmqgq3.png'),
            video:demo.getRes('pmqgq3.mp4'),
        },{
            type: 'tv1',
            translate: [-430, 70, -350],
            picture:demo.getRes('pmqgq4.png'),
            video:demo.getRes('pmqgq4.mp4'),
        },{
            type: 'tv1',
            translate: [-240, 160, -350],
            picture:demo.getRes('pmqgq1.png'),
            video:demo.getRes('pmqgq1.mp4'),
        },{
            type: 'tv1',
            translate: [-240, 70, -350],
            picture:demo.getRes('pmqgq2.png'),
            video:demo.getRes('pmqgq2.mp4'),
        },
    
        //信号机房外电视机
        {
            type: 'tv',
            translate: [120, 100, 270],
            rotate: [0, Math.PI / 180 * -8, 0],
            picture:demo.getRes('af.png'),
            video:demo.getRes('af.mp4'),
        },
        //墙上宣传板
        {
            type: 'post',
            translate: [900, 110, -290],
            width: 70,
            height: 120,
            pic: demo.getRes('post.jpg'),
            title:'pdftest',
            link: '../wiki/index.html',
        },
        //桥架
        {
            type: 'rail',
            data: [[300, 100], [1100,100],[1100,0],]
        },
        //线缆连接
        {
            type: 'connection',
            color: '#ED5A00',
            y: 265,
            flow: 0.05,
            data: [

                [300, -100, 0],
                [400, -100, 0],
                [400,-265,0],
                [950,-265,0],
                [950, -265, -100],
                [950,-100,-100],
                [950,-100,0],

            ],
        }, {
            type: 'connection',
            color: '#21CD43',
            y: 265,
            flow: -0.05,
            data: [
                [300,-100,-100],
                [300, 0, -100],
                [1100, 0, -100],
                [1100,0,0],
                [1100,-100,0],
            ],
        },

        //摄像头按从左到右，从上到下
        {
            type: 'gleye',
            translate: [-900, 200, -470],
            alarm: mono.AlarmSeverity.WARNING,
            angle: -30,
        },{
            type: 'gleye',
            translate: [-900, 200, 300],
            alarm: mono.AlarmSeverity.WARNING,
            angle:-120,
        },
        {
            type: 'gleye',
            translate: [200,200, -250],
            angle:-30,
        },
        {
            type: 'gleye',
            translate: [0, 200, 300],
            alarm: mono.AlarmSeverity.WARNING,
            angle:120,
        },

        {
            type: 'gleye',
            translate: [850, 200, 200],
            angle: -120,
        },



        //灭火器
        {
            type: 'extinguisher',
            translate: [450, 330],
        }, {
            type: 'extinguisher',
            translate: [470, 330],
            arrow: true,
        }, {
            type: 'extinguisher',
            translate: [490,330],
        }, {
            type: 'smoke',
            translate: [300, 180, 240],
            color: '#FAAC58',
        }, {
            type: 'smoke',
            translate: [-300, 180, -240],
            color: '#B40431',
        }, {
            type: 'water_cable',
            color: '#B45F04',
            y: 10,
            size: 3,
            data: [
                [50, 0, 50],
                [460, 0, 50],
                [460, 0, 450],
                [-460, 0, 450],
                [-460, 0, -450],
                [-100, 0, -450],
                [-50, 0, -400],
                [-50, 0, 0],
                [0, 0, 50],
                [50, 0, 50],
            ],
        }, {
            type: 'water_cable',
            color: '#04B431',
            y: 10,
            size: 3,
            data: [
                [-300, 0, 180],
                [440, 0, 180],
                [440, 0, 330],
                [-340, 0, 330],
                [-340, 0, -180],
                [-420, 0, -180],
                [-420, 0, -310],
                [-120, 0, -310],
                [-120, 0, -180],
                [-320, 0, -180],
            ],
        }, {
            type: 'laser',
            from: [-485, 330],
            to: [485, 330],
        }, {
            type: 'laser',
            from: [-485, 0],
            to: [-20, 0],
        }, {
            type: 'laser',
            from: [-80, 480],
            to: [-80, -480],
        }],
};