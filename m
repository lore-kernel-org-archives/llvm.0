Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA32D5925
	for <llvm@lists.linux.dev>; Mon,  5 Oct 2026 04:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791174009; cv=none; b=m86WmVJbgzKIjJjfb8JFcJ9ZtJCzzLkMe8fumll9pppEDaFGYBoOJ/3/l4GTp5975DuOJ0NUQCzWSk6CrF/HaNpVr5BcufX52eqMbKCRw0oIxgfqxo/ADup8kUoJHoqqXC0UCpTsJ8GfLXo+9iEO98UAtWreckyRBz5NR2aWNZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791174009; c=relaxed/simple;
	bh=HoMA9XEjkkd65DXJKPcYLGl2KH3SaKVzwVNL3VSg7LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACq9bFYfbA3YimjOp+3er+pi2B6VK1sS1yTuXsGgWhPo9dAtY8wP8lzrz1dOXCUScu/x54p/JaYDH6eQpjz15bLKebwBDNkrW3IziaK/QKUKiZ6GmykNuviCrYOTWltJlmJOQeesSp9IebCSZuYwbVQiU8TR7pq79OXawpl/g9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOa2qLaF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOa2qLaF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so18137375e9.2
        for <llvm@lists.linux.dev>; Sun, 04 Oct 2026 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791174005; x=1791778805; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=znHr15ngoIrnyD0Loh8A8gjvgvi//2QapaxdSU8F3XU=;
        b=bOa2qLaFip5LxwVNJkq7OpK2VInplesWrqBRK6kOBOELmMf/pVV+gwluZI3Rp+hZVv
         Za5tcQZQzG/RhvyWURaJRRbCFGM2pgwthvWihy081dXuplxOGbzblUFiT1xCS5cyzeQe
         60dPiEoOSMKseSNxgkdY3AiNTLHAPJvWbGeJTd6m4ymBLirByW/sGhMI7Szyx21UubtP
         siyLFyrV/NSnNgdVdnSVTXPANy0sEGgL2nB1K8G1W5ggHKKUoSA9gi2CSArV2fptmrAl
         GyjqEckEcpvXviYnrODxOQMIrKU94bSK3mfvFBaB/ll+EQya2i1sUlpucyQ+JXTvXuB7
         SAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791174005; x=1791778805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znHr15ngoIrnyD0Loh8A8gjvgvi//2QapaxdSU8F3XU=;
        b=I02CL8hJFqnrPpocQ2JUY5dV4xOG0upiTL7OT61O/pUv4Fettbsa1N5+awE0eaIFr/
         taU4Ze9U6MPYznGYOSgieg0/mYNfIbOAuajp/LC3chTYG2SUjDPW0vjQfyCT/HPkSvo/
         vE1LobhCGk/34Zj8MRs4KkFJXNoxJbSCs+dL8B18qAxUOz44PdLrdNfF5NL4CNNx5rAI
         oTWWugVmZ76crttfqZRus3yxL/OyzXMjO30ZHjYNTeUggyATwHU68WaosuuuUBXu5GSi
         UQCJTXKu7LkTsSWyMzeePyYJc+WSit5BdBReNNGRDjSUW/DVD6gUOoyWlyARfG9wF4P3
         AisQ==
X-Forwarded-Encrypted: i=1; AKwUvByqoio3ScUIh9KYf2KxY2IOkkjxuZ5o9V8lU2W4O+QKi1IYfE90PsbaervyxkpZ0AaJ6j4z@lists.linux.dev
X-Gm-Message-State: AFuF++lrB8BQg1/k9x9IbZ36gH2F8AX3mvfcJYIpC48TUyBf2T34DCSL
	NduoOqcGlQEtLAwGhToWfFGVMb574bN3FqZDTXVP6qgWYJW4tNXGlA/X
X-Gm-Gg: AYBFou0QLjPP33bVbdkdnKejb6Or+MDMdRvxjsDcDoD++9D3MAUm23XNrZ8sIAMUtJI
	T8xNrkOwL/XcDl4/oJoKoiw4Jm7OFP2rrFB9naUhARS/YbWFV2ATM31pWmIJxcIJL4cqjefzs2g
	GxEyxNteA7pfKdXUQjOlgJXQ6Jh0OiKH9e+Wlru5TWDLrjMo46xPiyMLQ4Ch1JY2XQLkGMyG0eE
	hxA6gjXF/846HAXn12XCCr6NJ9vDeL3M73qVegHzLVKLdl0yv5bDwNpFWJYWQ+nAUZLQbkFyGox
	1zI0fg5rgqxrrgxcedrD/7muyAJDu9CWL0CGouh5xrRfrxj2s1DXCvFaI6iQzXMukeijseszXD4
	ze00AKdZD0k6y1BLanrQ94YIC2fklNFO9WGU9g5/XbqKSLTgeom/CkZzEMniWLOZdw9Q5gm5nSY
	riwgFV6P++XWz2TFfIBCtn/letyjvUlvniN+h8gSTfoMF4HOeq+0ses/kN3Hbyq4sc3HJtr2A3f
	lQDY2ZNyjEfGCGQcfFhVDH2qLK07Sfs1WX2/tdsN7UR1x5mT6YWeh3UWm4p+n4xVeOLxxvbeiX2
	/L89J2BIxlnj8PfvgGYqpm5Fo5qfmRRqsYHQZ87YoSweoTZ62yHzW3lGtuKY9lOEHw==
X-Received: by 2002:a05:600c:3e06:b0:4a1:6ad5:257d with SMTP id 5b1f17b1804b1-4a16d3d5c54mr77517745e9.29.1791174005080;
        Sun, 04 Oct 2026 21:20:05 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm355769085e9.8.2026.10.04.21.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:20:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:20:01 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Linus Walleij <linusw@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asMj2D6_Zx4ZIfrw@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
 <asEzZ1wOQ_MbgEsk@gmail.com>
 <3436fcef-a052-4261-afb5-677b0bbf28c2@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3436fcef-a052-4261-afb5-677b0bbf28c2@app.fastmail.com>

On Sat, Oct 03, 2026 at 10:54:28PM +0100, Arnd Bergmann wrote:
> How do you build ARMv7-A rust code in user space? If the default is
> ARMv6, doesn't that rule out things like thumb2, vfpv3 and sensible
> (inlined) atomics?

With another target, armv7-unknown-linux-gnueabi (soft-float ABI, no
NEON). The kernel never used it. It fits the same scheme

  rust-target-$(CONFIG_CPU_32v7)   :=armv7-unknown-linux-gnueabi
  rust-target-$(CONFIG_CPU_32v6)   :=arm-unknown-linux-gnueabi

A v6K+v7 kernel stays ARMv6 like its C code. My planned v2 has this as
last patch. It changes the Rust code of all ARMv7-only kernels from
ARMv6 to ARMv7.

> In the kernel, we don't normally allow neon code, but it sounds like
> we may need to make rust depend on !CONFIG_THUMB2_KERNEL, as that
> may be problematic when linking with v6 code.

You are right, for modules. Built-in Rust code works on a Thumb-2
kernel (Pi 400 and QEMU). Rust modules do not load

  rust_minimal: section 8 reloc 24 sym 'rust_helper_krealloc_node_align': unsupported interworking call (ARM -> Thumb)

Same on v7.3-rc1. rustc has no Thumb-2 target with the soft-float ABI.
!THUMB2_KERNEL would also remove the built-in case, so v2 leaves it
alone.

I have a first module loader patch instead. bl to a Thumb function
becomes blx, other branches go through a PLT veneer. Rust modules then
load on a Thumb-2 kernel in QEMU. I would send it separately after more
testing. Or do you prefer !(THUMB2_KERNEL && MODULES) for now?

> >   --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
> 
> Ok, so I guess this is more like -mtune= in clang and gcc?

More like -mcpu. 
It adds features but does not override the +v6 of the target.

> Maybe this should be "+v7-a" instead of "-v6" to allow allow the
> compiler to use all ARMv7-A features instead? It would be surprising
> if they added 32-bit Arm support to Rust without a way to target what
> is in almost every single chip and Linux distro today.

rustc does not know +v7-a. +v7 works but warns about an unstable
feature. The separate target avoids that.

On the CP15 barriers. With the generic target a fence(SeqCst) from
core::sync::atomic becomes

  mcr p15, #0, r0, c7, c10, #5

and with the armv7 target dmb ish. No kernel Rust code does that today,
the Rust objects I looked at have no CP15 access and no swp. But
nothing prevents it.

> I would leave out CPU_V7M as well, it's not worth trying to

It is left out already. HAVE_RUST needs CPU_32v6K, CPU_32v5 or
CPU_32v4T.

Thanks
Karl
