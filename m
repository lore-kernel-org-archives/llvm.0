Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E824688
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 21:11:43 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 66-20020a251145000000b006a7b4a27d04so14158723ybr.20
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=zaO32I0S7SQDvPMoMQFHJs6rEVWhhR1lhuEV3EVwoJQ=;
        b=srJs7ojePy/2F+EGwVPFW2Xg0p2htwMb7M/FUOue3qyJ60PKNMhCYFIwHxlTIEpyuU
         MQniu6tX64ZacV5YW8siBdEUSgNk9uHsN/mCsqQ7DXT1lXl7acz83KcBDlYuJYrVj1PN
         /vLpcUjsxOlwLVuZU7TQ2jbueY3Q3q8nSQYy2kZi3OEmM8HtSImTM9l4STcDt5/VQGmb
         i4pgFMexJqllHS2JkWrpYy8i3R7H7gXLlrzudNzpKGZEYoMPTKrZla+36YC+gPqbUrsT
         9Do9oDt34in+jFy869xC+kMlRYXEk6CoMoSS7cnH31Z0hXKRemrZHxSusvMmRnzVF4KY
         MZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=zaO32I0S7SQDvPMoMQFHJs6rEVWhhR1lhuEV3EVwoJQ=;
        b=mDcSNjk5IQZvInWYZT1ygshohRs1HnZ2JuA6uIR5t4zhvLIQPkAlPzKL8SeYJLPaaQ
         1/3vPkhyBsx3RusCkMTIHpiprHTlo7Vevp8nhWFvl5IE+lsP42U1wB2/AfIkH0pXXKCI
         eynrhfR/GvS7i9UnoNdFF5hypwuELQT2otGa3+bzt+rkMhmhv4OKmMXmKGQPDeFKPo4l
         kbu0bA31ajyHVq2SpY/ThK0iGflng5G5/zqsFAtqXL/vNzmiY2wj/8CV3sPrym1iFYbc
         QFeme+4uXVmcNW/iyXol5lUCHcb0qR2Ybsy7bWDMI0alGKMjL6d5nPEe0HEpkTuccxSe
         ZgJw==
X-Gm-Message-State: ACgBeo2w7na4Eil/hTgf1wMnKKXUbvQncnCYCtoA837DwhGEQHyxPFWu
	B9qbM9xhuSaqE5glEp+cYU8nZWkHEA==
X-Google-Smtp-Source: AA6agR40trucsCxmeeqkHH598e41TopB2iE2aXOQN08JKcFE5YwuwOiaXPG/I/56gfefW7lNSGjICDPVyg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:da82:0:b0:6a9:27d8:a671 with SMTP id
 n124-20020a25da82000000b006a927d8a671mr30748921ybf.142.1663189902345; Wed, 14
 Sep 2022 14:11:42 -0700 (PDT)
Date: Wed, 14 Sep 2022 14:10:57 -0700
In-Reply-To: <YyEQr//Iq7bautrm@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <YyEQr//Iq7bautrm@dev-arch.thelio-3990X>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220914211057.423617-1-nhuck@google.com>
Subject: [PATCH v3] staging: octeon: Fix return type of cvm_oct_xmit and cvm_oct_xmit_pow
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
Reviewed-by: Nathan Chancellor <nathan@kernel.org>

---

Changes v1 -> v2:
- Update function signatures in ethernet-tx.h.

Changes v2 -> v3:
- Move changes below the scissors --- so they don't show in commit msg
- Add reviewed-by tag

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

