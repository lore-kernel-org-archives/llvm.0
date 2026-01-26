Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F8548EE
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769387591; cv=none; b=JZpyCQgMl45mT3n2o7c/q2G0CeJa4whvN6GMU0MuA20xclX14CTCwogBrH0B5Sk+vGF1nF5OsHgCTLS/trMVzUm7tuBlWTuXjjM+nHYfJ/NbNr9+h45O+wF1O0RngR8jNcsSmbM9oa7a50fNNnDkWVhwkLuWF6aJuyROEi6B5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769387591; c=relaxed/simple;
	bh=LHP7vc+QAjKrcQ/nSd8XnShnI8hVZmkUtqzqx890SiM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=merDEak+b7EtRKpod/nz5KNh8JWJFzxuJR9q2hKLBrlyAb59KCIaC8qXQ5/E5u5cDs3pLZNeC8SyjJMSeQ5yoRQIQrrwFJJDsL845p9ezpBWtnTrm8QuoRav9Dm01ca5fAGdVtAYQML35VpueDpb+5W3bGmSGJWhGPTzPrRirTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ASehYyKL; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ASehYyKL"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4804157a3c9so43412955e9.1
        for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 16:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387587; x=1769992387; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+0aVR3neN19eb/78h0OkLoTFjYmtJx01fQbpzy1/E0=;
        b=ASehYyKLqvTGxdJiZIWWLdwcLYWqolOSralHCSlefNlbhYUjkkjzfq58LTtFW76GYa
         Yge/hd2OsbbJ3fTWgOG/xsfqmhu+ocIA/5xFWcWHt482pUSwij3g0x9j7G95oFADkBWR
         q3eijgmxJQpihYdv4K2ypwV0f/EfCkNBDp6xutbc5QX7AEkUuJue+aW8JspK1cV7tOXE
         Isd4r+KGjHZBJOJ0wQiT99e/fhvxADhfY8kUobBzrI5P3cFx3RahkiwGMlZzaqtUR0bq
         3U59WCGSv7VlZncRjk6j2COS0FOTrKgWzvvHKivXBKk9TULrMMdLpVd83/dE0ZDLfKN6
         60eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387587; x=1769992387;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+0aVR3neN19eb/78h0OkLoTFjYmtJx01fQbpzy1/E0=;
        b=DsOgcwPu2oyJb7AwuaPabJqdw0DfR0pGJDkiJNiU6mqLwYX5Ff7/MHguyX4s+NFJIM
         3rD6LEeFz7d1x+s+Dg2HU2qh/o9tMeqLZlF1TlwEiqaFLH+d+xfJNW0dD70DygrkUl5X
         LHB+DL8aIwzOkIYAPdOq5qr7CxNKdbg/Xtzn1x6PJ3urv3fYNoaZIrqu7GzZ+km5S3wk
         nlI55Z0+Jgcb4ZeedyYW02CZNKJErxhSdEJ10B9uSiVB85heOYCs77Ey+k0Mop2zbL+O
         3h5hy3XLY3zqxBTpInx+UBoqv7X3qLjn8v7RHvRELIEtZGNlsh3rVG2MoxuPAqrtN0aJ
         ivtA==
X-Forwarded-Encrypted: i=1; AJvYcCUaJc3DdfWWCx4wqK4bby/G0SrDi3sQ1EQo4SR0jUjSxDaPY2gaOkfOFRob6+HKqz8POrRd@lists.linux.dev
X-Gm-Message-State: AOJu0YxnIgn4dGo2U5w6fDaIbwG01H+lxf1UIm5YUfqQISbOoLwSVruy
	Xt65beUbd6raoQ0J5NWTXvVwyES0dQUGJJTG+Fd3Xop8LpbtTikrONFRn5/7yH3eunI7F10LYsR
	IGA==
X-Received: from wmne21.prod.google.com ([2002:a05:600c:4395:b0:477:a181:1922])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:6405:10b0:475:dde5:d91b
 with SMTP id 5b1f17b1804b1-4805f624d56mr26596795e9.17.1769387587598; Sun, 25
 Jan 2026 16:33:07 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:10 +0100
In-Reply-To: <20260126002936.2676435-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-2-elver@google.com>
Subject: [PATCH 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
qualified the fallback "once" access for types larger than 8 bytes,
which are not atomic but should still happen "once" and suppress common
compiler optimizations.

The cast `volatile typeof(__x)` applied the volatile qualifier to the
pointer type itself rather than the pointee. This created a volatile
pointer to a non-volatile type, which violated __READ_ONCE() semantics.

Fix this by casting to `volatile typeof(*__x) *`.

With a defconfig + LTO + debug options build, we see the following
functions to be affected:

	xen_manage_runstate_time (884 -> 944 bytes)
	xen_steal_clock (248 -> 340 bytes)
	  ^-- use __READ_ONCE() to load vcpu_runstate_info structs

Fixes: e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y")
Cc: <stable@vger.kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/rwonce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cd..fc0fb42b0b64 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -58,7 +58,7 @@
 	default:							\
 		atomic = 0;						\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.52.0.457.g6b5491de43-goog

