Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A40199C3
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 23:43:45 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c723f1c80fso35245425ad.1
        for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 16:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695944625; x=1696549425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MNHH+1qhuM2be0FNxraZa2k964UVjBr3da8cdiKRngw=;
        b=ioPNA+vKEO6e5D6fEv/gXvXHyJY+9iHhiQnpEQvxABUFL6NBwHfX9c04bnozLNcaba
         6S37eIZpvURcU/CXV5imYChFQqOv4mdMpkxcmdnc5Yuh1TXYqqLC16d+o8NHRaJ7kENs
         9V9h++HSaY3EbhAzwtaGa/p5QcsftNzBl8tLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695944625; x=1696549425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNHH+1qhuM2be0FNxraZa2k964UVjBr3da8cdiKRngw=;
        b=uEO2WJyFfZVBMz4/0cfxnR4hAR1qoKgvCTu7yIR5LQVtzMKE/MlRQPf0i7brSh1KAV
         S7KLa9/xbbkJ+o6ZnTJVoaQkfju+BFyDwyY0M488EakZhjGoCS1CVBo7kU8cdFAlo08P
         xG5yVDo4cO4l0GGyx4JxzvJVRkWiOYEGwBRPHMwrbsIexaBhUndq6C1AXvSTkEauBJDQ
         erUZOg/B4T9qLcT4BDdiiRgf6I3rX8YCL92quxszGNzrMVIEIIo/WXwRakVb5yoi3Kbp
         jVqyQqWzSyuOKSAJ/UmIzsPNOJI5+xXDkHZvKqZmDJ/wvqRfqSnP2TDWTftO+to2ZrGI
         plKQ==
X-Gm-Message-State: AOJu0Yz/+20yCXAE1wu0OWgHiMUivCBDmNQAOz1Cfd96fMoAZ7QV70zb
	3jvuhJgcEHDKcc/J6FV5HhgT2A==
X-Google-Smtp-Source: AGHT+IE3aB3bki1h2nzKeq4Hvu7L23o/LNCvJSwxc21wrOMfa6r6KlHZeiE4hugYWpH4RLmgxSLGuA==
X-Received: by 2002:a17:903:1c1:b0:1c4:638:fff4 with SMTP id e1-20020a17090301c100b001c40638fff4mr2370744plh.17.1695944624781;
        Thu, 28 Sep 2023 16:43:44 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b001b895336435sm4068006plg.21.2023.09.28.16.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:43:44 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	dmaengine@vger.kernel.org,
	llvm@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] dmaengine: ep93xx_dma: Annotate struct ep93xx_dma_engine with __counted_by
Date: Thu, 28 Sep 2023 16:43:42 -0700
Message-Id: <20230928234334.work.391-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305; i=keescook@chromium.org;
 h=from:subject:message-id; bh=THP69OmSOtOGZgovd3irCbWFIq76IMb1Eo9RFIZ3FIQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFg+uQsbjWwI6QLDwpDQxEemOjDuINJD24mwrU
 /jndnL6pPuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRYPrgAKCRCJcvTf3G3A
 JjzbD/9786EPnb+KEovN2A394u+CjRE5feFbV0OH2nJ+hoicNA0BmpvVK6QsaJqscUhY5SzZnIh
 bJD/VopZIUjwI4FITPqd3Yd03UZG5en7eTcobbpl13XYpOvvHfGmu5sAK7daO4UvRki9YbY/N58
 m+5TiNXLb8SwuOLA1TcJ67oPCf1N+kRUMewPGQzE3BrzjsrmC4nzBzItDiBFJaSmSUv/QI5TA5h
 A+RxcOH11WeE7S4GGhN0EMcTv+w0/K04pncSa6lEdKHKZUL6I94j5oiRsDNdUNih71JGsyM4sp3
 Xfg1nHufCoyp/18ig9FZ12Qg4gulxu5dRUqfzDV3HA6QoazyJInWvQizQKTT5hnVX3cTSo2pjN5
 aeKyS51Yt2Ie3NIsUgexXgNaU70uD3yqBTWTdK8aPYOBW9/0zJF6Oa3c29hUAB6fqhV6a72H3P+
 M8Hm9ZD9HyYzV49KpOi1i8kzL+d/EqbRdTlSnRkyr4rdGzCk16Bvh02vXWZ56G9V09qWS0cJHXn
 fk74+F+zDDMUPD74z66DuOExRi9n5LzWvhnNfjql7GYDcnKJFwTM9oyTgNnpqvleA22e68tC3eQ
 oiGIO/BQrniVpKwWJG6melsLUr2tQIeN+Pj4Gh8KP1Myz/9WxSxu7Sqyn502tYFCrQq2lxwXbwm
 NkdSZdM Y4Zio4YA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ep93xx_dma_engine.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: dmaengine@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma/ep93xx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 5c4a448a1254..d6c60635e90d 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -213,7 +213,7 @@ struct ep93xx_dma_engine {
 #define INTERRUPT_NEXT_BUFFER	2
 
 	size_t			num_channels;
-	struct ep93xx_dma_chan	channels[];
+	struct ep93xx_dma_chan	channels[] __counted_by(num_channels);
 };
 
 static inline struct device *chan2dev(struct ep93xx_dma_chan *edmac)
-- 
2.34.1

