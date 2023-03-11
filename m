Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8027B
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 06:58:35 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-536cad819c7so76943117b3.6
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 22:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678517914;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PA482r9MJe7vZyw+QOZf0rTvnugvk46HQTM8cqZhnKs=;
        b=tldDHr30uJ+HiUcXonL+iNvGzmn8jN/lqDwYD7A6znThCex6+p0hhXyH2E22r7ju24
         AKhEubUuV2ehF+HSJjPO2WNGupZA5GO3JpYAXJpNraNPd7wa27oEdnCM+YdBFgcv5DKJ
         AsIoeg13+loP7lUeb/pjdh0s/uGID0gWNy3wlLtGsAkG6jn5JPbZ92vQKHkCzzWl/2Za
         3MiqRrVtE4tceeZZ4X9S4TCY0MIHrZZCPHVUrf6aejhC2/SbfwSHLPygjhbnhP0J4LCi
         EKXq9nuSRtoMohBRC90vWQ8ldGj5RPu0mlDlZyx4M/gBKozzjbEps+beBWrfCdTGndQV
         SKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517914;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PA482r9MJe7vZyw+QOZf0rTvnugvk46HQTM8cqZhnKs=;
        b=QD7IYX+nA0rcH61zl1SVFtyv/yNmGglcb4p/8n21Jo9xdicMD+2OJwsefePfbueFX0
         pcsV7sALiCDbPW9hu2+DwH0U3v5Wdw2H/edFgq5/wseyFnVAWpGdFk843aDdF2jCyaDz
         W2qKwMeXq2DswjG88U8eNpMJ5Np0/aG/yjzW4Si6qW8FezRwmobIZ3lvktrYs/cTEcXg
         uHzHOrBFdJ5jYkiUvVjN8o/vrcAPS7HLtSUehI1cevMX9pV/0wkThAtA4EHU5g0LeVcM
         reCvvvSt+qC2m6CPzq6z/8qotTIPsEQ850aclmJS6h32dTUhXYZdCaDA8Mv7j5VaF072
         4/lQ==
X-Gm-Message-State: AO0yUKVWLTW/yjyZCfdAoHlk9Na0P7QUEDekN8W3viXJdA988hiESrBq
	Heg8hbbTbzepP6Nv3hcPCdAfwb0/dgFS
X-Google-Smtp-Source: AK7set9RA8SRXgCLcrsgukIbaEmnGpzcWQbxU3olQ8XTZGn0+orP5MYTuo3BIQ/YJ5keXXYT5pRAQOa65JN9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a11d:a763:a328:f2d6])
 (user=irogers job=sendgmr) by 2002:a5b:ccf:0:b0:a6f:9156:5579 with SMTP id
 e15-20020a5b0ccf000000b00a6f91565579mr14131802ybr.12.1678517914694; Fri, 10
 Mar 2023 22:58:34 -0800 (PST)
Date: Fri, 10 Mar 2023 22:57:44 -0800
In-Reply-To: <20230311065753.3012826-1-irogers@google.com>
Message-Id: <20230311065753.3012826-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230311065753.3012826-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Subject: [PATCH v1 04/13] perf build: Error if no libelf and NO_LIBELF isn't set
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Quentin Monnet <quentin@isovalent.com>, 
	Andres Freund <andres@anarazel.de>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Pavithra Gurushankar <gpavithrasha@gmail.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@linaro.org>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Building without libelf support is going disable a lot of
functionality. Require that the NO_LIBELF=1 build option is passed if
this is intentional.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index a68a3e9b47ae..5691e2ffb1b9 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -426,15 +426,7 @@ else
       LIBC_SUPPORT := 1
     endif
     ifeq ($(LIBC_SUPPORT),1)
-      msg := $(warning No libelf found. Disables 'probe' tool, jvmti and BPF support in 'perf record'. Please install libelf-dev, libelf-devel or elfutils-libelf-devel);
-
-      NO_LIBELF := 1
-      NO_DWARF := 1
-      NO_DEMANGLE := 1
-      NO_LIBUNWIND := 1
-      NO_LIBDW_DWARF_UNWIND := 1
-      NO_LIBBPF := 1
-      NO_JVMTI := 1
+      msg := $(error ERROR: No libelf found. Disables 'probe' tool, jvmti and BPF support. Please install libelf-dev, libelf-devel, elfutils-libelf-devel or build with NO_LIBELF=1.)
     else
       ifneq ($(filter s% -fsanitize=address%,$(EXTRA_CFLAGS),),)
         ifneq ($(shell ldconfig -p | grep libasan >/dev/null 2>&1; echo $$?), 0)
-- 
2.40.0.rc1.284.g88254d51c5-goog

