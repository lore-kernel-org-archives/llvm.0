Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2345029AD
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 10:44:45 +0000 (UTC)
X-UUID: 4734182e932f11eda06fc9ecc4dadd91-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wBMZWcluI0mb9Ysy8M9cMLosoCh4lNRVv9go/Nabg0w=;
	b=Bns2z+w923rIHv9VtEMii0yaqZXwJ1OUnyLjJ5XzqcPgJ6sbu8fSO/B/8nmt8oswvUwnVy6DqFqvnN/sYe4+fAvbF+s6ROYbA3aH6CPmZNOWR2IKtXodbSmBr52RuuZWWZZ7JKJeNI+fXDQjj3fZ2LWCayiOHNziV2eteXi48jk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:d21e03da-936a-4be8-8ef4-3a8ae365d29b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.17,REQID:d21e03da-936a-4be8-8ef4-3a8ae365d29b,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:543e81c,CLOUDID:01562e8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:2301131844397JRO381H,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0
X-UUID: 4734182e932f11eda06fc9ecc4dadd91-20230113
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 390674927; Fri, 13 Jan 2023 18:44:38 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 18:44:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 18:44:37 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu
	<ck.hu@mediatek.com>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan
 Lu <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Xinlei
 Lee <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v30 08/11] soc: mediatek: mmsys: add mmsys for support 64 reset bits
Date: Fri, 13 Jan 2023 18:44:31 +0800
Message-ID: <20230113104434.28023-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113104434.28023-1-nancy.lin@mediatek.com>
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

Add mmsys for support 64 reset bits. It is a preparation for MT8195
vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.

1. Add the number of reset bits in mmsys private data
2. move the whole "reset register code section" behind the
"get mmsys->data" code section for getting the num_resets in mmsys->data.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 40 +++++++++++++++++++++-----------
 drivers/soc/mediatek/mtk-mmsys.h |  1 +
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index a0a584f16405..32b17c56c44a 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -22,6 +22,8 @@
 #include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
+#define MMSYS_SW_RESET_PER_REG 32
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
 	.routes = mmsys_default_routing_table,
@@ -53,6 +55,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.routes = mmsys_default_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -60,6 +63,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.routes = mmsys_mt8183_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
@@ -67,6 +71,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.routes = mmsys_mt8186_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
@@ -80,6 +85,7 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.routes = mmsys_mt8192_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
 	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
+	.num_resets = 32,
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
@@ -229,13 +235,19 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
+	u32 offset;
+	u32 reg;
+
+	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
+	id = id % MMSYS_SW_RESET_PER_REG;
+	reg = mmsys->data->sw0_rst_offset + offset;
 
 	spin_lock_irqsave(&mmsys->lock, flags);
 
 	if (assert)
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0, NULL);
+		mtk_mmsys_update_bits(mmsys, reg, BIT(id), 0, NULL);
 	else
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id), NULL);
+		mtk_mmsys_update_bits(mmsys, reg, BIT(id), BIT(id), NULL);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -290,20 +302,22 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	spin_lock_init(&mmsys->lock);
+	mmsys->data = of_device_get_match_data(&pdev->dev);
 
-	mmsys->rcdev.owner = THIS_MODULE;
-	mmsys->rcdev.nr_resets = 32;
-	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
-	mmsys->rcdev.of_node = pdev->dev.of_node;
-	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
-	if (ret) {
-		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
-		return ret;
+	if (mmsys->data->num_resets > 0) {
+		spin_lock_init(&mmsys->lock);
+
+		mmsys->rcdev.owner = THIS_MODULE;
+		mmsys->rcdev.nr_resets = mmsys->data->num_resets;
+		mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
+		mmsys->rcdev.of_node = pdev->dev.of_node;
+		ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
+			return ret;
+		}
 	}
 
-	mmsys->data = of_device_get_match_data(&pdev->dev);
-
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
 	if (ret)
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 77f37f8c715b..e19994749adb 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -91,6 +91,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	const u32 num_resets;
 };
 
 /*
-- 
2.18.0

