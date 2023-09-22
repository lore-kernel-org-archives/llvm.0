Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B05443AB8
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:52:18 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c1ff5b741cso23159595ad.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405137; x=1696009937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vS2A/5dfe44fdutyd/MiPveuUUECUoSz6xv9hgdL9I=;
        b=Id/q5jiT7zmr6sMPwvEAILr3cOyHp95Z4wPv5XPH/xh0AfGjK/YIIPZIakY893oRFs
         mC6hXv7AFKazWeKWFZjYGIZvi7FopaK/Vau11TDuottPiiyJz6rOlAK3ZE6tObd5n3t+
         mPthq53FqlF5LnjVLxqZsaetv64o/VKwoep/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405137; x=1696009937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vS2A/5dfe44fdutyd/MiPveuUUECUoSz6xv9hgdL9I=;
        b=DnElpuOqjA3uzo6u8YGxDzmIwSCQyFHSoemWSvXe4MvOg0tceqZiLnj1gK952JpgLp
         K+XBZ+dFuQNnCN8OIQTvWcSvwhAXWRwg1SFyiQ0t8BlWY4lrsUWNyBqeOWW1dPnpI++f
         SzZs2oUi3Ip1giNY7/e8RG2/U/PqeL8uKkgm/lumYoQsfWV8PsnQwWPCqmAh47USigjO
         VnDoSfgXYy5yNEI37q2bxIYIXlwbWjdXZqScJVLTPhXOxxq6OhzOqifegqf5Dmrlcldq
         qBDfY19W2HbXtagh5hM/pBO3i7mFqJhODFVpuH7Y1Ryk3cEYCiPRlMIh2vA+gRHW08jz
         cO3Q==
X-Gm-Message-State: AOJu0YwOrfG5BPak82CRDcv4dF3BztbfT781Dr6oIiLSYdDeLOqnpBQo
	eFCKuEaqOqvRmbV0tU8S6sBm5g==
X-Google-Smtp-Source: AGHT+IFPIMsBddESEV+xOT00BhEEOms1XoGEZoRj82rSsZ2HtFooQgjZAAkVZk20RkrZp+QDDYHM1w==
X-Received: by 2002:a17:902:8649:b0:1bc:6c8:cded with SMTP id y9-20020a170902864900b001bc06c8cdedmr113191plt.67.1695405137609;
        Fri, 22 Sep 2023 10:52:17 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b001bba3650448sm3770726plk.258.2023.09.22.10.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:52:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kees Cook <keescook@chromium.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] memory: atmel-ebi: Annotate struct atmel_ebi_dev with __counted_by
Date: Fri, 22 Sep 2023 10:52:15 -0700
Message-Id: <20230922175215.work.122-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=keescook@chromium.org;
 h=from:subject:message-id; bh=F2UmaICz1ZTVLb3quzX04fcrOpSbHmBx25EYuMmk16s=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdRP0nnZBp76GGrjxSd3FerVZS4q3b8aU5/c2
 uN1YtxC8fOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UTwAKCRCJcvTf3G3A
 Jo+7EAChYPLRXO7X9nu9DEjWcNXCDEwK+/GRj855SWig73fP9fl2tV2PrcgDrC5LYyxuBpgGKYn
 x4Q6Vq+o80FOTdfMfJbZmmT9UVRojn1JY/y2UpRhEL475+ARS+IMf2fb1hO1bra2VPZhwfr1Rcc
 BN/3E75dldOHjy86D3B1SuSaRBATOQj7ZY/ID0Dnc3n2z4EQPF7jhXBNwA25DA8N37VdWsD8N/l
 F77FKDmnqOoQIFQS/wwyACE5Ivl1tkyB6RoXD2AU7TGDa0CnKZ0JCHSQn178K5DMd1xZEgBIIju
 s5EvBmv8TrzTpG88MwGp/gxEuotr23xn48cm5svdgl393nGbJZokdzrRQxaD4oiUKirMfZuqRHl
 vlG4rbuP6U8HsBAcNCFI6xo//gccjTSMdDTqtRi4cCfgJPuwHnJQ+J3EffL067Z48pDPdS6DJZ4
 Eoq+pEGY8sPX/NAwFYJ+J7W8juJKWxNi544rahU5/6+QdjHnD48mVdG0DsFTEPA8fEzGqwD4Fir
 KH1cMmB7Ig96TfJWl1Rw85uRglKKFjrH9MuH+6XGXCypjqlo7KWHPKhHZcP2ty0rYKVGM2OW7fr
 e3h0Pkk2ZUbrUha6RZ5apKyCesPgWEbSt09RtpcJwGa0yrORQW80+5zJ4vghwfJKtnyucqa73g6
 z/RJ3ag hxTiMUUA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct atmel_ebi_dev.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/memory/atmel-ebi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 635966d705cb..ec6100bc94c5 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -30,7 +30,7 @@ struct atmel_ebi_dev {
 	struct atmel_ebi *ebi;
 	u32 mode;
 	int numcs;
-	struct atmel_ebi_dev_config configs[];
+	struct atmel_ebi_dev_config configs[] __counted_by(numcs);
 };
 
 struct atmel_ebi_caps {
-- 
2.34.1

