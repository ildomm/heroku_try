/* Challenge data collector
* Dependencies: JQuery
* */

var DataCollector;
(function() {
    var instance;
    DataCollector = function DataCollector() {
        if(instance) {
            return instance;
        }
        instance = this;

        this.urlClient;
        this.urlSource;
        this.uuid;

        this.setCookie = function(name,value,exdays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var c_value = escape(value) +
                ((exdays == null) ? "" : ("; expires=" + exdate.toUTCString()));
            document.cookie = name + "=" + c_value;
        }
        this.getCookie = function(name) {
            var i,x,y,ARRcookies = document.cookie.split(";");
            for (i=0;i < ARRcookies.length; i++) {
                x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
                y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
                x = x.replace(/^\s+|\s+$/g,"");
                if (x == name) { return unescape(y);}
            }
        }
        this.guid = function(){
            function s4() {
                return Math.floor((1 + Math.random()) * 0x10000)
                    .toString(16)
                    .substring(1);
            }
            return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
                s4() + '-' + s4() + s4() + s4();
        }
        this.checkUUID = function() {
            var uuid = this.getCookie('ccc_uuid');
            if ( uuid == undefined ){
                uuid = this.guid();
                this.setCookie('ccc_uuid',uuid,7);
            }
            return uuid;
        };
        this.sendContact = function(email){
            try {
                var data = {'email':email,'uuid':this.uuid};
                var dataObject = {'contact':data};
                console.log(dataObject);
                $.ajax({
                    url: this.urlSource + '/contact',
                    type : "POST",
                    dataType : 'json',
                    data : dataObject,
                    success : function(result) {
                        console.log(result);
                    },
                    error: function(xhr, resp, text) {
                        console.log(xhr, resp, text);
                    }
                })
            }
            catch(err) {
                console.log(err.message);
            }
            return false;
        }
        this.sendEvent = function(){
            try {
                var now = new Date();
                var nowFormated = now.getFullYear()
                    + "-" + ( now.getMonth() + 1 )
                    + "-" + now.getDate()
                    + " " + now.getHours()
                    + ":" + now.getMinutes()
                    + ":" + now.getSeconds();
                var data = {'uuid':this.uuid,'url':this.urlClient,'client_created_at':nowFormated};
                var dataObject = {'event':data};
                console.log(dataObject);
                $.ajax({
                    url: this.urlSource + '/event',
                    type : "POST",
                    dataType : 'json',
                    data : dataObject,
                    success : function(result) {
                        console.log(result);
                    },
                    error: function(xhr, resp, text) {
                        console.log(xhr, resp, text);
                    }
                })
            }
            catch(err) {
                console.log(err.message);
            }
            return false;
        }
        this.info = function() {
            console.log(this.urlClient);
            console.log(this.urlSource);
            console.log(this.uuid);
        };
        this.init = function() {
            this.uuid = this.checkUUID();
            this.urlClient = document.location.href;
            this.urlSource = document.currentScript.src.split('/')[0] +'//'+ document.currentScript.src.split('/')[2];
        };
        this.init();
    };
}());
var dataCollector = new DataCollector();