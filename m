Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5DE1822F8
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460019; cv=none; b=ZlFh0WSCYyL+2zwn0s1bWrupF0qV4zMqAlkw6OML0quFDGgrH9Sv06WWh82WcOOpS6AaUiwoY4gItExiTzGWPMUDA9244GoQSIYyFSf6UL5biUCuoQ1YOyhxCDBuo/eYkiHkclmTvEI/Z98j0lxoC2XgOms2m6KN5oHZdYPDcls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460019; c=relaxed/simple;
	bh=OW4uTobRIl4BMsIata2unnyM9AwapXIAOfMJUXgoD9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kw1Ky+o+WNTa4T/YWnApiXA+V8Sb6rFlmOV7Ek1OelktXr6mk2zXhnKGHUqZyiiXa9m7MyoXedm2Y3wYiMcoDusgFBg+g2PDlsehr2za2ta/UqSgC2ycCG6t8sLVl4KUzkdm7rYw5ojCe8HqTtwrOEdXe2Imzg4Ta2ZD/LBQRTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 995451C0002;
	Wed,  9 Oct 2024 07:46:42 +0000 (UTC)
Message-ID: <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
Date: Wed, 9 Oct 2024 09:46:42 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

Hi Conor,

On 01/10/2024 13:28, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> During the discussion before supporting rust on riscv, it was decided
> not to support gcc yet, due to differences in extension handling
> compared to llvm (only the version of libclang matching the c compiler
> is supported). Recently Jason Montleon reported [1] that building with
> gcc caused build issues, due to unsupported arguments being passed to
> libclang. After some discussion between myself and Miguel


I have just added "[2]" here as it seemed to be missing.

Thanks,

Alex


> , it is better
> to disable gcc + rust builds to match the original intent, and
> subsequently support it when an appropriate set of extensions can be
> deduced from the version of libclang.
>
> Closes: https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.com/ [1]
> Link: https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@spud/ [2]
> Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with rust support")
> Reported-by: Jason Montleon <jmontleo@redhat.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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
>   Documentation/rust/arch-support.rst | 2 +-
>   arch/riscv/Kconfig                  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 750ff371570a0..54be7ddf3e57a 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -17,7 +17,7 @@ Architecture   Level of support  Constraints
>   =============  ================  ==============================================
>   ``arm64``      Maintained        Little Endian only.
>   ``loongarch``  Maintained        \-
> -``riscv``      Maintained        ``riscv64`` only.
> +``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>   ``um``         Maintained        \-
>   ``x86``        Maintained        ``x86_64`` only.
>   =============  ================  ==============================================
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 22dc5ea4196ce..76843584960c2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -177,7 +177,7 @@ config RISCV
>   	select HAVE_REGS_AND_STACK_ACCESS_API
>   	select HAVE_RETHOOK if !XIP_KERNEL
>   	select HAVE_RSEQ
> -	select HAVE_RUST if RUSTC_SUPPORTS_RISCV
> +	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
>   	select HAVE_SAMPLE_FTRACE_DIRECT
>   	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>   	select HAVE_STACKPROTECTOR
