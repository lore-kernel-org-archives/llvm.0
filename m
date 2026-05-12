Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E71D3DB990
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605602; cv=fail; b=IW+P8U1KRs39oFXC2clwInhranZH0onUh5aAAYCWMuJv2c4SybFPpMfaSt0txbfx9MeJIXrGwxNHb9zWjR00BigRO4aWdfvgiu+2ULM1tjdNtni6puhn2ufqBWyjonTFtTPenL9aNhfUi7t6ddvLmAP182YB9xg//Hpbt3UNupA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605602; c=relaxed/simple;
	bh=vlbGDuiAogVJ3Cx/MEzYoRAKtnG3aA/UZgOHHx//60k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DypM8qYxKLN0tq2O7B6jsBF+2puMkRuKSM+SuWSZsrlH5dHjwiJ8Xb8pV8hqOKyjmD3xcMaRWS3l0jf+x2T8TlykbXmtPwzkFZTRAoJJ4SJHP+HneGcN8SWUAY5unjVs7vD6M/qxk+Wo/TT6Tzb01KrLPFL7pq02o98zEiJLY+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Doyx4+1F; arc=fail smtp.client-ip=52.101.43.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Doyx4+1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHrvUKpVXW2dvM2se58YaY9Zs48tEd7lOiUmM3khBLtbfhD8MGv+DEmm6BlGFAiOqyMhGSqh6zy2Q8o5IwQdx+pp5Z9sCMv9Y06RND1HBPwl9RNNB3N5e5T0zuCmzQj5p6IR/QGQNRgqYbdSnF7sV020ioIlp0M2EFyJW52QFiPuv+jI+3SO62tovOabdMdmawCLABCnEoj6rqRkOAxC6WbP9y7kMwI/3k9jUb1LTyHB0HY09CJTUGXUQyz8wBThRVvh2evpAGpGgQl2fU8VBvJc7+OFIO7gYbdowI5CBmW8VDj8W9VVuYesCT2+K6m0G7W07vZd/J+SsY+O2HEBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/J48EmcW4dR7PFqmMTDx2x42LKcChtmSoqG3QTqLIJ4=;
 b=N43CUtyAiEWa8QqDy004S2YszrSPCZXLjyIYdgh95Inu1qzX12fcA16+1j2e+Y/ZFT7bTaD4ivpkTrMBk+iHXJ97HSK15xtk3WmdDWw2mCfIBqScxgkgNlo1KmFyvyiNaKx4JRJJfhu2uczQzQE+c0xei6LP3UC09BCJIqG53EQqJzxZTpjQqzlUlXNTWxcDbfFhc1ixP0Ubf3HFhVnfuj4PR8sMuuRY6obnczwZThQMu+kZlcpKH0w4UK0M2xEOBFEXx/xRAUtH/9QYuKOVslGt7+rUQYBtqhBXvfDDxL3nvLWX2dFkjEtIbHh2NqJQOtY+aD+SxXM04vwA/zI1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/J48EmcW4dR7PFqmMTDx2x42LKcChtmSoqG3QTqLIJ4=;
 b=Doyx4+1FAr4hCY1kN3p+qdsKAorDttFOJHXWCNPES+rrMDxjx37eC3Fs9rux+DsCLlKv0/V+8OfnWFnccWAMRhDRg+aDjeIDLCjuohC11uKm/3EFch2qkRzA4TTauXBkO0bisRLwNHOp8rgsush05krU4MbfY+RUMXxK/3yAlPI=
Received: from SJ0PR05CA0157.namprd05.prod.outlook.com (2603:10b6:a03:339::12)
 by DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 17:06:34 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::6e) by SJ0PR05CA0157.outlook.office365.com
 (2603:10b6:a03:339::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Tue, 12
 May 2026 17:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:33 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6Pni1887817;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 02/11] soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
Date: Tue, 12 May 2026 12:06:14 -0500
Message-ID: <20260512170623.3174416-3-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DM4PR10MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 89231c87-23a0-45f3-ad7b-08deb048d17f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	p1OdQsLGFia5ljN4YIW1ae6z1p3VFeKevkGpPbgX/evOHqkcKhlz7DSS1qR80SUP/3kUW4cseo4edDGtDgMitbBFgRjZe+82qKpOvcKz9XE4BXFxrXzQQLjrGsCtBUM5xkqiDcRwxc+LijsOJeij9WuHg5LPmwgauASa61rI0hnES/SMDUzJ+2w95cRlM4Zi2EwEjCcIyotN+HGebvDOfsP6h0D0ikgOv7kFDjoAV60wZ2qcXl5XOGaeIvdZi3vrg7epb9px6H1noGtnMjUil+VvMXt+rDCpJ/fpelXJNl/rx9CLk+Ya4iP60xqIIXkPnr1auulAT2IeeazbVnGkSS5s5hIMzNMVjLOzJDx5zy+w4yQjlbxeFo2jYr1y94BIFpWawZoG5B1SkhRBJvgngMisC8UuPjwvNaB+rS6oB9cFu4jSYs5xgRAZ+xksKNRiNc5Q9Asv0+eGqS+y4lsVDGlCO5Cz8TuVPKscI0lwktwvRfoXuOb5k5DLttIzWzhm7CwlSRr0YuKdLxDzWL9rXQpD60h4rtc4zFwTb4HUKk9T4tPwPa9ViwzA+rCRElxPoJK9Ya6EUO66g57zJc6Jp+N+H9nZYJ2jM2WmulBP9TIfbi+h5sXIeBWwA7A3TNAp0xLo6wGhdlFq0IVnTg/7x73+L1UBm0P75MhNr3MCWaQRDozKyIlCdZcicHEcbGOP8ahg2dWud6hft6iOVPdXhO2JRagW69vGfDDNijQTdXo=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6JX/Gko1CHXXcDmO4OLnqaHpbcGG/+OXuG8ktAW224N/kegQ0z0lsfwP+x4Snfd7z27pf6dKlJ2yeNw7X9gJMt6+J32juPsFiFDku7HuI3sHfs6U2V0vKZT7vhfw3Fql7foXsLWM1GRgaiUdX2M3K9imV23nhojby1C+Un8kew4YH+xHiHguSk7C49IDVaaKP6/t97/qoZE1U4Q28nNI1sdWz90UJj7YCTb2mzyHqWnI0FeVpElLKcVycZ+0p1xto1JES5wOQndpTnpcddNxGvkXXDabh6nlurEkHQ5X6CUqlCYd2XWJMAdKcQPVcqS7qXuN0Yyos6p1wSkUhoLBJhUiUckTiUBwVO9QsqEw7vwPNZFLCYLSr9h4bOw1CVb0ya/ERHMfSoszc35a/XhoG/iBkyeoQFfc2TP5Qopn91kmhn7S9LPkqDf3Ymw5+r5z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:33.0754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89231c87-23a0-45f3-ad7b-08deb048d17f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6886

Building with W=2 (clang, LLVM=1) produces 22 -Wshadow warnings in
knav_qmss_queue.c because the file-scoped singleton 'kdev' is shadowed
by a parameter of the same name in 21 internal functions and one local
variable, e.g.:

  knav_qmss_queue.c:194:49: warning: declaration shadows a variable
  in the global scope [-Wshadow]
  194 | knav_queue_match_id_to_inst(struct knav_device *kdev, unsigned id)

Rename the global singleton from kdev to knav_qdev rather than
renaming all ~21 function parameters, as this requires fewer changes
and leaves function signatures, struct field accesses, and header
macros in knav_qmss.h untouched.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-3-nm@ti.com/

 drivers/soc/ti/knav_qmss_queue.c | 94 ++++++++++++++++----------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index e87a42734f25..2c103bb6edef 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -25,7 +25,7 @@
 
 #include "knav_qmss.h"
 
-static struct knav_device *kdev;
+static struct knav_device *knav_qdev;
 static DEFINE_MUTEX(knav_dev_lock);
 #define knav_dev_lock_held() \
 	lockdep_is_held(&knav_dev_lock)
@@ -205,10 +205,10 @@ knav_queue_match_id_to_inst(struct knav_device *kdev, unsigned id)
 
 static inline struct knav_queue_inst *knav_queue_find_by_id(int id)
 {
-	if (kdev->base_id <= id &&
-	    kdev->base_id + kdev->num_queues > id) {
-		id -= kdev->base_id;
-		return knav_queue_match_id_to_inst(kdev, id);
+	if (knav_qdev->base_id <= id &&
+	    knav_qdev->base_id + knav_qdev->num_queues > id) {
+		id -= knav_qdev->base_id;
+		return knav_queue_match_id_to_inst(knav_qdev, id);
 	}
 	return NULL;
 }
@@ -296,7 +296,7 @@ static struct knav_queue *knav_queue_open_by_type(const char *name,
 
 	mutex_lock(&knav_dev_lock);
 
-	for_each_instance(idx, inst, kdev) {
+	for_each_instance(idx, inst, knav_qdev) {
 		if (knav_queue_is_reserved(inst))
 			continue;
 		if (!knav_queue_match_type(inst, type))
@@ -469,9 +469,9 @@ static int knav_queue_debug_show(struct seq_file *s, void *v)
 
 	mutex_lock(&knav_dev_lock);
 	seq_printf(s, "%s: %u-%u\n",
-		   dev_name(kdev->dev), kdev->base_id,
-		   kdev->base_id + kdev->num_queues - 1);
-	for_each_instance(idx, inst, kdev)
+		   dev_name(knav_qdev->dev), knav_qdev->base_id,
+		   knav_qdev->base_id + knav_qdev->num_queues - 1);
+	for_each_instance(idx, inst, knav_qdev)
 		knav_queue_debug_show_instance(s, inst);
 	mutex_unlock(&knav_dev_lock);
 
@@ -762,17 +762,17 @@ void *knav_pool_create(const char *name,
 	unsigned last_offset;
 	int ret;
 
-	if (!kdev)
+	if (!knav_qdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	if (!kdev->dev)
+	if (!knav_qdev->dev)
 		return ERR_PTR(-ENODEV);
 
-	pool = devm_kzalloc(kdev->dev, sizeof(*pool), GFP_KERNEL);
+	pool = devm_kzalloc(knav_qdev->dev, sizeof(*pool), GFP_KERNEL);
 	if (!pool)
 		return ERR_PTR(-ENOMEM);
 
-	for_each_region(kdev, reg_itr) {
+	for_each_region(knav_qdev, reg_itr) {
 		if (reg_itr->id != region_id)
 			continue;
 		region = reg_itr;
@@ -780,14 +780,14 @@ void *knav_pool_create(const char *name,
 	}
 
 	if (!region) {
-		dev_err(kdev->dev, "region-id(%d) not found\n", region_id);
+		dev_err(knav_qdev->dev, "region-id(%d) not found\n", region_id);
 		ret = -EINVAL;
 		goto err;
 	}
 
 	pool->queue = knav_queue_open(name, KNAV_QUEUE_GP, 0);
 	if (IS_ERR(pool->queue)) {
-		dev_err(kdev->dev,
+		dev_err(knav_qdev->dev,
 			"failed to open queue for pool(%s), error %ld\n",
 			name, PTR_ERR(pool->queue));
 		ret = PTR_ERR(pool->queue);
@@ -795,13 +795,13 @@ void *knav_pool_create(const char *name,
 	}
 
 	pool->name = kstrndup(name, KNAV_NAME_SIZE - 1, GFP_KERNEL);
-	pool->kdev = kdev;
-	pool->dev = kdev->dev;
+	pool->kdev = knav_qdev;
+	pool->dev = knav_qdev->dev;
 
 	mutex_lock(&knav_dev_lock);
 
 	if (num_desc > (region->num_desc - region->used_desc)) {
-		dev_err(kdev->dev, "out of descs in region(%d) for pool(%s)\n",
+		dev_err(knav_qdev->dev, "out of descs in region(%d) for pool(%s)\n",
 			region_id, name);
 		ret = -ENOMEM;
 		goto err_unlock;
@@ -827,10 +827,10 @@ void *knav_pool_create(const char *name,
 		pool->num_desc = num_desc;
 		pool->region_offset = last_offset;
 		region->used_desc += num_desc;
-		list_add_tail(&pool->list, &kdev->pools);
+		list_add_tail(&pool->list, &knav_qdev->pools);
 		list_add_tail(&pool->region_inst, node);
 	} else {
-		dev_err(kdev->dev, "pool(%s) create failed: fragmented desc pool in region(%d)\n",
+		dev_err(knav_qdev->dev, "pool(%s) create failed: fragmented desc pool in region(%d)\n",
 			name, region_id);
 		ret = -ENOMEM;
 		goto err_unlock;
@@ -844,7 +844,7 @@ void *knav_pool_create(const char *name,
 	mutex_unlock(&knav_dev_lock);
 err:
 	kfree(pool->name);
-	devm_kfree(kdev->dev, pool);
+	devm_kfree(knav_qdev->dev, pool);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(knav_pool_create);
@@ -872,7 +872,7 @@ void knav_pool_destroy(void *ph)
 
 	mutex_unlock(&knav_dev_lock);
 	kfree(pool->name);
-	devm_kfree(kdev->dev, pool);
+	devm_kfree(knav_qdev->dev, pool);
 }
 EXPORT_SYMBOL_GPL(knav_pool_destroy);
 
@@ -1683,7 +1683,7 @@ static inline struct knav_qmgr_info *knav_find_qmgr(unsigned id)
 {
 	struct knav_qmgr_info *qmgr;
 
-	for_each_qmgr(kdev, qmgr) {
+	for_each_qmgr(knav_qdev, qmgr) {
 		if ((id >= qmgr->start_queue) &&
 		    (id < qmgr->start_queue + qmgr->num_queues))
 			return qmgr;
@@ -1775,22 +1775,22 @@ static int knav_queue_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	kdev = devm_kzalloc(dev, sizeof(struct knav_device), GFP_KERNEL);
-	if (!kdev) {
+	knav_qdev = devm_kzalloc(dev, sizeof(struct knav_device), GFP_KERNEL);
+	if (!knav_qdev) {
 		dev_err(dev, "memory allocation failed\n");
 		return -ENOMEM;
 	}
 
 	if (device_get_match_data(dev))
-		kdev->version = QMSS_66AK2G;
+		knav_qdev->version = QMSS_66AK2G;
 
-	platform_set_drvdata(pdev, kdev);
-	kdev->dev = dev;
-	INIT_LIST_HEAD(&kdev->queue_ranges);
-	INIT_LIST_HEAD(&kdev->qmgrs);
-	INIT_LIST_HEAD(&kdev->pools);
-	INIT_LIST_HEAD(&kdev->regions);
-	INIT_LIST_HEAD(&kdev->pdsps);
+	platform_set_drvdata(pdev, knav_qdev);
+	knav_qdev->dev = dev;
+	INIT_LIST_HEAD(&knav_qdev->queue_ranges);
+	INIT_LIST_HEAD(&knav_qdev->qmgrs);
+	INIT_LIST_HEAD(&knav_qdev->pools);
+	INIT_LIST_HEAD(&knav_qdev->regions);
+	INIT_LIST_HEAD(&knav_qdev->pdsps);
 
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
@@ -1805,31 +1805,31 @@ static int knav_queue_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto err;
 	}
-	kdev->base_id    = temp[0];
-	kdev->num_queues = temp[1];
+	knav_qdev->base_id    = temp[0];
+	knav_qdev->num_queues = temp[1];
 
 	/* Initialize queue managers using device tree configuration */
-	ret = knav_queue_init_qmgrs(kdev, node);
+	ret = knav_queue_init_qmgrs(knav_qdev, node);
 	if (ret)
 		goto err;
 
 	/* get pdsp configuration values from device tree */
-	ret = knav_queue_setup_pdsps(kdev, node);
+	ret = knav_queue_setup_pdsps(knav_qdev, node);
 	if (ret)
 		goto err;
 
 	/* get usable queue range values from device tree */
-	ret = knav_setup_queue_pools(kdev, node);
+	ret = knav_setup_queue_pools(knav_qdev, node);
 	if (ret)
 		goto err;
 
-	ret = knav_get_link_ram(kdev, "linkram0", &kdev->link_rams[0]);
+	ret = knav_get_link_ram(knav_qdev, "linkram0", &knav_qdev->link_rams[0]);
 	if (ret) {
-		dev_err(kdev->dev, "could not setup linking ram\n");
+		dev_err(knav_qdev->dev, "could not setup linking ram\n");
 		goto err;
 	}
 
-	ret = knav_get_link_ram(kdev, "linkram1", &kdev->link_rams[1]);
+	ret = knav_get_link_ram(knav_qdev, "linkram1", &knav_qdev->link_rams[1]);
 	if (ret) {
 		/*
 		 * nothing really, we have one linking ram already, so we just
@@ -1837,15 +1837,15 @@ static int knav_queue_probe(struct platform_device *pdev)
 		 */
 	}
 
-	ret = knav_queue_setup_link_ram(kdev);
+	ret = knav_queue_setup_link_ram(knav_qdev);
 	if (ret)
 		goto err;
 
-	ret = knav_queue_setup_regions(kdev, node);
+	ret = knav_queue_setup_regions(knav_qdev, node);
 	if (ret)
 		goto err;
 
-	ret = knav_queue_init_queues(kdev);
+	ret = knav_queue_init_queues(knav_qdev);
 	if (ret < 0) {
 		dev_err(dev, "hwqueue initialization failed\n");
 		goto err;
@@ -1857,9 +1857,9 @@ static int knav_queue_probe(struct platform_device *pdev)
 	return 0;
 
 err:
-	knav_queue_stop_pdsps(kdev);
-	knav_queue_free_regions(kdev);
-	knav_free_queue_ranges(kdev);
+	knav_queue_stop_pdsps(knav_qdev);
+	knav_queue_free_regions(knav_qdev);
+	knav_free_queue_ranges(knav_qdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return ret;
-- 
2.47.0

