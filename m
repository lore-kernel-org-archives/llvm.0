Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA192D62D
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEBBNFzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30165C433C8;
	Mon,  4 Dec 2023 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701706950;
	bh=pPVt6psFKjmY1hDFYSq+HkKyY2iaY5w0EhnoFSBSoEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEBBNFzHZhDwjcz6/vnYf85ldD1MEmEIp6AuF6WCrdo5Z1oQhFikUKbjijexFHcY4
	 FBQRiJq4mnoLmQflEzn9v4/zZlSaNgVvpGnEDfMjii5xudBCQXgqD4xGd4uqsb8/c4
	 wTkc791m4FuQnrDe6xMqREZqmatxz3WEVoT6DIBn99Qs5Gdd8gFOoiXXgCn6KuD+wW
	 dnR5z1Kf9WQZHQWxVyDspIpp5s7DnoiQvj8pWkqFrcS6P6y+e8kafh6NWd1o8B+6zS
	 qPoqWXze3fsKyie+/G1D0KTn9w6TMos2DLl5gUzY9C8dbD66SJzxLL8ZcT1qVc0AmQ
	 9We1b9Ij/fy3w==
Date: Mon, 4 Dec 2023 09:22:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: stable-commits@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Subject: Re: Patch "arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS 15.x
 or newer" has been added to the 4.19-stable tree
Message-ID: <20231204162228.GA1007084@dev-arch.thelio-3990X>
References: <20231203202353.1854269-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203202353.1854269-1-sashal@kernel.org>

On Sun, Dec 03, 2023 at 03:23:53PM -0500, Sasha Levin wrote:
> This is a note to let you know that I've just added the patch titled
> 
>     arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS 15.x or newer
> 
> to the 4.19-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      arm64-restrict-cpu_big_endian-to-gnu-as-or-llvm-ias-.patch
> and it can be found in the queue-4.19 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 
> 
> 
> commit 4c762ee5a651ad98e47860959d05a8cb18248bdf
> Author: Nathan Chancellor <nathan@kernel.org>
> Date:   Wed Oct 25 10:21:28 2023 -0700
> 
>     arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS 15.x or newer
>     
>     [ Upstream commit 146a15b873353f8ac28dc281c139ff611a3c4848 ]
>     
>     Prior to LLVM 15.0.0, LLVM's integrated assembler would incorrectly
>     byte-swap NOP when compiling for big-endian, and the resulting series of
>     bytes happened to match the encoding of FNMADD S21, S30, S0, S0.
>     
>     This went unnoticed until commit:
>     
>       34f66c4c4d5518c1 ("arm64: Use a positive cpucap for FP/SIMD")
>     
>     Prior to that commit, the kernel would always enable the use of FPSIMD
>     early in boot when __cpu_setup() initialized CPACR_EL1, and so usage of
>     FNMADD within the kernel was not detected, but could result in the
>     corruption of user or kernel FPSIMD state.
>     
>     After that commit, the instructions happen to trap during boot prior to
>     FPSIMD being detected and enabled, e.g.
>     
>     | Unhandled 64-bit el1h sync exception on CPU0, ESR 0x000000001fe00000 -- ASIMD
>     | CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc3-00013-g34f66c4c4d55 #1
>     | Hardware name: linux,dummy-virt (DT)
>     | pstate: 400000c9 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     | pc : __pi_strcmp+0x1c/0x150
>     | lr : populate_properties+0xe4/0x254
>     | sp : ffffd014173d3ad0
>     | x29: ffffd014173d3af0 x28: fffffbfffddffcb8 x27: 0000000000000000
>     | x26: 0000000000000058 x25: fffffbfffddfe054 x24: 0000000000000008
>     | x23: fffffbfffddfe000 x22: fffffbfffddfe000 x21: fffffbfffddfe044
>     | x20: ffffd014173d3b70 x19: 0000000000000001 x18: 0000000000000005
>     | x17: 0000000000000010 x16: 0000000000000000 x15: 00000000413e7000
>     | x14: 0000000000000000 x13: 0000000000001bcc x12: 0000000000000000
>     | x11: 00000000d00dfeed x10: ffffd414193f2cd0 x9 : 0000000000000000
>     | x8 : 0101010101010101 x7 : ffffffffffffffc0 x6 : 0000000000000000
>     | x5 : 0000000000000000 x4 : 0101010101010101 x3 : 000000000000002a
>     | x2 : 0000000000000001 x1 : ffffd014171f2988 x0 : fffffbfffddffcb8
>     | Kernel panic - not syncing: Unhandled exception
>     | CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc3-00013-g34f66c4c4d55 #1
>     | Hardware name: linux,dummy-virt (DT)
>     | Call trace:
>     |  dump_backtrace+0xec/0x108
>     |  show_stack+0x18/0x2c
>     |  dump_stack_lvl+0x50/0x68
>     |  dump_stack+0x18/0x24
>     |  panic+0x13c/0x340
>     |  el1t_64_irq_handler+0x0/0x1c
>     |  el1_abort+0x0/0x5c
>     |  el1h_64_sync+0x64/0x68
>     |  __pi_strcmp+0x1c/0x150
>     |  unflatten_dt_nodes+0x1e8/0x2d8
>     |  __unflatten_device_tree+0x5c/0x15c
>     |  unflatten_device_tree+0x38/0x50
>     |  setup_arch+0x164/0x1e0
>     |  start_kernel+0x64/0x38c
>     |  __primary_switched+0xbc/0xc4
>     
>     Restrict CONFIG_CPU_BIG_ENDIAN to a known good assembler, which is
>     either GNU as or LLVM's IAS 15.0.0 and newer, which contains the linked
>     commit.
>     
>     Closes: https://github.com/ClangBuiltLinux/linux/issues/1948
>     Link: https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5308da1161c
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>     Cc: stable@vger.kernel.org
>     Acked-by: Mark Rutland <mark.rutland@arm.com>
>     Link: https://lore.kernel.org/r/20231025-disable-arm64-be-ias-b4-llvm-15-v1-1-b25263ed8b23@kernel.org
>     Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 92646f12a66d2..ff8e0db1693e9 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -759,6 +759,8 @@ choice
>  config CPU_BIG_ENDIAN
>  	bool "Build big-endian kernel"
>  	depends on !LD_IS_LLD || LLD_VERSION >= 130000
> +	# https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5308da1161c
> +	depends on AS_IS_GNU || AS_VERSION >= 150000

Both this backport and the backport of commit e9c6deee00e9 ("arm64: Make
CPU_BIG_ENDIAN depend on ld.bfd or ld.lld 13.0.0+") are incorrect for
5.4 and 4.19, which do not have CONFIG_AS_IS_GNU, CONFIG_AS_VERSION, or
CONFIG_LLD_VERSION.

I don't think this patch is worth pursuing in 5.4 and 4.19, I would be
very surprised if someone was to hit this issue there, as arm64 big
endian is pretty esoteric as is. If someone does report something at
some point, we can consider it then but for now, I think they should be
dropped from 5.4 and 4.19.

Cheers,
Nathan
