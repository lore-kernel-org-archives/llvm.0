Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863A02560
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 22:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3179BC433D2
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 22:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673477597;
	bh=nNq+pSheNC0KtjNImlKJHQbIHUBErCwXA8jMCQLz73o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fAD0MhVMeLsJmHvSSBqH8ZJUnK19gdcwbkX7P5M04uyq/G59J3wPDqkPcC89rVVF0
	 haprBCnNB97PmEVbuobedGt9SCo4zoPkG5Y/ufq0rtNPS7Zp3ePVWBl5r4JASKFXF4
	 eAEcdZzcaEmYeXVjnrmnmV2+PIJ1a1T3qSqGJolO15Uvz3IPTKQix/h/5qZsg1HNK3
	 80HxEoRon61ALVqkdmJEy8DbT0fO4tr5dXTrToFFUGrD85rVpCHFA080psWY6THtxd
	 Xwmhef7sX5aGhstLbPlsX8fsvJvtElg38+HUwahf/QzmtT3vyb/Lp7SL6/+JMhmD2y
	 vOiFJ4DiXK77w==
Received: by mail-lf1-f47.google.com with SMTP id v25so25748540lfe.12
        for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 14:53:17 -0800 (PST)
X-Gm-Message-State: AFqh2kpCXs/cS3vh9DQxKx+hG3RsAZPoQteT+PO64bAI0LSaxCnCX4zI
	deHOSFd6/JKiN1iPIYMNgipzTVDnd20e6/9eKq4=
X-Google-Smtp-Source: AMrXdXufCNRb7fr0bAXNNlgtF4BV2XdUfPlA8wYDcs3z5/EbO22/UkWWt+s6VT/MyJvwTqugYPIQJPswQh0e+xxlhqA=
X-Received: by 2002:ac2:4a72:0:b0:4b6:f37c:c123 with SMTP id
 q18-20020ac24a72000000b004b6f37cc123mr5232775lfp.539.1673477595240; Wed, 11
 Jan 2023 14:53:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230106174703.1883495-1-ardb@kernel.org> <20230106174703.1883495-3-ardb@kernel.org>
 <Y73PAtm6FPuT+1cM@dev-arch.thelio-3990X> <CAMj1kXGFa=Zriyp_mS7bbQr0wiwikt0ObjOKUSNGpJtFvLmnkg@mail.gmail.com>
 <Y78noHxkLQbM6bIK@dev-arch.thelio-3990X>
In-Reply-To: <Y78noHxkLQbM6bIK@dev-arch.thelio-3990X>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Jan 2023 23:53:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF-yFnNnpX6-mS0TaE2BZ-AzhXa1+GUfJJU_2v0C58zPg@mail.gmail.com>
Message-ID: <CAMj1kXF-yFnNnpX6-mS0TaE2BZ-AzhXa1+GUfJJU_2v0C58zPg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: efi: Account for the EFI runtime stack in
 stack unwinder
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	will@kernel.org, catalin.marinas@arm.com, Mark Rutland <mark.rutland@arm.com>, 
	Lee Jones <lee@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jan 2023 at 22:18, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Ard,
>
> On Wed, Jan 11, 2023 at 09:45:32AM +0100, Ard Biesheuvel wrote:
> > On Tue, 10 Jan 2023 at 21:48, Nathan Chancellor <nathan@kernel.org> wrote:
> > > On Fri, Jan 06, 2023 at 06:47:03PM +0100, Ard Biesheuvel wrote:
> > > > The EFI runtime services run from a dedicated stack now, and so the
> > > > stack unwinder needs to be informed about this.
> > > >
> > > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Apologies if this has been reported and/or fixed already, I searched
> > > lore and did not find anything but I just bisected a QEMU boot hang [1]
> > > that we see in the ClangBuiltLinux CI with Fedora's configuration [2] to
> > > this change in next-20220110 as commit a7334dc70496 ("arm64: efi:
> > > Account for the EFI runtime stack in stack unwinder").
> > >
> >
> > Thanks for the report. This is due to an oversight on my part: we
> > removed a spin_is_locked() check, and the lock in question can only be
> > in the locked state when EFI runtime services are enabled to begin
> > with.
> >
> > Without the lock check, we may end up dereferencing the uninitialized
> > efi_rt_stack_top on non-EFI boots.
> >
> > I've fixed this up in the EFI fixes tree, so the issue should
> > disappear once -next is updated. (We just missed 20230111
> > unfortunately)
>
> Thank you for the quick response! That issue appears to be fixed.
>
> Unfortunately, I am still seeing a hang while booting via EFI on either
> bare metal or KVM when CONFIG_DEBUG_PREEMPT is enabled (Fedora's rawhide
> config appears to enable several debugging options), so it appears I was
> seeing two distinct issues :/ defconfig + CONFIG_DEBUG_PREEMPT=y is
> enough for me to reproduce this problem.
>
> I see
>
>   [    0.015382] Remapping and enabling EFI services.
>
> as the last line in the console (via earlycon) with the bad kernel and
> nothing after it (I assume we deadlock somewhere or hit a BUG_ON()?), vs
>
>   [    0.015191] Remapping and enabling EFI services.
>   [    0.016725] smp: Bringing up secondary CPUs ...
>
> on the good kernel, followed by a normal boot.
>

Yeah, this is the same issue, essentially.

I have added back the spin_is_locked() check, which is a better
indicator of whether the EFI runtime stack is actually in use or not.
