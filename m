Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39274A139D
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018035; cv=none; b=c4Vh4/mojkJHOE4PQXIKJt3ssv0oBK752y6J01lbtgrbi40vIhOtKJUBn8frpRIoxspP+83u8bbfUlzS7miCFW2SRHFJ3OI57vXVBfg9m+nHiQQDS2BE7jxjoWKHfHhmj3bckaT/g9f2BKKKI17EQN4fBBKs7CAYoEAqwzjcEI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018035; c=relaxed/simple;
	bh=8O2w84sf3k9UsdHFrkiTPC0ZIKeE7XAkdAh1ZSc348c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2VOSmtIpOumjAYlBHtYCp9LTU/1hQKZxkK1r53/8gcS8MDJYaiFz13+wneIF2HrMdCESh7AphinIiG5KSvno3Cy7b1PHH0R1gXwIWlo1nKxmge8Hs1ZAFZXIXvcFNVnEu2urR3S1ZxdWuZgXGqsbCz3my6Sq8Mr97KKZnzBOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKi+XJ+1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKi+XJ+1"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso7937497a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018019; x=1781622819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKAHZBj8Q4+vRNpcM7hRX5sDNhQM8RLIVJoZZt90zy8=;
        b=ZKi+XJ+1pX1j3fnyhk+scheAcWyfBvL/wsTmdfbS+lllLZNc2ZNDkPSuP8UZAu38zw
         QpDdnuwFfenYJ+W8AXoG+lt/+hB/9cxY+8lO4fyNlFOcF+ROWyDq4iAH7SoLn0j3I7tV
         SpijOvM/kqlcXERlFpSaRTMJ+m+y5h13b3B13/Wp1kpTO8ZIAHCmXB+4EknfyfsR1btl
         1ZmfMkTCZo9RYs9UO9Cfac50bzsccWWB1eWAJp1wcLpjULKLrswKzv9RqjEFbSX/0f3x
         lcBWqSSwJBpFu4IkJNcw1hNWFqJ1aI0wyY98H/+GyZmyTreHVkd/UAT68W5g4LYIR+O9
         qWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018019; x=1781622819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BKAHZBj8Q4+vRNpcM7hRX5sDNhQM8RLIVJoZZt90zy8=;
        b=hkremfS9pePqWvWjY0tD2+rCVt7ZgGA7s7xFDAifys+F5NB3UCuyfOa6orAmoWRh8U
         gFlokbEDdCFAIiiTYQghCoBnjRAy9cp/EFmFRoo/EQ8Cvctw28U2jAgPpZa1+hqBnIZP
         d7FAHVxjCghcUEe9orUh/O5kruOkcWZ+Pnc6UlQKt9IoPBJ9JDJOiqCW6yY+cj0K+BU5
         dsX0pq1qYoMyRyPpPpkdZcgo/CV6eRJzclnPr1GFSetsdH7ZAh/55C5hk29eutJFS3/e
         Zdh+wOlqDWGu+N2+dBZ4JYAnGI9Yieusrqf2FFBsenHugcouxzl2H+CoR6dHJ/eAM9xA
         kmcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JHYhXopssq4sraZHp5OeKJpiwXWYBmBLBEmpTH6sJre9EwKnvEsy0itAypTw45s1uRY+s@lists.linux.dev
X-Gm-Message-State: AOJu0YyV/IersAJKVm1ObsXMlrJMEguEzJmKgIXEaVYbK4Ei9zV5hZiK
	EmOQlWhu9gD9KlOKxogXtCAK6gQwboCeA4SvOoY4xQtcn0EnLPrI5XeZ
X-Gm-Gg: Acq92OEEo8m7kcCPVV3/tITkH8ftEs8IknozuhEAnC8FWb+YJwxXt42wEBrpSmQOVGr
	IYzXZczbQlBcwxbfhdg6wecgUAO78xG4aLYBt5fC2o7FNesN5LHOQz27k1aVFPVO6jt4rYy4RNf
	6xYuNnCSJJU63zSgUBECY8gVCeaopJSFkc9y5sF0pbVn/w4iDXBFNW9YUs4HnjFzezmLXNBAYLl
	+PMoNt7f+EzCaqpyRBN3dAlKdgS+TFwnEwA35pwiDO7yZOh187/q76iba1zg9I6vOVVL7fjCJ7z
	8viMvNJMBpKlNzK5h51m484CUd9OCyLifDgZup+CkcN5KIx0ZL9ENJByGKVFgXHZ7RipTVEySbK
	P2KI75YZD3lwqU8/jujLQ02yCuelyWTbbHhui5sdz9W6KdbEet8gVz53/Ys+L9E9WULav6r0aBP
	2sJ2rY3eIidHGbQdITO/J58ZgF86smixSg
X-Received: by 2002:a17:907:7289:b0:bf3:230c:4c64 with SMTP id a640c23a62f3a-bf371f52a44mr1059828766b.16.1781018018452;
        Tue, 09 Jun 2026 08:13:38 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 12/12] net: airoha: add phylink support
Date: Tue,  9 Jun 2026 17:12:08 +0200
Message-ID: <20260609151212.29469-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig       |   1 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 167 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 181 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index ad3ce501e7a5..38dcc76e5998 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -20,6 +20,7 @@ config NET_AIROHA
 	depends on NET_DSA || !NET_DSA
 	select NET_AIROHA_NPU
 	select PAGE_POOL
+	select PHYLINK
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  Airoha SoC family.
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..eabd7b058f82 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -8,6 +8,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
@@ -1779,6 +1780,15 @@ static int airoha_dev_open(struct net_device *netdev)
 	u32 cur_len, pse_port = FE_PSE_PORT_PPE1;
 	struct airoha_qdma *qdma = dev->qdma;
 
+	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
+	if (err) {
+		netdev_err(netdev, "%s: could not attach PHY: %d\n", __func__,
+			   err);
+		return err;
+	}
+
+	phylink_start(dev->phylink);
+
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
 	if (err)
@@ -1876,6 +1886,9 @@ static int airoha_dev_stop(struct net_device *netdev)
 		}
 	}
 
+	phylink_stop(dev->phylink);
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -3148,6 +3161,153 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
 	return false;
 }
 
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
+						  phylink_config);
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
+	u32 frag_size_tx, frag_size_rx;
+	u32 mask, val;
+
+	/* TX/RX frag is configured only for GDM4 */
+	if (port->id != 4)
+		return;
+
+	switch (speed) {
+	case SPEED_10000:
+	case SPEED_5000:
+		frag_size_tx = 8;
+		frag_size_rx = 8;
+		break;
+	case SPEED_2500:
+		frag_size_tx = 2;
+		frag_size_rx = 1;
+		break;
+	default:
+		frag_size_tx = 1;
+		frag_size_rx = 0;
+	}
+
+	/* Configure TX/RX frag based on speed */
+	if (dev->nbq == 1) {
+		mask = GDMA4_SGMII1_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII1_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}  else {
+		mask = GDMA4_SGMII0_TX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}
+	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, mask, val);
+
+	if (dev->nbq == 1) {
+		mask = GDMA4_SGMII1_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII1_RX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	} else {
+		mask = GDMA4_SGMII0_RX_FRAG_SIZE_MASK;
+		val = FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+				 frag_size_tx);
+	}
+	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, mask, val);
+}
+
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_config = airoha_mac_config,
+	.mac_link_up = airoha_mac_link_up,
+	.mac_link_down = airoha_mac_link_down,
+};
+
+static int airoha_fill_available_pcs(struct phylink_config *config,
+				     struct phylink_pcs **available_pcs,
+				     unsigned int num_available_pcs)
+{
+	struct device *dev = config->dev;
+
+	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+					&num_available_pcs);
+}
+
+static int airoha_setup_phylink(struct net_device *netdev)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct device_node *np = netdev->dev.of_node;
+	struct airoha_gdm_port *port = dev->port;
+	struct phylink_config *config;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&netdev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	config = &dev->phylink_config;
+
+	config->dev = &netdev->dev;
+	config->type = PHYLINK_NETDEV;
+	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |  MAC_10000FD;
+	if (port->id > AIROHA_GDM1_IDX)
+		config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000 |
+					    MAC_2500FD | MAC_5000FD;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&netdev->dev), NULL,
+				       &config->num_available_pcs);
+	if (err)
+		return err;
+
+	config->fill_available_pcs = airoha_fill_available_pcs;
+
+	/*
+	 * GDM1 only supports internal for Embedded Switch
+	 * and doesn't require a PCS.
+	 */
+	if (port->id == AIROHA_GDM1_IDX) {
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+	} else {
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_10GBASER,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_USXGMII,
+			  config->supported_interfaces);
+
+		phy_interface_copy(config->pcs_interfaces,
+				   config->supported_interfaces);
+	}
+
+	phylink = phylink_create(config, of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	dev->phylink = phylink;
+
+	return 0;
+}
+
 static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 				   struct airoha_gdm_port *port,
 				   int nbq, struct device_node *np)
@@ -3210,7 +3370,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3435,8 +3595,10 @@ static int airoha_probe(struct platform_device *pdev)
 				continue;
 
 			netdev = netdev_from_priv(dev);
-			if (netdev->reg_state == NETREG_REGISTERED)
+			if (netdev->reg_state == NETREG_REGISTERED) {
+				phylink_destroy(dev->phylink);
 				unregister_netdev(netdev);
+			}
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -3472,6 +3634,7 @@ static void airoha_remove(struct platform_device *pdev)
 				continue;
 
 			netdev = netdev_from_priv(dev);
+			phylink_destroy(dev->phylink);
 			unregister_netdev(netdev);
 			of_node_put(netdev->dev.of_node);
 		}
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8f42973f9cf5..1b25603dc64d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -554,6 +554,9 @@ struct airoha_gdm_dev {
 
 	u32 flags;
 	int nbq;
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 436f3c8779c1..27f2583e143a 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -358,6 +358,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_GDMA4_TMBI_FRAG		0x2028
+#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_GDMA4_RMBI_FRAG		0x202c
+#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.53.0

