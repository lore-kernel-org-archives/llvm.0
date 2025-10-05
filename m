Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7107D2BE05E
	for <llvm@lists.linux.dev>; Sun,  5 Oct 2025 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759699348; cv=none; b=Qu1b5v2IWrKeVXxmHFszoHsXnzWrLtFbn1xdvrnqJ6rs92u5ZLNAiMkSxs//+OitvZhdJmICOQnOg6Ed5cDQ0yLBisinQOACfRUIJaXfQLTMgVc3XOylEXOAIMCCLlXG/TKXXMjEa2JA9SmeRErcfqDEevRg2j+Zil/yYiIMHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759699348; c=relaxed/simple;
	bh=jjogxjWTo8LEEeITCvVJ5lej7lh2270zJAspkUYjJfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=QiN4kaGSTmYXlkrBT8sz8Y3us5/6xGxYxlUQKMhfprRKIJrcP6RypkuaT1e/r6dcSEZUepYiCOkKXe5Dd86TmeTEKZvH+5EvkOHu98n8xEuNbP62bSgzuwTy60XelxEWcP/9XtAnK6D4f5cc+yxFWf6JXHN9oXH4NtewgMrE7cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4OfTTMdB; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4OfTTMdB"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-267fa90a2fbso56916745ad.1
        for <llvm@lists.linux.dev>; Sun, 05 Oct 2025 14:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759699345; x=1760304145; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zr9vg9+dbl377j7bj7cPlJqbhOg0YG22m54UFPy9WZs=;
        b=4OfTTMdBppzMsFnX/KPBudBAugEhACCpnoWL0HwaiWGojw58cihzOyvYHz3jtsVI3z
         OqV4RkN/AlI2F2b9KX9aOtBxwWAvaHE//9qKAF/ZPXzi3q88DdDwoin5wAvKUimZdgK0
         Ot6o1Xi8QzXCHkWWR2xoCynEBQ2M2kO4id4q/jrEYtVpAChdPjwt32aVA09ADBBgKR5p
         kSQsfNeOELDEe27joE/BX+IO5OCLPWZsRO/hKjrTxA6Ywoa+ehxhFyNslfnv0gwXQzs+
         yviCIZdyyaTC4vKuUUl0Ar9aXHEJzc3pBk/uqOeGKkLGPFWSz/BtItMbx+HpUHnUb75T
         dRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759699345; x=1760304145;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zr9vg9+dbl377j7bj7cPlJqbhOg0YG22m54UFPy9WZs=;
        b=EY0Ie1DEIAbqMCtHzP6ET/kBb+wMGdkjYjPT3mu+HWzQrSi/79DQAsNlqfoHS+Jq6S
         noZ2fGYvnztGzRsU27d3GrMrHo4O3bfBJY/YY0lG0T7VC9E9b+jYUw1KUJIhaftYw1dq
         nJXGPuE7+ubI5/u9BdprqZ7GyE8SR6gPKc0j6/JvKLk6AEjA7q+gAv8zu7Se6xtf+2F/
         HKVkSeBmnLWlfa/GCzVg1//mXW3znDsyvlxqJx3rGFymgflQzLYcvUAjJ2XjCFLdUxyT
         7SgT4h8ZYsbIBbjb49dfulQ7cJWVN/EjHawg/0Z/Yg1imvfgAmnYUWXxhgJjEofmUvz7
         ZAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx5FfnogSjePjTJlR98DyIxswLtITWNQt+YQksVu5ke0UvXtUtvLgggUfPrrIcdILan327@lists.linux.dev
X-Gm-Message-State: AOJu0Yywwf23WlYW9K60bTrkqz54AJ9SmGuRANVnV2xe1Sh21IIMyINm
	AwWdMUidg60kDndSTSmLyfVmusN1sAKJMJFzs9FNlelQWIkfegi1P8ARxqxepOI+sfXAxL8+33E
	ucowQmXVutw==
X-Google-Smtp-Source: AGHT+IFEaM+mFQzGCobgqNknXJ7y1TlfovFXjd/cXa5mwCMiuAzlKf2cDvpg0Dz2Z/gtCSnKr3ofcMi/Sj1q
X-Received: from pjbqo8.prod.google.com ([2002:a17:90b:3dc8:b0:32e:e06a:4668])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c0e:b0:27e:f03e:c6b7
 with SMTP id d9443c01a7336-28e8d038b9cmr181830185ad.10.1759699344812; Sun, 05
 Oct 2025 14:22:24 -0700 (PDT)
Date: Sun,  5 Oct 2025 14:22:03 -0700
In-Reply-To: <20251005212212.2892175-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251005212212.2892175-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251005212212.2892175-3-irogers@google.com>
Subject: [PATCH v7 02/11] perf llvm: Reduce LLVM initialization
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Collin Funk <collin.funk1@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Move the 3 LLVM initialization routines to be called in a single
init_llvm function that has its own bool to avoid repeated
initialization. Reduce the scope of triplet and avoid copying strings
for x86.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/llvm.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index ddc737194692..2356778955fe 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -74,6 +74,17 @@ void dso__free_a2l_llvm(struct dso *dso __maybe_unused)
 	/* Nothing to free. */
 }
 
+static void init_llvm(void)
+{
+	static bool init;
+
+	if (!init) {
+		LLVMInitializeAllTargetInfos();
+		LLVMInitializeAllTargetMCs();
+		LLVMInitializeAllDisassemblers();
+		init = true;
+	}
+}
 
 #if defined(HAVE_LIBLLVM_SUPPORT)
 struct find_file_offset_data {
@@ -184,7 +195,6 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	u64 len;
 	u64 pc;
 	bool is_64bit;
-	char triplet[64];
 	char disasm_buf[2048];
 	size_t disasm_len;
 	struct disasm_line *dl;
@@ -197,26 +207,25 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	if (args->options->objdump_path)
 		return -1;
 
-	LLVMInitializeAllTargetInfos();
-	LLVMInitializeAllTargetMCs();
-	LLVMInitializeAllDisassemblers();
-
 	buf = read_symbol(filename, map, sym, &len, &is_64bit);
 	if (buf == NULL)
 		return -1;
 
+	init_llvm();
 	if (arch__is(args->arch, "x86")) {
-		if (is_64bit)
-			scnprintf(triplet, sizeof(triplet), "x86_64-pc-linux");
-		else
-			scnprintf(triplet, sizeof(triplet), "i686-pc-linux");
+		const char *triplet = is_64bit ? "x86_64-pc-linux" : "i686-pc-linux";
+
+		disasm = LLVMCreateDisasm(triplet, &storage, /*tag_type=*/0,
+					  /*get_op_info=*/NULL, symbol_lookup_callback);
 	} else {
+		char triplet[64];
+
 		scnprintf(triplet, sizeof(triplet), "%s-linux-gnu",
 			  args->arch->name);
+		disasm = LLVMCreateDisasm(triplet, &storage, /*tag_type=*/0,
+					  /*get_op_info=*/NULL, symbol_lookup_callback);
 	}
 
-	disasm = LLVMCreateDisasm(triplet, &storage, 0, NULL,
-				  symbol_lookup_callback);
 	if (disasm == NULL)
 		goto err;
 
-- 
2.51.0.618.g983fd99d29-goog

