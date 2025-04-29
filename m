Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0FA254AE2
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953154; cv=none; b=izNKBq8zT649p2mSPRp0PX/AiFExMd50365dFFzEZrEzNki2VWCgLItjB4OMXfArqwxdi3zkHEmstSFHcTk9W21+dYSTot0L73kSgRiRu5nm7Ga6xIQwrCPxmL2usCffO9kVpgjMEv3hAEADUD/cgYC9u9cvDe6ZHK7R1O+PXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953154; c=relaxed/simple;
	bh=kgvUqUs9tDT7/Goccc5s/AHR9V2GVcDy1e7HZmcr48o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=UbAaUDyRdND3qgGy5dR2jwmFB7UXVC9Zj0Q+lW8gfDq4Mk/x1ueO1mwHvanwxyxKuwauk1CGajil/KMk/qP2xyLc3bYpxsOo2Lw9yYPr4m1PgJgrRc4AahNmXOvql1VeXpOP+O4EI8+b/IikpZYPjr7vffhlUzj/9zMn3yt4Dc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OP9zdtK1; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OP9zdtK1"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2265a09dbfcso91381485ad.0
        for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 11:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953152; x=1746557952; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5STVKEj33U6deIy1RNvJ4OCh/5ONE1eRUPfMHrQT+s=;
        b=OP9zdtK1zi8SJ42zoBT3uwWND+qJ4VLQuddWYMxii7yxIpk3y4+aHP2JDYhDAWFRfJ
         /erGIoyc4V/NJBfgna4jUBnq9SGC7+0+a3OWTKTfr5glH64IBvH08NzgD24SP4VspUrA
         +VzbrU1L26NWGJMY0a/wdmw5LgWYS5r6H9X9L7D7LlI/nYfrNgdWWVBZyxe2vrclnpnV
         JMYY7F+Laq+4qeh8Fobm3kOIrZtZmnE5zmLaqhN4f1QCzcZ1m+LFClRENd1a14nH4mun
         xq56C09K9S6sk+EiRiaBozYHww930tcrgTeDHlItHc1rBe2MbwRFLkvEunt4VGoZLU+i
         D83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953152; x=1746557952;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5STVKEj33U6deIy1RNvJ4OCh/5ONE1eRUPfMHrQT+s=;
        b=R3AvX+QBM0D/2ZVmW20zsvCsiNJrBXKGIW1Yvo8/W2kG5hXEDubwaQ5/XOmNrw+XRn
         oKSYlZv/vM/LtDYAvx6Twa9ZzQbEL0FCS1ABlytXzSsKyw6HBmRwRj7UXxmQKK2uq4mh
         OQhgJuo07BXATueg4l/KpEYHDG0RkttoAIbs/PrCnDWb0on9wyXZyENy8z3b9iTTiAci
         0+ZILYlciRkBaZ+btXbcDuFlfxxeuyhZeh/FltmnrjWPoMJCdXnIiUwfv2jr6lMEsbUx
         hldkBMUf0g4M463fv/f+Uijitru3hZL1nHx/IreTANzy6V63HohQ9p7mps9EhBPAAcIz
         1GLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+zdzGXugdSOHZfxNo2/9Pl2sbT26GKhck96YBYxQtgYvYFcWLkh+jhqXh8562XxMeQCRx@lists.linux.dev
X-Gm-Message-State: AOJu0YyRG3LM28t9Y184u2t3sm+b8Y0WueRl8ZrK40PBgXkdrXDZ5ki8
	JYAMSZ3q4qIKaGDN4Eeh5tUK0+hBXF86ZiAdhMKZkdF2UrVmGZxu5rVWjp/38O9yCDJAaqrsXC0
	4ia55mg==
X-Google-Smtp-Source: AGHT+IFpHl+y/PWwofCL1rMjzchgL79tywxXMez3bw84m9Mggck93/1v/VhSL3Q9Sj/smnNUiXwQMW8zWVGI
X-Received: from pgbcq11.prod.google.com ([2002:a05:6a02:408b:b0:b1b:caa8:2ec9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d486:b0:223:5c33:56b4
 with SMTP id d9443c01a7336-22df34d85d3mr5723445ad.20.1745953152321; Tue, 29
 Apr 2025 11:59:12 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:58:34 -0700
In-Reply-To: <20250429185839.1807005-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429185839.1807005-3-irogers@google.com>
Subject: [PATCH v1 2/6] perf symbol-elf: Integrate rust-v0 demangling
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
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
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"

Use the demangle-rust-v0 APIs to see if symbol is Rust mangled and
demangle if so. The API requires a pre-allocated output buffer, some
estimation and retrying are added for this.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build        |  5 +++-
 tools/perf/util/symbol-elf.c | 47 ++++++++++++++++++++++++++----------
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 4f7f072fa222..7910d908c814 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -241,9 +241,12 @@ perf-util-y += cap.o
 perf-util-$(CONFIG_CXX_DEMANGLE) += demangle-cxx.o
 perf-util-y += demangle-ocaml.o
 perf-util-y += demangle-java.o
-perf-util-y += demangle-rust.o
+perf-util-y += demangle-rust-v0.o
 perf-util-$(CONFIG_LIBLLVM) += llvm-c-helpers.o
 
+CFLAGS_demangle-rust-v0.o += -Wno-shadow -Wno-declaration-after-statement \
+    -Wno-switch-default -Wno-switch-enum -Wno-missing-field-initializers
+
 ifdef CONFIG_JITDUMP
 perf-util-$(CONFIG_LIBELF) += jitdump.o
 perf-util-$(CONFIG_LIBELF) += genelf.o
diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index fbf6d0f73af9..f953868521f2 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -16,13 +16,14 @@
 #include "demangle-cxx.h"
 #include "demangle-ocaml.h"
 #include "demangle-java.h"
-#include "demangle-rust.h"
+#include "demangle-rust-v0.h"
 #include "machine.h"
 #include "vdso.h"
 #include "debug.h"
 #include "util/copyfile.h"
 #include <linux/ctype.h>
 #include <linux/kernel.h>
+#include <linux/log2.h>
 #include <linux/zalloc.h>
 #include <linux/string.h>
 #include <symbol/kallsyms.h>
@@ -308,6 +309,9 @@ char *cxx_demangle_sym(const char *str __maybe_unused, bool params __maybe_unuse
 
 static char *demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 {
+	struct demangle rust_demangle = {
+		.style = DemangleStyleUnknown,
+	};
 	char *demangled = NULL;
 
 	/*
@@ -318,21 +322,38 @@ static char *demangle_sym(struct dso *dso, int kmodule, const char *elf_name)
 	if (!want_demangle(dso__kernel(dso) || kmodule))
 		return demangled;
 
-	demangled = cxx_demangle_sym(elf_name, verbose > 0, verbose > 0);
-	if (demangled == NULL) {
-		demangled = ocaml_demangle_sym(elf_name);
-		if (demangled == NULL) {
-			demangled = java_demangle_sym(elf_name, JAVA_DEMANGLE_NORET);
+	rust_demangle_demangle(elf_name, &rust_demangle);
+	if (rust_demangle_is_known(&rust_demangle)) {
+		/* A rust mangled name. */
+		if (rust_demangle.mangled_len == 0)
+			return demangled;
+
+		for (size_t buf_len = roundup_pow_of_two(rust_demangle.mangled_len * 2);
+		     buf_len < 1024 * 1024; buf_len += 32) {
+			char *tmp = realloc(demangled, buf_len);
+
+			if (!tmp) {
+				/* Failure to grow output buffer, return what is there. */
+				return demangled;
+			}
+			demangled = tmp;
+			if (rust_demangle_display_demangle(&rust_demangle, demangled, buf_len,
+							   /*alternate=*/false) == OverflowOk)
+				return demangled;
 		}
+		/* Buffer exceeded sensible bounds, return what is there. */
+		return demangled;
 	}
-	else if (rust_is_mangled(demangled))
-		/*
-		    * Input to Rust demangling is the BFD-demangled
-		    * name which it Rust-demangles in place.
-		    */
-		rust_demangle_sym(demangled);
 
-	return demangled;
+	demangled = cxx_demangle_sym(elf_name, verbose > 0, verbose > 0);
+	if (demangled)
+		return demangled;
+
+	demangled = ocaml_demangle_sym(elf_name);
+	if (demangled)
+		return demangled;
+
+	return java_demangle_sym(elf_name, JAVA_DEMANGLE_NORET);
 }
 
 struct rel_info {
-- 
2.49.0.901.g37484f566f-goog

