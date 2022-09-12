Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D05C82
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:45:08 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-345482ec6adso85529037b3.18
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=svnXtkM3VxepqSEU29BlbteQjSXrw1OiHP05DgD2OTE=;
        b=cSiuqTmx400s/KFfx8exUIDTtsSBF+4IoXHY0dMeGOxNtYmvK0kzE1KPHnzi1YYKA1
         okKa3qgpeddDmz1cICme6A9JcDEvAwoCsC4erOmWQyMpNwMB4pKO9PssQfwiPHCykzpm
         ihBhYOrA5sG4HyiD9ZhcEwUmbBG1JGhAQ4kO7oUgXb39cgBGAnnsLinrnepILLOJuKy2
         LuwDcZE7s7+2HTUrSvIZusmZVRtRW7jfYDc5b40sc8kjzhdHD0W4oWxrvrbf6IKCZeXz
         mKic6hXSnNr9CBS221E7UTg834Psm6IgXL08SoLydXhKfqps3X0kwsP1fKqmitFeYi+W
         MWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=svnXtkM3VxepqSEU29BlbteQjSXrw1OiHP05DgD2OTE=;
        b=jWY5rR6KRh2g03Wm+83xoMWrnHvkPzCGm5ydK+MC0lZhMPpu613V+q5ChAqUs3f4Hy
         c4aP+iuyy7bgZWPZ1PsJYFz0TYhDAjHrjyN9ZrW2qU2aVdWg1AoUT08XyGfO1rfomsxK
         UzdaDYSuNdVO1ABUYjkkXc3+ZzVOYE0kgofBZkJt4xysM1T4BVvnUWiiEOzJ1tPXa5Af
         e25qbPzonGI95lkJXh1nEXtDx2b9Ikg4k39WoTaLCu8rWLKCC5RvaxrkIzrJq35NIxxj
         rkOmxh/RvnhiR8dMCfaNa4s9Ew4P9Y1WDE/bRJr5YQNs/3kkVRaSYmsg0xXeiT75NZ9+
         o2Mw==
X-Gm-Message-State: ACgBeo3IJfmVtN3hDEs5cFPW2OEbsQUMvS+M0Ut/wultv/S6wqEesgGx
	1O2UuymW7o2/I8vmZjv8qEUtstM1Lg==
X-Google-Smtp-Source: AA6agR5AYHR/zt+Sj+LJE5nbkcAXQKcEzulFFGGAMAeZPz0T1K1BgaaPGpIgNiOXaGvh7yOVBAvnuYB8zw==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a0d:d84b:0:b0:345:342:2c57 with SMTP id
 a72-20020a0dd84b000000b0034503422c57mr23200506ywe.168.1663019107314; Mon, 12
 Sep 2022 14:45:07 -0700 (PDT)
Date: Mon, 12 Sep 2022 14:44:55 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912214455.929028-1-nhuck@google.com>
Subject: [PATCH] net: wwan: iosm: Fix return type of ipc_wwan_link_transmit
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	M Chetan Kumar <m.chetan.kumar@intel.com>, Intel Corporation <linuxwwan@intel.com>, 
	Loic Poulain <loic.poulain@linaro.org>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of ipc_wwan_link_transmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/wwan/iosm/iosm_ipc_wwan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_wwan.c b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
index 27151148c782..03757ad21d51 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_wwan.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
@@ -103,8 +103,8 @@ static int ipc_wwan_link_stop(struct net_device *netdev)
 }
 
 /* Transmit a packet */
-static int ipc_wwan_link_transmit(struct sk_buff *skb,
-				  struct net_device *netdev)
+static netdev_tx_t ipc_wwan_link_transmit(struct sk_buff *skb,
+					  struct net_device *netdev)
 {
 	struct iosm_netdev_priv *priv = wwan_netdev_drvpriv(netdev);
 	struct iosm_wwan *ipc_wwan = priv->ipc_wwan;
-- 
2.37.2.789.g6183377224-goog

