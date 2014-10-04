# PolyForce
## Using Polymer components  with Visualforce


To run in your browser:

1. Install the unmanage polymer package from  https://na17.salesforce.com/packaging/installPackage.apexp?p0=04to000000033gx

2. Create a new visualforce page and turn the follow attributes off 
    <apex:page showChat="false" showHeader="false" standardStylesheets="false" >

3.  Link the required resources 
    Now link Javascript CDN resource to Polymer.js and Polyfill.js and dist folder mobile-UI-HTML component to query salesforce 
   - <apex:page showChat="false" showHeader="false" standardStylesheets="false" >
   - <script src="//cdnjs.cloudflare.com/ajax/libs/polymer/0.3.3/polymer.js"></script> 
   - <script src="//cdnjs.cloudflare.com/ajax/libs/polymer/0.3.3/platform.js"></script>


To use Polymer Chart Component : 


1. Lets import the Charting component 

2. Copy dx.chartjs.js and globalize.min.js in www/lib/chartjs

3. Open Terminal and type:

    ```
    cordova create olympic-dashboard-chartjs
    cd olympic-dashboard-chartjs
    cordova platforms add ios
    cordova plugin add org.apache.cordova.device
    cordova plugin add org.apache.cordova.console
    cordova plugin add org.apache.cordova.statusbar
    ```

4. Delete the www folder that was created and replace it with the www folder from this repo

5. In terminal t
