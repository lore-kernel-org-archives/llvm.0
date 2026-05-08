Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951536F426
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254369; cv=fail; b=VKxbQRCpBSI2bfCtcTb098Ud/ynJe1fYkyTkh5mXAig5U0fdn7TM8zrSvWWQWfyr/S7lbJb4rzxkHBfLXPJFnyATzaGfjr1JdS72XmncRGHeJIP72QI/fdsL1XAHqWDjxd8Eos+GzTZD54eHxdKjAqOc0WEYpyCMO+U2QnbPA5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254369; c=relaxed/simple;
	bh=phHi5wBxQrUNpMjBV/BwQ9P1Yju560q6wWwX74YEHEk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmseDGKoDc4F4+gdrWAEC1Urn13TMSOGR3WLqzy4kIUSiQTVVZPo9mwj/nCXJwt8tMXXBMFBSqsRrGlvUU+b/sOAIvtiE8pgAS/LEzTnXq9MD/P6Sl0SAqxvGUZn88dr1P0oKX153agx7s3MwLIVVYBcXpVisf+APmc92b9lgh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I/mD2IBc; arc=fail smtp.client-ip=52.101.53.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I/mD2IBc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe6UKpNBjX7wu1dHe5nLNtjXsP4Cm1jS+6T7R/GEx6/K33LP6GPJTiMQf+K1/8Kw2joRAn1PeweUbCLI2vBRZpyO//wXViD3cSzwUadphx8FfsGmlx+CviLkDIMMuzFdRrYNU1IAyz4dcYZC24+u5nvlnCLUN3rhrcJkxbkQws264GiUByQkSRRvy7b5547+HiThfVYFVNBt+Dgb882+70D+junBU8Kz7AKKgWwfMU5/QAS4DP/Yl0rKjoa6PnUPyHxvK2e8yNAUA1rCiKzgYkI2EEAmHv1MO78DwVXaxqnU0WPk7Fxbz+wvSSmoXNCKoVB5w8V3oDqcx6M2CcBJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoMv+D7VWpR38dB0D5JTbuUZdPh1knyMVjnMT7rKW9U=;
 b=unDlEjDl5rfOClVnlDb35OBEcb3V7dz1Hl9uwyPFvWf/e2RyL7CnERFmaEaCTFJcmVZ4odqlcTLL92WicxPbqXatnTk0aytyI/53d00wj5d4VbK9aO07apQXWN9BRom5dVtf48avcj7c9iJ5y21KXUMCas9+CfPWAq8T4gN4T3uy5NZs01iUgc19bOhgvUJ5qkIHJojOm1jqKWfyTxCOpTEoCgaHqvohSPiDN/1msJU4FSPvEtX53K9p7qN5CbohN10Bw5KOw1+tPpUTVh+uVwdYU2ot/Csk7hyq+RVmDQP6ZEp5CPcKP3oko7VRBrqWJCpC7M/LUZDFaS+S2YTd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoMv+D7VWpR38dB0D5JTbuUZdPh1knyMVjnMT7rKW9U=;
 b=I/mD2IBc1kCMRFJaGPFH164AMj3azRjpWdNYQro51i9lwzXsBFCPHouN3kvPTxNad0TSGCPOACfjyw52diFzRQQPq0K9ciWXcIwb1A1IusiItgMZ5fhz+510aBks7aDfJmpP/p5Ty8KOp7jRN4oMHumbC6Qdz8CxaAX9RImM668=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by PH0PR10MB4614.namprd10.prod.outlook.com (2603:10b6:510:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:32:44 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::23) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 15:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:42 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:15 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEDg1647287;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 06/11] soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
Date: Fri, 8 May 2026 10:32:06 -0500
Message-ID: <20260508153211.3688277-7-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|PH0PR10MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b912e3-d98c-458a-cd50-08dead170bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P4PP+FvYFBjYM2zck8xqQY6wDvkzPzrge5UKGAO4Va7TO3m77t5rNKfpLBxOzLHyCdGK596Ht6KqJTaTZ04Y2l7GxJuuIjQulINwpuzv0L+EBAl5pEqaDazp49UquWF3Am5YXyarxIVHLP95RNOwmsJ83zsraeRLQ0ekYL2dCGz/a9d6VjLGM3j1asRXnwjw1q5R1QsSx7WlwQ7hDmmlvcimWJnuxxiY1C2k4JZR1BG/7CD/5pc1LPjgx+T/FYm91u1K5ge6KNBlpqSArT9K5lytn+bIGkXqt+5devHrljD2pAfvCpbKUXr3v6LERwq44NvKQy9ECcZNE33scLZIKM3+vN9Oe7wS1nY5NPzmcXK6KC97Dn6g05AOjQHRlt6GFAneYLFxnZ5s51QFv/4zlsKSqqPE9s9A/LMsNcCKGRkNMVogKI1bL0KR2HnGZvPGyd/ltAbI9MV7vrYWpjwE2RSeQeUDT8i6Rvx7bXHOryaSK+ouykFBa6SlLpR9BLhJi50JbPN0GNLOWUNTiIXyN9WG24pDX378XkpSfrUCDhe0jOa/mrq50y2/hKj1zV/EduWLq8sd8H+K1CKTEjn1/A3+splkj/8p7AQaW0I+I+RqzND6VTplQLDzqGKsp4gs4EjlDTqSqDmmTQvFIq5VmVmn77WxV0ffp4YH+COtvX5jnvjE26Oe1VA+SPprQZfIS8+6CO9B5azxdKKTw3CA3l1PzE9msjdvwqc5ZsM0Pks=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h9SPMzvsdoHIA91Tk3D1fwLI4PKEFyOHlf+8n3XKTVs6oiqZvQ5iQeSdgifk1LZUo7oojswDOo9Ndh+i0h0OmcnCB0yTvOL5+5MwrGOLKLQDRdD5kU9Qw+npA5tyqgozuutW3+43Y+veI9fD3/pfM+TPmoSoI+S7XJU1KuTOY336engrnTPY1l1D7uJzggi2kQFoTWkmm7vTSQwrgbUljVoYYTmGQcA04Eqj2fZnUDqLulnuJRGdZne+lsD42jBegc0XETCn9VtO0NDHwC92KBS8ntGWcYLZvyEPe0bXCrEgEnvRHPu4sqxD2WBp4P+ZMtqkMvPZ6qTC0Ej7a3bhwX8cRhNwr/SdMMmUS44IgwpbxDzNEQr5O3K+2BfJ+iFLBwFuY/EW7GxIx6s5cMc9yeqAdHPVtac314BDbnaBAV+O4BH4IBecKyD0UvWaMnqA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:42.4220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b912e3-d98c-458a-cd50-08dead170bb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4614

Fix several address-space and type annotation issues reported by sparse:

- Fix knav_queue_pdsp_wait() declaration: correct the parameter
  annotation from 'u32 * __iomem' (pointer-in-iomem-space) to
  'u32 __iomem *' (pointer-to-iomem); use 'unsigned int' for the
  timeout parameter instead of bare 'unsigned'; fix the continuation-
  line alignment. Cast the void __iomem * argument at the call site
  that passes pdsp->command.
- Use IOMEM_ERR_PTR() in knav_queue_map_reg() instead of ERR_PTR() when
  returning an error as void __iomem * to avoid 'different address
  spaces' warnings.
- Annotate the firmware data array as 'const __be32 *' instead of
  'u32 *', as be32_to_cpu() requires __be32 input.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 50072e9dea37..412b91344d20 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -477,8 +477,8 @@ static int knav_queue_debug_show(struct seq_file *s, void *v)
 
 DEFINE_SHOW_ATTRIBUTE(knav_queue_debug);
 
-static inline int knav_queue_pdsp_wait(u32 * __iomem addr, unsigned timeout,
-					u32 flags)
+static inline int knav_queue_pdsp_wait(u32 __iomem *addr, unsigned int timeout,
+				       u32 flags)
 {
 	unsigned long end;
 	u32 val = 0;
@@ -1368,7 +1368,7 @@ static void __iomem *knav_queue_map_reg(struct knav_device *kdev,
 	if (ret) {
 		dev_err(kdev->dev, "Can't translate of node(%pOFn) address for index(%d)\n",
 			node, index);
-		return ERR_PTR(ret);
+		return IOMEM_ERR_PTR(ret);
 	}
 
 	regs = devm_ioremap_resource(kdev->dev, &res);
@@ -1556,7 +1556,7 @@ static int knav_queue_load_pdsp(struct knav_device *kdev,
 	int i, ret, fwlen;
 	const struct firmware *fw;
 	bool found = false;
-	u32 *fwdata;
+	const __be32 *fwdata;
 
 	for (i = 0; i < ARRAY_SIZE(knav_acc_firmwares); i++) {
 		if (knav_acc_firmwares[i]) {
@@ -1580,7 +1580,7 @@ static int knav_queue_load_pdsp(struct knav_device *kdev,
 
 	writel_relaxed(pdsp->id + 1, pdsp->command + 0x18);
 	/* download the firmware */
-	fwdata = (u32 *)fw->data;
+	fwdata = (const __be32 *)fw->data;
 	fwlen = (fw->size + sizeof(u32) - 1) / sizeof(u32);
 	for (i = 0; i < fwlen; i++)
 		writel_relaxed(be32_to_cpu(fwdata[i]), pdsp->iram + i);
@@ -1610,7 +1610,7 @@ static int knav_queue_start_pdsp(struct knav_device *kdev,
 	writel_relaxed(val, &pdsp->regs->control);
 
 	/* wait for command register to clear */
-	ret = knav_queue_pdsp_wait(pdsp->command, timeout, 0);
+	ret = knav_queue_pdsp_wait((u32 __iomem *)pdsp->command, timeout, 0);
 	if (ret < 0) {
 		dev_err(kdev->dev,
 			"timed out on pdsp %s command register wait\n",
-- 
2.47.0

