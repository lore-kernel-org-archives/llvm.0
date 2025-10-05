Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE712C0F7B
	for <llvm@lists.linux.dev>; Sun,  5 Oct 2025 21:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759699355; cv=none; b=t7CrJ9iZPYy7hyPWMKS7febMD/49FNk+dwbfN1qsyL2Ikiv2kvkl7krjH1zn4poUG4GQr3noA//MxvRVVPlEEppuBPo9ulNx+5waxCNICEDc090YUuE7A/LqzDp7QtuTo0SQbZbXjpsMBOOVrPG7665J/NDwU2hiGgy42YYBJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759699355; c=relaxed/simple;
	bh=WlZay7JBScKarmUmUW5W4rt0ZQNci9N/og2V+ODkwEE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=pEWwu1zWSbPHX+wEXkM1ZspYdKyUeMFfGtMGTvvKNEyoYZbXTU6H0NZG5cgQ1vuvYYtbupqcbi4uC7J5wfIx3voT4BrRxQWy25GbxzkZDCwXfDF6xNEHJM5CBz3X5aeNsVMaGcN4jS001lc841MasLRVQJIxef2XZ5J2vf0l5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1XMX/VZA; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1XMX/VZA"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so6955492b3a.1
        for <llvm@lists.linux.dev>; Sun, 05 Oct 2025 14:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759699353; x=1760304153; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wulS2NGvKURng0Egd2IGwMyFIkt/Pg3ipSmNBN6RrB4=;
        b=1XMX/VZACYUmMVU3aMGeC9WRfJ0OwKFM1Ml0Si80Mev4HpIDXhjAO+S55b9uvsiZkZ
         wU3Fsvr9QxQuQMxmetMaM/CaihYcncJKL8NrpZpPCUn4UqdIq2Tk/j5ZYFoIzGinAzPw
         MKh0sM9f07BorWRyLB0IfXWBZH/RpXd2ezmbqa71y29/krd63r6WakBd6p0t3rbgdlWK
         TuclalouG5q1D66mlE2UzC368t0MN5X8puQ0t9KRsvO13ywB2TdTkx6oOUGXpWaXdBJe
         hp/tg9hJv7EK2NLJwaE1c0QlTVhGsgz/9qshGFOJWWdlvbqzVhH9yUltXiIMcoRcjuQS
         WuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759699353; x=1760304153;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wulS2NGvKURng0Egd2IGwMyFIkt/Pg3ipSmNBN6RrB4=;
        b=brIR/siloPQD+lacAOfG7J93qMIAXH8ijwiQWYOCP1RZIZhDDC+MOmqpN9rNAQLJUg
         AfB7x8/rKa3nemKwOd6ZEcKpvZ+QFuxiLKsr7jSEobo1xjogifEgf4+G//uFpurnK4Fb
         AmxkjyIN3qrfepw9VGF4dJp+nu6iLN4BN+ZIONM75mtK7RWcdesrYBzl4nVT8FHY1wT3
         O55suD+326+BemZwT5FWoa8elixmCMTMGxo3NbeSSq1/eK2Oj+qAtxLlAVdWLgQIe9cM
         BrduMvzP3EteRmvbGJdh2RK2P+zN2EKyr9uTSrh3XSDfrzCab8ebozxIrpqzvv+T5o4b
         1nww==
X-Forwarded-Encrypted: i=1; AJvYcCXuvVUnwenFI2cCau0yv0CPsni4UlvfDwfA1yf50VsL4KuY4wPNZuWQBDM4+U2r8bxLD0DC@lists.linux.dev
X-Gm-Message-State: AOJu0YyhKfKy3OKvDiXpAq+wbu49eaFCsVOrxGEerX7MKPH7ts7PtdVa
	Ss2G47dIvax+BeYtoyU6LtL+shCKCMMFRyNEpH2/4Oo8OioATQ45+OwJU8AfkCSzEZa+UIzhefY
	+VtOsNYl1Sg==
X-Google-Smtp-Source: AGHT+IGisVDrX4jLxBH+/IAg/iMlAvXEniLcqb7zAD7YH4cEtUgSeVtwpZqI4UICoBZYGGFSpiSyYOt983pn
X-Received: from pgnr5.prod.google.com ([2002:a63:8f45:0:b0:b62:8092:7d58])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f90:b0:2c0:227b:13ea
 with SMTP id adf61e73a8af0-32b61e5c57emr14386613637.22.1759699353384; Sun, 05
 Oct 2025 14:22:33 -0700 (PDT)
Date: Sun,  5 Oct 2025 14:22:07 -0700
In-Reply-To: <20251005212212.2892175-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251005212212.2892175-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251005212212.2892175-7-irogers@google.com>
Subject: [PATCH v7 06/11] perf disasm: Make ins__scnprintf and ins__is_nop static
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

Reduce the scope of ins__scnprintf and ins__is_nop that aren't used
outside of disasm.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.c | 6 +++---
 tools/perf/util/disasm.h | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index e64902e520ab..50b9433f3f8e 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -247,8 +247,8 @@ static int ins__raw_scnprintf(struct ins *ins, char *bf, size_t size,
 	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name, ops->raw);
 }
 
-int ins__scnprintf(struct ins *ins, char *bf, size_t size,
-		   struct ins_operands *ops, int max_ins_name)
+static int ins__scnprintf(struct ins *ins, char *bf, size_t size,
+			  struct ins_operands *ops, int max_ins_name)
 {
 	if (ins->ops->scnprintf)
 		return ins->ops->scnprintf(ins, bf, size, ops, max_ins_name);
@@ -828,7 +828,7 @@ static struct ins_ops ret_ops = {
 	.scnprintf = ins__raw_scnprintf,
 };
 
-bool ins__is_nop(const struct ins *ins)
+static bool ins__is_nop(const struct ins *ins)
 {
 	return ins->ops == &nop_ops;
 }
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 2cb4e1a6bd30..09c86f540f7f 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -110,13 +110,10 @@ struct arch *arch__find(const char *name);
 bool arch__is(struct arch *arch, const char *name);
 
 struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl);
-int ins__scnprintf(struct ins *ins, char *bf, size_t size,
-		   struct ins_operands *ops, int max_ins_name);
 
 bool ins__is_call(const struct ins *ins);
 bool ins__is_jump(const struct ins *ins);
 bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2);
-bool ins__is_nop(const struct ins *ins);
 bool ins__is_ret(const struct ins *ins);
 bool ins__is_lock(const struct ins *ins);
 
-- 
2.51.0.618.g983fd99d29-goog

