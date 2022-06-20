Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D61805
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 09:19:42 +0000 (UTC)
X-UUID: 0d51c9a777ba42bca683415d3eda64c8-20220620
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:affeb662-3c11-44ea-a4da-95473039bc39,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:7c1c882d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 0d51c9a777ba42bca683415d3eda64c8-20220620
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1844359160; Mon, 20 Jun 2022 17:19:34 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 17:19:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 20 Jun 2022 17:19:33 +0800
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
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v23 05/14] drm/mediatek: add display merge start/stop API for cmdq support
Date: Mon, 20 Jun 2022 17:19:21 +0800
Message-ID: <20220620091930.27797-6-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220620091930.27797-1-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Add merge start/stop API for cmdq support. The ovl_adaptor merges
are configured with each drm plane update. Need to enable/disable
merge with cmdq making sure all the settings taken effect in the
same vblank.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index e847e90f436d..33e61a136bbc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
 void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
 			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
 			      struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 40da0555416d..c7af5ccab916 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -67,17 +67,29 @@ struct mtk_disp_merge {
 };
 
 void mtk_merge_start(struct device *dev)
+{
+	mtk_merge_start_cmdq(dev, NULL);
+}
+
+void mtk_merge_stop(struct device *dev)
+{
+	mtk_merge_stop_cmdq(dev, NULL);
+}
+
+void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
-	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
+	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CTRL);
 }
 
-void mtk_merge_stop(struct device *dev)
+void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
-	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
+	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CTRL);
 }
 
 static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
-- 
2.18.0

