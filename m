Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011036B0E
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eVqVL3sM"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a7aa161b2fso9139457b3.2
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876806; x=1697481606; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxVOZd3C3ppqYjNmukwrdUncP0WHK7JyRq4ciQhpawI=;
        b=eVqVL3sMfT3AQF8f36kiLdnzdNeUVEDAFKU/KtYLCo+Jk4PZwWr8vfpUjqsovkoiIP
         glKYxW6xaG25Fuvj6d+QoOw5EiAaZIcTHNI3wSktB8cI5lFClMdkC7xxSXq9zjtNKc3A
         vZ0Gyl1KPULtpqPbLHlVw0GpV6n5ObYrYpJXCfUd/B8+30lV/Siqoo5toRSutjfI2Jv8
         /D6hYFEn+Pt3y1moz58kiGV5dGHzU09m9ggs/h6aoPXO5GcwTw6AFY8sNV/IfgYqf03C
         hy50/Lt8wXqVoXbr9Ka7WyMmB6wnICVi9HKVi2I5+ZSGZ4bUeMdhwV1HxgNSspkFPQzl
         hlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876806; x=1697481606;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxVOZd3C3ppqYjNmukwrdUncP0WHK7JyRq4ciQhpawI=;
        b=KMDnUafKx0kgWOv5OfCt2y2x1d+ZfQLlj631/GgaLidwrFAu2BGks+mEQIOXHBB05p
         d+loU7DWKhbDEMpOnp65v2uKLpT3AG4/LojQP8hUw5HyjN0EINvLbH/KH70uwwz6gTTq
         42sNQjBdhxdPHFWXHU/og0WWcBPTAsnqzzAL6AZTec3c4s652Uw1n5/WAJ2s04FKo4qE
         JeEIemjfC1tGoAq8Ah+bLQUFDirT7lBcd4fwi9i7rTWexx764H4pWy6szvWIUlX1vJeS
         8QKfYp5M0+WObRE7/I+jSbicey4S+wpDi+c5bbTEHU7RacLIbOhHT67S5qLZ+a3mNHMn
         jOMA==
X-Gm-Message-State: AOJu0YyGwekeeetFvH4Xyul1tXm6AVNLiPOQtrdk+y4UWV93ZQzZiz8C
	9XqesMk9aEJq6a5BDWd13IPni5mR/0Sn
X-Google-Smtp-Source: AGHT+IFMZAJGeAEJwTa3L5Oxs6LsX8RfIY0fXdSBO9/RQSc7uGeMWt0HmEUSALq3ek1DTJsNNu1coZWFWJ50
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a81:4c4b:0:b0:5a7:b496:5983 with SMTP id
 z72-20020a814c4b000000b005a7b4965983mr17187ywa.9.1696876806075; Mon, 09 Oct
 2023 11:40:06 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:18 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-18-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 16/18] perf trace-event-info: Avoid passing NULL value to closedir
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

If opendir failed then closedir was passed NULL which is
erroneous. Caught by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/trace-event-info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/trace-event-info.c b/tools/perf/util/trace-event-info.c
index 319ccf09a435..c8755679281e 100644
--- a/tools/perf/util/trace-event-info.c
+++ b/tools/perf/util/trace-event-info.c
@@ -313,7 +313,8 @@ static int record_event_files(struct tracepoint_path *tps)
 	}
 	err = 0;
 out:
-	closedir(dir);
+	if (dir)
+		closedir(dir);
 	put_tracing_file(path);
 
 	return err;
-- 
2.42.0.609.gbb76f46606-goog

