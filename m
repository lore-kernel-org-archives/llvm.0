Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E61386
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 08:12:47 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id c14-20020a17090a8d0e00b001bc72e5c3ecso909146pjo.3
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 00:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=C6KQ6aJHKI0dII25aQ0ze4CuACInlStiYwqSfgA5I3I=;
        b=Bdit93WWO3+4yT3mJU+gddJMM4TkBq5HHgsa2w2dpfvYcbGMYmzMtxaaQj5JvTmHqL
         e7UF4qnGyfCQT14vwhmY6VX+rbqXTNdiADyR3csjd621pX3mKh5Rhqpbw9eoqBbgeI+u
         dKelmiPG0OV2YkS7vhSSgY2El/8z//C04edJFSVd46mQku9f1eQAWO5uzlWSau7G0weJ
         FuOqt+rXYtqE08tf5e3uPn332EQ2EGRZ51bEbzmdvvDHNbrf4rtQejBzBueYcJO5mbDP
         5V8b3ccP2GsoAXl3tDzDr1RMWqGOtjq796Q256XGhsvvCcFO//1R4H7jSYxRamCeLqWA
         vu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=C6KQ6aJHKI0dII25aQ0ze4CuACInlStiYwqSfgA5I3I=;
        b=IaubYSzB7dJlRikzgoDfWRSvvavNn8hoZFI6LSJbzu8Rq59iUykiJp5bT8P+Tp+LuS
         y0udFDuJFyRwLXGllLJDho6Gv3YtWSNAV3M1JT5eV9ZRzBtz5dnQVQVOlgSnTN88cN9w
         0+UXIE6TpBVGrMcps4Rsqk4uBOHc6FY4lDTZ9fXV1HQaL0jcg3noXc4qB/Zjd4I9Hpcb
         zCIWzXVQSqGeHX3q0lefL3NBafIPlNLfXULqgT4m3bruUZ8wLOt5cvTAva03yc6NXaem
         WLpjWJPZ/XE1CJzVy7zlyvF6KgvwDEANZD20II3jRqFvxdudUICPL36pHILmPP7/A3Cf
         SpkQ==
X-Gm-Message-State: AOAM533Eg7JYhFNWK0PbPutGjE3z3p3WVgloYpWgh9e0+6loGO3CLjYh
	DehrsygBnuFmO63Z9425vuJ8H8OI5gti8A==
X-Google-Smtp-Source: ABdhPJxTkKDtgkqTqiHtkPX7jkV85GKU+KYaUXsfBspbrXrDIO9ZerfwanHOSzOiYAL0O/DmHo81bwNOlasNZw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6a00:1d0c:b0:4e1:9846:3f34 with SMTP
 id a12-20020a056a001d0c00b004e198463f34mr1643800pfx.59.1645690366348; Thu, 24
 Feb 2022 00:12:46 -0800 (PST)
Date: Thu, 24 Feb 2022 16:12:33 +0800
Message-Id: <20220224081233.1765788-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
Subject: [PATCH] um: Remove unused timeval_to_ns() function
From: David Gow <davidgow@google.com>
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>
Cc: linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"

The timeval_to_ns() function doesn't appear to be used anywhere, as far
as I (or git grep) can tell, and clang throws up a warning about it:

../arch/um/os-Linux/time.c:21:25: warning: unused function 'timeval_to_ns' [-Wunused-function]
static inline long long timeval_to_ns(const struct timeval *tv)
                        ^
1 warning generated.

Signed-off-by: David Gow <davidgow@google.com>
---

Warning can be reproduced under clang 13.0.1-+rc1 after applying:
um: Allow builds with Clang -- https://lkml.org/lkml/2022/2/24/40

 arch/um/os-Linux/time.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/um/os-Linux/time.c b/arch/um/os-Linux/time.c
index 6c5041c5560b..4d5591d96d8c 100644
--- a/arch/um/os-Linux/time.c
+++ b/arch/um/os-Linux/time.c
@@ -18,12 +18,6 @@
 
 static timer_t event_high_res_timer = 0;
 
-static inline long long timeval_to_ns(const struct timeval *tv)
-{
-	return ((long long) tv->tv_sec * UM_NSEC_PER_SEC) +
-		tv->tv_usec * UM_NSEC_PER_USEC;
-}
-
 static inline long long timespec_to_ns(const struct timespec *ts)
 {
 	return ((long long) ts->tv_sec * UM_NSEC_PER_SEC) + ts->tv_nsec;
-- 
2.35.1.473.g83b2b277ed-goog

