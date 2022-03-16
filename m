Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540A53B56
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:31:18 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2d6994a6942so29114017b3.17
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to;
        bh=Bl7MJwhFK3CmN1p0LqSa7+Zpx9isugSorKxGIE7TLbU=;
        b=ah8JhERqzsKI4zoA2wM2uCY/y/mKtUqCZoLIwB3GCdvt+R176gYWd3Ld2kbRNtnnUr
         8U9wbv3CAC9uy871ywNAiGgwkvf2m1U1vpk02cmN9umb/paDX/JSEhaidAUA1G4DjaLa
         piJhYvpV0OAAwCx9uvkOkFCvddGwkYOxWm6eHR78imHUeT5mSVGe4/2GO8O38vVlQ/Pc
         Y2YhL72G8o9DMCyMGfm2wrxfQAydVc4Qd7QhupIGdBqah1qSlM5P/thLWnxhmNyYwHmp
         /i4KM0WUSg8C87uwFk6w5KNfuGFRZ3OJ2xUbHDCy2cu2f0IkbUhFfpaksKteCqj7/715
         2zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to;
        bh=Bl7MJwhFK3CmN1p0LqSa7+Zpx9isugSorKxGIE7TLbU=;
        b=sV5S9R5rrF7IoJUGV5xuSv1K0ztvnsJ4ZURLzfu9CRPvpGjkc+s+mvjShQMo6X69AR
         IDmnfZGDhM2tte2TeE+8kQcKMNYAwc6RoQxmx1WOeRdTvCq7N5YufKt/8lxR/pgp9utL
         qBBqNsI29T1BIUXvnDgqCdHEQ2BmywiP04+OmHCSyjJIOhVBKGHjfmHfcHXQIlDWPSSG
         9LqDBu4sohJi9NYWtYA8PgkaG5k341iEQj1Egmbpg618l5jFi4fM9r34n+8kBobAehJt
         W6xRvtSEq1+jtX/vqNRjGZTr8iffo4MQWa8BWKfktw+i2mdch0B+OvVgmBuLRnRhtnN4
         Salw==
X-Gm-Message-State: AOAM532VK1Q3ZmTJPRH5Iz4GNh6wKd2egpBOpuRpjO0CL1nMszybTPoa
	7TYKl1GKJDFNRgbOLevUcQg72lcG
X-Google-Smtp-Source: ABdhPJxcu9/nbwO++m/ad4AXWkdgZrz+qZB/yIay3eyHTM4D+IPKZRAvikVbXXZyPH347XhAgqrOD/zsyA==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a25:8b8a:0:b0:62c:25e2:cf2d with SMTP id
 j10-20020a258b8a000000b0062c25e2cf2dmr2115234ybl.186.1647466277390; Wed, 16
 Mar 2022 14:31:17 -0700 (PDT)
Date: Wed, 16 Mar 2022 14:31:14 -0700
Message-Id: <20220316213114.2352352-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] net/fsl: xgmac_mdio: use correct format characters
From: Bill Wendling <morbo@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tobias Waldekranz <tobias@waldekranz.com>, Marcin Wojtas <mw@semihalf.com>, Andrew Lunn <andrew@lunn.ch>, 
	Bill Wendling <morbo@google.com>, Calvin Johnson <calvin.johnson@oss.nxp.com>, 
	Markus Koch <markus@notsyncing.net>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warning:

drivers/net/ethernet/freescale/xgmac_mdio.c:243:22: warning: format
specifies type 'unsigned char' but the argument has type 'int'
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
 drivers/net/ethernet/freescale/xgmac_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/xgmac_mdio.c b/drivers/net/ethernet/freescale/xgmac_mdio.c
index 266e562bd67a..1d5d09d2eb41 100644
--- a/drivers/net/ethernet/freescale/xgmac_mdio.c
+++ b/drivers/net/ethernet/freescale/xgmac_mdio.c
@@ -239,7 +239,7 @@ static int xgmac_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 	if ((xgmac_read32(&regs->mdio_stat, endian) & MDIO_STAT_RD_ER) &&
 	    !priv->has_a011043) {
 		dev_dbg(&bus->dev,
-			"Error while reading PHY%d reg at %d.%hhu\n",
+			"Error while reading PHY%d reg at %d.%d\n",
 			phy_id, dev_addr, regnum);
 		ret = 0xffff;
 	} else {
-- 
2.35.1.723.g4982287a31-goog

