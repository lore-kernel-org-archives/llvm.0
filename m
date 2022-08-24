Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68D7E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:41:22 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3360c0f0583so296674577b3.2
        for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=GrPou0VZKgNlblC435aJ0/uQRkx4htFwsCEj3e4SObU=;
        b=N1o6OUXGC/iH2ijb+lNFnDPHgqw3EE+YVt/w/YNG5LZUfFDtYUy7DPSHSoCRfmQwJS
         GEW628oNDtiSEG+TR9DYt4rWnaj3cDMsOXnilUJ370jMbMm2KfNgR9m9Ztnive72kTrg
         OaXWIVL0131N9ESH7zWki2HFxKiH1rI35QiprRkAJ13BoDEnL+LlSMy/HEWT438XtiMf
         WGYAyjrFhnpcRX1qI2eaj3Tz+LyLgSHEugk/D/oOKrB0J9WujNMqEsCeVjZOH7UIoT9C
         YQYpw/2SUA7LK6rmLDDGa50cJB04mKuYyUDqd0YphGCt9YPiv0IJMleBR3DizoZje5+w
         Sv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=GrPou0VZKgNlblC435aJ0/uQRkx4htFwsCEj3e4SObU=;
        b=MYzUd8Lwgkz/xTQwkbek/nOwsouJH4D7cpUcwgZA+vLQVFFlYy/oMe2pr8ChKaPJsc
         ObgQSdG69vEOAop2hVUTdpZTXAY39BBf91c0zv13cqNCUhthxExp9rNmHF7s6FF2KcrW
         JJt2oaAjrrH4zUusZ3dQF0aTTMcDBoTwmMLBjokHd06JL3W7SywMVLb7MGfzUCUhhjSy
         K4Dv09BUh0W6FbKs3CdScHVupA1VgyNiz9sjfCKlAmMvP9YJ3ENmFMq5DOcC0+jZz+kV
         +ywUekvFAWnVuLOMWHQpFgcVxcoslg6SPZrt7Bq9v2TAkloZ5hMY+E0zFE0Y+ez4MsUw
         k7Zg==
X-Gm-Message-State: ACgBeo3+NG8yY/OVNYbOJiKy0NyYqJI7x7OiP5pYJLnGK0OkGcW2PLl7
	ktsgP9Lty9kBhRbJbggBIArz4iYyLbkj
X-Google-Smtp-Source: AA6agR50UpqAJXTKM7Aszo8uGw/kXlrIkRrRMT0M2mPuVHtgbj+KdyX05ZLo/uA1kRbmgsROvLG/mEAHf0b2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ab82:a348:500d:1fc4])
 (user=irogers job=sendgmr) by 2002:a25:b3c4:0:b0:68d:d900:837e with SMTP id
 x4-20020a25b3c4000000b0068dd900837emr28057015ybf.501.1661355681725; Wed, 24
 Aug 2022 08:41:21 -0700 (PDT)
Date: Wed, 24 Aug 2022 08:39:01 -0700
In-Reply-To: <20220824153901.488576-1-irogers@google.com>
Message-Id: <20220824153901.488576-19-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v3 18/18] perf build: Enable -Wthread-safety with clang
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
2.37.2.609.g9ff673ca1a-goog

