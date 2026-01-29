Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58BF2FC004
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 00:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648224; cv=none; b=rbsMIVjM2RqYxXr7T0Jnbrzs4Y21rO0+87V4dZiUZZamUiITYSrlhO7mrW3Ly+9zRqjczsUGzsEVYo+Ueo5cYTBRoszRMfn8ih/re89tw/5cnm5kjhjLDgOEgB/7IMjil296JW/Lus6iDLqB0z55SA/VIzJOxSx87REzDJKXnMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648224; c=relaxed/simple;
	bh=h+6CO9INn+2XL4U9JHeOtddCEAyJ9YJLjzkVO1qGO/c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ConaL46F3dRJQofuaBfyHoQOpEj0RWPo/BRvahd91awu19MLAGaFNLTcRMkpV3VPwI+ZBNhgKRIA0sl1BNpUKqwwjEQfkVl+u/hVp6PPW428llA+hzcXCJkZOV7oeHOxBlAVXZkq4YCbf+q6KQEyU1UWqYwG33Z06IG7Q6iWmXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=obmDtd1v; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="obmDtd1v"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47edf8ba319so3058535e9.2
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 16:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648221; x=1770253021; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0NjJX+kK82UqSM94A1K+UHi4bU7NWZzsNdcUlluZDA=;
        b=obmDtd1vVHwx5NXMsXh/sR+E2O98S51tJZKzm4xIGnd6Yj4OeTGrvIl8sOGroG9ewr
         8/iW0oJe8tD1Zd+cwDSjHM1CD7hO7RbYQg83DhyEoyzfmQyD9c8Xcg6ePEJ6h3eklazw
         LfVfPdfXu4qjBkDAdwtbzVteLOoPWKdEFnAYir9phb+IciAKSakSXUcJelqvBGiGOiCQ
         wIlxCXHmnDq/n6OwxymNnbaKp7RJpf86uVqQ88gzj8wFkIqAb5YeE4McT/9TD0D3oj8R
         gx2RALpq9ECYymoTy36uNBWjYt32b1g3NGFnqslhRUu08cwM9F3Is4jcxjfJPRp/nCJM
         R8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648221; x=1770253021;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0NjJX+kK82UqSM94A1K+UHi4bU7NWZzsNdcUlluZDA=;
        b=HDEFpm++AzjRVvZEiz7ELmuFG8ge0LpR3HKu/KbSDVUAkvvgX8AYF7tB+qHAdxtxlh
         n/fAqZ4B7g3EAOftIe59U0iTB4Yz5WJMKfArnlBPGUM5NP8iHnNKohbFZAL7285kckN8
         WS0VKgmyetnckIRCSGygESEI8sqRvDOi2sHyIbrv32BoX3KAIDs3OTHOCQj/ThQDjHxk
         KxTD8rZ0k+W7mdD0wH8aI8xg0mxUKK5FZkc+0WYwtXZj6YsZSxmpe+srXhlqK/sSE2Da
         Lrz1OhIAxkQvRkAUXkNZ4cLMp1tinhY0i1QcVGrlQPBXBf7HdyiZdaCNBKOXcG0+ESXt
         qZYA==
X-Forwarded-Encrypted: i=1; AJvYcCVbE1vKbA6xWxLsC+OC5QU8yxwPpbOBQqTcotqv0ECdg9dW+1QFhcBNKEVoCwuFFRUAXuVC@lists.linux.dev
X-Gm-Message-State: AOJu0YyuxLw9RTwFAwkcQFPUbM28uat0L4NtsMre/+fgU/Y+K/c0P+2G
	EHutMJqRDQd6P/98sc3//XJ9/4A9CI4YBqRoRF7q0oO4x++yrBSbaB1jcGmCe2fryV8wRqVNppQ
	t1A==
X-Received: from wmna1.prod.google.com ([2002:a05:600c:681:b0:480:694a:dd63])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b13:b0:480:699c:abe9
 with SMTP id 5b1f17b1804b1-48069c86f58mr73598185e9.37.1769648221236; Wed, 28
 Jan 2026 16:57:01 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:32 +0100
In-Reply-To: <20260129005645.747680-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129005645.747680-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-2-elver@google.com>
Subject: [PATCH v2 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
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
2.53.0.rc1.217.geba53bf80e-goog

