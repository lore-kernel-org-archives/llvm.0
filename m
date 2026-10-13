Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032F5625F6
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930411; cv=none; b=LVvhkfOUIdpiAS8IDIuT+EiiyP2Kzjo9Fiz7AttuxRpdVoXP9SCkWSsazFXxu9m2Sppw+NbsrcvzxS++83FrNl1R5nR6yqQ4enM/OHPMC/b88qn5fZ/ANF0rFwWZa1TgnbKOjjByy30wdiPK7Vf6OPU2+m0wF2+JUTJSEu1rZe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930411; c=relaxed/simple;
	bh=ASSO9Yhh3x4l2aj4p4LjjHkOJ/UB3ZSeE8UNpeDAMHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nLbIhiqAN+JZZ+hRMSEtauf8hwZDb2F4nyrL1c+RYcjVt2xP5cVQh7AwH0XDKrV5jU4SZQHfU4xalCY60Jk8is/0u+rB2cS7yr93wv/yx7ssQRBQmwJFZPn8p79Lx3Zw12mbih1fI9XX+84c2Lz0JCk2miF1hVCi5YvB4J/57lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YxNzJFTY; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YxNzJFTY"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so4607460eec.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791930409; x=1792535209; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK8eM9wlcN4Kfzlfrk2Po0YSpGR23CvMBC4OejD2aUs=;
        b=YxNzJFTYf6wsM5Pq5ng+2HoLgJu61p0pjqsJkUYJA0EceEfpw4cqcgCfKJ1mDHiAAc
         dzK8zsqLZazudLxVn+KPfNFZgvamRhq6oEpwV8R+hllrSo3eYpKEy7chMjaxjVsHv44E
         UzJEj5wxSnQ5QTBi+qRFX4nQezQ8cayA4ktnxesghshz00dSTRpk8WWDdN4bCs0P/CpY
         LIos8dcYdy1UiYR0svJ/j6leZTBLCmbf8o2qesjFKfHhNdyiC/IXmWXJGw8IANksSMeJ
         YDlU6LTwTS4m9ObIiYJEizfiyUstigqvBsD1Xhw23Bhwcc4PtFvM6oY8kL1J2L3y2h8E
         O7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930409; x=1792535209;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vK8eM9wlcN4Kfzlfrk2Po0YSpGR23CvMBC4OejD2aUs=;
        b=rkxQ8uw+KdihygPq3XAguO8j707WrtB5B/KatCg3tTb/x6SGyZMJXH3E5nwbtysVJC
         tOgTFLQW7d5OHu8HQyJj1aVZD78CTk5CsE7mjQXCzpfY1cgMS9jUUSJAUnRV+mRPtcyq
         c/iS9AGYl/LkQ6F8U0Lehhb9gZiRiqSrL7d3yGSBuWVi/l0y1GOB89tqD+DREulQ4QGt
         Xrs9aaKPxiUeqDpcPRYfk2J9cuRldNy83otOWAMt0NVr4FhvT2+qrOuSOs304mVKNcvA
         SBlJCwNsQi7oC8SWt7PNWemlYLBnS42SSHkCPe/vYQmUmQibEaw3pAHJ3WqVsIKRKoH7
         l1Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ6YjmdK7tE0fOglXhoifapGFao8FQi8qPlg9dens6AkQJFG7JXp0XSod85earL+IezG1T@lists.linux.dev
X-Gm-Message-State: AFq9FYKOB82TcY/YTc4Y4rxAzRhdp4XLCyZkQiBLH7p47NXDv5etFozr
	KDxooqU9Lsi3YfSGxGvvsWp89dkaPbCxpRVvK6n4onM+K18xgwEfCQJhNusOT8B5iAHXV96AQpM
	CGTdO3p2wSg==
X-Received: from dloo7-n2.prod.google.com ([2002:a05:7023:a47:20b0:168:9e52:72b9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2309:b0:14a:5284:1bff
 with SMTP id a92af1059eb24-16a5f4e8824mr22840937c88.34.1791930408253; Tue, 13
 Oct 2026 15:26:48 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:26:17 -0700
In-Reply-To: <20261013222622.1822619-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013222622.1822619-6-irogers@google.com>
Subject: [PATCH v2 05/10] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Assisted-by: Antigravity:gemini-3.1-pro

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 39442577418e..a5bd160c03da 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,10 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety -Wthread-safety-pointer -Wthread-safety-beta
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.385.gd3acb90ef8-goog

