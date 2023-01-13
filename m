Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2C0259A
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 10:44:45 +0000 (UTC)
X-UUID: 46c3626e932f11eda06fc9ecc4dadd91-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yA70gQkZA8ZhnNLE0Yb7MSdy61hnh9QJuTLwvtbmBqI=;
	b=PH5FSdN0q7uRft/QjIGRb7I7zPxaegJlM5vZodGseRoK6/gHeoaxE7Sv48GcBRaqsvm/BlYcNXap2TXlaIJgjPyR6Dbsn4jIMX68R/4+Ym+z2eCos53MclQCwCxvHewV7GVlIwDuP1pwtQwoB0J48z4R3Yd7onJ8sDu8/NQM0Ho=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:edd22c36-3acc-4879-af30-2dd9bd22867f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:942cbdf5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 46c3626e932f11eda06fc9ecc4dadd91-20230113
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1107834135; Fri, 13 Jan 2023 18:44:37 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 18:44:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 18:44:36 +0800
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
Subject: [PATCH v30 04/11] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
Date: Fri, 13 Jan 2023 18:44:27 +0800
Message-ID: <20230113104434.28023-5-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113104434.28023-1-nancy.lin@mediatek.com>
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Add mt8195 vdosys1 routing table to the driver data of mtk-mmsys.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h | 139 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  10 ++
 2 files changed, 149 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index abfe94a30248..fd7b455bd675 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -75,6 +75,70 @@
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
 #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
 
+#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
+#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			1
+
+#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
+#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			1
+
+#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
+#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT			0
+
+#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
+#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		0
+
+#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
+#define MT8195_MERGE4_SOUT_TO_DPI1_SEL					2
+#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL				3
+
+#define MT8195_VDO1_MIXER_IN1_SEL_IN				0xf24
+#define MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN2_SEL_IN				0xf28
+#define MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN3_SEL_IN				0xf2c
+#define MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN4_SEL_IN				0xf30
+#define MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT			1
+
+#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
+#define MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL				1
+
+#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
+#define MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			1
+
+#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
+#define MT8195_SOUT_TO_MIXER_IN1_SEL					1
+
+#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
+#define MT8195_SOUT_TO_MIXER_IN2_SEL					1
+
+#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
+#define MT8195_SOUT_TO_MIXER_IN3_SEL					1
+
+#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
+#define MT8195_SOUT_TO_MIXER_IN4_SEL					1
+
+#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				0xf50
+#define MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT			1
+
+#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
+#define MT8195_MIXER_IN1_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				0xf5c
+#define MT8195_MIXER_IN2_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				0xf60
+#define MT8195_MIXER_IN3_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				0xf64
+#define MT8195_MIXER_IN4_SOUT_TO_DISP_MIXER				0
+
+#define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
+#define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
@@ -367,4 +431,79 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	}
 };
 
+static const struct mtk_mmsys_routes mmsys_mt8195_vdo1_routing_table[] = {
+	{
+		DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1,
+		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	}, {
+		DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1,
+		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	}, {
+		DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2,
+		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	}, {
+		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN1_SEL
+	}, {
+		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN2_SEL
+	}, {
+		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN3_SEL
+	}, {
+		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN4_SEL
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
+		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	}, {
+		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
+		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
+		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
+		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
+		MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8195_MERGE4_SOUT_TO_DPI1_SEL
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
+		MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL
+	}
+};
 #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 38f1dd92e7c6..e75ac7f5aa3c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -88,6 +88,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.clk_driver = "clk-mt8195-vdo1",
+	.routes = mmsys_mt8195_vdo1_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
@@ -323,6 +329,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vdosys1",
+		.data = &mt8195_vdosys1_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
 		.data = &mt8365_mmsys_driver_data,
-- 
2.18.0

