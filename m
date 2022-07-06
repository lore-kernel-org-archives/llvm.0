Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16196665
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 23:09:14 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id p7-20020a25d807000000b0066e36989a90so7971741ybg.8
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=BL8nemdk5jEzjtFa4MSk1HVUJ0DaNKbCAoFg6fYn++s=;
        b=bglLJQL0h0LHXKQkfXprS+IpuekCyezknrwX1b1oldcSMzxc5+EEJF3XGtp3A/3t0A
         n+UK7hqnSo2sXYyAXnzGeqP5+z7VVWjBmiN77PQlDj3puZvNQR2CkJg+FZyoC0dzAQjZ
         xLBRB1+8NZx7VNI4Jz+h2fcGfm34nzXCE5Q7gzTeFvc4X1LCLceKuet9sGBsWFYPOHKj
         OpScw7YhRBAsM4+Z7ZZvHau/4fQPGNPWHheGQjbLFXTGAPmrQPmo1gMLc3NVP18LlLIT
         GSc2YM+56q4+EPWoJ7rw7pUqpPEBwAbjI8S4g4/g52pqsd4QHGppIoZ/4YhFj5OYSTtp
         cj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=BL8nemdk5jEzjtFa4MSk1HVUJ0DaNKbCAoFg6fYn++s=;
        b=TIgEl/rKf2PZy2ZlKbGPVY2++W2IS2X1EVoE4B6M2/cMcRdTooXWzsnGg8c6jQZ2u7
         2QLCkbCu/7YdKC346J+LAsuQJcWZmShNYxyjIal5kB6M0ckoa4CGVNRie2teRE/yVcP2
         WXLDeUFh1Rahd3XjSfjfOx6+bmfW7R12h4g1dyVvn5IPM/XWZjNX0RLalqrhLcA3DXTi
         /hqzQuJDSplINBH4GLw6EOipyiXB7VNrLfx17QItxzu5+FZYuFnzQ5AiK4Lj3SLfrq8P
         VbF/zZyu6SpSOMWXenR1EB5uBM+ASBCjN2V8X4BggPiPnoFsJOmTTbwETcpsRCBiErFy
         ZZhQ==
X-Gm-Message-State: AJIora/3eYKe7lWsVc7tRTSFhYds1Sfc/FzuagAxyo8WuBjxNiguwtQI
	zv4Hz/KWblSXz1Ie5L7oB8fb0U+WY8TP3JoDVA==
X-Google-Smtp-Source: AGRyM1txsNJpY89zwG+BQrlq4nx6igRgprquPYja0YIDI7rQxI9toEk3RzABG7zH+vtUrGf6FLMYfUagNFNB7tZ6Kw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:aab2:e000:4b5a:a767])
 (user=justinstitt job=sendgmr) by 2002:a0d:d387:0:b0:31c:d2e1:9277 with SMTP
 id v129-20020a0dd387000000b0031cd2e19277mr11472480ywd.421.1657148953698; Wed,
 06 Jul 2022 16:09:13 -0700 (PDT)
Date: Wed,  6 Jul 2022 16:08:33 -0700
Message-Id: <20220706230833.535238-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] net: l2tp: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: James Chapman <jchapman@katalix.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with clang we encounter this warning:
| net/l2tp/l2tp_ppp.c:1557:6: error: format specifies type 'unsigned
| short' but the argument has type 'u32' (aka 'unsigned int')
| [-Werror,-Wformat] session->nr, session->ns,

Both session->nr and session->ns are of type u32. The format specifier
previously used is `%hu` which would truncate our unsigned integer from
32 to 16 bits. This doesn't seem like intended behavior, if it is then
perhaps we need to consider suppressing the warning with pragma clauses.

This patch should get us closer to the goal of enabling the -Wformat
flag for Clang builds.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 net/l2tp/l2tp_ppp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index 8be1fdc68a0b..db2e584c625e 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -1553,7 +1553,7 @@ static void pppol2tp_seq_session_show(struct seq_file *m, void *v)
 		   session->lns_mode ? "LNS" : "LAC",
 		   0,
 		   jiffies_to_msecs(session->reorder_timeout));
-	seq_printf(m, "   %hu/%hu %ld/%ld/%ld %ld/%ld/%ld\n",
+	seq_printf(m, "   %u/%u %ld/%ld/%ld %ld/%ld/%ld\n",
 		   session->nr, session->ns,
 		   atomic_long_read(&session->stats.tx_packets),
 		   atomic_long_read(&session->stats.tx_bytes),
-- 
2.37.0.rc0.161.g10f37bed90-goog

