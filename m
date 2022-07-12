Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A71FC1
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 20:49:16 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id o8-20020a17090ab88800b001ef81869167so78386pjr.2
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cuvq4bUWwZbFcbUnzZRr8NI/5HR3fBjcZcaAmfqVlFU=;
        b=aEc24jtNuGsFPRPw10yY+5J9BC4+vKg5SgzAyA5BOyeeAZtp1qVYQuov9ZQE9tVSbq
         OyVFIkB4pTY9mG42431wVtIjYTTcusxsK4JI63nPZTrMa9FB+es4cpteK1w3F/lvIR5E
         QUUl+GUxAxs1n4gyikaBH7XIWARwYDpWsOxBz7uXOWFTCwvO4X0+TE2/i8ucGrOa9SF0
         jilaHXW3a+P3hllpuVwfzpRwD/HCeKL9nFtnuCnULaVz6oSEGrXpaG4E7fWRV9n8PjnH
         Ffz+KnvuTlWzBFFrew6SPbOMLvQ7lxyiYlzMa2JTPXsLxDSFijK571xoMS0T7pkQ8+Um
         aQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cuvq4bUWwZbFcbUnzZRr8NI/5HR3fBjcZcaAmfqVlFU=;
        b=CfCAnXQspPrMQ8ZQ4E5BxNUc9sU+J0LodKwrI9jkFubSG/DxesHbNCxysHARt9pdoY
         3xKzIFqujwYNBIR2TmJz/jAd+B2RBxFTeB0NYgQEKvpNzj0h+mC3du6hZHxH8x0+6J3D
         y7Fd6gtCl4VBSCnpiAqxumO/hRDXcXjK9JfGIgLX8cLXcFUs/7erg5hHdT6RITc2mAlh
         zwZGpm7ZpaGJOGDwaKbTqCLXPixNV4R9c/ZedOQOb7GcrcIKUdjPZN3eeKEDS+d7yP6o
         gSnNzVuch95D4n9lts2bjsyD1Q35thjxpKbKY6SVBeHQ46b8R2+nRTvH//TMKMjFEOZq
         1KQA==
X-Gm-Message-State: AJIora8PScW12NA3MVBgf2POOlnK5VIHK8ibRUNr4fuRyDkDalJs6DxG
	rUZt9TAHzm+eTX3oDKaujwwFSfW35/SUoe/Ukg==
X-Google-Smtp-Source: AGRyM1tbq3ODEHrZNuPHyvvTyeeSArRQcxH/uOHsUPcJw0jQTZ/lUTlEFAAhYIuV6hDuQsMcDrDKTmKIu8fb3tMhoQ==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:b1e8:210d:ae12:d0df])
 (user=justinstitt job=sendgmr) by 2002:a05:6a00:a26:b0:528:9831:d935 with
 SMTP id p38-20020a056a000a2600b005289831d935mr24956851pfh.25.1657658955901;
 Tue, 12 Jul 2022 13:49:15 -0700 (PDT)
Date: Tue, 12 Jul 2022 13:49:00 -0700
In-Reply-To: <Ys3DwnYiF9eDwr2T@dev-arch.thelio-3990X>
Message-Id: <20220712204900.660569-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <Ys3DwnYiF9eDwr2T@dev-arch.thelio-3990X>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH v2] netfilter: xt_TPROXY: remove pr_debug invocations
From: Justin Stitt <justinstitt@google.com>
To: nathan@kernel.org
Cc: coreteam@netfilter.org, davem@davemloft.net, edumazet@google.com, 
	fw@strlen.de, justinstitt@google.com, kadlec@netfilter.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pabeni@redhat.com, 
	pablo@netfilter.org, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

pr_debug calls are no longer needed in this file.

Pablo suggested "a patch to remove these pr_debug calls". This patch has
some other beneficial collateral as it also silences multiple Clang
-Wformat warnings that were present in the pr_debug calls.

Suggested-by: Pablo Neira Ayuso <pablo@netfilter.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
diff from v1 -> v2:
* converted if statement one-liner style
* x == NULL is now !x

 net/netfilter/xt_TPROXY.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/net/netfilter/xt_TPROXY.c b/net/netfilter/xt_TPROXY.c
index 459d0696c91a..e4bea1d346cf 100644
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
 
@@ -122,16 +114,12 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
 	int tproto;
 
 	tproto = ipv6_find_hdr(skb, &thoff, -1, NULL, NULL);
-	if (tproto < 0) {
-		pr_debug("unable to find transport header in IPv6 packet, dropping\n");
+	if (tproto < 0)
 		return NF_DROP;
-	}
 
 	hp = skb_header_pointer(skb, thoff, sizeof(_hdr), &_hdr);
-	if (hp == NULL) {
-		pr_debug("unable to grab transport header contents in IPv6 packet, dropping\n");
+	if (!hp)
 		return NF_DROP;
-	}
 
 	/* check if there's an ongoing connection on the packet
 	 * addresses, this happens if the redirect already happened
@@ -168,19 +156,10 @@ tproxy_tg6_v1(struct sk_buff *skb, const struct xt_action_param *par)
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

