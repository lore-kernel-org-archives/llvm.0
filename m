Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAD7E9
	for <llvm@lists.linux.dev>; Sat,  9 Jul 2022 00:37:19 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id j11-20020a05690212cb00b006454988d225so165897ybu.10
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 17:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=nIOdyfUDOuPdVLt7ksu7PVNTjcXNzQQTOJh36uQBLdI=;
        b=NqBR7hRseYFHoMsnRFTk89V8cSnuHJV5mvA3y4Vk33uUrjNCKuHT4pl19gAUNi+Dax
         zwBUmPo6FqBNc7pN2LWNtXwXuOcTnqJMul1rixwFNbf2XBCk+uAtRBgeb4CvFAPrGiG4
         opdiSqMuxHB8ltpTETRZJfhINcS1BoQ5i5hQxO2AWaBweSPmnT0IikalBpA9zuIBh2Xd
         SgGxFHmttmmj30Bw2OhlyM+D39A1L+ewjelBI1UHzvR7iOlV7e54CaCKzcw6izBmIgl/
         5aO+m5GwAXO3eIrMIbedfkYWOji2nUj3eOuBLWq+ZH+gR+U065eF4HsZfOs3Nr7lqog7
         5x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=nIOdyfUDOuPdVLt7ksu7PVNTjcXNzQQTOJh36uQBLdI=;
        b=KTYLMbMmBaKoLwMhWpsok9YF6blRSpZmQswWu4g6m9XEmSZjFzsiATS2GeNt2YHJeS
         bnvBrXbCkPsQUOo1r7yjkU0YjtmOicoIDhtSvoqOs6zA6vQhT/qln79OgxheaVWNrjcd
         xIaJws5p8t35cPi56M3awriAkwEq8+BDfRoixf25xwaKMk4DQTM5X0VgswPk6c5JZWJy
         emYFLjykuvhjz8/45mI4V4qbg2IxdFIB0rnooi3G/jeRXU5ZPirCY4DIh5aSlMledx6L
         UlogD+RdVRpzhURMt0QIsSaXkBFDZ6g6h25R1Wg4tjodDccFa8L57mfQp7ZhMGJzi8A3
         4MLg==
X-Gm-Message-State: AJIora+aY7h05uxIXHtJ5B03CcRfwdiTG7bkiIYBG28X5E4NpRwjAwEa
	ANGYkZAkhPUZq9SzVaa8Xr9GK88M5j1E7GF+Rg==
X-Google-Smtp-Source: AGRyM1v89wRj4tyQeUzPicy/PVgbMHnA/2Tmjdwr9EP6QeeA76WzOe3kRu9vSoZdIO41TqInLh1rn8X0OFRk2oziZw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f21c:9185:9405:36f])
 (user=justinstitt job=sendgmr) by 2002:a25:4290:0:b0:66e:53b2:56ed with SMTP
 id p138-20020a254290000000b0066e53b256edmr6565221yba.254.1657327038369; Fri,
 08 Jul 2022 17:37:18 -0700 (PDT)
Date: Fri,  8 Jul 2022 17:37:04 -0700
Message-Id: <20220709003704.646568-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2] net: ipv4: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter these warnings:
| net/ipv4/ah4.c:513:4: error: format specifies type 'unsigned short' but
| the argument has type 'int' [-Werror,-Wformat]
| aalg_desc->uinfo.auth.icv_fullbits / 8);
-
| net/ipv4/esp4.c:1114:5: error: format specifies type 'unsigned short'
| but the argument has type 'int' [-Werror,-Wformat]
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
Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
---
diff from v1 -> v2:
* packaged two related patches together: (Suggested by Nick)
  - https://lore.kernel.org/all/20220707181532.762452-1-justinstitt@google.com/
  - https://lore.kernel.org/all/20220707173040.704116-1-justinstitt@google.com/
* use Joe's suggestion regarding `%u` over `%d`.

 net/ipv4/ah4.c  | 2 +-
 net/ipv4/esp4.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
index 6eea1e9e998d..f8ad04470d3a 100644
--- a/net/ipv4/ah4.c
+++ b/net/ipv4/ah4.c
@@ -507,7 +507,7 @@ static int ah_init_state(struct xfrm_state *x)
 
 	if (aalg_desc->uinfo.auth.icv_fullbits/8 !=
 	    crypto_ahash_digestsize(ahash)) {
-		pr_info("%s: %s digestsize %u != %hu\n",
+		pr_info("%s: %s digestsize %u != %u\n",
 			__func__, x->aalg->alg_name,
 			crypto_ahash_digestsize(ahash),
 			aalg_desc->uinfo.auth.icv_fullbits / 8);
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index b21238df3301..b694f352ce7a 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -1108,7 +1108,7 @@ static int esp_init_authenc(struct xfrm_state *x)
 		err = -EINVAL;
 		if (aalg_desc->uinfo.auth.icv_fullbits / 8 !=
 		    crypto_aead_authsize(aead)) {
-			pr_info("ESP: %s digestsize %u != %hu\n",
+			pr_info("ESP: %s digestsize %u != %u\n",
 				x->aalg->alg_name,
 				crypto_aead_authsize(aead),
 				aalg_desc->uinfo.auth.icv_fullbits / 8);
-- 
2.37.0.rc0.161.g10f37bed90-goog

