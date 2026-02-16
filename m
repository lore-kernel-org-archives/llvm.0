Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565AE22156B
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253436; cv=none; b=EiukEIuIp43tLV3ETuBIEZ1sBrG77J1i4KAPBX4yIWLZ5eLX8feKfOjO1PfokmnfheMij6t2JIkps5Ij7RmiPE60r2kR/krPbNtPT/Y86WdQyaPjo7ta7lYvwLj4FqMIA0G9KVv2vh356HbsP4dfU3B7HSslRkfhd/sm0SqACAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253436; c=relaxed/simple;
	bh=XDS/TVM0jMEwrqdteBCv+QzDwSKxalu9xwOECnHeIfQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=I7W6gbpp/AZYDUPe+z7Y0BCUY3x9/QSMWLdujkhkJyTdVqtz7dxvhEROhvvp5KUuUMd+IYlrONwAcpQqD8Z8sZj7YYRua7cn4udRDOvmc3tJgA2+R4fjVbLYTPPylGOVuUlXcY9xVeDxKwenLpQDadmxZ/k1KpTvhjhj9+Do7Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bt3dMlxN; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bt3dMlxN"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43766514653so2045908f8f.0
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771253434; x=1771858234; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PN5r/7tt47yJK8ejJibZMzrosjD0HGAjuC2k5NzaqOI=;
        b=Bt3dMlxNm9gKyCdx+QgPHJnRrvMkNXOkQzJfDBoCl8u7DwpC8hdbYlHKOLfBYMEzmi
         tUhivasMcurIlwCEezU2fI5DI9An7EZG+tOJcTTxGeP5zRl+3KCIkLV+Ifb+cJ3XzCVA
         rZl0TKp9x5JwfIm701DSd7TDjwDJcVt4z7rqn7poWzeXofqlcmxZxvgn89ZI+wYHbAPi
         ZcRN8NFk7Orks4EltVr+Qbj77o0MxAHyRpYpRlKevE2p9pXP6Vo14/0CWUL8XVR8+aJD
         i1wVY3fftz3py6HJRTINbFnaVQLirdAV7z63uq+6tuioxP46HN6vjBcqXry/YRBbYucQ
         iTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253434; x=1771858234;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PN5r/7tt47yJK8ejJibZMzrosjD0HGAjuC2k5NzaqOI=;
        b=wzSxd43GqPKbtxCEa1A1P54tU0d/8JSNgq1PUpCLO1Fh7tITrJEw41X25S6ex/1o55
         ooJrM3Bu2z/iCpxFQOuItCDgOEEhxD8Z7oT/YHYcFwmXhqhAVucuspRQ1ZGNKNcb7iI5
         s+fq6m46A7HN30mBN5VwwMlC28hGq5R6XFvaMOvhkOVH8NJH+lisUffScUC7M+ZrJqMU
         UKsRNfzjsAVgh2TR5fTFBBWZWjlMDTGI+vjqLT5JgbmeM/sZC9HB9tJEZTot+CY3iXSB
         r2la0NJkZ7/ymZZvgCW7MwsUu0lOshJS5KsPGRuCn+KjtnJZJlZC09HjxYAKmiZNgyFO
         80og==
X-Forwarded-Encrypted: i=1; AJvYcCU21q0Pxr6d2wCOYZfdXmkYwtoZ2zANKzrQg+QiWz1WK9K1aNltpdRhbOa/6aBfI2o8YRCW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+F9IiXF7KzHcm/Ka5phTqoNWQDo0uCJVEzWGTfMWO1vP1Kwqw
	ONH1/R7Ykvcc356wtxel/NYd75LF4PqT97qqykoK3rWy+YG78r0LIBrh7EcLkpB54ajRm0DmxuD
	JhA==
X-Received: from wmaw19.prod.google.com ([2002:a05:600c:6d53:b0:47f:941a:613d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c12:b0:480:49ce:42cc
 with SMTP id 5b1f17b1804b1-48373a02cfbmr205524815e9.9.1771253433414; Mon, 16
 Feb 2026 06:50:33 -0800 (PST)
Date: Mon, 16 Feb 2026 15:16:21 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260216142436.2207937-2-elver@google.com>
Subject: [PATCH v4 0/2] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While investigating a Clang Context Analysis [1] false positive [2], I
started to dig deeper into arm64's __READ_ONCE() implementation with
LTO. That rabbit hole led me to find one critical bug with the current
implementation (fixed already in [3]), and subtle improvements that then
enabled me to fix the original false positive.

Patch 1 refactors the macro to use a different way of getting an
unqualified type and eliminates the ternary conditional.

Building on the refactor, patch 2 fixes the context analysis false
positive, by helping its alias analysis "see through" the __READ_ONCE
despite the inline asm.

## Note on Alternative for Patch 2

An alternative considered for the Context Analysis fix was introducing a
helper function to redirect the pointer alias; specifically passing a
pointer to const-pointer does not invalidate an alias either (casting
away the const is a deliberate escape hatch, albeit somewhat unusual
looking). This approach was slightly more verbose, so the simpler
approach was chosen for now. It is preserved here for future reference
in case we need it for something else:

	static __always_inline void __set_pointer_opaque(void *const *dst, const void *val)
	{
	    *(void **)dst = (void *)val;
	}

	...
	__set_pointer_opaque((void *const *)&__ret, &__u.__val);
	...

[1] https://docs.kernel.org/next/dev-tools/context-analysis.html
[2] https://lore.kernel.org/all/202601221040.TeM0ihff-lkp@intel.com/
[3] https://git.kernel.org/torvalds/c/bb0c99e08ab9aa6d04b

---
v4:
* Use the return-value-of-function-drops-qualifiers hack.
* Rebase (original patch 1 already merged).

v3: https://lore.kernel.org/all/20260130132951.2714396-1-elver@google.com/
* Comments-smithing.
* Use 'typeof(*__ret) __val'

v2:
* Add __rwonce_typeof_unqual() as fallback for old compilers.

Marco Elver (2):
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0.335.g19a08e0c02-goog
