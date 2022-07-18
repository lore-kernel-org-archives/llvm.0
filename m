Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B346BB
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 23:06:35 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id x71-20020a63314a000000b00419699fc9afso6196112pgx.1
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=kr+g0QLyfEsKisyWseSQidWHG7rTs+Z9BjnCTx3ihTc=;
        b=UALDjrOGFK63RNNlZA9jDLc+QBDSAH1EdrvRdsbNPiAxlbTp5/vXOzhCE0JdyzjItg
         6Guq1N/aGwWPV+Lqa8Faop3fIKcrvQylt/GMLCPQ/7GSHA3Tai77w4t5p8omE3dh63a5
         ZvP0h4vC2B2xEwEhysFiZd9ED6dCdIoGNVpxRoS1WZABUjlOKu8WUPczczpe+tVS9M9d
         9zBPC7I6ns7Gu48exyHoPaD1dh3sfob4A9ZMTpZE68k0cJwNgu19cJXyd/sqjPn89v5W
         jR7kBLNsJg8SR0yswTuj0tmeMqIjb3s9rkr8/+e/IITIMXsDBURqpQP2W0buSK4lgJgt
         MgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=kr+g0QLyfEsKisyWseSQidWHG7rTs+Z9BjnCTx3ihTc=;
        b=auTOaZ3qmMUCEXJjrKgjWr04htW46FolsvkYQnfLI41IYfiUQUVs7kv9qmTnHJwiPU
         PlrdsaqrDOoLB7K0OB/zC30fgPtgvf7N5TDBiJxhog/4yJe10aYknv6ZDRPENMAmC56y
         oyhdL/vM7w3EoAZnNnR4awakSLS3Cua9QnmWJwTsPXwYsI2juXpjrAf/5TDAGx8WoF82
         +ubOf518BnH/Lp8f27yCJ3Kn0pgatXYlg/gj5wJ4uaBIYXkFDjVH4qJqrjfyFO7NiAHN
         FLLYmzviwJ79BeWrCdt5n/dWRbtb3VMS65P9tYfV2rd1bjHxt2Lf7/TAJbrTAAUwMueM
         ecVA==
X-Gm-Message-State: AJIora/9PwvvSofE9OJ162cl2LwzRcwDM1mu3fkCvA21/Zg4EFquJkdq
	XDPJTm7AF/zLThABFGlw85KiIyTHehb64Tr+vg==
X-Google-Smtp-Source: AGRyM1vtVDLoN7bIQSM386zKqi30WcOFVcP2gi6jg06lTY3MCLjhqHNIUvyaeunHATC+f0/1R+GPQ6p77PqvVtOUDA==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:f922:7e91:d8e8:24c4])
 (user=justinstitt job=sendgmr) by 2002:a17:903:3093:b0:16b:deea:4d36 with
 SMTP id u19-20020a170903309300b0016bdeea4d36mr30327719plc.126.1658185595359;
 Mon, 18 Jul 2022 16:06:35 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:06:26 -0700
In-Reply-To: <CAKwvOdnN67xFL22oWfqrKjvES4vjSB3KNhm401LtoC7igO+4Vg@mail.gmail.com>
Message-Id: <20220718230626.1029318-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAKwvOdnN67xFL22oWfqrKjvES4vjSB3KNhm401LtoC7igO+4Vg@mail.gmail.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v4] lib/test_printf.c: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: ndesaulniers@google.com
Cc: andriy.shevchenko@linux.intel.com, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
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
* using local scoping for code blocks instead of __VA_ARGS__ (thanks
* Nick)
* indented affected test cases (thanks Andy)

changes from v2 -> v3:
* reinserted commit message
* remove Andy's Suggested-by tag
* add issue tracker link

changes from v3 -> v4:
* better macro indentation and usage string (thanks Nick)

 lib/test_printf.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 07309c45f327..f78044c1efaa 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -30,6 +30,12 @@
 #define PAD_SIZE 16
 #define FILL_CHAR '$'
=20
+#define NOWARN(option, comment, block) \
+	__diag_push(); \
+	__diag_ignore_all(#option, comment); \
+	block \
+	__diag_pop();
+
 KSTM_MODULE_GLOBALS();
=20
 static char *test_buffer __initdata;
@@ -154,9 +160,11 @@ test_number(void)
 	test("0x1234abcd  ", "%#-12x", 0x1234abcd);
 	test("  0x1234abcd", "%#12x", 0x1234abcd);
 	test("0|001| 12|+123| 1234|-123|-1234", "%d|%03d|%3d|%+d|% d|%+d|% d", 0,=
 1, 12, 123, 1234, -123, -1234);
-	test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
-	test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
-	test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
+	NOWARN(-Wformat, "Intentionally test narrowing conversion specifiers.", {
+		test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
+		test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
+		test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
+	})
 	/*
 	 * POSIX/C99: =C2=BBThe result of converting zero with an explicit
 	 * precision of zero shall be no characters.=C2=AB Hence the output
--=20
2.37.0.170.g444d1eabd0-goog

