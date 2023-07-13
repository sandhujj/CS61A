CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT father.child FROM parents AS father, dogs AS fatherdog WHERE father.parent = fatherdog.name ORDER BY -fatherdog.height;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE height <= max AND height > min;


-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
SELECT 'The two siblings, ' || firpar.child || ' plus ' || secpar.child || ' have the same size: ' || outsize.size
  FROM parents AS firpar, parents AS secpar, size_of_dogs AS outsize, size_of_dogs AS outsize2
  WHERE firpar.parent = secpar.parent AND secpar.child = outsize2.name AND firpar.child = outsize.name AND firpar.child < secpar.child AND outsize.size = outsize2.size;



-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) FROM dogs WHERE height <= 1.3 * (SELECT AVG(height) FROM dogs AS sec WHERE sec.fur = dogs.fur) and height >= 0.7 * (SELECT AVG(height) FROM dogs AS curr WHERE curr.fur = dogs.fur) GROUP BY fur HAVING COUNT() = (SELECT COUNT() FROM dogs AS thir WHERE thir.fur = dogs.fur);

