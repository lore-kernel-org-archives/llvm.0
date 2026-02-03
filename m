Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A9732F764
	for <llvm@lists.linux.dev>; Tue,  3 Feb 2026 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120149; cv=none; b=Jren4xvGS6cycPszdXO33JpN8ibIdsITlV89yyzMtKtXchPzkfaIq+VPdyqnoxOVMw/iZo3It0wo2ssGDIRbnnk7IL2TI8uCkbb+DCz+a/izazuVLSceQ8NwEIcPGTHu7GKdPLebVTUm+dDbczVp/uB6n7VGB1Oj9qn9s4oPBz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120149; c=relaxed/simple;
	bh=dpKUZIU7z1aYhC8w8Rm05OCOoTYlD9hUxat984VBQ+M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oiQEr+gcx0ND5UdQ8XEQzP70EU+wS6WxAgZjt5mVhIkHaCVcq4eUGJSmwO5Ls2Wc/q6sEvPKNHhLss7oPwN6c4KazdhUcB9vToNRkBcL4A6roJzMCKfSOUSDNhJffW7g4N1sFfeh1tHTLx41d41/OgFEmMDrDU1YWOxeABHEa0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xVsH9aLc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xVsH9aLc"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47ee3dd7fc8so56383745e9.3
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770120146; x=1770724946; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcL6kf6GDnL4z3aaa3ZQiFzxve6GNyY/d0R1gVrt74Y=;
        b=xVsH9aLcsX4eZSfHNDwilQCpA0yOYYWz574u9pKldClFr5wM9PcSz1mJW+phlXdLjd
         D/o2SJ3lzZd5e0vlQLjoTbcVsoep2NNxit8+HKRoG83hUkjmzotYz9SG3JknJdwEMxjh
         KtuesMKjroBWVkRt4vNC6bAvLdIRcUmTqbSkMNXcQO0NZvsh0L7VK+wAxg7qbg4lcE+x
         GP8D9o+XMjcQNPle0YL1yHyno16dZ2p+f4ZAuhYjXDniPqWNkmR/CI16Yy08mhA9dCak
         BTmvTtLzhlyJrenpAcO6+EibgE16MayNT13nwplQz7ZHXPYZWhIxCRfUbjwNarweioqj
         1Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120146; x=1770724946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcL6kf6GDnL4z3aaa3ZQiFzxve6GNyY/d0R1gVrt74Y=;
        b=XsrV5ZqviiSJI2BsArPBsFZhR4YL4LVLJyj4JwkWHyxmIinXGMw53MP79auYRjBKSx
         1+nMx0fhcufMyu2uzCdGxt52q3xY+6WFrsKXiTluKOz5rt+qEJwGQOnbPGVyG/lK0pr3
         euLWVvFwNhiyE0mATXl36gYPyWeAR54E+F8hqHUXFp8TPvvLQnj7R0W/8zIFE0K5Tge5
         CY24XWvIOrMGtcXpy0Sfh9lM2sW9NQu57Hy2urX3lYFIjRShNnJiPao7X9u4YwuoK2ZO
         xUdXw9Kx/hemUMH8FJ0/WQ0KF00rh6mntlnuYWncg+1+lrqbfFWZvOZUztz95Sc9t2aM
         7bQw==
X-Forwarded-Encrypted: i=1; AJvYcCVSGm7+s0kfJJnOaxwojiHAreHoI2Gte1zHt1a0xJOA/0uGavtGir+xq+nUjK3mlP2XrjfP@lists.linux.dev
X-Gm-Message-State: AOJu0YzEqaHXFCecaNqJkPMv/wTjsonIvepmMUbVjECC0hY+28okkeA8
	+WLVqCP21ATGjVVnLrLq8iVIaZrXnGFp7cTWtCsGtg1gHedIWB659Y6uWNx87plLiB0esHvFZmi
	WQTzkNZeSEQhZhUp7Xg==
X-Received: from wmber11.prod.google.com ([2002:a05:600c:84cb:b0:47a:8fa6:6a57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34ce:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-482db491e61mr218064275e9.17.1770120146251;
 Tue, 03 Feb 2026 04:02:26 -0800 (PST)
Date: Tue, 3 Feb 2026 12:02:24 +0000
In-Reply-To: <aYHgtJ_xLeo5W-lZ@willie-the-truck>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-1-beb8547a03c9@google.com> <aYHgtJ_xLeo5W-lZ@willie-the-truck>
Message-ID: <aYHj0EbrMWMornMj@google.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
From: Alice Ryhl <aliceryhl@google.com>
To: Will Deacon <will@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>, elver@google.com
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 11:49:08AM +0000, Will Deacon wrote:
> On Tue, Feb 03, 2026 at 11:34:08AM +0000, Alice Ryhl wrote:
> > From: Gary Guo <gary@garyguo.net>
> > 
> > This config detects if Rust and Clang have matching LLVM major version.
> > All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
> > matching, otherwise it may generate errors, or worse, miscompile
> > silently due to change of IR semantics.
> > 
> > It's usually suggested to use the exact same LLVM version, but this can
> > be difficult to guarantee. Rust's suggestion [1] is also major-version
> > only, so I think this check is sufficient for the kernel.
> > 
> > Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
> > Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  init/Kconfig | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/init/Kconfig b/init/Kconfig
> > index e95d43457851862afc8313389777e4dd9348c178..0e900d3d8be7874a33e0f44754a8d038e68d7e65 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
> >  	int
> >  	default $(rustc-llvm-version)
> >  
> > +config RUSTC_LLVM_MAJOR_VERSION
> > +	int
> > +	default $(shell,expr $(rustc-llvm-version) / 10000)
> > +
> > +config RUSTC_CLANG_LLVM_COMPATIBLE
> > +	bool
> > +	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION = $(shell,expr $(cc-version) / 10000)
> > +	help
> > +	  This indicates whether Rust and Clang use LLVM of the same major
> > +	  version.
> > +
> > +	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
> > +	  LTO) requires the same LLVM major version to work properly. For best
> > +	  compatibility it is recommended that the exact same LLVM is used.
> 
> Is cross-language LTO something we're actually looking at doing for the
> kernel, or is this just stale help text given what you're using it for
> in this series?

I would like to see CONFIG_LTO actually perform cross-language inlining,
but it'd require doing something about both:

1. The issues mentioned in patch 2 of this series.
2. The issues mentioned in commit 5daa0c35a1f0 ("rust: Disallow BTF
   generation with Rust + LTO").

As for whether it's stale help text ... CONFIG_RUST_INLINE_HELPERS works
by performing cross-language LTO too. But I can see your point that it
would make sense to improve this wording given that we're not making
CONFIG_LTO work now.

Alice
