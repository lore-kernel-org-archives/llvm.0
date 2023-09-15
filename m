Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D141B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:09:51 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-565e395e7a6so1603004a12.0
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808591; x=1695413391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Muy93PhGxQI637LkltSivczIg7w0S2HDIxF5V69MsXg=;
        b=S6KuOO9U4D9ie1krCCAI8iFWPNH3FYdEeQ+k5e+PpgF2LrckFCpQCwXINNyHkMkaSk
         o3I50q4f/Cdls8SvsRQl5qSLCp0ZHgFO0yDvoLfu42Q4holbNxGDHCXV+YM+aI9/MYlQ
         4aS7WTVetRPKURSwa/tptJnAAIBLJNAxABEMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808591; x=1695413391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Muy93PhGxQI637LkltSivczIg7w0S2HDIxF5V69MsXg=;
        b=Lup3DE287bAG9/cUqu93ClAYFbgpjmLEJL2+I0O7o1c8ZOLbv92FJ0C+1olRWf3izz
         pC6Btc4GKfnfwUBGVnC/atoeryi03w3ZC6xchR5zIyGmTw4kVXNRDWVWFr4wXEg2/uOc
         lTfmZCXQm5GgeYWtX9Lfw0r5xoBuGCpoMZ6e5txVj6olQbAIbTmyMibXpCXkVy6INQ4c
         mw+AY/6ZZL4ybAinjcZNZEmYGlWZeeKljBCj9jNXkmrtB5pQrg/k/In0mf1xAw/HNzCI
         tUbK3fITD631UYsw8Cog0rgjwDy4y0ipBtbQG1jIx0346638288VaIZTfWOERQhRtcEX
         axkA==
X-Gm-Message-State: AOJu0Ywenzaiexkiixfp4u0hWUKQFVOay8rglxwJEpmkKWvAMj6FmBS9
	cUSDHz1ZGlkIMc409y40GptpJg==
X-Google-Smtp-Source: AGHT+IFrv22jckxNyFPHk4wkul59BZWPHDh4KeyX5yWqIvjMYexwtkhmjNCln5KRyZogKvg66UkBMg==
X-Received: by 2002:a17:90a:130c:b0:269:621e:a673 with SMTP id h12-20020a17090a130c00b00269621ea673mr2603231pja.1.1694808590812;
        Fri, 15 Sep 2023 13:09:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f2-20020a17090ace0200b002749fee7984sm1439060pju.22.2023.09.15.13.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:09:50 -0700 (PDT)
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
Subject: [PATCH] leds: cr0014114: Annotate struct cr0014114 with __counted_by
Date: Fri, 15 Sep 2023 13:09:48 -0700
Message-Id: <20230915200948.never.728-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=keescook@chromium.org;
 h=from:subject:message-id; bh=Ay/S96r+TTbAZJCf/FmudMqBXZB0z8bluDuDqSyybAY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLoMRK4HKwbRdA/dQbibTN2neXE8kbK2imD47
 OJ+4vPf9VKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6DAAKCRCJcvTf3G3A
 JgeFD/456XBWPDEoi/0lXVUiOYdHq9R99vQdrY+GKQhMNhO2/WY8oM+OfE51KIc6dW8iAM2/i7F
 SChkpSp3hLfJ7uYdd28ESePEquipBhWrrBb/q4/fS9f5jGNvW81W8QMRcVskWtj5Uic+kCnzf8V
 jK3aModQKGLsYkj2F6z0mYZV5w8mXznoG3ndXPezz6jsGsuTuBEMagzXvOaXr7KCDkJJ0UOG3gU
 GaSQN5EQydQ5CyAWpL+SjS/TYSniIgF9eqsEoZ4xiOPBmR91woy6FQn3Z4hrlir5Izm+Pmn2RvL
 QsUBHiY3uyWfNzyfg8H+yPhjUx0JNpQlUoLis7NUidDojd1bRSkXjiEKKkywOSEWS94XQRqoM9A
 EnyL7jM0sh+jJYgZNqNxYdXv2yONd77E/9+TVYG4ntdl5/CBbo9iUw5XAr6n2KO3bBsztkJ4KOO
 OP1DUkOvmelWQRajNYgxjsi3RWvUyMhOd3fipXAe5bex0BOiEIg+mjS5nuuHKEcj+mJ++dIzhLx
 t6Txfb40SANvVUZVgr+3KTXpkYgNAKWDKDqwI0bmWboS2HWzyAr2OzFbBvBh6Z5UpEdZWUhn4Q5
 Dj4geW1zSzfm1s0T9SL9D8tCJAz7WEM1mt5hRQgDb9mLZMYOc6K1EpgPA1SrKaiBtXgIIDOnekE
 Yw0266w 5tKVbWGg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct cr0014114.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/leds/leds-cr0014114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index b33bca397ea6..c9914fc51f20 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -56,7 +56,7 @@ struct cr0014114 {
 	struct spi_device	*spi;
 	u8			*buf;
 	unsigned long		delay;
-	struct cr0014114_led	leds[];
+	struct cr0014114_led	leds[] __counted_by(count);
 };
 
 static void cr0014114_calc_crc(u8 *buf, const size_t len)
-- 
2.34.1

