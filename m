Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F77B4401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:44:33 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-33ef3e5faeeso28559727b3.0
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=qbxmvtg31vAuyTVNdQtLAo3hOGlbGiTSIFXCXMg0luQ=;
        b=YiNeHiEQB7ZT+byLDsP6gzhAxj4qOcjGxn/TRpfE7J5uDFuiRDDfDWXwSNYZMf71ii
         A042tDGS3mpdCbthoHOppHcp8csVsnoDFYj8uc6vICZfkDKq6ExaozYty4czWI7Od2rm
         rqqyt4D2tilfzdIguqYFmEmgMQUSCyrZllDJTNi1x6gPLiUh8K3O6SXJ6cPf3yMWidsQ
         IITf4xjJM6BQNoO8wUGCfIeOHnAxA4zzC9sC3gH0blsa/anyMgCupQSLxprb9f+dw9kP
         H8qSSU3Gwc46qrepxa0bpb552AkXWP7nh6/fTVf57pE2JAc0X2yzdujYaGSYq+iMD4No
         Ev3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=qbxmvtg31vAuyTVNdQtLAo3hOGlbGiTSIFXCXMg0luQ=;
        b=ehDPo1HZzlvyeE8GdNy0WszlS3cjDer/C20VxGs3gt4APMLtDtEEgsn4+lemViwnVL
         9urpwMm+mvslfjT/45XTM7XbqG5f7HqGGzsUbApiCfEhLdFXZItHoSceLyrrJToIovTO
         ll+aJcjZcrgHJnhW9pdonWJCu9OBMedXdvHmM5kjWoZDfda1UUDurYWlwvPBSqBJ25+B
         dh6vGhHn1dy/0nqCY3mZY5TUwVjXfiWwQc+omZEPFpcVuAuIoS4WkjKkmeBF2gQagErc
         AbhvPc34pG37l9Z/qefQJJij3wQbZfmQGtrbOhgECBwsVtDuoDcVRHq/6R+zPuC02qy+
         vKLA==
X-Gm-Message-State: ACgBeo0td6em6AjRqHvwSs/DbQ7lStKzVQ0iI9mPAb3kS+RCHgtKjV5t
	PC/YJdMXr2UhBh60J4Qs/vwcAg/7sDUh
X-Google-Smtp-Source: AA6agR6GfpMi/GILI+QpU1U4bPsd6a35OdbU6xCyVP9TE8SbGO9dQ/L4McelKKt6Ipqvg8tKYdc1sXGi3MSG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a25:198b:0:b0:690:65bb:9416 with SMTP id
 133-20020a25198b000000b0069065bb9416mr510164ybz.142.1661532272130; Fri, 26
 Aug 2022 09:44:32 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:34 -0700
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
Message-Id: <20220826164242.43412-11-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 10/18] perf mmap: Remove unnecessary pthread.h include
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

The comment says it is for cpu_set_t which isn't used in the header.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mmap.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/util/mmap.h b/tools/perf/util/mmap.h
index cd8b0777473b..cd4ccec7f361 100644
--- a/tools/perf/util/mmap.h
+++ b/tools/perf/util/mmap.h
@@ -9,7 +9,6 @@
 #include <linux/bitops.h>
 #include <perf/cpumap.h>
 #include <stdbool.h>
-#include <pthread.h> // for cpu_set_t
 #ifdef HAVE_AIO_SUPPORT
 #include <aio.h>
 #endif
-- 
2.37.2.672.g94769d06f0-goog

