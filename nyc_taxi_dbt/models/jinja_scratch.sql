


{#
{% set Tithys_dictionary = {
'word': 'data',
'definition': 'facts and information',
'part_of_speech': 'noun'

} %}

{{ Tithys_dictionary['word'] }} is a {{ Tithys_dictionary['part_of_speech'] }} that means {{ Tithys_dictionary['definition'] }}.




{%- set foods = ['pizza', 'tacos', 'sushi', 'pasta', 'ice cream'] -%}

{%- for food in foods %}
	{%- if food == 'pizza' -%}
		{%- set food_type = 'snack' -%}
	{%- elif food == 'ice cream' -%}
		{%- set food_type = 'dessert' -%}
	{% else %}
		{%- set food_type = 'meal' -%}
	{% endif %}
	The delicious {{ food }} is my favorite {{ food_type }}.
	Tomorrow I am going to Musashi Restaurant to eat {{ food }} for my {{ food_type }}.
{% endfor %}

#}
{#
-- Jinja For loop
/*
{% for j in range (26) %}

	select{{ j }} as number {% if not loop.last %} union all {% endif %}
{% endfor %}
*/

{% set cool_string = 'WOW cool beans!' %}
{% set second_cool_string = 'this is Jinja!' %}
{% set my_fav_num = 26 %}

{{ cool_string }} {{ second_cool_string }} I want to write Jinja for {{ my_fav_num }} years!


{% set animals = ['cat', 'dog', 'fish', 'bird', 'rabbit'] %}

{{ animals[0]}} and {{ animals[1]}} are my favorite pets.
{{ animals[0]}}
{{ animals[1]}}
{{ animals[2]}}
{{ animals[3]}}
{{ animals[4]}}

{% for animal in animals %}
	my favorite animal is the{{ animal }}
{% endfor %}

-- curly percent indicates some sort of operations happening inside of our jinja context. 
-- In this case, we are using a for loop to iterate through a range of numbers from 0 to 25. For each iteration, we are selecting the current number and giving it an alias of "number". The "union all" statement is used to combine the results of each select statement into a single result set. 
-- The "if not loop.last" condition is used to ensure that the "union all" statement is not added after the last iteration of the loop.	
--  -- double curly braces indicate that we are outputting a value from our jinja context. 
-- In this case, we are outputting the current value of "j" for each iteration of the loop.


/*
-- Jinja - If else

{% set temperature = 80 %}

on a day like this, I specially like 
{% if temperature >= 70.0 %}
	a refreshing lemon sorbet
{% else %}
	a decadent chocolate cafe

{% endif %}
*/
#}
