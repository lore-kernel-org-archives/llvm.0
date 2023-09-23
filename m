Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8A1C38
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:18 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d817775453dso4183819276.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447378; x=1696052178; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywZDu0emPkmJVQQeOexJ/0NU/+t2nDPbGZwUB+L0bX8=;
        b=CG02W7b/mLkkimdZCgi6e637gJCqPxaFGbhflJtK18j+JH0mly10eky7aUDPvDZ/52
         /MPZp3ueBa+RWTTfacT+SjHER1GXE0zwXH9MdRZ5au56hHBs4Z5ZezYe1L28JRxzr+b6
         6yljph0Nxa5MxhhH9s8R7c4Mv57CKTQz/Oej3YWxARYSKZVP4hPX7gm0RuYnqvhHK0Ld
         I1w/cNu549W37qH88+7MmoUh48xg1ETSDDE0ckmmNUoDJVMLsSGMGhoo66zkNlxj2Q4A
         2Br43+eg0hYygnkEsNyViWJcK/RLmdg3MgKc4/mrXrdgSYOJPHOcFo7wycRkbp1gLRq8
         uTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447378; x=1696052178;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywZDu0emPkmJVQQeOexJ/0NU/+t2nDPbGZwUB+L0bX8=;
        b=OtwzDrKaqJqtwwo20plFu2kW2XLhaGyUzTB9SepUY3Tiwf03DoRnazh3y5URgkrLq6
         Wy158rv61uSTZwx/ejpCspekiaeUpmXfS+Lr4l/dMTAKwwCXA8eysOEclt9GqXivLkgi
         lsQ0I9WY3rK9RseLMkIKYfDjMEC9DMQxHk0uOXIBmaIpJ233bZZLlNyy/mSsF8Y1NLY+
         ognW9vi2u0ub5RNL9b94lotQablWQP2FkaxjIshoIerlTdMbMInw8o6Nekm5LTXZVmCH
         DdCISe75BXahwoibE+s1LEli3tJeOLeQR5rEQopCpiwjMYPzzUyggYeNoIjehpSddAFY
         urhw==
X-Gm-Message-State: AOJu0YyFw2HwPFT4hlbqFETV228oF9fyKvXGjMK8lfTQb0FWofsUPGw5
	BsiaW4Oqwy0emnbFVuocgX0dGAq/1kRc
X-Google-Smtp-Source: AGHT+IGTu58JilIBfDpSy7tMqNuBcfjoioDdjm+UokXTsJGVIl9AVdtE2VsgkJoMSD2sydC3Nw35sn/h8sOx
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a25:6942:0:b0:d81:68ac:e046 with SMTP id
 e63-20020a256942000000b00d8168ace046mr11989ybc.12.1695447377882; Fri, 22 Sep
 2023 22:36:17 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:15 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-19-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 18/18] perf bpf_counter: Fix a few memory leaks
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

Memory leaks were detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_counter.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/bpf_counter.c b/tools/perf/util/bpf_counter.c
index 6732cbbcf9b3..7f9b0e46e008 100644
--- a/tools/perf/util/bpf_counter.c
+++ b/tools/perf/util/bpf_counter.c
@@ -104,7 +104,7 @@ static int bpf_program_profiler_load_one(struct evsel *evsel, u32 prog_id)
 	struct bpf_prog_profiler_bpf *skel;
 	struct bpf_counter *counter;
 	struct bpf_program *prog;
-	char *prog_name;
+	char *prog_name = NULL;
 	int prog_fd;
 	int err;
 
@@ -155,10 +155,12 @@ static int bpf_program_profiler_load_one(struct evsel *evsel, u32 prog_id)
 	assert(skel != NULL);
 	counter->skel = skel;
 	list_add(&counter->list, &evsel->bpf_counter_list);
+	free(prog_name);
 	close(prog_fd);
 	return 0;
 err_out:
 	bpf_prog_profiler_bpf__destroy(skel);
+	free(prog_name);
 	free(counter);
 	close(prog_fd);
 	return -1;
@@ -180,6 +182,7 @@ static int bpf_program_profiler__load(struct evsel *evsel, struct target *target
 		    (*p != '\0' && *p != ',')) {
 			pr_err("Failed to parse bpf prog ids %s\n",
 			       target->bpf_str);
+			free(bpf_str_);
 			return -1;
 		}
 
-- 
2.42.0.515.g380fc7ccd1-goog

