Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5581B
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:55 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d77fa2e7771so4350566276.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447355; x=1696052155; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlidEJ2kQokrDb8kn7wfdV/NkutdZ64KLuYSK3l+lfk=;
        b=Yj5s3FOdbK0ifjIgpfPQ79Mc/xyqQsKVgpsNv31kPnO/10MfdTtmBK6V+Jk5UEqdp1
         ELv4yJb8ADtNoV9HK6l1HReJVLeTNbWtWZPr2sSBoIOQ5CbSQUF+uKClM93AVWpjDG0g
         OboamgRKbV/fdPQzx1vwF/NaILyJvjAKNBuuGwDM5uTPocmHmAlotjaFBQ3t7NnoRKNG
         QfJJwwmUutltYI5/7a2ynpbYnNfDjP4F+hesluCX4MC1VQXGs5RQUYk9WDFJyymUoIeN
         aDw9VaNrNhX2OtwXScYsJuyTxXdnu1zE4JrxupGNENVy5JT+KnIXQtebTzgQckcGdSWo
         hx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447355; x=1696052155;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlidEJ2kQokrDb8kn7wfdV/NkutdZ64KLuYSK3l+lfk=;
        b=X1Kk6pWfRjGXIg5REws/X1cC+VHk43wA75UPVx2oqdT5iGfnonpQjB2lv5AZ9Uh5z6
         j8+qD/56H3V0qoEnX7oeUzxuMzAxF6viVP4Pq6Oc/LOIRNhVG3CaRMHsc3R5Gu57i8oZ
         rSyzK5MbZmmQB/8RPuahY/p4RsHydYRLXbfyO95A76eKArNlQF8iURa7NaXezIP1HBst
         2J50N3QlQTw8ytvUKbnJJb2S7US0Kc9thO0SiMEZBdbRUELAy4Si6/TJxm2XZdHsBQhC
         wPipopggbMyAyGLnjrzxxeg5wpAdcbFr+/RwwjC5napepHDTfV4/Sxp9V8Sjj44yNSQS
         KfeQ==
X-Gm-Message-State: AOJu0Yy3XxgSoDqLQc5txbybcbt4zduABEkDNaIcJ9puA2od71Ux+uXw
	VepgtgATpe/qdWeZopizRss/D8vYSeg4
X-Google-Smtp-Source: AGHT+IE5O/1uW/OzbQMR5RN6Xnw5h1anx/RzV4ErZJvmavBS84pg85VIDix3s20OM15IyOeG9FkrtyFxdmAF
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a05:6902:161c:b0:d0e:e780:81b3 with SMTP
 id bw28-20020a056902161c00b00d0ee78081b3mr12406ybb.2.1695447354781; Fri, 22
 Sep 2023 22:35:54 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:05 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-9-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 08/18] perf jitdump: Avoid memory leak
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
2.42.0.515.g380fc7ccd1-goog

