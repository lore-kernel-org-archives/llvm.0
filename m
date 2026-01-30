Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB9F2F657C
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779808; cv=none; b=INDxZDwkGFlL6C7lhUGP3opRbuoo2TIddWnlXMPFMVX1KZrJX9CLAflHzrloBTVikj3GiuMHyXP69gkpbkXf+movW/ph00cMOMAv5P8ZQmgRTm4eqZeIXDsfdi2XYpxpvtg+ORk7ZmWa7nZtVM2+KpA+h/HAMsptsw5wHJQJ/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779808; c=relaxed/simple;
	bh=4XzaSftGKMp+7lfBWzbmLBe6n2finsa7kSDMRym3YHk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VsX1dlWK7LHRutGmhfo97byYuiqrwMZPgGkb1z33EN9Tn/ww4n7zt7WWVo5xHmIACjJhlafBIoUuwIqNuWwAgUSQWwCji+Iwfl5RGTDzPpgACFnhJgaN0PxeY9CIpDKmGPmtVlWFnCa6hNYy5DiqgFQVoWLtEDABS3FfuEDNXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AB4wzXEP; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AB4wzXEP"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-658cb55372dso2940288a12.3
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769779805; x=1770384605; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5gV3Xp+lTWPd5vADH178EfrhS9HF61GnJcWvrSFIRbk=;
        b=AB4wzXEPAhlH7zr1pc1QusMn6HodoqiIA7SCjZ8JsEIqSoAyRWTDaioF73tQkcI+TG
         13OmtNi6Zym58rhP4JhYuH6s/UUpTat3MEkC2mQOjC9PmbDGJ9Ug4zw+kGBC+np5OiwU
         PaAO5IuIxLLNMgWmSxUAmrsKgtfERVlxbTVYofpzbUGybOrBwPitwUj0J+figWRVkLhM
         iNzQO9NxRrbaP10cptVTi4z28Bp0m0AKMBsHWpO+3DtEcpydjhxvctWRpvL6O0aLL/KM
         cxaD38YPQhwy9JNDZrdZvRDzc+uwgDEybSbsHyV6AhMgnemqnYuZ9zhYlJsiHcACm3Kg
         Zw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779805; x=1770384605;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5gV3Xp+lTWPd5vADH178EfrhS9HF61GnJcWvrSFIRbk=;
        b=gRw6hCjBLhjQUoCokXnga3JKZUGdomXnVJmgErEo2SiwCOGlz8/ByRZgJ4lP1k4XVK
         pnqlj0F44q2MzJAI2vRY/qhdS4D5rk72gqlH6hwyKaCF3fLgBi4Sk0jkpg6hPuM6/yco
         yjSlyvxQfk8pjOz2RUkdOslg5jl0L3/uw/gl+8TUIqXmJmkDBRPoLE2dRN3hdOSHLPai
         xtPx6Xp4SQ1+aCuymcyXiHxlIx841TsjLA4p6fMpKlzXfYy/OwsfGXfq9hkDxQZCXG5E
         lyfHW0ZCkdoPJr+8z3EYxXrGqeArQllsAkz8E7moMrz7UCAqBPzgrtn/Lq4YhWDciSsu
         1GwA==
X-Forwarded-Encrypted: i=1; AJvYcCUNaSyg9aqq9/PLhNo7r2XDrsBMi0lRUymBvWhZ1XygAMs+BLJ+UpN6xPQcNs9W/OCK3yot@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj1V5kWTv9gQtXpdq2dI1Jd/PR0mDKkp+n00U+qCuroquVsKoZ
	cjAtl0UtqTKT1IEmhtchmRf4bqne1lb044TWk5jX5+mQAWCaIblz5hXP9vB3kCDQovcmkHpgbNQ
	sNA==
X-Received: from edtc22.prod.google.com ([2002:aa7:c996:0:b0:650:bcc2:4d7a])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:280b:b0:658:eca:1fa5
 with SMTP id 4fb4d7f45d1cf-658de58a598mr1929989a12.20.1769779804975; Fri, 30
 Jan 2026 05:30:04 -0800 (PST)
Date: Fri, 30 Jan 2026 14:28:23 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260130132951.2714396-1-elver@google.com>
Subject: [PATCH v3 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While investigating a Clang Context Analysis [1] false positive [2], I started
to dig deeper into arm64's __READ_ONCE() implementation with LTO. That rabbit
hole led me to find one critical bug with the current implementation (patch 1),
and subtle improvements that then enabled me to fix the original false positive.

Patch 1 fixes a bug where READ_ONCE() on types larger than 8 bytes (non-atomic
fallback) incorrectly qualified the pointer rather than the pointee as volatile.
This resulted in a lack of "once" semantics for large struct loads.

Patch 2 refactors the macro to use __rwonce_typeof_unqual() and
eliminates the ternary conditional.

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

---

v3:
* Comments-smithing.
* Use 'typeof(*__ret) __val'

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.

Marco Elver (3):
  arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

-- 
2.53.0.rc1.225.gd81095ad13-goog

