Feature: Publish a page
  As a site owner
  I want see versioned badge on page with draft and modified versioned child objects

  Background:
    Given a "Test Page Versioned Object" "My Page" with "URLSegment"="my-page"
    # And the "page" "My Page" is not published
    And the "group" "EDITOR" has permissions "Access to 'Pages' section"
    And I am logged in as a member of "EDITOR" group

  Scenario: I should see versioned badge on page with draft and modified versioned child object
    Given I go to "/admin/pages"
      And I should see "My Page" in the tree
      And I click on "My Page" in the tree
    Then I should see "My Page" in the breadcrumbs
      And I should see "Draft" in the breadcrumbs
      And I click "Versioned parent objects" in the ".ui-tabs-nav" element
      And I click on "Add Versioned Parent Object"
      And I fill in "Name" with "My Versioned Parent Object"
      And I click on "Create"
      And I wait 2 seconds
    Then I should see "My Versioned Parent Object" in the breadcrumbs
      And I should see "Draft" in the breadcrumbs
      And I click "My Page" in the ".breadcrumbs-wrapper" element
      And I should see "Draft" in the breadcrumbs
      And I should see "My Versioned Parent Object" in the "#Form_EditForm" element
    Then I click "My Versioned Parent Object" in the "#Form_EditForm" element
      And I press the "Publish" button
      And I should not see "Draft" in the breadcrumbs
      And I click "My Page" in the ".breadcrumbs-wrapper" element
      And I should see "Draft" in the breadcrumbs
    Then I click "My Versioned Parent Object" in the "#Form_EditForm" element
      And I fill in "Name" with "My Versioned Parent Object with changes"
      And I press the "Save" button
    Then I should see "Modified" in the breadcrumbs
      And I click "My Page" in the ".breadcrumbs-wrapper" element
      And I should see "Draft" in the breadcrumbs
    Then I press the "Publish" button
      And I should not see "Modified" in the breadcrumbs
      And I should not see "Modified" in the "#Form_EditForm" element
  
  Scenario: I should see versioned badge on page with draft and modified versioned grandchild object
    Given I go to "/admin/pages"
      And I should see "My Page" in the tree
      And I click on "My Page" in the tree
    Then I should see "My Page" in the breadcrumbs
      And I should see "Draft" in the breadcrumbs
      And I click "Non versioned parent objects" in the ".ui-tabs-nav" element
      And I click on "Add Non versioned parent objects"
      And I fill in "Name" with "My Non Versioned Parent Object"
      And I click on "Create"
      And I wait 2 seconds
      And I should not see "Draft" in the breadcrumbs
    Then I click "Versioned child objects" in the ".ui-tabs-nav" element
      And I click on "Add Versioned child object"
      And I fill in "Name" with "My Versioned child object"
      And I click on "Create"
      And I wait 2 seconds
      And I should see "Draft" in the breadcrumbs
    Then I click "My Non Versioned Parent Object" in the ".breadcrumbs-wrapper" element
      And I should see "Modified" in the breadcrumbs
    Then I click "My Page" in the ".breadcrumbs-wrapper" element
      And I should see "Draft" in the breadcrumbs
      And I should see "My Non Versioned Parent Object" in the "#Form_EditForm" element
      And I should see "Modified" in the "#Form_EditForm" element
      And I press the "Publish" button
    Then I click "My Non Versioned Parent Object" in the "#Form_EditForm" element
    Then I click "Versioned child objects" in the ".ui-tabs-nav" element
      And I click "Add Versioned child object" in the "#Form_EditForm" element
      And I fill in "Name" with "My Versioned child object with changes"
    Then I press the "Save" button
      And I should see "Modified" in the breadcrumbs
    Then I click "My Non Versioned Parent Object" in the ".breadcrumbs-wrapper" element
      And I should see "Modified" in the breadcrumbs
      And I click "Versioned child objects" in the ".ui-tabs-nav" element
      And I should see "Versioned child object with changes" in the "#Form_EditForm" element
      And I should see "Modified" in the "#Form_EditForm" element
    Then I click "My Page" in the ".breadcrumbs-wrapper" element
      And I should see "Modified" in the breadcrumbs
      And I should see "My Non Versioned Parent Object" in the "#Form_EditForm" element
      And I should see "Modified" in the "#Form_EditForm" element
  
