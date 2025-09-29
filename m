Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8E2280023
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759172954; cv=none; b=t9CPnPMbTkEVHYOVSxL7df3TGAKYskoIpihQ3zUoMmvZFI9DhIzugYDwJdzqKEV3CiRkd8Vjfi3NRzyUCL0wm/EjIZ6rOAJBpEkRU/7MdifXZCs7SREcNg+NLRe56f+cA/iTlChVhNmgZyOVnhl4NQWqi1iJ7Zw/4HvxiNGVHFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759172954; c=relaxed/simple;
	bh=PDbyASb6oi0nl45LtWvyo0kRcHkCyKYVr1dxxwhi2G4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ZyUxyNinfyx8ks0KqepTmkiDZx62hXri7+lAO/e7ttuYGDIDVRhnn3TSyCmcmvcUAsYbktr5tdRM/IfNtvZA9hbktaBD2ynQsOCdzjdxsXEop61kevDZPH/BaqFUU+8a8qagjm051RG4Ofp6WwBHdY68j7zprYaF1vJ1F1iCAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3qhrgaPx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3qhrgaPx"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3305c08d975so5242577a91.3
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759172952; x=1759777752; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLBs8A19UY4qrfPktznrRiT2oVtJL0cBY+Wi6IC10nw=;
        b=3qhrgaPxAoHZpsyC4AF9K6X0ZW8fnl8j2kjCSW3GIeLgbugTJj+XS4Mrupa5eWjpck
         k+lYS0gZ1lkASEfKkl8gLaHW5SKdut5Ur6TZPuPUvdiIqKdDec12gd+slooXM7maWVRD
         wAcE7X17ACZXt2N6z16euNTLjRpHhespHV/YUfzaInJxk1a7Ucn8nmUxseHSk9Wb2wdm
         8cE1oGoF8YHxrvJxtTZp+OgvAu178T35oUi6sZlUsTG0gTLXObuNW7B6S3U9uTgpOfUP
         FC5c8+Y7SXryGlpXxzVd9QErD8eDcFoUy2Aq5RwDW3LyQVGxExscEwk0FBmP5DpwP7QX
         VeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172952; x=1759777752;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLBs8A19UY4qrfPktznrRiT2oVtJL0cBY+Wi6IC10nw=;
        b=GX880SBb+2toLeM+uE6fNRuhtNEpNS/amP2nqM19PXd17adywiUVX4PkchR4Cp5x+E
         LX+Z3MxYZlNLXkhOtuObkW2Ii8V3CX3wmLsCzGATQ7cp14eRD7vZkV25mMeae4suH8MH
         50zqrXflW4mEWJTlEt6Tt7+RzwAU6WiMGXZhjPji5vEt5r10FxX+Y358td3436KwvnuN
         GSduVbLnyCOUNgyHTJ0aQ27VwT4MwA468AURUkc+I8sKNtZ19isZeGb7fxZHIrU1y6m+
         CuwBjLb3f91pnyQUxs+4M001pecIPokTMehrg77HkB62AIiEIG3v64rPXniNqhYFd0uM
         8dkA==
X-Forwarded-Encrypted: i=1; AJvYcCX5sG7I3Bk8SeL6hN2BZVobqOBzb3DHnDN+xC53GfmKymNHfsZ2voVtkaXGS0ccQ9Cag0+A@lists.linux.dev
X-Gm-Message-State: AOJu0YwIgcHtB69am7Y/Etw0KJVgHaWfvXzASvVCaIXPumGPDxJ4nTb+
	LXhQeEhpmoie1VofgUZdHnyFOL+Km52yo/iJFXZGDKzaYok3LjBmFD0xxzN1FiDNgtTNWIzOe0C
	ouGWFKoMnPA==
X-Google-Smtp-Source: AGHT+IEAC9a1XEUOGGyjwkk2VhXg5eHtNB/otbVrKPS7fT7pgJKU6BcOUwXrzCMoVf6kg30mhKL3QelUZQIH
X-Received: from pjbsf12.prod.google.com ([2002:a17:90b:51cc:b0:334:1935:56cc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8c:b0:330:797a:f4ea
 with SMTP id 98e67ed59e1d1-3342a2e73d7mr21521918a91.29.1759172952591; Mon, 29
 Sep 2025 12:09:12 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:08:01 -0700
In-Reply-To: <20250929190805.201446-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250929190805.201446-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250929190805.201446-12-irogers@google.com>
Subject: [PATCH v6 11/15] perf llvm: Disassemble cleanup
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
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
 tools/perf/util/llvm.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index a0774373f0d6..a28f130c8951 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -244,6 +244,17 @@ static void perf_LLVMDisasmDispose(LLVMDisasmContextRef context)
 #endif
 }
 
+static void init_llvm(void)
+{
+	static bool init;
+
+	if (!init) {
+		perf_LLVMInitializeAllTargetInfos();
+		perf_LLVMInitializeAllTargetMCs();
+		perf_LLVMInitializeAllDisassemblers();
+		init = true;
+	}
+}
 
 static void free_llvm_inline_frames(struct llvm_a2l_frame *inline_frames,
 				    int num_frames)
@@ -339,7 +350,6 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	u64 buf_len;
 	u64 pc;
 	bool is_64bit;
-	char triplet[64];
 	char disasm_buf[2048];
 	size_t disasm_len;
 	struct disasm_line *dl;
@@ -352,27 +362,25 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 	if (args->options->objdump_path)
 		return -1;
 
-	perf_LLVMInitializeAllTargetInfos();
-	perf_LLVMInitializeAllTargetMCs();
-	perf_LLVMInitializeAllDisassemblers();
-
 	buf = dso__read_symbol(dso, filename, map, sym,
 			       &code_buf, &buf_len, &is_64bit);
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
+		disasm = perf_LLVMCreateDisasm(triplet, &storage, /*tag_type=*/0,
+					       /*get_op_info=*/NULL, symbol_lookup_callback);
 	} else {
+		char triplet[64];
+
 		scnprintf(triplet, sizeof(triplet), "%s-linux-gnu",
 			  args->arch->name);
+		disasm = perf_LLVMCreateDisasm(triplet, &storage, /*tag_type=*/0,
+					       /*get_op_info=*/NULL, symbol_lookup_callback);
 	}
-
-	disasm = perf_LLVMCreateDisasm(triplet, &storage, 0, NULL,
-				       symbol_lookup_callback);
 	if (disasm == NULL)
 		goto err;
 
-- 
2.51.0.570.gb178f27e6d-goog

