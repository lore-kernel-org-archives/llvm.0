Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093A389A7
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 17:39:08 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id v1-20020a056402348100b00448acc79177so10211961edc.23
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=sHsT3YDwhM+0jjwjlaGB8MngokRR5HRxbTTGftCU/LU=;
        b=j8sE6fYTVOBfnvhd4sm/oSb2hwD47yzJVngf0DKpeOSTOLJyqSvXgsLamHaNOmIod2
         bk4Cr20MDfwnQXpC21xZk16bIy4vhB5m9TzxVLfg8FLLtXWa0NMwUp55v6X8db/RBu4u
         vdLp5YlCTYUbyYd+sFgPsUKaTCh255jBSJoq2cYirvI1sABKKWEaO/BN4DfG0qGZOxSG
         8ecj5Rxospyu93oPYwQ4JpFIxBwVhAWti1sJvk+rEHfbLh2tyqMnpU9Ays9XoM6PLE9d
         HE6IGUKcDaH7wUhycoA8SyjTCVNRAhN3LTXZZScw1D6hva+kRupryuIkReGA4Y2ALlou
         Uclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=sHsT3YDwhM+0jjwjlaGB8MngokRR5HRxbTTGftCU/LU=;
        b=o5kig8JTQqhm7UhHttY6OiuHcBtbT2qD/inp8stXGqOujxa0Akkl8nDLYYN1k0Mdk3
         aFYG0y0QL3yYGnN0Pd6eIZ0LDmUynIhXgdyneHnp3mkI+VO2Q1zNEca+eftl1uWIsk1t
         avJm58ILlMhJRo7p9FVcEBdZsfHJzZo46GnqSLAAT1+/8/0/Kw0uwOrr64T6/r3iZVqe
         UO6ZLpsuFHN6uUfdt1cXxkz2G8r4mVVS8K3vfU/PoEO5ewzFa8AcZ7lrG3cA3HxLusVr
         wQNaj4tRRiTQgOLC2+nfj0gv0EgIWYXZLqjj5ape93cdEAQxEVzEqvnjywnzg/PjoRZs
         bFWg==
X-Gm-Message-State: ACgBeo28twGUvU0ozwU9NPT5Jd24y/99+MG5npk9EgtOETd5ZY+Tkshe
	gnm72CgK+y0uEeJYQ30XlSDisNwGew==
X-Google-Smtp-Source: AA6agR5d9x9s9m+e7YC9j9xzF56Mb/hRV+gwOp4RgArCUr/r/3QBfUwnaKEKW086XZceJHRKAbUD+9w+eg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:ba52:c371:837f:3864])
 (user=elver job=sendgmr) by 2002:a05:6402:d06:b0:440:3e9d:77d with SMTP id
 eb6-20020a0564020d0600b004403e9d077dmr3852449edb.286.1662572347297; Wed, 07
 Sep 2022 10:39:07 -0700 (PDT)
Date: Wed,  7 Sep 2022 19:39:02 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220907173903.2268161-1-elver@google.com>
Subject: [PATCH 1/2] kcsan: Instrument memcpy/memset/memmove with newer Clang
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, stable@vger.kernel.org
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
 kernel/kcsan/core.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index fe12dfe254ec..66ef48aa86e0 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -18,6 +18,7 @@
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/sched.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 
 #include "encoding.h"
@@ -1308,3 +1309,29 @@ noinline void __tsan_atomic_signal_fence(int memorder)
 	}
 }
 EXPORT_SYMBOL(__tsan_atomic_signal_fence);
+
+void *__tsan_memset(void *s, int c, size_t count);
+noinline void *__tsan_memset(void *s, int c, size_t count)
+{
+	check_access(s, count, KCSAN_ACCESS_WRITE, _RET_IP_);
+	return __memset(s, c, count);
+}
+EXPORT_SYMBOL(__tsan_memset);
+
+void *__tsan_memmove(void *dst, const void *src, size_t len);
+noinline void *__tsan_memmove(void *dst, const void *src, size_t len)
+{
+	check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
+	check_access(src, len, 0, _RET_IP_);
+	return __memmove(dst, src, len);
+}
+EXPORT_SYMBOL(__tsan_memmove);
+
+void *__tsan_memcpy(void *dst, const void *src, size_t len);
+noinline void *__tsan_memcpy(void *dst, const void *src, size_t len)
+{
+	check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
+	check_access(src, len, 0, _RET_IP_);
+	return __memcpy(dst, src, len);
+}
+EXPORT_SYMBOL(__tsan_memcpy);
-- 
2.37.2.789.g6183377224-goog

