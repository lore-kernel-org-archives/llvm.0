Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B3C1B962
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 04:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709007666; cv=none; b=M8+wGLwp1qnJ7smkWAYwOPyN+15xq7vIcOQXHwzblYB+m+JTAwOsTT5XDUPfiE5YKU9xvp8nItuWlVAJpsJov5UCaxlvRWmjuiv+qcvypMIXsBPoMwJ6W5qSP0qdKojKpTbVIGhtPPD4G1SgtMqJ+/p77KdBRodlkwLWw8sQfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709007666; c=relaxed/simple;
	bh=thHKt/lq2FH2JRRTZR3OkR0o+QklDeeAM5sGBUoCVfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UquL5UlVyM1lKGoui+BjAlFU2FKSHK+XH562fp68/x5YonsNmZvsQPjwc1FCsfnYULpY4hDF8MREypt9EVV3uarJsTAtCGynca1f8hGgN+32HZ4YOYYVjEHyINFwWDVmKKdAUBlZCEfZMJQ3B5InnhFQRZdQ+lym/Xb50tBMKoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqZEmsUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqZEmsUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BF0C433F1;
	Tue, 27 Feb 2024 04:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709007665;
	bh=thHKt/lq2FH2JRRTZR3OkR0o+QklDeeAM5sGBUoCVfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqZEmsUrumMjRGTlQpa7a2EUuDdlO3EZzICdnZE6d65vRaJOqaFabvdnHebXEXkoT
	 GnHp1AR2r6ereIJ6XQHOsaA10m16llIZuXLth8v9icTl4VTTQPfpb0bxjq7nufU3Rw
	 6Q/TmoIMAxcplTpLehVzQSDaS3Tarr73OyeBDgdicI2nRFNTnSPnhDi4brXV92Qdns
	 BTnaCwb5RvY8GwlF7hoVwhnfbMPKUFsB3D2COIUD50wl5qY/Po1OHl6x1+OM7Ai34N
	 2OcOQr4U943bFxKjv28okkHSi4SPHHHSCs+GE1fGHyC5C2UCme+q0AlNqfr1G4e9Wl
	 006dwEqx1tExA==
Date: Mon, 26 Feb 2024 21:21:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/7] CFI for ARM32 using LLVM
Message-ID: <20240227042103.GA902845@dev-arch.thelio-3990X>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>

Hi Linus,

On Sun, Feb 25, 2024 at 09:08:09PM +0100, Linus Walleij wrote:
> This is a first patch set to support CLANG CFI (Control Flow
> Integrity) on ARM32.
> 
> For information about what CFI is, see:
> https://clang.llvm.org/docs/ControlFlowIntegrity.html
> 
> For the kernel KCFI flavor, see:
> https://lwn.net/Articles/898040/
> 
> The base changes required to bring up KCFI on ARM32 was mostly
> related to the use of custom vtables in the kernel, combined
> with defines to call into these vtable members directly from
> sites where they are used.
> 
> The approach to all of these vtable+define issues has been
> the same: instead of a define, wrap the call in a static inline
> function that explicitly calls the vtable member.
> 
> To runtime-test the patches:
> - Enable CONFIG_LKDTM
> - echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> 
> The patch set has been booted to userspace on the following
> test platforms:
> 
> - Arm Versatile (QEMU)
> - Arm Versatile Express (QEMU)
> - multi_v7 booted on Versatile Express (QEMU)
> - Footbridge Netwinder (SA110 ARMv4)
> - Ux500 (ARMv7 SMP)
> 
> I am not saying there will not be corner cases that we need
> to fix in addition to this, but it is enough to get started.
> Looking at what was fixed for arm64 I am a bit weary that
> e.g. BPF might need something to trampoline properly.
> 
> But hopefullt people can get to testing it and help me fix
> remaining issues before the final version, or we can fix it
> in-tree.

This is awesome, thanks a lot for working on this!

I went to take this for a spin in QEMU using the virt platform. When
booting via EFI using edk2 in a manner similar to [1] but with 32-bit
ARM virtual firmware (which I implemented in our boot utility scripts
at [2]), I get a panic on boot even with CONFIG_CFI_PERMISSIVE=y:

  [    0.245260] Unhandled prefetch abort: breakpoint debug exception (0x002) at 0x00000000
  [    0.245924] Internal error: : 2 [#1] SMP ARM
  [    0.246211] Modules linked in:
  [    0.246486] CPU: 0 PID: 18 Comm: kworker/u2:1 Not tainted 6.8.0-rc6-00018-g7562486357bb #1
  [    0.246855] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 2/2/2022
  [    0.247244] Workqueue: efi_rts_wq efi_call_rts
  [    0.247907] PC is at efi_call_rts+0x30c/0x330
  [    0.248158] LR is at efi_call_rts+0x1c/0x330
  [    0.248317] pc : [<c0fd9cb4>]    lr : [<c0fd99c4>]    psr: 000f0053
  [    0.248532] sp : e087df10  ip : 00000000  fp : c20f4205
  [    0.248728] r10: c20f4200  r9 : 600f0053  r8 : c036da10
  [    0.248906] r7 : 2017e01c  r6 : e427e123  r5 : e080dbc0  r4 : c1e1ac5c
  [    0.249182] r3 : 20101699  r2 : e080dbf8  r1 : e080dbf2  r0 : e080dbf4
  [    0.249468] Flags: nzcv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
  [    0.249750] Control: 10c5387d  Table: 4206406a  DAC: 00000051
  [    0.250007] Register r0 information: 2-page vmalloc region starting at 0xe080c000 allocated at copy_process+0x14c/0xd24
  [    0.250574] Register r1 information: 2-page vmalloc region starting at 0xe080c000 allocated at copy_process+0x14c/0xd24
  [    0.250984] Register r2 information: 2-page vmalloc region starting at 0xe080c000 allocated at copy_process+0x14c/0xd24
  [    0.251387] Register r3 information: non-paged memory
  [    0.251671] Register r4 information: non-slab/vmalloc memory
  [    0.251963] Register r5 information: 2-page vmalloc region starting at 0xe080c000 allocated at copy_process+0x14c/0xd24
  [    0.252373] Register r6 information: vmalloc memory
  [    0.252575] Register r7 information: non-paged memory
  [    0.252777] Register r8 information: non-slab/vmalloc memory
  [    0.252993] Register r9 information: non-paged memory
  [    0.253189] Register r10 information: slab kmalloc-256 start c20f4200 pointer offset 0 size 256
  [    0.253832] Register r11 information: slab kmalloc-256 start c20f4200 pointer offset 5 size 256
  [    0.254199] Register r12 information: NULL pointer
  [    0.254404] Process kworker/u2:1 (pid: 18, stack limit = 0x(ptrval))
  [    0.254838] Stack: (0xe087df10 to 0xe087e000)
  [    0.255082] df00:                                     00000000 df7dec40 c20bb200 c20f4280
  [    0.255399] df20: c20f4205 c2005000 c20bb22c c1e1ac64 c20f4205 c036da10 c2005000 c20bb218
  [    0.255685] df40: c20bb250 00000040 c2005000 c20bb22c c20bb22c c2005020 c2049100 c20bb200
  [    0.255992] df60: 61c88647 c036e094 c20bb200 00000040 c2049784 c20b8654 c20b8640 c036dd54
  [    0.256289] df80: c20bb200 c2049100 00000000 c0374268 c20b8540 c0374130 00000000 00000000
  [    0.256581] dfa0: 00000000 00000000 00000000 c03001ac 00000000 00000000 00000000 00000000
  [    0.256883] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
  [    0.257169] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
  [    0.257986]  efi_call_rts from process_scheduled_works+0x298/0x3d0
  [    0.258441]  process_scheduled_works from worker_thread+0x340/0x514
  [    0.258688]  worker_thread from kthread+0x138/0x164
  [    0.258888]  kthread from ret_from_fork+0x14/0x28
  [    0.259096] Exception stack(0xe087dfb0 to 0xe087dff8)
  [    0.259284] dfa0:                                     00000000 00000000 00000000 00000000
  [    0.259581] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
  [    0.259875] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
  [    0.260271] Code: e3a0109b e3a03000 ebcdcf7a eaffffd7 (e1200070)
  [    0.260850] ---[ end trace 0000000000000000 ]---

It is not immediately obvious what EFI runtime call is triggering this,
I assume that has something to do with the lack of traps due to the
generic implementation. I'll see if I can dig more into this tomorrow
but don't hesitate to jump in too :P

[1]: https://mirrors.edge.kernel.org/pub/linux/kernel/people/will/docs/qemu/qemu-arm64-howto.html
[2]: https://github.com/ClangBuiltLinux/boot-utils/pull/118

Cheers,
Nathan
