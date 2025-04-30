Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F062DC794
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 00:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973711; cv=none; b=fgRib5hChWCnhx7YSn/+xxdUdi66/uqnNQyInaIaSFPyWXBFLtjQFy/FiSelbdbKHNxdejjqnlMF71hIviu/HNpYThA/Bz70WBs3R8pFp/HajMFxvg1rPSV0sI7ZSxkTcWP2Jo++j7NPAM6oOz6tUMdTJaDIVXvLYcGEZefbT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973711; c=relaxed/simple;
	bh=YsSJK+JBgrMChothMITffQgSKnUI35D9iUSvUi32+oo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o6vug3AfG8JKNUwEE2czgG00eEhZmcIDVapTNnNKnZD+Ta1a9AF9bY6hUcwNR5fMSPfB6TejQVR+KFXMztw1zPJQo7fpBnD77vz4ESMzWnX2HgVI+ZWbmmvZoEsnVixdxF1Ic669ecAWQlhIsKKsco8O1qooaSDtGn+ADD2Ffzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZG1b7US; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZG1b7US"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736cd27d51fso5045449b3a.2
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745973708; x=1746578508; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cYhstsrbro2bvVLigEn3Nm+qEHX+oY+qpb1akXLGPE=;
        b=LZG1b7USu3aqPOqCS/gzci2nMUFbt89wGoZLp1kjYM1AO6f0wNH+wGFzmuyyJYWEya
         QFkaIJHN+drXgJOffkcXuAVQej6PV+AxhrGtGHOB2Pv7iIjICNfEjo54HEnrATGdM002
         zitvxzEkM1O2nZmVLbsVz4EZvQhr8yJXB5SEukX3OIl0vfxOpYEFZGUb2eiibDRZQhqw
         zTLoWjL/6Wl1ySNIjrg2pGSrEjZJJofgKFEmQ812OdLRVZ0CsTuV6mPZOHgEBdrCIFbx
         l9RLC7F95ru3CQpkR2CN22nTg9uf2UHN3plxTaQ/uAD9ctW2LEr/Z+5Sob3YJjvnZby0
         wNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745973708; x=1746578508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cYhstsrbro2bvVLigEn3Nm+qEHX+oY+qpb1akXLGPE=;
        b=Q74pHe4HWBK/qtSE7cFKFJ1eT0IM52YutluhoKLQaVhbspTrP01K1pkpD3m67aVp0b
         CTnI5Q6zFqYrKC+blN3ibu8IRrNoA3ScdjsRWj2H+TZd1YTN+CM2La3YIKlPICHAo0zN
         8LI5PRqao7bdjso+1a7OuPoYzKU0kd7WoYHHCwK2E9tqaklLTW26q0ezkPpp2LzVS/ls
         w4N+XPSMfdZZGf2kGacNW91l2MjxOVYtIFxumCeaTOfynB2NOPzc8zqtlkjjKrcjRQ3v
         F0Y9b89DdCn54pjHXy/NC/0FqmPArr62ZJ2Ep9qGfwKBX8iRPyy8oNiZM3XSJKz6r8iU
         NtfA==
X-Forwarded-Encrypted: i=1; AJvYcCWqjOBfy6UXMTisanOWw5Ec8rLxlaAOUxiI50h240lVnGHbRJcj/sn3wdbeDNRM2jmQh9V0@lists.linux.dev
X-Gm-Message-State: AOJu0YyzsW8prTO4MF1zqKNCV7nOB4Rqsy4d9WAPpbwCakb74Ru2tN29
	u1DL1qB6mUqK4erKcU7QMqBTNf5tc3HVwf+5JRZtHUYGzc1MENb5xEyENyD3qOohWXyoK80AMnS
	XjBRsAA==
X-Google-Smtp-Source: AGHT+IEJsy1CiwSbTZ772fe8tVZ0+2GytQHzJ43kqO3OP7rBH78lCFDM5KKDrcvzIsMB/uaQe+1R5/yWGIpM
X-Received: from pfbhw20.prod.google.com ([2002:a05:6a00:8914:b0:736:a70b:53c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b46:b0:736:6151:c6ca
 with SMTP id d2e1a72fcca58-74038939bc9mr1750119b3a.4.1745973708332; Tue, 29
 Apr 2025 17:41:48 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:41:27 -0700
In-Reply-To: <20250430004128.474388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430004128.474388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250430004128.474388-6-irogers@google.com>
Subject: [PATCH v2 5/6] perf test demangle-java: Switch to using dso__demangle_sym
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Daniel Xu <dxu@dxuuu.xyz>, Ariel Ben-Yehuda <ariel.byd@gmail.com>
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The use of the demangle-java APIs means we don't detect if a different
demangler is used before the Java one for the case that matters to
perf. Remove the return types from the demangled names as
dso__demangle_sym removes those.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/demangle-java-test.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/perf/tests/demangle-java-test.c b/tools/perf/tests/demangle-java-test.c
index 93c94408bdc8..ebaf60cdfa99 100644
--- a/tools/perf/tests/demangle-java-test.c
+++ b/tools/perf/tests/demangle-java-test.c
@@ -3,10 +3,9 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <linux/kernel.h>
-#include "tests.h"
-#include "session.h"
 #include "debug.h"
-#include "demangle-java.h"
+#include "symbol.h"
+#include "tests.h"
 
 static int test__demangle_java(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
 {
@@ -18,19 +17,19 @@ static int test__demangle_java(struct test_suite *test __maybe_unused, int subte
 		const char *mangled, *demangled;
 	} test_cases[] = {
 		{ "Ljava/lang/StringLatin1;equals([B[B)Z",
-		  "boolean java.lang.StringLatin1.equals(byte[], byte[])" },
+		  "java.lang.StringLatin1.equals(byte[], byte[])" },
 		{ "Ljava/util/zip/ZipUtils;CENSIZ([BI)J",
-		  "long java.util.zip.ZipUtils.CENSIZ(byte[], int)" },
+		  "java.util.zip.ZipUtils.CENSIZ(byte[], int)" },
 		{ "Ljava/util/regex/Pattern$BmpCharProperty;match(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Z",
-		  "boolean java.util.regex.Pattern$BmpCharProperty.match(java.util.regex.Matcher, int, java.lang.CharSequence)" },
+		  "java.util.regex.Pattern$BmpCharProperty.match(java.util.regex.Matcher, int, java.lang.CharSequence)" },
 		{ "Ljava/lang/AbstractStringBuilder;appendChars(Ljava/lang/String;II)V",
-		  "void java.lang.AbstractStringBuilder.appendChars(java.lang.String, int, int)" },
+		  "java.lang.AbstractStringBuilder.appendChars(java.lang.String, int, int)" },
 		{ "Ljava/lang/Object;<init>()V",
-		  "void java.lang.Object<init>()" },
+		  "java.lang.Object<init>()" },
 	};
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
-		buf = java_demangle_sym(test_cases[i].mangled, 0);
+		buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, test_cases[i].mangled);
 		if (strcmp(buf, test_cases[i].demangled)) {
 			pr_debug("FAILED: %s: %s != %s\n", test_cases[i].mangled,
 				 buf, test_cases[i].demangled);
-- 
2.49.0.901.g37484f566f-goog

