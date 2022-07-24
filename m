Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B99F4A15
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:51:13 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id z23so17356251eju.8
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 15:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z5shPpFQpaw0JAErr3t9PC2pRp3TSNJWCLBkEhxNhg0=;
        b=ml20RaSCOolR7j2HpYa37jlzXpVdRkcHmHgetEom1PWUH5DtkK885T5jXaUdfupH6R
         XwZfQT6PKkXat6bbR/wUC9v6eUyhfbnfVTGNY33n+akRutNQm6q2BWkZnwkkBJOlnAc6
         mDdPh/U+VEG5t7mRVB7llOYq2VOfayb0lFLA9+GXBiOtunnzvjjUZjV/jRhXYYVwqmCL
         pfZnc1uxW+GmKUVyiTKizL27Ut0z+M8WJwYL/XwlfNv9Tm6k8WYwGJZVA/gKtKnduER7
         IaANz12cXbiiWRccGp6a9JdqDgz2qwkorcrXVWsvnQ3oU5FtP2zQDVphTpQSFPvmVEgN
         W9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5shPpFQpaw0JAErr3t9PC2pRp3TSNJWCLBkEhxNhg0=;
        b=YhPoqiHUPpRLo0oEbXy9ycPAu+GevLD72Jucax9etowjVVEOv6Sk7ClgkjpqmuYxp6
         XqPM3xZnXq+5XAZ/6npqF868KTW2TDIMXIrd1JZDqQHyN1bSKNnyDQC6NigYqdF1tfC9
         NZQOkkj/RMYwuswXO4amNzYZoemkhRgpcAqJPlNmjaBjvsL3AyhQoQbADEJ7C/ynUVIc
         H7WDQZR7GG3WiXbCEUTTu5zL7sZ2mbaQShbik3uR4k0QxAFSGAlpOODfraD/Tw5o9uz7
         ACBsulg2peJGyPRy3TtyZbg/cqXrCjwGFnMn3kbQdfJJDHEkklljum/Os/APlSEmDI9L
         4YpQ==
X-Gm-Message-State: AJIora9F7Qn3W6Mlsf93V7/lYqraAgnUL0I/kyNvhJ5KFoOP/pNlxghB
	tGbTXyh4BlvO3ohVSvVSSzk=
X-Google-Smtp-Source: AGRyM1tV23ozm4RwR0UKLjwVaTxXXfNF2jQK3neEiT3yQqb/pbXNk6ehJD4CVoKkHhF8Q56BIz+yJA==
X-Received: by 2002:a17:907:1c19:b0:72f:cc9e:3a7 with SMTP id nc25-20020a1709071c1900b0072fcc9e03a7mr4216220ejc.631.1658703071514;
        Sun, 24 Jul 2022 15:51:11 -0700 (PDT)
Received: from localhost.localdomain (93-42-69-122.ip85.fastwebnet.it. [93.42.69.122])
        by smtp.googlemail.com with ESMTPSA id nc19-20020a1709071c1300b00722d5b26ecesm4645238ejc.205.2022.07.24.15.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 15:51:11 -0700 (PDT)
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
Subject: [net-next PATCH v4 06/14] net: dsa: qca8k: move mib init function to common code
Date: Sun, 24 Jul 2022 22:19:30 +0200
Message-Id: <20220724201938.17387-7-ansuelsmth@gmail.com>
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

The same mib function is used by drivers based on qca8k family switch.
Move it to common code to make it accessible also by other drivers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 37 ------------------------------
 drivers/net/dsa/qca/qca8k-common.c | 36 +++++++++++++++++++++++++++++
 drivers/net/dsa/qca/qca8k.h        |  4 ++++
 3 files changed, 40 insertions(+), 37 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 3dd63d64d7ae..b62cedeafaac 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -441,15 +441,6 @@ static struct regmap_config qca8k_regmap_config = {
 	.cache_type = REGCACHE_NONE, /* Explicitly disable CACHE */
 };
 
-static int
-qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask)
-{
-	u32 val;
-
-	return regmap_read_poll_timeout(priv->regmap, reg, val, !(val & mask), 0,
-				       QCA8K_BUSY_WAIT_TIMEOUT * USEC_PER_MSEC);
-}
-
 static int
 qca8k_fdb_read(struct qca8k_priv *priv, struct qca8k_fdb *fdb)
 {
@@ -777,34 +768,6 @@ qca8k_vlan_del(struct qca8k_priv *priv, u8 port, u16 vid)
 	return ret;
 }
 
-static int
-qca8k_mib_init(struct qca8k_priv *priv)
-{
-	int ret;
-
-	mutex_lock(&priv->reg_mutex);
-	ret = regmap_update_bits(priv->regmap, QCA8K_REG_MIB,
-				 QCA8K_MIB_FUNC | QCA8K_MIB_BUSY,
-				 FIELD_PREP(QCA8K_MIB_FUNC, QCA8K_MIB_FLUSH) |
-				 QCA8K_MIB_BUSY);
-	if (ret)
-		goto exit;
-
-	ret = qca8k_busy_wait(priv, QCA8K_REG_MIB, QCA8K_MIB_BUSY);
-	if (ret)
-		goto exit;
-
-	ret = regmap_set_bits(priv->regmap, QCA8K_REG_MIB, QCA8K_MIB_CPU_KEEP);
-	if (ret)
-		goto exit;
-
-	ret = qca8k_write(priv, QCA8K_REG_MODULE_EN, QCA8K_MODULE_EN_MIB);
-
-exit:
-	mutex_unlock(&priv->reg_mutex);
-	return ret;
-}
-
 static void
 qca8k_port_set_status(struct qca8k_priv *priv, int port, int enable)
 {
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index a47f876033ba..494dd6a14e9b 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -138,3 +138,39 @@ int qca8k_bulk_write(struct qca8k_priv *priv, u32 reg, u32 *val, int len)
 
 	return 0;
 }
+
+int
+qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask)
+{
+	u32 val;
+
+	return regmap_read_poll_timeout(priv->regmap, reg, val, !(val & mask), 0,
+				       QCA8K_BUSY_WAIT_TIMEOUT * USEC_PER_MSEC);
+}
+
+int qca8k_mib_init(struct qca8k_priv *priv)
+{
+	int ret;
+
+	mutex_lock(&priv->reg_mutex);
+	ret = regmap_update_bits(priv->regmap, QCA8K_REG_MIB,
+				 QCA8K_MIB_FUNC | QCA8K_MIB_BUSY,
+				 FIELD_PREP(QCA8K_MIB_FUNC, QCA8K_MIB_FLUSH) |
+				 QCA8K_MIB_BUSY);
+	if (ret)
+		goto exit;
+
+	ret = qca8k_busy_wait(priv, QCA8K_REG_MIB, QCA8K_MIB_BUSY);
+	if (ret)
+		goto exit;
+
+	ret = regmap_set_bits(priv->regmap, QCA8K_REG_MIB, QCA8K_MIB_CPU_KEEP);
+	if (ret)
+		goto exit;
+
+	ret = qca8k_write(priv, QCA8K_REG_MODULE_EN, QCA8K_MODULE_EN_MIB);
+
+exit:
+	mutex_unlock(&priv->reg_mutex);
+	return ret;
+}
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index df32c1e3a797..f55ef97f826f 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -430,6 +430,7 @@ struct qca8k_fdb {
 /* Common setup function */
 extern const struct qca8k_mib_desc ar8327_mib[];
 extern const struct regmap_access_table qca8k_readable_table;
+int qca8k_mib_init(struct qca8k_priv *priv);
 
 /* Common read/write/rmw function */
 int qca8k_read(struct qca8k_priv *priv, u32 reg, u32 *val);
@@ -439,4 +440,7 @@ int qca8k_rmw(struct qca8k_priv *priv, u32 reg, u32 mask, u32 write_val);
 int qca8k_bulk_read(struct qca8k_priv *priv, u32 reg, u32 *val, int len);
 int qca8k_bulk_write(struct qca8k_priv *priv, u32 reg, u32 *val, int len);
 
+/* Common ops function */
+int qca8k_busy_wait(struct qca8k_priv *priv, u32 reg, u32 mask);
+
 #endif /* __QCA8K_H */
-- 
2.36.1

