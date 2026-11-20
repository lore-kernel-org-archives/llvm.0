Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211064;
	b=f+mTb+Tys1ACfR+MkzQmsK4hdapUiZfvu4fhrucRRgE9p90PZ2bi2OzRVZk+J7qwwNSq
	 jtaRi4GL/Eb2ilFvT+5y9aopgpdjERwbJtHCJEQIudLes0bW9qwW+ku6nlg+0x/e+pi/6
	 CzcAOy5ikrtQxiW3aE/Ce/IR64gJrTjLVwCql0/zcxaecGInuYukzzJOmrYQbSExwPevN
	 cMjbkn6DPLoFGcdfQHHMBxaokONeVg8dwnxXUSBzYexawjwsxfNxMmokQok5XfXP4ZZm7
	 T4AU1H3ZT9rktp2bBZEdPPEwr0IlvTwngdlbEHTU9CtP8JStRqJOkr0iNewJrnXhs7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rXcNRQCIOSxwLtGXJnstBt6P3fFtFAxQQPTFjcsDhnA=;
	b=Bf5GXcoztCO1zW6E0P7e9sdNd0tGiaahlfG/DKKfRop43FIBgcgfe+8J9ijQIW9dsXIc
	 3IOCb79e2EOP1+omU2Q+6MTdtFw/XnyeIShASRKgDcuciflEXfzmpC+yC06P8NWbpmera
	 r6tDWEd0t1GUYr0kN+DpQ6V+flkB80swnMlQhw01U3unte3VjfTa9z9+Bjr4cne0B4gH9
	 kTtkvV3peCKf2GY37OQ5Woh85D2z1bpliQ3hGE3Vat7RYOVjvnr/MMFZo2/TYo3mC+2KT
	 jLAdNCPwMGOe8raVnX17pzlZOebD1eofoEjAhtQ36gV2XeWPJASGDc8c0IsO+y0Ic8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8+62Rn0;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3FC606A337
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 21:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3FC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8+62Rn0
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so865934f8f.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795211057; x=1795815857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXcNRQCIOSxwLtGXJnstBt6P3fFtFAxQQPTFjcsDhnA=;
        b=B8+62Rn0cf1ZNvcRTVLTTzmZT9/bI5pSFuJhq0d9MfLgN/w07yK5XfmDwbxwqVe29b
         Fla4OoF6UJxDTbHFOhYaBM7m/sJt0/0fC/MEK1g1QPqeUmoaN4wvT7WeIpwwwJVW2Slk
         bUFh0Zt8TiRlxceaW4bGhvsJEPdP+KzN2NnKrkMg2Hdk5wKSUS3I4/aXiAYrAIB2Ob7z
         Bh/m2uSULoLlIGVEDeqVA9GtEJrLCMoqKQo5j1EQNRMd47Ej5ssmM+2/SDjITOpMlhpz
         ipGjX+XHjqJ4ZbxLiKtyym78d+ntxEDNB07ibMuMNAbmu5dPrGcPXyINu2UfnjJNc2Je
         2efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211057; x=1795815857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXcNRQCIOSxwLtGXJnstBt6P3fFtFAxQQPTFjcsDhnA=;
        b=Ea/atymDCCQ55g7u7ZxxeK61mnXpSw//a8KCn2bhsuUCwcg3skWHhhKrzziW91cDfb
         /whdQNCUs+AunRvVij1oWsZS0jhHqovhHZ/C6XQPaV31NS8Mcc9XhLjze8yf2EcaY5fG
         yGtxG5YH9RwpcBaKeUIdZIPh3FY6KbWOVMSL7JlAkozIwmTFpsB1AspbElyhxWy5TCIX
         ftuz1kkd/qrs97bCKpN1dHfP88f1NHvmOuj+zJKZjMbOUZf/2yjiZJrG/xXVjj2eveN4
         1BXmBNNWOWuESmghPAW057kUSw2ZLJIz7rg/giKCI7DvEOijpj56ZbpvmFXIexwjji1Z
         NjfA==
X-Forwarded-Encrypted: i=1; AL+hErEn6efSAqy5dkYlnpq0cNTQEgveJ7D8cXzrf3QRJ8BhEfYa7S2QLH9c0yi01D7eJvutfYuQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/Ndw1uql6OYCX0b1ltwSOYJXgyS0Lv45ItGeI89Vayxamgr0X2
	kxwhUwK7SWFLiJ1LDF/uqVM8OTITud2PWyIXahAolHzVo2scFGEeHDFB
X-Gm-Gg: AYBFou2ueXIh0UKsRStUV/YvPyAid/eJ3k0q7Pr8wAynfKsvwse0O5sOm40wcSmQl4U
	/ZNRsUejxbI0KIM4vYMRNxUCvM/aMG4J5WDEdEDNAoX8oKGgZxGXVyjBUYJj+r63GA0PCIHmUMA
	7aOG5poPS0IBni1A53tMA6Ml3qjqDmdpcJaAXTlSAIAHU6fVByeBgf9A+8B5QczJ+q86RPDU5pW
	dd0L3UlxY2jnsBAtiXbT/VYI5zcWPwLjGM/NcpGLouYOwCLuElo31WFeduzo8WAt0jH9x9HWyuK
	AI/YNwnag0/Ll+kHVO+GQzRiXUEPbNDDk7biHMeIeHrI7zwTuaZNMXmS/O4GLi1fwDQrwncMivc
	PGBsxEKyGyFBts9VbgAxcVtT8FVC+gjknUY6MShgG70OImiY2Fbt9fNKv0moXjH/WJejWQKKPfp
	XfnvIPAv1i3+GMMUrwhEWcY+dsF7PpPAecTwToRxELaEj74uD9BKNswGbikTknL3JzVhDXoTmpX
	2vbXsHeufLD0Q9tMy1bJZ4lflbq60wZxQuc2naLbm0k43Nm1DiZcf6vbzsZv+GVF9S51kl6aHzz
	bKNEmXgJ8AdM0D93QcChFjSoJWJo9BuNuP+5IL01oYbyfcQP7AjOPKJy3PKsrXodVT+ThwavhGb
	YjYSoKUsK9+I=
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr109184455e9.2.1795211057153;
        Fri, 20 Nov 2026 13:44:17 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm161429175e9.14.2026.11.20.13.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:44:16 -0800 (PST)
Date: Fri, 20 Nov 2026 21:44:15 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Nick Desaulniers <ndesaulniers@google.com>, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, kees@kernel.org, hpa@zytor.com, gustavoars@kernel.org,
 ardb@kernel.org, hca@linux.ibm.com, nathan@kernel.org, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120214415.060e8375@pumpkin>
In-Reply-To: <97e94491-ce19-45a1-8737-b30b49e997e8@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
	<20261120113825.234bee1c@pumpkin>
	<20261120124252.14ff8a74@pumpkin>
	<97e94491-ce19-45a1-8737-b30b49e997e8@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2026 18:46:01 +0000
Usama Arif <usama.arif@linux.dev> wrote:

> On 20/11/2026 04:42, David Laight wrote:
> > On Fri, 20 Nov 2026 11:38:25 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
> >  =20
> >> On Thu, 19 Nov 2026 14:28:04 -0800
> >> Nick Desaulniers <ndesaulniers@google.com> wrote:
> >> =20
> >>> On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.=
dev> wrote:   =20
> >>>>
> >>>> With KSTACK_ERASE, every return to user space poisons the part of the
> >>>> task stack that was used since the previous return. The generic
> >>>> __stackleak_poison() does that one word per loop iteration, so a sys=
call
> >>>> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hos=
ts
> >>>> running many small VMs, stackleak_erase() accounts for about 1.5% of
> >>>> non-idle host kernel cycles.
> >>>>
> >>>> Override __stackleak_poison() on x86-64, as s390 already does, throu=
gh
> >>>> the hook added by commit 491a78663e03 ("stackleak: allow to specify =
arch
> >>>> specific stackleak poison function"). Fill spans larger than 512 byt=
es
> >>>> with REP STOSQ and keep the word loop for shorter ones, where the fi=
xed
> >>>> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win =
at
> >>>> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span ge=
ts
> >>>> slower.
> >>>>
> >>>> The fill is inline asm, so the noinstr function still makes no calls.
> >>>> memset64() would be the same instruction, but it is only static inli=
ne,
> >>>> and with KMSAN it is an out-of-line function.
> >>>>
> >>>> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per r=
eturn
> >>>> to user space (71 ns to 46 ns, scan included) over a futex, epoll, p=
rocfs
> >>>> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix sock=
et
> >>>> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> >>>>
> >>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >>>> ---
> >>>>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
> >>>>  1 file changed, 25 insertions(+)
> >>>>
> >>>> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm=
/processor.h
> >>>> index 77488ff5eb8c7c..049231d484ad0e 100644
> >>>> --- a/arch/x86/include/asm/processor.h
> >>>> +++ b/arch/x86/include/asm/processor.h
> >>>> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(voi=
d)
> >>>>                                current_stack_pointer) < THREAD_SIZE;
> >>>>  }
> >>>>
> >>>> +#ifdef CONFIG_X86_64
> >>>> +#define __stackleak_poison __stackleak_poison
> >>>> +static __always_inline void __stackleak_poison(unsigned long erase_=
low,
> >>>> +                                              unsigned long erase_h=
igh,
> >>>> +                                              unsigned long poison)
> >>>> +{
> >>>> +       unsigned long count;
> >>>> +
> >>>> +       /* Short spans do not amortize the startup cost of REP STOSQ=
. */
> >>>> +       if (erase_high <=3D erase_low + 512) {
> >>>> +               while (erase_low < erase_high) {
> >>>> +                       *(unsigned long *)erase_low =3D poison;
> >>>> +                       erase_low +=3D sizeof(unsigned long);
> >>>> +               }
> >>>> +               return;   =20
> >>
> >> gcc 13 onwards makes a meal of that - https://godbolt.org/z/KPP4h8xz6
> >> It does manage to unroll the loop once - which is good because the int=
el
> >> cpu (I've got) won't execute a 'one clock loop' (the zen5 will); but t=
he
> >> setup code is horrid.
> >> But I also think some of the more recent cpu can execute more than
> >> one write per clock.
> >> If you unroll the loop 4 times it may run a lot faster.
> >> Perhaps:
> >> 	long count =3D (erase_high - erase_low) / sizeof(unsigned long);
> >> 	if (count <=3D 64) {
> >> 		while ((count -=3D 4) >=3D 0) {
> >> 			*(unsigned long *)erase_low =3D poison;
> >> 			*(unsigned long *)(erase_low + 8) =3D poison; =20
> >=20
> > The add (probably) needs to be in the middle...
> >  			erase_low +=3D 32; =20
> >> 			*(unsigned long *)(erase_low - 32 + 16) =3D poison;
> >> 			*(unsigned long *)(erase_low - 32 + 24) =3D poison;
> >> 		}
> >> 		if (count & 2) {
> >> 			*(unsigned long *)erase_low =3D poison;
> >> 			*(unsigned long *)(erase_low + 8) =3D poison;
> >> 			erase_low +=3D 16;
> >> 		}
> >> 		if (count & 1)
> >> 			*(unsigned long *)erase_low =3D poison;
> >> 	} else {
> >> 		...
> >> 	}
> >>
> >> Except that gcc makes a mess of it again.
> >> I don't think the 'erase_low +=3D 32' is going to execute at the
> >> same time as the last (two probably) writes so costs a clock.
> >> So it may need to be asm. =20
> >=20
> > I threw in enough OPTIMIZER_HIDE_VAR() to stop the optimiser breaking
> > the code. https://godbolt.org/z/nx477T4M1
> > gcc then generates:
> >         movq    %rdx, (%rdi)
> >         movq    %rdx, 8(%rdi)
> >         addq    $32, %rdi
> >         movq    %rdx, -16(%rdi)
> >         movq    %rdx, -8(%rdi)
> > .L32:
> >         subq    $4, %rcx
> >         jns     .L22
> > for the code loop (clang is a bit worse - but should be ok).
> > I think that will be a 'two clock loop' on cpu that can do
> > two writes/clock; zen3 and ice lake).
> > For 'stack splatting' rounding up to a multiple of 32 bytes
> > will save all the 'remainder' code. =20
>=20
>=20
> The range can't be rounded: erase_low is wherever the poison search
> stopped, and erase_high is the stack pointer or the bottom of pt_regs
> (168 bytes, so only 8-byte aligned). Rounding up writes live stack,
> rounding down can write STACK_END_MAGIC when the stack was used to the
> end.

If the stack down by STACK_END_MAGIC has been written you are almost in
'deep do-do land' so task_low_bound() could return an aligned address
and that would let you align down the low address.
(So leaving the very last few words alone.)
It also probably doesn't really matter about the top few words.
So the length could be rounded down.

Alternatively, do STACK_END_MAGIC and STACK_ERASE_POISON even need
to have different values?
(And aren't stacks now allocated with a guard page - so you get a
fault on overflow much earlier than any check for STACK_END_MAGIC.)

But does this code even work in a useful manner.
It seems to stop scanning after finding 128 bytes of KSTACK_ERASE_POISON.
Isn't that going to stop on a function with a large on-stack buffer
(especially since one is likely to be on the deepest part of the stack).
I'd have thought you'd jump down the stack in larger lumps than that
just looking for an unwritten word before even trying to decide if it
was the boundary.

David

>=20
>=20
> >=20
> > David
> >  =20
> >> =20
> >>>> +       }
> >>>> +
> >>>> +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> >>>> +       asm volatile("rep stosq"
> >>>> +                    : "+D" (erase_low), "+c" (count)
> >>>> +                    : "a" (poison)
> >>>> +                    : "memory");     =20
> >>>
> >>> Surely this isn't the only place using `rep stosq` in the tree, right?
> >>> It's not, see memset64 in arch/x86/include/asm/string_64.h.   =20
> >>
> >> Which seems to have very few users.
> >> memset_p() and memset_l() have almost no users.
> >>
> >> David
> >> =20
> >>>    =20
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>>  #ifdef CONFIG_PARAVIRT_XXL
> >>>>  #include <asm/paravirt.h>
> >>>>  #else
> >>>> --
> >>>> 2.53.1-Meta
> >>>>     =20
> >>>
> >>>    =20
> >> =20
> >  =20
>=20

