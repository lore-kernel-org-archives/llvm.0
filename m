Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5243A8E
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BW1zQoub"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f61a639b9so22038447b3.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547373; x=1697152173; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XtYWHIWRia4V/bq2E7J5Z+6HzWlGjlCMeDuedPRX49U=;
        b=BW1zQoubwG7YKBoST7V6DACShuNuo6Gs76m1XbwA7B6X/z0H0T8pIsOJckNMe1nyiL
         Vzjc3V2WikDBNVxmAcktEHeDh3V7t0rSa44qxbZdw0DacgZtWTGdZkQcVO/Of3BFIB95
         Nu5o74qHrLQRo0UH/EZDrvXLAH9W6wo8uwvxQS2y1n0j8/idoKmZ1jlhBKUuCA+CU+oI
         o0xFHOEBtwYmyl0jaQTWyRAWOdatz1sywUXWl5eAYfONsPOezCSeZLfIr/5U2FtIzZ/D
         nEWhKpqPHI2zcO1kP7YzAHn0bpwPo+UZ5TrJCtVpl3w9Ri6znF/pSLRV1n19N1WfBtvi
         gPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547373; x=1697152173;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtYWHIWRia4V/bq2E7J5Z+6HzWlGjlCMeDuedPRX49U=;
        b=O4fmbX0MnIJvX2a0qp4EQZqM1AcuYzuR0Oh0sYsZ5B9xmFgB0JH9GpO3Nk1u5e1FUf
         ck4h7FUCY/G/wUFW/DI2RaeqCCmv8t+VNObnb4KJWFjR4TLipUwj6N43L/MIoSoWQ4is
         orE02ugmzEhyFascGGZ7gnhzPqMhjmRC72xvbW0ulkgTV9UupLvVl4jGvTkjaxeEI/Db
         VDCwKHfGTtmuX9HS1AdbW840ZlZFagFePtHXEh7FCQ0TYWQ2tMR4iW4cUC3skGMe+Hrz
         xjJggIRU6+ktfuzVh9lUapMCsghT/sQut3RPToEFEu2rvhswhpGRzBjSm4OEJ4m7xwqw
         p6bw==
X-Gm-Message-State: AOJu0YzYu15xpdnzoMciA+82l1a0VOSl3iO0XK59IB3OnPT+O+DVgpA8
	EFgXX1qeBND7tL26/poLu6Vix4TlJxN6
X-Google-Smtp-Source: AGHT+IGYGvZnkG9pZnldPftjX0X/I/7GYYCZctlrfJO2uLsaOS59cFuWhBo7VZbssurDfKkKblBviKnfkqu4
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a81:4325:0:b0:59b:eace:d46f with SMTP id
 q37-20020a814325000000b0059beaced46fmr114023ywa.8.1696547372891; Thu, 05 Oct
 2023 16:09:32 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:48 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-16-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 15/18] tools api: Avoid potential double free
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

io__getline will free the line on error but it doesn't clear the out
argument. This may lead to the line being freed twice, like in
tools/perf/util/srcline.c as detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/api/io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/lib/api/io.h b/tools/lib/api/io.h
index 9fc429d2852d..a77b74c5fb65 100644
--- a/tools/lib/api/io.h
+++ b/tools/lib/api/io.h
@@ -180,6 +180,7 @@ static inline ssize_t io__getline(struct io *io, char **line_out, size_t *line_l
 	return line_len;
 err_out:
 	free(line);
+	*line_out = NULL;
 	return -ENOMEM;
 }
 
-- 
2.42.0.609.gbb76f46606-goog

