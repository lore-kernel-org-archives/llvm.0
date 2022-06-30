Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AC7462
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 19:59:16 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2eb7d137101so2840587b3.12
        for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 12:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=bQE81g2DmbR80VZhT+P0vc15LIodMtph9Q2b9AmTsII=;
        b=eR90cr21CMIzTJFV+sggZ9202FIY3SWnOc51sGGAw3DCFSfXQZHBwHRBWfPMiSA11h
         LcCL9ysenrMzJ3KFahx7K4L1bPkH2ZO300OMvJvSQGOQmx5oz8Y1OFlOL6lUlVMP/OPa
         3son8m5HjnpQntHpajGNczO51xPJaWE1UYl5n2mv0QZ8LKfEfYjqig5HtmIyavx80OIe
         8c+M8wXg2MHwbaBpMEOuGiHlGk+0DPdEeabNg9j6tshUS+V+Hu3UXGkY/6uKIP31XS0o
         owM1PPa/9+tp82p0O12qYjfTfLQcPyqevFfns1deiXWDR/b2Ah3j35PmtbKktzOY9TnI
         jaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=bQE81g2DmbR80VZhT+P0vc15LIodMtph9Q2b9AmTsII=;
        b=1aHeiVFqo/Mr4V8GxD9K8KDnBQpjAwdwG6jNjzVQZ5yA2RhTRG5FoyzinJ7X9HmEnw
         SbnztaLS7zMvfyMgGQU8R9BOc9ZzlTIByYTfKAB+x3xTnBoM/nT/NLqdqiWg8uo9h2oa
         n2dncbYrjQCr5VG5yh5AUhMlFdtCZFAyagWRm7wxrOsuNHMURR4bApEISKpRpkT+sP8c
         JWoXorTSkLvTD3qZ+mUba8RbWOpaeifzudSQ0Yuh4ixCJ+CQfFVS2kMFjwJEjiOFqyj8
         ETSIjQb6sUkrBye+zSc5ggXeODnxQ6cuocTPrgL70JF56a28o+TGq+NVUdLzjTWtjpow
         JrCw==
X-Gm-Message-State: AJIora9W6RalMg5id5cp5V+zYnG9HWyj69yo9e5rZJvwcMWkHfvbiJXp
	6YPEkYK+77AnT4qJGr3pg/2ZZRPRy5Z5UI0mUw==
X-Google-Smtp-Source: AGRyM1sparANkcr0hS7xCyT2s+pmU9FlGK6H0Zbv4B5xz9oF44IokbA8zliI6ZJEN3LaUeYqK1qiHE5Df6Gm0RNlSA==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:c5f5:d5e5:38d2:2025])
 (user=justinstitt job=sendgmr) by 2002:a25:d292:0:b0:66c:8adb:ce55 with SMTP
 id j140-20020a25d292000000b0066c8adbce55mr11608903ybg.131.1656619155389; Thu,
 30 Jun 2022 12:59:15 -0700 (PDT)
Date: Thu, 30 Jun 2022 12:57:38 -0700
In-Reply-To: <20220629235326.480858-1-justinstitt@google.com>
Message-Id: <20220630195738.904505-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220629235326.480858-1-justinstitt@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2] lib/test_printf.c: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

changes from v1:
* moved NOWARN macro definition to a more appropriate location
* using __diag_ignore_all (thanks Nathan)
* using local scoping for code blocks instead of __VA_ARGS__ (thanks Nick)
* indented affected test cases (thanks Andy)

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 lib/test_printf.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 07309c45f327..1b1755ce9fa7 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -30,6 +30,9 @@
 #define PAD_SIZE 16
 #define FILL_CHAR '$'
=20
+#define NOWARN(option, comment, block) \
+		__diag_push() __diag_ignore_all(#option, comment) block __diag_pop()
+
 KSTM_MODULE_GLOBALS();
=20
 static char *test_buffer __initdata;
@@ -154,9 +157,11 @@ test_number(void)
 	test("0x1234abcd  ", "%#-12x", 0x1234abcd);
 	test("  0x1234abcd", "%#12x", 0x1234abcd);
 	test("0|001| 12|+123| 1234|-123|-1234", "%d|%03d|%3d|%+d|% d|%+d|% d", 0,=
 1, 12, 123, 1234, -123, -1234);
-	test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
-	test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
-	test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
+	NOWARN(-Wformat, "Disables clang -Wformat warning", {
+		test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
+		test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
+		test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
+	})
 	/*
 	 * POSIX/C99: =C2=BBThe result of converting zero with an explicit
 	 * precision of zero shall be no characters.=C2=AB Hence the output
--=20
2.37.0.rc0.161.g10f37bed90-goog

