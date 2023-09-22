Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F6D43A91
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:50:34 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so684798b3a.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405034; x=1696009834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWSYGSx3FRdbqkNwZMkwsIlHC9m+xNwPdqt/ACrT43w=;
        b=Ne4uV7/p8w++qy3COyw5ziYAtHGffiay08q+P9PC7sthlvVZxQQtmcco34dHGp58gP
         XCACOfPL/yEJvaUdB9BbV/3X7dNZTYuKa4QWjTWK8SSyHaxD+kk88LAFybn2UYeZzMNz
         p3X6mNnMvy0ExhsaQG/qqRVdcofE9C5BKp7J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405034; x=1696009834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWSYGSx3FRdbqkNwZMkwsIlHC9m+xNwPdqt/ACrT43w=;
        b=sRiDERzfTVuuiP/XygdWmpRjuSa0m3pKB1WMoXSqqMSQb2Rrwxq47wjUZW7j6yVQ0a
         pjB6O4+Tm/JOdbpyVAKF0sN/6rV7ULAutqCyS9YLIDhN/Sn8hvLgmnFkTB9smxp5jXEn
         Yw8jfmVuVvGd6HFaWCTw35+cUPebgZdrrf6m1TBlBEoW8sUBMbYsVBlH0osFUu3oEJrG
         AnFc/XGubJmk5Ul0Yjv4Cx46LU8uD7uIywdjiv9v5FMJf3ru3Er7p5gljWmEYeLUK1Av
         3UOXsWAboj8YjiZumqMrP8BzH+pXoUyOzlJIbn9qBG9uCI234e+YDtzdN+i+T1nWoVri
         vSnw==
X-Gm-Message-State: AOJu0YwA8l9WbjFcm09GDwVeKV3ftoKBiuHPlB9jsKSwrT9PlI0Ocxsz
	qyt24aNZ6hTekSCLsiCFbqD8Iw==
X-Google-Smtp-Source: AGHT+IGiJ+qLGDyGaX64SuGCS5NQM2cGrL6mKf0nm7gz/uETj9zTg0LbChgWnGv76RhBzBcNYhup6Q==
X-Received: by 2002:a05:6a20:1593:b0:153:73ec:fe67 with SMTP id h19-20020a056a20159300b0015373ecfe67mr283929pzj.19.1695405034029;
        Fri, 22 Sep 2023 10:50:34 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i14-20020aa787ce000000b006900cb919b8sm3471285pfo.53.2023.09.22.10.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:33 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	linux-input@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: Annotate struct input_leds with __counted_by
Date: Fri, 22 Sep 2023 10:50:32 -0700
Message-Id: <20230922175031.work.467-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=keescook@chromium.org;
 h=from:subject:message-id; bh=fuFMe5RJqctw9YaNRo3c17jp48a8pQ11kmGxtHC6eHQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPnbq9HMyzXg1GM/G+0YODp6B8YDnTmKbwLT
 IA+uTuHW2WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T5wAKCRCJcvTf3G3A
 Jk8tD/9IP0MlS1aUzonY8JdLcDTAkEZzDGSLrIzCT1/R9A885x3lCdurlSZ6lY3uO+qOuGO5wyR
 CbBFdXNDiCJIilfilYLMXRW+1rKnCF7mL/o3RzTjb9/5r0SQnz7MMH7m93L7KdrAhf/q5haoFyl
 8B64XR4QrJfzsYJvfzo7dcc2Wz6KMqlvcA8IlUOr8hEz52rsf4BVwBxXFNyolwrV71JGLB3F4vJ
 rdavWISvvNKE4WTf2lZsVw0A7zpfba1OB/QHEaoFAjtZvXwfyvwTMrP9nfvaUlzqcVqYa9eRPUR
 DDNsjb6NSGgHm+Tr8HV5qMOkIUinLcNe6D0aQVOc8mBjpe31oeAqLU39NhHdPsk1gJluYML/DYu
 LoMiRoW0F9Pgfd7aUvQEk6AoUKw9PIE3ajSXKmDRiGXVLXSk1AXct9jIqXkEJj6deT70tRCMZW9
 QiBMYv8IAGZnf9+PE+aeD10dUAKVIsUt9fU4zu0dPfGf5qgumVscQsLnxLR0NF5WP8mlfgBGyOU
 2KnpDfX91Hgl3jPHZiEBJbvqg2lFwW683NbrivfaARiT3r/7DTjtDOPHmQ4J8JBr9bLnkIjk2wQ
 qgHLyg5gUE5ae4SG8RDF++QAMkLnF/nqOz5fPsubL5gdGDlNsZ9wUA9lsegSS2eTcIGU2O1Asj8
 dKwVbEr Aum05Q7g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct input_leds.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/input/input-leds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
index 0b11990ade46..0e935914bc3a 100644
--- a/drivers/input/input-leds.c
+++ b/drivers/input/input-leds.c
@@ -44,7 +44,7 @@ struct input_led {
 struct input_leds {
 	struct input_handle handle;
 	unsigned int num_leds;
-	struct input_led leds[];
+	struct input_led leds[] __counted_by(num_leds);
 };
 
 static enum led_brightness input_leds_brightness_get(struct led_classdev *cdev)
-- 
2.34.1

