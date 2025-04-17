Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7532C22154B
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 23:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931278; cv=none; b=NzeFKhEIgzlR7TEkjc1TIGGrZhFi6CcsCObHQc2FHAL9Cj6bDT3CQ0wn7qOpkmr/h3ktcn5laP1LWQOFvGqYyf8h7LrluvcR78+igNRuGSVSOM5EtvYNHjrV0YVEycHFSR3gEo1idnKJF88O+jX7uNGvz7QdhjeEveTMDgl0oCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931278; c=relaxed/simple;
	bh=DUhmjAhpzI4glFlJFVyHh6Dy0isdHfkiubMes37ZCtA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=SbC5l0TH+aT9yBPtKTRRZ5p9Txgr1h6RKsoXR8WXKghFmVOP5Ms375i4UB6SUjNiw+w6S1zuHeJ1UkPG5W+CReNM2KkbASx9EmFhxwx/Cr9+f28M8l3g+kt2gfJXU5iqgXi6IjrR0XeR4DbbbWrWDaT+Uh+gXCzy88rwMl6QknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B8k+rVTi; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B8k+rVTi"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2264e5b2b7cso11878895ad.2
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 16:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931277; x=1745536077; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qnICyJ2RGS0Y400AqNRs1KksXFmr5hh/vv3vYVQnBHQ=;
        b=B8k+rVTijDu+uBZ7DrSz+jwo2UNtRe2vqWtOVMqHj1j8GaybejGk7joOu8PZehjoa5
         xGEmiiolhoXW/2RTKp3RvNWMQ/FexdA1k7/DZQeXOS7mG1YAP3pEWoPeTUSuS/dFbi+f
         DtWakHXu2+yNS6fc7gq24F6f7yZug91C6kP81caPC3teZ7h87v9B04CTQxwwNIqrt2O2
         AHWkFDf8W+vGimGQpaqLCIiFSuFUkmp4diGS5DUXU6Bj7rnU8e5aO6mO92We9ysd+8nb
         PePxZ7j6e6JNmQFQ/f1fDICDU3i8o8RwrZheKVDep31phPGoeKC3cmyrZ6w0quQx/X1h
         xZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931277; x=1745536077;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnICyJ2RGS0Y400AqNRs1KksXFmr5hh/vv3vYVQnBHQ=;
        b=iAlR3n+IQEZFo7K9Ji6YbmwVpSzITiqNdsyRdrKOnyI0MiuxI4R5Ak0tu+P5BWmm2M
         q2EFBnSYKrsx7VkgrA6Pnb51mMNIQeCjOnJ2OTZtqmFH2JWR7LNGasIg5A94sOz3zLVJ
         Cr0gq0MK70lKmjBWOMC621iaTpoiyp96nhbEPD5pImSb3AhzIR9OYsXLN9KMJiIxGlJL
         EQQLqdtV/LZpUa0woOxS83hzTe6LFqYJNRr2h+GHso6rCKOekXc4HBDHT8IKFjujmTsY
         C8mhh/b8dE+WHWErr4KmTz7zJSMvGowQlaToNrlMEL8LXM2vZyNiOuqLq4c/CyhOBarp
         DjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHfY0rwlefiegooWAPUcNf1imVB0lGvqNOLMSkxgJLfDewBs5IQhyYezx+F/2KSzEfUv0b@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5fCckK7Wf/Bq5JtpYmqkdUW99a1k1rpKMUtaJ10LPOkxMtgCA
	04ySVVdf7Vb1xI/BX9Teyk4kC7uTEfGxnpj5QsX/2QUDYpc+hsacRTKUWKIOai+vq4BG1lW2FlC
	Ex6eUUw==
X-Google-Smtp-Source: AGHT+IEwa/KfQTqntEV82qp0baymPwWs4os7wo5Uctj1zdlTuJFxSq6S5ewEmLz+IORlKXcqOKBHo7BSNgld
X-Received: from plkj8.prod.google.com ([2002:a17:902:6908:b0:220:d79f:a9bd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecd1:b0:226:5dbf:373f
 with SMTP id d9443c01a7336-22c53379f8amr10249835ad.10.1744931276358; Thu, 17
 Apr 2025 16:07:56 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:22 -0700
In-Reply-To: <20250417230740.86048-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250417230740.86048-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-2-irogers@google.com>
Subject: [PATCH v4 01/19] perf build: Remove libtracefs configuration
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

libtracefs isn't used by perf but not having it installed causes build
warnings. Given the library isn't used, there is no need for the
configuration or warnings so remove.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 9f08a6e96b35..f31b240cd23e 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1176,20 +1176,6 @@ ifneq ($(NO_LIBTRACEEVENT),1)
   else
     $(error ERROR: libtraceevent is missing. Please install libtraceevent-dev/libtraceevent-devel and/or set LIBTRACEEVENT_DIR or build with NO_LIBTRACEEVENT=1)
   endif
-
-  ifeq ($(feature-libtracefs), 1)
-    CFLAGS +=  $(shell $(PKG_CONFIG) --cflags libtracefs)
-    LDFLAGS += $(shell $(PKG_CONFIG) --libs-only-L libtracefs)
-    EXTLIBS += $(shell $(PKG_CONFIG) --libs-only-l libtracefs)
-    LIBTRACEFS_VERSION := $(shell $(PKG_CONFIG) --modversion libtracefs).0.0
-    LIBTRACEFS_VERSION_1 := $(word 1, $(subst ., ,$(LIBTRACEFS_VERSION)))
-    LIBTRACEFS_VERSION_2 := $(word 2, $(subst ., ,$(LIBTRACEFS_VERSION)))
-    LIBTRACEFS_VERSION_3 := $(word 3, $(subst ., ,$(LIBTRACEFS_VERSION)))
-    LIBTRACEFS_VERSION_CPP := $(shell expr $(LIBTRACEFS_VERSION_1) \* 255 \* 255 + $(LIBTRACEFS_VERSION_2) \* 255 + $(LIBTRACEFS_VERSION_3))
-    CFLAGS += -DLIBTRACEFS_VERSION=$(LIBTRACEFS_VERSION_CPP)
-  else
-    $(warning libtracefs is missing. Please install libtracefs-dev/libtracefs-devel)
-  endif
 endif
 
 # Among the variables below, these:
-- 
2.49.0.805.g082f7c87e0-goog

