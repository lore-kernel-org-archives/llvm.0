Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCDC3DB96B
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605601; cv=fail; b=mN22QpE8nQKEBTv49op9t6dmjffc7+7Hq00ovnsP1HldljcYl9GLvy5ndEjl1fsniukTDzHuMgMAPh+0ggwM7pL/cf9zIhfp0DJidrSnWzG5eOde2YNNHIMUOGzrH382Nmplbc3dub0gMyrgbiOzR8dJRqCUvZVJ+HUwda/dW7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605601; c=relaxed/simple;
	bh=bq4fvVl2QujN9KrWZlG5EsC/LXuJdHPr8gs/QeNksSU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d1eqD3SFmKgJQeyVkxzMrm4fCP35GTfoO9P7Q6K0yHmdfnQWSnOtJw9oGFyhkTXJp02+PjE9W2aqI5fG7wCQ1E+BWvHArfofWLJXVnr2S4J4zF9/+qb+BQkB2qSqCVUFn3HJRXYtNShU5sC0IVNP3Ukikcse/v26cAOvWtDzvgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZZy2WV/R; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZZy2WV/R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSUROgF76UWMEy4VmqSUH/YHDm1LB9wN77kxlv/M2DElfWrPRrRAiufFlahevGiQzcorJy7sdSB6w7z7l8u52e749DnwvxKutbz1IvldtIw0n89ChdrVMqPFN70Xsfj2RUTU5sVwG7YLoM1BtLQUrSbNwOpEDQJGaQ5dh4AOcRZBwDZzlbN/DFYfp0WjkR11jRv/xCHWFnRmjxkSS+DeXyktjFmzETiG3wk0jgIV4fdQcFsbl/A28u954BcrqpepcCm8AC59AWKSBu36MZBeHYZTefEsy5ZER5fbjEv90qVVQ7BlLcWnR8ALznDaTk4vICE7aMQijU4tYw17u3l5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuMEJ8NoalMPL9vSmmqa3VuEtqPHEB8hMNAAYPiHX6w=;
 b=bqCrOwPnBFSdujgsdM0VeCrfLEFxW3PrOa667DduMU+dv2tISiEhpFvUlkKeQKn4HzX43R5rBhDmn98+N/FAv0yX6Bw25YS+5FLIwOmDFvRHIs4jAFTADcsI9IvHI7Yq50O1HVE6vqawyS4+SGBPrvHiROkHMMxvKWBC5WVhCZZrfvymZ9qbVGsFfJoDk1MJKbyzHGaxu336IxfoGspB5EU9eQO8DknL4ULSBQ84JUPNPkqWqoIU65mzhLE6fDn9WkRoF23kC6DbeB9CFEyLOftWo3n5pq2VIdo2rFZIeCBp3XcYtbD8Av3jnII8uRqDoZMCtF4BFjzqsqM32LhG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuMEJ8NoalMPL9vSmmqa3VuEtqPHEB8hMNAAYPiHX6w=;
 b=ZZy2WV/R8h+fpuWEQ/8Rfjti6xMIChOeQOIDYXSY7LX/13C2qCrEmYRFDWejJp2cS05fySldvyya7Q+KVCIO0nMFjxqBfvafa+GH0/+q4gDxJj0uiWWMpX1fPRnehX2fcq9STZ7KwmuTAs8gfLe6h/eyDr1c+Ct8aecrHd2Y0Eo=
Received: from DM6PR11CA0008.namprd11.prod.outlook.com (2603:10b6:5:190::21)
 by CH0PR10MB4970.namprd10.prod.outlook.com (2603:10b6:610:dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 17:06:33 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::66) by DM6PR11CA0008.outlook.office365.com
 (2603:10b6:5:190::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 17:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:31 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6PCt2235126;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2 01/11] soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
Date: Tue, 12 May 2026 12:06:13 -0500
Message-ID: <20260512170623.3174416-2-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|CH0PR10MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea8e72e-6e7a-481f-6f7e-08deb048d074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MIvjRCx7e2FGmLvbvyPCsZU4Pb+teWS/ifOtW0bJJZ+FUn6yhZXd/XetQ+SPnEkqjAQdKIbGNAV2+p03zpaIcYj3l997avYaVSSPOGUH3Gp/rDDsn4RZ9Utf3Uw1tqRu6nYPX6fyBmHQ2BvyY9u6Ixe1R4ahOCxJhlIL+r3DosBHivMVyvwZzIlJedCNqM1LuDmxNpg/kP8pp/3S9EXJPjYUrq1AAa+/caiIdK9/hROe6jw1xI91QKsMKT3rcsSYpxl/l6GArcD01uDl1MgU2Qf2HR35w0IaqvE1ghDEFNE4vaPVgEmZotMgTuFWQ2GFC+CIW9jyLp/Y9pujelJVnfCu0E30gNUZT0QCxjzeR2hlmfdccQ74h2CL2p+NrQxz/SrjWNUZ+e72WgwN6nxUyy138ud0UDZIk5onTjkP+3s36kzPrtflKFK8jwHKXnxYsX6DMEPB7i8PAcc0g6IzcAR+iOFuZOkApCKRKxHDzhxbA+AlhbSe3I/0vGiOxmoep9h79+26mV5YjYbe6jSVW4/GIx79M/AnkzFN0W5tx7MqVheqhoASXrysIN85Qt0QGs4d5RY+FsBE8G7rPbr7Iufh4geNy+YLioPwqJKlNNhXFkJv8iLDD/A6Oji9Fqb4X7nIk38LiaxBqMuejY9eia0I0tEcKmXuX6y97CWMQ1w8DwAyZ4yxibvjn60yJ2Gghc7sGN3/qNyHaVEZ4hV4LMuwT2VFThArdEUluSJTQjU=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qll2zW7QhJ6qV8GMSXyM739/+yo9q9CAmVx4sxxb+cK4s1nRt1oij8ZCV+BxJ8khF9X1QafedxkGsjjf2ma3wQ+xX3ZTvX6JlElj6yT4XD0v7Wtj5kOEveVm4MAjPfDRe23OJZmcqWDloWfeAPo8Nj48K9aht7MRTsFcUYvMHdL+8gFWEHAfxQEPON0V1GROR5gQQUIAbHV0aVff+yvXOWZ2KN67NOvm9/iXdmttu+bjy3D6KcR6DWRRO7fuRlyoFF78P0FcJ2AFxjVxKkGtsT+UGAKCea5bUJjJuUZcrB3kcG8jqJbxexo/4o0bxTuNiGKKdzObuxX4DNjVqD8YOLbe3akvu7Q+NP2tSc/W7n7Z22q8vos5GwLv/AldsAsneEPdncAIRUu6c5Esn1cYHoBCme2X0Ss20IymsNzwPTStEfYigD7nmDGHKExzO1U2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:31.3661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea8e72e-6e7a-481f-6f7e-08deb048d074
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4970

Commit 168d2fb78055 ("soc: ti: knav_qmss: Remove ENOMEM printks")
removed redundant dev_err() calls after allocation failures in
knav_queue_setup_regions, knav_queue_init_qmgrs and
knav_queue_init_pdsps, but missed three further instances in
knav_pool_create, knav_queue_setup_region and knav_setup_queue_range.

Remove the missed instances.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-2-nm@ti.com/

 drivers/soc/ti/knav_qmss_queue.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 86d7a9c9ae01..e87a42734f25 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -769,10 +769,8 @@ void *knav_pool_create(const char *name,
 		return ERR_PTR(-ENODEV);
 
 	pool = devm_kzalloc(kdev->dev, sizeof(*pool), GFP_KERNEL);
-	if (!pool) {
-		dev_err(kdev->dev, "out of memory allocating pool\n");
+	if (!pool)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	for_each_region(kdev, reg_itr) {
 		if (reg_itr->id != region_id)
@@ -1025,10 +1023,8 @@ static void knav_queue_setup_region(struct knav_device *kdev,
 	region->dma_end = region->dma_start + size;
 
 	pool = devm_kzalloc(kdev->dev, sizeof(*pool), GFP_KERNEL);
-	if (!pool) {
-		dev_err(kdev->dev, "out of memory allocating dummy pool\n");
+	if (!pool)
 		goto fail;
-	}
 	pool->num_desc = 0;
 	pool->region_offset = region->num_desc;
 	list_add(&pool->region_inst, &region->pools);
@@ -1211,10 +1207,8 @@ static int knav_setup_queue_range(struct knav_device *kdev,
 	int ret, i;
 
 	range = devm_kzalloc(dev, sizeof(*range), GFP_KERNEL);
-	if (!range) {
-		dev_err(dev, "out of memory allocating range\n");
+	if (!range)
 		return -ENOMEM;
-	}
 
 	range->kdev = kdev;
 	range->name = knav_queue_find_name(node);
-- 
2.47.0

