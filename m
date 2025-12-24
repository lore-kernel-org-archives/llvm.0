Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216C732ED22
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766565693; cv=none; b=X5IRHpwVN0Qfw8Kror9GGdXHlEbS7sE5B8XX5CjD8+hnk5t+gOwV2YBM7IiCR5ggnrteXj9a7oWVMAKGzBA6ZrMgG0fDu5CEq2npqlXT2giJVNgShCBbtGjMW7QNrYS/ivYQvrpe7FrXqcjBatzqf+04V2qq+9cAH41Q29/cJFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766565693; c=relaxed/simple;
	bh=b9azLrvng1W+owOZrrSCG2h1ZMWVw5Gr5XMFi74WAM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uLLl8to7xdDCERQ7GW3vhX4PiFtw/M4UAnL6kiUCaNXHwYW9AnF/V+NJ7Opr+1lRcts0jxL5oS5HsVqNb92rtFalE/UF1rq5er7o8GS56ebiSIBVhI1DOpe+Mrusqo8vRR6Vbfcw+PCnkITAzgoFqxb37/lssDRNOQLERk9YmIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qJlRtx58; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qJlRtx58"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-29f1f69eec6so72300695ad.1
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766565691; x=1767170491; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8kS3dI32T4iLMQTgoo/uaduNvix6IC7/fsObmlhneA=;
        b=qJlRtx58I/9PuuCRzkfFRLlEZztJjD+25DLhZ/IvDu5pEkJGHPzyqSp+r/hSzzIFzu
         0cR9xafLueT89uswrx9zOCAA6JZEM8fvGlSSe78Cz7rBHjj+aOH624nogzF8t9lpDrkk
         eZI2mpHazBNRrpOYtr1MQXU59AQusXHXVHCI20Fwx1yb6ohsikz2wnylmLSQ8h3R63rx
         J0BYIWP0NC1yy1GdmfSd6MKUi0F26h2PBWKE4oBVv+CI6AijBkisht+tJ8CKWchcVgX8
         pGiHraT7peu7Tgg2oS7gI0cMx3CRCEvs2RWrdOtPYxggnfnaoL+3WN/X8OpgHU08lg/K
         iW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766565691; x=1767170491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8kS3dI32T4iLMQTgoo/uaduNvix6IC7/fsObmlhneA=;
        b=ZXotfiPI0Bp5GBxNJAHwzMC63LzuTyXQH1iBiMyE0sGEaEchzYkdldJmhu2rnFPQQn
         wjYHaH29Fqo5+Ht3NEvDBmW3sfyEW2doyWs77kUbMiuGFDk8qOZ831kNcztzoupaqAW/
         6gHgJpel7g7Bf2bG3qu9sdAQv7yevcmbqedCRpPrz7TghWXeRrrlnwwu8d74tT3On8Rz
         IyF+WgDN2SGUkGngyOXcdKnnf971g4yQHO7v7Mn0n3xp0pUti6h1ZWK9jQXna0RP5Dpc
         CdvfsDv7MT4BZ3478Xif/v/oj1DmB5gKNvksd7SxoTqkvNLqxgEvcXQheUZ88LfefLp/
         jcuw==
X-Forwarded-Encrypted: i=1; AJvYcCVGFZOCVXIyfU+WkeoNxPtCHnq3ZP61zRZQTfP+XrURYPkY/L044+GsgOhaJC9Pnl7j69eu@lists.linux.dev
X-Gm-Message-State: AOJu0Yza5yAKA3XaXk+cmG67zIzCKNoFqoqRguo7DOVS1/UPFVoIFHMv
	MTavJbsly3Br/4fNklMbt2AwLBh/omOwXczwIZJ1pSaYhyV17ZYrw8qSGyKkW6pnrRzaRuJ05Bj
	4mA==
X-Google-Smtp-Source: AGHT+IEyqeTMoaShXNRUvtHOhlYNvGlKrvndvLDnIj+Cloeh6LxSFejF5eSTr8OUrR3lJf2+Y5Rv2yfKdg==
X-Received: from pjbei18.prod.google.com ([2002:a17:90a:e552:b0:343:af64:f654])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d54b:b0:2a2:d2e8:9f25
 with SMTP id d9443c01a7336-2a2f28368eamr173738215ad.33.1766565691337; Wed, 24
 Dec 2025 00:41:31 -0800 (PST)
Date: Wed, 24 Dec 2025 16:41:20 +0800
In-Reply-To: <871plslxsw.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <871plslxsw.ffs@tglx>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251224084120.249417-1-wakel@google.com>
Subject: [PATCH] kselftest/harness: Use helper to avoid zero-size memset warning
From: Wake Liu <wakel@google.com>
To: tglx@linutronix.de, kees@kernel.org, shuah@kernel.org, nathan@kernel.org
Cc: luto@amacapital.net, wad@chromium.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

When building kselftests with a toolchain that enables source
fortification (e.g., Android's build environment, which uses
-D_FORTIFY_SOURCE=3), a build failure occurs in tests that use an
empty FIXTURE().

The root cause is that an empty fixture struct results in
`sizeof(self_private)` evaluating to 0. The compiler's fortification
checks then detect the `memset()` call with a compile-time constant size
of 0, issuing a `-Wuser-defined-warnings` which is promoted to an error
by `-Werror`.

An initial attempt to guard the call with `if (sizeof(self_private) > 0)`
was insufficient. The compiler's static analysis is aggressive enough
to flag the `memset(..., 0)` pattern before evaluating the conditional,
thus still triggering the error.

To resolve this robustly, this change introduces a `static inline`
helper function, `__kselftest_memset_safe()`. This function wraps the
size check and the `memset()` call. By replacing the direct `memset()`
in the `__TEST_F_IMPL` macro with a call to this helper, we create an
abstraction boundary. This prevents the compiler's static analyzer from
"seeing" the problematic pattern at the macro expansion site, resolving
the build failure.

Build Context:
Compiler: Android (14488419, +pgo, +bolt, +lto, +mlgo, based on r584948) clang version 22.0.0 (https://android.googlesource.com/toolchain/llvm-project 2d65e4108033380e6fe8e08b1f1826cd2bfb0c99)
Relevant Options: -O2 -Wall -Werror -D_FORTIFY_SOURCE=3 -target i686-linux-android10000

Test: m kselftest_futex_futex_requeue_pi

Change-Id: If4fdfe6ffcbe9736fbd8f66b2453e8cbbb95e25e
Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/kselftest_harness.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 3f66e862e83eb..159cd6729af33 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -70,6 +70,12 @@
 
 #include "kselftest.h"
 
+static inline void __kselftest_memset_safe(void *s, int c, size_t n)
+{
+	if (n > 0)
+		memset(s, c, n);
+}
+
 #define TEST_TIMEOUT_DEFAULT 30
 
 /* Utilities exposed to the test definitions */
@@ -416,7 +422,7 @@
 				self = mmap(NULL, sizeof(*self), PROT_READ | PROT_WRITE, \
 					MAP_SHARED | MAP_ANONYMOUS, -1, 0); \
 			} else { \
-				memset(&self_private, 0, sizeof(self_private)); \
+				__kselftest_memset_safe(&self_private, 0, sizeof(self_private)); \
 				self = &self_private; \
 			} \
 		} \
-- 
2.52.0.351.gbe84eed79e-goog

