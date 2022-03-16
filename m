Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7F33B56
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:31:14 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id b12-20020a056902030c00b0061d720e274aso2928875ybs.20
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Sppr1OS9CruOLejjk++CwGMO6tK4IY6RrP567+9z7Go=;
        b=cUUbrDv0wCM1dCYoVLBRpVW6lbnjJLGmf994bsLluq3xvbI50wZVitBfqTr8K/OM0/
         Fv92SnLdvEEg123lykqNVuI31cm2DjfFHFLtOJRWvLC9lPUR7SPUxDkuGjgyVMPHEvKy
         aVcgtC32ibp16QY+W7mCIKp4fMdu2wnHH4qvItfoeNMZT4T268l7QhJehKftmEHwlM4i
         vkg1x7j54tBhZ18ipBQf1o0iyqrIIwprDPLmAkM82B9X0tNBTkV0R+N3t76WbXIfx2wZ
         JdXZ0geG7vHrjnZV+a/oTJavh/AAk6joVVumbQP+yU6c5ChrVauPRmdppGkoHuYnKdIA
         ZOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Sppr1OS9CruOLejjk++CwGMO6tK4IY6RrP567+9z7Go=;
        b=3heNJ75F0GdRyhzxIQ6tC7oVGnS8FRG/dgrsVG5/QRdb4KjCvdkIPytnNDz5G2eAvX
         aAT/XN6cVni50ImjN75Om/kF/SvPyU4gVcNMitDQy89sNeM+/ArNaaxJBjJAotL9h3D/
         gvTVdlXo+QWRdQUe5YNc2whRhxCQt0xQukRyQNtD/5vq/00IZLOo83kRYQR2BRhOXEUM
         msKSqfifVYocWsr2XeiMPXpGQL4x89RBKxjY7Vm8c7Hrzm7Bze0WZL/M/LpCnFemBG8j
         Z1emqZkS8K4Rw6teLXWsvKC9JJlPcRIT2I38LoYdx19ttJ4l4ECmjuKTgYQiw+6CxpXg
         8qKw==
X-Gm-Message-State: AOAM530khLFlxyk9MpxkKhS41o1OYvg81iTEK6VuHQ6cwAEeOuWBi6Vw
	bHsYNkLCcFu66r0BlMeGk7+kz5ms
X-Google-Smtp-Source: ABdhPJwu/38KY1T5f/RYMYQiU6iKi97m3qbHy1HRkpa1Zk+re0CBZHDdbQiOF386tyryOopU/0MKGhDSBg==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a5b:f10:0:b0:628:8420:d694 with SMTP id
 x16-20020a5b0f10000000b006288420d694mr1979853ybr.483.1647466273437; Wed, 16
 Mar 2022 14:31:13 -0700 (PDT)
Date: Wed, 16 Mar 2022 14:31:09 -0700
Message-Id: <20220316213109.2352015-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] enetc: use correct format characters
From: Bill Wendling <morbo@google.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warning:

drivers/net/ethernet/freescale/enetc/enetc_mdio.c:151:22: warning:
format specifies type 'unsigned char' but the argument has type 'int'
[-Wformat]
                        phy_id, dev_addr, regnum);
                                          ^~~~~~
./include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                    ~~~     ^~~~~~~~~~~
./include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                        ~~~    ^~~~~~~~~~~

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct ones for ints and unsigned
ints.

Link: ClangBuiltLinux/linux#378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
index 70e6d97b380f..1c8f5cc6dec4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
@@ -147,7 +147,7 @@ int enetc_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 	/* return all Fs if nothing was there */
 	if (enetc_mdio_rd(mdio_priv, ENETC_MDIO_CFG) & MDIO_CFG_RD_ER) {
 		dev_dbg(&bus->dev,
-			"Error while reading PHY%d reg at %d.%hhu\n",
+			"Error while reading PHY%d reg at %d.%d\n",
 			phy_id, dev_addr, regnum);
 		return 0xffff;
 	}
-- 
2.35.1.723.g4982287a31-goog

