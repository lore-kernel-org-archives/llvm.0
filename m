Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33033FD
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 20:36:05 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 134-20020a63018c000000b0040cf04213a1so10580263pgb.6
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=6l2CjPLXl85Q15DcTvzQiYj2hwKWjzB2O4EVtvxw9k4=;
        b=BePOGD043IgAR5e+hSZbNy1h9F5Y0m1k7v84h0obB/WrgkLEFoueASGq3zFANmGHOz
         Fqenh8TRKEczyYt13TyKQ/Ft75B26xUhSuGyvRQ1zAE6itMoB59ht02AEvEnakmLUxo1
         YrgKYzHPAUKlGfQtuamRhtSX+m7/2OihMg+kF6Vo0qNw8krFAz6tlcVoW3lneuVLIR/h
         GEyuzB8p4Kl6HFl5aYAKmtmecKC3zCIjOrhRDPP0KBARRNl50UsDmdCI3DwTygCZo8M7
         b40SJKdfrcVjMe9jgBYSzHx/b6Wb5XtUSgOuz6jyPFwQ9k+6mebwJ2kKzNw9KUQELzMt
         6jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=6l2CjPLXl85Q15DcTvzQiYj2hwKWjzB2O4EVtvxw9k4=;
        b=Ws2Agi5ywfOEHUjl0OwzN7od86HXcgrxV1m3IIqtJGAH2ORV2nzQaNEnzIKjbQzXM7
         7V48WqRGeKSsuhm4oixp2R65u9PIOZFcUnXk9otzOk8cQ2j1wci/l2nG/bV/UGyHflCt
         ckHZoxwYoUIpLgIbYw3w8gN5U1dupq9+Cezx9yKkcACJ5VkLc9bmObmYmHBLSRGuC0IQ
         ckMXCs7vG0VeiTZ9uzqpLPJVB9TXeC6roMp5z4nWNZ2+FaS+P1RHv2VE0TcDYTrzxWKa
         ei+JmOCidDYmmFPGXmdBhdHGaKNdwTqcgCJlW7iOoY+iU8bo/nvkrFRkvQiM5zLciZj7
         7QrQ==
X-Gm-Message-State: AJIora9t98d1YZY5UloNIQmp8ISn2FgQWsGm9/GTrWc7sZLQ0QihTHce
	kxUNMTg1MHPXnCI2OQDbj3Nlg8Uwu6HTpz2A4g==
X-Google-Smtp-Source: AGRyM1tWj8XkMwJhTmMQrFk7gxtfhZc4z1G9yxzQYISYkgHffEzjFg1VIhwaywiaaEPo5AH9Nu2FnTrjfLxNFc3emA==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f21c:9185:9405:36f])
 (user=justinstitt job=sendgmr) by 2002:a05:6a00:8cf:b0:522:93a6:46e9 with
 SMTP id s15-20020a056a0008cf00b0052293a646e9mr5910494pfu.62.1657312564619;
 Fri, 08 Jul 2022 13:36:04 -0700 (PDT)
Date: Fri,  8 Jul 2022 13:35:49 -0700
Message-Id: <20220708203549.3834790-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] mei: me: fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter the following warning:
| drivers/misc/mei/hw-me.c:564:44: error: format specifies type 'unsigned
| short' but the argument has type 'int' [-Werror,-Wformat]
| dev_dbg(dev->dev, "empty slots = %hu.\n", empty_slots);

The format specifier used is `%hu` which specifies an unsigned short,
however, empty_slots is an int -- hence the warning.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/misc/mei/hw-me.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index befa491e3344..3a95fe7d4e33 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -561,7 +561,7 @@ static int mei_me_hbuf_write(struct mei_device *dev,
 	dev_dbg(dev->dev, MEI_HDR_FMT, MEI_HDR_PRM((struct mei_msg_hdr *)hdr));
 
 	empty_slots = mei_hbuf_empty_slots(dev);
-	dev_dbg(dev->dev, "empty slots = %hu.\n", empty_slots);
+	dev_dbg(dev->dev, "empty slots = %d.\n", empty_slots);
 
 	if (empty_slots < 0)
 		return -EOVERFLOW;
-- 
2.37.0.rc0.161.g10f37bed90-goog

