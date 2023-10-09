Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBCB358B0
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ANrZASXd"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f7d4bbfc7so77504437b3.3
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876801; x=1697481601; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGxcidzGPRegna1u1K7BT077Nrlph2dhlmMJs3FQauY=;
        b=ANrZASXdPL2E5u/VDNmCrTQKNizdD0ZmWw5+He0hceenXEjXT3v0dDupcZYc6Grp3q
         VCPYkQfIJBdGW/G0GUrxC0/9uNgnkccRcEZ9TS+PRgAseIN/P2tJGh6ipuNwuXW0RvAe
         NsEslWo/foFUoUdcQ2P+0IWvi2pgcVDKoBMalBAz6vfqjv4U3Dmyw1skb7Qy2htuteiN
         sBwUMGBykguu9VQ9nbX3CTfDyFDE1DXM6CvY05ZR6nIPslK6HZypBNzK+YfKAu0FyPNA
         aKiukL05ZjZuIbpXm4/ZHkI6DKd8VysT6zZgI7N/Q5eMqKY5AWKyCgjcI0YG5kNxDZqa
         cqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876801; x=1697481601;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGxcidzGPRegna1u1K7BT077Nrlph2dhlmMJs3FQauY=;
        b=D7jpRW0DjpENLtR6gt7qqy7T7T+AvoK+IjL17SCHNliIs80TzmtesyW/Y0VESfKUd2
         el3WN4raXS8ETYurNgp38FlHDCt4LG9ETt0c38w53Qm/e5ruoKN0LsN5CmhbpjlHL6/R
         bc5F9RAhwmGrkAtT+5nm3QsvPmkJhVpSICM3t+pkv6aQjs9Q8+2w7wUU3NIiQMZapP8n
         z0duFXkuYVij7UpvJgstA+cSMDUF+ZLsH+eynp25XNjNNB0owM4Hubg5ogKhkRASnFEX
         7jiy7pPWPWScT7YYj3wtvr1WalHOD/+n5hZsqKSn/PSSr0X+FaKe5j5yVfpnydECQ39L
         aBbw==
X-Gm-Message-State: AOJu0YzcfibDSGKfkSrf4Du+LIEWYB6D+PLaKHzLKjA++mKXglfagKT9
	waZbqlDWZ0jKHdCIMF4H3/wXe+fP6LWj
X-Google-Smtp-Source: AGHT+IHv/D+bxgRzhvH5SJtdaUWM0vtK5Kcw+aA2tiW8Y4QaDfmm5vLlI9ULokvCKbvDQyU/3LpdJsz6h2n6
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a81:a849:0:b0:577:619e:d3c9 with SMTP id
 f70-20020a81a849000000b00577619ed3c9mr336831ywh.10.1696876801567; Mon, 09 Oct
 2023 11:40:01 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:16 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-16-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 14/18] perf parse-events: Fix unlikely memory leak when
 cloning terms
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
2.42.0.609.gbb76f46606-goog

