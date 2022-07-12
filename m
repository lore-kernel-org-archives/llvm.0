Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27C23A4
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 18:35:03 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id gg8-20020a17090b0a0800b001efa2036d5fso4114963pjb.4
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 11:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=aTFa+EXvspcGAaBNVFKNjAnYDuS4P2vMVH5b6FohaN0=;
        b=PxFEJSeldFwzWT/ph478MqOUHbaDyBkFP5YVbw2uC7i8ch7kIt7z2Kd13rfQsnd4J4
         ihsTP3NXqEr3e1i+6fCQf9dAWOgqkbK92Xr+/BOwO+hxTGdCyztyA3XWWNTQSkkkpZEi
         DKCnEk5o4jIqddeT3oqzM2ymhe8BRFGVQ6liu2WAnOJWGBD2AoIwosYw9zw61wZEgWtK
         qkojML11B+F8ndVNJl82aFFeMPeQevywCc0Xk2YuUPPJhhiMNU5z3NVUbWzXFGLhZqbH
         C+yG/gNVbNdkCO67Mfhi9qjzFMop9H+YTsCkfdbHDUAoko5638JvKH9nOV5FQpB3k5vc
         KB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=aTFa+EXvspcGAaBNVFKNjAnYDuS4P2vMVH5b6FohaN0=;
        b=u8EGUBHXcreDLLoHty8OlTQtgdX24qtyzqXijJk714I7Y53nP56ilaC8JjoAc9NZ7U
         F0vTCZbU4Dj04762x91AthJZ0wOtWUUI9mBsDke7alALWV1LH+QxECHxo3gQJuvSuVyn
         93BSHhmw5ccGG0UXMilRfHRUquKqyOx7ZHF8zyaAmaPVuPzbew66As/hv68bvhXxP6dp
         KJMX9Q2KZCIIIw7Na9SMSunJ2cSqMI12VFJRptYnRrnctQyQSngW0o/TRXphSpweDlwa
         MysqyyNJETw0zCA17fDvFSJCe1a/kmbA88+HDFN4MxOd1jYp+IY18kZqkA+vXzdUZon+
         c5aA==
X-Gm-Message-State: AJIora/2KLvUMAwYq9oCLRo5+wS3/S472lwbNctjUpNdUT0uHG6gJaHA
	Sl+xrfvfXdDEJbYreWiAeB0/VJmdUyaUEc12aA==
X-Google-Smtp-Source: AGRyM1u2jFGn06qwns9QwaUZtogt9vhqbc3XHrPa+A5/DP9jt5eA8c+8dgfFzOmuVTewki+898hLqu6jkozgkPoeVw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:b1e8:210d:ae12:d0df])
 (user=justinstitt job=sendgmr) by 2002:aa7:88d5:0:b0:52a:ea1f:50c6 with SMTP
 id k21-20020aa788d5000000b0052aea1f50c6mr3988540pff.81.1657650903009; Tue, 12
 Jul 2022 11:35:03 -0700 (PDT)
Date: Tue, 12 Jul 2022 11:34:52 -0700
In-Reply-To: <Ys0zZACWwGilTwHx@salvia>
Message-Id: <20220712183452.2949361-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <Ys0zZACWwGilTwHx@salvia>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] netfilter: xt_TPROXY: remove pr_debug invocations
From: Justin Stitt <justinstitt@google.com>
To: pablo@netfilter.org
Cc: coreteam@netfilter.org, davem@davemloft.net, edumazet@google.com, 
	fw@strlen.de, justinstitt@google.com, kadlec@netfilter.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, pabeni@redhat.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

pr_debug calls are no longer needed in this file.

Pablo suggested "a patch to remove these pr_debug calls". This patch has
some other beneficial collateral as it also silences multiple Clang
-Wformat warnings that were present in the pr_debug calls.

Suggested-by: Pablo Neira Ayuso <pablo@netfilter.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Suggestion here: https://lore.kernel.org/all/Ys0zZACWwGilTwHx@salvia/

 net/netfilter/xt_TPROXY.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/net/netfilter/xt_TPROXY.c b/net/netfilter/xt_TPROXY.c
index 459d0696c91a..dc7284e6357b 100644
--- a/net/netfilter/xt_TPROXY.c
+++ b/net/netfilter/xt_TPROXY.c
@@ -74,18 +74,10 @@ tproxy_tg4(struct net *net, struct sk_buff *skb, __be32 laddr, __be16 lport,
 		/* This should be in a separate target, but we don't do multiple
 		   targets on the same rule yet */
 		skb->mark = (skb->mark & ~mark_mask) ^ mark_value;
-
-		pr_debug("redirecting: proto %hhu %pI4:%hu -> %pI4:%hu, mark: %x\n",
-			 iph->protocol, &iph->daddr, ntohs(hp->dest),
-			 &laddr, ntohs(lport), skb->mark);
-
 		nf_tproxy_assign_sock(skb, sk);
 		return NF_ACCEPT;
 	}
 
-	pr_debug("no socket, dropping: proto %hhu %pI4:%hu -> %pI4:%hu, mark: %x\n",
-		 iph->protocol, &iph->saddr, ntohs(hp->source),
-		 &iph->daddr, ntohs(hp->dest), skb->mark);
 	return NF_DROP;
 }
 
@@ -123,13 +115,11 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
 
 	tproto = ipv6_find_hdr(skb, &thoff, -1, NULL, NULL);
 	if (tproto < 0) {
-		pr_debug("unable to find transport header in IPv6 packet, dropping\n");
 		return NF_DROP;
 	}
 
 	hp = skb_header_pointer(skb, thoff, sizeof(_hdr), &_hdr);
 	if (hp == NULL) {
-		pr_debug("unable to grab transport header contents in IPv6 packet, dropping\n");
 		return NF_DROP;
 	}
 
@@ -168,19 +158,10 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
 		/* This should be in a separate target, but we don't do multiple
 		   targets on the same rule yet */
 		skb->mark = (skb->mark & ~tgi->mark_mask) ^ tgi->mark_value;
-
-		pr_debug("redirecting: proto %hhu %pI6:%hu -> %pI6:%hu, mark: %x\n",
-			 tproto, &iph->saddr, ntohs(hp->source),
-			 laddr, ntohs(lport), skb->mark);
-
 		nf_tproxy_assign_sock(skb, sk);
 		return NF_ACCEPT;
 	}
 
-	pr_debug("no socket, dropping: proto %hhu %pI6:%hu -> %pI6:%hu, mark: %x\n",
-		 tproto, &iph->saddr, ntohs(hp->source),
-		 &iph->daddr, ntohs(hp->dest), skb->mark);
-
 	return NF_DROP;
 }
 
-- 
2.37.0.144.g8ac04bfd2-goog

