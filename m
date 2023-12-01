Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE24684
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 03:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpE2SaUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62ABAC433C8;
	Fri,  1 Dec 2023 03:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701402900;
	bh=2eDs4rq/o2XffOF2c3AbganMdUEvcgwhvDkUuTL6Ks8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpE2SaUiW5ZvDrhOhXYzsnU0dePt+6ngyVmnyYun5XctDO7RXcU4oK7xE/D0OMSgz
	 8h+ykVLnUyskKTFsDzUnI6nQ/CJ1jJDD/498a1t5g5XIgW2Y6+4xiI7gYpJiEQHsar
	 hpy3NZLDmU170gwZYh8+RK9/jRHsZLppceiP02vJ7mrDdM8W39b6scSgNdTdpFlGiN
	 pzzdPALI87+hTO4qTDpT0jgDpDXKWyelpdkSfbdHvnSRXGXd3UMb911N45DQ4tfuFM
	 sGDy13+zlv4uaAhmNdAuLV6BTHmpRFcFb8TVN2Ejf4VWTPep6eaLInU7YzaiA18bSS
	 9QJe/Ec5oDwqQ==
Date: Thu, 30 Nov 2023 20:54:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev
Subject: Re: [PATCH -tip v2 2/3] x86/callthunks: Handle %rip-relative
 relocations in call thunk template
Message-ID: <20231201035457.GA321497@dev-arch.thelio-3990X>
References: <20231105213731.1878100-1-ubizjak@gmail.com>
 <20231105213731.1878100-3-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105213731.1878100-3-ubizjak@gmail.com>

Hi Uros,

On Sun, Nov 05, 2023 at 10:34:36PM +0100, Uros Bizjak wrote:
> Contrary to alternatives, relocations are currently not supported in
> call thunk templates.  Re-use the existing infrastructure from
> alternative.c to allow %rip-relative relocations when copying call
> thunk template from its storage location.
> 
> The patch allows unification of ASM_INCREMENT_CALL_DEPTH, which already
> uses PER_CPU_VAR macro, with INCREMENT_CALL_DEPTH, used in call thunk
> template, which is currently limited to use absolute address.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
...
> diff --git a/arch/x86/kernel/callthunks.c b/arch/x86/kernel/callthunks.c
> index e9ad518a5003..ef9c04707b3c 100644
> --- a/arch/x86/kernel/callthunks.c
> +++ b/arch/x86/kernel/callthunks.c
...
> @@ -291,20 +298,27 @@ void *callthunks_translate_call_dest(void *dest)
>  static bool is_callthunk(void *addr)
>  {
>  	unsigned int tmpl_size = SKL_TMPL_SIZE;
> -	void *tmpl = skl_call_thunk_template;
> +	u8 insn_buff[MAX_PATCH_LEN];
>  	unsigned long dest;
> +	u8 *pad;
>  
>  	dest = roundup((unsigned long)addr, CONFIG_FUNCTION_ALIGNMENT);
>  	if (!thunks_initialized || skip_addr((void *)dest))
>  		return false;
>  
> -	return !bcmp((void *)(dest - tmpl_size), tmpl, tmpl_size);
> +	*pad = dest - tmpl_size;

Clang warns (or errors with CONFIG_WERROR=y):

  arch/x86/kernel/callthunks.c:315:3: error: variable 'pad' is uninitialized when used here [-Werror,-Wuninitialized]
    315 |         *pad = dest - tmpl_size;
        |          ^~~
  arch/x86/kernel/callthunks.c:309:9: note: initialize the variable 'pad' to silence this warning
    309 |         u8 *pad;
        |                ^
        |                 = NULL
  1 error generated.

which came from our continuous integration:

https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/7054081453/job/19205345548
https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2Yv1FATZZIeD3P7S57ZkHYhyZ8A/build.log

> +
> +	memcpy(insn_buff, skl_call_thunk_template, tmpl_size);
> +	apply_relocation(insn_buff, tmpl_size, pad,
> +			 skl_call_thunk_template, tmpl_size);
> +
> +	return !bcmp(pad, insn_buff, tmpl_size);
>  }

Cheers,
Nathan
