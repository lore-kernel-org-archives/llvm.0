Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B23E33CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 17:29:54 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2dc7bdd666fso97001577b3.7
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=suawiw5DlcXpf7bbkJ8PQQ5vzk0PkV6q8VurOqdiYMY=;
        b=n1z3j0VmLBxQGOrbPRlK8tZbvAdrIiSz2bQYgkNeq91d456+eDiYc/5GFZensGwLHS
         7JhkuGT1gsar3PIyhhKnulRBxVqnhND67ffrLp/URcjl17F0XFm2d4ye1Qxk32w9T7mI
         cy5H+ZQZJcU6281/3wjSw6u5KrEv5vtBlH331AMPeXiLa9lmTvS4JfE73jJTvQ2le99k
         SH32N15YXJcZp0JXFvFRp8Watj160JjzozaI1GpSWp4VCYTkKkCU015f3TaHU3gdFqtD
         rfXQWyWpzOTiJIxyFl5HS0oOoZsoUbgBvo9mBDgWh28SOwaxjvBu8FhXbkY58Q/bLMIU
         6e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=suawiw5DlcXpf7bbkJ8PQQ5vzk0PkV6q8VurOqdiYMY=;
        b=MXgiuQWu57Uh1+AG3Md5ZSFvKSIgc5TgWRx5gIdjALkJNYEnOvDXSn/RRx28QodPqi
         3cMTSnlg9Wt7k0pDssGCquzz24hVzucoPcwuXHPsevJ/IBXk+FAEFChXaxd9QdhxKSFC
         Vz5KnWIoatfFgf6UO5pFpYT3PtC05f31aBdbdXVgvv3kr7MoxFADt3LfAogW0d0bZhcT
         zNNHIPdZyTIML8lNBFEVM4kKZvx1BjUBA0BWfIqIAxL1NAAkoD8nu4V/RTrCzARdOK9g
         kHVbcicwtYg4xDFO0dZYaIVEv82QFNA1JVT1pKkTu/ozC6Yn6hqmmSLAy0j/DxcH6lFn
         /wEw==
X-Gm-Message-State: AJIora/LjRoSxhFHbeCGb3RRTPTrzjPeWlK8CJx0N6TR2kNY/GyzuwL/
	JKw1PWsfJ6qNH2Lg0Li1C2dQ/+cJFYxvmPlZGw==
X-Google-Smtp-Source: AGRyM1vmgl2/mU40hrNgPwoKkTbeprZfiqtsuMWXyJISc3ZqdWtZfqYZaWX9OnKCAm5p/wIsJcS05lXFKYZpdBvngw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f922:7e91:d8e8:24c4])
 (user=justinstitt job=sendgmr) by 2002:a25:880b:0:b0:66e:3d9e:7dfd with SMTP
 id c11-20020a25880b000000b0066e3d9e7dfdmr25745809ybl.600.1658165393981; Mon,
 18 Jul 2022 10:29:53 -0700 (PDT)
Date: Mon, 18 Jul 2022 10:29:34 -0700
In-Reply-To: <20220629235326.480858-1-justinstitt@google.com>
Message-Id: <20220718172934.4155189-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220629235326.480858-1-justinstitt@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v3] lib/test_printf.c: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: justinstitt@google.com
Cc: andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	pmladek@suse.com, rostedt@goodmis.org, senozhatsky@chromium.org, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

see warnings:
| lib/test_printf.c:157:52: error: format specifies type 'unsigned char'
| but the argument has type 'int' [-Werror,-Wformat]
test("0|1|1|128|255",
| "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
-
| lib/test_printf.c:158:55: error: format specifies type 'char' but the
| argument has type 'int' [-Werror,-Wformat] test("0|1|1|-128|-1",
| "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
-
| lib/test_printf.c:159:41: error: format specifies type 'unsigned
short'
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

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
changes from v1 -> v2:
* moved NOWARN macro definition to a more appropriate location
* using __diag_ignore_all (thanks Nathan)
* using local scoping for code blocks instead of __VA_ARGS__ (thanks Nick)
* indented affected test cases (thanks Andy)

changes from v2 -> v3:
* reinserted commit message
* remove Andy's Suggested-by tag
* add issue tracker link

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

