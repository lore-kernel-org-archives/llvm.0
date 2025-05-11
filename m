Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0072609ED
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746994422; cv=none; b=Pk3KyOs71udxqQP+bf+v7almZbt936FqveUTFpxVb+Pw/hRZOyzmmR/f6whlaSJekm3yKrRKbElF3EvKxssD3Le5UtlICaLNElXy8YdtGOlK5UcZxFZHScPcXwza8j1Ewx7j70OTD//cxLa6oYBuknSZuFb52+Rt7yp6SEszT9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746994422; c=relaxed/simple;
	bh=G4Mq4+iIJBI5HfiwtS9iw6HEiPumCZ82bnVQShbfq74=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYUMRThGvRO2nvoK66i9++sPNrfD4V5ET6utjlncrMoDfgkapDXK5SMDG/CtK4muQq8jh5zEKmWglpjT8S9wTuPhZfXMUfJqVMCnJZ1Ut0RrIl7EZRTlbs5U7ySmuQTetSfkvRXt6F+WrE87q/7CVB7CnspCSQo4oOaED9JGLRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7vGajsP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7vGajsP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so41657885e9.3
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994419; x=1747599219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1ldMZzRY48MPhvy74auPiCjGXjOiQBSOuH+++XP3qw=;
        b=f7vGajsP4i8GhZKMC8kw0LkKyEWX7bAHtJhoGJ+s/jNvf+HD/g+Hvw49dgzMV4Kbwd
         Qqsek2fgWL2z8LyRfiGZnV7rSLlu3MHuCExKvCt0uP4N4WR+f7Dp6qgDWM9ZF3GCP/Ot
         cLmyBDn2FcBWgLPKxwnXuETZe2ZEAiAJPY/tgEWhs+hPPfbXgfY4Drdh1dKRF334so1G
         Um3ynr+HMBatBmva7jXyFgZlWjsQgqflA4ISMOwpLTEtTHoAWeiKtuyj/ypZxr1XKIvr
         5jOm06JSf8bxtNCBaUYzBqY0HjRJBF7wt9CrnUXNQ7NXxoOoUX9GzdfAtnv334zX8t4M
         j+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994419; x=1747599219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1ldMZzRY48MPhvy74auPiCjGXjOiQBSOuH+++XP3qw=;
        b=tbOgPsHL0lzHda6o6izH9X7vwqpuuvCkgc1FzJ9rtLKMV/rLYmOXdhhjf8Ox+dQlsq
         C9f51c8e1CZX8iE7T2DF7X5j/dF2hUPvma61dc96YZSkGthVQqm2XF3qrlCY2l0b5DRw
         YRe0LLN4tJ6vBwCrn0JkacuVQ++18akdYxTcyVcLDChBFzclGS8ee7rmdG98Y4LFi0xt
         m7mL9fwWkKqtlaKDn9xk23qdxFEf/Rkw68CbdZahG2+x4STcYywGK/nElUXyV4jK0ldG
         /lgdCpu2cQBpAsXbvF8bjEuDZyeIWoo9qvMsZkMzqqHHOJaVcJ9ZHdSYBCsEVKWJUseK
         UAPg==
X-Forwarded-Encrypted: i=1; AJvYcCX9KnP/540NehJD/Z4V3DucaVuQ4j3MyTJq9O4W9P9IFGEyLP+6b2Ijya16V0XTAeYqGyiZ@lists.linux.dev
X-Gm-Message-State: AOJu0YywnwOUTx0NdvcE6nh/mGPesWQQfM244BYrV3Zc4V5UC6NoeX3X
	5AsfGYYMrLoW78jJvaRJ6BNAOKBedvRtNLIkBGsfsaJZdQaMmxep
X-Gm-Gg: ASbGnct1VAMs+dNIHdWODUIokL+3PeJF4RUSZ2Fcpk/oVpSq8GVvF00aRCG/B++UmNR
	hF/pvSIdWHsmTCbPaS+aFoHRKzt8/+rl/CqeeYQ5EJvjjrr65ZdxLwKLSMHTuLzHloDikCKpdS/
	iULEw5+QYibFIrx4sJIwUXT0xHNHJAJvTSwqbhbYjrfGJyIUyBpkpSyn3cltD6ovkP2uW8slbAo
	PaPwRPgRN4vLRernS7pRSPXcPQ0X2Mq995XmsdSPDdWYAUnR5q4bhpRPSiaKTsE1gY7lgHLDZuB
	8b7PQtyW5q+5kp4m0A0Sw5stXR1RsCxU7ZiMi8Rx4xMrAnY6cyMRJVMvrnHLSUYZHoB7BG3gLrL
	5nvt9P5y1WiM69UPTnhh9
X-Google-Smtp-Source: AGHT+IHNcYZefBBPiSyJBDsYxacaSeQ7MB6Qh8KUtGFVA2lBNgxp/pOIFsfBehA+M1uENnSRnn+R9A==
X-Received: by 2002:a05:600c:3587:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-442d6dd216fmr83241275e9.27.1746994418629;
        Sun, 11 May 2025 13:13:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 11/11] net: airoha: add phylink support for GDM2/3/4
Date: Sun, 11 May 2025 22:12:37 +0200
Message-ID: <20250511201250.3789083-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250511201250.3789083-1-ansuelsmth@gmail.com>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink support for GDM2/3/4 port that require configuration of the
PCS to make the external PHY or attached SFP cage work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 155 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 3 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 16c7896f931f..3be1ae077a76 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -7,6 +7,7 @@
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
+#include <linux/pcs/pcs.h>
 #include <linux/u64_stats_sync.h>
 #include <net/dst_metadata.h>
 #include <net/page_pool/helpers.h>
@@ -79,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_port *port)
 	return port->id == 1;
 }
 
+static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
+{
+	return port->id != 1;
+}
+
 static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *addr)
 {
 	struct airoha_eth *eth = port->qdma->eth;
@@ -1613,6 +1619,17 @@ static int airoha_dev_open(struct net_device *dev)
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
 
+	if (airhoa_is_phy_external(port)) {
+		err = phylink_of_phy_connect(port->phylink, dev->dev.of_node, 0);
+		if (err) {
+			netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
+				   err);
+			return err;
+		}
+
+		phylink_start(port->phylink);
+	}
+
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
 	if (err)
@@ -1665,6 +1682,11 @@ static int airoha_dev_stop(struct net_device *dev)
 		}
 	}
 
+	if (airhoa_is_phy_external(port)) {
+		phylink_stop(port->phylink);
+		phylink_disconnect_phy(port->phylink);
+	}
+
 	return 0;
 }
 
@@ -2795,6 +2817,115 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 	return false;
 }
 
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_port *port = container_of(config, struct airoha_gdm_port,
+						    phylink_config);
+	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_eth *eth = qdma->eth;
+	u32 frag_size_tx, frag_size_rx;
+
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
+	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG,
+		      GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+		      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
+				 frag_size_tx));
+
+	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG,
+		      GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+		      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
+				 frag_size_rx));
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_link_up = airoha_mac_link_up,
+};
+
+static int airoha_setup_phylink(struct net_device *dev)
+{
+	struct airoha_gdm_port *port = netdev_priv(dev);
+	struct device_node *np = dev->dev.of_node;
+	struct phylink_pcs **available_pcs;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	unsigned int num_pcs;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&dev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	port->phylink_config.dev = &dev->dev;
+	port->phylink_config.type = PHYLINK_NETDEV;
+	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+						MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD |
+						MAC_5000FD | MAC_10000FD;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), NULL, &num_pcs);
+	if (err)
+		return err;
+
+	available_pcs = kcalloc(num_pcs, sizeof(*available_pcs), GFP_KERNEL);
+	if (!available_pcs)
+		return -ENOMEM;
+
+	err = fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_pcs,
+				       &num_pcs);
+	if (err)
+		goto out;
+
+	port->phylink_config.available_pcs = available_pcs;
+	port->phylink_config.num_available_pcs = num_pcs;
+
+	__set_bit(PHY_INTERFACE_MODE_SGMII,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+		  port->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_USXGMII,
+		  port->phylink_config.supported_interfaces);
+
+	phy_interface_copy(port->phylink_config.pcs_interfaces,
+			   port->phylink_config.supported_interfaces);
+
+	phylink = phylink_create(&port->phylink_config,
+				 of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink)) {
+		err = PTR_ERR(phylink);
+		goto out;
+	}
+
+	port->phylink = phylink;
+out:
+	kfree(available_pcs);
+
+	return err;
+}
+
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 				 struct device_node *np, int index)
 {
@@ -2873,7 +3004,23 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	if (err)
 		return err;
 
-	return register_netdev(dev);
+	if (airhoa_is_phy_external(port)) {
+		err = airoha_setup_phylink(dev);
+		if (err)
+			return err;
+	}
+
+	err = register_netdev(dev);
+	if (err)
+		goto free_phylink;
+
+	return 0;
+
+free_phylink:
+	if (airhoa_is_phy_external(port))
+		phylink_destroy(port->phylink);
+
+	return err;
 }
 
 static int airoha_probe(struct platform_device *pdev)
@@ -2967,6 +3114,9 @@ static int airoha_probe(struct platform_device *pdev)
 		struct airoha_gdm_port *port = eth->ports[i];
 
 		if (port && port->dev->reg_state == NETREG_REGISTERED) {
+			if (airhoa_is_phy_external(port))
+				phylink_destroy(port->phylink);
+
 			unregister_netdev(port->dev);
 			airoha_metadata_dst_free(port);
 		}
@@ -2994,6 +3144,9 @@ static void airoha_remove(struct platform_device *pdev)
 			continue;
 
 		airoha_dev_stop(port->dev);
+		if (airhoa_is_phy_external(port))
+			phylink_destroy(port->phylink);
+
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 53f39083a8b0..73a500474076 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -498,6 +498,9 @@ struct airoha_gdm_port {
 	struct net_device *dev;
 	int id;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index d931530fc96f..54f7079b28b0 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -357,6 +357,18 @@
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
2.48.1

