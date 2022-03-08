Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE1D48AB
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 09:35:42 +0000 (UTC)
X-UUID: 172dc24cc1744261a8997aff41fb3e2f-20220308
X-UUID: 172dc24cc1744261a8997aff41fb3e2f-20220308
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 823372819; Tue, 08 Mar 2022 17:30:23 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 8 Mar 2022 17:30:21 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Mar
 2022 17:30:21 +0800
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
Subject: [RESEND v13 05/22] soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195 vdosys1
Date: Tue, 8 Mar 2022 17:30:01 +0800
Message-ID: <20220308093018.24189-6-nancy.lin@mediatek.com>
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

Add cmdq support for mtk-mmsys config API.
The mmsys config register settings need to take effect with the other
HW settings(like OVL_ADAPTOR...) at the same vblanking time.

If we use CPU to write the mmsys reg, we can't guarantee all the
settings can be written in the same vblanking time.
Cmdq is used for this purpose. We prepare all the related HW settings
in one cmdq packet. The first command in the packet is "wait stream done",
and then following with all the HW settings. After the cmdq packet is
flush to GCE HW. The GCE waits for the "stream done event" to coming
and then starts flushing all the HW settings. This can guarantee all
the settings flush in the same vblanking.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       | 27 +++++++++++++++++++++-----
 include/linux/soc/mediatek/mtk-mmsys.h |  6 +++++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 6dd68483012c..c686b17ca62f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -98,6 +98,7 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
+	struct cmdq_client_reg cmdq_base;
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
@@ -190,7 +191,7 @@ static const struct reset_control_ops mtk_mmsys_reset_ops = {
 };
 
 void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
-			  u32 id, u32 val)
+			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_config *mmsys_config = mmsys->data->config;
@@ -214,10 +215,19 @@ void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
 	mask = mmsys_config[i].mask;
 	reg_val = val << mmsys_config[i].shift;
 
-	tmp = readl(mmsys->regs + offset);
-
-	tmp = (tmp & ~mask) | reg_val;
-	writel(tmp, mmsys->regs + offset);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (cmdq_pkt && mmsys->cmdq_base.size) {
+		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+				    mmsys->cmdq_base.offset + offset, reg_val,
+				    mask);
+	} else {
+#endif
+		tmp = readl(mmsys->regs + offset);
+		tmp = (tmp & ~mask) | reg_val;
+		writel(tmp, mmsys->regs + offset);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	}
+#endif
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
 
@@ -253,6 +263,13 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	}
 
 	mmsys->data = of_device_get_match_data(&pdev->dev);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
+#endif
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index b2d2310d7e7a..3e998bfb795a 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -6,6 +6,10 @@
 #ifndef __MTK_MMSYS_H
 #define __MTK_MMSYS_H
 
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
 enum mtk_ddp_comp_id;
 struct device;
 
@@ -78,6 +82,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id next);
 
 void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
-			  u32 id, u32 val);
+			  u32 id, u32 val, struct cmdq_pkt *cmdq_pkt);
 
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0

