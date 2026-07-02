Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8733859E6;
	Thu,  2 Jul 2026 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783021598; cv=none; b=Pfd9VoTI2SyDAG39HksvOuuYl6tPpovrMWkVIVqv28zze9IXrO3laXG+bFNDDztZ5+FOjLu/feYgypasHJLIwq9aJ0HwPsNooB3D6pgbuK9U8UmLrjOdIklIV9SDTH/aoAA4BzRj0u1bfsUUgUtgGbTyP85drPgkUfmvx74hHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783021598; c=relaxed/simple;
	bh=eyHDCPYYCnCqlMDzLTfPdm2rWb8d16r0Pbrr92/ckAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pMsN3/vdGln1mXavJulw0uV2T+isv+q8dmMnFKxfJPzyHh6Ch9Wz9kTim2yDQTpSvOPUt7gOFjHn/eIIiuEg9k66/Y0uDels6vUdJgXdq4CkyslgD0inM8JBjuXQPijSxUXDJncA8F9xHs70vHCUXtEdyVGmqq/LFUBr66zzAY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvZmcYdh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvZmcYdh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A391F00A3A;
	Thu,  2 Jul 2026 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783021597;
	bh=eyHDCPYYCnCqlMDzLTfPdm2rWb8d16r0Pbrr92/ckAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fvZmcYdhCSUgxGkmW212EmxrZkq8oiLsj08VEMml8LnUCeVmay3/VcXrLihutPk27
	 v5fcM+pm9FFE6PI7i6YNPUu7yvwylH1P1PCBykFqQwX2Wr27XknhLV5s+ojEkqHeDi
	 ybpgMTv7D3GiZgJ8aliQVd8yh0h2EIsoiJWzYqIBVGCH9QGxMDXT3LLwWRJHUHsEPE
	 lJ5yUDrsuyxK+t3S+6a36XFBKDDSJPOo+69ULqmDBge83Uzk2DLYSur7EVuvXiRQiS
	 7FNBmzOIXBi+EHRJU+QYGo4HULKM/uQI/xDmetMBKrzzdZlHvR9QCdVvj0k+n8CES7
	 LMgDNjtPzxinA==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Dmitry Voytik <voytikd@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org,
 Alexander Potapenko <glider@google.com>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Ankur Arora <ankur.a.arora@oracle.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Marco Elver
 <elver@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/mm: fix objtool failure with KMSAN enabled
In-Reply-To: <20260702111550.GH751831@noisy.programming.kicks-ass.net>
References: <20260701125151.352632-1-voytikd@gmail.com>
 <20260702025342.GJakXStrsCmIRnEwFD@fat_crate.local>
 <CAAX90H0V-=Gy1FyBT9qop2=RvhBxbOPLu6+DYpPH2pTehT=nRw@mail.gmail.com>
 <20260702111550.GH751831@noisy.programming.kicks-ass.net>
Date: Thu, 02 Jul 2026 21:46:33 +0200
Message-ID: <87se61npie.ffs@fw13>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 02 2026 at 13:15, Peter Zijlstra wrote:
> A quick test with folio_zero_user() seems to suggest the
> ASM_CALL_CONSTRAINT movement (your patch) generates the same code for
> defconfg as does the unmodified code. The change from the thread linked
> above (input constraint on __builtin_frame_address(0)) generates
> different code.
>
> A third option is to force FRAME_POINTER=y for KMSAN builds -- for now,
> until clang is taught to be less insane.

With FRAME_POINTER=y I get now with clang-22

vmlinux.o: warning: objtool: folio_zero_user+0xa7b: stack state mismatch: reg1[4]=-1+0 reg2[4]=-2-336
vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x64: relocation to !ENDBR: machine_kexec_prepare+0x8f0

That's with your objtool patch applied. When I remove that then the
folio_zero_user one goes away. The relocation to !ENDBR stays.

Oh well...


