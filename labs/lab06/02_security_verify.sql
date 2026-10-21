USE UniversityPerformance;
GO
SELECT name, type_desc FROM sys.database_principals WHERE name IN (N'lab6_user',N'lab6_reader',N'lab6_manager',N'LabReadOnly',N'LabDataManager');
SELECT USER_NAME(role_principal_id) AS RoleName, USER_NAME(member_principal_id) AS MemberName FROM sys.database_role_members;
SELECT USER_NAME(grantee_principal_id) AS PrincipalName, permission_name, state_desc FROM sys.database_permissions WHERE USER_NAME(grantee_principal_id) IN (N'LabReadOnly',N'LabDataManager');
GO
