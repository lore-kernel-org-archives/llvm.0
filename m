Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCCF3F23D5
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254365; cv=fail; b=oOy5ISdRdV15S/BV+gmcNJyQWFtNnIgkJF/yNqodh7Lnm/mZQ5dI8p6kpxsnOLa705izGJ0OmEEQKqXSMgl0dNtf6/Jvdb2FwAeCU5wOtXfOgtS+iQqrrQgoAp9djp8rnL6SwYhlMIkGqR/t2V/WKf0kfhtGSKVUYnwYv72bHac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254365; c=relaxed/simple;
	bh=Uc4gjQ8xV1Ucl68L+6ZVKjd8esLfkCQ2UX0GUMnXLf4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rpOPYkBxoSHyhoYai6dLrjgDWgsMoMGeiw7e3FORJzpxUYEM8V2cx3bCX+XmW2gUF18qZh1OX3M0iIwSkTmiI548aivS2C+0K2HFMDT3kBgUnv6BdLZCLbEXT/7kQmIqgq0Lle8Zfu/UWdVwipco5NDZXlAsbbJA+FyBGdHcvC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PJSQX4D+; arc=fail smtp.client-ip=40.93.198.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PJSQX4D+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lsn6LdEw3VKG5FTaHqn3I+jFS39M2F3HDlChhoOXzPmCqtaY0NCaPTwusTR3PmbQ1hI7CnaXH1B3K31PAOyXgvf3Ufq+KrSbpzLNNTuVNVwSwmG25fEAgj21JVmGj4Ul2zGWG6++zKAzMTyNNazRDv70hBRucSU4UgJrYyKEV+Ks0LB2fNfLss0h+bWhpgWQgz9+Oj3BDDR3j7ziXh503ZUunosYS2rZIGpfnrTXeC6r0cdTmk3QOD5kXdEhK6Nc3SvumNzem6Wsz7JyDu1yOjqXS6+/W+/HVUG5bqoBb6pySexR0OMlXW6VEJkPLo7ZmInrK/REBKTYpI+KSAanrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVDqSYfPSB4i8IsuYkEc8NZ4nMHnsvHXNYfVJR65Vpo=;
 b=pVXtlFKaCc9jqKIcCFBEpuaa1u9J8h3/rHQX/Le8ZxelWTlWcH3l+vVpA2XI3dCmbO1GalPaGvl6Ys++HIbxyWeDriJgGPST0EBRbBTAPILUui1Xb2ahNQ/0KAEP3kTVefmnQcW9F+/JAP00neny+8ptV2i9NYpt/VEFAh7SWIbtx0QPBFKooZEZSS8XpNmYY+IV0v9TCEZYtNymWDqQpIc3+URZKVdJopFM/Nf9QMEhPJsEKEIXqtq4MXwGdSkMd4nwsorEeMOreLUPSwLp5kEna8MqcOfuWZRAgoustlyhiWoPq5sRUDdltoY3RMJNhEE3n4REtlVn+5UPrWOJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVDqSYfPSB4i8IsuYkEc8NZ4nMHnsvHXNYfVJR65Vpo=;
 b=PJSQX4D+Ga/L2R9wDxINBGT29W7yrcT/N+ezYNYSPioynsn0t4eJJNTv8NKEDgcBZHEFNAVccaRI+0t0qqMzdFUP5PjEor/7uhg38NW7lvM8Hw2kMUNIlX5BLs5GqvvjuIUNQKepMa4Rr7FrV33hH742/gP+fpU6GXt2qz3rCX8=
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by MW4PR10MB6297.namprd10.prod.outlook.com (2603:10b6:303:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 15:32:42 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::ce) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 15:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:40 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEkL1961981;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 04/11] soc: ti: knav_qmss: Fix kernel-doc Return: tags
Date: Fri, 8 May 2026 10:32:04 -0500
Message-ID: <20260508153211.3688277-5-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MW4PR10MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d71c908-4ab3-4931-7135-08dead170aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	YaDJV2PSv1nJhXBl2tfUDOjUpYOPLw/43fqSWzz24CToiimkey+s4xUcRl4UmYcnrxZNTcyf8jr6RwC5elyxUhhlxQSDJ+tgMMq1PfxAlg4ZbJJ/UofYdibjqSJvg09fc33WO+Jmgc4jOKNPoUR6w3CtqTInS3y5oG2BrjBvhTEA6BPbUjhC3bSFyoXrtNFRrIP9z3vGcTGi8DEnQY8B9RhF+SJ4+GVum1m6XqmdYYOR+WDEcmSTF+51mbKBi9WeA/S4sTkv+Yp3sYlJ+uk6xjYkYrLFmBORl3/ksxrdFeinaVrp5+0YOdKcUyQKii65tTTzPh4H5r0S8D19tTwofTyRHjmd3kwLmYM+/BEyU0RF9qMWjGjAs6W+2Q9ACjDQtPfnZ7h+F+kLu+IMmEX3IgQcWc97/oiBLIbr/KR5RncLLYIHyoscSLPeobyBIi3MAyErJFQUzpA5nm4PSsUB0XcZjXtXG8JxLgSTs57h7WfekRyRzPvBQe/T7Du2ffHYqDIVuJw4Vs3/J1gfuOCZCNDza2heZ0FP5BaJ8oRrn3WLX66aDWtWR7NDL/zj44JDA1xJp3jYZHGlwd2Spfzo/cu0U/B5mZ+C/pDxoLn9/yUeV+emWRoE6yVAhBl8o0x0+KOj48xD/BvT2j8AW5QI1TpOKeObWzn5DM4EljmY+dPF5jl84MbkhrQwlEow+9Jz59Mo4B1c9utaWPGHjVzcs0dlpN162q8AlO6mzrxf07I=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sFCOcJOIjXlUDiaR3CNoVlgIl+g5yE2MYeoMMSuRj+AGdhzCu1euDWtneIb0yHgt0wcBnKu1hhcRODvVspFQnVfuXPGFyYZ1SpC52n/byYUmeMn2DwobmcWpHMdnhG7soNJHvFDUw8RecyCF070gihAis40Y6kCQ1OnDrYJddIWXKBO/B4nMvl4pGQWIPc35PdllB92ah762PgcnSkUfnZbgu5tmkemWGO3EKR5LZ6R8BF8pt2qrMrMZYJZXSb3YqUxL7LTgGwrSIrg/AF3TPp0LuD1H02MbDbnfzTDn1fzy/MJPf1yYAfUujR8UyVEgal14YcOyP4NXDK+wpwRMiKXCsRKwxLVH94ju2NJUwlyFvpXpMGMqWsQQn8aWvzZ+6aSMZmRv8ELLmS+R5dJF7+sYS/SnL2pZEyWoGgZRdE9w8NyQbEITIxGqe7odZz3i
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:40.6928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d71c908-4ab3-4931-7135-08dead170aad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6297

Fix functions that use inline 'Returns ...' instead of 'Return:'
kernel-doc comments, producing warnings with W=2:

  knav_qmss_queue.c:524: No description found for return value
  of 'knav_queue_open'

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Cc: Randy Dunlap <rdunlap@infradead.org>

 drivers/soc/ti/knav_qmss_queue.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index f65658014b05..c3f85052002b 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -517,7 +517,7 @@ static int knav_queue_flush(struct knav_queue *qh)
  *			     Subsequent attempts to open a shared queue should
  *			     also have this flag.
  *
- * Returns a handle to the open hardware queue if successful. Use IS_ERR()
+ * Return: handle to the open hardware queue on success. Use IS_ERR()
  * to check the returned value for error codes.
  */
 void *knav_queue_open(const char *name, unsigned id,
@@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(knav_queue_close);
  * @cmd:			- control commands
  * @arg:			- command argument
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_queue_device_control(void *qhandle, enum knav_queue_ctrl_cmd cmd,
 				unsigned long arg)
@@ -625,7 +625,7 @@ EXPORT_SYMBOL_GPL(knav_queue_device_control);
  * @size:		- size of data to push
  * @flags:		- can be used to pass additional information
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_queue_push(void *qhandle, dma_addr_t dma,
 					unsigned size, unsigned flags)
@@ -646,7 +646,7 @@ EXPORT_SYMBOL_GPL(knav_queue_push);
  * @qhandle:		- hardware queue handle
  * @size:		- (optional) size of the data pop'ed.
  *
- * Returns a DMA address on success, 0 on failure.
+ * Return: DMA address on success, 0 on failure.
  */
 dma_addr_t knav_queue_pop(void *qhandle, unsigned *size)
 {
@@ -747,8 +747,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_dma_to_virt);
  * @region_id:		- QMSS region id from which the descriptors are to be
  *			  allocated.
  *
- * Returns a pool handle on success.
- * Use IS_ERR_OR_NULL() to identify error values on return.
+ * Return: pool handle on success. Use IS_ERR_OR_NULL() to identify
+ * error values on return.
  */
 void *knav_pool_create(const char *name,
 					int num_desc, int region_id)
@@ -878,7 +878,7 @@ EXPORT_SYMBOL_GPL(knav_pool_destroy);
  * knav_pool_desc_get()	- Get a descriptor from the pool
  * @ph:		- pool handle
  *
- * Returns descriptor from the pool.
+ * Return: descriptor from the pool on success, error pointer otherwise.
  */
 void *knav_pool_desc_get(void *ph)
 {
@@ -917,7 +917,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_put);
  * @dma:			- DMA address return pointer
  * @dma_sz:			- adjusted return pointer
  *
- * Returns 0 on success, errno otherwise.
+ * Return: 0 on success, errno otherwise.
  */
 int knav_pool_desc_map(void *ph, void *desc, unsigned size,
 					dma_addr_t *dma, unsigned *dma_sz)
@@ -942,7 +942,7 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_map);
  * @dma:			- DMA address of descriptor to unmap
  * @dma_sz:			- size of descriptor to unmap
  *
- * Returns descriptor address on success, Use IS_ERR_OR_NULL() to identify
+ * Return: descriptor address on success. Use IS_ERR_OR_NULL() to identify
  * error values on return.
  */
 void *knav_pool_desc_unmap(void *ph, dma_addr_t dma, unsigned dma_sz)
@@ -962,7 +962,8 @@ EXPORT_SYMBOL_GPL(knav_pool_desc_unmap);
 /**
  * knav_pool_count()	- Get the number of descriptors in pool.
  * @ph:			- pool handle
- * Returns number of elements in the pool.
+ *
+ * Return: number of elements in the pool.
  */
 int knav_pool_count(void *ph)
 {
-- 
2.47.0

