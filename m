Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13823D9667
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 17:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605601; cv=fail; b=XK7jekZ7WqrzfJuDf5Nex92gmcUGDfPgnuKT6wwyJRLcih691u6fXhGMwQLlkp//+Uu74LS2/EI3j56Q20eZmjDngx47pshtBxDs6Dj/Sr8jTcQcEwhiE6/om/mIkP8M8nj8Ym4oDFM4zTr5RARtuqh0dT1gq3NlIceiN2325rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605601; c=relaxed/simple;
	bh=HKe3SRb63QQvaP+itg+ycNSsFp9fDOewHTvSdI8bM9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpV03ehJTISn3VGCrpKI7Rh2Q41aQYmAL+LwalwY/Z2arVksvsojEyOR9rDwnbUP67JoHfgSShTIoBBE9VHfkH+JihmzeHUOZPJ8gkHnjv3Yr/Cgo+WqA47c3eV5dek5ZdXaQJ5R+eq7AI86L95DpfFFccR3SzGAqJJ6u1poQ38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RHL/Ebcu; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RHL/Ebcu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvlpoMZH2dZXxsudbVIzv0TqdLkSDQdIa8Kr+I8afjCrZo/Vyi7Hd/2c/W5CFs4B3ZUp37OJWaSc00HzGT4TjYRHQMmidMP/mip6ST6rHQmQSXo9bW7OLLkf2YQTmCVT2gl7hMjqXyUyRWQA6nIIZ795CO5VETv8jDoggfArHLOPVQqy4r7Sxih3Qaj67mkSiSdVjqZi+vEFDb5FHFS5HLJFWW6NY689B5BB2WFtInfSKhUoEBvQ5+ZfAe0/RUxR0wlB9ipXFnDgm0kZ6TFrgXw0aluH7NCkwOBeqi7CrlbMWq9muEL2hrljwmvSPT040ve7ybA2DseXyrkdYyYGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijNufQmCQt8SkkedI37cRQEUYPBTRkUDlDPggvgPxis=;
 b=VO1lfM11UjkViAc9+ldb1U4pEY8n6Dy6+7Hbw9Qo/vjWeD813lOrACv9KLaAPPyZ9FO7sUTbzb20b87t8fpGmX544cDtqUpFoDbhOSdfMs/0C8UpC6SRtyFO5kbqaxA9dTutesWqaGqHY3KZTfNIbpDXPfDoImobWIiBTQwEcog4IyPYRsMlH7Cd1znL4RcTrzMkpuX3oZM135Py3USm+Ea0AuLmeeHgrHK2Op4Zi2GKPRIfF+Wgk0wI5cESw2XF2TPxwYhSa++9LBaZcVswFaV6VNF432zrddWDl49ZFZFQBW5RWrQv9udoHCo10g+DvHthhUJFMRtzz9DMJhul9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijNufQmCQt8SkkedI37cRQEUYPBTRkUDlDPggvgPxis=;
 b=RHL/EbcuMbIgkwjzVK+/nHPaDuVjTubUPnSK9oJHCphl4YRg0MQykRjEiCd08QhWgqpswjOcXLUrzXo+d19A1IjhwR58fVZDhrbA/EKWy3pQ2Aa7kxP+0mvqx8tjvWWXCf+mgLqP3aZ1MebofcIP/Dzbw0PX7/6yBYVfmB3bKjo=
Received: from PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::13)
 by CYYPR10MB7607.namprd10.prod.outlook.com (2603:10b6:930:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:06:31 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::f8) by PH7P220CA0007.outlook.office365.com
 (2603:10b6:510:326::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 17:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Tue, 12 May 2026 17:06:29 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6PrK1887829;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 08/11] soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
Date: Tue, 12 May 2026 12:06:20 -0500
Message-ID: <20260512170623.3174416-9-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|CYYPR10MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0c540b-9311-4def-3748-08deb048cf5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Th15bhSouKqzrtm8yqxoO73f7Yg12rEI7tnqXlXSXZrVfZJN2QmAGVobhMNwk311BiE1rW+1L4yRrONB901nRsp4GxC4R58V8FwLoG1fFaJ4tiAEtUm7m8MLhPwpeeKHZMGT+LtyF193HYokyVfwsUYIYtFbknq+fvvZ4nUpDOMU4dtdHx7PpTBme/y7HSS2OL7i581/yOufVyXGUxq2nkvWmq5ojpj15kPaAXq3E6ZUqvLFxiVeLDcYxIUBw4Byls5VFGYxT/VVxAVNyKROIXnE9t//MlzrGRQpFrQLxOnG5HqCEk42w2kKtaikgj1l46RDAXTy0TxoVcw3sp0HodVlJqYtGe8pO/FhGnXBqk91GPN+ghuV6I0sqJc1uIgEMevsXpTXuFwUkYxl5AirnhwfuI4TMbHkaq1pfqkZiJYZa6OOfT2qNclYc3Qu0ZhmN9iXJabj7QR02rZjn8AS6Ta9NK6PUkaCpwnA2xrjyxBNqZq0FP3YVEy+2SFChp8TIkknc1sAAWnklllYeUnxNKv8KuGNFRi3EjSJ7H40KCfdGKDbx24pa9gG8lbhluuFpthMhOYn+7WPaKwTh+PUEP9hIsFIWocOmzV0IL/mIWQ9ZFHP+WMYbFq2ICqHwyyYSb1nuCYdubFR2204OL1yDDLNAkwMlSHPqW0MZ6FJWSHUhiq7DI/CjJagDZEl06I/e11+hS+xwTUvj2/qzTfBeYlkwKFaEf7ASq8CHxHfkOw=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k9Ilc9zKRx7fnRNwr5RiIkDj63KvUjkaJPtlMRW55mCEDB1OWyiCPMArfKdX7Lzta0gKswo2ek3tfK5ozkH/dRoYRphwSDV/vF3A3TwVUKda5D5N+xzrcIlW7n8t+r+Y3u3Ss+YhLYxuajXulnn/3BICB8vJK2i28FP8ix+ATyLGV4lozFQDGC809Njsov9NM7PSTajbvtZJMDY4X2ANM5M5y/btwGmbpIJ/Oi4UP1KMD+T2hh4rtog/1knGyxDn24oBbh+8vfqpKEl1dRrHT2rkf0FYoiN3ikyejTYHt8boCWB7j5r6V+YpUO8ENS2IHPQVgEkB6+PtAOKZX3mI/H9nbUmmvuEutjaphY6/Xkx5QVvT3lPmmZkvTWIBDqjeljVu5V8gTsqfVy6A5uLLpw3B5GeKvVMZp5VGI6LB2QA0pQ0TkMrpNhbFrmwa8fwO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:29.5100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0c540b-9311-4def-3748-08deb048cf5e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7607

DMA_PRIO_MASK (GENMASK(3, 0)) is defined alongside the other priority
macros but is never referenced in the code. tx_priority and rx_priority
are only ever assigned DMA_PRIO_DEFAULT (0) and are never sourced from
device tree or user-controlled input, so no out-of-range value is
possible. W=2 builds report:

  knav_dma.c:32:9: warning: macro is not used [-Wunused-macros]
  32 | #define DMA_PRIO_MASK           GENMASK(3, 0)

Remove the dead macro.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-9-nm@ti.com/

 drivers/soc/ti/knav_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index e5f5e3142fc4..462d181ca564 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -29,7 +29,6 @@
 #define DMA_TX_FILT_EINFO	BIT(30)
 #define DMA_TX_PRIO_SHIFT	0
 #define DMA_RX_PRIO_SHIFT	16
-#define DMA_PRIO_MASK		GENMASK(3, 0)
 #define DMA_PRIO_DEFAULT	0
 #define DMA_RX_TIMEOUT_DEFAULT	17500 /* cycles */
 #define DMA_RX_TIMEOUT_MASK	GENMASK(16, 0)
-- 
2.47.0

