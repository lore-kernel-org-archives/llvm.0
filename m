Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5E838944C
	for <llvm@lists.linux.dev>; Tue,  3 Mar 2026 23:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578861; cv=none; b=DzhrUgkcAmzjTlgFtoYMFNJzdb3c74th71bQYuYhkuNmWBe89Tv0rsjZmay0JPECAyLd1hl4xqB8CUrLWMGj4HPMI+Gz+B6WkWuQMwcPV7r6fndM6ULK70WsdxyLEjalySr5FWXyavHieSkzbm5rt2nA0HyaEZA6rnFOXQu2n0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578861; c=relaxed/simple;
	bh=r3BG0oLSPYciMGICd395vK2SFV+sVdRwiimHYrJFvRc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hARInOzcxwXvUBwD6lsqVOw2MRbpTr9vCwPaJwxHTS9BDC4VmI3OJmthvoKvpuC7Q62woaxfSqrVmmPMecmFsoMTAD3uhImN7lL3IvuSYUKx0NjxrV4NrWsvshG1GV248Vnk0F6mcGeaWsICiWQDM3dbnO18QBDUgFjcjqvaMrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pq9BmVnw; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pq9BmVnw"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so29005258eec.1
        for <llvm@lists.linux.dev>; Tue, 03 Mar 2026 15:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772578859; x=1773183659; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JiZo9yNC/DMiqxyM/R63ivjQXmVcbfTK9Za74i9Ki3w=;
        b=pq9BmVnwEFBaNCJ88O8lSL+Q5mJIKGRfrM0+1TfAeVi4gKiNT2BoILyWNGTP8FCb9m
         ByWl37lp1mEZIFQ1BgE9hl9SshJASJNlPDUDGuObUq8KewGjHiw4CM/MXFcRVMH9iclB
         y7SEh7Q6cARXw9fYwXLRue4xDx/2kQ92TpP9N7WmhtVDlo7LjDNoy268lZxmG1tiJd+m
         AgxYRGO+ZfzmWJq7zaxG57+s6bbVpoFr2aWoUJrtEAc1ZEtQWi4+1lFfAGOYQM10T9G6
         N5QAZu3ODtBdCnidrAe1cq6lwXeSCRSWThf8mUbV5ZPwK1uPQ4SEW5fZM+/TzPKBlO6X
         uPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772578859; x=1773183659;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiZo9yNC/DMiqxyM/R63ivjQXmVcbfTK9Za74i9Ki3w=;
        b=g4H3aNKA2h09rd7TWi/Maiq0Qmd8g4pQADYUmLe045kbS+kE8RX3sBckK7gErfTLb3
         rfZzHjT92maPjLz+kAaVPcxADQOLtzu6Sgs7G95XvkVwPc3c5eeAZIkokGaA90QNPJaN
         mO1WFsKKC9o5e3bu0SUEfEWfTlsxRoDR0fCvQ22FmHTrBCmCda0W3fEDmhaVGnqUhu/e
         wJvP9mfv9avwrDKqAT5uqhfxqloxGDecSlOhUKUtCDPdWi1pbrpve3YBY3ty3sg5JEKt
         eXnVbvKH2M1nCaWXi9lPY4HsMbKQX7yHgGNeYILGigoC62UqT5VngYM26cZ24wJ5Huce
         Nk2A==
X-Forwarded-Encrypted: i=1; AJvYcCXg8cPkjvmzpQHdhDs+wZ1P17OVk2oavdMdnR+yoKHiDwIMeFxJYBC4oun6SXMnsGYD5uSC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9uA2bs8dPplXTeWLkpNKbeh1XvVZOO9rCaGTRV7AHk/dShhGA
	Uvu78z9qMPX0SKQxg3bA0FRR+3GRk5G7TP8WIY8rnw0LrQzuaSdUZpaK48QFSW7KHQI7ag==
X-Received: from dybrc12.prod.google.com ([2002:a05:7300:d80c:b0:2be:1e24:487d])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:5b88:b0:2be:522:2edf
 with SMTP id 5a478bee46e88-2be0522336bmr4393185eec.39.1772578858899; Tue, 03
 Mar 2026 15:00:58 -0800 (PST)
Date: Tue,  3 Mar 2026 15:00:54 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303230056.2074898-1-pcc@google.com>
Subject: [PATCH] perf llvm: Specify features="+all" for aarch64
From: Peter Collingbourne <pcc@google.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Collingbourne <pcc@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is consistent with what llvm-objdump does (see [1]) and allows
the LLVM disassembler to disassemble instructions not in the base
instruction set.

[1] https://reviews.llvm.org/D127741

Link: https://linux-review.googlesource.com/id/I52e4fef18d2e12b45f875231fa9d3efff2538fd4
Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 tools/perf/util/llvm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/llvm.c b/tools/perf/util/llvm.c
index 87fceae8488a7..44eff99970fe2 100644
--- a/tools/perf/util/llvm.c
+++ b/tools/perf/util/llvm.c
@@ -153,11 +153,17 @@ int symbol__disassemble_llvm(const char *filename, struct symbol *sym,
 					  /*get_op_info=*/NULL, symbol_lookup_callback);
 	} else {
 		char triplet[64];
+		const char *features = NULL;
 
 		scnprintf(triplet, sizeof(triplet), "%s-linux-gnu",
 			  args->arch->name);
-		disasm = LLVMCreateDisasm(triplet, &storage, /*tag_type=*/0,
-					  /*get_op_info=*/NULL, symbol_lookup_callback);
+		if (args->arch->id.e_machine == EM_AARCH64)
+			features = "+all";
+		disasm = LLVMCreateDisasmCPUFeatures(triplet, /*cpu=*/"",
+						     features, &storage,
+						     /*tag_type=*/0,
+						     /*get_op_info=*/NULL,
+						     symbol_lookup_callback);
 	}
 
 	if (disasm == NULL)
-- 
2.53.0.473.g4a7958ca14-goog

