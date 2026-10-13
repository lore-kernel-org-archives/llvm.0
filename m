Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEE45349CF
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916003; cv=none; b=kCbzUzjbX9fe6FBB//cDV/Uc/1l0ae6UmyLuYbHRktTMYp9+F6FE77P8D/EKHroqd8eiXQlIKq8VGrzuHrwvnUudrxdZJnPK1/6/4EM9lKnF63e7cwnwGrHwLj8xVe43AQ/cpmH+RTDMaEkc1Cyq/ji13IvbA3tBSJPvdjU7UT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916003; c=relaxed/simple;
	bh=CMzWLsSvUBuoBzjwvp7EGGHEbhbirK0Kv2OvNgP3qM8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KEVjBWh9ij0Bas49tCkpIa+vUj2ZCBfhtG/++OKR446D4vPKq6/EAE1VZt5zaN7MvyPzaRkMjBrfWR+ZH33eE1v9Pc45Dd5zqDWU7rpeF93eb2mGw4FCk3k6G60D7X82HKRGQe8uU7RdwgV+TMbszJLNKswmoZC+o1u6tDOYhjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTi8Naee; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTi8Naee"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso5208760eec.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791916001; x=1792520801; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3HbwDarhrHxgEfaQxuccmNcSi/54Dhir4/ZTP/Ma6I=;
        b=OTi8Naeea4rRAgKzYdgEjXZXaRWSVmXc2vLu1ttMAQKNK0ukpT5KQK0P/qaNzx52aV
         qmvGS0nxwLhMNVolrKM+raqXX5lVAJJkLlmzGP4uFxZQ2+kUBiTSClqJd61bklenwFiX
         cKe8+sOZLe5cAqu/lOe4zVETWQFYiMnQ18iLHyEqyl3GPoojVI+2bydjfaQQtacriiAv
         yJpct7ZpRk3E64JQIpysTHAEK2DLvqdI5k5g8FrKHQh1tfezRJhz8DibGY+L9t1xPimY
         QB7by5AcWo8HPYy/3WUfDP601hvjoYx3xZK3adSL14Ti/lHPGTSo1SM02BwB50WZp+1T
         98vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916001; x=1792520801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3HbwDarhrHxgEfaQxuccmNcSi/54Dhir4/ZTP/Ma6I=;
        b=cr/fgDhsKbZvRvIlQE9vXhiRj0frOdFmoF1Lox3LCFQdlUfiCguu5UJe/nQA3Zw6cW
         dvT/KhUXZJ6yT5t6pWKqxcamx5cAtFzzpiQwjSoeZ9o1uKnZqzQCfCKltI1lqPCsBHRR
         s7aS6LWGdXLtR8N8bVAC3RoxRT9Jhgyy4xMFbYgggPFJDMUY7YtX6z8ltRPi4aB43Fk7
         PZ4hrzI4c9pBShCFX0l8rp7XvuEegg+P5D0BY14uZRaO6aKLU94brf9E4DMksHAGu3gX
         y3gFiXyIXhlZnxHR85leuvVPlMaIHWNoaz9A562ugcp0X4cj/bImFPxckG37HTsfWUgX
         qCcg==
X-Forwarded-Encrypted: i=1; AKwUvBzchb5gmpEcKhSl59iBvy84zJPrl8KmaFrwxYz5ljGe+SgEsavivnLdDZJAZ4yo8qKIORRN@lists.linux.dev
X-Gm-Message-State: AFq9FYJZv6x7EvdUSH3pR+UFw/QJCEyes8V5GiPCxNRXc1n/Wb96UT7J
	bs9gu/TFsvOnlT7GbgierOomWFyDADS+XB/32DAUbEWqNKpynJFzSJQ+cySqU9lm5vm7dmRFpZv
	CpMbKhtwiNQ==
X-Received: from dyng35.prod.google.com ([2002:a05:7300:7f23:b0:352:3ca9:9a5b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:810f:b0:356:a044:b194
 with SMTP id 5a478bee46e88-356a044b1e5mr16397097eec.39.1791916000286; Tue, 13
 Oct 2026 11:26:40 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:53 -0700
In-Reply-To: <20261013182458.1234616-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013182458.1234616-6-irogers@google.com>
Subject: [PATCH v1 05/10] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
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
index 39442577418e..d536203ff42f 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,10 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety -Wthread-safety-pointer -Wthread-safety-beta
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -E -x c /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.385.gd3acb90ef8-goog

