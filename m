Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD9436B0
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C4AG1Pk5"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5a22eb73cb3so23039687b3.3
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547356; x=1697152156; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GouG30KZVQtjqm6aov/swqA2g+y6OD5o5DKI6J9/hJA=;
        b=C4AG1Pk5OgHPF2UrZtyqgPwQE1u1+gpqMUeq4PT/kWFlM6FQ9CcYcEvDIFYQ/b3Wh1
         4lPkUMa+xn9tK3RJR3RWNJyJJ9j9PEfgFsTVpCvVDnu3YpKXo9qjvhBVs8y98JuzZlun
         LtWzza7m7jrFcLBlQwkr28qPKPZn8VKzHr5hDLwbbYudobTQkpuof7KfSj6qQUErGl5D
         PH767vIEtQZI20nrURcMztj3HNLZL/EyZi4ad3B3SQ0TG4O8bG47qTHEPSiVeUxBtyCT
         em7kmi7aOGEdg7g9cEIDuAmppTGX8pb634iTLmHJMBa05jxx2eU2dMr1/Qnz2jObj6h1
         5jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547356; x=1697152156;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GouG30KZVQtjqm6aov/swqA2g+y6OD5o5DKI6J9/hJA=;
        b=YTvCgJFzyWCYeoie2XqCeKluP2Fp5f2Xv91zTWFNf4XyUmv3rj4W45O0xIWvD1G7B1
         9uhfkIhlYlF3EborhlD+qK5We8RCQBN1b4dovX68kC1gWkPe5ivPtudBwcH5CWnisKJJ
         Sx8smKBGqpdHy5V262rjT6VhNGrB5SqUX+MfBzUnrNr8E8aLKetMOSrTeisbBSYNyjv8
         jI/dF6ujWfnF97GIm1D/O4H7nyUPGvH/dAD3doGGDdxsvvgAx239I6Z4Zn3S0SgIEhLI
         5kuo80LtHiKk5mPWwt4EA0B0UO2welTzovEO7jAHV+abSrmw6pl8p76Pmxq8zn/KFAFu
         z2Mg==
X-Gm-Message-State: AOJu0Yxx+KnujmpF7Cl9DUk+Cpm4HD2RNzdUpHWdV5FTdTWw70GzuXmg
	zFEOtyp6R+n5I22mGO2Wo+zWmCyyRyu9
X-Google-Smtp-Source: AGHT+IGONU+OowDDx8a+TbL/FH+ObTrGvfI1GY50R5S+RVIAsaEN1VZNRoea3AVWMrrmFuuADHtm0K7HKpil
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a81:430c:0:b0:576:8cb6:62a9 with SMTP id
 q12-20020a81430c000000b005768cb662a9mr115006ywa.6.1696547355929; Thu, 05 Oct
 2023 16:09:15 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:41 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-9-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 08/18] perf jitdump: Avoid memory leak
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

jit_repipe_unwinding_info is called in a loop by jit_process_dump,
avoid leaking unwinding_data by free-ing before overwriting. Error
detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/jitdump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/jitdump.c b/tools/perf/util/jitdump.c
index 6b2b96c16ccd..1f657ef8975f 100644
--- a/tools/perf/util/jitdump.c
+++ b/tools/perf/util/jitdump.c
@@ -675,6 +675,7 @@ jit_repipe_unwinding_info(struct jit_buf_desc *jd, union jr_entry *jr)
 	jd->eh_frame_hdr_size = jr->unwinding.eh_frame_hdr_size;
 	jd->unwinding_size = jr->unwinding.unwinding_size;
 	jd->unwinding_mapped_size = jr->unwinding.mapped_size;
+	free(jd->unwinding_data);
 	jd->unwinding_data = unwinding_data;
 
 	return 0;
-- 
2.42.0.609.gbb76f46606-goog

