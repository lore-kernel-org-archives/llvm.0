Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013000.outbound.protection.outlook.com [40.107.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9902D0605
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254359; cv=fail; b=uhqydcQmqVIk3Ke+XoX3NK4VZYSHlUnAgpDVmUkAOhwwOS6pCnQgPJ7L5HXfh4x+pqH6JNrrQYlXx/AyLT3mZeyipJztOq/r5hZFpkWwGy7w2QSXbzN6XZGf4Ylj17C+AeqogpLWPBLxZfmp8Op7wG1TQypM8m4LvbVgoM1NnH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254359; c=relaxed/simple;
	bh=6JH70mpSr7k/9cadkKlq1CWrKV2TafpCYLxEKSHFtV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HnjeRTFX2XqX2OYuXR68k8euy6X5RYXjgzl12K9YE4+NfhUaPfPkqPsEViB/mrJEcfyFPID0Ftv4pQhaxOx2RKDZNNX7tOc2KTgpQKNaH0JEr8gNyfx3V1obLcwgesu37V6mA4uVqut2zWOIVF8lAuC5qavN3Q4axurudgFa/Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=reDLi/eg; arc=fail smtp.client-ip=40.107.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="reDLi/eg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLhGIj7PQdJX56nArj39UV0zClRguUdS+v7rnSezsDUlZz1a0IYn5jO9FJmWxUqD/CjIErfRgdwjArFNJph9/iVU4URw9WoyhgDosaUL9zti8tQ5o03ngi/WnOq+LbnHu2Dav9oLcQQZr6KwN3RK/VqcrmFestnrUUnH/wMMzm/0vXh5dNxUL3eFL/eyYe8zRIddCBvCg7+cH8vc8NcNlwOk5gOO64f9DtXDhHcbW3UK7KSzQQatHQbRrMnw+LlhrEZjVv45u/qJff8wnElUK9s7cYMbYek8Jbmt2GjFzd+6qUJPb3ldtr3qqUUUAXoXIYVViKD/lqxo2nQxVxYnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZP2f6ns384/CTPs3rJBUR8AgOUEXy/Mn4YRV90FQO4=;
 b=v6l4tzzOBNEoswTlq6+wAmveoJdn7inXREGYaW1rO+1iN0iVWtjgxymCZyltWN7ISQotvoIDRnBN4Z3sdkm1DwtgMeu/x1XSgAVoNulwmte/+ysWU2Gi3FwlwD148Jwsb/zlXAHmgVkJd9OGb3RZ8xH6h1Fu6QOlGfWdT6C9B/y//A10qn5L3bbBE/UcNjbKMun+bM2M4qEZgNpPuTPBCuLHBosFqhQuymoPhINYF6s/tAEQ1TfI3vfj9ps0/Ewr3yjvg+VN8y9kku7DhCaUchnOf7uqLdBqRpE1xdgO7vVUkxxpooJZGxrsi6bZd1t2QA+EJGcj4WjGCBCQbou3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZP2f6ns384/CTPs3rJBUR8AgOUEXy/Mn4YRV90FQO4=;
 b=reDLi/egORR9zgeyXEO4nRD0GvVXF3RcTAAB+bCqcUOwC/oH73S1hfWyoq+dXY/O6qNeSdjguELVjd4geGVIwiSiBNgLFdbLKD74OafjMALOkyiahxIh23rGoS6c1eTaWoy2kyJsG0jC+o6kj8oVBrYgkZd87KZzLCUsuLbfGSg=
Received: from CY5PR20CA0007.namprd20.prod.outlook.com (2603:10b6:930:3::26)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:32:30 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:3:cafe::3) by CY5PR20CA0007.outlook.office365.com
 (2603:10b6:930:3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:29 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWFud1961993;
	Fri, 8 May 2026 10:32:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 10/11] soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
Date: Fri, 8 May 2026 10:32:10 -0500
Message-ID: <20260508153211.3688277-11-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a7d57a-8d93-4a77-176e-08dead170431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aR/PWQcXxKqKB8oAUd3QMfzS7IMLGsr23TCv25LK5eByZTiW7Ab/iT0ooZ6C1dFyJFPbK3KjVuGCONSUIbVtJp7RH6F6ZIQMArzaJrTuSZWz9sGBoBH7b0gRKtEJPK47Xcyo179UNUzMoHgT8MjYujZNiYLfLKvhDIxqQAyuAd472hsS5mUdPN/DniuolwpZDrZOkU7EXT573Z8LsFLSsaVKT8z2KbOam2urg5bHps5kLGoJJpxcfZak2Y6qdaCatOepAF4eL+jwWXnB98/rdDi1ZtyPslal70gTlX0H0g2QBGm3AVpy8RtyPSR9+JeOGhPQPk9odsaRfgCO9K+Qbe4KWeDzojdUGy9qwMq1l4JULLEaIf2iDpRuDbuUPKAB7UsheduFzkNe13y3zVL4WlzttjHxQVLloXY33a/lgjY37kceskVBNIazHz5ap/Z+X4JsGsEgrnVV22CQhRoMlteqeBgfAMKjrPPM+uwfIHNlDBz75rVW3fIYPGyeWp9jwi9JUVwt0MktJmSNLStQJnxdlFGjbsnUwW0a0FVSc/1Bdr0BQgF/oGrqlbUSmmn6P+9XQT22rLG+TLj7WcE6tJJLJCYlW0/IVc34rOwljbQAoQZTAAJzasPymb2bMnszQRG/wRBKXvDjcG46Ap+Kc/mNNCNbuDPqE22vjY1hSmlk/rlbK82BNDRquJbgdyMBSebtqNLBMBAJ+Kj9gjE5LDbPTRkYnb3jeTJwuWJW1Gs=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HiGsc/1najEyWuJyAw+dqYWPt0m0HO/mO6nPpmLmwlhsHM6g/tvRuOhMGxH50HeGKXbBD508JWw9qH4+lSlB7icDDGepYG/XnwMngadW1Y70Pu+ZBvL6gwaPuwon37sUQDU2BGAarBPRawWItB9kCqT95eq2BLQm2qC88qQd3TC2cuJ3Iz9lL6ATw+zFdU2HQUi7V0VqEZBGVsl72VD3waTcLiiDUt9FsUpdjW9Mo32owPyFrF4LAS1FBRwc+u8cf4FKGlbEPmZoCwV1HPwVYG6CNLCLOeJz8NbxZxuXCWagm8fGZH1j5TQwGtD+xOzvFgrIGrp4fkLIXc8b7KniOWkW/n5lsjfAKVGqxfRa0BBhwe3u1rpnWI7BArQLhUCSTnMJ60Eo3MQdO0cwPJggDrNf1PvYk5Mnf5FVtLBZ9AupKv0SeyXIjQkm7U5Q4bN4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:29.8409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a7d57a-8d93-4a77-176e-08dead170431
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746

pktdma_get_regs() returns a void __iomem * but uses ERR_PTR() on the
error path, causing sparse to warn about an address space mismatch.
Replace ERR_PTR() with IOMEM_ERR_PTR() to resolve the warning cleanly.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/knav_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index 7ba6fd58e9ce..96df3982e47b 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -520,7 +520,7 @@ static void __iomem *pktdma_get_regs(struct knav_dma_device *dma,
 	if (ret) {
 		dev_err(dev, "Can't translate of node(%pOFn) address for index(%d)\n",
 			node, index);
-		return ERR_PTR(ret);
+		return IOMEM_ERR_PTR(ret);
 	}
 
 	regs = devm_ioremap_resource(kdev->dev, &res);
-- 
2.47.0

