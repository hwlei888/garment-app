puts ".......Creating garment......."

Garment.destroy_all

g1 = Garment.create!(
    name: 'Colle Sweater',
    price: 460,
    fabrication: '90% wool, 10% cashmere',
    image: 'https://www.davidjones.com/productimages/medium/1/2155873_20507834_3701052.jpg'
)

g2 = Garment.create!(
    name: 'Faustine Woven Dress',
    price: 720,
    fabrication: '49% cotton, 25% viscose, 20% acrylic, 6% polyamide',
    image: 'https://www.davidjones.com/productimages/medium/1/2281730_21036062_5444904.jpg'
)

g3 = Garment.create!(
    name: 'Mopline Sweater',
    price: 201,
    fabrication: '64% viscose, 34% polyamide, 2% elastane',
    image: 'https://www.davidjones.com/productimages/medium/1/2279143_21025819_5444615.jpg'
)

g4 = Garment.create!(
    name: 'Dancer Spliced Mini Dress',
    price: 650,
    fabrication: '100% linen',
    image: 'https://www.davidjones.com/productimages/medium/1/2363712_21455584_6538043.jpg'
)

g5 = Garment.create!(
    name: 'T-shirt with Motif',
    price: 12.99,
    fabrication: 'Recycled cotton',
    image: 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F5e%2F20%2F5e200126be39e79e0868c47bfcddb4acdab22706.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]'
)

g6 = Garment.create!(
    name: 'Wide High Jeans',
    price: 34.99,
    fabrication: 'Cotton 99%, Spandex 1%',
    image: 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fa8%2Ff5%2Fa8f533d3296018949fef41f478af53c999b4a6b2.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]'
)

puts "• Created #{Garment.count} garments:"
puts "• #{Garment.pluck(:name).join(', ')}"


###############################################################

puts ".......Creating brands......."

Brand.destroy_all

b1 = Brand.create!(
    name: 'Sandro Paris',
    country: 'France',
    introduction: 'Through its collections, the Brand expresses the essence of cool and chic Parisian spirit, the French effortless elegance, with a unique twist.'
)

b2 = Brand.create!(
    name: 'Maje',
    country: 'France',
    introduction: 'Maje embodies the effortless style of the Parisian woman. Sophisticated yet unafraid of contemporary styles.'
)

b3 = Brand.create!(
    name: 'Zimmermann',
    country: 'Australia',
    introduction: 'Sophisticated femininity, clever colour combinations and delicate original prints.'
)

b4 = Brand.create!(
    name: 'H&M',
    country: 'Sweden',
    introduction: 'We Are committed to always delivering fashion and quality at the best price.'
)

puts "• Created #{Brand.count} brands:"
puts "• #{Brand.pluck(:name).join(', ')}"

b1.garments << g1 << g2
b2.garments << g3
b3.garments << g4
b4.garments << g5 << g6

puts "brand -< garments associations:"
puts "• the brand #{Brand.first.name} has the garments: #{Brand.first.garments.pluck(:name).join(', ')}"


###############################################################

puts ".......Creating occasions......."

Occasion.destroy_all

o1 = Occasion.create! title: 'For School'
o2 = Occasion.create! title: 'For Casual Meet-up'
o3 = Occasion.create! title: 'For Family Get-together'
o4 = Occasion.create! title: 'For Graduation'
o5 = Occasion.create! title: 'For Wedding'

puts "• Created #{Occasion.count} occasions:"
puts "• #{Occasion.pluck(:title).join(', ')}"

o1.garments << g1 << g3 << g4 << g5 << g6
o2.garments << g1 << g3 << g5 << g6
o3.garments << g1 << g3 << g4 << g5 << g6
o4.garments << g2 << g3 << g4
o5.garments << g4

puts "occasions >-< garments many to many associations:"
puts "• the garment #{Garment.first.name} has the occasions: #{Garment.first.occasions.pluck(:title).join(', ')}"


###############################################################

puts ".......Creating Collocations......."

Collocation.destroy_all

c1 = Collocation.create!(
    title: 'White Sweater & Jeans',
    introduction: 'You will be absolutely glowing in these!',
    image: 'https://media.lexception.com/img/products/maje/120371-maje-topmopline-04-zoom.jpg'
)

c2 = Collocation.create!(
    title: 'V-Neck seater & Jeans',
    introduction: 'You are able to wear these everywhere!!!',
    image: 'https://image.s5a.com/is/image/saks/0400007834384_BLACK_ASTL?wid=984&hei=1312&qlt=90&resMode=sharp2&op_usm=0.9,1.0,8,0'
)

c3 = Collocation.create!(
    title: 'Mickey Mouse & Jeans',
    introduction: 'Well... Who can say no to Micky Mouse?!',
    image: 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F90%2F3d%2F903d40efde430525b54ed045b5cd6d229f6e78d2.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/fullscreen]'
)


puts "• Created #{Collocation.count} matches:"
puts "• #{Collocation.pluck(:title).join(', ')}"

c1.garments << g3 << g6
c2.garments << g1 << g6
c3.garments << g5 << g6

puts "collocations >-< garments many to many associations:"
puts "• the garment #{Garment.last.name} has the occasions: #{Garment.last.collocations.pluck(:title).join(', ')}"


###############################################################

puts ".......Creating Users......."

User.destroy_all

u1 = User.create! email: 'aaa@gmail.com', name: 'aaa', password: 'chicken'
u2 = User.create! email: 'bbb@gmail.com', name: 'bbb', password: 'chicken'
u3 = User.create! email: 'ccc@gmail.com', name: 'ccc', password: 'chicken'

puts "• Created #{User.count} users:"
puts "• #{User.pluck(:name).join(', ')}"



