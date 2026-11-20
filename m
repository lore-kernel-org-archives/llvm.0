Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174709;
	b=vFbWtcdh6sv0scqmOUey3PYRSraNjRP5VceaNDmCJDbg4q4tFviwSfTJp8ZdhSC8C2Xu
	 tJx1+TpIs1o5lgK5/JSRlA+LyBzjavVwewVKxx4eH6TpW9Cp8vF6IsUFNpZOI0dqhpZft
	 HWZTdqo+zcUNF7Z7wK8EIQsYVM0dCjF/fNdk28eP0NTjsLRtqXxwXbfGZPhtmUIij1Zwk
	 qpCQjDdLtxi0sIfdOlcbV8XxEEw/UrIA9sUKEP9AbnUnZuTKpQaFXFhhS7j29/4KvB7Yh
	 ygZ6aoY0Gy8coyI/TQq2h1o3VMR6Pz1Lbl2mTe6sRIEI3lWlaKUDq1YktLVMR5bFttw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RXY63Zo5uvZhPFI98Q/TScgGLzf2IyKlYtsZMNa3YBs=;
	b=RsJ5EQM5utxnyFfz9hIPV+hVwmdBq4+LnZ3hCumlQrMvmIxcleEgffTolK9aVsi2Ohgc
	 xYXxgABmP3cgdGAnDv75cb2OPtJpEHlsMvRt20liAG+D9roamzY+v5p22Im1zW87F1aG4
	 4cY1o6DHFSi9Ch3jM9Hgyb3LDW7VDWoCOdi3YGbbWz/vmqW2Ww9SQwiRHEnv3IQmzPTU4
	 +q7G+j/SC378s6z+qDYqX7cvv1UvKiFpPA9zJtxUNgLNXFzZT/2pb0Oa36SE+ca67fmRe
	 HkciTja3Z3TjgPqqKeAHbIVvXCkMDKz4n8IVMOk6uU0sWMrpKAqaS3fYDY9LSGi5qmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3LlWg8u;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196B3606A33C
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 196B3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3LlWg8u
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so412193f8f.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 03:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174707; x=1795779507; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXY63Zo5uvZhPFI98Q/TScgGLzf2IyKlYtsZMNa3YBs=;
        b=l3LlWg8u8yxgO0Ot9quonWk/xOJz8eFnyg68Gy7AtrDhKKxTwyv/Gc2MCsKl7R2pil
         I18FjT6UUeMmbd/LjEhIqdBgFU1Drz1/uue+mon7iNy19ovC4CPTA9GZjrSIR3jti6Dj
         NwcJWHKrL7v49BqODOUb6zDaQAyMY2XsdLX2rHZTyrp0v/sk7s0LElGRgCI2vmHb2dvT
         o2jXwl3S3FNYeoWTITTe1p5CMcxjTg+XH7RWFDzDSJK95NRDu1xsiY0rFXbdLdw6Lj1E
         4INg5HodI43skoVZyj720NXrwOIh15ebSQ7vFbudMWnlyGlvzcFKbA7GOlN/1+Fu4J5d
         rlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174707; x=1795779507;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXY63Zo5uvZhPFI98Q/TScgGLzf2IyKlYtsZMNa3YBs=;
        b=FwCJqhSY6IlFbusoUCkYu7/JMShqfqohLGhsCH7gm3iD37u/edZ5wp0oljBWsuuojO
         Fgd/C3RG67QVBNwaSIXxKd8K8dxvkYA79qEzj7h2oekn5EYJJp6JCOYSDgwuMC/TRGXM
         2XYqUyOA2tWSFs7YLGBrDmFd0OG9capVq8GaJsB2xyoCsyR3RkhD6TgeCoTJDdl0UBy3
         fPl58FGLYDmPIPWCIbIaiQGIRxBve7OZE/dVwsPxvcV6SutOnSLvTp0HYSaAxMCpWFMl
         LsXegfGk4CBApeLIXAAJ1kglOZI8xXGNUuYjZamu0pEVJwg6YPvFx3ATAsCLDN8thguF
         MV4A==
X-Forwarded-Encrypted: i=1; AL+hErFQtwE30zF8XLzjSD9N7ndCuT1h9Q/6I+dQOjNxEv0tTslIPepjkcSSggD4anW8nv5re0qx@lists.linux.dev
X-Gm-Message-State: APuU4Z8kYsLGnPvVpPCh+kYZ0vpdcVyFPvv2wemcHWcUTsVKsTdAqI17
	PHQ6uf+NSxNwt8/FR3evZ7MZWE4LAK0GSJldqMrO4F6Z26t1l1iSX9V6
X-Gm-Gg: AZFdTZcJihWj+QuJjieexyYdA49ZdaS6+IashHxn62/3aC5g8ttUJoOu6b/7bDH8G5R
	G3exno8gjV5Za3Pyv7xmbbdENsUN8PyTp7ZEp1uR/KbDAKbQmKk2jCuf8ezUs8AQea6Ix8XqvGj
	a3i9e0mqNCEFoBorIWiOJ1xXh5jQ/MFSbQARRy+OJ+3Xq8GlLLfyEsh8qTOlBRI7f0cRiAdK84V
	CRPznfYjvXZRPu4DC+pHc7rWF6s2XxiZAWSyhCr2Ts1C7H5ACD7ChNmz6jpyihvCRHwa1g2ofNV
	ERyaRqTGKRd00EAZYwbVc3xOOlaGbSSWcPTPVi921z6c+VjNUTkQKlLgNFTXLVZggYIkZJWu36M
	kymKBwPGEpSwVwhVJu1jUtfoMEjU7Yo7F33fqpHCICR5f8lGltznWLPrGaUF48wqT2vOdhTmplE
	eTdwCpN5qo1NfVjaH/j+3yiAgqBknM5VBXDTckzSBZMClN4kP32QyjZ4NlRZl3zbs0G0JUDv7II
	gbR0zxe7brguxV0Tt4XBA7s9ltWXHliverzv3p6l5ClXalQ4gY0ZZ4+eMqCCEoP7vXfrIjOku6m
	ool6syBEcfAjbngNQTtFKpiV8YDsT3L36EX0g+5VkOEGc30JoV4bZzGFKvD5bx+hRA==
X-Received: by 2002:a05:6000:47ca:b0:4a8:9702:6cbe with SMTP id ffacd0b85a97d-4abb2dda46bmr3489036f8f.27.1795174707260;
        Fri, 20 Nov 2026 03:38:27 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm5347378f8f.2.2026.11.20.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:38:26 -0800 (PST)
Date: Fri, 20 Nov 2026 11:38:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Usama Arif <usama.arif@linux.dev>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, morbo@google.com, justinstitt@google.com,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com, rkeilty@meta.com, atish.patra@linux.dev,
 dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120113825.234bee1c@pumpkin>
In-Reply-To: <CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
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

On Thu, 19 Nov 2026 14:28:04 -0800
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.dev>=
 wrote:
> >
> > With KSTACK_ERASE, every return to user space poisons the part of the
> > task stack that was used since the previous return. The generic
> > __stackleak_poison() does that one word per loop iteration, so a syscall
> > that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> > running many small VMs, stackleak_erase() accounts for about 1.5% of
> > non-idle host kernel cycles.
> >
> > Override __stackleak_poison() on x86-64, as s390 already does, through
> > the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
> > specific stackleak poison function"). Fill spans larger than 512 bytes
> > with REP STOSQ and keep the word loop for shorter ones, where the fixed
> > startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> > about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> > slower.
> >
> > The fill is inline asm, so the noinstr function still makes no calls.
> > memset64() would be the same instruction, but it is only static inline,
> > and with KMSAN it is an out-of-line function.
> >
> > In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per retu=
rn
> > to user space (71 ns to 46 ns, scan included) over a futex, epoll, proc=
fs
> > and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> > sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> >
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
> >  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/pr=
ocessor.h
> > index 77488ff5eb8c7c..049231d484ad0e 100644
> > --- a/arch/x86/include/asm/processor.h
> > +++ b/arch/x86/include/asm/processor.h
> > @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
> >                                current_stack_pointer) < THREAD_SIZE;
> >  }
> >
> > +#ifdef CONFIG_X86_64
> > +#define __stackleak_poison __stackleak_poison
> > +static __always_inline void __stackleak_poison(unsigned long erase_low,
> > +                                              unsigned long erase_high,
> > +                                              unsigned long poison)
> > +{
> > +       unsigned long count;
> > +
> > +       /* Short spans do not amortize the startup cost of REP STOSQ. */
> > +       if (erase_high <=3D erase_low + 512) {
> > +               while (erase_low < erase_high) {
> > +                       *(unsigned long *)erase_low =3D poison;
> > +                       erase_low +=3D sizeof(unsigned long);
> > +               }
> > +               return;

gcc 13 onwards makes a meal of that - https://godbolt.org/z/KPP4h8xz6
It does manage to unroll the loop once - which is good because the intel
cpu (I've got) won't execute a 'one clock loop' (the zen5 will); but the
setup code is horrid.
But I also think some of the more recent cpu can execute more than
one write per clock.
If you unroll the loop 4 times it may run a lot faster.
Perhaps:
	long count =3D (erase_high - erase_low) / sizeof(unsigned long);
	if (count <=3D 64) {
		while ((count -=3D 4) >=3D 0) {
			*(unsigned long *)erase_low =3D poison;
			*(unsigned long *)(erase_low + 8) =3D poison;
			*(unsigned long *)(erase_low + 16) =3D poison;
			*(unsigned long *)(erase_low + 24) =3D poison;
			erase_low +=3D 32;
		}
		if (count & 2) {
			*(unsigned long *)erase_low =3D poison;
			*(unsigned long *)(erase_low + 8) =3D poison;
			erase_low +=3D 16;
		}
		if (count & 1)
			*(unsigned long *)erase_low =3D poison;
	} else {
		...
	}

Except that gcc makes a mess of it again.
I don't think the 'erase_low +=3D 32' is going to execute at the
same time as the last (two probably) writes so costs a clock.
So it may need to be asm.

> > +       }
> > +
> > +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> > +       asm volatile("rep stosq"
> > +                    : "+D" (erase_low), "+c" (count)
> > +                    : "a" (poison)
> > +                    : "memory"); =20
>=20
> Surely this isn't the only place using `rep stosq` in the tree, right?
> It's not, see memset64 in arch/x86/include/asm/string_64.h.

Which seems to have very few users.
memset_p() and memset_l() have almost no users.

David

>=20
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_PARAVIRT_XXL
> >  #include <asm/paravirt.h>
> >  #else
> > --
> > 2.53.1-Meta
> > =20
>=20
>=20

