Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D75A7B
	for <llvm@lists.linux.dev>; Sat,  9 Jul 2022 00:15:42 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id z9-20020a258689000000b0066e38ab7122so137269ybk.9
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 17:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=18zwxTMww86cndEzpYub9pnZe0fDkNY6EnCvkW/t9JY=;
        b=msxqFvaOZSoAWLO402a9iXoMeeEmvOcEg5VOhX+o22iSw24U+MJ7v5aJbXYhjOXEcs
         80KPM4xIH89KOQGhECF+FEZEs0ZImyjKLbt6Mjaj7LDHuEIKn4GysLo5nD9ujirYiRc4
         IgHy2nx/83FOn6x/5OM7PPbJlxmw2aA847iuBYirfRbTGllNigutmESrvh5uJ09m2Mkv
         l1GzyelrnzqNCsFX/zFW/lxNYJkZrXMfA3eK8aHziKCL6C/UMKfsCZEgFvs42zjW7YkW
         SV0eehnKB7Ka7Mco0HyzgpIJXij9SbnHq6hNPjgtpyS3thEq/3GvRWmlVHpnOUQJW1kd
         gVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=18zwxTMww86cndEzpYub9pnZe0fDkNY6EnCvkW/t9JY=;
        b=G0+D8GjF66aXSQki2hAoBHw9lkWmPV/d1eNgD1MpzoAW9UbHZOJudFeQe0SlQhY7Lz
         KqSDl2usDjb3/eQlNaUnHbhBe84rxsJjkM58lH8CCNU+b6KNrGwVcSOliK/8cn30MVQl
         IPc9ppVUYvNm+JKh7MSHVxYNlnOE6OP666Fcw7GD+JeokjK4Pt+EQEOMq7xYHYC+ioMW
         kyVUETk9ax/5fTc9P6jbq9wbWX2jccTMUl483Rjd9TS46X0e8PrtI8ZQgjXLj8prFKZw
         Ul/aVDeVo+60V97MdyELk7spQMbjQuVuLVSpFxbtEV4cenTb/ykW075vcxMV5owVSMAb
         65Ug==
X-Gm-Message-State: AJIora8NXqs55zZ8l3fAkvzWxycVm/JTn4YVD7rifJLzvHehQ+H12kiL
	ovjIAprFcNvjyOk6sJGTRyFAeRBPzeSFBrLWgw==
X-Google-Smtp-Source: AGRyM1sfR9BLCzjhQ7iB9/w8T0nTXqnCY8GM70POd4QwcuIQdsEQRKXzL/APCV3KaFIEOVcpID4t0hTXIVbShLssFQ==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f21c:9185:9405:36f])
 (user=justinstitt job=sendgmr) by 2002:a25:907:0:b0:66e:3f14:c463 with SMTP
 id 7-20020a250907000000b0066e3f14c463mr6447554ybj.243.1657325741218; Fri, 08
 Jul 2022 17:15:41 -0700 (PDT)
Date: Fri,  8 Jul 2022 17:15:27 -0700
Message-Id: <20220709001527.618593-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] mediatek: mt76: eeprom: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter the following warning:
| drivers/net/wireless/mediatek/mt7601u/eeprom.c:193:5: error: format
| specifies type 'char' but the argument has type 'int' [-Werror,-Wformat]
| chan_bounds[idx].start + chan_bounds[idx].num - 1);

Variadic functions (printf-like) undergo default argument promotion.
Documentation/core-api/printk-formats.rst specifically recommends using
the promoted-to-type's format flag.

Moreover, C11 6.3.1.1 states:
(https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
can represent all values of the original type ..., the value is
converted to an int; otherwise, it is converted to an unsigned int.
These are called the integer promotions.`

With this information in hand, we really should stop using `%hh[dxu]` or
`%h[dxu]` as they usually prompt Clang -Wformat warnings as well as go
against documented standard recommendations.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: produced warning with x86 allyesconfig.

 drivers/net/wireless/mediatek/mt7601u/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/eeprom.c b/drivers/net/wireless/mediatek/mt7601u/eeprom.c
index aa3b64902cf9..625bebe60538 100644
--- a/drivers/net/wireless/mediatek/mt7601u/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt7601u/eeprom.c
@@ -188,7 +188,7 @@ mt7601u_set_country_reg(struct mt7601u_dev *dev, u8 *eeprom)
 
 	if (idx != -1)
 		dev_info(dev->dev,
-			 "EEPROM country region %02hhx (channels %hhd-%hhd)\n",
+			 "EEPROM country region %02x (channels %d-%d)\n",
 			 val, chan_bounds[idx].start,
 			 chan_bounds[idx].start + chan_bounds[idx].num - 1);
 	else
-- 
2.37.0.rc0.161.g10f37bed90-goog

