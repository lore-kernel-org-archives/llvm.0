Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E21B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:10:06 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68fbd5cd0ceso2213955b3a.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808605; x=1695413405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQVzGWkf7HVCqp2OLBRlKNzMbLz4neMZQx2JbqpcRaM=;
        b=a5x+K+l5uYpmqWOQhbqyY/Du1ezY2Ed8WLQpxZxRPX4FNI68PL7pLFPVJQYO19aN07
         1kls/K6sc54pGIQVv9qFkiYCSTObB0rZaLYLyV7PZgH96q/FxWr9Ke2Vc1KbI/dyzP6o
         kqD3ua6Azhmer7Whesyl2ME68yN+GbSZNw77E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808605; x=1695413405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQVzGWkf7HVCqp2OLBRlKNzMbLz4neMZQx2JbqpcRaM=;
        b=if6IX0pn8QL1/fYHAU5V4JspLHxxsQqpuilLuDoJbGHAgUrS/wSVGs+adH40PXobbj
         8cuUKqf0huC4K044M46fEwULN2CfLusLGxL89WmGgaaUQLWeAtUZK5TGxsUnnK+jqr64
         WcvYaw07yq3U/HRLLDvzNtohGLM8otyt+c8Hc6pPA5+s4iLuWy+Gckh+xqzO24Jjf0ER
         oWhz7RZy1606pWEDovaBTnytmZH0T7ih3Ux8wInOIfk3LfxhrYGRH4ATPpFpGyQ7BfUS
         KU+qEgCYp5b6cJ+AMoHmYF/P+y2+Mbqn26JQRYdFtHbX7O7ak+u017ZHbwsz7ypuqLgC
         zycQ==
X-Gm-Message-State: AOJu0Yyz+Z/coKML38JkgczRC6vk+U5SYdtKCH7wHTdIf4AE3+YCT1ms
	9FSwxMzXwlqpfve+iPDNzO7Ruw==
X-Google-Smtp-Source: AGHT+IGmItHIYws5zyT5WqbbkI7YE7oVstUZ5sjqy97PsqZuhg23r5YqzwQVqjclJm+2VOByiXr3VA==
X-Received: by 2002:a05:6a00:2386:b0:68f:edfd:2ac6 with SMTP id f6-20020a056a00238600b0068fedfd2ac6mr3092215pfc.0.1694808605765;
        Fri, 15 Sep 2023 13:10:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v2-20020a62a502000000b0066a2e8431a0sm3327325pfm.183.2023.09.15.13.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:10:05 -0700 (PDT)
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
Subject: [PATCH] leds: gpio: Annotate struct gpio_leds_priv with __counted_by
Date: Fri, 15 Sep 2023 13:10:04 -0700
Message-Id: <20230915201003.never.148-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=keescook@chromium.org;
 h=from:subject:message-id; bh=g02eNjr5fSoURtZM+k1a/ubK96yp9CuHHEf8Va6oCXs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLoc1T3DPO/feL5xYpcIAm3aABR+QIrhafXXM
 d7a0I9P3G6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6HAAKCRCJcvTf3G3A
 JgF0D/0dSbBzS492RBJC5to7Z7xpPsdhDREw7ReyYb514AFImFYtfefyrXtgazrHIHNZn4m7Az8
 FgRcUDkK3CTgj+V3JKf0wDPP4C/d8PCw+xH7XqaBEW941EUScRUWE2SqLw3gAOc4Aj3IsQJX8Wx
 gtdUmH0UVn3q5MryLs2McFw1Mq30XRTKc/6Q7uHQmbVC4QCRfzQrtCrM1jDpboifV06dq14KF6l
 oEr0YDZ0k3Yeou6mJn/tuI572iYKNb8qB7hDVGmwSg02fz7UiXvg7aphfoNO0ryeNiNiSSTzu+M
 QwKDfckpPlBKFUf6qeZPmQ/Q8bBNMmoADkm4hD3EfjaawXW2FnImRi0badqtgZxk2Xih+NncdqX
 X4MtYVyYMLdV1NCWkISWWNXMdbThdueTVadzPDZW92YPXEsAL6L0nUH5q/ze5r6ioJ2KdWrrQdB
 vzkHeQFOeoCSgE9sVl8DKWCb3ZDTD6CSLyTVJ/OJizlcer9Jw0/Xdn3YRlsAd9hvGuF+oupTKV5
 YcZ6Q1c8U47QRaqFHPP/dhTiLwlA40dJ0mEMg8nl73LW70H11mjwx92hSY1txdMa10UCv+kb8mQ
 UjF1ot4h8AOLsczLvc0cp1Uzxv4ncZryevLgmxtwaewWy/o0g8kZ6dCEc3Ga+/7DhGHPSYRBg8K
 J4iPM9i JX2KsxXA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct gpio_leds_priv.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/leds-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 7bfe40a6bfdd..a6597f0f3eb4 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -142,7 +142,7 @@ static int create_gpio_led(const struct gpio_led *template,
 
 struct gpio_leds_priv {
 	int num_leds;
-	struct gpio_led_data leds[];
+	struct gpio_led_data leds[] __counted_by(num_leds);
 };
 
 static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
-- 
2.34.1

