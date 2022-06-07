Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A67F
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 18:09:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id e66so16580559pgc.8
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oII6yRTWFDD+Q4k8Yaja3vpjYAReRDKJjccSYVuQisY=;
        b=lBKeAbhb7gONKWngQYHG37Z4tAuGFJujVbH1nuw5cYFPZdOJ1y0KGvPS8k6amkQWVI
         tl0+zpCC69EPtEi4/ixKawWdGT+r81XlEEaXHmbFxKRIWo6ArXtWCRR6HkSbkZ+CT34q
         BF/Jh7KAP7ctgrwC3U5CfRlO6K+C0SOTav+VRWvkW12nDZ8tMcleZbLQy3hIVw24ZUhd
         uOFsTKb+b5aC3L0+Xnt3OKyEJRDri8zi3mBuixEzMnjFpFP5Xgj1wEZYxuVy+3fhLGzo
         FQ/yC/2D3U32F308ugp8AMYyjCde27hx3ZHIm4iICf7WQvmcB8H8XxqGCiO3E1/LkQ+y
         4+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oII6yRTWFDD+Q4k8Yaja3vpjYAReRDKJjccSYVuQisY=;
        b=0BoEWY4WI7QCPb9+xAQMB5tSaBIpEZ1UrehN6xQ8U1OuheVpWdxmaRbH8dxlHHzDqg
         KIt4hgSIiuH6q5vzpJy0Zl0QSiKqHxEFFG/qnyg2eTd0oxRl/UJvDZNXTwu7/26/qMxU
         c9BbnsmJCMw3xYM3OYzBIOzFWG9z3H3EA0hvuu6tAqzSv6AHovvYIgd+PtHjLWWgSiV1
         DjQrJ3Tz5i2QUEj15ZYU+Ls6JJzNPFepwOpj5JreQiYrOGE1qtFdUg6F5+SnVP0aDQw7
         w5FgjyecDQY6HcOy0EmVD6igjN5CNHDRnwqAiRiLP5tmfqIFsiNKt2AU9AXnGIwHogVR
         7ssg==
X-Gm-Message-State: AOAM531av8GZ1PCbcVabmpMYTWj/tZ0C+upKogd1yOIYHLZmv52dR92C
	M4WXq3/Bx6UK6rrpPaTreOA=
X-Google-Smtp-Source: ABdhPJy5IhNFIqgyEL+FIyafIZMn93FeRLvz5Sed1Bug8irrwbRTfuQD8n9Xo/c2gNIBYh2usbrHQA==
X-Received: by 2002:a65:6a16:0:b0:39d:4f3:67e6 with SMTP id m22-20020a656a16000000b0039d04f367e6mr26815312pgu.84.1654625342883;
        Tue, 07 Jun 2022 11:09:02 -0700 (PDT)
Received: from penguin.lxd ([2620:0:1000:2514:216:3eff:fe31:a1ca])
        by smtp.googlemail.com with ESMTPSA id q12-20020a056a00150c00b0050dc762818dsm3383659pfu.103.2022.06.07.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:09:02 -0700 (PDT)
From: Justin Stitt <jstitt007@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <jstitt007@gmail.com>
Subject: [PATCH v2] netfilter: conntrack: Fix clang -Wformat warning in print_tuple()
Date: Tue,  7 Jun 2022 11:08:47 -0700
Message-Id: <20220607180847.13482-1-jstitt007@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Yp9uRz40J24vWLSb@dev-arch.thelio-3990X>
References: <Yp9uRz40J24vWLSb@dev-arch.thelio-3990X>
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

It should be noted that %u does not produce the same warning as %hu in this
context. However, it should probably be changed as well for consistency.

Signed-off-by: Justin Stitt <jstitt007@gmail.com>
---
 Diff between v1 -> v2:
 * update commit message and subject line
 
 Note: The architecture (arm64) is critical for reproducing this warning.
 
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

