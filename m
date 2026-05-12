Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0243DB99A
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605603; cv=fail; b=rqYFjXCAoNu7H8p/E6CDhqgXrBIk0UJfigtqonKgUN9HhDWiMLc5qZ9qypfSoyEQMaqAV2KyKalRGHJlJg4nw8JrNH6EQXZttkl/yHDE3r06n846eMebJJrWWGvzzDcJO8ZqpHqgbwgxN3eVKgpZpHP7JwI4KgEmijvaMk9xbhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605603; c=relaxed/simple;
	bh=g3ErIfCEMYpexfjsem0V5hgjS29MYu7dYdOjIDAuT+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikpeX4I7eYkB0DoQ4cE0TEF84Iug7pHv72x07nwawM+HF7JMsZE9t7djoBPuPqQcQYv5m+94tIiTnhe2+70IOMe/Kz0RSlDvuk3DAALiz3+7/VtKR4GsE6UZENUpZsW3cSLlNPSexJcIqfGcFBHeBGfBRCMQRgu9UqBIkEWJpVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KVZnO0Ox; arc=fail smtp.client-ip=40.93.198.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KVZnO0Ox"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0VWhyvsm7xBjXP8SmlNf0sK6simpmbniBWjd1L+XYoB+GaupkquViT6xYfIqGvbVHMz6CNNl4AI7lQBfzJJMowDD8UTx9T4F/cgym2WNYncEod8S5P3lhA7WpEIViW4pkJD1OHVidaggrfBPPOMMRPAVjBXL5bYJcjC4/mlkpixKFx85nPzC4cO35oY2f1xNrVN5e6bk5HvMU4qKrNMctLsqedfZ0DuRzTmQvHp70Q0b6/ctnbhTkurPPXyUJvwL6QheLaL9dd+fEYe51aGD6kH72aDBM9FrLop4am99LbvsnmdEc+p4kFQbgGQ9iy+kckBs+ovAHBMzWHdQmwZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPg6qH4/S3jLwlwSseoHr7Ert6I777rtwCJZ38+hbj4=;
 b=RMAKGD1W7Gb6wIjiLQyd2nyiHhq1CCoL1zPd8WLUrN7z5wqNAr/iVtiSrz4zfkml9C4G5cLiEJhCOkIyHEHp9eOdcdUS18+QA9EVwoTv2QOLFV5K7MlkRaa6sYXppzYZ89BMZDYnT/j+Lgrp8QtdqG9k9VRPv2jSRUje26kG+uxmzcKxfkHbeX0F4/Bx+YV6GCiJW2lN2fdIEhupfygnuo/Yr3hzBl+rruqXWtTAfLLf6T7C0hkvc7cEbV0cgFzTysfskySW1UmzZUFleQfPiy5LTWmgpUaM1K7Ap9jGQb1OGSDLQan4bE5r1jTyE2CGk5JE5ruQBFl4Yv3FZZOnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPg6qH4/S3jLwlwSseoHr7Ert6I777rtwCJZ38+hbj4=;
 b=KVZnO0OxxwoGvfgGUH/P+RN//NXKZ/bVvoPFhMXep6CLL6TrKKBuQdISAjKI4XLbL3mxAwVztRLmTH4tusYLvDZL5RqSKuCQB9gT5etRrVPncmHDbFZwF6w/VnbLDVHguduj/biL3VWvPz7ahfu6UG5Fh52KHX+MAahbonZ3h4U=
Received: from DM6PR11CA0007.namprd11.prod.outlook.com (2603:10b6:5:190::20)
 by BLAPR10MB4962.namprd10.prod.outlook.com (2603:10b6:208:327::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 17:06:36 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::f4) by DM6PR11CA0007.outlook.office365.com
 (2603:10b6:5:190::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 17:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 17:06:35 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:26 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6QYK2235153;
	Tue, 12 May 2026 12:06:26 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 11/11] soc: ti: k3-ringacc: Use str_enabled_disabled() helper
Date: Tue, 12 May 2026 12:06:23 -0500
Message-ID: <20260512170623.3174416-12-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|BLAPR10MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ec5c37-281b-4e04-4baa-08deb048d2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A6CfGTaoJZpcRLZoVYqrL0DnlH69t6Ty4PC/hf6aqq4KU0r05JADDHeBnY9Mm2icLYKyPOfhM9xMRSHqYKhnBswT57ghk9jBglR9PSX9fEC0W1tVIhyN/lOhdrobZ9dXK++fCoNvA4SQLqUWpKu4SWaE91IT1dRzN2UZzJrIgZDGSSPOAZrDp/cPPXKplhd/yenOcGJX6q68Gh40TVyHHEHL7S1BuqZrQclrelzuPJa7iUESMgKqNAtri/bZ7c+d7LMOYljatRAdkOiheDBrhhIpn570NscDFzVNE9MYeFuL7bjERmJB0AM2gNqsD+ngexXOtojvtaXkTQQdW7fs87rfssUC4KjvDVxlh6SBsS0hYEtvHqUl8o7C+roLcYbHHC8gyM14EdCqoy0SsKtBAQGPXDTA5d3kQtnCM7lKMYf93XwpN/122gJr0ubEFVQPqT4ltjg7hftObWhVm/FI/gwWBm/Vr0/BhKOedNhqbCDIxsO5WrjZqbK5q5NidC2wyeGRSpyhGwjkyN5l5B0x1T1wjiULBK7SQsAQW/OuTRGjgXKZ7wEFKKgXzQhLdQUQ1EiEChrxVGdXmD1va8EzcwdWw3QS2sgEcvxT9m885/Lrtdm0GEC2Reb6nPWLa7dOrTZoNcpl662Jjqsca09X9IbiRq6gMMhpwxnWOcpPnwuc6CL7QzHhvEi1JcMShJrxUyYJd97OEmOHbtgsWnVOM3DatAaqSJYPu8845sNxWvU=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8QFMzHDbl4RV6VWHENS+xrz4VkqRhODDz+1NPPTQVAe1PEO1AaImKzGeCEPgS96hjdJV1IwR5JEjg9iSHy3A2Cm2MfgOxtC6KS6+fBrhPSN8HqLK76m7YnUXgHH7694dc3BcQBtXrgU4o4fT25C/qygmf4lSimSR8Dvfin2QMBItLgupxqVCyeXHScUdeQjqWu9FDxPZgHozdOBpAboaMGtoe4F4k1jrT1KBru8C3OUpmyEsoXfHb3cJAiT5tPC0ldbJL83FAcTcBRaFKpoU5NhB/FnkrZ1wzVN7evF9wXipB0M06HvjRIl8JzvE4xitGBGYv03M0WHrs8gRC2oqOaOlmsITvXQFgdq1lnd6NqMcWivTGJpfdLURz1B+XEnVyF8avw3K2LVlNaT1kiImL56k4QcZ7ZwZE7XpFes7bAxZgfGUJa8Q3WRQZ5C1B6ie
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:35.1075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ec5c37-281b-4e04-4baa-08deb048d2b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4962

Coccinelle (scripts/coccinelle/api/string_choices.cocci) flags an
opportunity to replace the open-coded ternary expression in the probe
dev_info() call:
  k3-ringacc.c:1439:3-32: opportunity for
  str_enabled_disabled(ringacc->dma_ring_reset_quirk)

Replace the ternary with str_enabled_disabled() and add the required
include for <linux/string_choices.h>.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- None.

V1: https://lore.kernel.org/all/20260508153211.3688277-12-nm@ti.com/

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

