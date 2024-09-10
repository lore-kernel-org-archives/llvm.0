Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD319923F
	for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725977081; cv=none; b=YP13JzkqHQjRfW+gDlNQEadxzqdVCiyp1x5F8c1435dOSHWm7Q0cQ3Le/pP2Ejmmm4iWQ7sB4hEsINSUdkNz3Um/qXBLftlgLJLOzTYqCD20pdE5rx4hbgccA9csAy5o/Tp6ufgVag17/zdL77NVszKzySk30h9kBJVqJBzETGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725977081; c=relaxed/simple;
	bh=OjtweS1q3V27F5fK6RgxbRa8U+kYLJ/fvAGK90ksCB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cc6H3H/RcWYHFygs/u3d4hyJMmU82nFl6cDr4lu92bEO6eoLRzsDTUfbSflbsYgbdoEnTk8sGYtokyRn0tv/f2deXF9cOufm8cwbqd+f6g+OGpJBgfGD9xr/D/zOgNeb7DjbUNqnh6qOYhWyx1wWPbNlby1eQ+/qjbLZTdUDkUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qckvn/Zl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qckvn/Zl"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53568ffc525so1041546e87.0
        for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725977078; x=1726581878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS/maFmCMzAAa4s+MCdvfSFRa4peuXy1wJykcXIHmPk=;
        b=qckvn/ZlFYdEgleEkmpboWyPDaZC/Azaq7jyWYMYxsJdRiY3dvG2nGiE85TL0uzCYI
         8N9Anngo3OSHwMbViEbDCrZ2Fi/Bir+AUpy3XN5iyiJWNbCq+7mQE476zVI7vSrGE7jm
         TxloapxN8qHsSdnXKnF9dKlAHH1M600t6GIaNv6hMZOLpmrqEiaSSuI7wVT9/0pAGx9C
         TSQQaPwpvzuznd70Hl6b43ppL6rxJh5sFDoAzCHNKJd6DwN6ke77wl2QWPrz9qvlZmx3
         7hdrarvt33GW3AadYNS7oaGxmLbuCugSNb4E5f0U232nOcQ40SLo8nM7Ckl6jjQMQMbk
         0atQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725977078; x=1726581878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS/maFmCMzAAa4s+MCdvfSFRa4peuXy1wJykcXIHmPk=;
        b=KXCXqSF40w+e7V8UL9geFH1lROCXzL8FSDWAwSx4464Q/wKT05d3qYD29apmIokuVn
         apC6OHsepo9oSrNO2eckahwvLTYZKIMtqFEr9wb/HnPpEGdmJVRsDLQPJHkQqYprMYD5
         vSusGNnLab5Tfe5px9Q+XxcZ5A/arSr9MTA4cfRzuwL/96uUkUsnjkoVNza6PICSptL6
         +GoDOCnSKo/+75JrNYu5WatB5mc4xC2lfDj233v2TX9EmJUzTrXPxWXxn+a+a0QVlfUU
         cAA0ideOOiHmDpsnKv4eAtrvf9/asK79bi2TibZcjuvho3JEMCtGrOdEXOexfFUtnWBl
         gxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUnvKRJakdspfEleKTcW+9gNvAOfC6jE1G5btQbnTFHtQcObGNdiGFEg8Y+1yb8oiF03gs@lists.linux.dev
X-Gm-Message-State: AOJu0YzXl15kF/Wwe7i7QAxCm4lIgREstCGAlsO+tfZiq8BPA/RcHWK/
	M/htdGVjlmLgcWTQCR7v2FvdC0M86HIrP3VC6sUQHpnakFNZco4Z/vF10oApR0A=
X-Google-Smtp-Source: AGHT+IHoK5woUUfrtzi8S8rwG8nObPbqRVcjsqfShnp3wADgkiTW2rnKUpQlo65zvgcisMPeXektZQ==
X-Received: by 2002:a05:6512:2523:b0:535:6795:301a with SMTP id 2adb3069b0e04-536587fce23mr9726515e87.47.1725977077413;
        Tue, 10 Sep 2024 07:04:37 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b7f1sm114787075e9.48.2024.09.10.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:04:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: linux-perf-users@vger.kernel.org,
	sesse@google.com,
	acme@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Guilherme Amadio <amadio@gentoo.org>,
	Changbin Du <changbin.du@huawei.com>,
	Leo Yan <leo.yan@arm.com>,
	Daniel Wagner <dwagner@suse.de>,
	Manu Bretelle <chantr4@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/2] perf build: Remove unused feature test target
Date: Tue, 10 Sep 2024 15:04:01 +0100
Message-Id: <20240910140405.568791-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910140405.568791-1-james.clark@linaro.org>
References: <20240910140405.568791-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

llvm-version was removed in commit 56b11a2126bf ("perf bpf: Remove
support for embedding clang for compiling BPF events (-e foo.c)") but
some parts were left in the Makefile so finish removing them.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/build/feature/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index d6a98b3854f8..5938cf799dc6 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -74,7 +74,6 @@ FILES=                                          \
          test-clang.bin				\
          test-llvm.bin				\
          test-llvm-perf.bin   \
-         test-llvm-version.bin			\
          test-libaio.bin			\
          test-libzstd.bin			\
          test-clang-bpf-co-re.bin		\
@@ -397,11 +396,6 @@ $(OUTPUT)test-llvm-perf.bin:
 		$(shell $(LLVM_CONFIG) --system-libs)		\
 		> $(@:.bin=.make.output) 2>&1
 
-$(OUTPUT)test-llvm-version.bin:
-	$(BUILDXX) -std=gnu++17					\
-		-I$(shell $(LLVM_CONFIG) --includedir)		\
-		> $(@:.bin=.make.output) 2>&1
-
 $(OUTPUT)test-clang.bin:
 	$(BUILDXX) -std=gnu++17					\
 		-I$(shell $(LLVM_CONFIG) --includedir) 		\
-- 
2.34.1

