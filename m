Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D13671D
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 23:04:40 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-349b38b500eso4988247b3.20
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 16:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=VoIodNAnmmutIkoqOpnBoW0YBXYHtgCdR1yf8yeK5IQ=;
        b=keReOhtGhNji5tpwnM1NBgoLrnTcw0fB05edrdBxdXd89kfrGDmh9S+lIJO8X70vyW
         X4GjgmPzU4uLtqi9XWWUbzu8WPf/9dQ3IbCTMo7m3ENFp8NIRL5UMmVvyqLyR+6moG/C
         Trl4CnP+H+2TckeDnVWjII67+zTZFKhADz8B3t9A5yd4hinzfXWl9YlK39WEKEYdhaXu
         NHL5u+cLCQ3e6Sv+ZYYX8IoXZ+tn5ztv/RHryVg7xr7/U+i1bn2EceKQ9Qtc2S5gy11/
         QC19KAOC+I/Qxv4O8YWJxq3xB2D1U7+HSjOGGmb2C03FwQOvVg2ShEoCLcTLDf2gcVHm
         10tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=VoIodNAnmmutIkoqOpnBoW0YBXYHtgCdR1yf8yeK5IQ=;
        b=xn0Rck0ZLynfAgpLMHqFmI6BKYaqi44Rw1uZQby+eBuwjvoSYqFKjxAWeuTn6gYGeV
         rGFtB+mKs/deV9SbjtZVOpxE/SzZIN1zu1GWlidipsUVXdbJD9TgVihZ1iZ2oQ41VWGo
         GruYdPga3wSrEsfH3gSMGj6YI6Ttl3B0Xm8COPLLO6Dngyf8zqGkVQkrJsl7ZzSYT2yy
         bscTVO1ud/LK/reX3NRy4MsBeFXElCR4RRfKbJ8YlFyqJXmpOAH5t8VZ0QJrr6LUyG7Y
         t+jUOdZ363fgZkGFAXqHs49c+ADsLPA0xdo0gvhnJ2lBSvJpat1q6oTKGUy9X52e8RP3
         Cq0Q==
X-Gm-Message-State: ACgBeo2VmjidlWqzm8Zu1s9UCTNCJUq+TWPpc91Jk1CagijMKUljo6wL
	TK1mUzaVZ269SYB6Q+yFY0E9sHMmFw==
X-Google-Smtp-Source: AA6agR6kRk1tNy6FLgwlWguPj9/VwK8Nu6tWQw7CkASTOM2LQwF+7naqkL6EsbmyXuuaDYitWR62XutLSQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:8a85:0:b0:671:715e:a1b0 with SMTP id
 h5-20020a258a85000000b00671715ea1b0mr27208374ybl.98.1663110279353; Tue, 13
 Sep 2022 16:04:39 -0700 (PDT)
Date: Tue, 13 Sep 2022 16:04:12 -0700
In-Reply-To: <YyEFu8uzoxK64p0Y@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <YyEFu8uzoxK64p0Y@dev-arch.thelio-3990X>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913230412.225957-1-nhuck@google.com>
Subject: [PATCH v2] staging: octeon: Fix return type of cvm_oct_xmit and cvm_oct_xmit_pow
From: Nathan Huckleberry <nhuck@google.com>
To: nathan@kernel.org
Cc: error27@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev, ndesaulniers@google.com, nhuck@google.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cvm_oct_xmit and cvm_oct_xmit_pow should be changed
from int to netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Changes v1 -> v2:
 - Update function signatures in ethernet-tx.h.

---
 drivers/staging/octeon/ethernet-tx.c | 4 ++--
 drivers/staging/octeon/ethernet-tx.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 1ad94c5060b5..a36e36701c74 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -125,7 +125,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
  *
  * Returns Always returns NETDEV_TX_OK
  */
-int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	union cvmx_pko_command_word0 pko_command;
 	union cvmx_buf_ptr hw_buffer;
@@ -506,7 +506,7 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
  * @dev:    Device info structure
  * Returns Always returns zero
  */
-int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	void *packet_buffer;
diff --git a/drivers/staging/octeon/ethernet-tx.h b/drivers/staging/octeon/ethernet-tx.h
index 78936e9b33b0..6c524668f65a 100644
--- a/drivers/staging/octeon/ethernet-tx.h
+++ b/drivers/staging/octeon/ethernet-tx.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
-int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev);
-int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev);
+netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev);
+netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev);
 int cvm_oct_transmit_qos(struct net_device *dev, void *work_queue_entry,
 			 int do_free, int qos);
 void cvm_oct_tx_initialize(void);
-- 
2.37.2.789.g6183377224-goog

