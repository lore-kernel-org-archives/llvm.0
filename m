Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA7E46C4DD
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189105; cv=none; b=Lb3zy+AjhO8bC4ohMyywXcF1pfB10WtM0+119vTUfX1Bgv8oUCtiZoeSzEDnriqBUTCM+MB67soAUEtilaukvszzdnPMShXv0w8mbf9hBTdiP3yc4Uq6lo8s5XhRpZvyY9fJuB2o8co94aJjOudBjJQMEg6wucz4BHN3/qcU6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189105; c=relaxed/simple;
	bh=XntgmLX4cYU/6Nf79NgEzitDFOVw7AFEttdr1X6z+5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dr8vR0A95IuSgr+wWhD/qLT7UADA3W3ekTpdKM/ibEPcr3LQYV3Ct1yExZTbXwzjXHEwy1Ohq5CpTbC/To0kwNwZl2yrkjnC3LsxNMOxuR+yts/l8WqZqqd36f1xqpGeCOEXrsNX9SnisAYhNvlK/o+vSfmUl9QJW8yT4BzG2kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J/Ch33wb; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J/Ch33wb"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so1719028eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 15:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189103; x=1792793903; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=J/Ch33wbUS/muHRQym78prlGrxbCSB6hruzkcmXUGZnzjLhzcV+tNAUhOH0023HCj7
         wstrK2ffIZfBMw9xKk7Y2i0lO9pGq8H+yqn1rADF2/Om1GmLjiKsVlMcIwy8r0pdTmsJ
         GRClqu/k0T3b+XOo/3APaUS0l9Nw931da8Jm/WNRloLE8thIwjvpKBBicATs0NZxey/R
         GT67v85GZECLjZ4PPOc/6fhffQ51j02uoBrYtXcOWXF9UoRJymQuANeP/qq7F5xOClMD
         Udc7IFOLBAWBDKvWBBNccDqxgDAmRGsFZAZUxqzmEzAgv/h60f89zBdwyob/sIL11M3l
         EsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189103; x=1792793903;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpTEfZaNFnhWMfcoXO62r+fEDph+U3x6hbZzfCOL3U=;
        b=DYKJktS2C4mfDnIT2CrJUnqSMuxm6gdGxqK+cp4qZjpkIhswpgQIYVebZu1W7sMixg
         FHTwSjDlNJuLRHQk+zbvR/zEGwcdUk23gQsyn7UpM3eKKuxWJ0p1unozqMaToQTc7hYV
         c/oSMl7/C2VP4hAeFh3NnSsSKkHxvOftsRZ/6SDQdXhBztQHLWMppPkUYQvrF8mKUTYN
         o1Nqwxt0xkmq75N/YjQhallOFVgNwROzfiHCyzyAW74u0ANPR7Ie9EaKaOMz0FXsZGqg
         uAevbzHh5vDYxpESF/MkWb4svmooEfMViB5fO5+UqNu8aMdpBCPd3woTcZZorbey9fe7
         qlMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4V7l6xEufPPw+2e1HspdtYCgERPRe5M6vWUU49azL/KZlT5QsHR4gFIxEQU6o8y51LsXF@lists.linux.dev
X-Gm-Message-State: AFq9FYIvvXKqIK4ONnqqkyQeoXlPoPo0dCmOq+bOsINSU/VlUCfAGxue
	CcILmzbumS49uE4SFnBkiw8WR35i+swZjtwdzyG/rJNV3p/xPYSBHqZL6DLHgPYuXUGvC/NWXo6
	vOJsuXFkiXQ==
X-Received: from dycmb4-n1.prod.google.com ([2002:a05:693c:20c4:10b0:34c:9660:9612])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f0c3:b0:35f:ab1:4792
 with SMTP id 5a478bee46e88-3602d6e460dmr5379136eec.6.1792189102525; Fri, 16
 Oct 2026 15:18:22 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:48 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-6-irogers@google.com>
Subject: [PATCH v4 05/17] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 39442577418e..ce746b12f901 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.212.g129ede20d9-goog

