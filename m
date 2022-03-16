Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009AE2FB3
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:31:09 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2d6914a097cso29299517b3.10
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ClWHWDT7CX049DHEiNtpDNX5IpgHCXZ+VwyNFz6LgH0=;
        b=BgQoxgdV5GOf73pfQ/WGP4djssW35zmCCWWBcMg3sKVKaKAWoOy478TcfMYceVJP8E
         d78fbbA0woG1yefDfcPn10hFACuxmUhkh7435xs2Fr5UspRjKPdK7tixH+jn45ffsUcW
         Ieiqv5l/vOMll5MF6qYxGRU4iZ1V7BmSQy82orwqmrP4m+BtsynWLXgmDzioTbJVAYTI
         P0errtDwv+j1WQKwZ6PHhWWsJAQnQ3rQif7rrpsb5LjvwkSzzI+6vrP1tDU60hF/Hg26
         tSilzYtb93Tb/PdVXivKjZRL4Il4/TF5yLm0xYleD3waElFNybR1oT+/CNSR5rs+NjoB
         MCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ClWHWDT7CX049DHEiNtpDNX5IpgHCXZ+VwyNFz6LgH0=;
        b=K56/kkl0uXOH/ARCajo6ygWUKE835bC/tRdABWy+00u4XNeYEAUoIrZH8fNNeUAw/A
         QONyvr67YEw2TFBMVIRhMSyGrNDcB0VB5stSWhl7P2eMBpcfoy2dTWMykUGe75P9UuXt
         iTjMTlTIh8Q5U8+7Pq5de8CjXFrrX9a2KwsG8Oo8BWaOaLvoDms27aEbuyyCyIVV46G2
         0+R7ZyuK9sMyE2JHUN1WxjmliVB2/GQYUK1sEXNo8yWaOiYyhy88hoEtpfCJI3hyzhoq
         m2hZNnGcELwV701XU1/mLM5OPfLVk+Xy9E0JAKKZ1lzdg/n1N7RTseO40Cj6EmindcoJ
         VYWQ==
X-Gm-Message-State: AOAM5325DD4Sfh8OxMYJ4B+SaNkFXegHPJ9noq0aWsKJVh1hDWhYTUAW
	WYI3eCcLdcA+lzb02hzSpBWtwdFa
X-Google-Smtp-Source: ABdhPJx/jiIIlpFV/7eSyVqL8KKvmkPZhl1KWSpn6H+MQ7NUic0LfWYxav/NY2cKUYF59mOTgJAKzHruOw==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a81:6c97:0:b0:2e5:7aff:723d with SMTP id
 h145-20020a816c97000000b002e57aff723dmr2560658ywc.144.1647466269060; Wed, 16
 Mar 2022 14:31:09 -0700 (PDT)
Date: Wed, 16 Mar 2022 14:31:04 -0700
Message-Id: <20220316213104.2351651-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] bnx2x: use correct format characters
From: Bill Wendling <morbo@google.com>
To: Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>, 
	Manish Chopra <manishc@marvell.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warnings:

drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:6181:40: warning: format
specifies type 'unsigned short' but the argument has type 'u32'
(aka 'unsigned int') [-Wformat]
        ret = scnprintf(str, *len, "%hx.%hx", num >> 16, num);
                                    ~~~       ^~~~~~~~~
                                    %x
drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:6181:51: warning: format
specifies type 'unsigned short' but the argument has type 'u32'
(aka 'unsigned int') [-Wformat]
        ret = scnprintf(str, *len, "%hx.%hx", num >> 16, num);
                                        ~~~              ^~~
                                        %x
drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:6196:47: warning: format
specifies type 'unsigned char' but the argument has type 'u32'
(aka 'unsigned int') [-Wformat]
        ret = scnprintf(str, *len, "%hhx.%hhx.%hhx", num >> 16, num >> 8, num);
                                    ~~~~             ^~~~~~~~~
                                    %x
drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:6196:58: warning: format
specifies type 'unsigned char' but the argument has type 'u32'
(aka 'unsigned int') [-Wformat]
        ret = scnprintf(str, *len, "%hhx.%hhx.%hhx", num >> 16, num >> 8, num);
                                         ~~~~                   ^~~~~~~~
                                         %x
drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:6196:68: warning: format
specifies type 'unsigned char' but the argument has type 'u32'
(aka 'unsigned int') [-Wformat]
        ret = scnprintf(str, *len, "%hhx.%hhx.%hhx", num >> 16, num >> 8, num);
                                              ~~~~                        ^~~
                                              %x

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct ones for ints and unsigned
ints.

Link: ClangBuiltLinux/linux#378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
index 4e85e7dbc2be..bede16760388 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
@@ -6178,7 +6178,7 @@ static int bnx2x_format_ver(u32 num, u8 *str, u16 *len)
 		return -EINVAL;
 	}
 
-	ret = scnprintf(str, *len, "%hx.%hx", num >> 16, num);
+	ret = scnprintf(str, *len, "%x.%x", num >> 16, num);
 	*len -= ret;
 	return 0;
 }
@@ -6193,7 +6193,7 @@ static int bnx2x_3_seq_format_ver(u32 num, u8 *str, u16 *len)
 		return -EINVAL;
 	}
 
-	ret = scnprintf(str, *len, "%hhx.%hhx.%hhx", num >> 16, num >> 8, num);
+	ret = scnprintf(str, *len, "%x.%x.%x", num >> 16, num >> 8, num);
 	*len -= ret;
 	return 0;
 }
-- 
2.35.1.723.g4982287a31-goog

