Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2D2346FCF
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359278; cv=none; b=O5TQ251lSCRejxvr9ooya9maANZN6s+zkYcy4rXP7J34eEpmPdx4Z5Q2Qv7cz7l1LFdHubSmC6af0/rbvQ+a6Vf+tRo/qNbRkjB//IjusAGLut4Z5tzzXCezQyZEAy2K/pYYD6R9Kv0vPK6img66l9tSfL5ckY8bVeqLN8ANins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359278; c=relaxed/simple;
	bh=IM9ESi6nZ2GNqGO23/dFzs6wZwAg2FXQqPWBRXVgMic=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GN208KqFtnd+eHVinjh9nBSkeb7R8jmkz1uFN95W/bwsQqog4wgM6XfxgW12l78U1qpOa//3P4xRW3dWDyPKj/R9BRkiVHlk6r/L6F6qwk5VaOGPUTtRL+0X+83M9yJ0hXpR24AFwvHpc2kI8H0Oat9P17LphqI6glJtvpcEwuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vogpi84t; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vogpi84t"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12c87ba0890so39466983c88.0
        for <llvm@lists.linux.dev>; Mon, 27 Apr 2026 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777359277; x=1777964077; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zio41ZFzhjPT5cI6wrI5OFkLmqAK3oJn4tmFEmpUdG4=;
        b=vogpi84tg8p0G439Mh3vVuXcz5k7scJIFSoHcnQeliv8pCpZJ2fNWDYzb/hk1/LsPS
         d2IdlwQMmRNbK9+76aZmTTBvQ10Os0SBoE2hwvzv09lkNkEebkBQ4Dnf+Kx6OWt2ICpS
         9vpDUMryIlxzzbUyz/9YWS9PwEm7GK/LPL6l8MdsjQ5g9LBWfpzf80e/olFFcw1VG/bT
         FSHmN4m+82p499zoRksn3XyRtWlXzSXlA1dDNqzNTklIAV9clU+1R4sRVti83zxa0WGx
         ccRifAFtRUiXvpoAcYO4Y1uqww687nnzKZ1+t1HeSBWRAGLOQLteTGBXlUg/4drIQS3L
         DnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359277; x=1777964077;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zio41ZFzhjPT5cI6wrI5OFkLmqAK3oJn4tmFEmpUdG4=;
        b=idZ7wGypxZs2pPs8ogO3JsOke6MuDtfuVHayMLkwsmXCkLX5J9x8EnBtgYtuG6W+YH
         EFZh9V1sRU8pK6FuTn/LtCQc5x0G6cC/6mY6gEjLVHfbMFxEzw1qq63htc53vf/chXrt
         LWKUCFjzXA9cgT/2GqrMIZGH8JfRNehwExPLc78gW7mAMgHdKgUvy5osx6tylpe3vaLc
         ee7d1wZ8TrM+MSPBqxcPbSJbv8cAONETaJG07DhYpcAoRUwOZuOrtx4MvvsHuyVZj0rH
         h/WCQDXyCmpkGYb6JXyEKMBxgdeFaJzoka93NBT2BW/sIF6XyOdvRdvn79hvMKJiYSiu
         RZKg==
X-Forwarded-Encrypted: i=1; AFNElJ8gaU9iqPW4bNfqwxCcs2eJXacg63PPXYpycKiNVv6g+FVz+F8XJVfYnF4pPgqxVX1FUOY3@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2esrO+t26ppBvP03wMHmbXgHb9pFbx3keciIgapKkBTUNFBRn
	/FGuRQ2KbpxaiwDhN8YQcq7dTvWLJhwnws0P6V/9GUkQSHn9C81x8IQRMedQRf9wtWDyjh28+zz
	OwYIXL1Mi4w==
X-Received: from dlbto5.prod.google.com ([2002:a05:7022:3b05:b0:12c:1f83:7b4c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e28:b0:128:c9fa:4c32
 with SMTP id a92af1059eb24-12ddd9dd721mr881046c88.28.1777359276536; Mon, 27
 Apr 2026 23:54:36 -0700 (PDT)
Date: Mon, 27 Apr 2026 23:54:32 -0700
In-Reply-To: <20260407165551.3075684-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260407165551.3075684-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428065432.1877423-1-irogers@google.com>
Subject: [PATCH v2] perf clang-format: Add a perf clang-format that overrides
 some kernel behaviors
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: akpm@linux-foundation.org, joe@perches.com, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In particular, header file ordering is an issue in the tools/perf
directory given the larger number of depended upon libraries.

The order of header file includes was proposed in:
https://lore.kernel.org/linux-perf-users/CAP-5=fUitzKwJONTngiW17XkS7kVr2cDS4cDL_HccJKcnR2EgQ@mail.gmail.com/

Sorting headers is desirable to avoid issues like duplicate includes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
v2: Move the .clang-format file under tools/perf rather than tools/.
---
 tools/perf/.clang-format | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 tools/perf/.clang-format

diff --git a/tools/perf/.clang-format b/tools/perf/.clang-format
new file mode 100644
index 000000000000..902b2f7456f6
--- /dev/null
+++ b/tools/perf/.clang-format
@@ -0,0 +1,20 @@
+BasedOnStyle: InheritParentConfig
+SortIncludes: true
+IncludeBlocks: Regroup
+IncludeCategories:
+  # Implicitly the corresponding header for the C file has Priority 0
+  # C Standard Library Headers
+  - Regex:           '^<(assert|complex|ctype|errno|fenv|float|inttypes|iso646|limits|locale|math|setjmp|signal|stdalign|stdarg|stdatomic|stdbool|stddef|stdint|stdio|stdlib|stdnoreturn|string|tgmath|threads|time|uchar|wchar|wctype)\.h>'
+    Priority:        1
+  # OS/System-Specific Headers (directories)
+  - Regex:           '^<(sys|linux|asm|arpa|net|netinet|x86_64|machine)/.*>'
+    Priority:        2
+  # OS/System-Specific Headers (POSIX/System flat headers)
+  - Regex:           '^<(unistd|pthread|fcntl|dirent|dlfcn|poll|sched|semaphore|spawn|syslog|termios|pwd|grp|netdb|sysexits|err|paths|pty|utmp|resolv|ifaddrs|elf|libelf|gelf)\.h>'
+    Priority:        2
+  # Third-Party Library Headers
+  - Regex:           '^<.*>'
+    Priority:        3
+  # Your Project's Other Headers
+  - Regex:           '^".*"'
+    Priority:        4
-- 
2.54.0.545.g6539524ca2-goog

