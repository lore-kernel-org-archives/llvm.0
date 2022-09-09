Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9E465A
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 07:38:55 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id oz30-20020a1709077d9e00b0077239b6a915so581855ejc.11
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 00:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=CwJgI/zqEG/WNCJEuUp+CMHdoz4DAXmnbuoZdi14Bqk=;
        b=nx4UO6FGWdB0vzP8FiBCRGi6jWAecwwGmolsdjQeS05N/w/aqKfjKcXAYVgegeQje0
         bqB/2LoH0zy2VvDaVaMjkhOmK7jEHBFQ0bxK8+tFG309lQiFZBL9hQqHXBqa2uHZ+ISO
         vSS9lWhdz4gtoi0yFjfirj42Ywv5YL08vEHsKsmwS2258lt8g8bziZI3VT42AtyowGTo
         tyUkMkyFR4ifx0HtUF53XLpG5aW87CT5KGtWoB0X2/5QUn+I+rUr79GU9LDlTZzsgUA+
         MZRGI7gznSV5BWKds3sFjufh/v40H+2KpNALNG9bdu2PV75mdnduygY/DEZ1vQTGj20n
         JjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=CwJgI/zqEG/WNCJEuUp+CMHdoz4DAXmnbuoZdi14Bqk=;
        b=ECNL5hj5FyDfurcw5KJKPEOqCrPuf78WvACjErVROJVOuGEXeWrNGZB4rFciJlzmnu
         szDwNv4FAXK1X2awvOVmwIMdSV1LCmc3KJvT1C18SBhDyQDMeq1PgC8Bjj1bkRNf74UY
         pgV8TOz67KXd8xCO0VGNXAFQF2tL9ta2qF/a6bbnYRVesE+67YzQI73fid+tvp5YJS06
         1RtVd7Oc2q+hCz5HdOamwkmQC2xtaI0kM3GEY7AHdhOnSUpmnrcNT58YGWwnx4PlIKEd
         jpmEcMeXwoLRit5EBbVoBD1o2g5i1erAH/uG/RkpOKdFY3bDvm/jXG7K/K4xCiW93LMQ
         0LIA==
X-Gm-Message-State: ACgBeo0k+7xQHSxfqy4Bq2+Kl0gzlClW/bsKRPBQihxcD/o2j0CmppsL
	y+HwLsGsCzQd0m6xguElh23HNt+gpw==
X-Google-Smtp-Source: AA6agR55zHiBLxwKUigYV5E03IlRE8G/bXLTNM2ZQLcfJB47hg02LfbZ5lxPABjqhEP6sHcAmk436ldycg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:1d1e:ddcd:2020:36c2])
 (user=elver job=sendgmr) by 2002:a17:907:3f26:b0:770:8852:9bed with SMTP id
 hq38-20020a1709073f2600b0077088529bedmr7603132ejc.658.1662709134191; Fri, 09
 Sep 2022 00:38:54 -0700 (PDT)
Date: Fri,  9 Sep 2022 09:38:39 +0200
In-Reply-To: <20220909073840.45349-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220909073840.45349-1-elver@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220909073840.45349-2-elver@google.com>
Subject: [PATCH v2 2/3] kcsan: Instrument memcpy/memset/memmove with newer Clang
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-s390@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With Clang version 16+, -fsanitize=thread will turn
memcpy/memset/memmove calls in instrumented functions into
__tsan_memcpy/__tsan_memset/__tsan_memmove calls respectively.

Add these functions to the core KCSAN runtime, so that we (a) catch data
races with mem* functions, and (b) won't run into linker errors with
such newer compilers.

Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Fix for architectures which do not provide their own
  memcpy/memset/memmove and instead use the generic versions in
  lib/string. In this case we'll just alias the __tsan_ variants.
---
 kernel/kcsan/core.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index fe12dfe254ec..4015f2a3e7f6 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -18,6 +18,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/sched.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 
 #include "encoding.h"
@@ -1308,3 +1309,41 @@ noinline void __tsan_atomic_signal_fence(int memorder)
 	}
 }
 EXPORT_SYMBOL(__tsan_atomic_signal_fence);
+
+#ifdef __HAVE_ARCH_MEMSET
+void *__tsan_memset(void *s, int c, size_t count);
+noinline void *__tsan_memset(void *s, int c, size_t count)
+{
+	check_access(s, count, KCSAN_ACCESS_WRITE, _RET_IP_);
+	return __memset(s, c, count);
+}
+#else
+void *__tsan_memset(void *s, int c, size_t count) __alias(memset);
+#endif
+EXPORT_SYMBOL(__tsan_memset);
+
+#ifdef __HAVE_ARCH_MEMMOVE
+void *__tsan_memmove(void *dst, const void *src, size_t len);
+noinline void *__tsan_memmove(void *dst, const void *src, size_t len)
+{
+	check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
+	check_access(src, len, 0, _RET_IP_);
+	return __memmove(dst, src, len);
+}
+#else
+void *__tsan_memmove(void *dst, const void *src, size_t len) __alias(memmove);
+#endif
+EXPORT_SYMBOL(__tsan_memmove);
+
+#ifdef __HAVE_ARCH_MEMCPY
+void *__tsan_memcpy(void *dst, const void *src, size_t len);
+noinline void *__tsan_memcpy(void *dst, const void *src, size_t len)
+{
+	check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
+	check_access(src, len, 0, _RET_IP_);
+	return __memcpy(dst, src, len);
+}
+#else
+void *__tsan_memcpy(void *dst, const void *src, size_t len) __alias(memcpy);
+#endif
+EXPORT_SYMBOL(__tsan_memcpy);
-- 
2.37.2.789.g6183377224-goog

