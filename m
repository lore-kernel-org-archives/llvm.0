Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650821C2DB7;
	Tue,  1 Oct 2024 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727808928; cv=none; b=Xf/f0ViKwn3MKWrqTMz8lSnzoh7CH6x0VLwhU65q0/OZp+jdsrKU2ucfAJG6VTZXyyZFkz7V7Ix9tBJDs9t7PioLup7zkfnTYkAUlkMXvXJLcCbmXTiYV2tIf7Y9iqFnKgaMob0q9xfdlZDfnMDIh9Ub8GnXiZTbUWw+TwJiHFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727808928; c=relaxed/simple;
	bh=QwD3xBfZA0gawSdQWqGNveBRPtYRJsC9peBijbGQt8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+2CYR7q+5N28gSJZEFtwVqSrJlUQ+P0OJ6o5tmN5Zn8ZYFsTQiGfTtzHCFZ1gcspXiDY8/+vGAshOdubLI4H+XHWYDhgdOuSnksSRapPOXJ4v4qEGP/dUOw66C0zD1oT3nu5ixO7SpAxyezx2zIHfaG1sn5jQWKTA3nSMl1Q1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qU4+RDr+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qU4+RDr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6391C4CEC6;
	Tue,  1 Oct 2024 18:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727808927;
	bh=QwD3xBfZA0gawSdQWqGNveBRPtYRJsC9peBijbGQt8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qU4+RDr+Og6v9NRvLaOvlgYoWD2ZBgH9RUrb3CqldEtlqAODsT04Wh+g9ys/qWQdz
	 7ZCCu6OoUQd/AgyS7lTBsR4Sa4ND0jKxNTJZ11RGU6IA2Qddh/b7jalokZPuXBUUdd
	 WX1LWfXXJkKashS/RFLOGkfcCiH62cSDfxnYlaUTrulKHzwgGVe9rql32kJIfoBU56
	 o2jZIZ1XdxXloa6U9llgnZsgKxSedik61NaTb/j47cy7bF0gQXEGI2xVYPvkDzwX85
	 RFQOyyAbqCnuygtKA7KqBKHr/bs5GtEHmDszdbEpGFKyRDyPo8FgMQKB5G95exj6rn
	 BWJU1Q/rhghEw==
Date: Tue, 1 Oct 2024 11:55:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Message-ID: <20241001185525.GA29379@thelio-3990X>
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>

On Tue, Oct 01, 2024 at 12:28:13PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> During the discussion before supporting rust on riscv, it was decided
> not to support gcc yet, due to differences in extension handling
> compared to llvm (only the version of libclang matching the c compiler
> is supported). Recently Jason Montleon reported [1] that building with
> gcc caused build issues, due to unsupported arguments being passed to
> libclang. After some discussion between myself and Miguel, it is better
> to disable gcc + rust builds to match the original intent, and
> subsequently support it when an appropriate set of extensions can be
> deduced from the version of libclang.
> 
> Closes: https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.com/ [1]
> Link: https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@spud/ [2]
> Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with rust support")
> Reported-by: Jason Montleon <jmontleo@redhat.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Seems like a reasonable restriction to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I assume the difficulty is not in getting the libclang version itself
but actually mapping extensions to the versions and then deciding how to
make that available to the build system? Or is it more that a solution
is somewhat known but someone has to actually implement it? Sorry if
this has been talked about before.

> ---
> 
> Palmer, this is yours to take.
> 
> CC: jmontleo@redhat.com
> CC: ojeda@kernel.org
> CC: alex.gaynor@gmail.com
> CC: boqun.feng@gmail.com
> CC: gary@garyguo.net
> CC: bjorn3_gh@protonmail.com
> CC: benno.lossin@proton.me
> CC: a.hindborg@kernel.org
> CC: aliceryhl@google.com
> CC: paul.walmsley@sifive.com
> CC: palmer@dabbelt.com
> CC: nathan@kernel.org
> CC: ndesaulniers@google.com
> CC: morbo@google.com
> CC: justinstitt@google.com
> CC: rust-for-linux@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: llvm@lists.linux.dev
> ---
>  Documentation/rust/arch-support.rst | 2 +-
>  arch/riscv/Kconfig                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 750ff371570a0..54be7ddf3e57a 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -17,7 +17,7 @@ Architecture   Level of support  Constraints
>  =============  ================  ==============================================
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> -``riscv``      Maintained        ``riscv64`` only.
> +``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
>  =============  ================  ==============================================
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 22dc5ea4196ce..76843584960c2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -177,7 +177,7 @@ config RISCV
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_RSEQ
> -	select HAVE_RUST if RUSTC_SUPPORTS_RISCV
> +	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
>  	select HAVE_SAMPLE_FTRACE_DIRECT
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>  	select HAVE_STACKPROTECTOR
> -- 
> 2.45.2
> 
