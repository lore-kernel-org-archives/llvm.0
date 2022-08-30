Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0598B6138
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:31:52 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id s15-20020a5b044f000000b00680c4eb89f1so868577ybp.7
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=stIJrjMqwQ0zAOFApEyjbwm3OExfLqdVzHQ/Ti/K+RQ=;
        b=XT3FqCUj0oWltSKyz0DMYCdz3zG/R+ch6PgREyusoybVfYnjSIIp1QEVmgkw27BMRj
         1bwaWQRauXjRVmhR+FXatY3cAFgTFdHOwv4MeNRe9viWmXCdGh3ZqgTqK/bonGIUbUm2
         nzVQrEYCIwgQuRvzHL9weunLc+sqBtMBzhAT8qbEtdumA2TqedCJySqMrqa0Xf9T3VwZ
         xs9JxjNj3lR1umlvKCUf9SNYAvbTD4J4ebt11ivYnN3e4XZbiJ9Vkff0l7aHJfuG01re
         yOHwdfZzJCRQzCio9+FrwTtHBU/fAgGor0fUpdX6v+iYm5fuK07woR5EljmpbadzEdVA
         zmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=stIJrjMqwQ0zAOFApEyjbwm3OExfLqdVzHQ/Ti/K+RQ=;
        b=dvF/FwHbH7jmQmLEJ+wjHOzaF7W4LJKe1I5s9FX2wf0qLcn3WaAYvY5DzPNzK/3d9o
         j6XU3TP2fUWaNTthHV5rEAWnikvNZ/uNA8ZKS5MwHEjegcHUgjdLfkWcmKTwdrL381im
         AZPtSSDFI4qXVEgt18spKDLWcexWoYWPLvt6bnb7UL2YBsySY/HV1BXa3BG3Im44WcYT
         AkJmgbFUyBGTEFWqBHo9usC8tDgaRriuqDrqvClJDpsgYI3tGkQQCDaQvD6apCxABvhR
         wDdpWoYmyJIWaQhcKj+jHItiS+qmE6ZWqRmpTvVcqI8e7EqM9ka/RQF3WItCqv824Puw
         3+3g==
X-Gm-Message-State: ACgBeo3gLmOTgHWqd73krdQoYuqdQ3p3KqN9Hi5WLK83RB04OM2bx5xc
	toqE2TQXRxSiNeIJrcAkja76ALp/qJQ0KnyfXVA=
X-Google-Smtp-Source: AA6agR5cGTdetFCiErxtdp82eH3P66qCr5xSoNGpsQG/NljG1Kaq9Ijanf8vSqY++9XIfhHa37mVG0A5SaW5IY9d2eE=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:54d9:7143:6a7d:91d])
 (user=samitolvanen job=sendgmr) by 2002:a81:8803:0:b0:341:6235:8cbe with SMTP
 id y3-20020a818803000000b0034162358cbemr7018693ywf.146.1661902312128; Tue, 30
 Aug 2022 16:31:52 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:31:15 -0700
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>
Message-Id: <20220830233129.30610-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=samitolvanen@google.com;
 h=from:subject; bh=qxVnlSZocW9/1UypXlLGEHXfm4CDzclNhcl/lJ18fGo=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjDp3M7+6Z3E3yWx3lSnRphzF4/3RQHI2psdANcTX1
 DniQSb2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYw6dzAAKCRBMtfaEi7xW7vYpC/
 wJyHxmthaRukbl+m+7vClm87xKX81E51zW8v/dmnTAiBQ7oT1Ek1XR7SJo/50PfceCBcZ366Psr6wx
 L7143nIwKv3bXT4p97cRjwxu4M0m8HvXeZYxX2Xqsc6uerduxtDTzFjDPWA8VsVsVXpIN5BluFq//1
 Jx120TP9+6zYwQsOBpMcJCq2cr+LMVUG0pX2qqLSJGAE1+2yoL2kBisWcIdDxS1jJ5266S/HoYqktz
 JO/BzYSjJqxWmTxt2M4SzxDHm1EgNjsm5ntVO+KRW+klcvF2/1A+hyopJ1c+SrByL7fc/WNq8q15Gu
 rS6sXoG21TAT7q0EBWR2GYae6G6d/o1Sn1DTQpzi+TfRj8zYXkDPGgdxdflelIoodZ3g3q/vf2hzCC
 Y6S35Cpa4ek9uS8PsTuYFkYecoZCw/xrq+x1R6KPGpwl3/NAuYPWxv8goJ10UY0hjOxJby0LDXRouv
 cp8+PZmKAqFAjGeoHcRcLyUkHJSTY52q00bcKiCKHOdz8=
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 07/21] lkdtm: Emit an indirect call for CFI tests
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Clang can convert the indirect calls in lkdtm_CFI_FORWARD_PROTO into
direct calls. Move the call into a noinline function that accepts the
target address as an argument to ensure the compiler actually emits an
indirect call instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/cfi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/lkdtm/cfi.c b/drivers/misc/lkdtm/cfi.c
index 71483cb1e422..5245cf6013c9 100644
--- a/drivers/misc/lkdtm/cfi.c
+++ b/drivers/misc/lkdtm/cfi.c
@@ -20,6 +20,13 @@ static noinline int lkdtm_increment_int(int *counter)
 
 	return *counter;
 }
+
+/* Don't allow the compiler to inline the calls. */
+static noinline void lkdtm_indirect_call(void (*func)(int *))
+{
+	func(&called_count);
+}
+
 /*
  * This tries to call an indirect function with a mismatched prototype.
  */
@@ -29,15 +36,11 @@ static void lkdtm_CFI_FORWARD_PROTO(void)
 	 * Matches lkdtm_increment_void()'s prototype, but not
 	 * lkdtm_increment_int()'s prototype.
 	 */
-	void (*func)(int *);
-
 	pr_info("Calling matched prototype ...\n");
-	func = lkdtm_increment_void;
-	func(&called_count);
+	lkdtm_indirect_call(lkdtm_increment_void);
 
 	pr_info("Calling mismatched prototype ...\n");
-	func = (void *)lkdtm_increment_int;
-	func(&called_count);
+	lkdtm_indirect_call((void *)lkdtm_increment_int);
 
 	pr_err("FAIL: survived mismatched prototype function call!\n");
 	pr_expected_config(CONFIG_CFI_CLANG);
-- 
2.37.2.672.g94769d06f0-goog

