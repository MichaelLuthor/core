Feature: sharing
	Background:
		Given using api version "1"
		Given using old dav path

	Scenario: Creating a new share with user
		Given user "user0" exists
		And user "user1" exists
		And As an "user0"
		When sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | welcome.txt |
			| shareWith | user1 |
			| shareType | 0 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: Creating a share with a group
		Given user "user0" exists
		And user "user1" exists
		And group "sharing-group" exists
		And As an "user0"
		When sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | welcome.txt |
			| shareWith | sharing-group |
			| shareType | 1 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: Creating a new share with user who already received a share through their group
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "sharing-group" exists
		And user "user1" belongs to group "sharing-group"
		And file "welcome.txt" of user "user0" is shared with group "sharing-group"
		And As an "user0"
		Then sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | welcome.txt |
			| shareWith | user1 |
			| shareType | 0 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: Creating a new public share
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | welcome.txt |
			| shareType | 3 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Public shared file "welcome.txt" can be downloaded

	Scenario: Creating a new public share with password
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | welcome.txt |
			| shareType | 3 |
			| password | publicpw |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Public shared file "welcome.txt" with password "publicpw" can be downloaded

	Scenario: Creating a new public share of a folder
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | FOLDER |
			| shareType | 3 |
			| password | publicpw |
			| expireDate | +3 days |
			| publicUpload | true |
			| permissions | 7 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| permissions | 15 |
			| expiration | +3 days |
			| url | AN_URL |
			| token | A_TOKEN |
			| mimetype | httpd/unix-directory |

	Scenario: Creating a new public share with password and adding an expiration date
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | welcome.txt |
			| shareType | 3 |
			| password | publicpw |
		And Updating last share with
			| expireDate | +3 days |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Public shared file "welcome.txt" with password "publicpw" can be downloaded

	Scenario: Creating a new public share, updating its expiration date and getting its info
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | FOLDER |
			| shareType | 3 |
		And Updating last share with
			| expireDate | +3 days |
		And Getting info of last share
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| item_type | folder |
			| item_source | A_NUMBER |
			| share_type | 3 |
			| file_source | A_NUMBER |
			| file_target | /FOLDER |
			| permissions | 1 |
			| stime | A_NUMBER |
			| expiration | +3 days |
			| token | A_TOKEN |
			| storage | A_NUMBER |
			| mail_send | 0 |
			| uid_owner | user0 |
			| storage_id | home::user0 |
			| file_parent | A_NUMBER |
			| displayname_owner | user0 |
			| url | AN_URL |
			| mimetype | httpd/unix-directory |

	Scenario: Creating a new public share, updating its password and getting its info
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | FOLDER |
			| shareType | 3 |
		And Updating last share with
			| password | publicpw |
		And Getting info of last share
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| item_type | folder |
			| item_source | A_NUMBER |
			| share_type | 3 |
			| file_source | A_NUMBER |
			| file_target | /FOLDER |
			| permissions | 1 |
			| stime | A_NUMBER |
			| token | A_TOKEN |
			| storage | A_NUMBER |
			| mail_send | 0 |
			| uid_owner | user0 |
			| storage_id | home::user0 |
			| file_parent | A_NUMBER |
			| displayname_owner | user0 |
			| url | AN_URL |
			| mimetype | httpd/unix-directory |

	Scenario: Creating a new public share, updating its permissions and getting its info
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | FOLDER |
			| shareType | 3 |
		And Updating last share with
			| permissions | 7 |
		And Getting info of last share
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| item_type | folder |
			| item_source | A_NUMBER |
			| share_type | 3 |
			| file_source | A_NUMBER |
			| file_target | /FOLDER |
			| permissions | 15 |
			| stime | A_NUMBER |
			| token | A_TOKEN |
			| storage | A_NUMBER |
			| mail_send | 0 |
			| uid_owner | user0 |
			| storage_id | home::user0 |
			| file_parent | A_NUMBER |
			| displayname_owner | user0 |
			| url | AN_URL |
			| mimetype | httpd/unix-directory |

	Scenario: Creating a new public share, updating publicUpload option and getting its info
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | FOLDER |
			| shareType | 3 |
		And Updating last share with
			| publicUpload | true |
		And Getting info of last share
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| item_type | folder |
			| item_source | A_NUMBER |
			| share_type | 3 |
			| file_source | A_NUMBER |
			| file_target | /FOLDER |
			| permissions | 15 |
			| stime | A_NUMBER |
			| token | A_TOKEN |
			| storage | A_NUMBER |
			| mail_send | 0 |
			| uid_owner | user0 |
			| storage_id | home::user0 |
			| file_parent | A_NUMBER |
			| displayname_owner | user0 |
			| url | AN_URL |
			| mimetype | httpd/unix-directory |

	Scenario: Uploading to a public upload-only share
		Given user "user0" exists
		And As an "user0"
		And creating a share with
			| path | FOLDER |
			| shareType | 3 |
			| permissions | 4 |
		And publicly uploading file "test.txt" with content "test"
		When Downloading file "/FOLDER/test.txt"
		Then Downloaded content should be "test"

	Scenario: Uploading to a public upload-only share with password
		Given user "user0" exists
		And As an "user0"
		And creating a share with
			| path | FOLDER |
			| shareType | 3 |
			| password | publicpw |
			| permissions | 4 |
		And publicly uploading file "test.txt" with password "publicpw" and content "test"
		When Downloading file "/FOLDER/test.txt"
		Then Downloaded content should be "test"

	Scenario: Downloading from upload-only share is forbidden
		Given user "user0" exists
		And As an "user0"
		And User "user0" moves file "/textfile0.txt" to "/FOLDER/test.txt"
		When creating a share with
			| path | FOLDER |
			| shareType | 3 |
			| permissions | 4 |
		Then Public shared file "test.txt" cannot be downloaded
		And the HTTP status code should be "404"

	Scenario: Uploading same file to a public upload-only share multiple times
		Given user "user0" exists
		And As an "user0"
		And creating a share with
			| path | FOLDER |
			| shareType | 3 |
			| permissions | 4 |
		And publicly uploading file "test.txt" with content "test"
		And publicly uploading file "test.txt" with content "test2" with autorename mode
		When Downloading file "/FOLDER/test.txt"
		Then Downloaded content should be "test"
		And Downloading file "/FOLDER/test (2).txt"
		And Downloaded content should be "test2"

	Scenario: Uploading file to a public upload-only share that was deleted does not work
		Given user "user0" exists
		And As an "user0"
		And creating a share with
			| path | FOLDER |
			| shareType | 3 |
			| permissions | 4 |
		When User "user0" deletes file "/FOLDER"
		Then publicly uploading a file does not work
		And the HTTP status code should be "404"

	Scenario: Uploading file to a public read-only share does not work
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | FOLDER |
			| shareType | 3 |
			| permissions | 1 |
		Then publicly uploading a file does not work
		And the HTTP status code should be "403"

	Scenario: getting all shares of a user using that user
		Given user "user0" exists
		And user "user1" exists
		And User "user0" moved file "/textfile0.txt" to "/file_to_share.txt"
		And file "file_to_share.txt" of user "user0" is shared with user "user1"
		And As an "user0"
		When sending "GET" to "/apps/files_sharing/api/v1/shares"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And File "file_to_share.txt" should be included in the response

	Scenario: getting all shares of a user using another user
		Given user "user0" exists
		And user "user1" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And As an "admin"
		When sending "GET" to "/apps/files_sharing/api/v1/shares"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And File "textfile0.txt" should not be included in the response

	Scenario: getting all shares of a file
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And user "user3" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And file "textfile0.txt" of user "user0" is shared with user "user2"
		And As an "user0"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?path=textfile0.txt"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And User "user1" should be included in the response
		And User "user2" should be included in the response
		And User "user3" should not be included in the response

	Scenario: getting all shares of a file with reshares
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And user "user3" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And file "textfile0 (2).txt" of user "user1" is shared with user "user2"
		And As an "user0"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?reshares=true&path=textfile0.txt"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And User "user1" should be included in the response
		And User "user2" should be included in the response
		And User "user3" should not be included in the response

	Scenario: Reshared files can be still accessed if a user in the middle removes it.
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And user "user3" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And User "user1" moved file "/textfile0 (2).txt" to "/textfile0_shared.txt"
		And file "textfile0_shared.txt" of user "user1" is shared with user "user2"
		And file "textfile0_shared.txt" of user "user2" is shared with user "user3"
		And As an "user1"
		When User "user1" deletes file "/textfile0_shared.txt"
		And As an "user3"
		And Downloading file "/textfile0_shared.txt" with range "bytes=1-7"
		Then Downloaded content should be "wnCloud"

	Scenario: getting share info of a share
		Given user "user0" exists
		And user "user1" exists
		And User "user0" moved file "/textfile0.txt" to "/file_to_share.txt"
		And file "file_to_share.txt" of user "user0" is shared with user "user1"
		And As an "user0"
		When Getting info of last share
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| item_type | file |
			| item_source | A_NUMBER |
			| share_type | 0 |
			| share_with | user1 |
			| file_source | A_NUMBER |
			| file_target | /file_to_share.txt |
			| path | /file_to_share.txt |
			| permissions | 19 |
			| stime | A_NUMBER |
			| storage | A_NUMBER |
			| mail_send | 0 |
			| uid_owner | user0 |
			| storage_id | home::user0 |
			| file_parent | A_NUMBER |
			| share_with_displayname | user1 |
			| displayname_owner | user0 |
			| mimetype | text/plain |

	Scenario: keep group permissions in sync
		Given As an "admin"
		Given user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And user "user1" belongs to group "group1"
		And file "textfile0.txt" of user "user0" is shared with group "group1"
		And User "user1" moved file "/textfile0.txt" to "/FOLDER/textfile0.txt"
		And As an "user0"
		When Updating last share with
			| permissions | 1 |
		And Getting info of last share
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| item_type | file |
			| item_source | A_NUMBER |
			| share_type | 1 |
			| file_source | A_NUMBER |
			| file_target | /textfile0.txt |
			| permissions | 1 |
			| stime | A_NUMBER |
			| storage | A_NUMBER |
			| mail_send | 0 |
			| uid_owner | user0 |
			| storage_id | home::user0 |
			| file_parent | A_NUMBER |
			| displayname_owner | user0 |
			| mimetype | text/plain |

	Scenario: Sharee can see the share
		Given user "user0" exists
		And user "user1" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And As an "user1"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?shared_with_me=true"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And last share_id is included in the answer

	Scenario: Sharee can see the filtered share
		Given user "user0" exists
		And user "user1" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And file "textfile1.txt" of user "user0" is shared with user "user1"
		And As an "user1"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?shared_with_me=true&path=textfile1 (2).txt"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And last share_id is included in the answer

	Scenario: Sharee can't see the share that is filtered out
		Given user "user0" exists
		And user "user1" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And file "textfile1.txt" of user "user0" is shared with user "user1"
		And As an "user1"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?shared_with_me=true&path=textfile0 (2).txt"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And last share_id is not included in the answer

	Scenario: Sharee can see the group share
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group0" exists
		And user "user1" belongs to group "group0"
		And file "textfile0.txt" of user "user0" is shared with group "group0"
		And As an "user1"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?shared_with_me=true"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And last share_id is included in the answer

	Scenario: User is not allowed to reshare file
		As an "admin"
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And As an "user0"
		And creating a share with
			| path | /textfile0.txt |
			| shareType | 0 |
			| shareWith | user1 |
			| permissions | 8 |
		And As an "user1"
		When creating a share with
			| path | /textfile0 (2).txt |
			| shareType | 0 |
			| shareWith | user2 |
			| permissions | 31 |
		Then the OCS status code should be "404"
		And the HTTP status code should be "200"

	Scenario: User is not allowed to reshare file with more permissions
		As an "admin"
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And As an "user0"
		And creating a share with
			| path | /textfile0.txt |
			| shareType | 0 |
			| shareWith | user1 |
			| permissions | 16 |
		And As an "user1"
		When creating a share with
			| path | /textfile0 (2).txt |
			| shareType | 0 |
			| shareWith | user2 |
			| permissions | 31 |
		Then the OCS status code should be "404"
		And the HTTP status code should be "200"

	Scenario: Get a share with a user which didn't received the share
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And As an "user2"
		When Getting info of last share
		Then the OCS status code should be "404"
		And the HTTP status code should be "200"

	Scenario: Share of folder and sub-folder to same user - core#20645
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group0" exists
		And user "user1" belongs to group "group0"
		And file "/PARENT" of user "user0" is shared with user "user1"
		When file "/PARENT/CHILD" of user "user0" is shared with group "group0"
		Then user "user1" should see following elements
			| /FOLDER/ |
			| /PARENT/ |
			| /CHILD/ |
			| /PARENT/parent.txt |
			| /CHILD/child.txt |
		And the HTTP status code should be "200"

	Scenario: Share a file by multiple channels
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And group "group0" exists
		And user "user1" belongs to group "group0"
		And user "user2" belongs to group "group0"
		And user "user0" created a folder "/common"
		And user "user0" created a folder "/common/sub"
		And file "common" of user "user0" is shared with group "group0"
		And file "textfile0.txt" of user "user1" is shared with user "user2"
		And User "user1" moved file "/textfile0.txt" to "/common/textfile0.txt"
		And User "user1" moved file "/common/textfile0.txt" to "/common/sub/textfile0.txt"
		And As an "user2"
		When Downloading file "/common/sub/textfile0.txt" with range "bytes=9-17"
		Then Downloaded content should be "test text"
		And Downloaded content when downloading file "/textfile0.txt" with range "bytes=9-17" should be "test text"
		And user "user2" should see following elements
			| /common/sub/textfile0.txt |

	Scenario: Share a file by multiple channels
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And group "group0" exists
		And user "user1" belongs to group "group0"
		And user "user2" belongs to group "group0"
		And user "user0" created a folder "/common"
		And user "user0" created a folder "/common/sub"
		And file "common" of user "user0" is shared with group "group0"
		And file "textfile0.txt" of user "user1" is shared with user "user2"
		And User "user1" moved file "/textfile0.txt" to "/common/textfile0.txt"
		And User "user1" moved file "/common/textfile0.txt" to "/common/sub/textfile0.txt"
		And As an "user2"
		When Downloading file "/textfile0.txt" with range "bytes=9-17"
		Then Downloaded content should be "test text"
		And user "user2" should see following elements
			| /common/sub/textfile0.txt |

	Scenario: Delete all group shares
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And user "user1" belongs to group "group1"
		And file "textfile0.txt" of user "user0" is shared with group "group1"
		And User "user1" moved file "/textfile0.txt" to "/FOLDER/textfile0.txt"
		And As an "user0"
		And Deleting last share
		And As an "user1"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?shared_with_me=true"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And last share_id is not included in the answer

	Scenario: delete a share
		Given user "user0" exists
		And user "user1" exists
		And file "textfile0.txt" of user "user0" is shared with user "user1"
		And As an "user0"
		When Deleting last share
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: Keep usergroup shares (#22143)
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And group "group" exists
		And user "user1" belongs to group "group"
		And user "user2" belongs to group "group"
		And user "user0" created a folder "/TMP"
		And file "TMP" of user "user0" is shared with group "group"
		And user "user1" created a folder "/myFOLDER"
		And User "user1" moves file "/TMP" to "/myFOLDER/myTMP"
		And user "user2" does not exist
		And user "user1" should see following elements
			| /myFOLDER/myTMP/ |

	Scenario: Check quota of owners parent directory of a shared file
		Given using old dav path
		And As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user1" has a quota of "0"
		And User "user0" moved file "/welcome.txt" to "/myfile.txt"
		And file "myfile.txt" of user "user0" is shared with user "user1"
		When User "user1" uploads file "data/textfile.txt" to "/myfile.txt"
		Then the HTTP status code should be "204"

	Scenario: Don't allow sharing of the root
		Given user "user0" exists
		And As an "user0"
		When creating a share with
			| path | / |
			| shareType | 3 |
		Then the OCS status code should be "403"

	Scenario: Allow modification of reshare
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And user "user0" created a folder "/TMP"
		And file "TMP" of user "user0" is shared with user "user1"
		And file "TMP" of user "user1" is shared with user "user2"
		And As an "user1"
		When Updating last share with
			| permissions | 1 |
		Then the OCS status code should be "100"

	Scenario: Do not allow reshare to exceed permissions
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And user "user0" created a folder "/TMP"
		And As an "user0"
		And creating a share with
			| path | /TMP |
			| shareType | 0 |
			| shareWith | user1 |
			| permissions | 21 |
		And As an "user1"
		And creating a share with
			| path | /TMP |
			| shareType | 0 |
			| shareWith | user2 |
			| permissions | 21 |
		When Updating last share with
			| permissions | 31 |
		Then the OCS status code should be "404"

	Scenario: Only allow 1 link share per file/folder
		Given user "user0" exists
		And As an "user0"
		And creating a share with
			| path | welcome.txt |
			| shareType | 3 |
		When save last share id
		And creating a share with
			| path | welcome.txt |
			| shareType | 3 |
		Then share ids should match

	Scenario: Correct webdav share-permissions for owned file
		Given user "user0" exists
		And User "user0" uploads file with content "foo" to "/tmp.txt"
		When as "user0" gets properties of folder "/tmp.txt" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "19"

	Scenario: Correct webdav share-permissions for received file with edit and reshare permissions
		Given user "user0" exists
		And user "user1" exists
		And User "user0" uploads file with content "foo" to "/tmp.txt"
		And file "/tmp.txt" of user "user0" is shared with user "user1"
		When as "user1" gets properties of folder "/tmp.txt" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "19"

	Scenario: Correct webdav share-permissions for received file with edit permissions but no reshare permissions
		Given user "user0" exists
		And user "user1" exists
		And User "user0" uploads file with content "foo" to "/tmp.txt"
		And file "tmp.txt" of user "user0" is shared with user "user1"
		And As an "user0"
		And Updating last share with
			| permissions | 3 |
		When as "user1" gets properties of folder "/tmp.txt" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "3"

	Scenario: Correct webdav share-permissions for received file with reshare permissions but no edit permissions
		Given user "user0" exists
		And user "user1" exists
		And User "user0" uploads file with content "foo" to "/tmp.txt"
		And file "tmp.txt" of user "user0" is shared with user "user1"
		And As an "user0"
		And Updating last share with
			| permissions | 17 |
		When as "user1" gets properties of folder "/tmp.txt" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "17"

	Scenario: Correct webdav share-permissions for owned folder
		Given user "user0" exists
		And user "user0" created a folder "/tmp"
		When as "user0" gets properties of folder "/" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "31"

	Scenario: Correct webdav share-permissions for received folder with all permissions
		Given user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/tmp"
		And file "/tmp" of user "user0" is shared with user "user1"
		When as "user1" gets properties of folder "/tmp" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "31"

	Scenario: Correct webdav share-permissions for received folder with all permissions but edit
		Given user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/tmp"
		And file "/tmp" of user "user0" is shared with user "user1"
		And As an "user0"
		And Updating last share with
			| permissions | 29 |
		When as "user1" gets properties of folder "/tmp" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "29"

	Scenario: Correct webdav share-permissions for received folder with all permissions but create
		Given user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/tmp"
		And file "/tmp" of user "user0" is shared with user "user1"
		And As an "user0"
		And Updating last share with
			| permissions | 27 |
		When as "user1" gets properties of folder "/tmp" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "27"

	Scenario: Correct webdav share-permissions for received folder with all permissions but delete
		Given user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/tmp"
		And file "/tmp" of user "user0" is shared with user "user1"
		And As an "user0"
		And Updating last share with
			| permissions | 23 |
		When as "user1" gets properties of folder "/tmp" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "23"

	Scenario: Correct webdav share-permissions for received folder with all permissions but share
		Given user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/tmp"
		And file "/tmp" of user "user0" is shared with user "user1"
		And As an "user0"
		And Updating last share with
			| permissions | 15 |
		When as "user1" gets properties of folder "/tmp" with
			|{http://open-collaboration-services.org/ns}share-permissions |
		Then the single response should contain a property "{http://open-collaboration-services.org/ns}share-permissions" with value "15"

	Scenario: unique target names for incoming shares
		Given user "user0" exists
		And user "user1" exists
		And user "user2" exists
		And user "user0" created a folder "/foo"
		And user "user1" created a folder "/foo"
		When file "/foo" of user "user0" is shared with user "user2"
		And file "/foo" of user "user1" is shared with user "user2"
		Then user "user2" should see following elements
			| /foo/		|
			| /foo%20(2)/ |

	Scenario: Creating a new share with a disabled user
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And assure user "user0" is disabled
		And As an "user0"
		When sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | welcome.txt |
			| shareWith | user1 |
			| shareType | 0 |
		Then the OCS status code should be "997"
		And the HTTP status code should be "401"

	Scenario: Merging shares for recipient when shared from outside with group and member
		Given using old dav path
		And As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And user "user1" belongs to group "group1"
		And user "user0" created a folder "/merge-test-outside"
		When folder "/merge-test-outside" of user "user0" is shared with group "group1"
		And folder "/merge-test-outside" of user "user0" is shared with user "user1"
		Then as "user1" the folder "/merge-test-outside" exists
		And as "user1" the folder "/merge-test-outside (2)" does not exist

	Scenario: Merging shares for recipient when shared from outside with group and member with different permissions
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And user "user1" belongs to group "group1"
		And user "user0" created a folder "/merge-test-outside-perms"
		When folder "/merge-test-outside-perms" of user "user0" is shared with group "group1" with permissions 1
		And folder "/merge-test-outside-perms" of user "user0" is shared with user "user1" with permissions 31
		Then as "user1" gets properties of folder "/merge-test-outside-perms" with
			|{http://owncloud.org/ns}permissions|
		And the single response should contain a property "{http://owncloud.org/ns}permissions" with value "SRDNVCK"
		And as "user1" the folder "/merge-test-outside-perms (2)" does not exist

	Scenario: Merging shares for recipient when shared from outside with two groups
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And group "group2" exists
		And user "user1" belongs to group "group1"
		And user "user1" belongs to group "group2"
		And user "user0" created a folder "/merge-test-outside-twogroups"
		When folder "/merge-test-outside-twogroups" of user "user0" is shared with group "group1"
		And folder "/merge-test-outside-twogroups" of user "user0" is shared with group "group2"
		Then as "user1" the folder "/merge-test-outside-twogroups" exists
		And as "user1" the folder "/merge-test-outside-twogroups (2)" does not exist

	Scenario: Merging shares for recipient when shared from outside with two groups with different permissions
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And group "group2" exists
		And user "user1" belongs to group "group1"
		And user "user1" belongs to group "group2"
		And user "user0" created a folder "/merge-test-outside-twogroups-perms"
		When folder "/merge-test-outside-twogroups-perms" of user "user0" is shared with group "group1" with permissions 1
		And folder "/merge-test-outside-twogroups-perms" of user "user0" is shared with group "group2" with permissions 31
		Then as "user1" gets properties of folder "/merge-test-outside-twogroups-perms" with
			|{http://owncloud.org/ns}permissions|
		And the single response should contain a property "{http://owncloud.org/ns}permissions" with value "SRDNVCK"
		And as "user1" the folder "/merge-test-outside-twogroups-perms (2)" does not exist

	Scenario: Merging shares for recipient when shared from outside with two groups and member
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And group "group2" exists
		And user "user1" belongs to group "group1"
		And user "user1" belongs to group "group2"
		And user "user0" created a folder "/merge-test-outside-twogroups-member-perms"
		When folder "/merge-test-outside-twogroups-member-perms" of user "user0" is shared with group "group1" with permissions 1
		And folder "/merge-test-outside-twogroups-member-perms" of user "user0" is shared with group "group2" with permissions 31
		And folder "/merge-test-outside-twogroups-member-perms" of user "user0" is shared with user "user1" with permissions 1
		Then as "user1" gets properties of folder "/merge-test-outside-twogroups-member-perms" with
			|{http://owncloud.org/ns}permissions|
		And the single response should contain a property "{http://owncloud.org/ns}permissions" with value "SRDNVCK"
		And as "user1" the folder "/merge-test-outside-twogroups-member-perms (2)" does not exist

	Scenario: Merging shares for recipient when shared from inside with group
		Given As an "admin"
		And user "user0" exists
		And group "group1" exists
		And user "user0" belongs to group "group1"
		And user "user0" created a folder "/merge-test-inside-group"
		When folder "/merge-test-inside-group" of user "user0" is shared with group "group1"
		Then as "user0" the folder "/merge-test-inside-group" exists
		And as "user0" the folder "/merge-test-inside-group (2)" does not exist

	Scenario: Merging shares for recipient when shared from inside with two groups
		Given As an "admin"
		And user "user0" exists
		And group "group1" exists
		And group "group2" exists
		And user "user0" belongs to group "group1"
		And user "user0" belongs to group "group2"
		And user "user0" created a folder "/merge-test-inside-twogroups"
		When folder "/merge-test-inside-twogroups" of user "user0" is shared with group "group1"
		And folder "/merge-test-inside-twogroups" of user "user0" is shared with group "group2"
		Then as "user0" the folder "/merge-test-inside-twogroups" exists
		And as "user0" the folder "/merge-test-inside-twogroups (2)" does not exist
		And as "user0" the folder "/merge-test-inside-twogroups (3)" does not exist

	Scenario: Merging shares for recipient when shared from inside with group with less permissions
		Given As an "admin"
		And user "user0" exists
		And group "group1" exists
		And group "group2" exists
		And user "user0" belongs to group "group1"
		And user "user0" belongs to group "group2"
		And user "user0" created a folder "/merge-test-inside-twogroups-perms"
		When folder "/merge-test-inside-twogroups-perms" of user "user0" is shared with group "group1"
		And folder "/merge-test-inside-twogroups-perms" of user "user0" is shared with group "group2"
		Then as "user0" gets properties of folder "/merge-test-inside-twogroups-perms" with
			|{http://owncloud.org/ns}permissions|
		And the single response should contain a property "{http://owncloud.org/ns}permissions" with value "RDNVCK"
		And as "user0" the folder "/merge-test-inside-twogroups-perms (2)" does not exist
		And as "user0" the folder "/merge-test-inside-twogroups-perms (3)" does not exist

	Scenario: Merging shares for recipient when shared from outside with group then user and recipient renames in between
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And user "user1" belongs to group "group1"
		And user "user0" created a folder "/merge-test-outside-groups-renamebeforesecondshare"
		When folder "/merge-test-outside-groups-renamebeforesecondshare" of user "user0" is shared with group "group1"
		And User "user1" moved folder "/merge-test-outside-groups-renamebeforesecondshare" to "/merge-test-outside-groups-renamebeforesecondshare-renamed"
		And folder "/merge-test-outside-groups-renamebeforesecondshare" of user "user0" is shared with user "user1"
		Then as "user1" gets properties of folder "/merge-test-outside-groups-renamebeforesecondshare-renamed" with
			|{http://owncloud.org/ns}permissions|
		And the single response should contain a property "{http://owncloud.org/ns}permissions" with value "SRDNVCK"
		And as "user1" the folder "/merge-test-outside-groups-renamebeforesecondshare" does not exist

	Scenario: Merging shares for recipient when shared from outside with user then group and recipient renames in between
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group1" exists
		And user "user1" belongs to group "group1"
		And user "user0" created a folder "/merge-test-outside-groups-renamebeforesecondshare"
		When folder "/merge-test-outside-groups-renamebeforesecondshare" of user "user0" is shared with user "user1"
		And User "user1" moved folder "/merge-test-outside-groups-renamebeforesecondshare" to "/merge-test-outside-groups-renamebeforesecondshare-renamed"
		And folder "/merge-test-outside-groups-renamebeforesecondshare" of user "user0" is shared with group "group1"
		Then as "user1" gets properties of folder "/merge-test-outside-groups-renamebeforesecondshare-renamed" with
			|{http://owncloud.org/ns}permissions|
		And the single response should contain a property "{http://owncloud.org/ns}permissions" with value "SRDNVCK"
		And as "user1" the folder "/merge-test-outside-groups-renamebeforesecondshare" does not exist

	Scenario: Empting trashbin
		Given As an "admin"
		And user "user0" exists
		And User "user0" deletes file "/textfile0.txt"
		When User "user0" empties trashbin
		Then the HTTP status code should be "200"

	Scenario: orphaned shares
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/common"
		And user "user0" created a folder "/common/sub"
		And file "/common/sub" of user "user0" is shared with user "user1"
		And User "user0" deletes folder "/common"
		When User "user0" empties trashbin
		Then as "user1" the folder "/sub" does not exist

	Scenario: sharing again an own file while belonging to a group
		Given As an "admin"
		Given user "user0" exists
		And group "sharing-group" exists
		And user "user0" belongs to group "sharing-group"
		And file "welcome.txt" of user "user0" is shared with group "sharing-group"
		And Deleting last share
		When sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | welcome.txt |
			| shareWith | sharing-group |
			| shareType | 1 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: sharing subfolder when parent already shared
		Given As an "admin"
		Given user "user0" exists
		Given user "user1" exists
		And group "sharing-group" exists
		And user "user0" created a folder "/test"
		And user "user0" created a folder "/test/sub"
		And file "/test" of user "user0" is shared with group "sharing-group"
		And As an "user0"
		When sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | /test/sub |
			| shareWith | user1 |
			| shareType | 0 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And as "user1" the folder "/sub" exists

	Scenario: sharing subfolder when parent already shared with group of sharer
		Given As an "admin"
		Given user "user0" exists
		Given user "user1" exists
		And group "sharing-group" exists
		And user "user0" belongs to group "sharing-group"
		And user "user0" created a folder "/test"
		And user "user0" created a folder "/test/sub"
		And file "/test" of user "user0" is shared with group "sharing-group"
		And As an "user0"
		When sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | /test/sub |
			| shareWith | user1 |
			| shareType | 0 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And as "user1" the folder "/sub" exists

	Scenario: sharing subfolder of already shared folder, GET result is correct
		Given As an "admin"
		Given user "user0" exists
		Given user "user1" exists
		Given user "user2" exists
		Given user "user3" exists
		Given user "user4" exists
		And user "user0" created a folder "/folder1"
		And file "/folder1" of user "user0" is shared with user "user1"
		And file "/folder1" of user "user0" is shared with user "user2"
		And user "user0" created a folder "/folder1/folder2"
		And file "/folder1/folder2" of user "user0" is shared with user "user3"
		And file "/folder1/folder2" of user "user0" is shared with user "user4"
		And As an "user0"
		When sending "GET" to "/apps/files_sharing/api/v1/shares"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And the response contains 4 entries
		And File "/folder1" should be included as path in the response
		And File "/folder1/folder2" should be included as path in the response
		And sending "GET" to "/apps/files_sharing/api/v1/shares?path=/folder1/folder2"
		And the response contains 2 entries
		And File "/folder1" should not be included as path in the response
		And File "/folder1/folder2" should be included as path in the response

	Scenario: unshare from self
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "sharing-group" exists
		And user "user0" belongs to group "sharing-group"
		And user "user1" belongs to group "sharing-group"
		And file "/PARENT/parent.txt" of user "user0" is shared with group "sharing-group"
		And user "user0" stores etag of element "/PARENT"
		And user "user1" stores etag of element "/"
		And As an "user1"
		When Deleting last share
		Then etag of element "/" of user "user1" has changed
		And etag of element "/PARENT" of user "user0" has not changed

	Scenario: Increasing permissions is allowed for owner
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "new-group" exists
		And user "user0" belongs to group "new-group"
		And user "user1" belongs to group "new-group"
		And Assure user "user0" is subadmin of group "new-group"
		And As an "user0"
		And folder "/FOLDER" of user "user0" is shared with group "new-group"
		And Updating last share with
			| permissions | 1 |
		When Updating last share with
			| permissions | 31 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: Cannot create share with zero permissions
		Given user "user0" exists
		And user "user1" exists
		And As an "user0"
		When sending "POST" to "/apps/files_sharing/api/v1/shares" with
			| path | welcome.txt |
			| shareWith | user1 |
			| shareType | 0 |
			| permissions | 0 |
		Then the OCS status code should be "400"

	Scenario: Cannot set permissions to zero
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "new-group" exists
		And user "user0" belongs to group "new-group"
		And user "user1" belongs to group "new-group"
		And Assure user "user0" is subadmin of group "new-group"
		And As an "user0"
		And folder "/FOLDER" of user "user0" is shared with group "new-group"
		And Updating last share with
			| permissions | 0 |
		Then the OCS status code should be "400"

	Scenario: Adding public upload to a read only shared folder as recipient is not allowed
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And As an "user0"
		And user "user0" created a folder "/test"
		And folder "/test" of user "user0" is shared with user "user1" with permissions 17
		And As an "user1"
		And creating a share with
			| path | /test |
			| shareType | 3 |
			| publicUpload | false |
		When Updating last share with
			| publicUpload | true |
		Then the OCS status code should be "404"
		And the HTTP status code should be "200"

	Scenario: Adding public upload to a shared folder as recipient is allowed with permissions
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And As an "user0"
		And user "user0" created a folder "/test"
		And folder "/test" of user "user0" is shared with user "user1" with permissions 31
		And As an "user1"
		And creating a share with
			| path | /test |
			| shareType | 3 |
			| publicUpload | false |
		When Updating last share with
			| publicUpload | true |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: Adding public upload to a read only shared folder as recipient is not allowed
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And As an "user0"
		And user "user0" created a folder "/test"
		And folder "/test" of user "user0" is shared with user "user1" with permissions 17
		And As an "user1"
		And creating a share with
			| path | /test |
			| shareType | 3 |
			| permissions | 1 |
		When Updating last share with
			| permissions | 15 |
		Then the OCS status code should be "404"
		And the HTTP status code should be "200"

	Scenario: Adding public upload to a shared folder as recipient is allowed with permissions
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And As an "user0"
		And user "user0" created a folder "/test"
		And folder "/test" of user "user0" is shared with user "user1" with permissions 31
		And As an "user1"
		And creating a share with
			| path | /test |
			| shareType | 3 |
			| permissions | 1 |
		When Updating last share with
			| permissions | 15 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"

	Scenario: Creating link share with no specified permissions defaults to read permissions
		Given As an "admin"
		And user "user0" exists
		And user "user0" created a folder "/afolder"
		And As an "user0"
		And creating a share with
			| path | /afolder |
			| shareType | 3 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| share_type | 3 |
			| permissions | 1 |

	Scenario: Creating link share with no specified permissions defaults to read permissions when public upload disabled globally
		Given As an "admin"
		And parameter "shareapi_allow_public_upload" of app "core" is set to "no"
		And user "user0" exists
		And user "user0" created a folder "/afolder"
		And As an "user0"
		And creating a share with
			| path | /afolder |
			| shareType | 3 |
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And Share fields of last share match with
			| id | A_NUMBER |
			| share_type | 3 |
			| permissions | 1 |

	Scenario: resharing using a public link with read only permissions is not allowed
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And As an "user0"
		And user "user0" created a folder "/test"
		And folder "/test" of user "user0" is shared with user "user1" with permissions 1
		And As an "user1"
		And creating a share with
			| path | /test |
			| shareType | 3 |
			| publicUpload | false |
		Then the OCS status code should be "404"
		And the HTTP status code should be "200"

	Scenario: resharing using a public link with read and write permissions only is not allowed
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And As an "user0"
		And user "user0" created a folder "/test"
		And folder "/test" of user "user0" is shared with user "user1" with permissions 15
		And As an "user1"
		And creating a share with
			| path | /test |
			| shareType | 3 |
			| publicUpload | false |
		Then the OCS status code should be "404"
		And the HTTP status code should be "200"

	Scenario: deleting file out of a share as recipient creates a backup for the owner
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/shared"
		And User "user0" moved file "/textfile0.txt" to "/shared/shared_file.txt"
		And folder "/shared" of user "user0" is shared with user "user1"
		When User "user1" deletes file "/shared/shared_file.txt"
		Then as "user1" the file "/shared/shared_file.txt" does not exist
		And as "user0" the file "/shared/shared_file.txt" does not exist
		And as "user0" the file "/shared_file.txt" exists in trash
		And as "user1" the file "/shared_file.txt" exists in trash

	Scenario: deleting folder out of a share as recipient creates a backup for the owner
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/shared"
		And user "user0" created a folder "/shared/sub"
		And User "user0" moved file "/textfile0.txt" to "/shared/sub/shared_file.txt"
		And folder "/shared" of user "user0" is shared with user "user1"
		When User "user1" deletes folder "/shared/sub"
		Then as "user1" the folder "/shared/sub" does not exist
		And as "user0" the folder "/shared/sub" does not exist
		And as "user0" the folder "/sub" exists in trash
		And as "user0" the file "/sub/shared_file.txt" exists in trash
		And as "user1" the folder "/sub" exists in trash
		And as "user1" the file "/sub/shared_file.txt" exists in trash

	Scenario: moving a file into a share as recipient
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/shared"
		And folder "/shared" of user "user0" is shared with user "user1"
		When User "user1" moved file "/textfile0.txt" to "/shared/shared_file.txt"
		Then as "user1" the file "/shared/shared_file.txt" exists
		And as "user0" the file "/shared/shared_file.txt" exists

	Scenario: moving file out of a share as recipient creates a backup for the owner
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/shared"
		And User "user0" moved file "/textfile0.txt" to "/shared/shared_file.txt"
		And file "/shared" of user "user0" is shared with user "user1"
		And User "user1" moved folder "/shared" to "/shared_renamed"
		When User "user1" moved file "/shared_renamed/shared_file.txt" to "/taken_out.txt"
		Then as "user1" the file "/taken_out.txt" exists
		And as "user0" the file "/shared/shared_file.txt" does not exist
		And as "user0" the file "/shared_file.txt" exists in trash

	Scenario: moving folder out of a share as recipient creates a backup for the owner
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And user "user0" created a folder "/shared"
		And user "user0" created a folder "/shared/sub"
		And User "user0" moved file "/textfile0.txt" to "/shared/sub/shared_file.txt"
		And file "/shared" of user "user0" is shared with user "user1"
		And User "user1" moved folder "/shared" to "/shared_renamed"
		When User "user1" moved folder "/shared_renamed/sub" to "/taken_out"
		Then as "user1" the file "/taken_out" exists
		And as "user0" the folder "/shared/sub" does not exist
		And as "user0" the folder "/sub" exists in trash
		And as "user0" the file "/sub/shared_file.txt" exists in trash

	Scenario: User's own shares reshared to him doesn't appear when getting shared with me shares
		Given As an "admin"
		And user "user0" exists
		And user "user1" exists
		And group "group0" exists
		And user "user1" belongs to group "group0"
		And user "user0" created a folder "/shared"
		And As an "user0"
		And User "user0" moved file "/textfile0.txt" to "/shared/shared_file.txt"
		And folder "/shared" of user "user0" is shared with user "user1"
		And As an "user1"
		And folder "/shared" of user "user1" is shared with group "group0"
		And As an "user0"
		When sending "GET" to "/apps/files_sharing/api/v1/shares?shared_with_me=true"
		Then the OCS status code should be "100"
		And the HTTP status code should be "200"
		And last share_id is not included in the answer

