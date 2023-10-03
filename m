Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C43E496
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:18:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-577fff1cae6so264476a12.1
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375114; x=1696979914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2FSIWN70TIGw3orK2+O3bir1YHHopkUZ3z5rVFgFT4=;
        b=Bq4n5XKUqIq1jt+CFia4ZCaYrXIM70X0KR7TKBckcS4keDjjBIQjiHAa2+XDUNiafl
         jc8vRH7Xot8h9FuaDfpQOWwSzc5qtma0lyudnft6+X993xUeYTgsJoIf73wqXUOS1IJm
         I6c4RQi3o5kLCMAxrO6ibX9OD9vng4YcPmT14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375114; x=1696979914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2FSIWN70TIGw3orK2+O3bir1YHHopkUZ3z5rVFgFT4=;
        b=mLqmLoTzGEOu+u9zbebuGrM8QkEZoOhTVcWlc7kZr0zxMvhWF5zBEmUQswgRPNDU3L
         lH3B1ZiIGEcsDRW+bEd4ia9XIm3vOKwsPVlmhJc0wlxFILXla+MmMqiLd+bKkimUUQxu
         NTZAVjfyn+c69GcJ0dEBhCJBfZBDNzuqibcfqIU6IPDunxfyXr9L6oOICDcg1qZQXulN
         w8YWiIbE6RDHislKinMOylWlzQv4d/sN1QrjUL3toRNAvGntLOYLAbzHP10z9EjOuh3S
         EkCVzPtH6/wSbO+QFN/F/IyEWp6z0bxo9oBduWJY/y5elcsqF4HzTtJ2wmn+7ha5jb3s
         7Y6Q==
X-Gm-Message-State: AOJu0Ywesrz0/zQD9XOrjXYgtJ7MI+20kMFYpSiy37j1K/FU119NrpVz
	IFPFjFAbKLxuFRhFZTBi8fDZrw==
X-Google-Smtp-Source: AGHT+IG/GfalIBIjvZJxqoUuM/q9d85zcgnjKWe5dC0Jl1ycHfoTvdk5+3M3ZBdvZlxTKrWxUVwyHw==
X-Received: by 2002:a05:6a20:8e22:b0:140:d536:d434 with SMTP id y34-20020a056a208e2200b00140d536d434mr1057230pzj.10.1696375114587;
        Tue, 03 Oct 2023 16:18:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f9-20020aa782c9000000b0069102ae6d93sm1985422pfn.14.2023.10.03.16.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:18:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Kees Cook <keescook@chromium.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] xfrm: Annotate struct xfrm_sec_ctx with __counted_by
Date: Tue,  3 Oct 2023 16:18:28 -0700
Message-Id: <20231003231828.work.527-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=keescook@chromium.org;
 h=from:subject:message-id; bh=0lpEMudeRdiAAJIqHbj0Q7ZoTR7IUMUOYn49nl4rZJo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKFEUwVcABd7A9e7Zjv1HFmOM3RO2gbBm9SPK
 yjLOR3pgGWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyhRAAKCRCJcvTf3G3A
 Jk/LD/98iwmykBFHGUKgLRet43isHedtc34kHI9bKIJctwTbVdN0V8AOWh+GeV7UHmS8EaRHVZs
 A3pwy4kIX7SyU8CCIbKEqdPuIpRmbEx+0UBi5ROffUF7fIHvQqL4SFC2QCvL2c4DDiBtLzpxPhv
 25pOUS/+LdxmaakSd/M1MPWcHWC4cNg3iifoeEi5B3S2c+u0sKhT7pEzrDfrAm+4F9FIIdPcUuf
 vwTOYkePCiOABdXSJ5I5x0QgpBMsYu2B/LZst0w+v2wj0Wm4gYB69R/xuiOwf+4CsUf6K+yyBkr
 TN5boRm+2WdQvAqiJh6tCaF9WbDYs+9EDERXFyYSyuCV/iZUcl/Y3oSg2fTIBRhP4S+aSkvjJnH
 fqKS+E20wJLcf5II9sCRIbNsJEI1E5yYcZj+OUBWvy9+U45ob4R7AhGZakKn01vtORIyXEKtOpM
 XJOTMdPqamTQo2CvrQlMVbYdVYWM4RAvwVpIO1UBuO1lsl4Z6WhoPyqdo6+0A11NnR7dPYW1SaJ
 CG0A4MBd95paZ3fuciiJOF4tSpWpVGP2J6Zn5LEPTa1syIXwx0O7RSZuGj7QpfY4q4ONXJu1/P1
 D8IT5ehGSVkSPdbyWZ+Zl8roYh4PCu7nKGe89yG+3u98P7qzb3btTte4G/aXH/jAWWIYsDZJsl2
 23uiuZ0 GVqYc+ow==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct xfrm_sec_ctx.

Cc: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/uapi/linux/xfrm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/xfrm.h b/include/uapi/linux/xfrm.h
index 23543c33fee8..6a77328be114 100644
--- a/include/uapi/linux/xfrm.h
+++ b/include/uapi/linux/xfrm.h
@@ -4,6 +4,7 @@
 
 #include <linux/in6.h>
 #include <linux/types.h>
+#include <linux/stddef.h>
 
 /* All of the structures in this file may not change size as they are
  * passed into the kernel from userspace via netlink sockets.
@@ -33,7 +34,7 @@ struct xfrm_sec_ctx {
 	__u8	ctx_alg;
 	__u16	ctx_len;
 	__u32	ctx_sid;
-	char	ctx_str[];
+	char	ctx_str[] __counted_by(ctx_len);
 };
 
 /* Security Context Domains of Interpretation */
-- 
2.34.1

