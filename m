Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957D7E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 04:24:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFCKY3zHjz4xbG;
	Fri, 11 Mar 2022 15:16:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1646972162;
	bh=aWuv/cB2IRk/pSpG8sU4nbvCzp3/Ix7ZV08F5OtN0eU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i9UqldKKsJpUVZvfHbkXYq6awpvN5Ap6TjGO/igs37yYKbQDoRTw0zBa0t6e+eBGZ
	 Ti5RhXN0X6ngbJodkwVd5SsGfg9Sb0+mV7/WmO6G/fynhEodhGhicoDEKBF6Iar46j
	 P+/7siGGDClvmmHt1sws/1v/Elg3dX8QTxXblz2JiBBoA4MxDUHEOFUYIS0BXFp44f
	 5DTkcPpGrnLeXxFJlq+i9n34MfHhlxyTbXO7LayrXuueToBq0L0mskeCNyQx7VDUP8
	 aR5stvRDHwRay7QN1XbZY/+CNs46DPlK8ES167w5A6FZgdL7R0vj+UTkEbPOsj12Wz
	 F7jnEIf+6Hsug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>, Alexey
 Kardashevskiy <aik@ozlabs.ru>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Nathan
 Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] powerpc: Replace ppc64 DT_RELACOUNT usage with
 DT_RELASZ/24
In-Reply-To: <CAFP8O3+jJf=amTYjm6YQbJKAuK0XRNoG3Gwc6C+E0=CPd46ZAw@mail.gmail.com>
References: <20220309055118.1551013-1-maskray@google.com>
 <CAKwvOdmMS4=QAoBFvhAdXWaLHOwH2252FX9i_yZyiCOpOt=3Dw@mail.gmail.com>
 <CAFP8O3+jJf=amTYjm6YQbJKAuK0XRNoG3Gwc6C+E0=CPd46ZAw@mail.gmail.com>
Date: Fri, 11 Mar 2022 15:15:59 +1100
Message-ID: <87a6dxm8e8.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

F=C4=81ng-ru=C3=AC S=C3=B2ng <maskray@google.com> writes:
> On Thu, Mar 10, 2022 at 11:48 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> On Tue, Mar 8, 2022 at 9:53 PM Fangrui Song <maskray@google.com> wrote:
>> >
>> > DT_RELACOUNT is an ELF dynamic tag inherited from SunOS indicating the
>> > number of R_*_RELATIVE relocations. It is optional but {ld.lld,ld.lld}
>> > -z combreloc always creates it (if non-zero) to slightly speed up glibc
>> > ld.so relocation resolving by avoiding R_*R_PPC64_RELATIVE type
>> > comparison. The tag is otherwise nearly unused in the wild and I'd
>> > recommend that software avoids using it.
>> >
>> > lld>=3D14.0.0 (since commit da0e5b885b25cf4ded0fa89b965dc6979ac02ca9)
>> > underestimates DT_RELACOUNT for ppc64 when position-independent long
>> > branch thunks are used. Correcting it needs non-trivial arch-specific
>> > complexity which I'd prefer to avoid. Since our code always compares t=
he
>> > relocation type with R_PPC64_RELATIVE, replacing every occurrence of
>> > DT_RELACOUNT with DT_RELASZ/sizeof(Elf64_Rela)=3DDT_RELASZ/24 is a cor=
rect
>> > alternative.
>>
>> checking that sizeof(Elf64_Rela) =3D=3D 24, yep: https://godbolt.org/z/b=
b4aKbo5T
>>
>> >
>> > DT_RELASZ is in practice bounded by an uint32_t. Dividing x by 24 can =
be
>> > implemented as (uint32_t)(x*0xaaaaaaab) >> 4.
>>
>> Yep: https://godbolt.org/z/x9445ePPv
>>
>> >
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/1581
>> > Reported-by: Nathan Chancellor <nathan@kernel.org>
>> > Signed-off-by: Fangrui Song <maskray@google.com>
>> > ---
>> >  arch/powerpc/boot/crt0.S       | 28 +++++++++++++++++-----------
>> >  arch/powerpc/kernel/reloc_64.S | 15 +++++++++------
>> >  2 files changed, 26 insertions(+), 17 deletions(-)
...

> I rebased the patch on
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master and got a conflict.
> Seems that https://lore.kernel.org/linuxppc-dev/20220309061822.168173-1-a=
ik@ozlabs.ru/T/#u
> ("[PATCH kernel v4] powerpc/64: Add UADDR64 relocation support") fixed
> the issue.
> It just doesn't change arch/powerpc/boot/crt0.S

Yeah sorry, I applied Alexey's v4 just before I saw your patch arrive on
the list.

If one of you can rework this so it applies on top that would be great :)

cheers
