Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38503B059D
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318342; cv=none; b=g2s6TxvhnaEezkjJa+/291MxXSMclwNNYQCAkodlpHq0V1vJU09Q463Qix1gzZSuOlgZgqN5QQr88EF/0KkGwhksD1lsUObUumjg75Keq+stoenwstFs4qN4LCbUWI5d1Q4OI0MtnBcKrwQU+XOK/slUUwn58dTOM4tS+mnl2tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318342; c=relaxed/simple;
	bh=bBEIpBUB43BZa53CSuyn25k126QXXsrK9MijXSC+VwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvWl//DyTrav1bQTej0O71n67RWSCLGGMNnuhU+5C/08zTJ9sON7ukr2S7ySECmAQam0QplJiHNtMN3CTwFAbnd40j4TfZ9wmHSWRdGW2sOqdxf4caJW+/j90XPYe1ROqbRtYpb9ZPyznFQ2VJ+5gGzUvlk2VmVg2ByabyjW+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdkP3sbk; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdkP3sbk"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace19so256065eec.3
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318340; x=1790923140; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XCKYNMunQtwjsoXeGr7yLk4ydEdG3nbjO5mlaJXoXQ=;
        b=JdkP3sbkbEaHIJwvsPS/ezh7PLFmNB7MEzcleoM764YQTdi2gWRJ9LhYY3VJ9X+Cs2
         KZvabQFbyVeQqSjzmE437w4wx7y/7cdO3sj9BX2inPSM+yu+4xqhgWkNfvi3mr+jzGtb
         kzsqN7YDDGv9iUseh1jLfZvgbO/6QqVJ8sKbrTwUs2mLnIMyvYgUvfkgn+F2/Sft/g4J
         d1sa3LO+cG+6Od/9TK9Wuk4TpC2hvNYh3BlRk8NrbjoFS9sxH0fFKkdzEDCN91XZWihj
         j7+Je6RwYka8cqwBDUIxZ96OrWBgsP8ZFuLy+Vrp7GCUpaWzMeWxpXDQCWktJgYX1JfX
         bEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318340; x=1790923140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XCKYNMunQtwjsoXeGr7yLk4ydEdG3nbjO5mlaJXoXQ=;
        b=kKHoAbOP8yhaWwPeUiSPW3bn1wzuQWKH+jWO6pQlFVZxcBXbjVxj14pyhe1nPhcDka
         Np3a218lTdDt8zoOzj1OVdkQ3QLrPyv+DcImNGevlhOFy3HYiFGwH7RRUKIiseW6t6vy
         w9stEIcWAFd/i4HspFpJ0h8PiU4FdpMBb4qQb4c04+uIzYXSTq6u6/HbfrhPlmEatv5+
         aTRfw+3QaROGGTQyIyxdmymTdmCuA5VcNoo1q/cDyoeMxY9rrLw4WcsFeGB26FIMC8DQ
         Nra7Xzcmr/GE68ZfRyqshkr10lU//+ty7hxNr9TvGT41kxLCr2mcrzWbsasW85mAnIO4
         67Kw==
X-Forwarded-Encrypted: i=1; AKwUvByLDbhq1lqLdXJLTfhGqVOCCbR3nUKq3pvQBJLBnF30uXIjoLgWZrHaidXHo4oQwYheQ7jv@lists.linux.dev
X-Gm-Message-State: AFuF++n/5L7PtTI72TdxUjfg3Rh3h67gyUnavxubqkkZBHEy/Kc/zUH8
	SrZ8Q1SirpBQDGnAayf4X2CiZmzw1mCqJAMMmqnoixvJWHVVcuOLHG2v
X-Gm-Gg: AYBFou3N7iZkqII7rSwY2oGWBum0dD6a9g3tznfuktowdO8QlrS5WYYJu6VF3VHRCvH
	PtuYyzaUU5SMdcTpmVQA8e3kR+JUsdOHYGkckd+8AGGwJqhLKw4ei6ZeGaMoR83vAjh/Ufy+X9z
	MLglhM7M1CNCAJtZQpxQXzLppoiJ2slahKPPDWkwdPTsbHRhnX2VQj1uHMuqv5ZAwLrOF0qrhKE
	n23XcNbDSECblEHSDJ4zSCdilahTQOfFMwv233fL1zM1WHtI30DX0w9M61uG7vmTJ02lpQB8Qc3
	rBUTC5Pu4B7D7/jhreXONclfsGC1FDsLaW2YDHwmxw38lxEjHNeyMlZGkTdbSSgsK4gY0pNsnct
	HI4fjGClhbmXyqCbvuJnzjjJU7rJc/b2fEkoC0DOVE4ht3Qx0C7d9w/+bwztQc9mczY/+CeBkYI
	YLuVpGYBKIW8L0p0W7uBuXmt+ARXCKpN6Y3+0nNpXxiaEvlL2kSEPHxtcJW2pXcJIqL8Q0oKhai
	otvtR3NwlTb6kah4bTgdGCwDY/peIueJVewl5kuHAso
X-Received: by 2002:a05:7300:7315:b0:33b:e9a7:d81f with SMTP id 5a478bee46e88-340031cca3cmr5226961eec.11.1790318339666;
        Thu, 24 Sep 2026 23:38:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm6418823eec.14.2026.09.24.23.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:38:58 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:08:38 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, 
	jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com, thuth@redhat.com, 
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net, 
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYWpnhia9icB-60@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924111557.GP1837346@noisy.programming.kicks-ass.net>

> Untested thingies for arm64 and s390x.
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 914282016069..3d8a969eab5f 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -987,14 +987,13 @@ void do_serror(struct pt_regs *regs, unsigned long esr)
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long addr)
>  {
> -	/*
> -	 * bug_brk_handler() only called for BRK #BUG_BRK_IMM.
> -	 * So the answer is trivial -- any spurious instances with no
> -	 * bug table entry will be rejected by report_bug() and passed
> -	 * back to the debug-monitors code and handled as a fatal
> -	 * unexpected debug exception.
> -	 */
> -	return 1;
> +	u32 insn;
> +
> +	if (aarch64_insn_read((u32 *)addr, &insn))
> +		return 0;
> +
> +	/* Match ASM_BUG_FLAGS() / BUG() instructions. */
> +	return insn == (0xd4200000 | (BUG_BRK_IMM << 5));
>  }
>  #endif
>  
> diff --git a/arch/s390/kernel/traps.c b/arch/s390/kernel/traps.c
> index b6ba4465f59d..8bbb082fd5e3 100644
> --- a/arch/s390/kernel/traps.c
> +++ b/arch/s390/kernel/traps.c
> @@ -26,6 +26,7 @@
>  #include <linux/entry-common.h>
>  #include <linux/kmsan.h>
>  #include <linux/bug.h>
> +#include <linux/uaccess.h>
>  #include <asm/entry-percpu.h>
>  #include <asm/asm-extable.h>
>  #include <asm/irqflags.h>
> @@ -55,7 +56,12 @@ static inline void __user *get_trap_ip(struct pt_regs *regs)
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long addr)
>  {
> -	return 1;
> +	u16 insn;
> +
> +	if (get_kernel_nofault(insn, (u16 *)addr))
> +		return 0;
> +
> +	return insn == 0x0001 || insn == 0x000e;
>  }
>  #endif
>  
Thanks for this.
lemme test these and i'll send it out after verifying.

Regards,
Mukesh

