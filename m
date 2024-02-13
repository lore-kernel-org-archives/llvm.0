Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70554633E0
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 21:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861205; cv=none; b=eVbXQKi/TFlvi/rYoMwx1W7aq4tXjtBsVRG6zxJVsH5VwUDKKmgUYv3M09DD82eA3TOAPnpH2PXHCrYxRwFHgvXD5jUSuERyLyFwV3RRiNpsfzIpD71bYJ6fMUpS4/ltw9vmCR18M20dgKjYGyh0K6H1WbGdxJn2Zx4hqcj7nSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861205; c=relaxed/simple;
	bh=ypsd4qCVKyRg4P72ROtfXjYfv/4viAmzHOaYW9On954=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rliv6FSWhpkmkUn8fY31boHm9WHL06ZNZX11xM/27dvsQ4BLi7SVl7fytBw17Ff2M4JJyZgkpmTjkw+1QifU9gr1MtMaZfLc03Xu30qKb9eKUXCKqlikVqTFQWAXxf5oud5DryqeMzt1P5fWIPS5ik4KJkbbVcVwvz+XuCMgajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqlrH7pH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqlrH7pH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86A6C433F1
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 21:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707861204;
	bh=ypsd4qCVKyRg4P72ROtfXjYfv/4viAmzHOaYW9On954=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OqlrH7pHYT2cO93m6+51hZvaRhY5JAbLhHgAoptkdPOMlDFnZDODu04bPG0Dejah0
	 C2V4AU3sygcXSDPf2SiZe5Y9taivpoajgjVTLCzH2sEowfJK0yQjrpxI50Ed7Wc+cj
	 2H/txUEQ1nvCBHcCa0UMG8Zyq/P8pb7UaWsOrSQ7lRkTQOvyCC2wnazV6sBuow/PMz
	 UZITeFZP4W/XDaXxO5+DCQyLtSNeea9If6eRYl4C0y+zu50KO3UcpBfQK3YQUH1H03
	 4+QrOuTSIlvWXfyRKGV5PXuHUjM3ZoLIaOl2aCc8jttMO0szYOW2bbAh6D5qOqOvGR
	 HXu0bmen9J4rA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50eac018059so6241547e87.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 13:53:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvAFNwRqGwhGr5+CwhJCNvPnkGPW/Q2wTOnWK4Ng3l21blCHQLZa41bj3RsNaP31oSpk8jOcjjzxQK0Y/EFTTCloapoQ==
X-Gm-Message-State: AOJu0Yzx80DSOUdvyImcyvL98Uf2Evf9jk3c189Ew22ACh+E5gowtS0f
	QMtV8oCTF+Vx4RY7ta3TA/WcqX+WdZXawNOhsF1AySYeOI3MEimINmdFohZnUEVt5Wh15mQgTMo
	37qIgagOs6dZgOmEaf8xBzBIIXhM=
X-Google-Smtp-Source: AGHT+IHI/s6AqAn4+gru9C0sK+MSMCHjVDZCoWnZOEyshAgWQ/HKDfdgJQ1z+yWdf4EQX/rZlJTNkQkm844cBmWgoGY=
X-Received: by 2002:a05:6512:32bb:b0:511:6ff9:8b8d with SMTP id
 q27-20020a05651232bb00b005116ff98b8dmr506646lfe.59.1707861203095; Tue, 13 Feb
 2024 13:53:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240213124143.1484862-13-ardb+git@google.com>
 <20240213124143.1484862-14-ardb+git@google.com> <20240213200553.GYZcvLoYUNJOPGxoid@fat_crate.local>
In-Reply-To: <20240213200553.GYZcvLoYUNJOPGxoid@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 13 Feb 2024 22:53:11 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG4rSGaB8Q2qFcgOH=dqS0yvR8Ofur=h5C-jq_TqiFzVg@mail.gmail.com>
Message-ID: <CAMj1kXG4rSGaB8Q2qFcgOH=dqS0yvR8Ofur=h5C-jq_TqiFzVg@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] x86/startup_64: Simplify global variable
 accesses in GDT/IDT programming
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Kevin Loughlin <kevinloughlin@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 21:06, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Feb 13, 2024 at 01:41:45PM +0100, Ard Biesheuvel wrote:
> > @@ -632,5 +616,5 @@ void __head startup_64_setup_env(unsigned long physbase)
> >                    "movl %%eax, %%ss\n"
> >                    "movl %%eax, %%es\n" : : "a"(__KERNEL_DS) : "memory");
> >
> > -     startup_64_load_idt(physbase);
> > +     startup_64_load_idt(&RIP_REL_REF(vc_no_ghcb));
>
> It took me a while to figure out that even if we pass in one of the two
> GHCB handler pointers, we only set it if CONFIG_AMD_MEM_ENCRYPT.
>
> I think this ontop of yours is a bit more readable as it makes it
> perfectly clear *when* the pointer is valid.
>

Looks fine to me.

> Yeah, if handler is set, we set it for the X86_TRAP_VC vector
> unconditionally but that can be changed later, if really needed.
>

We might call the parameter 'vc_handler' to make this clearer.
