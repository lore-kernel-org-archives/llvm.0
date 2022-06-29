Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0246B7
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 23:53:30 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-317ae1236feso139071497b3.11
        for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 16:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=llXuyNhJykSJbHbFnRDw6ADI1vuxiMD+NL8Dv2XcxEQ=;
        b=hVwUXMT23sRVAQFeU7pFCoJCiaNh8pFu3fe/3hHmSi8cnER94vU9HJfRVstiZ1g3nN
         SOfDfEC3e9pOiA3yElrBfjePjG9llNiQa2qNX87FV986bWmMEiJ3yayYxluTyNZBhXaV
         4xYpnMLdiYvd+PsukpRHw8m3F9dpuPb6fCoRUkQQo97DPxPoHQmFagGpyXcvDilppTOV
         bkHrOkA/igy0XFZfJoD3/tC1F+SxuDpj13RomsrRNlthOfa59QWNc2RmscwikCMqJQeS
         m2yRdGda9b6AaZx9vi+Ue+A6fbik5vmCz2a8a9tOEqcBhmI1IcwJ3aYXmVQU5qCZspwB
         SdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=llXuyNhJykSJbHbFnRDw6ADI1vuxiMD+NL8Dv2XcxEQ=;
        b=hcYr6Oe4L5IFvo1kK/KkMpmkq0L1ts4kj6OumfHE4QojNBseUrLgRMRX6aMnKM734t
         P/5n2t79uuXDMYJSYgaRrKOuvP9uCf91rJoYtxA7XqtGZ3sQaUtB5cr087fQMnuGPdb6
         GD9Xh/c6TAgLAz7b0bptnYFQTZrED61xHaEAb38u82OS9CKHEbtAd4nCQtAcnDof2caK
         CeJF5mJxY4yMUrcppxZWGUHUxuEOwRk97DR/95ziryFn9CSjfgK2DG53fZh8CTPMNkwG
         XjJ1GPhjbgC5nsWr89o3SJ6NzhUDoZ0IPM3fojN8kQ0/hz67H4Lke8+Xuon9ov5+tqB2
         V7cA==
X-Gm-Message-State: AJIora9BP29howg1UgQUxhbYXwP4K+febULy+EwdfL7IzRVtYHTDHA/k
	RIEqZh41blShwG1o2JR7ustTAzAFgor1oBDWmg==
X-Google-Smtp-Source: AGRyM1t+hgQC1pdkImMO0MaFYcn85xv12NlLY2MgfM8wNk6uFIAh6p1cDvz5Uh5VPrwvuV1TrUvXNtQy6hVh4S7Evw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:c5f5:d5e5:38d2:2025])
 (user=justinstitt job=sendgmr) by 2002:a25:4b84:0:b0:66c:43ca:74bb with SMTP
 id y126-20020a254b84000000b0066c43ca74bbmr6251106yba.80.1656546809764; Wed,
 29 Jun 2022 16:53:29 -0700 (PDT)
Date: Wed, 29 Jun 2022 16:53:26 -0700
Message-Id: <20220629235326.480858-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] lib/test_printf.c: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

see warnings:
| lib/test_printf.c:157:52: error: format specifies type 'unsigned char'
| but the argument has type 'int' [-Werror,-Wformat] test("0|1|1|128|255",
| "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
-
| lib/test_printf.c:158:55: error: format specifies type 'char' but the
| argument has type 'int' [-Werror,-Wformat] test("0|1|1|-128|-1",
| "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
-
| lib/test_printf.c:159:41: error: format specifies type 'unsigned short'
| but the argument has type 'int' [-Werror,-Wformat]
| test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);

There's an ongoing movement to eventually enable the -Wformat flag for
clang. Previous patches have targeted incorrect usage of
format specifiers. In this case, however, the "incorrect" format
specifiers are intrinsically part of the test cases. Hence, fixing them
would be misaligned with their intended purpose. My proposed fix is to
simply disable the warnings so that one day a clean build of the kernel
with clang (and -Wformat enabled) would be possible. It would also keep
us in the green for alot of the CI bots.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 lib/test_printf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 07309c45f327..748591a0c55c 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -4,6 +4,12 @@
  */
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define DO_PRAGMA(x) _Pragma(#x)
+#define NOWARN(warnoption, ...)
+	    DO_PRAGMA(GCC diagnostic push)
+		    DO_PRAGMA(GCC diagnostic ignored #warnoption)
+			    __VA_ARGS__
+				    DO_PRAGMA(GCC diagnostic pop)
=20
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -154,9 +160,13 @@ test_number(void)
 	test("0x1234abcd  ", "%#-12x", 0x1234abcd);
 	test("  0x1234abcd", "%#12x", 0x1234abcd);
 	test("0|001| 12|+123| 1234|-123|-1234", "%d|%03d|%3d|%+d|% d|%+d|% d", 0,=
 1, 12, 123, 1234, -123, -1234);
+	/* disable -Wformat for this chunk */
+	NOWARN(-Wformat,=20
 	test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
 	test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
 	test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
+	)
+	/* end chunk */
 	/*
 	 * POSIX/C99: =C2=BBThe result of converting zero with an explicit
 	 * precision of zero shall be no characters.=C2=AB Hence the output
--=20
2.37.0.rc0.161.g10f37bed90-goog

