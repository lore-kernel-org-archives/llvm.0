Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AA3570B1
	for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815652; cv=none; b=WEJKDb5S59oX95IG+pWtGWPLx2AFEXHb105ISIUHBoycaTz9GMeIaeLLROnu/8kqEkf9SyqJYE4IKREN7Gn4HPIYHkRCEiykhwhjpRqjq8BqGBno3jv3btcgWLUdWHWpiwPyoeNtiL2CjksRpKSbGindRFOjJEzX6hALzH3YLho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815652; c=relaxed/simple;
	bh=KgBNkhyWNQ2k0IPDloVTMBnOWkgGfX49s05GA2EIxpQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UbsSPOF4Kp6mG34WFm+zDFFkpfBW4dNn0iUsm4UfYOpBN9R8gxBrUvRCvEokL/aZSAst+HVvXoIRUCNXsqDrFXi5xu09f8lEEUdPZtXK0Jt8XStGoahLKzinufPRctjSupPrfqoCFm5ES09xB0ItWgp72fMOu4pak/EpCxyf0w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mLg6eVDO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mLg6eVDO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47edfdc6c1aso34026155e9.3
        for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768815648; x=1769420448; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVzjIjtVdiVPjpEIkbADcVmmkIUg4nu9DkgIt9tpdDQ=;
        b=mLg6eVDOgPMnFjde2MB8/JGg4VrBbEAUUPfkGvNXtfIFShbr24uFAZVjEzDs3z7f/K
         EWlPA2GeZhy+LLielRhfBUpdDYg1XH3YpDtqaTqPyeobTycw5/o6/UsIsdAkEcaVdxFx
         UPyTw6AEZmQXWVCvByUPFz6igDD4ueDzV91PWfJuDYxAzoDbfPtdvfiPkbNjgEYb9XSI
         Zl176Hq8jlzOiuDRcfNF9eyMqqbXiMgNBDjb1p2vuNc8cxAIIge1GAO8zlpyrJ5/deK/
         l7xKhN7NjNnwNBWaWAA8Fv+AiYCtifgV9+9Q1F7ZNbCpljApdaZQnIsJFgzR4oyVnneW
         c2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815648; x=1769420448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVzjIjtVdiVPjpEIkbADcVmmkIUg4nu9DkgIt9tpdDQ=;
        b=KOSYo87PnGe//Xy00mEbbvYS/xsJ5UHebXQb18GDPJixxOuZULDsIoSUl+5b3BjVG5
         7ZpYFlK4WhVwDADU+W9B28hyGc/D/IocYbX4vE1t3SrBz7J96QdtJSdUkpNN6o0BJ/ya
         IM1cn9sFIRwfYjbpuJoV6Kwr929VC/e4lNbuoze6bpDLYrhM7hdZIrOq3qeE9Wcw6ZqR
         E4kBKTbyFPH2zveiW295ZLcX3CuL90BU0EtEmu/wJe8wlMCikUwl4e6XMSflGXt9SacS
         7bXt75+3NrHTSalhzX1uOf55TaPES+xHfj1+A6Xzr4BNDcp+ZRQRfTo5M+fov0IN5zDC
         iRuA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Nwkg+MrisMOK7z4RW/7BlDJi7XNmN4G1lJN80rDxPu4h/qEhsAf2rf4VHcHZPyprKofj@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/IRQ3mSWhDFyxLEH0O5UY+y5PqKSCyfgh37pCS0t2KjO4sWCV
	97RJ4l/2ik83i49B2b8wkuG1paLhFjqyqTJixSZJivY2gVwqe8fFsprPEqKYKR2r6AiChZu9lCw
	nTw==
X-Received: from wmaz14.prod.google.com ([2002:a05:600c:6d8e:b0:477:a1f9:138c])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e89:b0:475:dd89:acb
 with SMTP id 5b1f17b1804b1-4801eb035ecmr125513305e9.22.1768815648401; Mon, 19
 Jan 2026 01:40:48 -0800 (PST)
Date: Mon, 19 Jan 2026 10:05:51 +0100
In-Reply-To: <20260119094029.1344361-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260119094029.1344361-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119094029.1344361-2-elver@google.com>
Subject: [PATCH tip/locking/core 1/6] cleanup: Make __DEFINE_LOCK_GUARD handle
 commas in initializers
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Christoph Hellwig <hch@lst.de>, Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche <bvanassche@acm.org>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Initialization macros can expand to structure initializers containing
commas, which when used as a "lock" function resulted in errors such as:

>> include/linux/spinlock.h:582:56: error: too many arguments provided to function-like macro invocation
     582 | DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
         |                                                        ^
   include/linux/spinlock.h:113:17: note: expanded from macro 'raw_spin_lock_init'
     113 |         do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
         |                        ^
   include/linux/spinlock_types_raw.h:70:19: note: expanded from macro '__RAW_SPIN_LOCK_UNLOCKED'
      70 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
         |                          ^
   include/linux/spinlock_types_raw.h:67:34: note: expanded from macro '__RAW_SPIN_LOCK_INITIALIZER'
      67 |         RAW_SPIN_DEP_MAP_INIT(lockname) }
         |                                         ^
   include/linux/cleanup.h:496:9: note: macro '__DEFINE_LOCK_GUARD_1' defined here
     496 | #define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)                      \
         |         ^
   include/linux/spinlock.h:582:1: note: parentheses are required around macro argument containing braced initializer list
     582 | DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
         | ^
         |                                                        (
   include/linux/cleanup.h:558:60: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     558 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         |                                                                         ^

Make __DEFINE_LOCK_GUARD_0 and __DEFINE_LOCK_GUARD_1 variadic so that
__VA_ARGS__ captures everything.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/cleanup.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index ee6df68c2177..dbc4162921e9 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -493,22 +493,22 @@ static __always_inline void class_##_name##_destructor(class_##_name##_t *_T) \
 									\
 __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
 
-#define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)			\
+#define __DEFINE_LOCK_GUARD_1(_name, _type, ...)			\
 static __always_inline class_##_name##_t class_##_name##_constructor(_type *l) \
 	__no_context_analysis						\
 {									\
 	class_##_name##_t _t = { .lock = l }, *_T = &_t;		\
-	_lock;								\
+	__VA_ARGS__;							\
 	return _t;							\
 }
 
-#define __DEFINE_LOCK_GUARD_0(_name, _lock)				\
+#define __DEFINE_LOCK_GUARD_0(_name, ...)				\
 static __always_inline class_##_name##_t class_##_name##_constructor(void) \
 	__no_context_analysis						\
 {									\
 	class_##_name##_t _t = { .lock = (void*)1 },			\
 			 *_T __maybe_unused = &_t;			\
-	_lock;								\
+	__VA_ARGS__;							\
 	return _t;							\
 }
 
-- 
2.52.0.457.g6b5491de43-goog

