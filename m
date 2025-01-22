Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DD0216E15
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567797; cv=none; b=rTMpZFVszz4+Irbd4pURGgr8n6xvhtfUPjm/jYKg7JAvmoctTgIJ8MMM9kI1paRH6b9aH8X9D2crko+BLYiEADvZmjwX/i3TQkdYZX6iHBHCA1yhj1uXxUprbSu8ZqP1PO+3Lev70dw+ZwAu+FRRINgEySVtm3qFOb13CVrrdkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567797; c=relaxed/simple;
	bh=+SiSH7CLHUUhlFjrtfw/RdUrBE2m3hzevec1yCiEXZI=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=azh2HPDnqoYUCAHHArCGf1GOn0tRflhnUrvnX2iDHUk8OhBSB+jHxRNXhJri3rMamoNA0MFtA1UU7F3UYFpYnbB09cEkPv0tnOSGHCcdMQLC8LnBowvb4xixejfxX12E4IYdTlxeyQRXaR2DFvl5QcZ5BIH6xT9Kl8kehrIQCf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d5xHrMIX; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d5xHrMIX"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e3c61a11a40so18708358276.2
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 09:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737567795; x=1738172595; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvK3AGwJ0K5BrCR508+h+usqMhR+kgkezdw0g6O+CCA=;
        b=d5xHrMIXZYavOR59hj+A5AR+9aXLsrLdb8QkW3r18kUkcZSK4wyg+ofA1yhKpeLHHb
         9wxjA5SbOZHds+ZGwyouexOzOXuP4lNBSAAcFk3VmMLKKTLXdw7J0F31PTrkYHiO2sm2
         ipPEfqithYNhpX/Z3P9tXYz/RivqZ1F+xWkKs85kcgNQDASDPqlwkaGzwNTQNBZLvEuD
         tc6JYgMklUVO8hPAxe+LzcsDwA7AYYHXZB2Nl0/2Z0P6DcYAKS2KAYAZOVdrbqzHhNJj
         16vMi8CKgJRAm8LbkvwZEpBOf9o2+nJA7yOkLumNNBIb1AxnQ572j5Wo/HNb1gW3hcLV
         TNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567795; x=1738172595;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvK3AGwJ0K5BrCR508+h+usqMhR+kgkezdw0g6O+CCA=;
        b=DOO7YpA3rPWag9aIUuTA9bPVyTEeBuYLt2XBJKwfxToTQlEZXSpo5/QkstyRcrWHBe
         PN4eaxC1AtzcSFOFZZmorf4HZoYeaFHQpTWGe664TPezkEMEOiXvhxz9cTnE9NmEZEK6
         rbrPZqnv9dfBPkytPwaNJKQCbzzo5It7N+nuyzWicZERRBMuxm1GaS7nzLHCowoLx1Me
         +LmJmZZWuYGC5vcpPL9ATLD+3mJvKTAg8zGEIr7CgInsolTi5/L/BCFX6VSa5eAs5lq3
         b0GYzP1QxI/SEeV0m+0RfDOTJy2DASQm3IBgXnUjSwgrDkPDLNtSzhyz19mvG2tf2tTv
         cVPw==
X-Forwarded-Encrypted: i=1; AJvYcCWerAKIgiMzdCI5nTbsDMvWpP5Lt5xCug2icJtmCNUzSoK+BCaiu9nBfJMWN/XdEsIJK4es@lists.linux.dev
X-Gm-Message-State: AOJu0YyGLxNVHACta4y2WoI5iIku0ATshtn3ClxG7TyaI6NyqLFz9Q3D
	CXdvVPIx1B0zpxugflmakzkyaEmFz2qFOvWByPdldxdYysqzaYShtyE/ksx5Xzs9r4oPGe9c6kb
	vBIwZ2Q==
X-Google-Smtp-Source: AGHT+IGuNDiz5m/eNmZM5imjDkd6RlEJTMH/eiVjLZsAwq564mKsb5O7VD1tI51H48iqKvALbnZ2UuQm44KK
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a05:690c:6101:b0:6f6:d314:49c9 with SMTP
 id 00721157ae682-6f6eb949eefmr553907b3.8.1737567794993; Wed, 22 Jan 2025
 09:43:14 -0800 (PST)
Date: Wed, 22 Jan 2025 09:42:51 -0800
In-Reply-To: <20250122174308.350350-1-irogers@google.com>
Message-Id: <20250122174308.350350-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Subject: [PATCH v3 01/18] perf build: Remove libtracefs configuration
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
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
index a148ca9efca9..cd773fbbc176 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1174,20 +1174,6 @@ ifneq ($(NO_LIBTRACEEVENT),1)
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
2.48.1.262.g85cc9f2d1e-goog

