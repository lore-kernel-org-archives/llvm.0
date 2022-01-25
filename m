Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C097168
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 18:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9E1C340E0;
	Tue, 25 Jan 2022 18:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643136647;
	bh=dlASoV/4lF867bA7sGuPYeGD/FvkmE6iuFIQvCJWTbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbtMbjCyLHXfxCtuuXx0wAiqzOL+hLc5Y7tbneRktp48TGDQJBngekACp0qixhHkX
	 sV7OyhLY5/i6lL3+ekLOr+SX4sf1K8p+z0P8GUxpINaluCfWWhgDRraq6jVS3HDMgz
	 6RGxwB6uS7G4UinVI5f25gKe6kfI+4B18VLULszG0ZhMQMFQewA8+4bw4R2bpApKRH
	 Ummj6K1MaOvSMOfQzEiepanYgwfT7WfR4nz/YNtXxdH3qEGcD4uv+iNkQZoUq9NDMW
	 8eMwUCNBOqHUUQuYteo3bU/3g+60G9EKhGgcSU6CVyGW0Piga3gehzDz63Dy9mncg1
	 HMOXvTfYD7a+g==
Date: Tue, 25 Jan 2022 11:50:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] ARM: stackprotector: prefer compiler for TLS based
 per-task protector
Message-ID: <YfBGg+zmIlHmTIm/@dev-arch.archlinux-ax161>
References: <20211021142516.1843042-1-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021142516.1843042-1-ardb@kernel.org>

On Thu, Oct 21, 2021 at 04:25:16PM +0200, Ard Biesheuvel wrote:
> Currently, we implement the per-task stack protector for ARM using a GCC
> plugin, due to lack of native compiler support. However, work is
> underway to get this implemented in the compiler, which means we will be
> able to deprecate the GCC plugin at some point.
> 
> In the meantime, we will need to support both, where the native compiler
> implementation is obviously preferred. So let's wire this up in Kconfig
> and the Makefile.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

I see this patch in the KSPP tree as commit 151bbc8be85e ("ARM:
stackprotector: prefer compiler for TLS based per-task protector"),
which breaks booting aspeed_g5_defconfig in QEMU with clang-14. It seems
like this patch depends on Ard's patch "ARM: decompressor: disable stack
protector" [1]; applying that on top of next-20220125 allows me to boot
again.

This patch is still queued up in Russell's devel-stable branch as
commit f05eb1d24eb5 ("ARM: stackprotector: prefer compiler for TLS based
per-task protector") so perhaps this patch should be dropped from the
KSPP tree? I assume once Ard's recent fixes series [2] is applied to
devel-stable, it will be added back to for-next?

[1]: https://lore.kernel.org/r/20220124174744.1054712-9-ardb@kernel.org/
[2]: https://lore.kernel.org/r/20220125091453.1475246-1-ardb@kernel.org/

Cheers,
Nathan
