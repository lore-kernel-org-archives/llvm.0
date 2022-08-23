Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165CE5C91
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 22:09:59 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-334ab1f0247so259156357b3.7
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=gT8uGhkPz2QVnzj86f2E281NRyIthHuKkag96DoN/yw=;
        b=HwVO7m10rOh/3z2v+99/vN50dBJN/AH7VMgWiBoZmpDohvsq0tBv5/cTMrlymx/MOp
         NzjiIFBvO3kC483MX3eO1YhzMufbSi8rArxF3hwBN+PRxCigNMkJbuHJp1BpgAsYcGtK
         xMMP9GOnGVEC4usMZ0z8NM9+PnyrOkUSCUhuTQTwIlFDxLmDOuqdmfqRQejdBzQCpOHP
         RuKH3kz+Nc+u5yio8jwIrQRyc+WxLBygENFC3jryDaUBwb3cm76KzzVe7qDK2mur2ERK
         vY4M/iXJCWauvG638kIRnVjLoGxefxSYN1WBVRPEmNHY21KRJo6fLu7Vs2S8ZGuZ84Pz
         raYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=gT8uGhkPz2QVnzj86f2E281NRyIthHuKkag96DoN/yw=;
        b=z2ILNcAcpd8yYN45SBddWcXn52XQcA4lHg6nEDYBpQrgEE2uIEvdvm9+jMtPKkKaa5
         ITkGVT5JT3f1yPNsA0t42XAM1xJBu1XPDTHdjrx5Vj3EKWAtzUI8o4pDQYe9WIiRW4p8
         UFzvxp0MQAfD6HsWTne/S+UWshuAVpOFO1Uuo6woCwMoz1zfsweCMlsTrFveeA5hH1xY
         UkJkA1E+GALmnz8jBlsCIAkiqhvpuFokb4V6aMIgnU7lDOBqwvYcsIP1AI34oekOUynQ
         fE9uBoAyL/gx+xud6zx8B1duSLLNpd6qLSZJnHLtQiXPEKpXsrCS6dYKJLXxEswHchRj
         Y87w==
X-Gm-Message-State: ACgBeo2r3kOkXuEGRrUmdWGnwMO/7lIMKLYz4FgBy5qeQfQwt93Hk5LS
	CnPcoq4P+NapV72rODjx+ttuwYzO1XLv
X-Google-Smtp-Source: AA6agR6oFWKl1LddABFgQgXo6ykLQYEDKjNJ/iL3zLeafkrEI61E24RPG1snXZgYhRAfWO0hv9++V5PTY/iq
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:7dbd:c08f:de81:c2a3])
 (user=irogers job=sendgmr) by 2002:a81:8003:0:b0:336:be9e:df56 with SMTP id
 q3-20020a818003000000b00336be9edf56mr27645979ywf.92.1661292599033; Tue, 23
 Aug 2022 15:09:59 -0700 (PDT)
Date: Tue, 23 Aug 2022 15:09:09 -0700
In-Reply-To: <20220823220922.256001-1-irogers@google.com>
Message-Id: <20220823220922.256001-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220823220922.256001-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v2 05/18] perf bpf: Remove unused pthread.h include
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

No pthread usage in bpf-event.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-event.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/util/bpf-event.h b/tools/perf/util/bpf-event.h
index 144a8a24cc69..1bcbd4fb6c66 100644
--- a/tools/perf/util/bpf-event.h
+++ b/tools/perf/util/bpf-event.h
@@ -4,7 +4,6 @@
 
 #include <linux/compiler.h>
 #include <linux/rbtree.h>
-#include <pthread.h>
 #include <api/fd/array.h>
 #include <stdio.h>
 
-- 
2.37.2.609.g9ff673ca1a-goog

