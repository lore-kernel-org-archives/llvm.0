Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AF7B
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 02:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91F1C433D7
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 02:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664244032;
	bh=19gy2EXbjjLD/l6XeEJeQfh5wNSKslif73XxWJJiya4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UycWZTDWCpwFEzNOCYzx0660ef5vI8AHfyoSmAGCveyhYBvSAuNxwgJA/vQsJV97o
	 +S54clXZbOM3d7MoE0FvzwTOK0HGrNwPwp8yX4GWqhg8qZ82AvjLVgQEGkmajpiKal
	 TsNeZ9ZBSWai24xZDwzpQQ4GVsGyCbMMA/TfdFVDQ5f3MQQgwheis7qbNUsWeD7n++
	 oJLT1YOU9vWDnreDLshC+mDdOByl/rfHot2LU7npXCXPz5Z42Vn2zvninr7YXD/+gB
	 KlOFx/YbLe1AcP3WN9HiKszD4IL5nX05NYGl8ii1PxUAJXiQ30CLXgfuivTlPreosu
	 QRnftSuWrko6g==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13122bfaea6so6530003fac.11
        for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 19:00:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf3A4S1JJL1WiSpSRYTpPBJ/Y9jjuzruF3DIymlUBEPcAgoU2Muc
	9JqDlI2Za6D7/HaX8hpfdqxRb+vCGKZXFNWRHe4=
X-Google-Smtp-Source: AMsMyM5ea5e0PE9duPI0AiEm3Ci2ukaIEq7zGlDwmLWiQdey/Aoh7alxANCLZBRyNiFXJfv7kKNa2U+oumBHvVoRuxw=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr937824oao.112.1664244031696; Mon, 26
 Sep 2022 19:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220925175356.681-1-jszhang@kernel.org> <20220925175356.681-4-jszhang@kernel.org>
 <CAJF2gTRFXwu5QtA8GywGaSVRPA7zeexcDHRzcngcY1zD3MFjog@mail.gmail.com> <YzJBXsiWrbmxM6Q2@xhacker>
In-Reply-To: <YzJBXsiWrbmxM6Q2@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 27 Sep 2022 10:00:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRkPc7AQsUNZopevey61PD8o6BQBZKjgeLHmOgX+pj6dA@mail.gmail.com>
Message-ID: <CAJF2gTRkPc7AQsUNZopevey61PD8o6BQBZKjgeLHmOgX+pj6dA@mail.gmail.com>
Subject: Re: [PATCH 3/4] riscv: fix race when vmap stack overflow and remove shadow_stack
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 27, 2022 at 8:28 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
>
> > >  #ifdef CONFIG_VMAP_STACK
> > > -static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
> > > -               overflow_stack)__aligned(16);
> > > -/*
> > > - * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> > > - * to get per-cpu overflow stack(get_overflow_stack).
> > > - */
> > > -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> > > -asmlinkage unsigned long get_overflow_stack(void)
> > > -{
> > > -       return (unsigned long)this_cpu_ptr(overflow_stack) +
> > > -               OVERFLOW_STACK_SIZE;
> > > -}
> > > +unsigned long overflow_stack[NR_CPUS][OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>
> If NR_CPUS is large, there's a non-trival memory waste, I have a
> solution for this case, will send a new version today.
Er...

Yes, we can't bypass the percpu mechanism. I also forgot the percpu
basic concept. In the end, I prefer the previous solution, maybe just
simply giving an atomic flag would be okay. (But we only have one
register (sp) which could be used, it seems not simple.)

>
> Thanks



-- 
Best Regards
 Guo Ren
