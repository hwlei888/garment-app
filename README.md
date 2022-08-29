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



### Comment (later)


## What will do later
- [ ] many to many tables, when create or edit garments, can choose many occasions
- [ ] collocation form tables, can add many garments





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





