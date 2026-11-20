Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178576;
	b=wII10MoRADVjlqy7L52Ao7cjSa4IIQx5BW1TQdVysNAWYsQBXWuoTgl8c8FTvdL2uQPV
	 +HqKgBRQOioAUzX0OCYxoKGrIBM2sUvKCayNdRxQlfxCgr8wYWFArhHurJ7Wwu0MoUO52
	 LaYX7CcdrvQKS+3qV7zuAl6OVYCskqJgnPEv/pF4ODIQ71xTGFu//gLC9IL+Yrpqk039Z
	 ENb9J/OyI1V0rdqaUlb1NtknhCjhbWdmtgZ5g8hpCQ1Dk6tKZwc0vRPyKT8tdlY+xZUgD
	 dys6KSuCS/F2eqXNSXvkfTKXwwJ0KSdMdnBZnZ9M+U9H/H/r9bAbjwiLqyW23b4Fp9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iOoKME7Xey4HWkDa4Kr4VY5ssgP9qjXjOrF/wCFOTCE=;
	b=ERce1B6CpLB0o+fsJh61ROwBLQ6BkmJfitrPIpZkgFH4OdCjz7a3tIZ5ddvLh7W/0n4q
	 p6dHhx1X8vYyV7MaNVeUNbKtblDtyoIErhgY8w0QOaEJZxfyatRS3l9xbIqGtWzzJdydp
	 qxwwEGnhvNZPi6GoQ1Y010Ez8YQPHt3vJkHpG0F+7iVEDmESF2q51EQDztSnPeQOFIfWr
	 CtxLYjVswPYox/OREZDL/JEH84SjaKthoTpuIJZ8TT4I/d8eMgexHmk4+Mf220OVi38Rs
	 4GZ4jDtsUHcjdtcySz8Zl6nRKFXRuN6dKu91lgL5jpwoiCj40v44BtEJWd3VaXN4BPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0xTWJk0;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F2606A325
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63F2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0xTWJk0
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso4711095e9.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795178574; x=1795783374; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOoKME7Xey4HWkDa4Kr4VY5ssgP9qjXjOrF/wCFOTCE=;
        b=o0xTWJk0T+4o1y5bQNKmHF+NrLzvEcBaeUCDG/gdo5NWB/qe1BhUfMTPeyuEqH1Y5n
         udq6DmDODQtMiRrpHttjqjsTMjTsg0YSQXg16xWPtxZiKf15N6DxeCJn336VEROjwn+E
         MD0vNpf7SzP7P86l/fyE1u3hPzWkNgbATd2eaj/z/Wp99QdlZef87E3xCafHiB5OZt7B
         vYkLgGnzNhPfl8xONXUXedEzbiwNk7cZK61pVrcc7W20wzfBmk5uniLUdxfhbK8ScNhX
         DN9CYxbGm8I/DJ7tL+H56dEVCmYtzRMZytKSS223XCGJELr2FI7r/BYfPFnRUtHUTdU/
         0f9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178574; x=1795783374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOoKME7Xey4HWkDa4Kr4VY5ssgP9qjXjOrF/wCFOTCE=;
        b=AvlluAy++XUm67TnCSk1G8EFy5ILSDBPhEA929W1lE1gTOOYt8BsvC+yzgQo7Z/4D+
         1+XJO6l/jiSbqw49rzBVPBbH3oWM/rHpAMiPOCFDTcjpEUqDFjX+CK+Z0fbH1WDZxL2s
         pUKVbt229yE9lvizB6sUI2DKomukGGn/rEFH816YhL0Zz+1lboWFLEC1J7s/njKiQsP1
         XJm6sAp3dc/wptBTcxDTQ5XfDsT+5fiFQwqZs21FmoMOGVyECtQBPpWIonU6E8iKgfqW
         rlYbun9WRdvQklp+hwCvlio9mhVRcmu/U25VFkAiHwysF42sFUhHaQ5RAZAdOqzHoJYt
         J1BA==
X-Forwarded-Encrypted: i=1; AL+hErGmUrvHHX40bVYMmv+Hao7ugrmIl/3Z3oFYXfDZYA452E4tKVS2Vn8fjGo+3ZFafZlB6E8t@lists.linux.dev
X-Gm-Message-State: APuU4Z8OeASdxCQuiw6c7mREMe4cvpdGRwN4HyOo5Dsq/M1TluTqDN2+
	HsFPhF2cUuo9umLvRwOutEVL7FSL8yrKcYrPGxKLAiPk0mkVXrncnmS2
X-Gm-Gg: AYBFou0G6p0NOfCUJwWksZDb/K3D2PNT8/DAX9qeJvDif6x05z7oMfbrk5WFIuVLBjX
	rFSQpCzS9d5QaDxupK+4cTsupgX+9SeOv4/CSbxeG4WOcdEoTMoz9gskyc+e76shlmheGmswPmL
	/PWW5oXBbLNZ4rCiyL5SiGoL5AnY+FUxDDHVAFF6mWD09Gh5S/0paviwCMzf5HuFy94BpVsd/sd
	i1/9gaisHpHgubXVL4c7p8LxGqtOORWjFmsJdwz1Amg5ZsuFZr5kA6BgN5z0hMJbks3yOUVl1yr
	RCokSiLrV/1h17N1zfoJLSMwLmnbQHk2kdV8g9d3N4saDzLBzNkK7NlWEoDCH6+c9iteKyuZsaX
	n084RNrF7r6zvszZNLxwjFuV2Msi0iU6hJaszifnHBjUqew2eZPk1PI0bjgfqklZS7MwSC5/FG5
	DF8CVgjOUWwmv0jxafV8OwcXbylbE7UTHibzOHfcL8HEFBpNzgCCxIqjDDWRVJP1NETjZxSKEl+
	rCmuvG41k/rxTuygour/Qrw+iotU1lZNO9ooNTVDbehomOdSB8NcB0xaw3Kg0MrK1uMArqhZShH
	5JTf+dzSdsYaNKqHLWFAQvS24lAN4cG/v7ZORhixNKmC1fdyvAslsL5nm5cTuql3SY0=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:7571:5743 with SMTP id 5b1f17b1804b1-4bb88813444mr69928975e9.27.1795178573835;
        Fri, 20 Nov 2026 04:42:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f278dsm37666745e9.0.2026.11.20.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:42:53 -0800 (PST)
Date: Fri, 20 Nov 2026 12:42:52 +0000
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
Message-ID: <20261120124252.14ff8a74@pumpkin>
In-Reply-To: <20261120113825.234bee1c@pumpkin>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
	<20261120113825.234bee1c@pumpkin>
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

On Fri, 20 Nov 2026 11:38:25 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Thu, 19 Nov 2026 14:28:04 -0800
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>=20
> > On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.de=
v> wrote: =20
> > >
> > > With KSTACK_ERASE, every return to user space poisons the part of the
> > > task stack that was used since the previous return. The generic
> > > __stackleak_poison() does that one word per loop iteration, so a sysc=
all
> > > that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> > > running many small VMs, stackleak_erase() accounts for about 1.5% of
> > > non-idle host kernel cycles.
> > >
> > > Override __stackleak_poison() on x86-64, as s390 already does, through
> > > the hook added by commit 491a78663e03 ("stackleak: allow to specify a=
rch
> > > specific stackleak poison function"). Fill spans larger than 512 bytes
> > > with REP STOSQ and keep the word loop for shorter ones, where the fix=
ed
> > > startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> > > about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> > > slower.
> > >
> > > The fill is inline asm, so the noinstr function still makes no calls.
> > > memset64() would be the same instruction, but it is only static inlin=
e,
> > > and with KMSAN it is an out-of-line function.
> > >
> > > In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per re=
turn
> > > to user space (71 ns to 46 ns, scan included) over a futex, epoll, pr=
ocfs
> > > and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> > > sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
> > >
> > > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > > ---
> > >  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/=
processor.h
> > > index 77488ff5eb8c7c..049231d484ad0e 100644
> > > --- a/arch/x86/include/asm/processor.h
> > > +++ b/arch/x86/include/asm/processor.h
> > > @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
> > >                                current_stack_pointer) < THREAD_SIZE;
> > >  }
> > >
> > > +#ifdef CONFIG_X86_64
> > > +#define __stackleak_poison __stackleak_poison
> > > +static __always_inline void __stackleak_poison(unsigned long erase_l=
ow,
> > > +                                              unsigned long erase_hi=
gh,
> > > +                                              unsigned long poison)
> > > +{
> > > +       unsigned long count;
> > > +
> > > +       /* Short spans do not amortize the startup cost of REP STOSQ.=
 */
> > > +       if (erase_high <=3D erase_low + 512) {
> > > +               while (erase_low < erase_high) {
> > > +                       *(unsigned long *)erase_low =3D poison;
> > > +                       erase_low +=3D sizeof(unsigned long);
> > > +               }
> > > +               return; =20
>=20
> gcc 13 onwards makes a meal of that - https://godbolt.org/z/KPP4h8xz6
> It does manage to unroll the loop once - which is good because the intel
> cpu (I've got) won't execute a 'one clock loop' (the zen5 will); but the
> setup code is horrid.
> But I also think some of the more recent cpu can execute more than
> one write per clock.
> If you unroll the loop 4 times it may run a lot faster.
> Perhaps:
> 	long count =3D (erase_high - erase_low) / sizeof(unsigned long);
> 	if (count <=3D 64) {
> 		while ((count -=3D 4) >=3D 0) {
> 			*(unsigned long *)erase_low =3D poison;
> 			*(unsigned long *)(erase_low + 8) =3D poison;

The add (probably) needs to be in the middle...
 			erase_low +=3D 32;
> 			*(unsigned long *)(erase_low - 32 + 16) =3D poison;
> 			*(unsigned long *)(erase_low - 32 + 24) =3D poison;
> 		}
> 		if (count & 2) {
> 			*(unsigned long *)erase_low =3D poison;
> 			*(unsigned long *)(erase_low + 8) =3D poison;
> 			erase_low +=3D 16;
> 		}
> 		if (count & 1)
> 			*(unsigned long *)erase_low =3D poison;
> 	} else {
> 		...
> 	}
>=20
> Except that gcc makes a mess of it again.
> I don't think the 'erase_low +=3D 32' is going to execute at the
> same time as the last (two probably) writes so costs a clock.
> So it may need to be asm.

I threw in enough OPTIMIZER_HIDE_VAR() to stop the optimiser breaking
the code. https://godbolt.org/z/nx477T4M1
gcc then generates:
        movq    %rdx, (%rdi)
        movq    %rdx, 8(%rdi)
        addq    $32, %rdi
        movq    %rdx, -16(%rdi)
        movq    %rdx, -8(%rdi)
.L32:
        subq    $4, %rcx
        jns     .L22
for the code loop (clang is a bit worse - but should be ok).
I think that will be a 'two clock loop' on cpu that can do
two writes/clock; zen3 and ice lake).
For 'stack splatting' rounding up to a multiple of 32 bytes
will save all the 'remainder' code.

David

>=20
> > > +       }
> > > +
> > > +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> > > +       asm volatile("rep stosq"
> > > +                    : "+D" (erase_low), "+c" (count)
> > > +                    : "a" (poison)
> > > +                    : "memory");   =20
> >=20
> > Surely this isn't the only place using `rep stosq` in the tree, right?
> > It's not, see memset64 in arch/x86/include/asm/string_64.h. =20
>=20
> Which seems to have very few users.
> memset_p() and memset_l() have almost no users.
>=20
> David
>=20
> >  =20
> > > +}
> > > +#endif
> > > +
> > >  #ifdef CONFIG_PARAVIRT_XXL
> > >  #include <asm/paravirt.h>
> > >  #else
> > > --
> > > 2.53.1-Meta
> > >   =20
> >=20
> >  =20
>=20

