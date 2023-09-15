Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F31B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:10:00 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-577f6205f42so1887673a12.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808600; x=1695413400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk/nOdWGEwQoqrorI1M5M4fwyDhM0MyESikBhRPJynY=;
        b=Sd8s16lVUHz3APn7/M7WvVJyTo7G+CzHD2EXaJmvBbXUvhZA2gEl1fpc0f1IeCPgCb
         1DlhiHDPWI5d2OvqlHQlJn90GmOANj/UK4lKppOOVWj8zAoLkwqH2C1/U4VDx7LWFUxn
         zRI9qIsAD6NCvxbqkpwvQZuajUFBXjH1oYRgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808600; x=1695413400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nk/nOdWGEwQoqrorI1M5M4fwyDhM0MyESikBhRPJynY=;
        b=jn1TwJbnJSgpalnmpWew6M0OH5BPJ6fRvu+DuZJ/tnm5rRzzyDdoNYxQZnU55tQuVa
         LrHOa+f2hgHBAhhaveJfDHFb4V40kPcK08sq5VM9Lpx2N+yD5tl5Ip4MMVLfG9fgZD0P
         1KmGLZRK+2cA3KxnxsI9SlILiW1F3vRY8wHdKkkYwqsJxzWb1B+eYGY7bGBT4qoE2oZK
         6UFYyGYPXnxkmfj/dGlmQFbifg8WmQODMfvRZCKODLvs+FASFCUs5bWxeD7vKnNRJyMs
         mPSp1v5MT19nustE5I9Xfc0OXbazagehUrNzAlul7pRsJoDgDcXoCshs8k7c/Xxs088C
         JWjA==
X-Gm-Message-State: AOJu0Yyuphw0tHlBpXam+fZ4A6zIWGdL79hZJda9jiuQBJYGwgMlg7lH
	la568iYl2VjUe9Ih73e+X4kPVg==
X-Google-Smtp-Source: AGHT+IFkfodOw8key9MPLTpF8gDPsl4mUuf9r5i/8RdhOSnfEKeLKI70UXE9EitqTTeBx6I3fzUqdQ==
X-Received: by 2002:a05:6a20:9193:b0:130:7803:57bd with SMTP id v19-20020a056a20919300b00130780357bdmr3001465pzd.3.1694808600453;
        Fri, 15 Sep 2023 13:10:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j26-20020aa783da000000b006883561b421sm3321766pfn.162.2023.09.15.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:09:59 -0700 (PDT)
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
Subject: [PATCH] leds: el15203000: Annotate struct el15203000 with __counted_by
Date: Fri, 15 Sep 2023 13:09:56 -0700
Message-Id: <20230915200955.never.871-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=keescook@chromium.org;
 h=from:subject:message-id; bh=AuQmhyKilUvoXwglsma/MaTlIjm+821tEBgc3NFI2G0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLoTgbluNuEb1ppIxCDVPhVSRR03x+HRH+wGk
 TRaulMR7I2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6EwAKCRCJcvTf3G3A
 JmYoEACdL3vVF2NKECABdmlrHoQg7GoQpORVNGSD7el8DAMl2SBhoB09PyPXllokTqK9Wdil8zV
 zZPIhIGvvUg5oG9N/OMZs9AwUK+CMQNWBG1YsP6za4n0V2TaobBHGIJmhYbBfcYx8ZgAp/bSWN+
 TvG9AQpwF5p5NuHck+/CfHURygXTJpYCHco/6y8qBEuIttCFIsytyfX2AQPbQuSvDyoVXAcfxjb
 iaKhvLFCMqVMnBmihmv6mFyiLZfARMGlfrvAAO642M46+/rMmAx0Fg0TCkLZDrmOwoOXUqiV4kj
 BJSWoBKjM0hUxo0fXw/Ha5n6uDjLsZ9uXNh6cszZO9Dx1z1bCrAWDkyIKpryVLX4ZF0Xn2MZSD9
 y2tF1ooPUPeZHIFOy+ZdXVrUI5Hrcgq6J/85H2zltLR30GOyvTV0cl4wD6vz7T1xZz6JT0jN//L
 tBY+QCaBMaB2e7UPPX6ivy4npGZRvC93WHEHwYZ7pRXA6aDkDEL91tLzVdMdPeGvNvybrASe8sN
 vwcfhZhL+89ozR+go0DF8VBaeAuHatpbKYiUM39R3IB+Lvn5c3v8fUxPUHvkZDJEvD0R7u8gsqi
 tFykTaw5+cMlZFoLrXywMsHcXVrOccqZEt+dOi9SCZnr7CvdKlmoHc+hTlyIOli3HNATBr5UqqP
 pJ1mVkd qJDn93uQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct el15203000.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/leds-el15203000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 7e7b617bcd56..d40194a3029f 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -80,7 +80,7 @@ struct el15203000 {
 	struct spi_device	*spi;
 	unsigned long		delay;
 	size_t			count;
-	struct el15203000_led	leds[];
+	struct el15203000_led	leds[] __counted_by(count);
 };
 
 #define to_el15203000_led(d)	container_of(d, struct el15203000_led, ldev)
-- 
2.34.1

