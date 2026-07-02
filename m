Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CB306776;
	Thu,  2 Jul 2026 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783022707; cv=none; b=WhSCzAe4656sRoEKh2qDDRnv0jla+STm0XX/nVj1H5mkanWsQAEd/WOLmMGaQxWz4ZBxrao36nWAFbqotRobwUdGqzSy6VXgUwWyAWFjFjxaGJUSMPcQCf3DST98oiWnncohowLsjKsK6M7El43KPRYlxd5ydslZhmKpo3MRL2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783022707; c=relaxed/simple;
	bh=vObZxhY41K/aMiSBJ+1LTUqYlYO+tprBv3piLMyT97c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WZil2BxjEBUI0e3MSQD3dRGg47Xcgk4k5SZ374wRCCPLGD+xRZACAhRjVOD8wPLO/5NrwrM1ZW+RnlMgCs72hNc6scxRv/vLUEPos1l9DPD/25poDMJa/x0xbeeJFrBlOq24DXg51aDidqoXT2fGh8VVUHaN8psaOb2K5iq7JTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCRj2YwN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCRj2YwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334471F000E9;
	Thu,  2 Jul 2026 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783022706;
	bh=vObZxhY41K/aMiSBJ+1LTUqYlYO+tprBv3piLMyT97c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=eCRj2YwNj9K/5Dxsk/0XDDLdTFn3HKYKGTqouG8VJY1g2bC5bBv0EMjJAVoqP+8EG
	 Um5WFhANUNd9gSZWLrt135jWQ7MYG6q/Qb4SDNj9aXI/E4JAEu6k4a38cOauO3Ed5m
	 MndWBEUzoSTZxEoDUtyECKExJblFQl1aPN661e1LqerHn9fTzFYcr6G+tSRjxvyPU8
	 KbLa2q5SAL01XEBaWoWiCFGcaLJA1OP0T3JksknCT8TgcCM7QYjLfeuiQBAjRVEbJ3
	 L11sacjOLf00FMdIivyNQD4OirB3NpPugrlt1UdASNL05HjpTPvwp+11xQ9+usfUTq
	 4jRJpQocpXssA==
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
In-Reply-To: <87se61npie.ffs@fw13>
References: <20260701125151.352632-1-voytikd@gmail.com>
 <20260702025342.GJakXStrsCmIRnEwFD@fat_crate.local>
 <CAAX90H0V-=Gy1FyBT9qop2=RvhBxbOPLu6+DYpPH2pTehT=nRw@mail.gmail.com>
 <20260702111550.GH751831@noisy.programming.kicks-ass.net>
 <87se61npie.ffs@fw13>
Date: Thu, 02 Jul 2026 22:05:03 +0200
Message-ID: <87mrw9nonk.ffs@fw13>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 02 2026 at 21:46, Thomas Gleixner wrote:
> On Thu, Jul 02 2026 at 13:15, Peter Zijlstra wrote:
>> A quick test with folio_zero_user() seems to suggest the
>> ASM_CALL_CONSTRAINT movement (your patch) generates the same code for
>> defconfg as does the unmodified code. The change from the thread linked
>> above (input constraint on __builtin_frame_address(0)) generates
>> different code.
>>
>> A third option is to force FRAME_POINTER=y for KMSAN builds -- for now,
>> until clang is taught to be less insane.
>
> With FRAME_POINTER=y I get now with clang-22
>
> vmlinux.o: warning: objtool: folio_zero_user+0xa7b: stack state mismatch: reg1[4]=-1+0 reg2[4]=-2-336
> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x64: relocation to !ENDBR: machine_kexec_prepare+0x8f0
>
> That's with your objtool patch applied. When I remove that then the
> folio_zero_user one goes away. The relocation to !ENDBR stays.
>
> Oh well...

And none of this boots when KMSAN=y ....
