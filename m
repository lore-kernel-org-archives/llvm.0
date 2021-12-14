Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36F29CA
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 02:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBA7C34600;
	Tue, 14 Dec 2021 02:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639449420;
	bh=GWSR6Nrz4HaNzHfVtLkBWKjzlwkjsDWqzzHTbnnNhIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYuNIpBHBPszqDelVMU4LjmrT5VtccNG6ViM0x/KrVlgcNlhdX+fz7F6MM+dK+Wvq
	 /wtJMFEdL5UhVbqN3OLyNKLfQ8Tp54GF5L4ZfGAZtCuArRPeF85AJHLKZEMg2Dkp5F
	 K9DxCvtkKpj+/rEKeQAgXt2cK8/64xgeKwkH4SudKLBxUSlZt0A9HY5y/BwFaBxkBP
	 uIFYwbXOWDdyFSTDrcRNWsvfknoxjlrsJSZ6ks5ta+mO/2N7L4aWsVxljnSMl9pHed
	 dcoxFhYjP64A7/vheaPYXkHhN+QXMU161f5EBuxVV+jcCtbLW5qiz1CL5fY1Y79A3y
	 hkuCXiWtLKBrQ==
Date: Mon, 13 Dec 2021 19:36:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, llvm@lists.linux.dev
Subject: Re: [PATCH v2] arm64/xor: use EOR3 instructions when available
Message-ID: <YbgDR461O9gCEi+Q@archlinux-ax161>
References: <20211213140252.2856053-1-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213140252.2856053-1-ardb@kernel.org>

Hi Ard,

On Mon, Dec 13, 2021 at 03:02:52PM +0100, Ard Biesheuvel wrote:
> Use the EOR3 instruction to implement xor_blocks() if the instruction is
> available, which is the case if the CPU implements the SHA-3 extension.
> This is about 20% faster on Apple M1 when using the 5-way version.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Our CI reported that this patch as commit ce9ba49a2460 ("arm64/xor: use
EOR3 instructions when available") in the arm64 tree breaks
allyesconfig:

https://github.com/ClangBuiltLinux/continuous-integration2/runs/4514540083?check_suite_focus=true

I also see this when building with GCC 11.2.0:

WARNING: modpost: EXPORT symbol "xor_block_inner_neon" [vmlinux] version ...
Is "xor_block_inner_neon" prototyped in <asm/asm-prototypes.h>?
aarch64-linux-gnu-ld: arch/arm64/lib/xor-neon.o: relocation R_AARCH64_ABS32 against `__crc_xor_block_inner_neon' can not be used when making a shared object
arch/arm64/lib/xor-neon.o:(.data+0x0): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.data+0x18): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.data+0x20): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x0): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x8): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x10): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x18): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x20): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x28): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x30): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x38): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x40): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(__patchable_function_entries+0x48): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.fini_array+0x0): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.init_array+0x0): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x8): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x18): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x20): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x28): dangerous relocation: unsupported relocation
arch/arm64/lib/xor-neon.o:(.data..ro_after_init+0x30): dangerous relocation: unsupported relocation

Cheers,
Nathan
