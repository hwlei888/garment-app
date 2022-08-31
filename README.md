# README

## database

### Garment
Name (text)
Price (float)
Fabrication (text)
image (text)
Brand (brand_id:integer)
Occasion (occasion_id:integer)

Type (string)
Color (string)
Comment (text)

• One to Many 

### Brand
Name (string)
Country (string)
Introduction (text)

### Type
name (string)


• Many to Many

### Occasion
title (text)
(extra table: garment_id:integer)
- for school
- for outdoor
- for casual meet-up
- for family get-together
- for wedding
- for dinner party
- for job interview
- for graduation
- for work party



### Color (later)

• User

### User
name (string)
email (text)
password_digest (text)

### Collocation
title (string)
introduction (text)
image (text)
user_id (integer)
(extra table: garment_id:integer)

### Photo (for multiple photos)
name (string)
image (text)
collocation_id (integer)


### Comment
content (text)
garment_id (integer)(one to many table)
user_id (integer)(one to many table)
- [ ] User check


## What will do later
- [ ] garments can be sorted by price
- [ ] In add matches, garment items can be selected by types, like if choose tops, there are several tops show up
- [ ] User name and password more restrictions
- [ ] User can find their password back when lost it
- [ ] When user change their name, there is an alert
- [ ] User can change their password, two steps to change password, type old one first if correct can change new password
- [ ] User can add comments below the clothes
- [ ] User can like (many to many table)





- [x] collocation form tables, can add many garments
- [x] User can add multiple photos
- [ ] when edit, User can delete some photos
- [ ] User can add multiple photos and self-defination items in collocation
- [x] many to many tables, when create or edit garments, can choose many occasions
- [ ] many to many tables, when edit garments, keep the previous tick before and can add the new tick




label


  “The best colour in the world is the one that looks good on you.”
Your wardrobe will always be one less dress.
"Style is something each of us already has, all we need to do is find it."

<h2>
    Playing dress-up begins at age five and never truly ends.
</h2>

<p>
    By Kate Spade
</p>




* REMEMBER!!!!!
to update

  def garment_params
    params.require(:garment).permit(:name, :price, :fabrication, :image, :brand_id)
  end





