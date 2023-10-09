Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E437C8D
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwNag9vk"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d8486b5e780so6194253276.0
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876804; x=1697481604; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XtYWHIWRia4V/bq2E7J5Z+6HzWlGjlCMeDuedPRX49U=;
        b=HwNag9vkviVl4BDeVL26zGCDDlGH/8GqhKtUOzsscV7Xm7zuW5oix6XCiq5l3U27pW
         oAAOtnBqYCJTqn+daIT9CDiV2jG11xq0agKI65VKVh/GZY/fSBogifikEbANqsKBhzJJ
         RFjrXVIoJVOL1Mmhd94Gn+mRyuQ6A4+pnvve52/CdKSZ1+Jr46FDQxdUqctbMLOpfhyW
         uyYKs615zogsU/8mDYm8jCpbcfCk2+Jb+NLOTwJUBRfJbjde2rMggLbhjs12HOpisDkH
         +0fFfbGTZxnwEpNAK2egrcKbFBww7KwaLTovl0lJjQw29PeleHlF0XQti91lNkcqPw2u
         SNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876804; x=1697481604;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtYWHIWRia4V/bq2E7J5Z+6HzWlGjlCMeDuedPRX49U=;
        b=lKNVesw74S0DvjnpvS62rtW9AmPkYoKZbEMrbM2NkaSadxZ+JKOC8T4NrWAb+WAwNM
         /DDWFNv9GLI0fZmgvfpdHee1Ak0rjryaabnoxkGAQQVXw5D0bdOkoC6Jn52Vslovm4Oi
         EpeYr7DOENKyGiVplZENq4/XjDfslYXOm60qrcEdes0YFGMAX5kc8fQ7LnxkUm5h7WPm
         sT+axrqp15ZqIAJ27WVhaob2pn9a75zkXhXlBO4RUPpXatcRyaOutGKcbsWWU2WtV/Bz
         YoI1lUuFcKgco9lYHC89KdfWQE9jKgI4hj3n3kQUR09EoHbZrRfBNW7wjfyD/aEjbk98
         dRJw==
X-Gm-Message-State: AOJu0YyAFqjFvDJzOLTO3AqVtgFfXfXtdEprZ9yYUGvRwXOf//rZfo++
	y+BhOFxB5sYwmiiMgbmMpG95gCcqp7kB
X-Google-Smtp-Source: AGHT+IHj2trO5X4U/SUmxlgPq73m36ZDVXtEdZOb0YxcbPMhp9sufjSs2X3h92EpXqMkEkqGWjW3ZR1z54If
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:ace5:0:b0:d81:90b6:cedc with SMTP id
 x37-20020a25ace5000000b00d8190b6cedcmr248454ybd.3.1696876804016; Mon, 09 Oct
 2023 11:40:04 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:17 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-17-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 15/18] tools api: Avoid potential double free
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

