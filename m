Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C197819
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:51 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59c0dd156e5so54075347b3.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447350; x=1696052150; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AfDeYd3y4U8gp4T1+0CLrDpr9vwqimMAiCox+i0+u8=;
        b=4NztcQpU19xNXWnERRsWYluC6rT+5wtwVIVS+0u/f0mjk+f/3Y5jG1AftBslHtVZCq
         0N9wzJ7TbH2sR5ry2Yb5teQ3lBGp2AcTkP46Knzg115S0AjMUtzc9iyjuxTqv4X3fcwe
         ZM4zIx0QDrij2vqZXDX+l/6GjZDJf3UXHQhXINaXGVDYaDbj/FUJNITHvdPbCRZJZF2T
         36BFUGL7xAby27p2qqkiuLGH8QTaBP4hNlBpHYn5lIrCJNG0wueZdVldEfeXmEpfR1EC
         HV8t6LEqKDNpKz2HaXOW/xkLx/Nf4NJSYA7yU3hliSTN5FB1GnnVNzfJVAdxtaIhRWeJ
         JbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447350; x=1696052150;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AfDeYd3y4U8gp4T1+0CLrDpr9vwqimMAiCox+i0+u8=;
        b=avVURGgcNsRkcWcZPuooVY7aNB5d5zzQT+vqvpIkuDZtTsWUW/zo74IcxbZVc7nYCf
         Nk8YLx61Yc2OA69DpFAfg5IOBpDKBr5gh81Gl0AfKTPyT0CXyxB+ZXiigwP6rIFZmxED
         cjuYthvqNJXAx1PIIknI4WtGXQP552m1xWrfFzwLNUAO2BvVjfSvv4+lfo8R5twD0tuw
         MsovQ+HAjw2AQpoOWYsg5/DWvgwuogIZQEcLuV96QunKWVh6ZoBo1ndSLUb5pO1vSNKA
         Y/fYAbtVryPX3Tn3ZcS64AMjI/hvBHkEUKUiMGjJZ4PF+GK0LOZUcNhmx0mnkVWc8LyQ
         U0dQ==
X-Gm-Message-State: AOJu0YwpLpwxYE+srePVmR4rs+BRWmGMu431AeTLNR0UyJ+Qoxx+RHcH
	sJnIqbpwx9cTefWDJKwa20qRZjc18bTE
X-Google-Smtp-Source: AGHT+IFEnjvrFYTzzkb1dI9/2klEiZwWev3gToYu5hzr8ovZWNcWhYoEwlz8DIZQ9Lino1g7YG2kJaYO8amj
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a05:690c:72c:b0:59b:d33b:5ddc with SMTP id
 bt12-20020a05690c072c00b0059bd33b5ddcmr20810ywb.4.1695447350168; Fri, 22 Sep
 2023 22:35:50 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:03 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 06/18] perf buildid-cache: Fix use of uninitialized value
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

The buildid filename is first determined and then from this the
buildid read. If getting the filename fails then the buildid will be
used for a later memcmp uninitialized. Detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-buildid-cache.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-buildid-cache.c b/tools/perf/builtin-buildid-cache.c
index cd381693658b..e2a40f1d9225 100644
--- a/tools/perf/builtin-buildid-cache.c
+++ b/tools/perf/builtin-buildid-cache.c
@@ -277,8 +277,10 @@ static bool dso__missing_buildid_cache(struct dso *dso, int parm __maybe_unused)
 	char filename[PATH_MAX];
 	struct build_id bid;
 
-	if (dso__build_id_filename(dso, filename, sizeof(filename), false) &&
-	    filename__read_build_id(filename, &bid) == -1) {
+	if (!dso__build_id_filename(dso, filename, sizeof(filename), false))
+		return true;
+
+	if (filename__read_build_id(filename, &bid) == -1) {
 		if (errno == ENOENT)
 			return false;
 
-- 
2.42.0.515.g380fc7ccd1-goog

