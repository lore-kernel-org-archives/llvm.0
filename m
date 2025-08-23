Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9820D2B9B7
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909153; cv=none; b=GYMhRtwiwfEAbieB0hArja2NWU2S5KDXVrB14qknuOlHFrCcLhAsHCDrlYA6ShTPwntNHIRHLeijntYXnvUv5CcPAaD/AC9B4vf5GlZiUjXJVlPHhAO/PQn9YaKLYRiFiUwpH12hYppjpRd806nKY0mEK7QcZQq0J6rY3Tw3DaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909153; c=relaxed/simple;
	bh=Dc3cNk44/tRuM2VojGcEzzSNDOPpGyR342/mBE8AYFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=oZPZIc+ZmfC238cvQ3DhfsovZhBR1uTiZ+uslO/ghxIBYhIA6Cn+ZLXpxI42QXzK7qZlTKI/JTCss/DHct/p/+lepWy5Sr/HQGc6bnpztnQ4oDpSzjUU6uKdr/ZefBOP8mT96veIFKuZwMeD0RSwBLVhyqrSIfG3JUhX+1q1z8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wd7JXra6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wd7JXra6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-246088fc25cso26835275ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909151; x=1756513951; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQAl8xl/b+1jpLH9+IEKeJpo3s5Nx0HvpydTDpQfd4s=;
        b=wd7JXra6ntwhabe1aWMgfS3DnhYsTjk7sudKXt6ZG9qqekn2GViVxruyGbClE0vl/w
         If/yVNdygKSR4XsZoJT9o742oIgafoLKo8Fs1/bAfgP6p5qz5gdjyW8kpjF/vvq5YPK1
         4ZeP01Vo2daYWOnYqwAsB1zCoiiIez8pc2vjNeAlhVYUxjZ2MtKWQh4u/ytW0dalcjeE
         rrdPjsoIO4olP2Ee1YfT8Y8wOIyhhCb3TUKH9fCQmogDFu2YGRqBn0HO3HHoK4K7nVuI
         5DADd4wrcEJlhFNHLYZur5VnVQnn18HQN+rX49AwXCD21vvQqfEZfC7Bpi5GN64XVbJO
         mHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909151; x=1756513951;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQAl8xl/b+1jpLH9+IEKeJpo3s5Nx0HvpydTDpQfd4s=;
        b=wvVLH9TcLCvTzb80vmDZFxovjmFo38ucQtK/wvxnr5OtYai/7m1MQuKDI/b27mD5xr
         AcV9N6wO73itWWVEU/AbsEz1044+IdwsQT377wajOeY68tMq8jJTeZUVPhd7WBn9q5og
         bm3/LYZlJn+nHwTHCmSWGPxb+v1HmHOZNvn5vH1wzbXx3JRqOSoAqOE6AkQsuhIYjL83
         4YfCD3fWdB6oAwY804pSLbYu5VLGFRy2iosPGXq7jRbH0cKgoKomygFWqoeTpuJcKOVg
         T/tcUOKZ0oKeTPjl+kEC9l6MA4f9+PNtZRHh3eM5bc1WX7vcmP3caFBLqGm9ImRMLuyN
         ihDA==
X-Forwarded-Encrypted: i=1; AJvYcCUNgASAvDlur4pTsqAKgl8yUc9blPriTkE6YybvAhHC2f4KGjSIlWPEN/s9pUeYz9g5yjoY@lists.linux.dev
X-Gm-Message-State: AOJu0YzwFLMUVbQrxFRkJub+1jJjgHp13Xau0cJyWTSyG9rKH9068brI
	gdG3syKrlPYIwAloJF7HNSqQEyvWjGBAPbD8laFPtrdQLd3ZBF1pgLIyXDXChaXtUkTbS024uKA
	oC4TopIrA1A==
X-Google-Smtp-Source: AGHT+IHRINNwvyZt4lXIFjt25RkSON9R8J4szK9janrxGyoVx2sOxv0HYEXd2hph/CfK/OG2Ux3zgjtJdVez
X-Received: from plbme5.prod.google.com ([2002:a17:902:fc45:b0:242:fe10:6c5f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e892:b0:243:8f:6db5
 with SMTP id d9443c01a7336-2462ee0baa0mr79386145ad.6.1755909150886; Fri, 22
 Aug 2025 17:32:30 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:31:57 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-2-irogers@google.com>
Subject: [PATCH v5 01/19] perf build: Remove libtracefs configuration
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
index 5a5832ee7b53..7bc2341295c3 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1181,20 +1181,6 @@ ifneq ($(NO_LIBTRACEEVENT),1)
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
2.51.0.rc2.233.g662b1ed5c5-goog

