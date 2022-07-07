Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAE02563
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 17:32:31 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id g12-20020a05690203cc00b0066e232409c9so11141820ybs.22
        for <llvm@lists.linux.dev>; Thu, 07 Jul 2022 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ZOW+O9e31Ha/guBWas9C4Qfgb7PDwF3Uvmoup8HsfZM=;
        b=GlhRrt0eoyTgPJ3ZkpprLlEDiblR4c5+StbPFc15B+NgqrsyC9Bgtqd8oORODmdNxC
         PBdDQZrVNljnjTBl7VHyA4sNkyeLqEzJ/d6ivs5fl+ZdeFbUMMHx49jhWnMYtvZpkzvM
         fqpMYiO0hTXxPJjGoK/WtLk2t8edvuQZ7HMwY2GF0gaZYvKy3ctX9VY8JX5m1wBkQGbM
         qHcOTwu5oLwsPaJU+OjdMPCnQoHU9qaTuihen0EmtNlQtbZqw6KQWT0gTV6j9cv9S3pi
         jEanFKfAsUg/1MOqzPKKmsMsQvxLfASvRqt89JMmNLZUknVi0Gtz41bggeKnolcYIxKc
         W5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ZOW+O9e31Ha/guBWas9C4Qfgb7PDwF3Uvmoup8HsfZM=;
        b=SfA9l4VG7rV2eUg8umdgXeWad6dVbGlQXwuk445DnrLMoi6Tr4sA3H/RHT6ePUjcPX
         Rl2y6qvYTLXcoDT7H8R3wIotBdfc+orC8Ia90w7lMjUsmXWxKyApHRuGXEn05uk9BUq0
         vxL1LcartEXLd7Q9s7uyUPuIom04XZ8q9Se0wLY5LEVGHJEAoR/xY2NStaoKNmMO2hVJ
         pFIIpx7xVVmZeObiqO8c56gOVzzK4p3ShX4VcgNWM0Ex8d1nnqn1k7pHRI13cVAIYAKQ
         h79AdJejkwC5g74+lyHyUQUByXPt1s0qrM1KZLbgJ9b1u+RMoT4oVVVTg1j+XSXKUevz
         0/GA==
X-Gm-Message-State: AJIora98IKWj93Qc3wN6hmLvOqqSk5yTfwMamxh/qbA2nWKva1kezizA
	G5EsZD/ODsK9BFjU4+rVlEp6HhfTO66IHKAbKQ==
X-Google-Smtp-Source: AGRyM1vGWOSYKAFjt67H1Pw8yisajdXsVeDlRauvs/71AQuzS3Qdnzm9JaYrsNVLi9oyAnzqltnu/fIwEIq+/G/RPQ==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4640:519a:f833:9a5])
 (user=justinstitt job=sendgmr) by 2002:a81:17ca:0:b0:31c:9a75:1f2b with SMTP
 id 193-20020a8117ca000000b0031c9a751f2bmr26412666ywx.83.1657215150360; Thu,
 07 Jul 2022 10:32:30 -0700 (PDT)
Date: Thu,  7 Jul 2022 10:30:40 -0700
Message-Id: <20220707173040.704116-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] net: ipv4: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter this warning:
| net/ipv4/ah4.c:513:4: error: format specifies type 'unsigned short' but
| the argument has type 'int' [-Werror,-Wformat]
| aalg_desc->uinfo.auth.icv_fullbits / 8);

`aalg_desc->uinfo.auth.icv_fullbits` is a u16 but due to default
argument promotion becomes an int.

Variadic functions (printf-like) undergo default argument promotion.
Documentation/core-api/printk-formats.rst specifically recommends using
the promoted-to-type's format flag.

As per C11 6.3.1.1:
(https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
can represent all values of the original type ..., the value is
converted to an int; otherwise, it is converted to an unsigned int.
These are called the integer promotions.` Thus it makes sense to change
%hu to %d not only to follow this standard but to suppress the warning
as well.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 net/ipv4/ah4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
index 6eea1e9e998d..3bf3d01fb7e3 100644
--- a/net/ipv4/ah4.c
+++ b/net/ipv4/ah4.c
@@ -507,7 +507,7 @@ static int ah_init_state(struct xfrm_state *x)
 
 	if (aalg_desc->uinfo.auth.icv_fullbits/8 !=
 	    crypto_ahash_digestsize(ahash)) {
-		pr_info("%s: %s digestsize %u != %hu\n",
+		pr_info("%s: %s digestsize %u != %d\n",
 			__func__, x->aalg->alg_name,
 			crypto_ahash_digestsize(ahash),
 			aalg_desc->uinfo.auth.icv_fullbits / 8);
-- 
2.37.0.rc0.161.g10f37bed90-goog

