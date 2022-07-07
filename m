Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08202563
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 18:15:44 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id e21-20020aa78c55000000b00528c6cca624so2909864pfd.3
        for <llvm@lists.linux.dev>; Thu, 07 Jul 2022 11:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=WyqPYSVnBKbl/nr40y7sE7AfbPIEB8jJthH3qsZRwTA=;
        b=dnqfTJXGdi0+0FQWJVIluP9qFR8tn9FFDKE/o7TQ9D9+9nSIvt3ROmw8bwLqp/nk0a
         bf0FuVwic/qm0DrYAJCc1pFXDdpTPmT0tSbEICTZ+pfYV8DKzRFTdF+141+GjWUjwQRp
         QzLvsqovmrnEMyfDJ/7HdhFzKkCciuR3Qi1ipw5Cf7TI8Nz9EV4yYk3UBrTQYNHllrja
         bTeWVLAzCLBiMBiVRXMeEqceXRlQr+0luk8omnYLqhs/NFnKe48+83GAn6wUStYTqssD
         8UL1kyN+jlNMOBCpH9Uw7CRSsyrrMlr41sMk6fy8bYqO6OEoVY1b3mo2E3g0pxJf4FgO
         JoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=WyqPYSVnBKbl/nr40y7sE7AfbPIEB8jJthH3qsZRwTA=;
        b=j2uMGAKGmqPFCnpA8/ofw7PkKHDV0CqjukvJte1I4FWqXt/tdQOiCDE2z+oxAUMPgN
         YVqFlPpEARETghuP7gxVPzTUscL4iB/TBFLGIidjVrYbViRbSAt3HRnCPUbsMo+QokLq
         tedsmzNNTYP5cVL2KgV19BimL6Oio+LkAw16USbKFQK19QOF/5F0FCY7HUOsUadmKrE2
         KlPff3i9yK9vI6WOY285JZOhMw8585Vu7IXGKd+geoc8BmRdCuKqopcaF0jtofRcXx7E
         HLU5rfbuCyQH8jH5oeM2livs3if1+VYlt7vbtjPwpaRwyaI2Za0DJ21TLhjLJ1WioUS7
         QkWQ==
X-Gm-Message-State: AJIora8k+7lkMmfX5jSuVkUIzH0/Nylt1dm+IgozJOc+08sc9wUkozEx
	NbfJHUwYs2pg2KMWvc+tCCuBS/V1YJBjx8CmqA==
X-Google-Smtp-Source: AGRyM1vSxJ9bzN8oLzDMI9yoXtg62L3jELXqZ7ufsfb/vBottKkE9UgYhVK36UnCmznaz0cAiYEvHbEc1ywsdTpTaw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4640:519a:f833:9a5])
 (user=justinstitt job=sendgmr) by 2002:aa7:8e86:0:b0:528:c755:1d96 with SMTP
 id a6-20020aa78e86000000b00528c7551d96mr5326209pfr.30.1657217744245; Thu, 07
 Jul 2022 11:15:44 -0700 (PDT)
Date: Thu,  7 Jul 2022 11:15:32 -0700
Message-Id: <20220707181532.762452-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] net: ipv4: esp4: fix clang -Wformat warning
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

Nathan also mentions: This solution is in line with printk-formats.rst
after commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use
of unnecessary %h[xudi] and %hh[xudi]").

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
This is the exact same issue (and fix) as:
https://lore.kernel.org/all/20220707173040.704116-1-justinstitt@google.com/

This really should have been a 2-patch series but I've been going
through warnings and systematically fixing them whilst submitting
patches as I go.

 net/ipv4/esp4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index b21238df3301..de48dcac18eb 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -1108,7 +1108,7 @@ static int esp_init_authenc(struct xfrm_state *x)
 		err = -EINVAL;
 		if (aalg_desc->uinfo.auth.icv_fullbits / 8 !=
 		    crypto_aead_authsize(aead)) {
-			pr_info("ESP: %s digestsize %u != %hu\n",
+			pr_info("ESP: %s digestsize %u != %d\n",
 				x->aalg->alg_name,
 				crypto_aead_authsize(aead),
 				aalg_desc->uinfo.auth.icv_fullbits / 8);
-- 
2.37.0.rc0.161.g10f37bed90-goog

