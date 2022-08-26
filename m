Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E509D4401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:43:58 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3328a211611so33501947b3.5
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=ACInBWBwNvRh9+ZIkz7xZW+D59fAbxI1HNUoQj5EwTw=;
        b=A0ERzChba5qfQmN7t7ZnM+aWwRGaH2/CrJK4ga0h0ake/rNiQ1IkyR3JmXhJrMT9a2
         KnHqRjX6PAnDpWoIkW8DOomTPRLzc1TyRbC3t+/4APWQ++yOkmcb7vZpIh864xKc8YkK
         TXueOMvwyqUW3p/H3jsDEaZeJ+ManaFKIw162zxrEZglv7KFe53adPbLvLotwONtq3m/
         VkC4OmR/ajX51K4DFiENSlLRlXTjnnPJs3yS3cx54uVvE0IWijCmALy9ppEdFbi335dQ
         oYkX423X1tMjhhM+hPZBMshXdSCABfYwEL8duHu/C0YW0phgba8d6AjJngM2mSDJoJtU
         Qqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=ACInBWBwNvRh9+ZIkz7xZW+D59fAbxI1HNUoQj5EwTw=;
        b=qBoYaQsYrQQ1eK2gygs9zG505/H+ZkNOj0xUao6j3g51cUaMX5VArsjc5wMAgmE+K8
         XEV16dC27JTTnOrp7ozbdA7/uvYQx/abPTutDG0weMTbfAFMjNx8ODZiCImu6DA2KJj9
         oVtJrqW0qAw6zgjS9dZr2BntFEsUBmEZ8pvO8g3ZyKYlQetWgPYdMZF6it60KpEno6HZ
         DcinhLo5QwjVOYhnPDoK/4Nvsi9hOH7MoJyaGTkyNQG0+PAMcAaTCcUYcur9sSLLmsih
         bbPH+IywSghQ27wFeQdTNo84zWu8/DieB9KX0Asl8Jzexq7/JhLuG1fkkWK71yMnWrxS
         mvlQ==
X-Gm-Message-State: ACgBeo3bonDS6H8UcUzKXNamFHgfO3K/BlpVmh+MRe3KN4ZuOG5eJzNd
	ze2f3RLjnUsnHPGRA0A8ORz1KicOOfvl
X-Google-Smtp-Source: AA6agR674nFvhyZ8kZZpDZ9P2qEjEXJiLqOtFWE4EU1fMUMemGrNgewnTe7bwqftGS+iFizSaZUFrMd6XEEw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a5b:6c7:0:b0:66e:3713:9929 with SMTP id
 r7-20020a5b06c7000000b0066e37139929mr535950ybq.34.1661532237966; Fri, 26 Aug
 2022 09:43:57 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:30 -0700
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
Message-Id: <20220826164242.43412-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 06/18] perf lock: Remove unused pthread.h include
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, "=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

No pthread usage in builtin-lock.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-lock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index dd11d3471baf..70197c0593b1 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -28,7 +28,6 @@
 #include <sys/types.h>
 #include <sys/prctl.h>
 #include <semaphore.h>
-#include <pthread.h>
 #include <math.h>
 #include <limits.h>
 
-- 
2.37.2.672.g94769d06f0-goog

