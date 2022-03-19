Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12A27B
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 22:22:42 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id h8-20020a25e208000000b00628c0565607so9497387ybe.0
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 15:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OkSdEnZDxkie6HpV+Cq3FfZcGdO9k6Q2dedvGrihz4k=;
        b=kHBbs+54TQt8YvMHJ4P15RTiz6iMnXCDYI6xGPXQeLnigv02pyh3ovt9kgRJ1j2lLb
         t4+AOulByIuiIQh70uHNxxuclxQ/kSABl46uzAYW0Iwf7WaycffXcHKeDQq4ZQeN2izO
         98I8Fd89vVvic/c6V2SlbxEdUy0Q5/V0h0R7fCy3LMOjX8/QgE7sH4fxMcZ/BngDA4L7
         syOqscHseotKX75Nl/04HrFQ9UXUZTUc9qBOPT93mEsz+vf+rIQd8Kb3sWVBwZDMgccf
         TlCZJk7vUU623Vpff7hAprVly+y/6kpn8qfGsVhAJG6WBx4N5PBfYryxSAymDBy8gcyH
         YT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OkSdEnZDxkie6HpV+Cq3FfZcGdO9k6Q2dedvGrihz4k=;
        b=LNM2nGxs9d5jtFbJERs5Wn+mcuGBIq/zkI07dDCAkL99ph+QQ0QB5yiSb66krN+Klm
         Knbv30KN9maQBh7SCu91NPzk6cug07Ge3dCwsOmwJnsVgtXwD6fFwHkAAkeZfTN1iGW7
         YmOYcbHlufSEsHMBDwBh0xTBA/MXIqLqACxHWTwVzDPR9F+Jarc9b04VE7QTiR/KXMed
         kWsm3GRYxPzH3vtR+WdNt4FY2cJ+VLYFJj1ayFZ5TeWLmOM015fQk8/6eZWyiKsVffyF
         lehr7ewYwurcYy4hsiG34rxLU8WezJBtxcyNfUltHZSqBo6mnGdwyxSNcNVROM8xDa44
         ItdA==
X-Gm-Message-State: AOAM530gn/ExXIfMGKMgBS4hphFxQ2TxOezOqTvTW8LY+MP5q/nvvKss
	vqM4gCp9/WjGTLjPq7hTSyev5t1v
X-Google-Smtp-Source: ABdhPJwBJbOZ/XB3qdeuKan76xVvlKrJlJwjVdqavArroy0vYh8wzbTjEMoyDcySwnRgwhJGfVbTY7DWnQ==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:f299:d506:bab:fff8])
 (user=morbo job=sendgmr) by 2002:a25:d304:0:b0:633:64ce:99c6 with SMTP id
 e4-20020a25d304000000b0063364ce99c6mr16652532ybf.433.1647728561817; Sat, 19
 Mar 2022 15:22:41 -0700 (PDT)
Date: Sat, 19 Mar 2022 15:22:28 -0700
In-Reply-To: <20220316213055.2351342-1-morbo@google.com>
Message-Id: <20220319222228.4160598-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Subject: [PATCH v2] gpiolib: acpi: use correct format characters
From: Bill Wendling <morbo@google.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: torvalds@linux-foundation.org, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warning:

drivers/gpio/gpiolib-acpi.c:393:4: warning: format specifies type
'unsigned char' but the argument has type 'int' [-Wformat]
                        pin);
                        ^~~

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct ones casts to unsigned to
retain the behavior or the "hh" modifier..

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2 - Cast "pin" to retain the same width as the original.
---
 drivers/gpio/gpiolib-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index a5495ad31c9c..92dd9b8784f2 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -388,9 +388,9 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 
 	if (pin <= 255) {
 		char ev_name[5];
-		sprintf(ev_name, "_%c%02hhX",
+		sprintf(ev_name, "_%c%02X",
 			agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
-			pin);
+			(unsigned char)pin);
 		if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))
 			handler = acpi_gpio_irq_handler;
 	}
-- 
2.35.1.894.gb6a874cedc-goog

