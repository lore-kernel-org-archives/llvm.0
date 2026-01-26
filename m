Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6B625
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769387584; cv=none; b=EJI9YtLpAXMEPufCePma5/qlcGg4uqYY8gBiKeJ0EzFUl2tTJUZG9JOtZdLZ/+csFlafDHsPtKAD5HlHCNDtrJZ2yEcsW/Hi+LHLkl+VvBkk/VuTijCFbiX3ZgbanwJghoNkitLmSpL1j2KoqKgkI6NkaNFCjc7rh7/8ixBrwfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769387584; c=relaxed/simple;
	bh=mhB7SsK4rd/dcahtJD51o0o+LgrIzabQkW905TGIH4I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FkgOzahube+ykhe/7nxSyUd5arU5aRZKegURWnKC6LXoj6PWuf8Kto9L8rHUE4/uiPANMl8j9V5vyV1VIizEFZJAo5NeliaNV20HpcBmR0DFKD8/AhFiXUUQGGulH7bX5kPkWle+HjTB2ek9K9mjAcFquVvdoUtKmwPbJFyy0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cy/8uOQH; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cy/8uOQH"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b844098869cso359195466b.2
        for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 16:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387581; x=1769992381; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SLUD9kqtzHxYW5dCA5OGESTleTXqSLmFV9783ZIDQu0=;
        b=cy/8uOQHwdjxsdB+dhc4y41pTN1i1n1JxOfDVj0tue2o/diz1raG8RlrcKuUeuK6I2
         UEI9FTKG2I83Ne/hOi8ElNcJQ81+STs8FSOYLCkdJGAuiAB2TXOjbpFAhgEZ5hbbMtO7
         WEOo/cA/GP2Lu/5AoFumxgpXwOBuz/4HP65qPoH864kCdW7Nk03naQwXwfN/spWqCOtB
         POBQsadPJTBlpsG4snJwwtA+BPTJ504Tc2cRxPbW+Gm5QmUtkMlC0AA0aQV5/eGIRzmK
         ipXTB7l7V8mns3RFXSNAR7ONHZvHWOMZPt17e7tcvQIEf0PdlDzeSpo1n6POsyEdROw7
         uWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387581; x=1769992381;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLUD9kqtzHxYW5dCA5OGESTleTXqSLmFV9783ZIDQu0=;
        b=kq9B7mRl1tpVWv15wSEFNUhdmistHTQ4i9Jb/82+By9/gYQs2Vgd8bD8/yCkB87N05
         bEfuBz3UhvH29DHwg08QZ7Ryyk2luFFEUCZCFvmwpzGy2BK/dH1v4UyCJI8HAHUaG30v
         /SgDZp0U2c8jsJXmB9nVa0wIfDVkPU61kIVef3X9Y2Prac8r7udGlAgFLRk+pSw+QO5d
         hvmpufC28/caK9a7L2oqknV+5dJoHtKwHO546yFt1Vx3pgibPhFT5SBRo9VgyODnCwpV
         9ZlB9pNETdJuRkt0w4jTwOpMatVIIEoVdWu7O79SZJ/mU1e0B5KjV+Eni7G6slAESrQe
         6irA==
X-Forwarded-Encrypted: i=1; AJvYcCXRpyAJFvzS+J+qHg7qwb+fP2/7694TMXRs89mp2fz3FRukN17UuaR8NmNmxtMqKyAqYAtk@lists.linux.dev
X-Gm-Message-State: AOJu0YxrWpgsk6sDVoqjuzp++NPs3TfhslwmQRrkUQR1fwz5QoFe23cM
	jQKVwf/aETmpzc2N7B8W7MVQC4bCW54QsrVixvUZvzvZWGsDDjOyh4s1pwmAX1upaiTpi6a/1Ni
	i0A==
X-Received: from edon6.prod.google.com ([2002:aa7:d046:0:b0:658:38d0:b315])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:97d5:b0:b73:8639:cd96
 with SMTP id a640c23a62f3a-b8d20dec1d3mr172240066b.24.1769387580903; Sun, 25
 Jan 2026 16:33:00 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:09 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-1-elver@google.com>
Subject: [PATCH 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While investigating a Clang Context Analysis [1] false positive [2], I started
to dig deeper into arm64's __READ_ONCE() implementation with LTO. That rabbit
hole led me to find one critical bug with the current implementation (patch 1),
and subtle improvements that then enabled me to fix the original false positive.

Patch 1 fixes a bug where READ_ONCE() on types larger than 8 bytes (non-atomic
fallback) incorrectly qualified the pointer rather than the pointee as volatile.
This resulted in a lack of "once" semantics for large struct loads.

Patch 2 refactors the macro to use TYPEOF_UNQUAL and eliminates the ternary
conditional.

Building on the refactor, patch 3 fixes the context analysis false positive, by
helping its alias analysis "see through" the __READ_ONCE despite the inline asm.

## Note on Alternative for Patch 3

An alternative considered for the Context Analysis fix was introducing a helper
function to redirect the pointer alias; specifically passing a pointer to
const-pointer does not invalidate an alias either (casting away the const is a
deliberate escape hatch, albeit somewhat unusual looking). This approach was
slightly more verbose, so the simpler approach was chosen for now. It is
preserved here for future reference in case we need it for something else:

	static __always_inline void __set_pointer_opaque(void *const *dst, const void *val)
	{
	    *(void **)dst = (void *)val;
	}

	...
	__set_pointer_opaque((void *const *)&__ret, &__u.__val);
	...

[1] https://docs.kernel.org/next/dev-tools/context-analysis.html
[2] https://lore.kernel.org/all/202601221040.TeM0ihff-lkp@intel.com/

Marco Elver (3):
  arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog
