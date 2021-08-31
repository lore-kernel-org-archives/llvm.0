Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208CF72
	for <llvm@lists.linux.dev>; Tue, 31 Aug 2021 00:51:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51BFE60FE6;
	Tue, 31 Aug 2021 00:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630371106;
	bh=5b6KMByTq/cAx5d95U9mOsUwqM/LJsTDakbM6Mc4Zms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSzOJgRPLQSA6KglLfZ15BUNpcQ5UFgobdTPoU3sSgi9MUL0d3hm2b2Wk4WWLFE1j
	 9MKpl1JHznFvhSDlF06lu0+RANfULrwdKAe/32/DLBrl7p2cfMRO0RA3/OBqtScl/S
	 Ph9AbJizsRKQTs7iwLo1IdHDe/WTRlGhE9iJia/lSELoklWOEqL7Od2JyTf2S48L5V
	 sVliygSqXSoBnzOX6XkRJIfIj5QDzq4YFyJ4omrxsZDZpX07Wg3ZdYmDfMrCXBVPXD
	 /uZyzPUINtHnGuCNFwEOZsXsmTgLWRoiyQRbvKbtwNT6e9IBkmr6aBJeSyass8QRHz
	 gCRuC1+1SVdsQ==
Date: Mon, 30 Aug 2021 17:51:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 17/31] target/arm: Enforce alignment for LDM/STM
Message-ID: <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-18-richard.henderson@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419202257.161730-18-richard.henderson@linaro.org>

Hi Richard,

On Mon, Apr 19, 2021 at 01:22:43PM -0700, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 29fbbb84b2..f58ac4f018 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7868,7 +7868,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
>          } else {
>              tmp = load_reg(s, i);
>          }
> -        gen_aa32_st32(s, tmp, addr, mem_idx);
> +        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
>          tcg_temp_free_i32(tmp);
>  
>          /* No need to add after the last transfer.  */
> @@ -7943,7 +7943,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
>          }
>  
>          tmp = tcg_temp_new_i32();
> -        gen_aa32_ld32u(s, tmp, addr, mem_idx);
> +        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
>          if (user) {
>              tmp2 = tcg_const_i32(i);
>              gen_helper_set_user_reg(cpu_env, tmp2, tmp);
> -- 
> 2.25.1

I just bisected a boot hang with an LLVM-built multi_v7_defconfig +
CONFIG_THUMB2_KERNEL=y kernel down to this commit. I do not see the same
hang when the kernel is compiled with GCC 11.2.0 and binutils 2.37 nor
do I see a hang with multi_v7_defconfig by itself. Is there something
that LLVM is doing wrong when compiling/assembling/linking the kernel or
is there something wrong/too aggressive with this commit? I can
reproduce this with current QEMU HEAD (ad22d05833).

My QEMU invocation is:

$ qemu-system-arm \
    -append "console=ttyAMA0 earlycon" \
    -display none \
    -initrd rootfs.cpio \
    -kernel zImage \
    -M virt \
    -m 512m \
    -nodefaults \
    -no-reboot \
    -serial mon:stdio

and the rootfs.cpio and zImage files can be found here:

https://github.com/nathanchance/bug-files/tree/15c1fd6e44622a3c27823d2c5c3083dfc7246146/qemu-2e1f39e29bf9a6b28eaee9fc0949aab50dbad94a

Cheers,
Nathan
