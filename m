Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443193EC2E3
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254348; cv=fail; b=TVID+QVeqOorZ8CvbyhfwIF5hQjTL3sbYLlgHEqw7mtlJTt0Sr+I/xzWDdHoTwWISYC4hkM/5J2RBlSdoqKq6E/i+VHwkvDfX43RJi0S5FPApW7UKlBZO1MA0vgp0NOcTJDudBvx11OzPFG6yUWy/tzZpoNAIVH0DuHEykMVNXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254348; c=relaxed/simple;
	bh=Xh5wxUuuwxFQKAcCWogHJGMR711oRqw/XlFw8g8Tm68=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RgqTjlcWznWieeodrob5wLfBdEyvF+CHf4e4F0G+TeKWJTL3Bn+RDgM09B/y2EpJO42HmDae97QS7L9uhDONBXZfAXw2fhXdaEHuDKOouRdr2tXCttQR5Krgso+aPYl1I/DgWOeXiOZNwWGKOZBcYNoOKTPkLlQbTdE0wfB0rcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PA+k0mly; arc=fail smtp.client-ip=52.101.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PA+k0mly"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxEJ8jo8lOiDnbrb81OGQoxHgvtBgwge8GQRk2eZBGtVbjI4CdAMmYawnXMqP4XpULM19q5hoMeJ5NxikAVyjFuDa98vrSxKtXAwJtrvym9qYSVqaEjs7Ey59tW1u3mAQy9GHqP4g2VQW7iublRspRcceAHt0PP1i7/Fv3W1iPXTcSt9pSMaRxBr+MSL46Yd3NHKMzfOKHC5fQFOYSesM+bkcHha+JqTK28+fUI9ye+NpRz0nxNPDVHMd6LPQ5ZCjxaUHNpyCPrxG1qrj28c12lrqJU6O8Eh0Zzc5yMpdH4XRz76JKx4g5tK0RGbdfG45mxTliIV5DqKurd/AScZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lU4QB+k7D6qRJr4JC+6lYifMN/b0DjIEQgOLF3/x2cg=;
 b=ua/qZ+SaEdhTWM+900TVKHOJKTnbH3XnzNEcnJ1H9oACBG/6u+XHOVScVg0Nu2fhLKtbt2cV4VZsTMeK+t6oHl5DKXCaRJii/srlfu3vBp4Firu9J6eVG1I1o8u2rCpRUq3YPjSb4RPbeRQeAXk1WSedLggtGAo7PUWHFSeMhxtKMtm9iwf7NR1lQkrPR0nF9z0sYmt9WJ4BFgeBgOhKasaPPadyjB6K5x52rQBCRPfnd3Ahaqs+fl2bdA4KHU75T/foEmxUq1KjcfbEPRCjSID1qzVTrau/gn5V5FXwhJAcErHQwrUHhQQOJZncvqwSeR+u5mbNYrhm5ixz9YPT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU4QB+k7D6qRJr4JC+6lYifMN/b0DjIEQgOLF3/x2cg=;
 b=PA+k0mly9GHM6mYjE0VqHcaxsmjswFSF7RVu5w5C+UC7JATiIsc3nVZlw3ZxvZUiceKuCdJkw2n3Vt3Kbj6WgGlIuGwOgQzfQhN1+wWF03Jd/lLbKEo/4vA+z4WtEBkQUjdsZlVLX6JDecoJ6TARSMBKEaSkg7kHX/e0+0ZTcuk=
Received: from PH0PR07CA0103.namprd07.prod.outlook.com (2603:10b6:510:4::18)
 by SN4PR10MB5800.namprd10.prod.outlook.com (2603:10b6:806:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 15:32:21 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::71) by PH0PR07CA0103.outlook.office365.com
 (2603:10b6:510:4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Fri,
 8 May 2026 15:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Fri, 8 May 2026 15:32:20 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWE081647298;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 08/11] soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
Date: Fri, 8 May 2026 10:32:08 -0500
Message-ID: <20260508153211.3688277-9-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|SN4PR10MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: b91df0ec-760e-4d65-dc46-08dead16fe9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L7cA/UHODbUwystjZh0fBMw8pe9NbKqOMQJM0u/zdV+aMfwGz5usnzq5ISg3FSyp5Hp5r6DHqeBXjLIGxziW6iWRm0jN9qI7Z91RQCcHywQSi9+Vjc7P5/49ufqBSr1WX+VoyjLI6t7E8T9vJ0X9UCo187Vg+LxfQQeNn3SJsYZg5v2NvSnmCoYamfDQaev7NlmBxg33WoAoqbvLBUnyFSzOqQWVirzhr1/Zlo5QmhYD3vhtzDzr7UA3CKlWWvWo1KE4saBmUZ0Le5KWwbUkGHSH1xb/CKEQf+2y8kTi+emRWFlwx3KLJO/kfJwALAd9vkHoIpNDrKi59XQhZMSMO0fZFYWwnoHGKYlDXn9fDdK/c8KKOieTH9OTYqzbOLJtS/vC9soy0JRUGcVKqUFE4CY0EkQE4mQAXl7sK/GlF4lMnMWERQAtfDNDGXwbVJkcpszHrx4i9TIxueYHAMuMv9GC1pkK+2ediVvw/zhDssBqJAzxR2iqU+DFftd9TidPJX3I3JU2Xxs9F4PCFbbn3iv/QuVYzdAnkh+8bwM18HiUqeuG5SrmcBiuhdPxErmjUdpxorhs7hHtIeVnK5bY+y/VzpaB6L1hDyqOX5+Ksy1l44SwrlI3mH0EDlUuSUHhWMHyrrIBbeBUx+qaPvIrgBsgDWAwiqBtYKlqS53vqg2SvCLzZWfmzvwpYlIbOU4MkUNhtvKijvyR9jq84xacL2yr0yJkV+ROQvjHzWr+Mvw=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f9KjjJKv8PzWBLyxaUR8/3yxd22iPw1hw/Ycy5j0ACZrkFsQ5IaAPYOej9GFJqymBOtYZKmUVp6AGECFnGf2X1Z2dYFgorWs/uBY8OZvaj2b+3uZD/WhJ5swSXvOa93HFVO5cJz/qiuWSNa/BeQNl/vM9Y+uCfUmZv97v6h0nlXIzH3X8COHc9Qiy9iBjyuqKEFTEPoWPTaDX/+hN1UmzIH0+2lWq/QpM/naWgjtHjFThfkyYdgUvKuOG8y3lHyQBI/GOTrXAXqUgU4+DzseqVfuFSPHKpVAHF+XvZ5cFas0Egyxj6rYPZHTgFOI1xzR/eGneLWdpyia3WEhbcPoDE7FGWceOnvpMtOujodmKxMKS4aWlp27jnXyFNWSYRN2Y7Twcn433vLESS8vsNQT8qOLpBHWPXPg2BePG2dL+iOzquQixPbN8wn+NNdmnBR6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:20.4522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b91df0ec-760e-4d65-dc46-08dead16fe9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800

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

