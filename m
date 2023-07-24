Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C101094A
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 20:13:04 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-583a4015791so29872637b3.1
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 13:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690229583; x=1690834383;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hkxh9LqcegTaK3Zyb2Y04p/jheCyz+iGuZbjHft5A=;
        b=dFnffByPi/9dPdpPXDPeErJAHkm4U9xmJEkUxTK523YIBmo/FhKa35iXauOduV2Pif
         qhrvAqczwoe1kO5YrqsE4HVa/uBo3+8dpoYCh3NieWigFEDe/IVK3O6HH6OdtI5i+ZM+
         2KRDhnab4TtHa6Xfwmg8rPe40dTtSGrCgHfS12vvP8ClkpFCg2qRBovuROUDtaY7RgGC
         rq6iGpbsv+MFoUANFCBaKzXVulRiJgAxltKkaziWxEl+HKkX9SEO4FlhIeLqgOjRtUd/
         7j9DqAayTNnDqpM5MrM1rjP74kQsTEvcd8AjHnDSeFYehB/V4Gfm0pF0X93t3kqOaUQl
         OgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690229583; x=1690834383;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hkxh9LqcegTaK3Zyb2Y04p/jheCyz+iGuZbjHft5A=;
        b=OGI64gky3Ickay8tvvoIaANRhVin7paT8LeKwG6DPFb6AzOCHLgOAixb3QEcolnHyJ
         4IfimSsFH99WT/Kzqz9EaxP5sKGL9mJ7nV9SctKcIoAvCb+VyRHR9zz4tlypYzdlVJ73
         lHnKbHw3yySdMTWAv7l9SMmF4eMGx+OutOhLbOvqtItfInUPD+B1sKOQs3PnTvQATOa0
         5CY7PMVq2GqrC2ZIpyLF3yf2POxZf0nkhfx4RENevK04Q/qtQP5rM1vwpWN1e+JNb1un
         P3KoGT+rLXNqlYt+6gffnNleEbbNTc24H9CXTr1YFLdL1HkpgZCi6qfXxWD2EHo50F/i
         RHZw==
X-Gm-Message-State: ABy/qLbKNty4+bcgCZMPRGQ8tFM6rolHuOj/Qngr5jAHbkbjfSB362/A
	e7yQVXJL+IzJt8nS4Iyks+CUH6IQXU4C
X-Google-Smtp-Source: APBJJlEcBOZe3u432ZlnenysdB3kMfqSv4wJ57ueFyPxQ8WNtoVZQq8B8/KVokgcDdDgdzCi3rPmRZZpci+e
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5724:8dc0:46f0:f963])
 (user=irogers job=sendgmr) by 2002:a81:af21:0:b0:56c:e585:8b17 with SMTP id
 n33-20020a81af21000000b0056ce5858b17mr70674ywh.5.1690229583398; Mon, 24 Jul
 2023 13:13:03 -0700 (PDT)
Date: Mon, 24 Jul 2023 13:12:47 -0700
In-Reply-To: <20230724201247.748146-1-irogers@google.com>
Message-Id: <20230724201247.748146-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230724201247.748146-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Subject: [PATCH v1 4/4] perf build: Add LTO build option
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Carsten Haitzler <carsten.haitzler@arm.com>, 
	Zhengjun Xing <zhengjun.xing@linux.intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: maskray@google.com
Content-Type: text/plain; charset="UTF-8"

Add an LTO build option, that sets the appropriate CFLAGS and CXXFLAGS
values.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index c5db0de49868..a9cfe83638a9 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -256,6 +256,11 @@ ifdef PARSER_DEBUG
   $(call detected_var,PARSER_DEBUG_FLEX)
 endif
 
+ifdef LTO
+  CORE_CFLAGS += -flto
+  CXXFLAGS += -flto
+endif
+
 # Try different combinations to accommodate systems that only have
 # python[2][3]-config in weird combinations in the following order of
 # priority from lowest to highest:
-- 
2.41.0.487.g6d72f3e995-goog

