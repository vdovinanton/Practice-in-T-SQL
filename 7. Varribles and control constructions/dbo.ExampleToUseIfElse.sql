
/* IF ELSE */
/* https://metanit.com/sql/sqlserver/9.3.php */

DECLARE @lastDate DATE
�
SELECT @lastDate = MAX(CreatedAt) FROM Orders
�
IF DATEDIFF(day, @lastDate, GETDATE()) > 10
����PRINT '�� ��������� ������ ���� �� ���� �������'
ELSE 
	PRINT '�� ��������� ������ ���� ���� ������'

/* WITH BIGGIER CONSTRUCTIONS */
DECLARE @lastDate DATE,
		@count INT,
		@sum MONEY
�
SELECT	@lastDate = MAX(CreatedAt), 
��������@count = SUM(ProductCount) ,
��������@sum = SUM(ProductCount * Price)
FROM	Orders
�
IF @count > 0
����BEGIN
��������PRINT '���� ���������� ������: ' + CONVERT(NVARCHAR, @lastDate) 
��������PRINT '������� ' + CONVERT(NVARCHAR, @count) + ' ������(�)'
��������PRINT '�� ����� ����� ' + CONVERT(NVARCHAR, @sum)
����END;
ELSE
����PRINT '������ � ���� ������ �����������'