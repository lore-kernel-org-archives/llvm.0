Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8F3E172F
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605594; cv=fail; b=iXygk5zEBueVdzCx4r2VkERm+PbmL8CXawekIKEmL3gTaYxwKVN4hgnQpVVmuzLjY1QVyvkps0HzWnfuxSC1uWAyOaMCcqfzZwiFnfPPU1OyFCXkGrjQaqdbL7MW4h3ESFfTis/NvlNF7LdQkHbQJvXzO7FdjY0U+nwuEwtSm9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605594; c=relaxed/simple;
	bh=47ynvYiDHe5DwEIbbgZuF+w75fSu1dH925qbxC42TDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jelvQPWmJyGf51GJ/iiSzJzUo4TUsAz9nuFXgIZ3z3auX7aGoBLFXCo1nZTfOu6A4Yjpx7HeTJup/nGhL3bgBclqHnJSbrqPXKnoSuO9UD9y7FecrcvGbcPGJgR9UHjpDYGKwcVwG0rvsL/zT4MWSHEUadv0wtW2rXWdiPWPatY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QxDGc7i5; arc=fail smtp.client-ip=40.107.209.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QxDGc7i5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr5LVXrhHK/hxFcJE7x/iTUFZl6PmDm78TdJ1rfCTmu8HWx15Czgzrkhp1GRV3TBNCHzqBOQZg1JiL+Wa8rHL7//Vx3/80BZ2MWunCuhdtGWH4MOVx+ep7hqBtfaLbxCbnGVBPO+uFBdXoZUVd8CrIl1YCtUP09HOZxBjyI8nKVOW+vYGvfUjwZpr+pxb/dN9jIhUfJqxO/YaWe+8IWzWTkwQ7Pkh8bpL8W/ZPVqBGgP3fUaOIntpJ6T+NcKKcSfOUronCEiAYp1kAaAqJk0+OD4Ja+20pfUHild/QTGEzwzNmuCqufFe/VHHRQwKWjyM5z6VIIPhfjWTkQpbosjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tH1iSPUGcILJyJMLpmaUvCCX0dmGX7q3b3+fvsD9RQc=;
 b=JXMMJeEpKPIHsb0APAZoEOztdlWZQXg8oV/8o6edQv+SESXcaCLVTKB4LfXUg0tTedOytEyuLY33QMUAOrhr9COjwdFVWEum9xL0mmJvQwdpVLLKtaR93+YQbu1olSr5KnTnBQLBEv+x5AU5/uPkY9keAbxuwZ6DlGPndnezyQ5yyxipt1wYTBlohKNpgbvgL31C8KAHYp/l9h+pcytxIxQYLaprXpaCAlzuhdgmP/8O2OBUebTGYyoYffDCvQZVfBkNzBj08Tx3fFXafup1XuXI/wqtm5VL4ctdTgmo0/sTgtMEXsoNve1eAyMCp2SfW+eY2/LcXEVGaB+B0zLWkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tH1iSPUGcILJyJMLpmaUvCCX0dmGX7q3b3+fvsD9RQc=;
 b=QxDGc7i5Ag1W31QKeoFzSx7Gc/qWZcSVfwEmOW0Er191VF/zgSwLXtqoW1XyLWr2y12yjto+y9SPg069aKxtwIbZw8235log9hbjE+7WFG4iMwZkXsf6Q3V0UkF1Th4VnUhnbMZqcTPhMtiRUEwdoNtF/iCQtzVndayh9M68Lvc=
Received: from PH7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::22)
 by SA1PR10MB7789.namprd10.prod.outlook.com (2603:10b6:806:3ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:06:29 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::6d) by PH7P220CA0005.outlook.office365.com
 (2603:10b6:510:326::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 17:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Tue, 12 May 2026 17:06:28 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6PG12235143;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 06/11] soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
Date: Tue, 12 May 2026 12:06:18 -0500
Message-ID: <20260512170623.3174416-7-nm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SA1PR10MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 349b38a8-a93a-498c-5027-08deb048cef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	S6uyNvF/TbsjIBPcCCk9UOG5lAMqoFJ/ragGjN8Se/IW7F3J9CjTpA2IUEDB0Rh/5CfvfPwzY0iV7nnMFFjbhPy9URQi/eAevSZCNSCUKxwzfAUdGfGIcx/KkbE/pTJp1gBI1TXlBce4dO1tSwRJLjm1rYNeht3BGmmgTAsrahsOFnSIJCz8vqUSYDuXqzgFjO1ZT3dGRiuyq21HhxrphdVw94bUgEi0Lk1F16WEnXxM4926Z8LzK/i1OOyJ9ICt4ROHxi8N/eMlGbAgPzHXaKDBwacMNsUyZqy0RtCFw9O9u4hkyMAASSvg/42onBAaiMImBk38UGHyciK47ROIR/w/SYc+c+h6I9LYtOdOFgbWPDWWN4ps/cT93reFQwADRG36dlKyB6MsLBo1GWpX6Fdg598kb6M4j54+B+sX765r0gKxcJWI7p8Lu4fS2MHKx7bIq/PBw2kUuJyjH8L1Y0uLBQQVW1zhXPkS28VYpsY7uJWmdFhPVQeJtLd7AmaIpveTLNjF7OixLzzcBoVnCfguFhBPMjfAfEe3c9EtPD6FNALtvFTmwHBek2WNsRFeWSLjDGLi/Mf3QDUv4ngFZSs7Irk4JLrxR2WUtSBSbbQrx01Je0MuEeHmsOyDo/jZjX3O6HLHZGBbFh5uJ/tLBAkz2jFvK7b9+qRqR6pnVhG4M3ZsFlOMKAab/RU0JL9slsdiNDlJaVp/1tLCTYz3yGsxW5zRWMTB8ZIEBzeLPB8=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	em9eGbX3XOAA+8Mo6XPPicUnjC78wszM0rS9XSR6qgbuP7VEdQbA9GwjZZB1IaAMpNBhSyLmwc0QZTU1oOw+Jk6mYAeTbebN1oQ+cVJN3YsSo2rUYp73Bw6zpxcqQXU+UlC0DSJxEy7zz+Rwn0rjczKWn5MNypw6aTWhW3GpxpXSy41u2qwDnzHvghl3fXvhfL/S25eGewhhVK8cy4Fc1Yq4z1Cihk5xLR/ce0HByTMKW1T7AvonrK/lcVbSJfBJBIF7QtAM8pXWXQz3rBupkXDOETCyS0Xi43iT/RyA7CK/Wg4ONOcoLEOkvy415oHdiesO7oMPviZOz269RyRpBa0uQdgsZWDWuY1MaXi50Kb9ArwpDJYqEn4fpWNlPMS/GNyy21opBtfSzTX52QfUmI34qirEM2VjBeFzSEKMtd0vFr0uibTs8tfxSMBQOMTT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:28.8209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 349b38a8-a93a-498c-5027-08deb048cef5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7789

Fix several address-space and type annotation issues reported by sparse:

- Change pdsp->command from 'void __iomem *' to 'u32 __iomem *' to
  match the other union members (acc_command, qos_command); adjust
  the offset in knav_queue_load_pdsp() from +0x18 to +0x6 to
  preserve the 24-byte offset.
- Fix knav_queue_pdsp_wait() declaration: correct the parameter
  annotation from 'u32 * __iomem' (pointer-in-iomem-space) to
  'u32 __iomem *' (pointer-to-iomem); use 'unsigned int' for the
  timeout parameter instead of bare 'unsigned'; fix the continuation-
  line alignment.
- Use IOMEM_ERR_PTR() in knav_queue_map_reg() instead of ERR_PTR()
  when returning an error as void __iomem *.
- Annotate the firmware data array as 'const __be32 *' instead of
  'u32 *', as be32_to_cpu() requires __be32 input.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- pdsp->command from 'void __iomem *' to 'u32 __iomem *' based on
  Andrew's suggestion (it is a more accurate representation anyways).
- Fix ups in commit message

V1: https://lore.kernel.org/all/20260508153211.3688277-7-nm@ti.com/

 drivers/soc/ti/knav_qmss.h       |  2 +-
 drivers/soc/ti/knav_qmss_queue.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss.h b/drivers/soc/ti/knav_qmss.h
index 9325e8ce2e25..037dc1b36645 100644
--- a/drivers/soc/ti/knav_qmss.h
+++ b/drivers/soc/ti/knav_qmss.h
@@ -123,7 +123,7 @@ struct knav_pdsp_info {
 	const char					*name;
 	struct knav_reg_pdsp_regs  __iomem		*regs;
 	union {
-		void __iomem				*command;
+		u32 __iomem				*command;
 		struct knav_reg_acc_command __iomem	*acc_command;
 		u32 __iomem				*qos_command;
 	};
diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 50072e9dea37..a747a08115d3 100644
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
@@ -1578,9 +1578,9 @@ static int knav_queue_load_pdsp(struct knav_device *kdev,
 	dev_info(kdev->dev, "firmware file %s downloaded for PDSP\n",
 		 knav_acc_firmwares[i]);
 
-	writel_relaxed(pdsp->id + 1, pdsp->command + 0x18);
+	writel_relaxed(pdsp->id + 1, pdsp->command + 0x6);
 	/* download the firmware */
-	fwdata = (u32 *)fw->data;
+	fwdata = (const __be32 *)fw->data;
 	fwlen = (fw->size + sizeof(u32) - 1) / sizeof(u32);
 	for (i = 0; i < fwlen; i++)
 		writel_relaxed(be32_to_cpu(fwdata[i]), pdsp->iram + i);
-- 
2.47.0

