Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D628A2588
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 10:44:42 +0000 (UTC)
X-UUID: 476462ae932f11eda06fc9ecc4dadd91-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=z5cLeruXdXmQZTZ2cEJEfaIEqOJa4DgkhVmXBYKKFU0=;
	b=dBe4cF/aNAyrB0GqFI98WiYLsdcDF38n4bCoqG5AK2sf0JnjYCXzFO2+ejkPLYCFu2wZsDNlBiOu5gVeQZH/u0K2xFu7QKbilasWrgSv54WRDI/ca7dN75Tb6DhjNIBUQIXg6F4emWYOiyWdqmW16Pzmyb7AghAAAgqo4PcUx+Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:678f6ef9-767d-41f4-a542-b10d8b83e063,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:922cbdf5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 476462ae932f11eda06fc9ecc4dadd91-20230113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 277576631; Fri, 13 Jan 2023 18:44:38 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 13 Jan 2023 18:44:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 18:44:37 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu
	<ck.hu@mediatek.com>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Nathan
 Lu" <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Xinlei
 Lee" <xinlei.lee@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v30 10/11] soc: mediatek: add mtk-mutex component - dp_intf1
Date: Fri, 13 Jan 2023 18:44:33 +0800
Message-ID: <20230113104434.28023-11-nancy.lin@mediatek.com>
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

Add mtk-mutex DDP_COMPONENT_DP_INTF1 component. The MT8195 vdosys1 path
component contains ovl_adaptor, merge5, and dp_intf1. It is a preparation
for adding support for MT8195 vdosys1 path component.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 582d4b04e353..e2d04f1a231e 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -653,6 +653,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DP_INTF0:
 		sof_id = MUTEX_SOF_DP_INTF0;
 		break;
+	case DDP_COMPONENT_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -693,6 +696,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
 	case DDP_COMPONENT_DP_INTF0:
+	case DDP_COMPONENT_DP_INTF1:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-- 
2.18.0

