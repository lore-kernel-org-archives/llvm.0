Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1392FB3
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 21:31:04 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id e4-20020a056902034400b00633691534d5so2955832ybs.7
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=j/W+I4hHsgH0XmEC7Q4gF3YIvEIHceq4+Sd40Z0ZTqU=;
        b=fAPqoEotR6HXIWawKwJLbFLhD0A7kMknqpiO8DHzknb9BSEjSwwaaqwkfL1qrpTi8R
         k3g4JaAfa8Bz0S2VeIr6CON9g3BcIbSAHseYOY//qhUNsFXL+8A0I2+L7MxU265AXL+k
         pIRfpqeZlvbqQwKfGQeYd11YySR1zPqPWgd37R18PwMDphUyr00wLdQMwztwNQSxiVjR
         9kFIiZVpnXNNuOIGc6GANy940pe/XmIDdALFaHfPtnBBbQ288Y9EWfL1xAEN1zpHs8CM
         eiohhkWvfzaKDyZsJGF/55akhba5Za6lOwdQu5lNmeKGOcqg2grWp1PFGW+SlcSEajpf
         49gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=j/W+I4hHsgH0XmEC7Q4gF3YIvEIHceq4+Sd40Z0ZTqU=;
        b=UjX+U/s2+ps+F5djwG2YVyfOXKxc4DFenGfnvLbPXmqRsjl81znIumIQw3ATvaku3N
         NJgOlFJ/DCjq2cO9KzPSXCSkGiUY5+rfj+4laUMKVcS3Uj67h/t5ZK9Q+4Xs6M5saDy8
         7/oOrnE9p7bSeq5nIbUfN+ZjvR3pxNtXr2ydbZXVOUSLdQe8vdkPbCN4tKkEqpo6Tvqp
         BQHAyl+FlTxBpbSKLfuQJ0EEpf0q/jZSf+YYGLrQnZi6kUN+RtDOkwZZH1R1HQi+EA0L
         342MChbi9r8SQTQlMC8CkSNXvOQtRDCYFdbftIOkY2omlgF70Ygugk35tU3lGaJRNE+i
         WC7A==
X-Gm-Message-State: AOAM532Q01ggazayx+iN8wHMi5rhfJhGdLvZkgYxbkTAM5J7On7URt3J
	mlFXM2dfrIGTHzhmR4JLMvmKt5Hp
X-Google-Smtp-Source: ABdhPJwpDfWf//RRMeE/B+yywXGJvdHVgFFevRfNLr3P2AD8ceUgdkB6afRES9swV7fkNGQt0BKcrzWL6w==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a81:5dd7:0:b0:2e5:8fc3:6d85 with SMTP id
 r206-20020a815dd7000000b002e58fc36d85mr2327247ywb.393.1647466263509; Wed, 16
 Mar 2022 14:31:03 -0700 (PDT)
Date: Wed, 16 Mar 2022 14:30:55 -0700
Message-Id: <20220316213055.2351342-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] gpiolib: acpi: use correct format characters
From: Bill Wendling <morbo@google.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

When compiling with -Wformat, clang emits the following warning:

drivers/gpio/gpiolib-acpi.c:393:4: warning: format specifies type
'unsigned char' but the argument has type 'int' [-Wformat]
                        pin);
                        ^~~

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct ones for ints and unsigned
ints.

Link: ClangBuiltLinux/linux#378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index a5495ad31c9c..be6fb2ad2c4a 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -388,7 +388,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 
 	if (pin <= 255) {
 		char ev_name[5];
-		sprintf(ev_name, "_%c%02hhX",
+		sprintf(ev_name, "_%c%02X",
 			agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
 			pin);
 		if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))
-- 
2.35.1.723.g4982287a31-goog

