Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDC20EA
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 02:08:02 +0000 (UTC)
X-UUID: 9bbacf26ce694e809598855114096374-20220416
X-UUID: 9bbacf26ce694e809598855114096374-20220416
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1687298438; Sat, 16 Apr 2022 10:07:55 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 16 Apr 2022 10:07:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 16 Apr
 2022 10:07:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Apr 2022 10:07:54 +0800
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
Subject: [PATCH v17 10/21] drm/mediatek: add display merge advance config API for MT8195
Date: Sat, 16 Apr 2022 10:07:38 +0800
Message-ID: <20220416020749.29010-11-nancy.lin@mediatek.com>
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

Add merge new advance config API. The original merge API is
mtk_ddp_comp_funcs function prototype. The API interface parameters
cannot be modified, so add a new config API for extension. This is
the preparation for ovl_adaptor merge control.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  3 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 52 ++++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index bb91518cdc93..53aa988dde3b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -63,6 +63,9 @@ void mtk_merge_config(struct device *dev, unsigned int width,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_merge_start(struct device *dev);
 void mtk_merge_stop(struct device *dev);
+void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
+			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
+			      struct cmdq_pkt *cmdq_pkt);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 45face638153..40da0555416d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -17,6 +17,7 @@
 #define DISP_REG_MERGE_CTRL		0x000
 #define MERGE_EN				1
 #define DISP_REG_MERGE_CFG_0		0x010
+#define DISP_REG_MERGE_CFG_1		0x014
 #define DISP_REG_MERGE_CFG_4		0x020
 #define DISP_REG_MERGE_CFG_10		0x038
 /* no swap */
@@ -25,9 +26,12 @@
 #define DISP_REG_MERGE_CFG_12		0x040
 #define CFG_10_10_1PI_2PO_BUF_MODE		6
 #define CFG_10_10_2PI_2PO_BUF_MODE		8
+#define CFG_11_10_1PI_2PO_MERGE			18
 #define FLD_CFG_MERGE_MODE			GENMASK(4, 0)
 #define DISP_REG_MERGE_CFG_24		0x070
 #define DISP_REG_MERGE_CFG_25		0x074
+#define DISP_REG_MERGE_CFG_26		0x078
+#define DISP_REG_MERGE_CFG_27		0x07c
 #define DISP_REG_MERGE_CFG_36		0x0a0
 #define ULTRA_EN				BIT(0)
 #define PREULTRA_EN				BIT(4)
@@ -98,12 +102,19 @@ static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
 void mtk_merge_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_merge_advance_config(dev, w, 0, h, vrefresh, bpc, cmdq_pkt);
+}
+
+void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
+			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
+			      struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 	unsigned int mode = CFG_10_10_1PI_2PO_BUF_MODE;
 
-	if (!h || !w) {
-		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, w, h);
+	if (!h || !l_w) {
+		dev_err(dev, "%s: input width(%d) or height(%d) is invalid\n", __func__, l_w, h);
 		return;
 	}
 
@@ -112,14 +123,41 @@ void mtk_merge_config(struct device *dev, unsigned int w,
 		mode = CFG_10_10_2PI_2PO_BUF_MODE;
 	}
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	if (r_w)
+		mode = CFG_11_10_1PI_2PO_MERGE;
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_0);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_1);
+	mtk_ddp_write(cmdq_pkt, h << 16 | (l_w + r_w), &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_4);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+	/*
+	 * DISP_REG_MERGE_CFG_24 is merge SRAM0 w/h
+	 * DISP_REG_MERGE_CFG_25 is merge SRAM1 w/h.
+	 * If r_w > 0, the merge is in merge mode (input0 and input1 merge together),
+	 * the input0 goes to SRAM0, and input1 goes to SRAM1.
+	 * If r_w = 0, the merge is in buffer mode, the input goes through SRAM0 and
+	 * then to SRAM1. Both SRAM0 and SRAM1 are set to the same size.
+	 */
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CFG_24);
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
-		      DISP_REG_MERGE_CFG_25);
+	if (r_w)
+		mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_CFG_25);
+	else
+		mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_CFG_25);
+
+	/*
+	 * DISP_REG_MERGE_CFG_26 and DISP_REG_MERGE_CFG_27 is only used in LR merge.
+	 * Only take effect when the merge is setting to merge mode.
+	 */
+	mtk_ddp_write(cmdq_pkt, h << 16 | l_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_26);
+	mtk_ddp_write(cmdq_pkt, h << 16 | r_w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CFG_27);
+
 	mtk_ddp_write_mask(cmdq_pkt, SWAP_MODE, &priv->cmdq_reg, priv->regs,
 			   DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
 	mtk_ddp_write_mask(cmdq_pkt, mode, &priv->cmdq_reg, priv->regs,
-- 
2.18.0

