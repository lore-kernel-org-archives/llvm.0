Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948B153A5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 18:14:18 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-35076702654so20956497b3.17
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 11:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=jYPKWuT1u5m0MnKr4TovJZUrMbudnfje+CzX8rxj9dY=;
        b=Ury0CFn0zT2Q+dgdtmwk3iQr3s9PWnviEmpKdjL2ckeEaSmqrBmREvZyOZsYx7mfNx
         ECzbRm2XMKNf8IHIfQieAGeVmFDIKL4DvNsgEpkMewEU+OzV/roiRamuWScwv9Oc1wRN
         ijQp0mOci65LBvTFCA0oCNoNC8WlfpZsz+Tq7aVC8M0pO+Hj+OnGwI5r7GGQ2npv/b+V
         21bRDiDcuTW39u8v2MFAmqGu/gcyiUSyN20+vWsHPh1gtHAvk8ThOVjIFxdOBhx8XTyc
         jfszHIqgdfl0jAOVUeHhK+UvFa1CyD4djovV+L8K84r1YaiZsjc9wGyt7ZHsGqI8mieF
         JEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=jYPKWuT1u5m0MnKr4TovJZUrMbudnfje+CzX8rxj9dY=;
        b=KSPx5s5kn8+ff9jMZykjdV2m4RCzTVFAzvxt/b1oIST1F6Iqp5x5zrS4wOjTa6ztUf
         nBsW/sX8LHeMZAWy4hJcJPsUaji2vOropWDssGgen6d6x8dUvTujXCp+KqUMA9vvvkjd
         +DCNtDo1NqfTM/vswUg69w3F576rUOY6Wyhe0oDwBOyb3K1dkk2U3jdj7WLmVEBBjb1t
         qrJr9T9sjEm0hOmyb0w5zK/BeL32V8DMDVqNEuMa4sB5sAZEUUckVmkshwdrbo/zH1jk
         Rb1FSc89O9yZe6JgE8Z7DbYWompl0K6ZSiMwbEfvcfD99bwH/dtKgY8ARkkRi9ioCe14
         NV9A==
X-Gm-Message-State: ACrzQf3HEOumrFGck7GFvIi6mywUco9ufVCHDRKTOTE+/RoCmaQyjUJR
	pO7RxepLbUkvRzifZjWz9GL0+pIwog==
X-Google-Smtp-Source: AMsMyM6Pf2IhccLpOcVpEi4t74u7CQmid4Z2TwcCudea8RUMSv/ibgUI3NSufaIAn+mbxQCtqU2gHTq9QA==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:9104:0:b0:6bc:5ecf:30b7 with SMTP id
 v4-20020a259104000000b006bc5ecf30b7mr4758739ybl.293.1664475257510; Thu, 29
 Sep 2022 11:14:17 -0700 (PDT)
Date: Thu, 29 Sep 2022 11:14:11 -0700
In-Reply-To: <20220919182832.158c0ea2@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220919182832.158c0ea2@kernel.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20220929181411.61331-1-nhuck@google.com>
Subject: [PATCH v2] net: mana: Fix return type of mana_start_xmit
From: Nathan Huckleberry <nhuck@google.com>
To: kuba@kernel.org
Cc: davem@davemloft.net, decui@microsoft.com, edumazet@google.com, 
	error27@gmail.com, haiyangz@microsoft.com, kys@microsoft.com, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	netdev@vger.kernel.org, nhuck@google.com, pabeni@redhat.com, 
	sthemmin@microsoft.com, trix@redhat.com, wei.liu@kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mana_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Dexuan Cui <decui@microsoft.com>
---

Changes v1 -> v2
- Update header file

 drivers/net/ethernet/microsoft/mana/mana_en.c | 2 +-
 include/net/mana/mana.h                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microsoft/mana/mana_en.c b/drivers/net/ethernet/microsoft/mana/mana_en.c
index 7ca313c7b7b3..a3df5678bb4f 100644
--- a/drivers/net/ethernet/microsoft/mana/mana_en.c
+++ b/drivers/net/ethernet/microsoft/mana/mana_en.c
@@ -141,7 +141,7 @@ static int mana_map_skb(struct sk_buff *skb, struct mana_port_context *apc,
 	return -ENOMEM;
 }
 
-int mana_start_xmit(struct sk_buff *skb, struct net_device *ndev)
+netdev_tx_t mana_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	enum mana_tx_pkt_format pkt_fmt = MANA_SHORT_PKT_FMT;
 	struct mana_port_context *apc = netdev_priv(ndev);
diff --git a/include/net/mana/mana.h b/include/net/mana/mana.h
index 20212ffeefb9..3bb579962a14 100644
--- a/include/net/mana/mana.h
+++ b/include/net/mana/mana.h
@@ -390,7 +390,7 @@ struct mana_port_context {
 	struct mana_ethtool_stats eth_stats;
 };
 
-int mana_start_xmit(struct sk_buff *skb, struct net_device *ndev);
+netdev_tx_t mana_start_xmit(struct sk_buff *skb, struct net_device *ndev);
 int mana_config_rss(struct mana_port_context *ac, enum TRI_STATE rx,
 		    bool update_hash, bool update_tab);
 
-- 
2.38.0.rc1.362.ged0d419d3c-goog

