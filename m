Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAF4A18
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:51:20 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id bp15so17538245ejb.6
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 15:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/kKNwD9Y1ZilUKIKf732DnHads/QgOfKwDOzUDWwjes=;
        b=bLaiFHmk+qIGI5+cKhzbR6IvYrS4spTjMjnPdTfMN9xCk67+jdGbVG0V2MrwNhO+5r
         +cNr0gQydHV2AMD0I6bliKaWdTLBE6dOOFCem4x97TpFxkBtLIq6R/xO/tT8nmJLUiS4
         OyQENN6UnpK09n+D8BgGeXI1tl1hzFN8oh4Nn/z/SejRpLnwf3ILJ6RAKY4ON/DB92rQ
         kNal5wKxvCzJzTWousqfBJGucIUnn9a0W5DPHdBQYjZB6olbg2lt1jTSKR6O53Nw0on5
         rcGlF6VAbl0mYr4K8o49sJL4KnNtefMY1AL/JyAasisc1rmbNBoTsFT+tXJL+6LtFKl1
         UO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/kKNwD9Y1ZilUKIKf732DnHads/QgOfKwDOzUDWwjes=;
        b=qXutIsBb9kG0m81rQ8qi7C5mbFWBGqraDk6dKoNdSdFgdoEqpZs0ND9XwUmyOgj3H6
         kVVQnBJZIOnslBrP05b2TGk7pBwhk90jrluHslmtZTqkvkSWNv28hbMMuK6gFxQPlMgc
         nUtFsf30VXZ4SIdL04alcrMZFYtn44loJNtC/2yWna5OsyOySXPDBvnCAh+DwC1DKb62
         q7gyIP3w61ll8c638StSmRbBDj6gX4D9SquRxQxf28O4WB3ALCR0fXjG6S74g0K2IQhz
         7MRBMaQqIlF3qmuVp24iNIzEp//uNaQLEJS/SkS4LvwJ6fb2O7Rbz6v0CUlObD54/JUV
         ebnw==
X-Gm-Message-State: AJIora/ShlxKLvHsDwcGU4dwEY9Q841tHSZp+VqXdJ+w6VR+YW9qQqig
	K4zx/P8sgr9Yck6Bey9EXBM=
X-Google-Smtp-Source: AGRyM1vOKOC0bmvUr02RgdE9cjPu85KoLbwXcdcuvDf4Rny7X/mJ5iWSk1W8vtckEFlf5JYvPq2LYA==
X-Received: by 2002:a17:907:1c0c:b0:72e:dd1f:a230 with SMTP id nc12-20020a1709071c0c00b0072edd1fa230mr7944713ejc.8.1658703078600;
        Sun, 24 Jul 2022 15:51:18 -0700 (PDT)
Received: from localhost.localdomain (93-42-69-122.ip85.fastwebnet.it. [93.42.69.122])
        by smtp.googlemail.com with ESMTPSA id nc19-20020a1709071c1300b00722d5b26ecesm4645238ejc.205.2022.07.24.15.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 15:51:18 -0700 (PDT)
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
Subject: [net-next PATCH v4 12/14] net: dsa: qca8k: move port VLAN functions to common code
Date: Sun, 24 Jul 2022 22:19:36 +0200
Message-Id: <20220724201938.17387-13-ansuelsmth@gmail.com>
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

The same port VLAN functions are used by drivers based on qca8k family
switch. Move them to common code to make them accessible also by other
drivers.
Also drop exposing busy_wait and make it static.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 181 ----------------------------
 drivers/net/dsa/qca/qca8k-common.c | 182 ++++++++++++++++++++++++++++-
 drivers/net/dsa/qca/qca8k.h        |  10 +-
 3 files changed, 190 insertions(+), 183 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index b891ccc82f7e..7e0e82d6f7cd 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -441,122 +441,6 @@ static struct regmap_config qca8k_regmap_config = {
 	.cache_type = REGCACHE_NONE, /* Explicitly disable CACHE */
 };
 
-static int
-qca8k_vlan_access(struct qca8k_priv *priv, enum qca8k_vlan_cmd cmd, u16 vid)
-{
-	u32 reg;
-	int ret;
-
-	/* Set the command and VLAN index */
-	reg = QCA8K_VTU_FUNC1_BUSY;
-	reg |= cmd;
-	reg |= FIELD_PREP(QCA8K_VTU_FUNC1_VID_MASK, vid);
-
-	/* Write the function register triggering the table access */
-	ret = qca8k_write(priv, QCA8K_REG_VTU_FUNC1, reg);
-	if (ret)
-		return ret;
-
-	/* wait for completion */
-	ret = qca8k_busy_wait(priv, QCA8K_REG_VTU_FUNC1, QCA8K_VTU_FUNC1_BUSY);
-	if (ret)
-		return ret;
-
-	/* Check for table full violation when adding an entry */
-	if (cmd == QCA8K_VLAN_LOAD) {
-		ret = qca8k_read(priv, QCA8K_REG_VTU_FUNC1, &reg);
-		if (ret < 0)
-			return ret;
-		if (reg & QCA8K_VTU_FUNC1_FULL)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static int
-qca8k_vlan_add(struct qca8k_priv *priv, u8 port, u16 vid, bool untagged)
-{
-	u32 reg;
-	int ret;
-
-	/*
-	   We do the right thing with VLAN 0 and treat it as untagged while
-	   preserving the tag on egress.
-	 */
-	if (vid == 0)
-		return 0;
-
-	mutex_lock(&priv->reg_mutex);
-	ret = qca8k_vlan_access(priv, QCA8K_VLAN_READ, vid);
-	if (ret < 0)
-		goto out;
-
-	ret = qca8k_read(priv, QCA8K_REG_VTU_FUNC0, &reg);
-	if (ret < 0)
-		goto out;
-	reg |= QCA8K_VTU_FUNC0_VALID | QCA8K_VTU_FUNC0_IVL_EN;
-	reg &= ~QCA8K_VTU_FUNC0_EG_MODE_PORT_MASK(port);
-	if (untagged)
-		reg |= QCA8K_VTU_FUNC0_EG_MODE_PORT_UNTAG(port);
-	else
-		reg |= QCA8K_VTU_FUNC0_EG_MODE_PORT_TAG(port);
-
-	ret = qca8k_write(priv, QCA8K_REG_VTU_FUNC0, reg);
-	if (ret)
-		goto out;
-	ret = qca8k_vlan_access(priv, QCA8K_VLAN_LOAD, vid);
-
-out:
-	mutex_unlock(&priv->reg_mutex);
-
-	return ret;
-}
-
-static int
-qca8k_vlan_del(struct qca8k_priv *priv, u8 port, u16 vid)
-{
-	u32 reg, mask;
-	int ret, i;
-	bool del;
-
-	mutex_lock(&priv->reg_mutex);
-	ret = qca8k_vlan_access(priv, QCA8K_VLAN_READ, vid);
-	if (ret < 0)
-		goto out;
-
-	ret = qca8k_read(priv, QCA8K_REG_VTU_FUNC0, &reg);
-	if (ret < 0)
-		goto out;
-	reg &= ~QCA8K_VTU_FUNC0_EG_MODE_PORT_MASK(port);
-	reg |= QCA8K_VTU_FUNC0_EG_MODE_PORT_NOT(port);
-
-	/* Check if we're the last member to be removed */
-	del = true;
-	for (i = 0; i < QCA8K_NUM_PORTS; i++) {
-		mask = QCA8K_VTU_FUNC0_EG_MODE_PORT_NOT(i);
-
-		if ((reg & mask) != mask) {
-			del = false;
-			break;
-		}
-	}
-
-	if (del) {
-		ret = qca8k_vlan_access(priv, QCA8K_VLAN_PURGE, vid);
-	} else {
-		ret = qca8k_write(priv, QCA8K_REG_VTU_FUNC0, reg);
-		if (ret)
-			goto out;
-		ret = qca8k_vlan_access(priv, QCA8K_VLAN_LOAD, vid);
-	}
-
-out:
-	mutex_unlock(&priv->reg_mutex);
-
-	return ret;
-}
-
 static int
 qca8k_phy_eth_busy_wait(struct qca8k_mgmt_eth_data *mgmt_eth_data,
 			struct sk_buff *read_skb, u32 *val)
@@ -1687,71 +1571,6 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 	return ret;
 }
 
-static int
-qca8k_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
-			  struct netlink_ext_ack *extack)
-{
-	struct qca8k_priv *priv = ds->priv;
-	int ret;
-
-	if (vlan_filtering) {
-		ret = qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(port),
-				QCA8K_PORT_LOOKUP_VLAN_MODE_MASK,
-				QCA8K_PORT_LOOKUP_VLAN_MODE_SECURE);
-	} else {
-		ret = qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(port),
-				QCA8K_PORT_LOOKUP_VLAN_MODE_MASK,
-				QCA8K_PORT_LOOKUP_VLAN_MODE_NONE);
-	}
-
-	return ret;
-}
-
-static int
-qca8k_port_vlan_add(struct dsa_switch *ds, int port,
-		    const struct switchdev_obj_port_vlan *vlan,
-		    struct netlink_ext_ack *extack)
-{
-	bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
-	bool pvid = vlan->flags & BRIDGE_VLAN_INFO_PVID;
-	struct qca8k_priv *priv = ds->priv;
-	int ret;
-
-	ret = qca8k_vlan_add(priv, port, vlan->vid, untagged);
-	if (ret) {
-		dev_err(priv->dev, "Failed to add VLAN to port %d (%d)", port, ret);
-		return ret;
-	}
-
-	if (pvid) {
-		ret = qca8k_rmw(priv, QCA8K_EGRESS_VLAN(port),
-				QCA8K_EGREES_VLAN_PORT_MASK(port),
-				QCA8K_EGREES_VLAN_PORT(port, vlan->vid));
-		if (ret)
-			return ret;
-
-		ret = qca8k_write(priv, QCA8K_REG_PORT_VLAN_CTRL0(port),
-				  QCA8K_PORT_VLAN_CVID(vlan->vid) |
-				  QCA8K_PORT_VLAN_SVID(vlan->vid));
-	}
-
-	return ret;
-}
-
-static int
-qca8k_port_vlan_del(struct dsa_switch *ds, int port,
-		    const struct switchdev_obj_port_vlan *vlan)
-{
-	struct qca8k_priv *priv = ds->priv;
-	int ret;
-
-	ret = qca8k_vlan_del(priv, port, vlan->vid);
-	if (ret)
-		dev_err(priv->dev, "Failed to delete VLAN from port %d (%d)", port, ret);
-
-	return ret;
-}
-
 static u32 qca8k_get_phy_flags(struct dsa_switch *ds, int port)
 {
 	struct qca8k_priv *priv = ds->priv;
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index 91fb549f2d3f..ed94f08014de 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -140,7 +140,7 @@ static int qca8k_bulk_write(struct qca8k_priv *priv, u32 reg, u32 *val, int len)
 	return 0;
 }
 
-int
+static int
 qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask)
 {
 	u32 val;
@@ -359,6 +359,121 @@ qca8k_fdb_search_and_del(struct qca8k_priv *priv, u8 port_mask,
 	return ret;
 }
 
+static int
+qca8k_vlan_access(struct qca8k_priv *priv, enum qca8k_vlan_cmd cmd, u16 vid)
+{
+	u32 reg;
+	int ret;
+
+	/* Set the command and VLAN index */
+	reg = QCA8K_VTU_FUNC1_BUSY;
+	reg |= cmd;
+	reg |= FIELD_PREP(QCA8K_VTU_FUNC1_VID_MASK, vid);
+
+	/* Write the function register triggering the table access */
+	ret = qca8k_write(priv, QCA8K_REG_VTU_FUNC1, reg);
+	if (ret)
+		return ret;
+
+	/* wait for completion */
+	ret = qca8k_busy_wait(priv, QCA8K_REG_VTU_FUNC1, QCA8K_VTU_FUNC1_BUSY);
+	if (ret)
+		return ret;
+
+	/* Check for table full violation when adding an entry */
+	if (cmd == QCA8K_VLAN_LOAD) {
+		ret = qca8k_read(priv, QCA8K_REG_VTU_FUNC1, &reg);
+		if (ret < 0)
+			return ret;
+		if (reg & QCA8K_VTU_FUNC1_FULL)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int
+qca8k_vlan_add(struct qca8k_priv *priv, u8 port, u16 vid, bool untagged)
+{
+	u32 reg;
+	int ret;
+
+	/* We do the right thing with VLAN 0 and treat it as untagged while
+	 * preserving the tag on egress.
+	 */
+	if (vid == 0)
+		return 0;
+
+	mutex_lock(&priv->reg_mutex);
+	ret = qca8k_vlan_access(priv, QCA8K_VLAN_READ, vid);
+	if (ret < 0)
+		goto out;
+
+	ret = qca8k_read(priv, QCA8K_REG_VTU_FUNC0, &reg);
+	if (ret < 0)
+		goto out;
+	reg |= QCA8K_VTU_FUNC0_VALID | QCA8K_VTU_FUNC0_IVL_EN;
+	reg &= ~QCA8K_VTU_FUNC0_EG_MODE_PORT_MASK(port);
+	if (untagged)
+		reg |= QCA8K_VTU_FUNC0_EG_MODE_PORT_UNTAG(port);
+	else
+		reg |= QCA8K_VTU_FUNC0_EG_MODE_PORT_TAG(port);
+
+	ret = qca8k_write(priv, QCA8K_REG_VTU_FUNC0, reg);
+	if (ret)
+		goto out;
+	ret = qca8k_vlan_access(priv, QCA8K_VLAN_LOAD, vid);
+
+out:
+	mutex_unlock(&priv->reg_mutex);
+
+	return ret;
+}
+
+static int
+qca8k_vlan_del(struct qca8k_priv *priv, u8 port, u16 vid)
+{
+	u32 reg, mask;
+	int ret, i;
+	bool del;
+
+	mutex_lock(&priv->reg_mutex);
+	ret = qca8k_vlan_access(priv, QCA8K_VLAN_READ, vid);
+	if (ret < 0)
+		goto out;
+
+	ret = qca8k_read(priv, QCA8K_REG_VTU_FUNC0, &reg);
+	if (ret < 0)
+		goto out;
+	reg &= ~QCA8K_VTU_FUNC0_EG_MODE_PORT_MASK(port);
+	reg |= QCA8K_VTU_FUNC0_EG_MODE_PORT_NOT(port);
+
+	/* Check if we're the last member to be removed */
+	del = true;
+	for (i = 0; i < QCA8K_NUM_PORTS; i++) {
+		mask = QCA8K_VTU_FUNC0_EG_MODE_PORT_NOT(i);
+
+		if ((reg & mask) != mask) {
+			del = false;
+			break;
+		}
+	}
+
+	if (del) {
+		ret = qca8k_vlan_access(priv, QCA8K_VLAN_PURGE, vid);
+	} else {
+		ret = qca8k_write(priv, QCA8K_REG_VTU_FUNC0, reg);
+		if (ret)
+			goto out;
+		ret = qca8k_vlan_access(priv, QCA8K_VLAN_LOAD, vid);
+	}
+
+out:
+	mutex_unlock(&priv->reg_mutex);
+
+	return ret;
+}
+
 int qca8k_mib_init(struct qca8k_priv *priv)
 {
 	int ret;
@@ -859,3 +974,68 @@ qca8k_port_mirror_del(struct dsa_switch *ds, int port,
 err:
 	dev_err(priv->dev, "Failed to del mirror port from %d", port);
 }
+
+int
+qca8k_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
+			  struct netlink_ext_ack *extack)
+{
+	struct qca8k_priv *priv = ds->priv;
+	int ret;
+
+	if (vlan_filtering) {
+		ret = qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(port),
+				QCA8K_PORT_LOOKUP_VLAN_MODE_MASK,
+				QCA8K_PORT_LOOKUP_VLAN_MODE_SECURE);
+	} else {
+		ret = qca8k_rmw(priv, QCA8K_PORT_LOOKUP_CTRL(port),
+				QCA8K_PORT_LOOKUP_VLAN_MODE_MASK,
+				QCA8K_PORT_LOOKUP_VLAN_MODE_NONE);
+	}
+
+	return ret;
+}
+
+int
+qca8k_port_vlan_add(struct dsa_switch *ds, int port,
+		    const struct switchdev_obj_port_vlan *vlan,
+		    struct netlink_ext_ack *extack)
+{
+	bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
+	bool pvid = vlan->flags & BRIDGE_VLAN_INFO_PVID;
+	struct qca8k_priv *priv = ds->priv;
+	int ret;
+
+	ret = qca8k_vlan_add(priv, port, vlan->vid, untagged);
+	if (ret) {
+		dev_err(priv->dev, "Failed to add VLAN to port %d (%d)", port, ret);
+		return ret;
+	}
+
+	if (pvid) {
+		ret = qca8k_rmw(priv, QCA8K_EGRESS_VLAN(port),
+				QCA8K_EGREES_VLAN_PORT_MASK(port),
+				QCA8K_EGREES_VLAN_PORT(port, vlan->vid));
+		if (ret)
+			return ret;
+
+		ret = qca8k_write(priv, QCA8K_REG_PORT_VLAN_CTRL0(port),
+				  QCA8K_PORT_VLAN_CVID(vlan->vid) |
+				  QCA8K_PORT_VLAN_SVID(vlan->vid));
+	}
+
+	return ret;
+}
+
+int
+qca8k_port_vlan_del(struct dsa_switch *ds, int port,
+		    const struct switchdev_obj_port_vlan *vlan)
+{
+	struct qca8k_priv *priv = ds->priv;
+	int ret;
+
+	ret = qca8k_vlan_del(priv, port, vlan->vid);
+	if (ret)
+		dev_err(priv->dev, "Failed to delete VLAN from port %d (%d)", port, ret);
+
+	return ret;
+}
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 3a2131b7abfa..91f7abc5beb1 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -439,7 +439,6 @@ int qca8k_write(struct qca8k_priv *priv, u32 reg, u32 val);
 int qca8k_rmw(struct qca8k_priv *priv, u32 reg, u32 mask, u32 write_val);
 
 /* Common ops function */
-int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask);
 void qca8k_fdb_flush(struct qca8k_priv *priv);
 
 /* Common ethtool stats function */
@@ -501,4 +500,13 @@ int qca8k_port_mirror_add(struct dsa_switch *ds, int port,
 void qca8k_port_mirror_del(struct dsa_switch *ds, int port,
 			   struct dsa_mall_mirror_tc_entry *mirror);
 
+/* Common port VLAN function */
+int qca8k_port_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
+			      struct netlink_ext_ack *extack);
+int qca8k_port_vlan_add(struct dsa_switch *ds, int port,
+			const struct switchdev_obj_port_vlan *vlan,
+			struct netlink_ext_ack *extack);
+int qca8k_port_vlan_del(struct dsa_switch *ds, int port,
+			const struct switchdev_obj_port_vlan *vlan);
+
 #endif /* __QCA8K_H */
-- 
2.36.1

