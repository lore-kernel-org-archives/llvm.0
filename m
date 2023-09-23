Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D172B7F9
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:13 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f4f2a9ef0so16376247b3.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447373; x=1696052173; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUz0aBRZdXV/HoyCWN8uhHLmcq/r3toZQGl1fsyAqS4=;
        b=pMIx4GPWvBO4KjfLGzxyquL+u54n04uk07m3RfnnQa95ezxzHOl91VNokfAILixHub
         rFLPgtK1KcIot3TQU26i2FMpB/onN8K0PBbDjQ8bEfw/LXCZ41Ff+bTjJJNp4KFKZWqx
         MtbCw2s2oOQBE0eDuiJL/PCF5UqpR5RzoGzKsV6R69mXnQgcNyjj0ztftC/fGbZnQt1L
         JvjqxzdxE26Mf/xQS7tTQOvvefpxbniXBDL4iSXnu+cO/IbliUcGk7NRYF16lf0NSnoi
         5O0b5xOG8Oj/cLx7+pljuSmnGKft9Cqhzv7vkMOFG0+giB+t50QEgRrwecasdQ1w9szk
         dI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447373; x=1696052173;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUz0aBRZdXV/HoyCWN8uhHLmcq/r3toZQGl1fsyAqS4=;
        b=XJlgrxh6newVdtEFOBsIeLCR2dkHO6xnPq4W1+FsMDNRSzVNANKCerFbCufVaN9nwf
         FLyCYriEeEEdQzNbntvKj3QZrdqO4+hWzstv93NBiLcyubjcsneamghPicXhPuF4MdUD
         UBUHciKzEA0E65WaA0Qt3okWdAGY067DnWLuOYT75Dg486fTXeKc6C/nkQojp04MzHAz
         CzFBkFkvL6enqGQ21FaZQJa9RNdr5uw/hcykhNy86Ufr+R2xINTsJHGw//IqyCQCt1Cw
         YU4hVOrgdxwSko1UgCCv7FHgWCnIoCsadtcTgAWUy0Ik/tbl3pmaMlr/vExkP5Xku+1I
         hbsQ==
X-Gm-Message-State: AOJu0YyRkyXgoyp2msgXexfeSnrWvgmjSCrlG0xc4iSy2Tlel/w5umTc
	gn3vh/NgdXeJprDoHqJgymodbc1bL67q
X-Google-Smtp-Source: AGHT+IGBnACIcG/dQO74ULFKTr6l4nsrfL6I5S655YMfy6NLsr0dzVgpJAVXl+mmfzsp/SPWCJX2H8Efcow9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a81:451d:0:b0:592:7a39:e4b4 with SMTP id
 s29-20020a81451d000000b005927a39e4b4mr18996ywa.6.1695447372993; Fri, 22 Sep
 2023 22:36:12 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:13 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-17-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 16/18] perf trace-event-info: Avoid passing NULL value to closedir
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
2.42.0.515.g380fc7ccd1-goog

