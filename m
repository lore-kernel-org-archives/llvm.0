Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E845258E
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 10:44:42 +0000 (UTC)
X-UUID: 47660ae6932f11eda06fc9ecc4dadd91-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u9RwVsbxiH88W4NBLTIHh9MmronmEet2RcOmssQSSmg=;
	b=k+3NJDwVJLDf8a743KchAIdym4lx/UxvWyJQSklgmuWjIO1Uk0EJTPR2nJ+Y3jrczgi7CdStu4/yx5QS5+BaOykKwfOXPcnz+j0dAuhiBe/MRNfDkWxd7lOBozgZARX+zADXlD79LRvy9TU6et0nr6EC2/ML7HFDhvF+sQLaDaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:36f8c2ca-dbe8-455f-bde6-ac1a83293b52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:00562e8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 47660ae6932f11eda06fc9ecc4dadd91-20230113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2004289209; Fri, 13 Jan 2023 18:44:38 +0800
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
Subject: [PATCH v30 11/11] soc: mediatek: add mtk-mutex support for mt8195 vdosys1
Date: Fri, 13 Jan 2023 18:44:34 +0800
Message-ID: <20230113104434.28023-12-nancy.lin@mediatek.com>
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

Add mtk-mutex support for mt8195 vdosys1.
The vdosys1 path component contains ovl_adaptor, merge5,
and dp_intf1. Ovl_adaptor is composed of several sub-elements
which include MDP_RDMA0~7, MERGE0~3, and ETHDR.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index e2d04f1a231e..c5b1b42303ac 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -145,6 +145,24 @@
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
 #define MT8365_MUTEX_MOD_DISP_OVL0		7
 #define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
 #define MT8365_MUTEX_MOD_DISP_RDMA0		9
@@ -408,6 +426,21 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
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
 
 static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
-- 
2.18.0

