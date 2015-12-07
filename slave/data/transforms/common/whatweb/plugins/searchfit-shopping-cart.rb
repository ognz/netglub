##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SearchFitShoppingCart" do
author "Andrew Horton"
version "0.1"
description "Commercial ecommerce system written in PHP. Homepage: http://www.searchfit.com/shopping-cart-features.htm"
examples %w| www.bestpricedfurniture.com |

# pretty basic plugin, only 1 example to work from

#<META NAME="GENERATION-COPYRIGHT" CONTENT="This Website is generated by SearchFit Shopping Cart v8.11 and is protected by the law against reproducing or copying without a license.">
#<a class="footer_link_system" target="_blank" style="font-size: 10px;" href="http://www.searchfit.com/enterprise-shopping-cart-software.htm" title="Shopping Cart Software SearchFit v8.11">Shopping Cart Software SearchFit v8.11</a>
# js   new SearchFitAnalytics("

matches [
{:name=>"meta generation-copyright", 
:probability=>100,
:text=>"This Website is generated by SearchFit Shopping Cart"},

{:name=>"footer link", 
:probability=>100,
:text=>'<a class="footer_link_system" target="_blank" style="font-size: 10px;" href="http://www.searchfit.com/'},

{:name=>"js function", 
:probability=>100,
:text=>'new SearchFitAnalytics("'}
]

def passive
	m=[]

	if @body =~ /This Website is generated by SearchFit Shopping Cart v([^ ]+)/
		version=@body.scan(/This Website is generated by SearchFit Shopping Cart v([^ ]+)/)[0][0]
		m << {:probability=>100,:name=>"version",:version=>version} 
	end
	

	m
end


end

