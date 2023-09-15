Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17B1B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:10:12 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2746889aa89so1817834a91.2
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808612; x=1695413412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xnN3gHkGLtoNA2QTGtMAmFrJjm3lWByeM/YOF1ick6M=;
        b=JAMz2KkmIIgZejVATOShApES5m9dEbc8OjGp3+PBAnBJ/Vy3sxSYQUFiRBflr3Ew6S
         d9EbH8lYPC5Q1yi/5jZ07c483FsJtZXmIBRuGLQ/csqFeFsTv6dcFOLO6EblQHv8J7PT
         HYXTxoyalYBxTZAp5plsnionjjIV0qfksldGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808612; x=1695413412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnN3gHkGLtoNA2QTGtMAmFrJjm3lWByeM/YOF1ick6M=;
        b=Wc5vLG39EqVNVjqm/sMU7CNPA+i7w1QAAzaHhBw8r/qkdySgzMrfZKxzXI7YeMzy+y
         Z56IeVY+Piy8nd1nuTbpdcc/kniL8eXGKaDNjvVoTNZd1VCzZF+GvprPz1Jr+3SPskdM
         1eKa5jRtu+2DgWwatkJPr1yHkghH5jF6QReSh0hfJ99aoVs8cAcd3OZjKzYlsr5sJPJh
         VlYcIGcuCEjQ1g0+XAViNJ1N+ivtDUqKekSJe2GK330ftuTDBTwD1f/z+G5yKNv9M4S6
         OGBruL98tTBO3Tsb8qrp7QfvFWfQhd6Kb/PFVseU7Dwuu3pXskRMsvuv2kcn1OJ4fpRw
         WrMQ==
X-Gm-Message-State: AOJu0YxXcg8K0AY2rrDeodY4pyHE9QZ4D4yWsOBw6D3dciGarVzuyqrF
	Zu4bD/q1Std1+k6UmYT7+f5iCQ==
X-Google-Smtp-Source: AGHT+IFTakrAd/P9IgFg/t1kORbe5OsEnV1TC7veShETUWveOXxBj4Is85OM+v2tEfU42/NGU94RCw==
X-Received: by 2002:a17:90b:4a11:b0:26b:49de:13bd with SMTP id kk17-20020a17090b4a1100b0026b49de13bdmr2581678pjb.36.1694808612530;
        Fri, 15 Sep 2023 13:10:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 28-20020a17090a195c00b0026f90d7947csm3649999pjh.34.2023.09.15.13.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:10:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Kees Cook <keescook@chromium.org>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] leds: lm3697: Annotate struct lm3697 with __counted_by
Date: Fri, 15 Sep 2023 13:10:10 -0700
Message-Id: <20230915201010.never.399-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=keescook@chromium.org;
 h=from:subject:message-id; bh=UTGtDE2akLSsdTySqF59uiPuDzz1OaDB2cv0YvrcVBc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLoiuSQ3SORqIHxgEzXMXxgMfoY6915BNtJRe
 8pDUP6OpliJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6IgAKCRCJcvTf3G3A
 JpbaD/0clVqVUxTw1+EOL/tG6W6RoCiaXFDUaXAPcnNTfob2vfYL2KQkMIjFYbgvOOwd9Z3glI2
 b95tMT0bCRoHujNvqOOpI/cdAfKFKxz6SD522+Hhrx1ufi0cCHh2iO0HT7UgOLrW0+Rr/AgXFUm
 CBjn0TNqarPBQOJNSrk0AoIdpKp4HYfydvM1AhzU8YlakmhAqVlNM3gy2pwnDars5U5ed3p9pBO
 vj8XrD3iumDh/0eVACxk2cIdIRztZ7sjPNJ/HrzdxEfb60YXjHFqRJAc3BlmNTJhiqCW1mpPDzD
 R2+WA7VEcEoj0oTFmLEJGeOCjLizRTkRt4AVyMXG//RfLOiwD/FGV8i/9BU0CjArO5KZDbiN6pg
 XkXTlGgx2udPvdFKjs0oIBd7/sAOPWAk4I+5qLhSkAZkB+PzoRZbGM00+/JYYrAgPD+n8sBi0eD
 8VIeXQJvQ1t6NCjw3GwU/5AkySxbWyCL5fMpTHI+P65znv3n2QAYJ2idcC5/x7F9E07cxhsP29l
 6eHYhQYkfFHL+F+PQ/t1v2XeXg/v4GqAM1+9N41ktDpoP47HeFBhs9wwVj96wbU0sGgrkBpZJs4
 wydpIoJeJ2wJ68fdxIXE0QKuxqbCL4kqgVri1VsGVVia6NO+TM5kM4KVQw67PaY7QgMX8Yj1w72
 mgcWtvz G82BZOPA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct lm3697.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/leds-lm3697.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index cfb8ac220db6..380d17a58fe9 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -89,7 +89,7 @@ struct lm3697 {
 	int bank_cfg;
 	int num_banks;
 
-	struct lm3697_led leds[];
+	struct lm3697_led leds[] __counted_by(num_banks);
 };
 
 static const struct reg_default lm3697_reg_defs[] = {
-- 
2.34.1

