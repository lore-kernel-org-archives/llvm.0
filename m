Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831185328B0
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915995; cv=none; b=Q1wXlaL8ziKSbEna/Alr7kxsKaL/OI6k+yB5xnPbVpAr+nNMjfjbmVYeyDQILorTmYyMj9AoTlaFm0boTCh97eYzp6H47965gxdX+RlgMXUpJEPwhXw/QXrIyqPUmzaWS4/mckULo8XtdFPqGF4BSXSYyOQ7qpzyq60AVC9FmZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915995; c=relaxed/simple;
	bh=x2csqR8dDP2NCSK8ek5vU6PAamZazjSrMmyYhw8xZI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N/oZIPgS0SFCNf9eIogNtQ+9RTNU+sWgS2PKoActZFdoGfBi+uYgJhadQa7j7fQjimmani00IiJCsbbKcu4XzHeXzsiDqYY8KQ5lUDvf8zde+/JqoH7HVadatpHQApLU33hWdHOljjkXV1AMev4amtLVHNqnZYpRru5qjBNKUos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q0vtn5ye; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q0vtn5ye"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so185791eec.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791915990; x=1792520790; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=q0vtn5yeGmR83/gZG1pVMMdmS9uvY0ZWxINl+D3jmO8UWvVR3WzBsWWcT814tYwZjD
         SrdEaCpyWiryrEIkRFBVBa1p819lUjX2GRiU9vdxZaDeMJLzzpDxRO7ZrcwUDiod52bz
         YDxAYVGVgi+ZAi+K7yPVH2/pN9clQf/d+uGoMwDYeWeWT1fW4QquFZ4trqoTqB6Nap1g
         AhVaoUtkCcrIqFf+xZqijwpVb1L4PdmDga3tZk/mo18S/3EzCjLAWUANIsHXbqQ8LnAK
         3pYX2gIrWEZvaWC9ZZ55GfS9PlOtXOphEW4GxO1vKgbTtPeCYjmkO1mOf5jpbU5WyWUo
         HHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915990; x=1792520790;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=L2HJa16Z57kX1655d7d/q2ommjBAf8nqcHiBCduI/ac8lkHO3zNcD+hv3nsuTPQU+1
         /JkDTYJhkfRG7voCQyrDmyqSytQ0zNWIXORrppRQKiKK9tZ7HGYrQei+1ddqcPxcqmGS
         mLU7hQFeORS5VA05Hn79xK5+ZipNwZqXPjQPUl6FC9urb4l8bPoImz982nqiFcF+fZpR
         nzKmAy8k24L8JsRHlW+XPSvOztgHHPRwKFakG8ntzCnsoRzpFPAaAfyYL20+KYRC3U3p
         xO1h3IDyTYo+j3Zt6eN0irdmn/EX3legYOx+rPVB6eMAINzF9cRkMxIKKVcxLGgzCPk6
         SXpA==
X-Forwarded-Encrypted: i=1; AKwUvByj59dRs/Wt6RNEeEQup0E5c8wcCJI14wSGH3pWNhXv2yMvuz9z3KKkXRhzFyjTqsgOTK6Q@lists.linux.dev
X-Gm-Message-State: AFq9FYKlbmWer44wfMUzT/wRHYPYNW9JBCoaMWHQnzD2/UaOzRUe1UkL
	fuFF2GExLwUlvEj5xnLLJ21x117NJ4dN5AvWM/RgRnKWSv7HkeuPM+d20IyER8Q7+IJkkd0eQPY
	SOEyYyslk2g==
X-Received: from dybry2.prod.google.com ([2002:a05:7301:4d02:b0:351:4ac4:5ff5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:dd95:b0:353:58b7:b5fa
 with SMTP id 5a478bee46e88-3535f48136amr18225249eec.1.1791915989888; Tue, 13
 Oct 2026 11:26:29 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:49 -0700
In-Reply-To: <20261013182458.1234616-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013182458.1234616-2-irogers@google.com>
Subject: [PATCH v1 01/10] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
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

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/compiler-context-analysis.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 8302ebc2ea8c..024e303188ad 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -243,7 +243,7 @@
  * alias as a function argument).
  */
 #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
-static inline void _context_unsafe_alias(void **p) { }
+static inline void _context_unsafe_alias(void **p) { (void)p; }
 
 /**
  * token_context_lock() - declare an abstract global context lock instance
-- 
2.56.0.385.gd3acb90ef8-goog

