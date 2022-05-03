Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59A2F2B
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 10:23:55 +0000 (UTC)
X-UUID: 42bd220ea44146b8855fb0379984936b-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:96624342-ad1c-4ccf-9895-87d23a75bc79,OB:20,L
	OB:30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
	CTION:release,TS:95
X-CID-INFO: VERSION:1.1.4,REQID:96624342-ad1c-4ccf-9895-87d23a75bc79,OB:20,LOB
	:30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
	CTION:quarantine,TS:95
X-CID-META: VersionHash:faefae9,CLOUDID:d81e892f-6199-437e-8ab4-9920b4bc5b76,C
	OID:ac73160afd15,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
	,QS:0,BEC:nil
X-UUID: 42bd220ea44146b8855fb0379984936b-20220503
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1106500954; Tue, 03 May 2022 18:23:48 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 3 May 2022 18:23:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 3 May 2022 18:23:47 +0800
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
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v19 06/25] soc: mediatek: add mtk_mmsys_write_reg API
Date: Tue, 3 May 2022 18:23:26 +0800
Message-ID: <20220503102345.22817-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503102345.22817-1-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Add mtk_mmsys_write_reg API. Simplify code for writing mmsys reg.
It is a preparation for adding support for mmsys config API.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 35 ++++++++++++++------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index ab3c5cbb0175..3e2e5e3f721d 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -191,22 +191,26 @@ static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
 	return -EINVAL;
 }
 
+static void mtk_mmsys_write_reg(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl_relaxed(mmsys->regs + offset);
+	tmp = (tmp & ~mask) | val;
+	writel_relaxed(tmp, mmsys->regs + offset);
+}
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
-	u32 reg;
 	int i;
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
-		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
-			reg = readl_relaxed(mmsys->regs + routes[i].addr);
-			reg &= ~routes[i].mask;
-			reg |= routes[i].val;
-			writel_relaxed(reg, mmsys->regs + routes[i].addr);
-		}
+		if (cur == routes[i].from_comp && next == routes[i].to_comp)
+			mtk_mmsys_write_reg(mmsys, routes[i].addr, routes[i].mask, routes[i].val);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -216,15 +220,11 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
-	u32 reg;
 	int i;
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
-		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
-			reg = readl_relaxed(mmsys->regs + routes[i].addr);
-			reg &= ~routes[i].mask;
-			writel_relaxed(reg, mmsys->regs + routes[i].addr);
-		}
+		if (cur == routes[i].from_comp && next == routes[i].to_comp)
+			mtk_mmsys_write_reg(mmsys, routes[i].addr, routes[i].mask, 0);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
@@ -233,18 +233,13 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 {
 	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
 	unsigned long flags;
-	u32 reg;
 
 	spin_lock_irqsave(&mmsys->lock, flags);
 
-	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
-
 	if (assert)
-		reg &= ~BIT(id);
+		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0);
 	else
-		reg |= BIT(id);
-
-	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
+		mtk_mmsys_write_reg(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id));
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
-- 
2.18.0

