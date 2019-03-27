Feature: find movies by director

  As a film enthusiast
  So I can find movies created by my favorite director
  I want to find movies with similar directors

Background: movies in database

  Given the following movies exist:
  | title                   | rating | director           | release_date |
  | Aladdin                 | G      | Ron Clements       | 1992-11-25   |
  | The Terminator          | R      | James Cameron      | 1984-10-26   |
  | The Help                | PG-13  |                    | 2011-08-10   | 
  | Avatar                  | PG-13  | James Cameron      | 2009-12-18   |

Scenerio: add director to existing movie
  When I go to the edit page for "The Help"
  And I fill in the "Director" with "Tate Taylor"
  And I press "Update Movie Info"
  Then the director of "The Help" should be "Tate Taylor"
  
Scenerio: find movies with same director when link is clicked
  Given I am on the details page for "The Terminator"
  When I follow "Find Movies With Same Director"
  Then I should be on the Find Movies page for "The Terminator"
  And I should see "Avatar"
  But I should not see "Aladdin"

Scenerio: movie has no director info and cannot find similar movies
  Given I am on the details page for "The Help"
  Then I should not see "Tate Taylor"
  When I follow "Find Movies With Same Director"
  Then I should be on the home page
  And I should see "'The Help' has no director info"
