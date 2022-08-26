Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96BE4401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:45:43 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id z22-20020a630a56000000b0041b98176de9so1083519pgk.15
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=LEHDHxAnksEJke5uXEgC/4fvlBz/SQBsppkh6XDSNgM=;
        b=VOV3ZeQLK7insFX0lmDaq/k7r0x4+Jx+0drlOcZW9Pv6LP/mYzLvuK0V5gHu4IDPNg
         7ScpP6ajmkx53bfkRHgW9E2eOmJonRICOVsrLq7phuLXrvQsXxvCn+Puthlbd0RbbYnS
         zpuYddmMpBGNF/36MnFOzr/XVqqv0mqIiQ7DrweQEyg705qhnfMhxDoIXe+y9LqU/2TH
         ypL7V8lMnlmDV6NGRaelq3C61ouifEjuRGuLYlI9pRk2DoqvtywHxYi0GRIO6RNQBOJ4
         vskiabGPN8iVem8p4lLLKFvfz7Za7a3SyeSXLmXq254dQDpKjmOfkLTri5SUDF4IUI7M
         j56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=LEHDHxAnksEJke5uXEgC/4fvlBz/SQBsppkh6XDSNgM=;
        b=P2MoKDY8evYPtWfJAFXE1QSyQzoWPj661od4PvV+ieE/QZ+waJm7sVrQGJj/OFi5ho
         vL9Fjs9O9rmJcdzU6faHQ3+JzTC1nmQ8ijPlH2c4CGBIFkDKFdz+EuFkrvFqt2TxUvjY
         PBoEwBDrou9XQ6qE3hI96U8ovLWF1uWS31y5cmCgp00WNOVhZZ1nYEbddXrU6FedTedv
         1YNqWGmi6MR6nVeBoCI+otfArf0rK80RjZ/5ZC8rksKpOfaPAP0hY9AnVmDUZE0usRN5
         yrOwXUcKaUoOVWG9GLHr2iu0pDDFOhp2VGNf6ERcuk0s4YLQIsYDCdMDBr9DdGg0nvPB
         RbCw==
X-Gm-Message-State: ACgBeo0QRCyx7izv70yPSybfWZPKyR4uIHGrFP09Of4CDathWT2lt8X/
	73A1adKEwdEPCt9XIc5UbausabeJ7xDQ
X-Google-Smtp-Source: AA6agR7L6xHhqF8ShRu0uc83vM8zveOXqQ0A0Wg+4L4tk7yuhmGODVT7+yJjTn80JIeNUZ0kDT90cFuI9sjc
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a17:90a:bf01:b0:1fb:c6c4:7dfd with SMTP id
 c1-20020a17090abf0100b001fbc6c47dfdmr5118986pjs.134.1661532343199; Fri, 26
 Aug 2022 09:45:43 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:42 -0700
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
Message-Id: <20220826164242.43412-19-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 18/18] perf build: Enable -Wthread-safety with clang
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

If building with clang then enable -Wthread-safety warnings.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index c41a090c0652..72dadafdbad9 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -19,6 +19,11 @@ detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
 CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
 HOSTCFLAGS := $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
 
+# Enabled Wthread-safety analysis for clang builds.
+ifeq ($(CC_NO_CLANG), 0)
+  CFLAGS += -Wthread-safety
+endif
+
 include $(srctree)/tools/scripts/Makefile.arch
 
 $(call detected_var,SRCARCH)
-- 
2.37.2.672.g94769d06f0-goog

