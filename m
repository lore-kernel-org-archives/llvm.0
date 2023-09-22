Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD71E502
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:50:13 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-690ba63891dso2024371b3a.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405013; x=1696009813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHp1ED10bg43WmKmQvz+z20YRsbZCcJDatOaeiR4cRc=;
        b=IqYYBPmW99gmxYLU6XN7l9TIdfI8kYa6HNGMTDMbK1qjGzML1Z4GJ0KNc5Q0LpYAms
         bkR87Zpx6x7rwvVnMFGjvftVLrDfS4bwgu02mU/0qBtT2gR7z4Kq9C/8PkiipmaAoOWM
         NpTLocsaC6kdDMqcQKpQIGVt4eMPjpSyy+N7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405013; x=1696009813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHp1ED10bg43WmKmQvz+z20YRsbZCcJDatOaeiR4cRc=;
        b=qzbmCzTTRk1dHsRA4i536Vnp6+19B/p1CiofVkU1+EJyZ1chrJLevwEywfktjeP5Pi
         OFvu2yttBvibI/bMPJ6UKUTX3sgeY9QjaVgnU4xQOmuGwBG2W5bUwH9CJOstb3G2HnAV
         eBX7+jD2lN9q/tLmeDFcCPm3/m1KJrVrCrznC1/3KKxhC7JKHqEL7xjEMxOZXCZaeBgL
         TvLmk35RLY8ZjDyRvJIU/pVJCaYlI0mGgLVxbsJtjW8EYGKyqJ+AOwteZwFoidwYgoWF
         MJ9xWHA0JWt2MZgD4uv2ZWseMpyoBupvu9oFq8LfmzwyJVX4C9mv9E7u5g35cyzP450/
         MWzA==
X-Gm-Message-State: AOJu0YyfGocOgLsdzkRjB5IudFuNHwKsm8HyqTCCVmgLUQ9C7QNg9ZG6
	cCOlrwH3v5hJ3vJWSOcGRS5/wA==
X-Google-Smtp-Source: AGHT+IFUQBKrktGM7T6XnCIgINsyQ4Uqfg3+fboOe93XpLQmHZ2pILAVIbZVXa2loO83xONkmkZlfA==
X-Received: by 2002:a05:6a20:430b:b0:153:b16e:8db1 with SMTP id h11-20020a056a20430b00b00153b16e8db1mr245441pzk.10.1695405013229;
        Fri, 22 Sep 2023 10:50:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001b9d7c8f44dsm3767571pli.182.2023.09.22.10.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jack Chen <zenghuchen@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i3c: dw: Annotate struct dw_i3c_xfer with __counted_by
Date: Fri, 22 Sep 2023 10:50:11 -0700
Message-Id: <20230922175011.work.800-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=keescook@chromium.org;
 h=from:subject:message-id; bh=g1g4deThn2jq2/HmpjUdVckXHtYrg1phRYVjxqpT31c=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPT88H9qzG3LMBy5A38JWSSkUyL3Eg6YJLhU
 eMX5HXSGtKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T0wAKCRCJcvTf3G3A
 JpPwEACXZRomIRPU03APpI2pgvFryCHHAmuDLTXo0N1fOecwRoE4OGPaNSqxHZPbQchIrRD5yF2
 2dtE1vedKPQ36FCNd1BwbsjXBmiJ3TNdl6bYV8cBK15uCpVDhwWgGbYXEOb0ZFC3W+Id4Y4vUBT
 rP7TxnKo2Y/NRYdKNeFRo+0kGxIW3o2B9flG2MIwDroKvUztJPHPJ+w/XDm3fUA7mJlAeQ/Ft1n
 pfiE4aFzxeUBy75Y1n/Kb1+CIFw8hFjmV4PmfTlUbdsYL2HNl9kX5b/+ULhPiEr2yr/namr9ckn
 Bv6v30Wc10cBSr/YO4ueLcr/RYKLZqJqmx8w1numFHJkhRIbk9d2D+A5Qxx3i+/LO+A25t45cIr
 CazDqhoKDhq66/KtUesFjWOpwuIP0maUx/BcoKvTDVziUbNKlM9XVEsUg1RCR25GOTAIPyYqKRK
 tERqOZjC1PEzFwxPvIlX81QQVkxPEnwgux++N4hNgXMqK3uGDPrmP65kpeVLv55kh0QB6lOOloU
 1CihM9VKHEPWBy2KM8zJVbTbyn5PlQQ8D7c7wcTO4ocA5q1cqWTf/R0bH8YIO0lCX6AuhnUcLCT
 5MEnctf90+Y4LvEimrbWP8c+2OJp4TPkHzH/bwt5+YoxFvuJoCQMkQxvnE1mGXVGjWiNwc4gBC8
 c1GN5F1 dRrNbxxQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct dw_i3c_xfer.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9332ae5f6419..ef5751e91cc9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -233,7 +233,7 @@ struct dw_i3c_xfer {
 	struct completion comp;
 	int ret;
 	unsigned int ncmds;
-	struct dw_i3c_cmd cmds[];
+	struct dw_i3c_cmd cmds[] __counted_by(ncmds);
 };
 
 struct dw_i3c_i2c_dev_data {
-- 
2.34.1

