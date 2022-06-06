Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024233CB
	for <llvm@lists.linux.dev>; Mon,  6 Jun 2022 21:29:24 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso12534172pjb.0
        for <llvm@lists.linux.dev>; Mon, 06 Jun 2022 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odMP8YaFR56FxE9gIxvNfOsgd/PxqzctvJexxXEWFD8=;
        b=oLsfi/lp/l6YwiM10vHSZRhGy52a6njFYGpJzMQRrAp1BRlICr0p/ZQWsthnsY5iei
         sl0PF0smIcsxMDEz6LWMTPliSXI7I0fAgORgfKas1SecDlREvS0ROFO59NlyJbYkkTYh
         XUT0xDMsfb899ULSvCnb4kH9CZwEo0pM3tZuMMYBYGy862kZdaKza73D9m0CY7lGXSRq
         rb3t416NuYUGS/XmjqXyIZeZUODxm0LgSRanmJPLVewgSCTKdchky6IedxOv/w8ohcgQ
         sG32FVvshSewGCOy1R388FZUlhOjbvKkaY9kljuTruUk9q1N28yOjppSNb0xD6nvsAh7
         qFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odMP8YaFR56FxE9gIxvNfOsgd/PxqzctvJexxXEWFD8=;
        b=UpUYdtFRMgaG3dbE1R/KTKK6JpQ8JY2uMSKmshJyDjV810kMjsGvRTAClcyVljJanR
         WiO6tZ6Bcp8H/UQh+U8Uw7uRVJKvm7aQ92e1v53W6+mLMLj5njYU+fDYNggYhk7Ay/W8
         dIc6ciMrMCYpyBsafWcMeRcsF9ggy391oIsxQy3ym3MaeS0LVrM+7GJDIrOQdB/XaxtK
         cQkfB+AIuTTRfWQCZBD0AIKQ34Ttl5YxkCItB14kDcZoqyxy4HXvAdE1GhBv60u6bmSZ
         MMmYYoO5X5ZIs8WpUF+4pfzqprsuMddtUI9glKtV7rFlmnLyfuAfXiRP/WPJ2MBFDN/P
         Jzjg==
X-Gm-Message-State: AOAM531QCAciYzTdfOj3ZIHDtn5frPhcxzCZf/EqHAJSNeeYYfzA6uOk
	a+8O2cDCWbG/xDRN9skGsjY=
X-Google-Smtp-Source: ABdhPJzbltYKeg65j1Pm47koejqOkd0YNhc00et+kEaJlfci11uu3veZmgRAg1zAWgvvZpUKaPgyaw==
X-Received: by 2002:a17:903:200c:b0:163:d4c3:f24f with SMTP id s12-20020a170903200c00b00163d4c3f24fmr26395645pla.78.1654550964454;
        Mon, 06 Jun 2022 14:29:24 -0700 (PDT)
Received: from penguin.lxd ([2a00:79e1:abc:1539:216:3eff:fe31:a1ca])
        by smtp.googlemail.com with ESMTPSA id ci6-20020a17090afc8600b001e0d197898dsm16217158pjb.3.2022.06.06.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 14:29:24 -0700 (PDT)
From: Justin Stitt <jstitt007@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Justin Stitt <jstitt007@gmail.com>
Subject: [PATCH] netfilter: conntrack: fix this -Wformat clang warning:
Date: Mon,  6 Jun 2022 14:28:19 -0700
Message-Id: <20220606212819.9548-1-jstitt007@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 | net/netfilter/nf_conntrack_standalone.c:63:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->src.u.tcp.port),
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | net/netfilter/nf_conntrack_standalone.c:64:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->dst.u.tcp.port));
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | net/netfilter/nf_conntrack_standalone.c:69:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->src.u.udp.port),
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | net/netfilter/nf_conntrack_standalone.c:70:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->dst.u.udp.port));
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | net/netfilter/nf_conntrack_standalone.c:75:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->src.u.dccp.port),
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | net/netfilter/nf_conntrack_standalone.c:76:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->dst.u.dccp.port));
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | net/netfilter/nf_conntrack_standalone.c:80:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->src.u.sctp.port),
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | net/netfilter/nf_conntrack_standalone.c:81:7: warning: format specifies type
 | 'unsigned short' but the argument has type 'int' [-Wformat]
 |                            ntohs(tuple->dst.u.sctp.port));
 |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Variadic functions (printf-like) undergo default argument promotion.
Documentation/core-api/printk-formats.rst specifically recommends
using the promoted-to-type's format flag.

Also, as per C11 6.3.1.1:
(https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf)
`If an int can represent all values of the original type ..., the
value is converted to an int; otherwise, it is converted to an
unsigned int. These are called the integer promotions.`
Thus it makes sense to change %hu (as well as %u) to %d.

Signed-off-by: Justin Stitt <jstitt007@gmail.com>
---
 net/netfilter/nf_conntrack_standalone.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index 6ad7bbc90d38..afbec8a12c5e 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -53,30 +53,30 @@ print_tuple(struct seq_file *s, const struct nf_conntrack_tuple *tuple,
 
 	switch (l4proto->l4proto) {
 	case IPPROTO_ICMP:
-		seq_printf(s, "type=%u code=%u id=%u ",
+		seq_printf(s, "type=%d code=%d id=%d ",
 			   tuple->dst.u.icmp.type,
 			   tuple->dst.u.icmp.code,
 			   ntohs(tuple->src.u.icmp.id));
 		break;
 	case IPPROTO_TCP:
-		seq_printf(s, "sport=%hu dport=%hu ",
+		seq_printf(s, "sport=%d dport=%d ",
 			   ntohs(tuple->src.u.tcp.port),
 			   ntohs(tuple->dst.u.tcp.port));
 		break;
 	case IPPROTO_UDPLITE:
 	case IPPROTO_UDP:
-		seq_printf(s, "sport=%hu dport=%hu ",
+		seq_printf(s, "sport=%d dport=%d ",
 			   ntohs(tuple->src.u.udp.port),
 			   ntohs(tuple->dst.u.udp.port));
 
 		break;
 	case IPPROTO_DCCP:
-		seq_printf(s, "sport=%hu dport=%hu ",
+		seq_printf(s, "sport=%d dport=%d ",
 			   ntohs(tuple->src.u.dccp.port),
 			   ntohs(tuple->dst.u.dccp.port));
 		break;
 	case IPPROTO_SCTP:
-		seq_printf(s, "sport=%hu dport=%hu ",
+		seq_printf(s, "sport=%d dport=%d ",
 			   ntohs(tuple->src.u.sctp.port),
 			   ntohs(tuple->dst.u.sctp.port));
 		break;
-- 
2.30.2

