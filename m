Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7867E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:40:02 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3363b1dffa0so298909397b3.23
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=TZmRLUQ2d7TXmU69l5rNy1CTfW+D1QluUT9t1SCPaRQ=;
        b=kFt2a2Yy49Okrz/AcL9NH0j2SCcVEr5HYilUar2f5s4z+KrAYcuPMJoWRKa/Ojk36T
         lB5tOBCLgSmTIjGoOfko2hIAK72mAG/d/XUQ8trQS/ZWIB6jy+tUTZ2tW7JByu6gVYiG
         vNMAF6YcK/jQBjarFtGteespzwsMUho7CExNdhqE0dyfv/EDaHpnfkl3GVQojcAA4DfM
         K72V6rhIwSigCRpIR/FsB6JJTjad1SMHnU8dArYTdMvDff9QXAqtgMawgLXU1+w2sXil
         dUkRiqLK61LuM6M9TRY117nOmUvxd6/sP709qAeQXzl7oPwLK/dCCpVYYh7KI3Od3spX
         Kmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=TZmRLUQ2d7TXmU69l5rNy1CTfW+D1QluUT9t1SCPaRQ=;
        b=vITSO16ehlWJi12oSv7Dp8cJB6D2FRwRypErU084dlX6ht0NBiDVv1zcIaSrv2Ouse
         D8fPDDd0F11ejCgGLZALhkdZub7LSt5nKjWlmzRcBc09FtAAIqLYbtVii5Ua05rrKOcl
         iG8wTmuScHjBxs2zP9/CkDNkkFEBJapsc83k8/1uZk4gdaU9Ke7s6FYMxtDpn0hMcfuq
         /WQ7UWm4vCJ5ja6viGnQXO+0Wg51g6KQsHfwWhRTCg0J+4plW4k43wZPKjWT9LyVZMDg
         wcrvu/DrhlRLvFJm8aJOKnGiKcVb9JOmEqvW+uBWEyz1Jt22F+RAarbQzuMLu4/IwyVJ
         GiCA==
X-Gm-Message-State: ACgBeo2t+feJeZejtU5k0LNrOXJ1u31NztTNsjm+ERIU19uLaDe4ZD44
	G5XLIsLH7NhWGaThsT505R6UxCWjDMdy
X-Google-Smtp-Source: AA6agR7s5Q11LLmEK7bhw9Jv7H9t6qvpGnpsnE2nnoN8CK/3a9IyLjfDH+89vD4ezWXEjVj5AiIRBQMtdryR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ab82:a348:500d:1fc4])
 (user=irogers job=sendgmr) by 2002:a25:d4cb:0:b0:68f:6452:57ee with SMTP id
 m194-20020a25d4cb000000b0068f645257eemr26553234ybf.609.1661355602414; Wed, 24
 Aug 2022 08:40:02 -0700 (PDT)
Date: Wed, 24 Aug 2022 08:38:49 -0700
In-Reply-To: <20220824153901.488576-1-irogers@google.com>
Message-Id: <20220824153901.488576-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v3 06/18] perf lock: Remove unused pthread.h include
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
2.37.2.609.g9ff673ca1a-goog

