Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781893;
	b=NDsHZM3Amet66qrOWZtnBg8G8HDaNs0vUcDAZ7iHm85ynKpNdMwsqlBe24jInHQ4H+Py
	 XK2ESx3Uh5ofKt11MlsPjfb2DQwV3ZdU0n04+fpwksI37t/IygU/vrayeO+UuhtQ2XUbY
	 jS/FUS35S+bwUoiOdT1ZyFfPL4nColvb5OPZZizUFDU2qNyZDRZ8q5KfH1Y+cKY1ExGcd
	 lxk9H4bXiGjDWtQ5K99WIpmRb3SUl6FnD7O607p1g4Q/19QCap9iZcFryJ3BGkuKUjyDy
	 UvAbovAWf0xPrTMNsZH3qNVntT2DCSHNQEOHOsEGzGGoHkVhVTEcesNQQE22uQZ1uIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781893;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=ctB5Vq7rzRA1tmvwFfYQJUZK4yutrxijqadyX44J5Ow=;
	b=tCvMxf5sp2JOu5LQavzpUCwpq9ftPGKF3JgTHOr6ihvU2scDGi2hIF7hPkseCCS+yd6J
	 nTNrbJn4OdokbPhH1oaV4rw5g2lI3VuOBfIfuLHeuoeybmdZ9wlZJfDPmo6BSIJc4z7BH
	 Sb89EuHhpUCaUXRHb1CLhWDmyLLRK+xG4M/rolrhLgV2acRdHKhWzzXW/n9MQ2vd9sV9Q
	 7AivazBM+LpTB07qaUZ0cfGF+QGlRt4rzK8CE4ffc0Xbo+MsvQCmIHpCpJzXW/yKqtg/k
	 niaK9aicC5wUnBJwGi+iRe0xQ/dcm0FONmO1JACvauwHicDXZW+yGX9v+oNc749fOeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF9A606A326
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 08:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9144B92009E; Wed,  4 Nov 2026 09:44:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8A1FB92009C;
	Wed,  4 Nov 2026 08:44:50 +0000 (GMT)
Date: Wed, 4 Nov 2026 08:44:50 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Tzu-Ching Yang <shingekinocore@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Marco Crivellari <marco.crivellari@suse.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
    stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix genex.S build with LLVM before 21
In-Reply-To: <20261104030147.3117325-1-shingekinocore@gmail.com>
Message-ID: <alpine.DEB.2.21.2611040746160.6502@angie.orcam.me.uk>
References: <20261104030147.3117325-1-shingekinocore@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2026, Tzu-Ching Yang wrote:

> Wrap both expressions in %lo(). For that operator, LLVM 17 to 20
> emit a LO16 fixup instead of rejecting the operand, and resolve it when
> writing the object, since both expressions are constants by then; no
> relocation is left. Both values are between 2 and 30, so %lo() does
> not change them. 

 Seems fair.

>   - The objects are byte-identical before and after with GCC, with
>     LLVM_IAS=0 and with LLVM 21 to 23. The only exception is the
>     microMIPS ADDIU above. The 4-byte move with LLVM_IAS=0 is harmless:
>     set_vi_handler() computes the offsets and the length of the vectored
>     handler from symbols before copying it, and ejtag_debug_handler and
>     nmi_handler are only referenced through their symbols.

 I would be tempted to accept the GAS microMIPS code size regression as a 
missed optimisation.  This is a general issue with forward references and 
%lo() calculation is only one example: we're missing microMIPS relaxation 
for 16-bit vs 32-bit instruction encodings, except for branches.  We only 
do it for MIPS16 code.

> - The malta kernels built with GCC 8.1 and 16.2, LLVM 17, 20 and 23, and
>   LLVM 17 with LLVM_IAS=0 boot under QEMU 6.2 -cpu 24Kf. That CPU uses
>   r4k_wait(), so interrupts go through skipover_handle_int. Each kernel
>   boots to an init that keeps the CPU going in and out of idle and then
>   reboots; a QEMU trace shows every interrupt that lands in the idle
>   region resuming at r4k_wait_exit. A microMIPS kernel does not boot
>   under QEMU -cpu M14Kc with or without this patch, so the microMIPS
>   change was not run.

 I wouldn't be surprised with a microMIPS kernel not booting.  Support was 
messy right from the beginning and despite my opposition it was merged as 
it stood.  Maybe one of the fragile assumptions broke here or there.  Or 
it could be a QEMU emulation bug too; it doesn't seem too stable compared 
to actual hardware, microMIPS or not.  I could try bisecting it sometime 
as I do have an otherwise working microMIPS QEMU setup; sadly no actual 
microMIPS hardware.

> On 6.18.y, which also allows LLVM 15 and 16, the patch applies after
> 2b6d718c8dbe, and LLVM 15 and 16 fail and are fixed the same way.
> 
> The 56651128e2fb backport was dropped from the 6.14, 6.12 and 6.6
> stable queues because of this build failure [1], so 6.12.y and 6.6.y
> still lack that fix.

 Shouldn't this use:

Cc: <stable@vger.kernel.org> # 6.6.x: 56651128e2fb: MIPS: Fix idle VS timer enqueue
Cc: <stable@vger.kernel.org> # 6.6.x: 2b6d718c8dbe: MIPS: Fix whitespace damage in r4k_wait from VS timer fix
Cc: <stable@vger.kernel.org> # 6.6.x

then to get this all picked up?  Or is it unsupported annotation syntax 
where a prerequisite matches a Fixes: tag?

  Maciej
