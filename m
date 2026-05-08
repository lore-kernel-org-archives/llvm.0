Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064E2E62D9
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254355; cv=fail; b=izndr//VdVzO8oSWNkrSqhwg7fi86dX2W5OIfyi9jkLNNu0nm2gH3tgWUNzjylM1zZVPX+gzM7HZzKjPNeRACHN7BXKqW7MqMyE7H5pYwbLqQhMWbM8xI6xlAXwHPKlArfO1NW8sfHkrFMROSTRbwIEGk0n6ylC9SHUPeOSU5iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254355; c=relaxed/simple;
	bh=qo1SFowyObldBmdziVi8cg7GS+qS+pD73suimoHmr8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5HJz+0k9TtCHI5ByLhgfn8Kr4lJhTAgiiAwckkQnbkLyLRpT/tevdJoV2EeIJXq9u06+AZ+JJVgshf5ZvSF7GoJe5g14NuGC4cLaPiEL3Y9NBZMtp0X4KuynTjo+c55WZl9MDRNkgX2lhRkjKIN448GJuuHuRAn/tzrgNhS6D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fGrWsuA3; arc=fail smtp.client-ip=52.101.48.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fGrWsuA3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFpWZj05wP2hsHko/BnuhS9hvLp4LIF6hM3B5ZRliY3arAngQQgra+77UwqBeCdJBgC44dAS2HWDg7zDMjlhKvhrVp9iZYY9T+ifegqPieJrdMUxy3qPuhFkSJTRWuTssib2eeO3D07sVSUB5/aI2/di6ZYJWnSZEKvwDGj550reRRlHN2/G8moQf4uCLKPMUrlbqfRqYgZ/NLXJSH1cuqpend9++F1Mw94aSHEEx0q1TpRqhdzBV659kHLjK2605IhcpglAQVC/kjLdM9Uyj0TzU06t/Df2uk+ailf121f1x7fGhk2ENrs5BK0xYQsVqk4Qc3UTvcHa8eZE3f5NJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRvvHLFAv8WkD3F/k9Ia+f1bCEKqsQ4AkB7jp1bqlXc=;
 b=eOxPqfdyECgOwsOvhb5fXPJWoKa+98RzDInIJaTdh7plYkmDeFGP8tHD4SNdgAOsSdg4fEfH2LzbROtYs5mtxRJTIIz0dgFh0Oa3Tjcsr+XEgrGZPznUDxXuNl/E4rmcFCaH40uDUTet4h3XJc0CXTG+VYC5mnjN/p1gdvAcoP886Z03FMGerzuGiASX+PL+01Zr5bxW0I7xTM/UMgdVzmgLw2cRV22EGuyv0fOTIB1XFnx3aCliA276vqflYNHQdaELXoD8UvzrSTIRXk0pBiMESE8a3nDmpGLR4dlJa+qI75hRP3glw3tC4t52mIpq+PSzpMbuUoqsujy+Ng2zXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRvvHLFAv8WkD3F/k9Ia+f1bCEKqsQ4AkB7jp1bqlXc=;
 b=fGrWsuA3cf/hcOC9hEDqXdni8dlxq4StFbMAedx04WmiO3ySnd49Z/TGR7Nxk9IoedpKSgFiDbqbI0b69pfDgyBEp9GQt+9KKsL4FJbtWrSemL1PMh5b69hXyNO9QCYyIV7eCjH8Ro6eNbhHf+6mFIaRYyY8p+aKoA51d275CTU=
Received: from CY5PR20CA0028.namprd20.prod.outlook.com (2603:10b6:930:3::7) by
 IA0PR10MB7232.namprd10.prod.outlook.com (2603:10b6:208:406::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:32:31 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:3:cafe::da) by CY5PR20CA0028.outlook.office365.com
 (2603:10b6:930:3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:32:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:30 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWFWv1647305;
	Fri, 8 May 2026 10:32:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 11/11] soc: ti: k3-ringacc: Use str_enabled_disabled() helper
Date: Fri, 8 May 2026 10:32:11 -0500
Message-ID: <20260508153211.3688277-12-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|IA0PR10MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: f5428267-90e2-43fa-bf2c-08dead1704de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZJQnDW4iuFT9FHl7PSomimx0MeCUSo+vEnp4F4F5kuJ+YrhfuFJ3f74iRN3D6A9UWm/o90a3YSqQviRMoKmKYtamoEw+LmHzeYmhKiH3dQhVSeboKr3UB+EtNm3WjO3wdDMMuBUa0kWUibKXiMJOZR9ym0ReVJXQKeDi5V14nGVUzcbR74WD0AK1JZEFWV/omfgZ/Okl/nfUkvJdY+gqzN/nGIykSH2lwnXM+s7Yry0TfI8928n8WCCEzRgSVQSEEDybAMBy6kUZ4W1/0HyCRRz7PMfuBCoTxUnzk0yp0V2PW2cmURf1VTsTZmS544VXyqCXHqFVW3h1yvY4GNSpjMj3jTUvfFDM/v0K64ZwE1fAm9IfGlTp8RccCKdvkJsauPY6sHJqNWzaiIDVj1EFqYDa0ybzaaIrE6ODsRza/dkuMK2zCHCcPrELlxYkGCjqmSPYYz9PDZWHV4bqsp9seU730T3r/8lomFtGIr1YGt2wS8mx/9nio6TdduLVg+y57LXYtElCUxgNNBzwYtlphOmh9tr8tDE95ZZBGF8SifRm7YvhdDsTmiSc6DozqaXAvxXUVxqFno9V7TybcUzO3JmHNYIOGT81C3Sh6AD18z35MuTsb4zatDe3H+UPUDBg+lq4EAy6Tz1WmQd1WXBYv+n8qT19Gzt4tRzdKKcEt1nX9mwavau+1g+GUFfc2i2eLx5ybQROD5zGCc5kPYhk0c6wdtyP6N9PzBnHACHRUp4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bmhzCo3pcq1pkmxs4gFHajiwKAuMszU8xV9/vawDkWWexVATJSC7mlO4AdkQehcQe9+1qmCqvrOsCOqLKp8f3PwLXBzJaQtyAQSucYuadGH8tVSvDWJjJ3zgoXWROB73H+MR30ZCi/jfBdnlGsAXanLkEoAqN/G3qstusYHvECfKHhZAAqM/1aCsRiMKEl1FM/W72evLW6msJQ3K4xqLWbjek9HLWzSjg9qA5c7rr1N6oenDXEVq8au5qGgW7mA6WsZ7w5sPKCkNNKcqvQvBLc8SBK4j0g/nvKHpD7Ac0MC9l+gRs7q6jDGYberRibZbdNkaL7EBwnhMprWf8Lm6aWg9oQL/6szxxZye12GgZU9aMqqB8s/xhlDFwDGSeGnPhn4tM54TObhKX4Ui18TQ2vgsBJygLff4XtOToLxeZTwR01uDGB6eretFpGvstv4o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:30.9836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5428267-90e2-43fa-bf2c-08dead1704de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7232

Coccinelle (scripts/coccinelle/api/string_choices.cocci) flags an
opportunity to replace the open-coded ternary expression in the probe
dev_info() call:
  k3-ringacc.c:1439:3-32: opportunity for
  str_enabled_disabled(ringacc->dma_ring_reset_quirk)

Replace the ternary with str_enabled_disabled() and add the required
include for <linux/string_choices.h>.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/k3-ringacc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 7602b8a909b0..ec4207d98dca 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <linux/sys_soc.h>
 #include <linux/dma/ti-cppi5.h>
 #include <linux/soc/ti/k3-ringacc.h>
@@ -1436,7 +1437,7 @@ static int k3_ringacc_init(struct platform_device *pdev,
 		 ringacc->rm_gp_range->desc[0].num,
 		 ringacc->tisci_dev_id);
 	dev_info(dev, "dma-ring-reset-quirk: %s\n",
-		 ringacc->dma_ring_reset_quirk ? "enabled" : "disabled");
+		 str_enabled_disabled(ringacc->dma_ring_reset_quirk));
 	dev_info(dev, "RA Proxy rev. %08x, num_proxies:%u\n",
 		 readl(&ringacc->proxy_gcfg->revision), ringacc->num_proxies);
 
-- 
2.47.0

