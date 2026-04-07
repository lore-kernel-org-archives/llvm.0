Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD683D1CB5
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580977; cv=none; b=EZsSWukU3Rx0bEhgCgNFvKQ6b+hi59iUyIS2mnZqAoeqdsNvqVCuX0UfShOHiY/7pvxOXsUfCIWV5+WMQky1vbYTOokGkLwfNRm9VGMfe11kXlPcslf6vKKq4y8O32kGwZPM0EuFDAHjfRAbA7MsmmoBuTJV21u2fwNmM6VKgmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580977; c=relaxed/simple;
	bh=xX51MVLk+FK/Gwmt47h85ojG1AG9b8vzBqmaZ4QV4IQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YmEJ4XOraDF9+iYVNXXBATKlNndyTL2xBzkFmt+/RAK13pU1TZSxaq77rLICf6ly/yl0HvjEviYWVZSo0vEcTqEAKaqNZvLMbxY8WmtOdktRolu5ZG5pJWoquLMeGc4vvGpB28YLCP2qDpDkEhGn6hjThprYapyEQ4tCCfQAO3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWL3N5Kl; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JWL3N5Kl"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1279caef718so8238819c88.1
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775580974; x=1776185774; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9F48xl6jtMCWVYh3OD+RYNfjU0d/CxcSdl1HkifM6Zk=;
        b=JWL3N5KldLq3It38SC/y4lsrxOvihakm0QlUTyUCkmuShIck+FZ+H8JeyOom0cQ4L5
         3OZ3s2JKkhzHQn321lta2orbZPfEbqE3/MSXKelPIXFhVQd4T3PAA+WPIwZIbnMF0iFN
         YRa8CAZLBRRXLt+wjkh0oyVvgqhO+L7miQoI7WZAx61vzOH7ZU1GJA8j14L903AWWLjX
         fF6yqr8Ps+HTq2mo3grHObJBFosLJMGes9BP+gCbsDgAd0K65kYeWx5EKalpBBDKcutV
         prKh5xeWs1eib/00ZYsM+KhnygS7KxcwRx+bMIw9lbQ578K1fgcnlWBQlG0YobTGxR+g
         wfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775580974; x=1776185774;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9F48xl6jtMCWVYh3OD+RYNfjU0d/CxcSdl1HkifM6Zk=;
        b=WmngvsoSSRlrp2TutSKVgoCHdyystmPRHkQBWlC6guNyOXzzIBNhlGcq+E/1CugQdt
         TgmF4aUIYZmUIgcDmskZmDzeQ3AbE8eRGFjiAJOo0QqcRCbFAl4UzfJQOQtVXRR+M1tY
         5J7DfBlBQ+lfiooitWT0VstX65JB+hLlEPELlhXdkF743C4c4fLC5X+Dh8HJfloc5FBE
         eG9sYQsPFjUpQHWbq+f/w3jx8M7s+89JCiDt2oy6+1kzfcsqXwh2sRzD309NQLSghiKi
         FAzekWS8hYaxR/TwMC+6nWdvEVTLcNPMPdLGoCqA23UdFUynJ4zUrc38+356KqUIBAdu
         uhOg==
X-Forwarded-Encrypted: i=1; AJvYcCWKTnWIEqCK6dr3YiWzWQaCSle3gRuKs333LCLIOeKKTmTil4H3siK6AZrZjj2hvnfcNPxw@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy3ben/uGWg34yZaqMMSEfq+257U/gaH70p3yE4Ce2pMKFHKFs
	Ov2regEi9U/vpOU4L+09/Cf2oETVi6cnPmNHu2VdJkW2l0v8iPTjRR0vI7gSAGZhIspTiaJth+b
	jaoMkOCLzfg==
X-Received: from dycro1.prod.google.com ([2002:a05:693c:2b01:b0:2d1:180e:c6ed])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6097:b0:119:e55a:9c04
 with SMTP id a92af1059eb24-12bfb767aafmr7756188c88.32.1775580973521; Tue, 07
 Apr 2026 09:56:13 -0700 (PDT)
Date: Tue,  7 Apr 2026 09:55:50 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260407165551.3075684-1-irogers@google.com>
Subject: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

In particular, header file ordering is an issue in the tools/
directory given the larger number of depended upon libraries.

The order of header file includes was proposed in:
https://lore.kernel.org/linux-perf-users/CAP-5=fUitzKwJONTngiW17XkS7kVr2cDS4cDL_HccJKcnR2EgQ@mail.gmail.com/

Sorting headers is desirable to avoid issues like duplicate includes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/.clang-format | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 tools/.clang-format

diff --git a/tools/.clang-format b/tools/.clang-format
new file mode 100644
index 000000000000..902b2f7456f6
--- /dev/null
+++ b/tools/.clang-format
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
2.53.0.1213.gd9a14994de-goog

