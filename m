Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBA812
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:27:04 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id a126-20020a254d84000000b0066ec586adafso64093ybb.12
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Ve6oVejVoHe94bNa2F7Xf7bSBWGFdxZz7tlbGpk1Sxk=;
        b=sXKlEOSNgGd96A9Vg+CIJ3VEjTYQeqJKiO+SuHhf7ewn3AK6Lc5uWtw5Lj7V1uf2nc
         bqeJ38Jh7zdeUJR+VDKrPeqL8HDwi6vHPc87aX6OeJ2OQdWI5YovDZmXbpXvkkVOroRh
         VdCMbu5KniLAdZb+XkMbP0wWQPpunOGClKmWSYhmDdjKPmYKFhJBnjyiLKoAUCND6vL5
         NJ5qXBzKrEI2ZrFu5V+vpAaFUsEYJpGpAApF++2uTAD0j8iGe/bgS6bn7nuRTi0tCIBs
         zZthxEFhqHm/ttVj4kgZOPEFUf+RvcZTeSNlYXySTFk07uz2XyZE35h2hFgeNYa4PVHK
         rTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Ve6oVejVoHe94bNa2F7Xf7bSBWGFdxZz7tlbGpk1Sxk=;
        b=oMYtV2nm8X++xlrinSwlmLekWr2W3Y7DNf5izPag9PiLsgIefN5bu2l9cnRdL5uMTN
         wPGmocv9dMovxP2++J2t7Zf7H8ZIOkG+0Nhjp/QKJYLObju5s1tn70FtH6JDCLqBwtbi
         ZvCN8BFXiHNOPvGdX0RzciOPWUX/+Y6m/sv1C4P8+sU53aARUSHAFZID2nVE3Ln1Zf2g
         mVQoK3aw8dRzR+9lGNSJ/Z8ZYMftpCkDAcQjCjefOB0AyJYTXbUFf8ICicIK43tRNTFr
         zJshKQvBzyYQfh4z122UAT4Blzw5S3MsqGble4acOyRVY39UO2vl2WY0vd528Q8yYu0O
         cFAg==
X-Gm-Message-State: AJIora8zfgiV2UzvWH7Yjtkb75BC4ojnNT1Y1BGVMui2QO8ZYk4gFJgH
	ON3/jgaGlSIenrmgpuz+/5XjI78Wdp5ObWh8bQ==
X-Google-Smtp-Source: AGRyM1sNY7fz2EAZn6AtNHZP6fkSQ7jOV3bw7W8d1Zpe0HYuj7GqiA6qSNpMOcTQeY8C+RQkSDtbUWvJyGgIyt2yDw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f21c:9185:9405:36f])
 (user=justinstitt job=sendgmr) by 2002:a0d:cbd8:0:b0:31d:a46:a1ee with SMTP
 id n207-20020a0dcbd8000000b0031d0a46a1eemr6802939ywd.201.1657322823258; Fri,
 08 Jul 2022 16:27:03 -0700 (PDT)
Date: Fri,  8 Jul 2022 16:26:53 -0700
Message-Id: <20220708232653.556488-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] amd-xgbe: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter the following warning:
| drivers/net/ethernet/amd/xgbe/xgbe-dcb.c:234:42: error: format specifies
| type 'unsigned char' but the argument has type '__u16' (aka 'unsigned
| short') [-Werror,-Wformat] pfc->pfc_cap, pfc->pfc_en, pfc->mbc,
| pfc->delay);

pfc->pfc_cap , pfc->pfc_cn, pfc->mbc are all of type `u8` while pfc->delay is
of type `u16`. The correct format specifiers `%hh[u|x]` were used for
the first three but not for pfc->delay, which is causing the warning
above.

Variadic functions (printf-like) undergo default argument promotion.
Documentation/core-api/printk-formats.rst specifically recommends using
the promoted-to-type's format flag. In this case `%d` (or `%x` to
maintain hex representation) should be used since both u8's and u16's
are fully representable by an int.

Moreover, C11 6.3.1.1 states:
(https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
can represent all values of the original type ..., the value is
converted to an int; otherwise, it is converted to an unsigned int.
These are called the integer promotions.`

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
For clarification, the first three parameters given to netif_dbg did NOT
cause a -Wformat warning. I changed them simply to follow what the
standard and documentation recommend.

 drivers/net/ethernet/amd/xgbe/xgbe-dcb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c b/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
index 895d35639129..c68ace804e37 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
@@ -230,7 +230,7 @@ static int xgbe_dcb_ieee_setpfc(struct net_device *netdev,
 	struct xgbe_prv_data *pdata = netdev_priv(netdev);
 
 	netif_dbg(pdata, drv, netdev,
-		  "cap=%hhu, en=%#hhx, mbc=%hhu, delay=%hhu\n",
+		  "cap=%d, en=%#x, mbc=%d, delay=%d\n",
 		  pfc->pfc_cap, pfc->pfc_en, pfc->mbc, pfc->delay);
 
 	/* Check PFC for supported number of traffic classes */
-- 
2.37.0.rc0.161.g10f37bed90-goog

