Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CC52F4B
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:51:21 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id v12so11887620edc.10
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 15:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bALwgTLHeiO6tuKyaRsWqPti56pYBe2CtNa9AfdIH8M=;
        b=ajsVYeRASAcU21lp20aC5IVN88l7vzE2FMgcIoIObtUryejvKcb6x18MJd5GlKr2+W
         pBmzNRAA7W9Oro/vtzZqdAglNS2mA2nOExABP9cn1CI6NchLp+82GxFrqWTKinNDSI+s
         /ABNK/NBdrwbTQZbFeMBFbddis9/aEZAojvjLpoUNa8SnhfTCcE9sfuJZ4JLpaJCMgmV
         ijpOxpV6fgGloC2PeqQH3s0PrTDbaNRNhu5FhxaAXUj+NegO+sXfoZAzjqJuKhRTtHtL
         Wyq/bUi61uiuSnrapFfDEZ3ClSm5+1aBEg03aH8O7jF2IkltXTUQewm9pEXQrVtsoGcg
         nEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bALwgTLHeiO6tuKyaRsWqPti56pYBe2CtNa9AfdIH8M=;
        b=q+n93BzXjnADbLq5EKFiev67L1Fa4GNXbGPjqghksBgP5bB3oVXwXGu3XB9BVkORhL
         e7d2EuBZC5eIrFCO97ZiuTaVBVeo2zhWte2Gt2YzB+8LmWPWX6+1Ef7b6qEn0Or9/6AO
         dWeJOXn8Q1vBOnM/W1PRPib5c5mqPhfqVaPNQSaVPGZdoqLPnAqo68MSCqcpuxH8FdBu
         xG6NbBXyrNboqHb8R3kjWsc22nRZ7UU9mNuR9NSLcCDwygflwSMYGc0mLgUVRjkP/ZbO
         kMXfA2MZv6tBq3h+Yoyse0vw0N5QUwr2NMSMx5GyRBpb+fREJcZu+nyyUGVSw/U5jlUE
         zw5Q==
X-Gm-Message-State: AJIora+9OGtoZWpSlYsYirOG9kz3b3rArUX4SbvyfzdH+lz9LnpTJ8t6
	Y5vL05Z/IOUjvFER4MFBp4QkotLjRsg=
X-Google-Smtp-Source: AGRyM1tzQub7ANTRemOXl2A43cYZmlTF67/1L4eDbxoIPw9svZASGrEj/p/tL0WOQXYxDC+ho64dxA==
X-Received: by 2002:a05:6402:d53:b0:43b:a0cf:d970 with SMTP id ec19-20020a0564020d5300b0043ba0cfd970mr10154018edb.277.1658703080971;
        Sun, 24 Jul 2022 15:51:20 -0700 (PDT)
Received: from localhost.localdomain (93-42-69-122.ip85.fastwebnet.it. [93.42.69.122])
        by smtp.googlemail.com with ESMTPSA id nc19-20020a1709071c1300b00722d5b26ecesm4645238ejc.205.2022.07.24.15.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 15:51:20 -0700 (PDT)
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
Subject: [net-next PATCH v4 14/14] net: dsa: qca8k: move read_switch_id function to common code
Date: Sun, 24 Jul 2022 22:19:38 +0200
Message-Id: <20220724201938.17387-15-ansuelsmth@gmail.com>
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

The same function to read the switch id is used by drivers based on
qca8k family switch. Move them to common code to make them accessible
also by other drivers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 30 -----------------------------
 drivers/net/dsa/qca/qca8k-common.c | 31 ++++++++++++++++++++++++++++++
 drivers/net/dsa/qca/qca8k.h        |  1 +
 3 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 82c02491c946..fa91517e930b 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1877,36 +1877,6 @@ static const struct dsa_switch_ops qca8k_switch_ops = {
 	.connect_tag_protocol	= qca8k_connect_tag_protocol,
 };
 
-static int qca8k_read_switch_id(struct qca8k_priv *priv)
-{
-	const struct qca8k_match_data *data;
-	u32 val;
-	u8 id;
-	int ret;
-
-	/* get the switches ID from the compatible */
-	data = of_device_get_match_data(priv->dev);
-	if (!data)
-		return -ENODEV;
-
-	ret = qca8k_read(priv, QCA8K_REG_MASK_CTRL, &val);
-	if (ret < 0)
-		return -ENODEV;
-
-	id = QCA8K_MASK_CTRL_DEVICE_ID(val);
-	if (id != data->id) {
-		dev_err(priv->dev, "Switch id detected %x but expected %x", id, data->id);
-		return -ENODEV;
-	}
-
-	priv->switch_id = id;
-
-	/* Save revision to communicate to the internal PHY driver */
-	priv->switch_revision = QCA8K_MASK_CTRL_REV_ID(val);
-
-	return 0;
-}
-
 static int
 qca8k_sw_probe(struct mdio_device *mdiodev)
 {
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index b982efb721fc..e6294d6a7b8f 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -8,6 +8,7 @@
 
 #include <linux/netdevice.h>
 #include <net/dsa.h>
+#include <linux/of_platform.h>
 #include <linux/if_bridge.h>
 
 #include "qca8k.h"
@@ -1207,3 +1208,33 @@ qca8k_port_lag_leave(struct dsa_switch *ds, int port,
 {
 	return qca8k_lag_refresh_portmap(ds, port, lag, true);
 }
+
+int qca8k_read_switch_id(struct qca8k_priv *priv)
+{
+	const struct qca8k_match_data *data;
+	u32 val;
+	u8 id;
+	int ret;
+
+	/* get the switches ID from the compatible */
+	data = of_device_get_match_data(priv->dev);
+	if (!data)
+		return -ENODEV;
+
+	ret = qca8k_read(priv, QCA8K_REG_MASK_CTRL, &val);
+	if (ret < 0)
+		return -ENODEV;
+
+	id = QCA8K_MASK_CTRL_DEVICE_ID(val);
+	if (id != data->id) {
+		dev_err(priv->dev, "Switch id detected %x but expected %x", id, data->id);
+		return -ENODEV;
+	}
+
+	priv->switch_id = id;
+
+	/* Save revision to communicate to the internal PHY driver */
+	priv->switch_revision = QCA8K_MASK_CTRL_REV_ID(val);
+
+	return 0;
+}
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index e87bfee837c1..e36ecc9777f4 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -432,6 +432,7 @@ extern const struct qca8k_mib_desc ar8327_mib[];
 extern const struct regmap_access_table qca8k_readable_table;
 int qca8k_mib_init(struct qca8k_priv *priv);
 void qca8k_port_set_status(struct qca8k_priv *priv, int port, int enable);
+int qca8k_read_switch_id(struct qca8k_priv *priv);
 
 /* Common read/write/rmw function */
 int qca8k_read(struct qca8k_priv *priv, u32 reg, u32 *val);
-- 
2.36.1

