/* Write the JS neccesary to calculate values after a number is changed inside the form field.

Hints:
1.) Learn about change event methods: http://api.jquery.com/change/
2.) Learn about retrieving values from form inputs: http://api.jquery.com/val/
3.) Learn how to select specific inputs using eq selectors: http://api.jquery.com/eq-selector/

*/

$(document).ready(function(){

  var x, y, z;

  $('#addition').change(function() {

    x = $(this).find('input:eq(0)').val();
    y = $(this).find('input:eq(1)').val();

    x = parseFloat(x);
    y = parseFloat(y);

    z = x + y;

    $(this).find('input:eq(2)').val(z);

  });

  $('#subtraction').change(function() {

    x = $(this).find('input:eq(0)').val();
    y = $(this).find('input:eq(1)').val();

    x = parseFloat(x);
    y = parseFloat(y);

    z = x - y;

    $(this).find('input:eq(2)').val(z);

  });

  $('#multiplication').change(function() {

    x = $(this).find('input:eq(0)').val();
    y = $(this).find('input:eq(1)').val();

    x = parseFloat(x);
    y = parseFloat(y);

    z = x * y;

    $(this).find('input:eq(2)').val(z);

  });

  $('#division').change(function() {

    x = $(this).find('input:eq(0)').val();
    y = $(this).find('input:eq(1)').val();

    x = parseFloat(x);
    y = parseFloat(y);

    z = x / y;

    $(this).find('input:eq(2)').val(z);

  });

  $('#modulus').change(function() {

    x = $(this).find('input:eq(0)').val();
    y = $(this).find('input:eq(1)').val();

    x = parseFloat(x);
    y = parseFloat(y);

    z = x % y;

    $(this).find('input:eq(2)').val(z);

  });

});