Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D102F51
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:51:07 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id c12so4529713ede.3
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 15:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C8kzD0JzPswLobJ7sKwgOf7aZPC0Em801txgcu10yYs=;
        b=j6hxMyEguk8lCxqm5TnSdv6on50wx/SwTYPR9zaD9CmNSGptx3nAmQBoq8rV0BnYUL
         1kIneM4NcwnJN+UuGg9kTWg15ZF/7QyaivisATL7avjDTUrlmbdb6dIW1fFN794kMju0
         rWR7byN+W8NLUAtmB8WKxVoaojEsb+dKGRNVPtQRByBRKPlWrskkpyXIo3e/v5RusIHg
         GXHpLt66ciOQcBxUYQm+cwxkn7hKOA49kVbsrxdq55BO96puZbCajwQ3qZJGs68fFxrV
         Pk0ScgJZk3nLpE2EomYZFM7dSP9li0/2cZ0VJnDuSxQixA3O33Q12aT7QLF2wvQkIh3y
         c0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C8kzD0JzPswLobJ7sKwgOf7aZPC0Em801txgcu10yYs=;
        b=g9iDUX1C6y9bAcZB39CgQv70Fb8YHVq+3k2KJz5dRPs/opvicsM4Yn72cqHVHvpA33
         f9xn+GLQf3ddIl+k1kNH9BIvbX3lULo/1JQNjY6YodR2uTt5f4zTNPHUt5/QaucEd+Vj
         X/CZfi8WhTwj6genrShi5NCNnekJkzqaRITTJTcx+Nfklw54pS7Ptm+Q3nyyQgbT3YEd
         2sHfm0WO8KD9nql2R1Fb67ybg3W/Igf2o9jAslWcWeDTtSr8BVmys216aCV6Wz2l9tR4
         s13t8o8BwCRTRLk0iDhObVqbyEj55Jq6gMqGaWIy5FiRvomEHJwhuIreuoc3DKXxBQKq
         8Zag==
X-Gm-Message-State: AJIora+I4YOtkIebkM59RpeGKNEVd8WshJCbL1G6BPLAFSRY5tlrwZhh
	/4j5To/cw7TmRuHDQPR4Kj8=
X-Google-Smtp-Source: AGRyM1uRidoYDazYyOWLEyGogK/4NxDyygXyv9kkTbunMPLnwgtAhQM9ZEc0oO1mfOr8Z/T4P2tC5w==
X-Received: by 2002:a05:6402:1102:b0:43a:9cf7:68a3 with SMTP id u2-20020a056402110200b0043a9cf768a3mr10598919edv.68.1658703065747;
        Sun, 24 Jul 2022 15:51:05 -0700 (PDT)
Received: from localhost.localdomain (93-42-69-122.ip85.fastwebnet.it. [93.42.69.122])
        by smtp.googlemail.com with ESMTPSA id nc19-20020a1709071c1300b00722d5b26ecesm4645238ejc.205.2022.07.24.15.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 15:51:05 -0700 (PDT)
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
Subject: [net-next PATCH v4 01/14] net: dsa: qca8k: cache match data to speed up access
Date: Sun, 24 Jul 2022 22:19:25 +0200
Message-Id: <20220724201938.17387-2-ansuelsmth@gmail.com>
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

Using of_device_get_match_data is expensive. Cache match data to speed
up access and rework user of match data to use the new cached value.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/qca/qca8k.c | 28 ++++++++++------------------
 drivers/net/dsa/qca/qca8k.h |  1 +
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k.c b/drivers/net/dsa/qca/qca8k.c
index 1cbb05b0323f..212b284f9f73 100644
--- a/drivers/net/dsa/qca/qca8k.c
+++ b/drivers/net/dsa/qca/qca8k.c
@@ -1462,8 +1462,8 @@ static int qca8k_find_cpu_port(struct dsa_switch *ds)
 static int
 qca8k_setup_of_pws_reg(struct qca8k_priv *priv)
 {
+	const struct qca8k_match_data *data = priv->info;
 	struct device_node *node = priv->dev->of_node;
-	const struct qca8k_match_data *data;
 	u32 val = 0;
 	int ret;
 
@@ -1472,8 +1472,6 @@ qca8k_setup_of_pws_reg(struct qca8k_priv *priv)
 	 * Should be applied by default but we set this just to make sure.
 	 */
 	if (priv->switch_id == QCA8K_ID_QCA8327) {
-		data = of_device_get_match_data(priv->dev);
-
 		/* Set the correct package of 148 pin for QCA8327 */
 		if (data->reduced_package)
 			val |= QCA8327_PWS_PACKAGE148_EN;
@@ -1996,23 +1994,19 @@ static void qca8k_setup_pcs(struct qca8k_priv *priv, struct qca8k_pcs *qpcs,
 static void
 qca8k_get_strings(struct dsa_switch *ds, int port, u32 stringset, uint8_t *data)
 {
-	const struct qca8k_match_data *match_data;
 	struct qca8k_priv *priv = ds->priv;
 	int i;
 
 	if (stringset != ETH_SS_STATS)
 		return;
 
-	match_data = of_device_get_match_data(priv->dev);
-
-	for (i = 0; i < match_data->mib_count; i++)
+	for (i = 0; i < priv->info->mib_count; i++)
 		strncpy(data + i * ETH_GSTRING_LEN, ar8327_mib[i].name,
 			ETH_GSTRING_LEN);
 }
 
 static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *skb)
 {
-	const struct qca8k_match_data *match_data;
 	struct qca8k_mib_eth_data *mib_eth_data;
 	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
@@ -2031,10 +2025,9 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
-	match_data = device_get_match_data(priv->dev);
 	data = mib_eth_data->data;
 
-	for (i = 0; i < match_data->mib_count; i++) {
+	for (i = 0; i < priv->info->mib_count; i++) {
 		mib = &ar8327_mib[i];
 
 		/* First 3 mib are present in the skb head */
@@ -2106,7 +2099,6 @@ qca8k_get_ethtool_stats(struct dsa_switch *ds, int port,
 			uint64_t *data)
 {
 	struct qca8k_priv *priv = (struct qca8k_priv *)ds->priv;
-	const struct qca8k_match_data *match_data;
 	const struct qca8k_mib_desc *mib;
 	u32 reg, i, val;
 	u32 hi = 0;
@@ -2116,9 +2108,7 @@ qca8k_get_ethtool_stats(struct dsa_switch *ds, int port,
 	    qca8k_get_ethtool_stats_eth(ds, port, data) > 0)
 		return;
 
-	match_data = of_device_get_match_data(priv->dev);
-
-	for (i = 0; i < match_data->mib_count; i++) {
+	for (i = 0; i < priv->info->mib_count; i++) {
 		mib = &ar8327_mib[i];
 		reg = QCA8K_PORT_MIB_COUNTER(port) + mib->offset;
 
@@ -2141,15 +2131,12 @@ qca8k_get_ethtool_stats(struct dsa_switch *ds, int port,
 static int
 qca8k_get_sset_count(struct dsa_switch *ds, int port, int sset)
 {
-	const struct qca8k_match_data *match_data;
 	struct qca8k_priv *priv = ds->priv;
 
 	if (sset != ETH_SS_STATS)
 		return 0;
 
-	match_data = of_device_get_match_data(priv->dev);
-
-	return match_data->mib_count;
+	return priv->info->mib_count;
 }
 
 static int
@@ -3168,6 +3155,11 @@ qca8k_sw_probe(struct mdio_device *mdiodev)
 	if (ret)
 		return ret;
 
+	/* Cache match data in priv struct.
+	 * Match data is already checked in read_switch_id.
+	 */
+	priv->info = of_device_get_match_data(priv->dev);
+
 	priv->ds = devm_kzalloc(&mdiodev->dev, sizeof(*priv->ds), GFP_KERNEL);
 	if (!priv->ds)
 		return -ENOMEM;
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index ec58d0e80a70..0b990b46890a 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -401,6 +401,7 @@ struct qca8k_priv {
 	struct qca8k_mdio_cache mdio_cache;
 	struct qca8k_pcs pcs_port_0;
 	struct qca8k_pcs pcs_port_6;
+	const struct qca8k_match_data *info;
 };
 
 struct qca8k_mib_desc {
-- 
2.36.1

