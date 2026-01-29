Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076142F9998
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648221; cv=none; b=s73VdCt2rPjDA0Tv70IMCyF6uRr8yX99PPhrJze5D5L0+ya8ATboABmABqbeG2lkXNgMc3PcIOmYFfMb4JswoBiwDLYA9pDmhKCqlsyL9I7mlP64XHimtAOsCLmXmdjMgPaDxX+IouLpwcPq68eZphkMdbuYj26mSrCfHCqt7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648221; c=relaxed/simple;
	bh=3jTwrrwI2J6lukKx9GQ9B648virwtCl6c+cXw1i3stk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Gc/ZjOuoSGPYtJus+1jzELnelQ5jwk9wD4cyF9O4MVRBkAsOOxlzyV6z+6j3Usmwj5Aev3ZptLqm0l7L5P7o7Lq1JLvf9wFHHcDoRmz65fsLP65xERFY5yzPW1AtRXvkZU5oye4B/aR63dR/UmZRX6CVFFZBlp0hWy6aD0VqpIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S3JDNQFX; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S3JDNQFX"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8d78d3fabfso121155966b.3
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 16:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769648218; x=1770253018; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZukGKueGp87OrsWwJYFUiCCf9dq8hTvBab+Jn9rxA6I=;
        b=S3JDNQFXh+6TQOV/dBsimsm8D5rLpmrs78jfz/8t7AGAiM56SLTCld8jub3LieHK/N
         47oh3N33D1XqA/JY4k6y0Jmnxlvxvnmgc+l5GHqAFUwUWY8zKhmQrPvQdiSqDIwJaVG9
         QjAgwscH3nhxet3aNkDF/jHBhxcDCTGGBngcJ/DjZ8GRejoM28PoHo3L+aye5+/tvOod
         pDI5R8/OwYTGN9b1k9GmncatgUthiiPwxQH8X+pXwDIT5zJ+LSU/XGVqOoBw/FEY0fRT
         FHg8ryGsCf7hmyuIKnzO77JMkXyv6RoUf7d3kNtoKnbuFJMdR4lsQ3bvWMmekFIQUqPm
         PzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769648218; x=1770253018;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZukGKueGp87OrsWwJYFUiCCf9dq8hTvBab+Jn9rxA6I=;
        b=Lz2QCRPQJq8YgPo8CXk0QKxZOJPGJujqtEcqWfC/Rw4IclKFeMab0qqfxHhMbyYvJz
         UMr+dcMl1RLcXEfC3pJvoqBzazwyG5qf2QC6kpWJ44O326bkYVhKaZTdCHjz43NgqIs2
         LSNGWE+9P4ScE8mXQp9YWH1JlChc6CNHlLCC4TADa26hGk+vWXBY4rvcSW2KWa/Ma3mP
         k/koxENIv+YLIqUkrUsqm4h/F1b/67fH/5hZ4CfktXeAVkVis0vE3i1mq8h0LiF3Emyk
         TGaBXur7ETcsqHhHkW5a06++MxfZdstrdPk7pgOTs1pNxphFVcqWpbsuBb+PsXDp4uhh
         wqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR7zSF432em5K4lGTzJEKO0CP0XkQ57zCEEQLbok94/C0xTdTijWWSeE/IjEg0uEju5hLz@lists.linux.dev
X-Gm-Message-State: AOJu0YyHxs8XkDjijv9YpnwoZ/oIYXpJs5g8dwoeV5s5+Sp3miGjR5Ph
	HVXqDVu322/FCH+kE7YKxg6H2amWHkgzq4aQnXXxIDTTAr7jSsdjbkLGYT+TkB+lp9jZ6xDFlXJ
	5yQ==
X-Received: from ejbbw17.prod.google.com ([2002:a17:906:c1d1:b0:b88:2156:436c])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f8e:b0:b73:758c:c96f
 with SMTP id a640c23a62f3a-b8dab3a41e3mr495095966b.52.1769648218454; Wed, 28
 Jan 2026 16:56:58 -0800 (PST)
Date: Thu, 29 Jan 2026 01:52:31 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129005645.747680-1-elver@google.com>
Subject: [PATCH v2 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
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

---

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.

v1: https://lore.kernel.org/all/20260126002936.2676435-1-elver@google.com/

Marco Elver (3):
  arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

-- 
2.53.0.rc1.217.geba53bf80e-goog
