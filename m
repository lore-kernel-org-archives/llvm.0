Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD125C91
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 22:10:06 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-335cf0fd1a4so260857337b3.11
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 15:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=TZmRLUQ2d7TXmU69l5rNy1CTfW+D1QluUT9t1SCPaRQ=;
        b=XJdlmzgS/G5JBfz64SCGEvKo+qmDECH61tMA+nVEkvkjhvqErPn6we7JRZ3YTRjB9g
         sZBj7cabo5j8BoTz70VIH1o6q4J/BmSbQiX/1GZaCFQbtR4OR6jl27Qcflg0ASIvB2pn
         cXj5qngzepTVIfzGx+7wKUSjI+RWPVw7p6wOSURROtcw0Zz2mRmIVcYW30gyI6oDVuyA
         rBtwoxSBeWs6jGTk64xQrPsqirJPXfAZXGzwIlb3ZDEFqKuf8SnodQ3HfgnJNV6AN+KX
         Tpyp2Bq4TqzFSAROlx6kOHFRjKK0wTDXetElB7AzefGaOTXHAp8BURfCT5TkmiA8+IhR
         /ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=TZmRLUQ2d7TXmU69l5rNy1CTfW+D1QluUT9t1SCPaRQ=;
        b=HwxtctnP7GYGI4mRCQDzr2TYJeLGoxKnf5k6Mz2AwQCFX5+erxQ4FEMwpZE5VnuJUv
         uGdZoH3/yjrih6C5TkWsjlalb2jO5VYoAbuV0xHZpsOniqNcpomvbGi04N+b34Qvy2TA
         RBIJwcraHEbOpr8bmqhMgZP/RdTdh2LJkPIYd95m+O53iHnHFOnAyxvGM+QfFRYQvRqu
         vNsCyPeTt/5hbMzRopANbin347bEuphZ0abU8H4enpUznPAi219KDR6HcRkqdeSi3NFE
         4e/Qvql9WCsn27FzLk4/16nwN+MUpxEKwvU9w9sFk6BB8UdYi/IaMWE5Ke2Y/jr3rL8m
         TJuA==
X-Gm-Message-State: ACgBeo1LUwlMkkL4YFgCClm7PPiSr0YPQDUvR5p14rzYZuPXTP03dsf6
	tGXaV8qqBshdepwK9YtBCEKA/pB3D9CC
X-Google-Smtp-Source: AA6agR7a0VTxMqTg4C3l82b1BpKQRn7OO5P4Ch8FMwflD77Z6ASQKHyZ78AkmQHPc0XrIuaejBrso+emaXu2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:7dbd:c08f:de81:c2a3])
 (user=irogers job=sendgmr) by 2002:a25:2493:0:b0:695:839:3a5a with SMTP id
 k141-20020a252493000000b0069508393a5amr21422493ybk.468.1661292605692; Tue, 23
 Aug 2022 15:10:05 -0700 (PDT)
Date: Tue, 23 Aug 2022 15:09:10 -0700
In-Reply-To: <20220823220922.256001-1-irogers@google.com>
Message-Id: <20220823220922.256001-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220823220922.256001-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v2 06/18] perf lock: Remove unused pthread.h include
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

