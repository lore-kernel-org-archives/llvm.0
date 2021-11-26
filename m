Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF72C81
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 15:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB29C9305F
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 15:03:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mJBP9B08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1637939009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RH8/qH8grAa6gFEGBxQ5rymfbgwNueBjT+21OQOzhO4=;
	b=mJBP9B085u3tSvmelxK1VgANWcawy3/lGtl4GeeSLlZI5s8gHBZtUkdXnN7jVumqfaNf3S
	SaCfj3w9KE1VAu5TaoFdEdZocJwR0w/ikxlPO5HRXeEHIar3GdhYb4dEvl8O32PwD/4Sso
	T4OkvJjfloWGdrP6rR9SX4osMmZy290=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 90a62510 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <llvm@lists.linux.dev>;
	Fri, 26 Nov 2021 15:03:29 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id q74so20938491ybq.11
        for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 07:03:29 -0800 (PST)
X-Gm-Message-State: AOAM530mMY0XIPFGNJyZGlbdrqPhNnJ5hQ+sOo5hZni8jd6znS2G1q/r
	2XkZed8sGFqitYZf0IpJ57uTW8K0gHcNciodEno=
X-Google-Smtp-Source: ABdhPJx4z9oxLEVwBzAuJQgoS1YMUVgfcuYfJ61Ct1d3EdlZFvLtdJRHAMiQkBFnhPiP2eyW9n08VvC6TS5Xzypnxk8=
X-Received: by 2002:a25:acd4:: with SMTP id x20mr16332521ybd.416.1637939007316;
 Fri, 26 Nov 2021 07:03:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211126143329.2689618-1-arnd@kernel.org>
In-Reply-To: <20211126143329.2689618-1-arnd@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 26 Nov 2021 10:03:16 -0500
X-Gmail-Original-Message-ID: <CAHmME9rotnZRzqeD43FJmSX6-i2CwvUVpXHrFkLGt+qVVdxK7A@mail.gmail.com>
Message-ID: <CAHmME9rotnZRzqeD43FJmSX6-i2CwvUVpXHrFkLGt+qVVdxK7A@mail.gmail.com>
Subject: Re: [PATCH] crypto: siphash - use _unaligned version by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

It looks like Ard's old patch never got picked up so you're dusting it
off. It looks like you're doing two things here -- moving from an
ifndef to a much nicer IS_ENABLED, and changing the logic a bit. In
trying to understand the logic part, I changed this in my buffer:

-#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
-       if (!IS_ALIGNED((unsigned long)data, HSIPHASH_ALIGNMENT))
+       if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) ||
+           !IS_ALIGNED((unsigned long)data, HSIPHASH_ALIGNMENT))
                return __hsiphash_unaligned(data, len, key);
        return ___hsiphash_aligned(data, len, key);

into this:

-       if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
-           !IS_ALIGNED((unsigned long)data, HSIPHASH_ALIGNMENT))
+       if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) ||
+           !IS_ALIGNED((unsigned long)data, HSIPHASH_ALIGNMENT))
                return __hsiphash_unaligned(data, len, key);
        return ___hsiphash_aligned(data, len, key);

This way I can actually think about what's happening here.

So with the old one, we use the faster aligned version if *either* the
CPU has efficient unaligned access OR the bytes are statically known
to be aligned. This seems sensible.

On the new one, we use the faster aligned version if *both* the bytes
are statically known to be aligned (ok) AND the CPU doesn't actually
support efficient unaligned accesses (?). This seems kind of weird.

It also means that CPUs with fast aligned accesses wind up calling the
slower code path in some cases. Is your supposition that the compiler
will always optimize the slow codepath to the fast one if the CPU it's
compiling for supports that? Have you tested this on all platforms?

Would it make sense to instead just fix clang-13? Or even to just get
rid of CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS for armv6 or undef
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS for armv6 just in this file or
maybe less messy, split CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS into
two ifdefs that more sense for our usage?

Jason
