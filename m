Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83330437F
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 09:35:36 +0000 (UTC)
X-UUID: 6fc34068a5e94445a39106e44f0cbe7f-20220308
X-UUID: 6fc34068a5e94445a39106e44f0cbe7f-20220308
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 139928031; Tue, 08 Mar 2022 17:30:23 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 8 Mar 2022 17:30:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 17:30:20 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [RESEND v13 03/22] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
Date: Tue, 8 Mar 2022 17:29:59 +0800
Message-ID: <20220308093018.24189-4-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308093018.24189-1-nancy.lin@mediatek.com>
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Add mt8195 vdosys1 clock driver name and routing table to
the driver data of mtk-mmsys.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 136 +++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |  10 ++
 include/linux/soc/mediatek/mtk-mmsys.h |   2 +
 3 files changed, 148 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index 24a3afe23bc8..369fb0aab56d 100644
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
@@ -124,6 +188,78 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
 		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
 		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
+		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN1_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN2_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN3_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8195_SOUT_TO_MIXER_IN4_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
+		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
+		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
+		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
+		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	}, {
+		DDP_COMPONENT_OVL_ADAPTOR, DDP_COMPONENT_MERGE5,
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
 	}
 };
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index dc5c51f0ccc8..0b77624cf6ca 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -79,6 +79,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.clk_driver = "clk-mt8195-vdo1",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
@@ -271,6 +277,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
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
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 64c77c4a6c56..eaf7f7345519 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -18,6 +18,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_COLOR1,
 	DDP_COMPONENT_DITHER,
 	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
 	DDP_COMPONENT_DPI0,
 	DDP_COMPONENT_DPI1,
 	DDP_COMPONENT_DSC0,
@@ -39,6 +40,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_OVL_2L1,
 	DDP_COMPONENT_OVL_2L2,
+	DDP_COMPONENT_OVL_ADAPTOR,
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_POSTMASK0,
 	DDP_COMPONENT_PWM0,
-- 
2.18.0

