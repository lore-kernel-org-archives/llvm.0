Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF9281B
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:11 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d848694462aso4381994276.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447371; x=1696052171; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=No/3+lDiHVKRYv0Xt55G/Z9T7NmlV4cHNPo/aHaSm7Q=;
        b=xpNWdj88prsaXoPWrHFyR04L/gWh0NiF1+n73vGENaw5knRLtT3SuOn+BQdo1M5ZFO
         YeaCRqhh5Ddrynemtz4lC63p0aURGLZyrgHEhl0Q5ZuPH+5ZmIJlXjKLJ0hbXOwRsx4F
         hJ9mkBrydG8Yc5d8SI44Q9poIFodZTo6bzyU1mpB4buQN5Om0PHEGlVrrrlQaF3P3QoJ
         8suvgHgs20ppQnhGSOCpSue0W/7aeHXv8GqOM6ZW7PHES8B13hTQJk69r5iz2BaYXAqI
         dEA9VSdohxtYOnbiLQqUvKsHlBwiXafz3aagKQKSh/6zi3+5PHsOY8t3HMxOKD7r7S3I
         y1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447371; x=1696052171;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=No/3+lDiHVKRYv0Xt55G/Z9T7NmlV4cHNPo/aHaSm7Q=;
        b=Mn8gjc5tB7M17p7hIkGiAr9gNpESCN/Dv7PmxeDsVGK9BjybKAYkfZgUIPxfYFWDZJ
         WVShIIyX36tR/57jXJAuAbYKap/fbs41cQoix2kZ3RjJEOvdMCo5732FAPyCpsuyGrA0
         7Xq8vit729ZczNo5/RMNOmF3SVq2wH62ra7uBsMw6xIRdeMl8AEmfRnXbX2HXQLWJ0CF
         WdPkmurY/PW2T1v2+aMkcjZuiGelruAtuCLbt2mpRfHMDOMH7uduJ1KEpNULtYTOeESO
         YcDiBP65cS1UJnOCfV7n64k+QEHfyzM2vkH9VA/clmyOzuS9xbgZqvDjLSV/GQROunjZ
         MTGw==
X-Gm-Message-State: AOJu0YzUv0I9dnM7MeaxhEhZzOs3BbUP1BJJkn4bh3s8M/XkcuYJy8rG
	l1n4Rq4daw1Yr0AzgWADnsPo2ua5RORR
X-Google-Smtp-Source: AGHT+IGTM7Q8b3Ag4UtuwSpXj45aoEr35j9RQvQn4a5/8c4Gp7fonCA3U33uv8sbDogl59ChOBz4GGje4Wqw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a25:8d12:0:b0:d85:3ef:a9d3 with SMTP id
 n18-20020a258d12000000b00d8503efa9d3mr13253ybl.0.1695447370739; Fri, 22 Sep
 2023 22:36:10 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:12 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-16-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 15/18] tools api: Avoid potential double free
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
2.42.0.515.g380fc7ccd1-goog

