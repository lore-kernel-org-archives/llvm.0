Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE39E5C82
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:46:02 +0000 (UTC)
Received: by mail-ua1-f73.google.com with SMTP id z44-20020a9f372f000000b00390af225beaso3088151uad.12
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=BRbgXY3xJYxM9YYiTldXX81aJSb/pUukVv6KYPaXnBg=;
        b=c/M9m3cQtWs5Pnn2DrO9HkM+4nSNPHTWCmSZ8RxTIRbxl4TQ4reaDmHt9dhCCZDvAt
         KOHpDRvuiZofWaeJnb1P0qL/9FBr3SxIHKnVvXfll3j8m+VSXT9jaDnQTgkm7We6BAwU
         97lmsYms3QxSOHIf1CocBAMA03ggAZXO86m21rrwqgpxAluJOPTDLXjumCse3e6KlGbE
         9hNowCqmyKuXvqIPv4G2OjslpKdi/cFk77Lf9nSY2/TmDhnOPFZicL0/oLzwPVRYLwmz
         vuUEqG0HAolRHc+hAtf8adosPmO4qKlP6+JS7Ez2bQJ2VJEV2Mb7+8DRKl8ecfbnhiKJ
         l2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=BRbgXY3xJYxM9YYiTldXX81aJSb/pUukVv6KYPaXnBg=;
        b=7hSCpYnti+R9p14Yev+apqewn8O5I0RNxwp3kHW/YdPMTWHHQEdWDgYDXbXrUZ0+7s
         P+P1TUKLhvnum4/KgmbHA6kFSkVPtB86gi7Tvn3dPJewDt0oE3sN5OpsCAEvDQpNFelu
         lEn0b9ihhacLm6jOf7U7ohYyszTjJSP+qqCWmmrBKVNCyxQZgXRgScaEiwml0jOju4Ld
         n4jKRUiKt37ANfZUm+4Uy8AZnjavPn7IcB2h1SIFEdf3aLlJSQ11DkNYg1WkhOYfB/Le
         AA660cmkGv7p6QK4OlztbNJwtuN2bF12QYFFwjBddoo2ZCDOkdbOiElArJUwyjqk/apD
         PR7Q==
X-Gm-Message-State: ACgBeo1fh1/iVbGJ4AzVBzOjIk1cYbIKtq71PEGbcmNI4THYdrSz+bVo
	SyxoJ3wYqZhnFbj+a++q8sYUkhcIEw==
X-Google-Smtp-Source: AA6agR5xBByy/fS0NrDukCjY5rekFdT4IFKnlapx4jdlHE1l/syccKxffvQh9NQO9JdsJbFrqsl3sAd60w==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a67:ec86:0:b0:398:4db6:61d with SMTP id
 h6-20020a67ec86000000b003984db6061dmr6431963vsp.27.1663019161870; Mon, 12 Sep
 2022 14:46:01 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:45:56 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214559.929186-1-nhuck@google.com>
Subject: [PATCH] staging: rtl8192u: Fix return type of ieee80211_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of ieee80211_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
index 8602e3a6c837..e4b6454809a0 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
@@ -526,7 +526,7 @@ static void ieee80211_query_seqnum(struct ieee80211_device *ieee,
 	}
 }
 
-int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct ieee80211_device *ieee = netdev_priv(dev);
 	struct ieee80211_txb *txb = NULL;
@@ -822,13 +822,13 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
 			if ((*ieee->hard_start_xmit)(txb, dev) == 0) {
 				stats->tx_packets++;
 				stats->tx_bytes += __le16_to_cpu(txb->payload_size);
-				return 0;
+				return NETDEV_TX_OK;
 			}
 			ieee80211_txb_free(txb);
 		}
 	}
 
-	return 0;
+	return NETDEV_TX_OK;
 
  failed:
 	spin_unlock_irqrestore(&ieee->lock, flags);
-- 
2.37.2.789.g6183377224-goog

