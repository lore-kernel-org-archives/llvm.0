Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191975C82
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:45:19 +0000 (UTC)
Received: by mail-ua1-f73.google.com with SMTP id t10-20020ab046ca000000b003b39d8c5505so3088022uab.6
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=/Jj3vAgrEpX1DljkVFCcAOLTZJVyDl94mCsDlbaWTfw=;
        b=Xj4EIcIg6IC64GjjkVlNjsH5kct6/Y5PMdIvSRIi3mFav1MkwP8CBJBBQrgXLcWwZJ
         n8t2HweyN3IPZh88c7dXIZa6Ed+XYafUYg2Cu4YchtA1A/2VloWCU/68eTfZTc6P13m9
         MLDZKv3Ioa3XjGUz3RJWfA0dLhMLSEgBsgdrHEt+OdjvuBDTacKvup9GBbeV5aiT9KzF
         fQw3qMBTBXCttDB4/XfNbEsFPZGGOM4gPFH7T7L2JWdQHyy2/DDtWO1e2sCXmXYm+Efw
         Es6701+y0ZdBfst8o77qb828by0wmrKlEekuK8/s4SkkAboabONEVypQzd3GwFcRkrAY
         wlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=/Jj3vAgrEpX1DljkVFCcAOLTZJVyDl94mCsDlbaWTfw=;
        b=HdY9wg1MH4X8lD5F16Osa0u47tcy5li75olo8+U+wTMtIxIzlaaLRqODbXuh5iGMAn
         N7HPd5hITn5BRsAUul/94WUNOAN1RTW3/ljyzE+LTE8g+dzM2WwqFvUXBcgKX85D0Z76
         M0CNTc+AtZZmK2iycrjahgLZw3NhSBajlg3rxtZITIsTMMAqXel0eOAuGFxHc/XJEMvc
         09JLRhFBWAhPOnh2FoWQH4fyanYXiurEgRKaSur1+tRtXus0pGS1OQ59uaQlYgry+9SY
         /0fpeduTYCpdvA+Q11YSL2P2Io+1wyIFvE6QSTBvL9Tg1RTyTN+mOuQP49znTaOnA1D5
         qwFg==
X-Gm-Message-State: ACgBeo2MuC7eEqyrl7oCy5clV83mofRmH0Jm4ipAr5NSYtDieuEcUhpl
	gJrP+NgDMOzD2Du6a2NWYJqHcfSsDg==
X-Google-Smtp-Source: AA6agR5bYG0ltKebN2EVuVafJrdOszZ3fazLf/V8UlLwcZfm4Mig7uNZ9aE/OA5z598Sg65ynpaau5hKow==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a67:ac09:0:b0:388:70e9:63a0 with SMTP id
 v9-20020a67ac09000000b0038870e963a0mr9253277vse.56.1663019118005; Mon, 12 Sep
 2022 14:45:18 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:45:10 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214510.929070-1-nhuck@google.com>
Subject: [PATCH] net: wwan: t7xx: Fix return type of t7xx_ccmni_start_xmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Intel Corporation <linuxwwan@intel.com>, 
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>, 
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>, 
	Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, 
	Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of t7xx_ccmni_start_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/wwan/t7xx/t7xx_netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_netdev.c b/drivers/net/wwan/t7xx/t7xx_netdev.c
index c6b6547f2c6f..f71d3bc3b237 100644
--- a/drivers/net/wwan/t7xx/t7xx_netdev.c
+++ b/drivers/net/wwan/t7xx/t7xx_netdev.c
@@ -74,7 +74,7 @@ static int t7xx_ccmni_send_packet(struct t7xx_ccmni *ccmni, struct sk_buff *skb,
 	return 0;
 }
 
-static int t7xx_ccmni_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t t7xx_ccmni_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct t7xx_ccmni *ccmni = wwan_netdev_drvpriv(dev);
 	int skb_len = skb->len;
-- 
2.37.2.789.g6183377224-goog

