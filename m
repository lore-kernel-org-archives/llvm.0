Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B92F51
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:51:17 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id c12so4529939ede.3
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 15:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WTkj3AvcILSXwvlftWLdz4EYcukiu8gAWij+RfwHYgY=;
        b=FJAQll9JfZs5Q9guVFclr7sKp9lQz6eh8lWt4cdDot9P6jkylxPHWBg5z2FLTBZZCY
         Z03ama9yerVDDIzZhwchH4sQohl77c1gxBsEKG37u3y0fYdnCHdMBL4wHq8Jfgjkz89F
         XLu3RiWGJpw8/xGz1fkaOdkAiE7MQBDuK2w5pFzjj7lcYn3IvPkIsc6JZ9zvh/sAk/Gx
         R7SoNhQ6cERth+MYN7s0T0ToE6zw9c7aLaSrDVeOyFqKDmtA0gmU/sdITK1eeTxT3cbP
         3HVe1P0HTUpwhHxNSAKSThl7XwkMK0gig13gE5TW7bQV0vy2+pGbl6nhT62Kz79IhrV7
         2fsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WTkj3AvcILSXwvlftWLdz4EYcukiu8gAWij+RfwHYgY=;
        b=cRJQDwoAkqnkKUprGduDfkI8t6KYKqbMqynbe1TCMBv+w9WP7ZIpGLLNZgPix7W/Ke
         KKRd51WvDM6qHuwkr7ZkhmHhlNj0pgouTORS1AXqUfrgWeJRajQO7RS9hdxVT+Ibhsv0
         soL2XaG9h63hVc4nVdALkJqKiAJcdKfIVYmN8d4iok1A1KyOfckM3Yz0ZJbkq/RFA9EA
         hQfQaR7KTH6KKlFKK1/iZE9xgh+ZNSDSb4C1Z98LHxQaomC4hf+NEieeJpU+Q+5fFu7D
         3dvDqRj23XLpzyBWK8rxBdsnfxDDs05YLv8i+b0ucgMPuG63QTlATlM/Usi91egDXUMh
         o5uw==
X-Gm-Message-State: AJIora/DmDmYmG5Up3FdUY2KUDzzp2EaV0GonUiAkTy66T8Wq1Ix/bmZ
	Or8BaaN3zLeegZbvJvpcHUc=
X-Google-Smtp-Source: AGRyM1tP4vsApb2hhFgycmK1gr6h+z1nEOn5SC38YdkOOyyuTbeITDE86S/v1SVEyC4xcVspxyALsg==
X-Received: by 2002:a05:6402:4315:b0:43a:d79e:117c with SMTP id m21-20020a056402431500b0043ad79e117cmr10542401edc.194.1658703077410;
        Sun, 24 Jul 2022 15:51:17 -0700 (PDT)
Received: from localhost.localdomain (93-42-69-122.ip85.fastwebnet.it. [93.42.69.122])
        by smtp.googlemail.com with ESMTPSA id nc19-20020a1709071c1300b00722d5b26ecesm4645238ejc.205.2022.07.24.15.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 15:51:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 11/14] net: dsa: qca8k: move port mirror functions to common code
Date: Sun, 24 Jul 2022 22:19:35 +0200
Message-Id: <20220724201938.17387-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220724201938.17387-1-ansuelsmth@gmail.com>
References: <20220724201938.17387-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The same port mirror functions are used by drivers based on qca8k family
switch. Move them to common code to make them accessible also by other
drivers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 93 ------------------------------
 drivers/net/dsa/qca/qca8k-common.c | 93 ++++++++++++++++++++++++++++++
 drivers/net/dsa/qca/qca8k.h        |  7 +++
 3 files changed, 100 insertions(+), 93 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index a322444e3ddf..b891ccc82f7e 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1687,99 +1687,6 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 	return ret;
 }
 
-static int
-qca8k_port_mirror_add(struct dsa_switch *ds, int port,
-		      struct dsa_mall_mirror_tc_entry *mirror,
-		      bool ingress, struct netlink_ext_ack *extack)
-{
-	struct qca8k_priv *priv = ds->priv;
-	int monitor_port, ret;
-	u32 reg, val;
-
-	/* Check for existent entry */
-	if ((ingress ? priv->mirror_rx : priv->mirror_tx) & BIT(port))
-		return -EEXIST;
-
-	ret = regmap_read(priv->regmap, QCA8K_REG_GLOBAL_FW_CTRL0, &val);
-	if (ret)
-		return ret;
-
-	/* QCA83xx can have only one port set to mirror mode.
-	 * Check that the correct port is requested and return error otherwise.
-	 * When no mirror port is set, the values is set to 0xF
-	 */
-	monitor_port = FIELD_GET(QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, val);
-	if (monitor_port != 0xF && monitor_port != mirror->to_local_port)
-		return -EEXIST;
-
-	/* Set the monitor port */
-	val = FIELD_PREP(QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM,
-			 mirror->to_local_port);
-	ret = regmap_update_bits(priv->regmap, QCA8K_REG_GLOBAL_FW_CTRL0,
-				 QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, val);
-	if (ret)
-		return ret;
-
-	if (ingress) {
-		reg = QCA8K_PORT_LOOKUP_CTRL(port);
-		val = QCA8K_PORT_LOOKUP_ING_MIRROR_EN;
-	} else {
-		reg = QCA8K_REG_PORT_HOL_CTRL1(port);
-		val = QCA8K_PORT_HOL_CTRL1_EG_MIRROR_EN;
-	}
-
-	ret = regmap_update_bits(priv->regmap, reg, val, val);
-	if (ret)
-		return ret;
-
-	/* Track mirror port for tx and rx to decide when the
-	 * mirror port has to be disabled.
-	 */
-	if (ingress)
-		priv->mirror_rx |= BIT(port);
-	else
-		priv->mirror_tx |= BIT(port);
-
-	return 0;
-}
-
-static void
-qca8k_port_mirror_del(struct dsa_switch *ds, int port,
-		      struct dsa_mall_mirror_tc_entry *mirror)
-{
-	struct qca8k_priv *priv = ds->priv;
-	u32 reg, val;
-	int ret;
-
-	if (mirror->ingress) {
-		reg = QCA8K_PORT_LOOKUP_CTRL(port);
-		val = QCA8K_PORT_LOOKUP_ING_MIRROR_EN;
-	} else {
-		reg = QCA8K_REG_PORT_HOL_CTRL1(port);
-		val = QCA8K_PORT_HOL_CTRL1_EG_MIRROR_EN;
-	}
-
-	ret = regmap_clear_bits(priv->regmap, reg, val);
-	if (ret)
-		goto err;
-
-	if (mirror->ingress)
-		priv->mirror_rx &= ~BIT(port);
-	else
-		priv->mirror_tx &= ~BIT(port);
-
-	/* No port set to send packet to mirror port. Disable mirror port */
-	if (!priv->mirror_rx && !priv->mirror_tx) {
-		val = FIELD_PREP(QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, 0xF);
-		ret = regmap_update_bits(priv->regmap, QCA8K_REG_GLOBAL_FW_CTRL0,
-					 QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, val);
-		if (ret)
-			goto err;
-	}
-err:
-	dev_err(priv->dev, "Failed to del mirror port from %d", port);
-}
-
 static int
 qca8k_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 			  struct netlink_ext_ack *extack)
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index 1b13bf1b5de7..91fb549f2d3f 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -766,3 +766,96 @@ qca8k_port_mdb_del(struct dsa_switch *ds, int port,
 
 	return qca8k_fdb_search_and_del(priv, BIT(port), addr, vid);
 }
+
+int
+qca8k_port_mirror_add(struct dsa_switch *ds, int port,
+		      struct dsa_mall_mirror_tc_entry *mirror,
+		      bool ingress, struct netlink_ext_ack *extack)
+{
+	struct qca8k_priv *priv = ds->priv;
+	int monitor_port, ret;
+	u32 reg, val;
+
+	/* Check for existent entry */
+	if ((ingress ? priv->mirror_rx : priv->mirror_tx) & BIT(port))
+		return -EEXIST;
+
+	ret = regmap_read(priv->regmap, QCA8K_REG_GLOBAL_FW_CTRL0, &val);
+	if (ret)
+		return ret;
+
+	/* QCA83xx can have only one port set to mirror mode.
+	 * Check that the correct port is requested and return error otherwise.
+	 * When no mirror port is set, the values is set to 0xF
+	 */
+	monitor_port = FIELD_GET(QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, val);
+	if (monitor_port != 0xF && monitor_port != mirror->to_local_port)
+		return -EEXIST;
+
+	/* Set the monitor port */
+	val = FIELD_PREP(QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM,
+			 mirror->to_local_port);
+	ret = regmap_update_bits(priv->regmap, QCA8K_REG_GLOBAL_FW_CTRL0,
+				 QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, val);
+	if (ret)
+		return ret;
+
+	if (ingress) {
+		reg = QCA8K_PORT_LOOKUP_CTRL(port);
+		val = QCA8K_PORT_LOOKUP_ING_MIRROR_EN;
+	} else {
+		reg = QCA8K_REG_PORT_HOL_CTRL1(port);
+		val = QCA8K_PORT_HOL_CTRL1_EG_MIRROR_EN;
+	}
+
+	ret = regmap_update_bits(priv->regmap, reg, val, val);
+	if (ret)
+		return ret;
+
+	/* Track mirror port for tx and rx to decide when the
+	 * mirror port has to be disabled.
+	 */
+	if (ingress)
+		priv->mirror_rx |= BIT(port);
+	else
+		priv->mirror_tx |= BIT(port);
+
+	return 0;
+}
+
+void
+qca8k_port_mirror_del(struct dsa_switch *ds, int port,
+		      struct dsa_mall_mirror_tc_entry *mirror)
+{
+	struct qca8k_priv *priv = ds->priv;
+	u32 reg, val;
+	int ret;
+
+	if (mirror->ingress) {
+		reg = QCA8K_PORT_LOOKUP_CTRL(port);
+		val = QCA8K_PORT_LOOKUP_ING_MIRROR_EN;
+	} else {
+		reg = QCA8K_REG_PORT_HOL_CTRL1(port);
+		val = QCA8K_PORT_HOL_CTRL1_EG_MIRROR_EN;
+	}
+
+	ret = regmap_clear_bits(priv->regmap, reg, val);
+	if (ret)
+		goto err;
+
+	if (mirror->ingress)
+		priv->mirror_rx &= ~BIT(port);
+	else
+		priv->mirror_tx &= ~BIT(port);
+
+	/* No port set to send packet to mirror port. Disable mirror port */
+	if (!priv->mirror_rx && !priv->mirror_tx) {
+		val = FIELD_PREP(QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, 0xF);
+		ret = regmap_update_bits(priv->regmap, QCA8K_REG_GLOBAL_FW_CTRL0,
+					 QCA8K_GLOBAL_FW_CTRL0_MIRROR_PORT_NUM, val);
+		if (ret)
+			goto err;
+	}
+err:
+	dev_err(priv->dev, "Failed to del mirror port from %d", port);
+}
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 9da7928de83c..3a2131b7abfa 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -494,4 +494,11 @@ int qca8k_port_mdb_del(struct dsa_switch *ds, int port,
 		       const struct switchdev_obj_port_mdb *mdb,
 		       struct dsa_db db);
 
+/* Common port mirror function */
+int qca8k_port_mirror_add(struct dsa_switch *ds, int port,
+			  struct dsa_mall_mirror_tc_entry *mirror,
+			  bool ingress, struct netlink_ext_ack *extack);
+void qca8k_port_mirror_del(struct dsa_switch *ds, int port,
+			   struct dsa_mall_mirror_tc_entry *mirror);
+
 #endif /* __QCA8K_H */
-- 
2.36.1

