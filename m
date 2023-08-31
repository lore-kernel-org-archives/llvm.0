Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58CA182DB
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 17:05:10 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c1f7f7151fso7586275ad.1
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693501510; x=1694106310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Pfgsvrc0Cq27hkjNFeSrt/ZRRwqRHUfzicJWZVHKsE=;
        b=LQyUEOTKM78p3O1n1xQke1ser95JfruXcGZi0DEIpkY2B8OeDhHr2nwl1/rhurjCwo
         iugFGS5KD0ZcsjkVuzUb3+OQarT1KKon1Zu3844BXXYpb0wKufcPuAmgoGIiituHv1St
         VbqwgSDjF+oK2X9R3XxrhWdhBDjicrk87ifWR42Z2pTAcZQpyJEwjVhzxHoXpF0Z4PFL
         Ee3uisiQF2S+TFGZ/SWV4awVHpCWDIWD6IXgCDGvicrV8dsahdn7FJ1KfYfsnI9isFhy
         N5pXviyT4HYt4CSGv5gh4onYrhjgnPzRVlTUvwFH9kZecR8+rZ5twoSlcbovzTEBh660
         nceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693501510; x=1694106310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pfgsvrc0Cq27hkjNFeSrt/ZRRwqRHUfzicJWZVHKsE=;
        b=QmaB4pGu47yheDZRZlkcV3P5fNiFnvltlVd6svTVSc3ES/ltksRAag1N3JpKofltPd
         pSFBE4wVVLmmv7hkLc31Tk+iYKowgWV/+Xlm3CAGjmOmP5E6AeLevstfN259GeSx4avW
         RqJcZ8WCJZcyLRuPR9lNzrJpkcTidPy15X5cCBgXfIlPMzXW4lnP+eYh5koODe6gWIo9
         AlzTKZ0JnPtCMj4QKwiZAUQdUcRlORcbtajeQJujaCvi/5vlY7s7Y5+xLPKN4kGGCr/j
         DoUCKu2K0zrGoIzKGtC2ZAy55EEy99Lf+c6Y4D09fetiP07srUflGW4LVRk+Y0ekg4XW
         LN5g==
X-Gm-Message-State: AOJu0YwVyTPFi3gUofZOaVqgmERKuokSdbYCR0yXmaz4U3FDLSqwZGoB
	p0FiCBQ/zEkYVgpkektmMsxIjg==
X-Google-Smtp-Source: AGHT+IEZpQJrLUAw1zvueub9KSo50xfn8glzjY4X7tAZK7QAtkNzy8u/SGkRxjDte9gslzgHknYZ+Q==
X-Received: by 2002:a17:903:1cf:b0:1b9:e8a5:3699 with SMTP id e15-20020a17090301cf00b001b9e8a53699mr288895plh.21.1693501509951;
        Thu, 31 Aug 2023 10:05:09 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:892a:3b04:5286:6211])
        by smtp.gmail.com with ESMTPSA id jo6-20020a170903054600b001c1f0b3e900sm1477603plb.229.2023.08.31.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 10:05:09 -0700 (PDT)
Date: Thu, 31 Aug 2023 10:05:04 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	20230816155450.26200-4-andy.chiu@sifive.com, bjorn@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>,
	llvm@lists.linux.dev, nathan@kernel.org, regressions@leemhuis.info
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Message-ID: <ZPDIQEVaEJHXR5IW@google.com>
References: <20230825050248.32681-1-andy.chiu@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825050248.32681-1-andy.chiu@sifive.com>

On Fri, Aug 25, 2023 at 05:02:46AM +0000, Andy Chiu wrote:
> This patch add back the ptrace support with the following fix:
>  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
>    conflicting with gdb's NT_RISCV_CSR.
>  - Use struct __riscv_v_regset_state to handle ptrace requests
> 
> Since gdb does not directly include the note description header in
> Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
> sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
> conflicts.
> 
> Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Hi Andy, this is causing an instance of -Wunused-variable. PTAL.

Please use the following tags on the fix:

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.com/

Let's see if I can get the regzbot tag correct; first time trying it.

#regzbot introduced dbe46b094026

> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 487303e3ef22..9a87e5d490b5 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -81,6 +84,71 @@ static int riscv_fpr_set(struct task_struct *target,
>  }
>  #endif
>  
> +#ifdef CONFIG_RISCV_ISA_V
> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> +	struct __riscv_v_regset_state ptrace_vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +
> +	/*
> +	 * Ensure the vector registers have been saved to the memory before
> +	 * copying them to membuf.
> +	 */
> +	if (target == current)
> +		riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	ptrace_vstate.vstart = vstate->vstart;
> +	ptrace_vstate.vl = vstate->vl;
> +	ptrace_vstate.vtype = vstate->vtype;
> +	ptrace_vstate.vcsr = vstate->vcsr;
> +	ptrace_vstate.vlenb = vstate->vlenb;
> +
> +	/* Copy vector header from vstate. */
> +	membuf_write(&to, &ptrace_vstate, sizeof(struct __riscv_v_regset_state));
> +
> +	/* Copy all the vector registers from vstate. */
> +	return membuf_write(&to, vstate->datap, riscv_v_vsize);
> +}
> +
> +static int riscv_vr_set(struct task_struct *target,
> +			const struct user_regset *regset,
> +			unsigned int pos, unsigned int count,
> +			const void *kbuf, const void __user *ubuf)
> +{
> +	int ret, size;

^ arch/riscv/kernel/ptrace.c:123:11: warning: unused variable 'size' [-Wunused-variable]
