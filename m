Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80AA1361
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 08:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E36C433EF
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673426745;
	bh=DXWE/qLl+sPEfRt5wVUK4pLDwoB7HcN0/PxDbN3TR5Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FNBbHLZY8GipvlPh8ELbD77J2jPLiTezHPFtphnaOVtHWd552/q8yzpIBrLX9lCzm
	 LTY3iDIPYT4FfjHWTwzKCE2FZHyH04PvQSVFDNVW/BV2KYhkS9//7XBKBP9nQvsHWw
	 o1XKYlaZZf1yIdj7zmZeU/NsvP0/1+Wx2efGNQuFnbshgCz2wJobhRXxHADjHNK++Q
	 z8NjgbdiVudV0xgdqHd/amu1vlfjnoCjoF7/rBjDd5Kjje6S1wjMqhWMMOtsM2gRKi
	 +FPTYtAXeKAAWimw/B1mDE+mXFcxH7kRUvLJ+VTfgw0tOUVLSN/o4YIzeayO7odFcY
	 w/vidUpUH3t/g==
Received: by mail-lf1-f46.google.com with SMTP id v25so22402594lfe.12
        for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 00:45:45 -0800 (PST)
X-Gm-Message-State: AFqh2kpHsRd+jiZBqkUPLHq2Ey9CAx4d9aIvu/Lhi56ecnCx0cgR+m1Y
	zgxDwq94ruioevTfa8u9OqyMv6F11T7XrSIXOHU=
X-Google-Smtp-Source: AMrXdXtPi0DuY+eZQEof+mMQcQ3BBxIGBYtmhmKDLntbssw/QhtohF68vtfor1qdPrmYWLn3hW/jVhjmqNo4NkN1n+o=
X-Received: by 2002:ac2:5d4e:0:b0:4b5:964d:49a4 with SMTP id
 w14-20020ac25d4e000000b004b5964d49a4mr6289931lfd.637.1673426743513; Wed, 11
 Jan 2023 00:45:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230106174703.1883495-1-ardb@kernel.org> <20230106174703.1883495-3-ardb@kernel.org>
 <Y73PAtm6FPuT+1cM@dev-arch.thelio-3990X>
In-Reply-To: <Y73PAtm6FPuT+1cM@dev-arch.thelio-3990X>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Jan 2023 09:45:32 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGFa=Zriyp_mS7bbQr0wiwikt0ObjOKUSNGpJtFvLmnkg@mail.gmail.com>
Message-ID: <CAMj1kXGFa=Zriyp_mS7bbQr0wiwikt0ObjOKUSNGpJtFvLmnkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: efi: Account for the EFI runtime stack in
 stack unwinder
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	will@kernel.org, catalin.marinas@arm.com, Mark Rutland <mark.rutland@arm.com>, 
	Lee Jones <lee@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jan 2023 at 21:48, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Ard,
>
> On Fri, Jan 06, 2023 at 06:47:03PM +0100, Ard Biesheuvel wrote:
> > The EFI runtime services run from a dedicated stack now, and so the
> > stack unwinder needs to be informed about this.
> >
> > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Apologies if this has been reported and/or fixed already, I searched
> lore and did not find anything but I just bisected a QEMU boot hang [1]
> that we see in the ClangBuiltLinux CI with Fedora's configuration [2] to
> this change in next-20220110 as commit a7334dc70496 ("arm64: efi:
> Account for the EFI runtime stack in stack unwinder").
>

Thanks for the report. This is due to an oversight on my part: we
removed a spin_is_locked() check, and the lock in question can only be
in the locked state when EFI runtime services are enabled to begin
with.

Without the lock check, we may end up dereferencing the uninitialized
efi_rt_stack_top on non-EFI boots.

I've fixed this up in the EFI fixes tree, so the issue should
disappear once -next is updated. (We just missed 20230111
unfortunately)
