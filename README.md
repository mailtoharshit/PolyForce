# PolyForce
## Using PolymerChart components with Visualforce

*An approach to use components in visualforce*

## Table of Contents

  1. [What does it do](#what)
  2. [How to create new Polymer Element](#create)
  3. [Binding with AmCharts](#amcharts)
  4. [Supported Attirbutes](#attributes)
  5. [Using Components](#usage)
  6. 

- This is the code that you develop after finishing tutorial
- Read more on : http://wwww.oyecode.com

Fork this project, create two new page in visualforce in your org 


1. Visualforce Component -
   This is the component page, were I have designed a polymer component and imported the required resource files
   . We need polymer.js and platform.js which I have imported from the CDN resource or cdnjs
   Here I have created a custom component that create  a string that says : - 'Hello {{value}}' provided by user martin
   
- "<test-elem name="World"></test-elem>"


2. Demo page - 
   The demo page, just comsume this polymer element, you can pass on any value to show it



##How to run the project 

- Fork the code
- Create two pages in the salesforce org
- Start using component by running the visualforce page  -  '<instacename>/apex/polymerdemo'
