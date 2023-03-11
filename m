Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0A27B
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 06:59:41 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-540e3b152a3so19207267b3.2
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 22:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678517980;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwWoTjR86AKucZnLsGNUcUMK7gNda6D+/S/cfRQfBgg=;
        b=eElZEpPqgYjQPT+2OgFJo3tJTboFaG9WiNPK5qqArvz4zn9dLkynGNEg6xMvjQpfsB
         8VIgGN8gT1K2LA+1w7FACJ0oeu6GJzCk6x/Vt4K39kUe3JaWwQa4UIkDfsMp/3+5GeZD
         POGSCqaKPVtzV1MJgMTx/ERlkg8AW6eJHa0x4KZ9NvMfRLGV/n6sIZSu/Rc1VFz/zCw2
         RPvH3408SaVcFcAVh7ctiB/PTEKu9bWodiOA/MRIf7PQJt3QfR1SCsRAPLFDcGxQ1lZK
         2+TirLZ0YCwlUl+CgZIoAF0cdAF0x2AJwBmMMewK3EFLb1duc+Sk7cL+Xd3VtmemShtt
         1XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517980;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwWoTjR86AKucZnLsGNUcUMK7gNda6D+/S/cfRQfBgg=;
        b=HnNl3RC/E5h+cVz9pnJW67Z+UH20yODaFBBAhhA+uMePJIAHRqXRB+TLRdz/53PXD2
         1sknrxzjcEEVUsWinesbSMpPO6ejd89hVIdCBHB6Zv2pS/SuMIoDdCDWqGZAgweGfv6W
         8ew3bBtRxTPflVnL+vY88ZpOKuhyrzeRpAjFf0bqGFcnNAdIixLecVYJ6c5Yz5xsAtSi
         RPSAcnysy0yeDPbTuiCDICeR8snCNUadhffErSBZAt7OgNFaHzUMlY5uzlGs6MDC6BjX
         9QPAgOOR4+Dm4COcxmer/e/RXneq8dvUYC3LugWVrxe2BbztkUu/pLMFwVCqmAeSeDnG
         EWSw==
X-Gm-Message-State: AO0yUKWN/Y01L/Dom6kvJimXPR2yMbTCAFTaOGayzqFdP6T3xHY0Yspq
	fAAva1FZ1kB+mpz0arWAhnqYEyHBM8Gq
X-Google-Smtp-Source: AK7set8Vrv9NAbTX9LeVvPN5FFdwJH1Tgz4a3yXybmJZZZuxkA7pyjWm68DJOp93hT5QF5cnEQsir9bGAKm4
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a11d:a763:a328:f2d6])
 (user=irogers job=sendgmr) by 2002:a81:ed06:0:b0:540:e6c5:5118 with SMTP id
 k6-20020a81ed06000000b00540e6c55118mr1450560ywm.2.1678517980596; Fri, 10 Mar
 2023 22:59:40 -0800 (PST)
Date: Fri, 10 Mar 2023 22:57:51 -0800
In-Reply-To: <20230311065753.3012826-1-irogers@google.com>
Message-Id: <20230311065753.3012826-12-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230311065753.3012826-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Subject: [PATCH v1 11/13] perf build: If libtraceevent isn't present error the build
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

If libtraceevent isn't present, the build will warn and continue. This
disables a number of features and so isn't desirable. This change
makes the build error for this case. The build can still be made to
happen by adding NO_LIBTRACEEVENT=1.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 9754218bd418..1b598c5e68eb 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1156,7 +1156,7 @@ ifneq ($(NO_LIBTRACEEVENT),1)
     CFLAGS += -DLIBTRACEEVENT_VERSION=$(LIBTRACEEVENT_VERSION_CPP)
     $(call detected,CONFIG_LIBTRACEEVENT)
   else
-    dummy := $(warning Warning: libtraceevent is missing limiting functionality, please install libtraceevent-dev/libtraceevent-devel)
+    dummy := $(error ERROR: libtraceevent is missing. Please install libtraceevent-dev/libtraceevent-devel or build with NO_LIBTRACEEVENT=1)
   endif
 
   $(call feature_check,libtracefs)
-- 
2.40.0.rc1.284.g88254d51c5-goog

