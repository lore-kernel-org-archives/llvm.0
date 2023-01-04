Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC579CD
	for <llvm@lists.linux.dev>; Wed,  4 Jan 2023 13:42:00 +0000 (UTC)
X-UUID: fff458945ad545f789541fde3ce785f1-20230104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PKSj9iSpwxdHQwd1QdXwFI9qKTo6Er4DC6wWU11sT7A=;
	b=n4UMFACO50TydKLIi/8URwSvuLh6nARUs7cKQUdYLv1CUR2/yD4LH6gRvLb5+k0TDoDXe3ENmPHXHM3gYJ7uBrUAzWUwaUE1YyCsSiLZJD0/0jMOWwVhe39Kx9090QEXbrVMD5PqVt+HLnwZI2n6S5trEh6lqfwvtH1ND9Bkf7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:572fb38e-dbc5-49d8-a4ae-c8a5a15291ea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.16,REQID:572fb38e-dbc5-49d8-a4ae-c8a5a15291ea,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:09771b1,CLOUDID:9008cbf4-ff42-4fb0-b929-626456a83c14,B
	ulkID:230104212650WPMX5RTL,BulkQuantity:1,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-BVR: 0
X-UUID: fff458945ad545f789541fde3ce785f1-20230104
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 422348337; Wed, 04 Jan 2023 21:26:49 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 4 Jan 2023 21:26:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 4 Jan 2023 21:26:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v6 2/3] phy: core: add debugfs root
Date: Wed, 4 Jan 2023 21:26:45 +0800
Message-ID: <20230104132646.7100-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
References: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add a debugfs root for phy class, then phy drivers can add debugfs files
under this folder.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v6: no changes
---
 drivers/phy/phy-core.c  | 6 ++++++
 include/linux/phy/phy.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index d93ddf1262c5..2f9f69190519 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -1204,6 +1205,9 @@ void devm_of_phy_provider_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_provider_unregister);
 
+struct dentry *phy_debug_root;
+EXPORT_SYMBOL_GPL(phy_debug_root);
+
 /**
  * phy_release() - release the phy
  * @dev: the dev member within phy
@@ -1233,6 +1237,8 @@ static int __init phy_core_init(void)
 
 	phy_class->dev_release = phy_release;
 
+	phy_debug_root = debugfs_create_dir("phy", NULL);
+
 	return 0;
 }
 device_initcall(phy_core_init);
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index b1413757fcc3..c398749d49b9 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -205,6 +205,8 @@ struct phy_lookup {
 #define devm_of_phy_provider_register_full(dev, children, xlate) \
 	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
 
+extern struct dentry *phy_debug_root;
+
 static inline void phy_set_drvdata(struct phy *phy, void *data)
 {
 	dev_set_drvdata(&phy->dev, data);
-- 
2.18.0

