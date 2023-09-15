Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2A81B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:09:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c43fe0c0bfso6274915ad.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808581; x=1695413381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZHgORBBG6ssjw++gZqBRejLJi1rVlKpyOxRrxxQwRA=;
        b=SQcluizc+RHE+NsblwyZeb4MxoLSw0mw8HWivfqBPDigydHowLUmn97as8SBF4Eo6B
         IlikTCXaTbYv/7ZXqCYhG3qaz/JkmB/QXg3wl81l2dWOoCs/73n7Yt7lPsWWQudYS250
         mgQGEzK5X/iAdPExZEJ8EyPYLc+Nfn32lP7Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808581; x=1695413381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZHgORBBG6ssjw++gZqBRejLJi1rVlKpyOxRrxxQwRA=;
        b=kU0ZPEeAKUrBxPcK34nvJJy4nmp2Rs7pUFOF2JjavfkvmQEQl7HYf9qmyWHPSeO6+6
         TTW4minDIaAcYTU0XDWXMxS83bEEIOQmNmuujM3T1PFDMQJq5xTvxJdPmVXJN6q1On2e
         4sMXHlyRnJFceJBAf48DovCGXKGte/wHUndEn22Dqcj5RsnDarBpOFMoc9j3vKFJIz9+
         5crGdgTAF59QRE9aNIieUo23RkUrbgce4R4zDh5FIMns0xdaRlOdfrW31F9SZyRLWPDo
         S96qIdYCHWBC6vgf1JY3gorIN0QZse4g4NvCOWr8v/CM+iN5Vx+gA6jzjrB7Qz1nk0YC
         6/vw==
X-Gm-Message-State: AOJu0YwqivpKwrJcEJflC3SAiCe2yHUrFPKac/Ir8B/A9ZrgcC8P/00j
	iUi9Fxjm7WMFrhAcds5fKG6qXw==
X-Google-Smtp-Source: AGHT+IERqajdncd+WB2eABrqeGZmFlwyJxwl9lufmAtYk22AnJYdSJUMk5KsBJM3IWItSx/NZqDv7A==
X-Received: by 2002:a17:902:e551:b0:1c3:2c2f:1132 with SMTP id n17-20020a170902e55100b001c32c2f1132mr3059174plf.54.1694808580799;
        Fri, 15 Sep 2023 13:09:40 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bb6-20020a170902bc8600b001bba7aab822sm3860053plb.5.2023.09.15.13.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:09:40 -0700 (PDT)
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
Subject: [PATCH] leds: aw200xx: Annotate struct aw200xx with __counted_by
Date: Fri, 15 Sep 2023 13:09:39 -0700
Message-Id: <20230915200938.never.767-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=keescook@chromium.org;
 h=from:subject:message-id; bh=oTHqicaprD+Vk+cbEHwEFzQOqlE3AUBeMdwhjiKKmQg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLoCDhkOw9PWaCCHnBnbp9dycdVACHvMghQmR
 riWUgKv+YSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6AgAKCRCJcvTf3G3A
 JnqhEACGDVxaxu8dnzElwrmWNW2wxsx2VYR6mDGkTxfDwLy87LhrnBCTw0r+OXID3WbnJlVuK3m
 URWF8Pexx9n6ZWJ28D+roMmuQSKIbnlzBUQgQapCyAejg26D6GHYrECLX/heZnh7C8ZO6a/5hLP
 T1XjoIpoWJep2Am0zWpUfj/9YJGdBTAQ4acT+pKsTJ0J3Eqvv2TIkxCw+vL4SdT9zuR0M7p7v3J
 DlgC0p3Gr82v+Rg9Gr9EZ4b/VvNYsRW+oilQ35/nECjgoRqNf1IsDegl25knsYnERkmh9rwgq7y
 5RpxOjujCD+CUbDecn+SOtzMjvtNU5p481WLZc630Y4ALfXfqS/QXaEDIHTtZsyB0qY1BpP4jmR
 RnxOKUDFgoRbdJVbGma7Vd24Nn/88w4f9wnHOGvKgjHP9jxYrfRNXTijklmDmfgGZNvGYLofPDR
 FMZ6ul2puwRMBMGHihDZ23vzxaCyC8i4mCnMDENsAezK31ZYewWGRL69iNeSP2yUP6qXouEP5Em
 28Nv9SB3ehqFuS5G406AVpx/VzO0uFzSdSIfWWlTo5YGRPxT7e/1ikQJTqnFltPV5F+s85hXIoW
 G1k68CTTTnouYvEyUyyoc3WN6Xqas51qFn+8fjRH1JKhfmn4G4Lf5deBvGZH3wp0lYG09fYF3lG
 Y7Sdq1O rZG2uD2Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct aw200xx.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/leds-aw200xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 691a743cc9b0..4d517cace3e7 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -112,7 +112,7 @@ struct aw200xx {
 	struct mutex mutex;
 	u32 num_leds;
 	u32 display_rows;
-	struct aw200xx_led leds[];
+	struct aw200xx_led leds[] __counted_by(num_leds);
 };
 
 static ssize_t dim_show(struct device *dev, struct device_attribute *devattr,
-- 
2.34.1

