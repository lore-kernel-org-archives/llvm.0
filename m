Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263E1A5BB1
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865872; cv=none; b=F33mVE/IKoJe/eSuXWNMZRKWETIo/Im5ck4kRe3rafwYKS8sdjKxAvJxfQPC8Mq06pPJOv5HoiDtRCthBHYTJHY5hKFcvmNAjlJ4CBW7FxDatOUhoj+rN0P0/6vzs2ZEfRf+JT1UikIDSrz/WM+LIqo1qu7bd+ojT+WuCx8uH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865872; c=relaxed/simple;
	bh=yFPTPmKgM1WyRS4/pLwj/qD4AEqMsgmnBOUoRJkxsqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EEkk4Lcm5oOMqt1fudLpoYwQH1ylo5OLfmJyc5Ip76JdBoLUHNDcx4pkll9OHfVQY53yvfw+SQjo2EjvqNTSi6O01yA6/4Z9QycNxJx4+6CjzfTTqUOQKJK1AIl7FF/Cmifd0bJ6glIeHHn+HsOEYygEA7kPiytyLYgHwSgRMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gQMXH2wT; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gQMXH2wT"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5dca72b752fso1293067a12.0
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738865868; x=1739470668; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qF82DJs8+giiKRyetuSOsU+JANR9VCfWNPadmkefX9I=;
        b=gQMXH2wT2gsoqS+sJS3eFc22Ytm935JlWQt4lnks6yMRU0lPvaDWOFYMm/+IFKkqZL
         x2vVqYu4tOvktmgqgC3fK6sKAPs3NZVsoEzxxFGcAH8zt1iQq73R3nDSCJXPErfAEtqP
         r+TqY1PUQL+R994gRHTTagh/3cXuPAin6RIJCNJILYS0VbVyLIvfVX+9x810u6hprE07
         sbbA+KNdYmLuYvAVdA/AwdDzTdeCYcbNr0GwAw/ybZz8iuSFwC00/1dJ5qf6cWKgSq2A
         OnqhWjWtU1yQ1z6BzsyioNHbrf+aOBRZ7IXIr6kWn7mx/la9QVT4hAMwfO5w3pOhv87H
         tAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865868; x=1739470668;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qF82DJs8+giiKRyetuSOsU+JANR9VCfWNPadmkefX9I=;
        b=wUevDSKnPXd8yE72nf5lOGHmzpoOI4FTi8EnQqJxfxbIBEJ75BHLXiNwfJp2WnKS6q
         W/RWtPzjgtHLEa29Z+XAHnKj5AVrqGEEwUK8RRzW4VOD4dhkR2XklNdDX4No3QbmnEmp
         OJsKeK2Lc6jqhDJpx0F9gKi/CEyo2Ig6TINKXNd9RO05JomRm6RflfhlEVNedlBG8KeX
         Px0CJm383AB63Xcpm+ZWre2sg75ccdKicFrVrEaFWXmHeOoCgI+/nAACZw4X6NgbgIdz
         nL7oyGW9QK5zNJe41Uh8DAvDCUchLZ9fm0i5stUminzNvP0NKV2ErKDYI/7ZkzQUdNBP
         ZqzA==
X-Forwarded-Encrypted: i=1; AJvYcCV92YvERR3PXWogpCSeaqAq49t6REOEI2uPcHiU5IT8iqjXyQS6+VDVBesmv+Tn6+BVltof@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsk0oF0q1tN98U92QI26pYym0DJIoilUkxthNwtgjtL6Nm3PAM
	D7TCWCfRjaNriv1TIbDI8DeG1M8pGhxf1nBDfCwdhBnIdCdRreQT1ZC9YAazAkmEl/3c23hq5g=
	=
X-Google-Smtp-Source: AGHT+IFhkhtKPOLjUVtcZrbrdXay8cNt9Gf56kNUcmjSPeBOeQQDqEs7f95+SgyQPwoEkhsZdOCvuOgK1w==
X-Received: from edbcs11.prod.google.com ([2002:a05:6402:c4b:b0:5dc:22e2:2325])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5290:b0:5dc:5a2f:a726
 with SMTP id 4fb4d7f45d1cf-5de45072314mr470242a12.22.1738865868148; Thu, 06
 Feb 2025 10:17:48 -0800 (PST)
Date: Thu,  6 Feb 2025 19:09:55 +0100
In-Reply-To: <20250206181711.1902989-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206181711.1902989-2-elver@google.com>
Subject: [PATCH RFC 01/24] compiler_types: Move lock checking attributes to compiler-capability-analysis.h
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The conditional definition of lock checking macros and attributes is
about to become more complex. Factor them out into their own header for
better readability, and to make it obvious which features are supported
by which mode (currently only Sparse). This is the first step towards
generalizing towards "capability analysis".

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/compiler-capability-analysis.h | 32 ++++++++++++++++++++
 include/linux/compiler_types.h               | 18 ++---------
 2 files changed, 34 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/compiler-capability-analysis.h

diff --git a/include/linux/compiler-capability-analysis.h b/include/linux/compiler-capability-analysis.h
new file mode 100644
index 000000000000..7546ddb83f86
--- /dev/null
+++ b/include/linux/compiler-capability-analysis.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Macros and attributes for compiler-based static capability analysis.
+ */
+
+#ifndef _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
+#define _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
+
+#ifdef __CHECKER__
+
+/* Sparse context/lock checking support. */
+# define __must_hold(x)		__attribute__((context(x,1,1)))
+# define __acquires(x)		__attribute__((context(x,0,1)))
+# define __cond_acquires(x)	__attribute__((context(x,0,-1)))
+# define __releases(x)		__attribute__((context(x,1,0)))
+# define __acquire(x)		__context__(x,1)
+# define __release(x)		__context__(x,-1)
+# define __cond_lock(x, c)	((c) ? ({ __acquire(x); 1; }) : 0)
+
+#else /* !__CHECKER__ */
+
+# define __must_hold(x)
+# define __acquires(x)
+# define __cond_acquires(x)
+# define __releases(x)
+# define __acquire(x)		(void)0
+# define __release(x)		(void)0
+# define __cond_lock(x, c)	(c)
+
+#endif /* __CHECKER__ */
+
+#endif /* _LINUX_COMPILER_CAPABILITY_ANALYSIS_H */
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 981cc3d7e3aa..4a458e41293c 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -24,6 +24,8 @@
 # define BTF_TYPE_TAG(value) /* nothing */
 #endif
 
+#include <linux/compiler-capability-analysis.h>
+
 /* sparse defines __CHECKER__; see Documentation/dev-tools/sparse.rst */
 #ifdef __CHECKER__
 /* address spaces */
@@ -34,14 +36,6 @@
 # define __rcu		__attribute__((noderef, address_space(__rcu)))
 static inline void __chk_user_ptr(const volatile void __user *ptr) { }
 static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
-/* context/locking */
-# define __must_hold(x)	__attribute__((context(x,1,1)))
-# define __acquires(x)	__attribute__((context(x,0,1)))
-# define __cond_acquires(x) __attribute__((context(x,0,-1)))
-# define __releases(x)	__attribute__((context(x,1,0)))
-# define __acquire(x)	__context__(x,1)
-# define __release(x)	__context__(x,-1)
-# define __cond_lock(x,c)	((c) ? ({ __acquire(x); 1; }) : 0)
 /* other */
 # define __force	__attribute__((force))
 # define __nocast	__attribute__((nocast))
@@ -62,14 +56,6 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
 
 # define __chk_user_ptr(x)	(void)0
 # define __chk_io_ptr(x)	(void)0
-/* context/locking */
-# define __must_hold(x)
-# define __acquires(x)
-# define __cond_acquires(x)
-# define __releases(x)
-# define __acquire(x)	(void)0
-# define __release(x)	(void)0
-# define __cond_lock(x,c) (c)
 /* other */
 # define __force
 # define __nocast
-- 
2.48.1.502.g6dc24dfdaf-goog

