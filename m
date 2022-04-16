Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178CA20E0
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 02:08:01 +0000 (UTC)
X-UUID: 43dac50f27d74caf96eb6b02119673f7-20220416
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:a71626e9-134e-4ccc-b2f7-d4dcf4cea565,OB:30,L
	OB:40,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
	CTION:release,TS:95
X-CID-INFO: VERSION:1.1.4,REQID:a71626e9-134e-4ccc-b2f7-d4dcf4cea565,OB:30,LOB
	:40,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
	CTION:quarantine,TS:95
X-CID-META: VersionHash:faefae9,CLOUDID:6625e9ef-da02-41b4-b6df-58f4ccd36682,C
	OID:09e58eb8c3c3,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:0,EDM:-3,Fi
	le:nil,QS:0,BEC:nil
X-UUID: 43dac50f27d74caf96eb6b02119673f7-20220416
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1591580946; Sat, 16 Apr 2022 10:07:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Apr 2022 10:07:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Apr 2022 10:07:54 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v17 08/21] soc: mediatek: add mtk-mutex support for mt8195 vdosys1
Date: Sat, 16 Apr 2022 10:07:36 +0800
Message-ID: <20220416020749.29010-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220416020749.29010-1-nancy.lin@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Add mtk-mutex support for mt8195 vdosys1.
The vdosys1 path component contains ovl_adaptor, merge5,
and dp_intf1. Ovl_adaptor is composed of several sub-elements
which include MDP_RDMA0~7, MERGE0~3, and ETHDR.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 9184684baf1d..f332037dbe5e 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -113,6 +113,24 @@
 #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
 #define MT8195_MUTEX_MOD_DISP_PWM0		27
 
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA0	0
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA1	1
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA2	2
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA3	3
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA4	4
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA5	5
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA6	6
+#define MT8195_MUTEX_MOD_DISP1_MDP_RDMA7	7
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE0	8
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE1	9
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE2	10
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE3	11
+#define MT8195_MUTEX_MOD_DISP1_VPP_MERGE4	12
+#define MT8195_MUTEX_MOD_DISP1_DISP_MIXER	18
+#define MT8195_MUTEX_MOD_DISP1_DPI0		25
+#define MT8195_MUTEX_MOD_DISP1_DPI1		26
+#define MT8195_MUTEX_MOD_DISP1_DP_INTF0		27
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		10
 #define MT2712_MUTEX_MOD_DISP_OVL0		11
 #define MT2712_MUTEX_MOD_DISP_OVL1		12
@@ -316,6 +334,21 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
 	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
 	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
+	[DDP_COMPONENT_MDP_RDMA0] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA0,
+	[DDP_COMPONENT_MDP_RDMA1] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA1,
+	[DDP_COMPONENT_MDP_RDMA2] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA2,
+	[DDP_COMPONENT_MDP_RDMA3] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA3,
+	[DDP_COMPONENT_MDP_RDMA4] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA4,
+	[DDP_COMPONENT_MDP_RDMA5] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA5,
+	[DDP_COMPONENT_MDP_RDMA6] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA6,
+	[DDP_COMPONENT_MDP_RDMA7] = MT8195_MUTEX_MOD_DISP1_MDP_RDMA7,
+	[DDP_COMPONENT_MERGE1] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE0,
+	[DDP_COMPONENT_MERGE2] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE1,
+	[DDP_COMPONENT_MERGE3] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE2,
+	[DDP_COMPONENT_MERGE4] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE3,
+	[DDP_COMPONENT_ETHDR_MIXER] = MT8195_MUTEX_MOD_DISP1_DISP_MIXER,
+	[DDP_COMPONENT_MERGE5] = MT8195_MUTEX_MOD_DISP1_VPP_MERGE4,
+	[DDP_COMPONENT_DP_INTF1] = MT8195_MUTEX_MOD_DISP1_DP_INTF0,
 };
 
 static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
@@ -501,6 +534,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF0:
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -541,6 +577,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
 	case DDP_COMPONENT_DP_INTF0:
+	case DDP_COMPONENT_DP_INTF1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-- 
2.18.0

