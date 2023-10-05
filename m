Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F8436B9
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aKSd2A8Y"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5a4f6729d16so23809377b3.0
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547370; x=1697152170; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGxcidzGPRegna1u1K7BT077Nrlph2dhlmMJs3FQauY=;
        b=aKSd2A8YIrjoqmHggKssjuC83DHOJ7KtEVqFTs9pQBKQhQcBP+dm9BlE8y1sMTlczm
         TcNvawk9kXj/gTWMFJLEQXN4/Y85AVGoVqswBKQRbLINOuK6tnPe4wq4nx5yvzo9PsY+
         i6TJP+J3OiznTB87ie4XaHdcL3n2kYCHFZRwm/Ye5siTB2zuF3OVFGfpwvgdq/4Ri1sU
         +WaOtFbaNF6O5Vnf3AI4Gq+OfiLZTPRphpPFKsTVturzEwLPdz/hdcobdUpPqC21ix2N
         aqbESRsBTowgod7ep37oBM7Ik1p3llUojy44CyB07dHTMXQibtL+gVfFAmzK8vvuPih4
         hHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547370; x=1697152170;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGxcidzGPRegna1u1K7BT077Nrlph2dhlmMJs3FQauY=;
        b=PAcUqEswAP6OjGOiEhkypHtL6m8o5hjxbPF59aPb526KObbNLDeHX+bIsz/bobQGvb
         ybPyucw/In9U4nxYsRG9VnD+HBaSH35dFsHfJruPlhNUC/YX+/m1FTm3wPhQgeJ8frdd
         KBEdaQ1qaa6wG/eSdTu/SlcSg4l4q7XbeEPKeDi58Sv16Hd6J6Px57fN22jUKFnef9FJ
         drFg8kOCajvszoEWsLp2FdcZWHaCFEPzBxN1OMf4JqbYT77kqSms9zFGML2vx4pm9C6U
         bP64w0QkEbUBu9UCBepqfGLlfpvpzELdmDGBS/1lkOlRE+aaz/+vNKWXTQVV5bwxbx2b
         XSuA==
X-Gm-Message-State: AOJu0YwTosTN54HJVSqwWj24wc9nXkQGmqHq80Gk3n8LrFpmgaYV3DtN
	s9yYQN3UxgCUUEju7z1a7AseyEbaMoqQ
X-Google-Smtp-Source: AGHT+IEgTi3PLG+3o2WWDEFrIlbIkR+q1EaEaSDVhwE+qexUhANhreJWyGErr61dmZWaJXVBJMGi41ML+jYa
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:74c2:0:b0:d7b:9902:fb3d with SMTP id
 p185-20020a2574c2000000b00d7b9902fb3dmr105008ybc.0.1696547370559; Thu, 05 Oct
 2023 16:09:30 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:47 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-15-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 14/18] perf parse-events: Fix unlikely memory leak when
 cloning terms
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

Add missing free on an error path as detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index c56e07bd7dd6..23c027cf20ae 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -2549,8 +2549,10 @@ int parse_events_term__clone(struct parse_events_term **new,
 		return new_term(new, &temp, /*str=*/NULL, term->val.num);
 
 	str = strdup(term->val.str);
-	if (!str)
+	if (!str) {
+		zfree(&temp.config);
 		return -ENOMEM;
+	}
 	return new_term(new, &temp, str, /*num=*/0);
 }
 
-- 
2.42.0.609.gbb76f46606-goog

