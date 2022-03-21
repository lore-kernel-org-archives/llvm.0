Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C670736F
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 02:32:01 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id l19-20020a252513000000b00629235aacb2so11117292ybl.13
        for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=boRSKJ2tOd7N5XEAa4B8sR46+PMs9h1rt8wOI6es9nU=;
        b=e+DYSJ6J4paaD5hjVJ9z6K3g9Dlc5iJR/piV9wrM7WrJ62idld4T8gp1NZeiabtn75
         m4fc6XPBgq8fwxOKGaCHlORLI0CKCHWQahMug7WecFa9t+Did6gkp+Ruil0tcsW2gWp4
         WG6FAKuS+XCAQ34muSpOMVixjI7Bw3mDUHdOjTgYD4PFKNEY6xHkkqMcAV3MyNx/paqb
         nVZ8XJ0tzt0qGIbw5XfG/s0xpaCVpyDXkpZTO0JCCijAhOvoHbLMPlxTMrFrFR0pRBz8
         VcYeka/aU89nRe2QkdTfRzYwlLXrsXPOKlppn9kCfY7Y6tbefdlzWbLqUJNBxm5UjU9n
         m0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=boRSKJ2tOd7N5XEAa4B8sR46+PMs9h1rt8wOI6es9nU=;
        b=kSdg5gkJ63+t/eTnwEZfZtKNzgfcvZ+7pYohd3iLorfIJJ0Rg+CHBluGcnpaox2+Oi
         rEVijW0DW0/v3nwyN0uwjhxJFcUhwfxUA3H6aPNA/AajYPK7Y6R3vvqxNyhAYE592hm6
         jmxafRalck++7A19FzfkQzMySc7m5U1adv2Wn2SI0RtK1ym6MTNI5s7Lqd83eBsU3VjP
         jjk+/ijH3UN6mQ1sDigjP0vFKfofASPyoG0bz1DlYt325h78Js7+ie6/fUiAyQmgEn7+
         BZsW+b2BCPIFxfgHi/Ms2oXu5k//5oUhAkmntQZ4L25TRmD/UrlIxqUMXzvuMDkzQySH
         Z+FA==
X-Gm-Message-State: AOAM5331tncxtrqjAyt9EyNZ+bw/6Uoana6n5HK7Fz5cee7P0pnZHBT3
	+tQqQBqmbuftHwxPq8CvP2p12c7Y
X-Google-Smtp-Source: ABdhPJyzrvk3yeBbTRFVV+NGZxPwVpkPI8MBUPHkVocMLRjo1fQjiUwhSHaaXmPhtnYe163M9H0VAvC6qw==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:27bd:2eea:bd8:2ea5])
 (user=morbo job=sendgmr) by 2002:a25:86cf:0:b0:633:8702:1bb3 with SMTP id
 y15-20020a2586cf000000b0063387021bb3mr20571751ybm.515.1647829920673; Sun, 20
 Mar 2022 19:32:00 -0700 (PDT)
Date: Sun, 20 Mar 2022 19:31:55 -0700
Message-Id: <20220321023155.106066-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Subject: [PATCH] bnx2x: truncate value to original sizing
From: Bill Wendling <morbo@google.com>
To: Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>, 
	Manish Chopra <manishc@marvell.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The original behavior was to print out unsigned short or unsigned char
values. The change in commit d65aea8e8298 ("bnx2x: use correct format
characters") prints out the whole value if not truncated. So truncate
the value to an unsigned {short|char} to retain the original behavior.

Fixes: d65aea8e8298 ("bnx2x: use correct format characters")
Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
index bede16760388..7071604f9984 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
@@ -6178,7 +6178,8 @@ static int bnx2x_format_ver(u32 num, u8 *str, u16 *len)
 		return -EINVAL;
 	}
 
-	ret = scnprintf(str, *len, "%x.%x", num >> 16, num);
+	ret = scnprintf(str, *len, "%x.%x", (num >> 16) & 0xFFFF,
+			num & 0xFFFF);
 	*len -= ret;
 	return 0;
 }
@@ -6193,7 +6194,8 @@ static int bnx2x_3_seq_format_ver(u32 num, u8 *str, u16 *len)
 		return -EINVAL;
 	}
 
-	ret = scnprintf(str, *len, "%x.%x.%x", num >> 16, num >> 8, num);
+	ret = scnprintf(str, *len, "%x.%x.%x", (num >> 16) & 0xFF,
+			(num >> 8) & 0xFF, num & 0xFF);
 	*len -= ret;
 	return 0;
 }
-- 
2.35.1.894.gb6a874cedc-goog

