Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A34E66AD
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706266; cv=pass; b=oDjJ1Rm50USPxH39heNvYctl4odrptpT3UnVKTZpzuABhWso/akx7oohxmDR9qge3S5a9PXf9pJCZm7+vUpTsSzH674DgEbZ2HQ+0c3xvfZvpZZWKD/KT0SNhO4395X9XeROo6TWAYkXb2klQpNfsRCMyEOmH/C8FIhFZWFFSFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706266; c=relaxed/simple;
	bh=xsSYztuAQh102Qqep6rxJgPu9f3AocHSYQyuiCkTcx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eug1QkNonHmQXExlbG8V653H5zJBsnSKbIWWuyP2X901va34er/vL2xNwHDWKPITsld8p9+vxEdV0AuewZemsxyQo7OrD1VV+uiYy4G9Q6FP4FuG52vPrK3zKfCRojb05B2SinX7V10hGOdwMJuVzKfILMLqbCNvAcBt/L8sIk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ayOlTvit; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ayOlTvit"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so2651378f8f.1
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 11:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706263; cv=none;
        d=google.com; s=arc-20260327;
        b=FnSY+mZZuTCySVIFhdmQkIy8RdTL45ddefwsQKZibkD4jAaOewjxk6SS9xRvMnWyC0
         B0XvvaCqQ8dgjylcl+ylKpKKKxI0VmsdG82wI9DN+7hkEBrtwLsb/FdxY0aX2rFcUqZZ
         p0/mHD0LydQ16WOy74oliZbPaXIios/Ez8Ff9NzX0fINDN720aEAFXWY1YVIlZkBkhlr
         c9R2s1Cb81neaymQsIe13Jpnvu3obDB5eR2YEEHu8JNE6sL/3OnDbGp0WJnXMCYI2L38
         Hwd+O9jOipmskSIZO6UzVIMndrvCgPSthZECjUlK2JzwbKIGv66YjC2n/+CcQ7BsV2K8
         ysnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        fh=8vLY7PN6vkFZJab8lxZ3IvqRQpceg6m47xdf0lPuyEg=;
        b=Rw7yROmCIH1Av+1pPuyRF4HdsqivDJsOnl+SzFTp78WavYH+lCOe6s409bTru1q3VU
         0pJl0jBP8gtVW/KxySDQlYanKgq4MzcWYsA4Va8zfofP5OjlZH22+MiuJ0+wmTtzgsdX
         NzlKJt5jKnLDmYI1M0nhqQhioQ8DnfSrpX29POArp7533uveYMFvw5YjJs+8kQ0uVz8w
         Kx+wB1GjLhgEn3JhSXffaVgTnxgCAlJqGHMkR4spIytRzg4AfGEwu5djHe75pFWHNAd0
         a/W9w/QALZD3GDj9VdmZZOZUQy0ANDMBP4iqQpQxWbxNdYzEcxw8l6z9baEYqtbiTyic
         9VzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790706263; x=1791311063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=ayOlTvitpVIIVg67rbeC24zIJQ0rCX2qZoZ8Wl7wJWGDyos2FEnM0Ffk64ZXF+U50v
         Ce6Brhgv36wIeyA4D4rwpLd0dGhfAVOgyKWFsahZzT6t7Y1d1XkaATcpdHT0cyhq8Rjt
         2dg4Q6bcFo1VSycw2DMe+VaLhtePeE3OZr2U6OlLpD7G0LFURp+0I6iTDzT4ppxaWc6S
         NzosWlN8uv9OgE0BCj3YDuGrPEQau06xVUQ5zD6W6sA0/5Pr0ab8IYIuyG3Mc+hYJERw
         LAbsq/ictuwq4C3myKWoci/LmRdBhWBd99NnsDaVdvXuhGQmtNF7/6GNMmu3/3HjQu7j
         y6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706263; x=1791311063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=q4YYrupR+3TpvDI1me9PJipxbv3jRyNkHcmOq7jf26pExDuDBFzc7PsvZlgYWq97yd
         Wvk+xiyCmR9HLILPwtzhyoMB0KRsbeOvkOViinqZS6EK4TjLAp1DubD1GzZFGNN3cMAq
         0DGb8QBDc2QR0nfchkXfQW1E/t9G44j9DqBorw+x+9/BbW5FD4Pfnsrfwov0zERnyR2a
         R+IDZEIi9LbkHB1zLACrZhXD1bycQfigRGfhMwmOzxHk+SUrMuSylFi9Urt0UhVfNgzF
         kwiHWCH6onFVC8cAhQsK5QkPg//n63j+ZnkeVU/t2JNFdaNNYGoyVwpEoYQK1os0692p
         2xEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYZTvQ8+N86Ora1vVfT71cZXCExrct+NeBE0TCiYUKgyn4sau2FBms2yqr6+OLAH2C2R8X@lists.linux.dev
X-Gm-Message-State: AFq9FYI/uiJaFoOz5YcV5P4Ovu3gMo7zwSJ+PMKndw8TUABOINB3+CQk
	v89bXPK8/gS9EFnsmCoUD9KJtuI8cQRraklQzcrk0SINy6ztS9SoungfQU/TAER+sXAgVp9Vs4I
	Y0q8DuUhGw9N3+wVPoI/4M8ANFx3TnnjZywa7YU9k
X-Gm-Gg: AYBFou1YcxG1vpWhzcUbHHAIYBBLpOXKtmXYG4n4r0iQ0gpILvJf+GsZUjthtpxu6ix
	57/u51yWcj7YpQwXAGTDnHFNzVcLZks4LHdPZz/RmIiawTORKfoN7QqZNZzXAiFIlGTQMw13ezX
	Zl8XGf3cFWNPO/EHneFF3Xbv/q3WYsm29GjnpsHKtcpdRCsPkUZQ9+kxBE62u2QNCeg9FAEp8Ja
	4lb/vZs8kIopICd2XYsyXcBwhT+Xv6NtN9zjXfPtAPCoSaiUsISIqp+PHm5l64kd7UMsLCgtFt4
	aHfvOliUCuiF020ILkYs5UgvQKDI5K9Mayl3gKWlCKa6qsQP3Kd+xSNXZ9DqPglVOdTl6yL6Ebb
	3ZVyqXiCCMrkjXVopSW8WzPEV9HnTF+DFopiZE36tJ3rKEEku5yUbmKZDfB0AJx9uF18=
X-Received: by 2002:a05:6000:2381:b0:48a:fba3:d5b6 with SMTP id
 ffacd0b85a97d-48afe7ab8dbmr265943f8f.56.1790706262469; Tue, 29 Sep 2026
 11:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
In-Reply-To: <are6s5e6On3hpD3M@zx2c4.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Sep 2026 11:24:11 -0700
X-Gm-Features: AclHuK_OlHRHmRVZkjU6Ad7ygjuA5O41_jDQwI5Gzaif3nG5KjlJX6HrrO4nUUw
Message-ID: <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Nathan Chancellor <nathan@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:29=E2=80=AFAM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Sat, Sep 26, 2026 at 12:55:34PM +0200, Christophe Leroy (CS GROUP) wro=
te:
> > Hi Jason,
> >
> > Le 26/09/2026 =C3=A0 12:02, Jason A. Donenfeld a =C3=A9crit :
> > > Apparently not on RISCV, which is what prompted this patch in the fir=
st
> > > place. So I suspect Nathan's v2 here is the way to go.
> >
> >
> > Don't you have -fno-builtin on RISCV like we have on powerpc ?
>
> I think Nick mentioned this led to other problems and didn't exactly
> solve the problem.

Sorry, been very busy.  Getting blasted from a fire hose of AI
generated patches to review...

arch/arm64/kvm/hyp/nvhe/Makefile has this pattern for exactly the same
problem I suspect.  Maybe that's the right tool in the toolbox?

```
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makef=
ile
index 8dbf2532a573..27fa72d8fb86 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -27,7 +27,7 @@ asflags-y +=3D -DVDSO_CFI=3D1
 endif

 # Files to link into the vdso
-obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o
+obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o ../../lib/memset.o

 ifdef CONFIG_VDSO_GETRANDOM
 obj-vdso +=3D vgetrandom-chacha.o
```
Fixes `make -skj"$(nproc)" ARCH=3Driscv LLVM=3D1 mrproper allmodconfig
vdso_prepare` for me, as per
https://github.com/ClangBuiltLinux/linux/issues/2183
(Nathan, don't forget to link to that in the commit message)
I'm surprised I didn't need -fno-semantic-interposition (or one of the
related flags... -fvisibility=3Dhidden)

If we want to get better, (if performance matters here and we want to
trade source+build system complexity for absolute code perf) I would
start with that, then worry about clawing back performance via things
like:
- __builtin_memset_inline
- -finline-stringops=3Dmemset
- -ffunction-sections+-Wl,--gc-sections to dead code eliminate the out
of line copy of memset, though IIRC there's potential for wasted space
due to alignment requirements (maybe the out of line copy of memset is
smaller...idk)
--=20
Thanks,
~Nick Desaulniers
