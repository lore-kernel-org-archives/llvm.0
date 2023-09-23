Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A87F9
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:09 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d8660e23801so828175276.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447368; x=1696052168; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3pdNCB2LsormKDmRgRav6emuDoIUkf2JUNU+RA747k=;
        b=ioAAHwzXgvf6QpNiia8NkYKFIuik3oxHR6v96y2NzkLhwi6d4OYvlje30uG8sXp0Qo
         usbtMsGMKM+K7dBUVrsyIfRtsAwet/KE8RNrntC5mMJmu4H+O94O7wBA3XROorvLW7Lp
         Z072veXx3Z7vinQsSsKIXHzTQkeKvzgjHyEsfh45biLwVBDV2E+1w/Xd/Xno2KR8ltm7
         4GDBj1c8tWAVyA3Uj9LFwzGth11qKimlUbGq9QAe+e0Y0HU/c6RFu6zWF10V93TA5Hyk
         dVA44kyYhWGZEMRHSvkSSu1L5iQ9l3eF5CW6u8TAk8Rsx0jisOZaMdaleRyiVUeSrTn+
         8+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447368; x=1696052168;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3pdNCB2LsormKDmRgRav6emuDoIUkf2JUNU+RA747k=;
        b=uSMfWTFQyTvohx0DGwQgx60hbs/l/XtrumO7nAjFsftHE0tVArevlSu+ezn04njpME
         iATagdCWvuXszIuFpIhqkB3LnkljJiGnSURtmRklXjws5kXC6qDCPar/YstxLDEhVME4
         /ifHNY0Pt3tGeDgzHcWQkzvfl5cemJCCHRSfkhLXDcR/qI/TfC4lWsaNjmMFb9GoXtl9
         2+aKQiWO5PyutYcV49IGJnSeI/kIR278xUuy9NJjPZg4Bw+4Np0EMoVvqc6WZpmlCz2p
         GnYzs9FbNpALq/SU0W6AtJ3e3W1w+UHjVlrlm1e/16nBuPex1h92RVc6BiP24ZqfgZJp
         sGuQ==
X-Gm-Message-State: AOJu0YyMj/qSUE91E+7A8JTWETnd2F6X2Gw7L39hby2T3CEp6V5R2LES
	63vUXuE+iyTHQHvXs4FnrpBeC0QgaX98
X-Google-Smtp-Source: AGHT+IHCnNmAl4FHX9SRP9LKagjgjeFuwIZsOgArdKHwnwaZmzbMv4PHYCjxCbJouwmMwwuksIiI1+0lADIr
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a25:238d:0:b0:d78:3c2e:b186 with SMTP id
 j135-20020a25238d000000b00d783c2eb186mr10894ybj.5.1695447368466; Fri, 22 Sep
 2023 22:36:08 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:11 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-15-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 14/18] perf parse-events: Fix unlikely memory leak when
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
	James Clark <james.clark@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
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
2.42.0.515.g380fc7ccd1-goog

