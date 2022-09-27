Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3DE362
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 00:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3603AC433D6;
	Tue, 27 Sep 2022 00:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664238486;
	bh=196d/MXQhFQtb6lq5NyscBwIT4g5hA6PUW5f6L4dGTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrBcJhnw70G986UbtQOdtITn/sEzt1I6kEhCpGaLMYD+O6fYxwWJWlzq7png6q8qV
	 WvsfliYUlQ5myg7DVRJ0qAh6JuB7nDreSL86qUEc3BGbrX0ccxnvv3YrgNWOdlc5Sg
	 iWn8Bi6RigPzYv2HOKbyZkDVtOoRHQlH+Y3XF+V8PgjeLUcNNC40ZvmMOm8e5DNDCi
	 ZWWZToeFdVQK1M6t/TnYV4rPGcP/VtGNPuW1dlv01Xxmg5e6DDXkOLQJ49PMWI9gfX
	 szMz2zEUWhMe/f4fSlrp8OZ8Kadzj5XgZjz2BUvh6+katb6S/64hK1/RalOnFmhVCx
	 S0ZvJwJhHG6XA==
Date: Tue, 27 Sep 2022 08:18:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/4] riscv: fix race when vmap stack overflow and remove
 shadow_stack
Message-ID: <YzJBXsiWrbmxM6Q2@xhacker>
References: <20220925175356.681-1-jszhang@kernel.org>
 <20220925175356.681-4-jszhang@kernel.org>
 <CAJF2gTRFXwu5QtA8GywGaSVRPA7zeexcDHRzcngcY1zD3MFjog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJF2gTRFXwu5QtA8GywGaSVRPA7zeexcDHRzcngcY1zD3MFjog@mail.gmail.com>


> >  #ifdef CONFIG_VMAP_STACK
> > -static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
> > -               overflow_stack)__aligned(16);
> > -/*
> > - * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> > - * to get per-cpu overflow stack(get_overflow_stack).
> > - */
> > -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> > -asmlinkage unsigned long get_overflow_stack(void)
> > -{
> > -       return (unsigned long)this_cpu_ptr(overflow_stack) +
> > -               OVERFLOW_STACK_SIZE;
> > -}
> > +unsigned long overflow_stack[NR_CPUS][OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);

If NR_CPUS is large, there's a non-trival memory waste, I have a
solution for this case, will send a new version today.

Thanks
