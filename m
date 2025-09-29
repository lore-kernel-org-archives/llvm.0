Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B6243969
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759172959; cv=none; b=stjlWay+AGXVquL5Oq9QhrcZRlIbPxV9UaNxBgtu4RIXk6jDCdjGmdJ3K4HU9Cti8plht5s3FbDwJxhS3JwPAZdKIZ8GZqZlWZ/MW5eM/Ro4rq86KntKbj9yrxfuX8ZlWwiSnlUDi5DFf/8rHp+I9KMG2tTs3tGaVn6TRE7LdMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759172959; c=relaxed/simple;
	bh=QAMXMzzdI9MdutH7eQN4wd9SUdKYuTS3iFPzHIudd8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=hrkA6iM47mJPlPx3KEFSYA0gSmOcw8DO17pM1XiX1pTuc/cZGlapsN35ZRYZxMXQyYd+eQhoohPftLFhJAcJDPqafKTDrP4ZRemfxG90VaH2RiZ1A2wNZOR5bhMzdrb+lAZmKNcS1cq5hwGDID0fjiVgjJwWsZeHUz45fNjV488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pEFIFNFf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pEFIFNFf"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-27eca7298d9so105680915ad.0
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759172956; x=1759777756; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdcK/lBU6rEBVQg0qeNeqiUObE1KDszjje3klwu/MCM=;
        b=pEFIFNFfcp43nI8zsK1/sniOltHkmRhBjNUREjhKlci1OLYB1W9Q4+I3jZQRMhPw98
         89ApyitIsAzoZTXlrYhnkam+kggCtvanBTlZ576jm+vYPusCx5qYKSPvR8BtXNKcxmZg
         0DfRKiZASIP9wz8veWFp1jxyE++oXrgHZeUmjq5sYi1lB2fgvsy8zcZUTUb66H8BMSCD
         0t5Yqttechc2kiQfTyoDOT5iY+bWpG/QwXbE+OeZjxNo5AXyE0CjceqjXhQLmXQrbjt6
         GxTS7Izx2u0J4yp5f/v63ooyB7Nes8elFqopwf2K0KnV64pdMfN7xixsQkIGAPFvGrxR
         AIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172956; x=1759777756;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdcK/lBU6rEBVQg0qeNeqiUObE1KDszjje3klwu/MCM=;
        b=mTlV1lkIV5Z8dAbhDmhxESln9K011qU7CmqER/kiGeUQfvtxk7nJ6bum5sBtAeElNs
         KiQ8/8fgyj5/bPdNxwamZ25+G6Zyw6WJnt7xVMn3pAqpZFeKxRg6fuTcZGlmhdmw9Xvj
         EFPf/nU8l6vd7WH7YX9w7DHBZk6DXW0qOFUys/EWIVCLUtHWInmE1I7yU/g2iwYOc/1o
         lbbCf+VtKQWzUMVVZ5YN03PalvKgVaeqHqNXClvicTcqsfIrwjgyoZsMIDd8YRhZwYGj
         sJLAZXxaVWBYN6/JKC/4HpWN11DB7h1TSsy5Cbta5JxJnHY5uVrHOUzuo4cSZs5lKS8t
         jIhg==
X-Forwarded-Encrypted: i=1; AJvYcCXLoVzODfPyrZq6NqiGTsY4+JIkMUCYILRkFLRtSiSKPWBwn0+gGL5fu0dRVrOr47TK7foH@lists.linux.dev
X-Gm-Message-State: AOJu0YwSpRndagNps3m5teOmNYKaXaxTOU6604im1qmqUZB1icIWYIWI
	kdNnNT+4vSN4AO86w631hXtDd7vWdBWM1kK4rzJXNOkvraTwzaRLYg6ven1N0ngjtqSZ+96TEEK
	m1uHa+kxRYA==
X-Google-Smtp-Source: AGHT+IEJX47iOtVtrshwBHm4+RSHE5OXtXWHjA4rxRxxI9/ipxBIUfnBsBl2AQARp8ZA4p+cWOFp5/eQGOfA
X-Received: from plko4.prod.google.com ([2002:a17:902:6b04:b0:234:c104:43f1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea0a:b0:24b:62ef:9d38
 with SMTP id d9443c01a7336-27ed49d2948mr197295705ad.19.1759172956552; Mon, 29
 Sep 2025 12:09:16 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:08:03 -0700
In-Reply-To: <20250929190805.201446-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250929190805.201446-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250929190805.201446-14-irogers@google.com>
Subject: [PATCH v6 13/15] perf disasm: Make ins__scnprintf and ins__is_nop static
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
2.51.0.570.gb178f27e6d-goog

