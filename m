Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521C18C20
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WIhdxZVG"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d8b2eec15d3so6404186276.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876784; x=1697481584; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GouG30KZVQtjqm6aov/swqA2g+y6OD5o5DKI6J9/hJA=;
        b=WIhdxZVGDbRzm3ihmon7nasXnkkwaOxj6J0KX3/47ruggCljbNcoQydEUqbFNAy+vN
         7SeZ5yfo9VpvrEI4S/2yIhJTUjNEe4iH35B+Zh27Vp76MX+azifJIlF1oxo2Bubi7ddq
         NgnoYK9T7FriYa3ytEghg9PAOWhA79URwb1TlWBWjPxJ0IUxh3S9TEWPe+S/XkZPbXbs
         Ka/cZPXXEx1i3tabwibkwCOAGKkLhy0ctzQ1VEBrlIXJqKRqmSVJnrPA0Hs1jXPBM1Jm
         UA9Bch/e6QDy7Kg3QplMdmkzDfFUzMOy8gYTO+e/hxs4xoacg1hsza3d6eGCbWdyAdxw
         qKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876784; x=1697481584;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GouG30KZVQtjqm6aov/swqA2g+y6OD5o5DKI6J9/hJA=;
        b=oWER8vIxuK3hZlGfMZHEMU2drmayNL3Vp6CvZiBygEl9EYiRT5UL7ssMhCLrVYb3YG
         x9jsW6b+K70+BbrKCrIaRwiXuxDO6F1+5qyvvz6gOnoyxdTCmK5nHYydAtbkD0cFEc5A
         HrgZXc0kiB0kqpdGOxrMGE6R9nQAmQdol58OHJKvJNSUQ5MnwdDVESFHPEPBNCfrq4SA
         Ku4uyb6kVKqYVG67d0tH2vA0CbmJJXkaN46g8ie3pPKF+qk3TC8loBrm4kDJ7wGiWAxa
         G5OF9ZfmCBBiUIp6xzsYg7sJEsrjqRJzvzfWaNNj5LevGQN4kYJt/7lXhBlWcFeFgFsV
         pK0g==
X-Gm-Message-State: AOJu0Yyi0D5zf+fiS8CgpEEVLj65M8d1L1a/hTGebe8B5A3tfuQS7xcm
	ZXwHfTAV/u/Ics6fnKGeOtswzWxp9b/h
X-Google-Smtp-Source: AGHT+IFoEQ7Dzv18PcmdjnpaSDsoWF/VAum2oAmj8wWzPzLIX73XPP1Ukf1ru5WFK6DwCtdvNWmpgT87L/bK
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:d12:0:b0:d9a:3bee:255c with SMTP id
 18-20020a250d12000000b00d9a3bee255cmr25038ybn.7.1696876784641; Mon, 09 Oct
 2023 11:39:44 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:09 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-9-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 07/18] perf jitdump: Avoid memory leak
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
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

