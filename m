Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F424A13
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:51:09 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id j22so17540373ejs.2
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 15:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gxU3BS6GkTCyLLOUas1uwXiwf5EwOtzJt1gDp7h7aUo=;
        b=PuJAj/9oLgdFgaWv1ExiMMsKOcffGqGYeCC61tZ6ZZ8zBDKm/20LbxxAmxvCvhoBbW
         sIKSQIL4KLoE1nO/tMWmZgeEGMbGmTe79AGPPPUn1uOmj5+Hb1aIpLFKwH3CL5490w9m
         +e224Eok7PxeH/KFfYMRl7aGxXFgq+oLQhP2iXdUh4Qfi3VxfGI/6li9uSIvGZK58C1n
         qYr+mdaZelTcLEp8J/U8dkKb9wDscqG2whzJmfVJffIwAhw0tWI/WwquWjXinjYjagne
         WcPEkAqsp6Rq84JR7SelbbiczjPknwaFuxf9ws7iQVncfTNUeG1IADplbS5sgMTWW73l
         /T5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gxU3BS6GkTCyLLOUas1uwXiwf5EwOtzJt1gDp7h7aUo=;
        b=BcniOtbiXh9QV8aDd7pFRbosCbXgjgt+bNFwuQk8UxwaZx+ZWG4ObsRhYpFUolqRZe
         Mq5NT08cL0WKuDmmN7cyMnsd0H/edDBrXC24dV76owsKDQfevEhs+R0D0Sg+D/3M+ux2
         v4Kbsbdl4pqt4QMVGFak0ImNQWP/MiejIbNzMQEwuMbzRhBUXiddPkmegZD+WSGM3V67
         FirbR36t4TonRZDMI24+7WVNTKwD85LU8Sdm5VxC1FpFW1K3hEsPFxIuCPrOHpAPMzxK
         Lu8DEj2SPz4ct7I74ISftQlD/TBdl3Kezw5lPWhEg6dqxAPMEAcUkDOyWGTqk/NuV+Gp
         j44w==
X-Gm-Message-State: AJIora+I9oPE5VSYnOon7/ap68vriOCyMd40HkYWEMWK8SMs3Dmh4TVg
	ggjgG88wHlba8xzXWUBjIfc=
X-Google-Smtp-Source: AGRyM1vxp7Yxl/zOU5Xpr72vDNEDFU6MKTctt3EJSFyRefGH4Jpa4qgsCXn4JdjC01flMHvn/D0vhw==
X-Received: by 2002:a17:907:97c2:b0:72b:9ec4:9a60 with SMTP id js2-20020a17090797c200b0072b9ec49a60mr7980879ejc.154.1658703068019;
        Sun, 24 Jul 2022 15:51:08 -0700 (PDT)
Received: from localhost.localdomain (93-42-69-122.ip85.fastwebnet.it. [93.42.69.122])
        by smtp.googlemail.com with ESMTPSA id nc19-20020a1709071c1300b00722d5b26ecesm4645238ejc.205.2022.07.24.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 15:51:07 -0700 (PDT)
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
Subject: [net-next PATCH v4 03/14] net: dsa: qca8k: move mib struct to common code
Date: Sun, 24 Jul 2022 22:19:27 +0200
Message-Id: <20220724201938.17387-4-ansuelsmth@gmail.com>
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

The same MIB struct is used by drivers based on qca8k family switch. Move
it to common code to make it accessible also by other drivers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/qca/Makefile                  |  1 +
 drivers/net/dsa/qca/{qca8k.c => qca8k-8xxx.c} | 51 ---------------
 drivers/net/dsa/qca/qca8k-common.c            | 63 +++++++++++++++++++
 drivers/net/dsa/qca/qca8k.h                   |  3 +
 4 files changed, 67 insertions(+), 51 deletions(-)
 rename drivers/net/dsa/qca/{qca8k.c => qca8k-8xxx.c} (98%)
 create mode 100644 drivers/net/dsa/qca/qca8k-common.c

diff --git a/drivers/net/dsa/qca/Makefile b/drivers/net/dsa/qca/Makefile
index 40bb7c27285b..701f1d199e93 100644
--- a/drivers/net/dsa/qca/Makefile
+++ b/drivers/net/dsa/qca/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_NET_DSA_AR9331)	+= ar9331.o
 obj-$(CONFIG_NET_DSA_QCA8K)	+= qca8k.o
+qca8k-y 			+= qca8k-common.o qca8k-8xxx.o
diff --git a/drivers/net/dsa/qca/qca8k.c b/drivers/net/dsa/qca/qca8k-8xxx.c
similarity index 98%
rename from drivers/net/dsa/qca/qca8k.c
rename to drivers/net/dsa/qca/qca8k-8xxx.c
index 5d3c3c95ef88..bf2e2345cf57 100644
--- a/drivers/net/dsa/qca/qca8k.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -24,57 +24,6 @@
 
 #include "qca8k.h"
 
-#define MIB_DESC(_s, _o, _n)	\
-	{			\
-		.size = (_s),	\
-		.offset = (_o),	\
-		.name = (_n),	\
-	}
-
-static const struct qca8k_mib_desc ar8327_mib[] = {
-	MIB_DESC(1, 0x00, "RxBroad"),
-	MIB_DESC(1, 0x04, "RxPause"),
-	MIB_DESC(1, 0x08, "RxMulti"),
-	MIB_DESC(1, 0x0c, "RxFcsErr"),
-	MIB_DESC(1, 0x10, "RxAlignErr"),
-	MIB_DESC(1, 0x14, "RxRunt"),
-	MIB_DESC(1, 0x18, "RxFragment"),
-	MIB_DESC(1, 0x1c, "Rx64Byte"),
-	MIB_DESC(1, 0x20, "Rx128Byte"),
-	MIB_DESC(1, 0x24, "Rx256Byte"),
-	MIB_DESC(1, 0x28, "Rx512Byte"),
-	MIB_DESC(1, 0x2c, "Rx1024Byte"),
-	MIB_DESC(1, 0x30, "Rx1518Byte"),
-	MIB_DESC(1, 0x34, "RxMaxByte"),
-	MIB_DESC(1, 0x38, "RxTooLong"),
-	MIB_DESC(2, 0x3c, "RxGoodByte"),
-	MIB_DESC(2, 0x44, "RxBadByte"),
-	MIB_DESC(1, 0x4c, "RxOverFlow"),
-	MIB_DESC(1, 0x50, "Filtered"),
-	MIB_DESC(1, 0x54, "TxBroad"),
-	MIB_DESC(1, 0x58, "TxPause"),
-	MIB_DESC(1, 0x5c, "TxMulti"),
-	MIB_DESC(1, 0x60, "TxUnderRun"),
-	MIB_DESC(1, 0x64, "Tx64Byte"),
-	MIB_DESC(1, 0x68, "Tx128Byte"),
-	MIB_DESC(1, 0x6c, "Tx256Byte"),
-	MIB_DESC(1, 0x70, "Tx512Byte"),
-	MIB_DESC(1, 0x74, "Tx1024Byte"),
-	MIB_DESC(1, 0x78, "Tx1518Byte"),
-	MIB_DESC(1, 0x7c, "TxMaxByte"),
-	MIB_DESC(1, 0x80, "TxOverSize"),
-	MIB_DESC(2, 0x84, "TxByte"),
-	MIB_DESC(1, 0x8c, "TxCollision"),
-	MIB_DESC(1, 0x90, "TxAbortCol"),
-	MIB_DESC(1, 0x94, "TxMultiCol"),
-	MIB_DESC(1, 0x98, "TxSingleCol"),
-	MIB_DESC(1, 0x9c, "TxExcDefer"),
-	MIB_DESC(1, 0xa0, "TxDefer"),
-	MIB_DESC(1, 0xa4, "TxLateCol"),
-	MIB_DESC(1, 0xa8, "RXUnicast"),
-	MIB_DESC(1, 0xac, "TXUnicast"),
-};
-
 static void
 qca8k_split_addr(u32 regaddr, u16 *r1, u16 *r2, u16 *page)
 {
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
new file mode 100644
index 000000000000..7a63e96c8c08
--- /dev/null
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2009 Felix Fietkau <nbd@nbd.name>
+ * Copyright (C) 2011-2012 Gabor Juhos <juhosg@openwrt.org>
+ * Copyright (c) 2015, 2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016 John Crispin <john@phrozen.org>
+ */
+
+#include <linux/netdevice.h>
+#include <net/dsa.h>
+
+#include "qca8k.h"
+
+#define MIB_DESC(_s, _o, _n)	\
+	{			\
+		.size = (_s),	\
+		.offset = (_o),	\
+		.name = (_n),	\
+	}
+
+const struct qca8k_mib_desc ar8327_mib[] = {
+	MIB_DESC(1, 0x00, "RxBroad"),
+	MIB_DESC(1, 0x04, "RxPause"),
+	MIB_DESC(1, 0x08, "RxMulti"),
+	MIB_DESC(1, 0x0c, "RxFcsErr"),
+	MIB_DESC(1, 0x10, "RxAlignErr"),
+	MIB_DESC(1, 0x14, "RxRunt"),
+	MIB_DESC(1, 0x18, "RxFragment"),
+	MIB_DESC(1, 0x1c, "Rx64Byte"),
+	MIB_DESC(1, 0x20, "Rx128Byte"),
+	MIB_DESC(1, 0x24, "Rx256Byte"),
+	MIB_DESC(1, 0x28, "Rx512Byte"),
+	MIB_DESC(1, 0x2c, "Rx1024Byte"),
+	MIB_DESC(1, 0x30, "Rx1518Byte"),
+	MIB_DESC(1, 0x34, "RxMaxByte"),
+	MIB_DESC(1, 0x38, "RxTooLong"),
+	MIB_DESC(2, 0x3c, "RxGoodByte"),
+	MIB_DESC(2, 0x44, "RxBadByte"),
+	MIB_DESC(1, 0x4c, "RxOverFlow"),
+	MIB_DESC(1, 0x50, "Filtered"),
+	MIB_DESC(1, 0x54, "TxBroad"),
+	MIB_DESC(1, 0x58, "TxPause"),
+	MIB_DESC(1, 0x5c, "TxMulti"),
+	MIB_DESC(1, 0x60, "TxUnderRun"),
+	MIB_DESC(1, 0x64, "Tx64Byte"),
+	MIB_DESC(1, 0x68, "Tx128Byte"),
+	MIB_DESC(1, 0x6c, "Tx256Byte"),
+	MIB_DESC(1, 0x70, "Tx512Byte"),
+	MIB_DESC(1, 0x74, "Tx1024Byte"),
+	MIB_DESC(1, 0x78, "Tx1518Byte"),
+	MIB_DESC(1, 0x7c, "TxMaxByte"),
+	MIB_DESC(1, 0x80, "TxOverSize"),
+	MIB_DESC(2, 0x84, "TxByte"),
+	MIB_DESC(1, 0x8c, "TxCollision"),
+	MIB_DESC(1, 0x90, "TxAbortCol"),
+	MIB_DESC(1, 0x94, "TxMultiCol"),
+	MIB_DESC(1, 0x98, "TxSingleCol"),
+	MIB_DESC(1, 0x9c, "TxExcDefer"),
+	MIB_DESC(1, 0xa0, "TxDefer"),
+	MIB_DESC(1, 0xa4, "TxLateCol"),
+	MIB_DESC(1, 0xa8, "RXUnicast"),
+	MIB_DESC(1, 0xac, "TXUnicast"),
+};
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 377ce8c72914..0f274bb350f8 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -422,4 +422,7 @@ struct qca8k_fdb {
 	u8 mac[6];
 };
 
+/* Common setup function */
+extern const struct qca8k_mib_desc ar8327_mib[];
+
 #endif /* __QCA8K_H */
-- 
2.36.1

