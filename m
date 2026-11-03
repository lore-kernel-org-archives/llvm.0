Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793720863;
	b=YqPdAgZhpEiSlPMGVQRMEGyVRyZQ3Qh7cDj+DaXBmFwXbOJbeJwAVRx6wrYbuhYuKZw0
	 49ku52cQbLOeHHYkrLUlS+3FZorZ7xY4cp1oAq1misZ9PNTkKsMGCQW8yt6hAytpTzM6q
	 04+JVNQhBFl9EkCHsXxMV0PjavwwP+qi49TNhkElCHlbt3y3WSM9ihYSdNhRoeGqVbZeR
	 2XSwwwdinMgTO4UK3oBKrr+SaI3VhJn0riI3yQ6UYd8XeE3y+xAYCwinHn/rRH7GpHuY/
	 4/Kyqw0eiaVaZoaoHUlXfGjOb6Ii1N3ehptjTNmMj1nftMzyDCNJkU7dUbBleB70XtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
	b=tN0L/RGvJsVqCQ0uNrQZ/EJVe6bf6ErVvbh8MLPGrYxNxAdDTgRvDANbB6OK6u9k0nNX
	 Uk/JUgCshWv3ZcByFr0flCrznC2DYoYINmHGV44pTmKnguOH4rdPfJ1PavtMN88hDKDqk
	 rg8Z+6fc/02VRpBrOxopttFR7V7+M2guZ9XPzLoF3eVd49X79DI2RucZAqTOLjG3xEaYV
	 MzOXzAVIHG9dzZ8oiODjTtpDe7Rw/q+rBjhUUaowxhDK64A0KvnHefDlywe7eiirVhv6T
	 R65J0TRG+8LK3SetVsUvFVYtIJk1UV6t9hd8IQOjda15ONPIslq6mZMvOOyFPqqQ7wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyvZZsuT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B83A606A328
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 15:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B83A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyvZZsuT
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1173477c88.1
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 07:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793720862; cv=none;
        d=google.com; s=arc-20260327;
        b=RzlpvulAXLJevOo5b9eUtgyYtI7fXXlWryeDraxl8lQ0upAykEnntaKa6a8VLiusbv
         /Fa3pQ2Og0JzGOb+l2RfolYk/9PwcC6Q7zz6MOxEhvF7+oKlBY8cYtcmpeUvtKqp6I5i
         dwfz1nAFFYE7Hl+rk9xImiWfCAJm73gA3f4Xu+EqYa3itOJuuunHo4b2BPldeOpAQfn0
         Ccqevwmr/qoCp4CxbTarYdFPz3zMqCbNOBXR8RM0d39ufxhuEA2hFmHmDjugD9aVsX0o
         5q/zG+s7m5ZIC1xkA12FX9pgrzL/+sp6CZShfh2ee55yDwiCkvUTvUHaIfRsvHLhkrHs
         lQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        fh=kfJaD9CY8+rl6EogVZnUrNtWdE4DRZ7lPLTXeJKJ92g=;
        b=qWKiuIWTIwu/dP9Ob014aNrOccPlRFTvyHNKeX1KceVEnRByK1B3X05nfZ/Lt+iRbw
         g+Jd+QkGsWLXmG5K4w9222oYzec3CgygbxRiC8IAEc5amGh/c/pIoxMCafB3B6gHDP5p
         Ul/qqY52pF2BFXV/3hWR7RZcD9JJwq2c3mq2fQdK9Rx0ax46/UwXfwhlFUgsaSSk8vR8
         groWDMd5A+zq8cqjSSBGI2DSKOlKiLTIUyUReJUpMuGPBliOcGhxZYv7f3hJR6r12DVL
         XS7msMFLla7E6qkEkf2AmqRiCAgI+cCZrpbwx/4s6x/BZwcyAp8AgkwQdIDHzRn/MtCx
         dkwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793720862; x=1794325662; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        b=oyvZZsuThGL1UlIkFAKKNmrMY2JUIsPlh6IQ+YD2WPwq+WQbCAx8EwDtaJHezt0eQK
         c155sdEPG/gJAhFYRS8aBdPOJ82geQ9x+bPlBMaqhVFcOzDRtrkt+jEgLCmu8NJ6PURe
         Fv3aGQxzXx34WI9Y2fD4TkMj4yTFOvFoVm47kKlxH2ID9ujcVL9woBsHjWSwrrTf5SlJ
         SoSl3oGQTYiiCXrd3XvGdESPMOaQj+rhq9CWdY1y7ToH7YV6u91G853v+aj+MDe1Lf1z
         GqpLwUjoSxEykemZdCugtZbHVHXm2I/OAJ6hRotW81+eM7f7pOHkVVvjhQCqjKyZyvZh
         uq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720862; x=1794325662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeMclKfCDNmL6wdCZNtIoHpg1BgrBEBrtRcEWNmtqAc=;
        b=sQ/A3zhZwR3hJuaIFSwISvuQaBQk7U0KKfPV2V6L4zjtovHNY5sbhDGdF0aJQMQfVb
         FwJoFRkOt7eu6Kg2K0f5PT7JwdX8cYqvTZL3KPeiAHyzggPBV/c3mNaDxUyx2rYteL/7
         T0n8cRgSMtzrjuVEI6AYvJZET1BZaCkNhMKTWUOb1898hnpxTlXBwpAjXKb/Ia39PLWJ
         rvA6B3YPTW8KA9bu70o85JlNixD1cfZy9Hxff2tDy4Wny6g8ZLIHnELxb2OdnJRF8Ptu
         /6S72kD26kQvGCsw8WE2hi2yJPALLMtjHCzdWswdVyC+akYme71OnBumJFmVcMYb/WG2
         4FsQ==
X-Forwarded-Encrypted: i=1; AKwUvBydZh3NfSMjGqy+4U9gvIDRlotCUWlIaPtpXRNSqAEMwcvuKmW+zr3D8i8uyLVJ9lmsAYOK@lists.linux.dev
X-Gm-Message-State: APuU4Z8j5ZHE43ZWwTXBUISwLw7YudcKe+WPcSppBtBbnGM5PQKWdAPe
	W6oWIMvHYlAOkGhRgSLaXZ1H1JAi9RtNtK4Clwt6c1dHfM3AVTNdmRy0Bw3fkhtNmmcswICNDmo
	DxyMCl2ktUpmCtnpTCfy+F2nUnpb9H7A=
X-Gm-Gg: AYBFou1EO3ufrRqe5X/r87ZbiPsRa94MJlbmgMx5EqDAQq7FoayUezrW2NJrASwN9kz
	+hQgbEvVlQhDLkX5AsSOsZe+gARSQVMl4GHR9LRgL/zEaRfpb8QurbC9jQz7Xr2TQpm9nR8ZV5q
	KNuk2jZ2p/5wEuFDUzDc8IUH2c6L99tNLQJRvL8/yKpcTQkIeSYJ4yuky5kIOJl4mt7FccPgPoS
	njT1lx/P0fdaO9qSVCrI/mkpHCbFjFciwRL/4+pzVE3xjUZ88JWBHVDWBjeYPt2khrgEFEkaWJo
	+N7vpS3kE+OQBKsIEgKfU7c8pGwaKoZs5W1zi+EQNmusHDfrROM0J/HOzA69WQyl24lAR0wYLfe
	6I+yHtM3x0rgemf2zvGHQH2smG+dvS/NmYlN0+tIVuX0GSL+ITToEr9GrZA3lvrogMFLQ
X-Received: by 2002:a05:7022:3f0d:b0:18a:8164:ce4 with SMTP id
 a92af1059eb24-1ac4fb0c60amr20787898c88.0.1793720861540; Tue, 03 Nov 2026
 07:47:41 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
 <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
 <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com> <20261102161426.2403d308@pumpkin>
In-Reply-To: <20261102161426.2403d308@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Tue, 3 Nov 2026 16:47:29 +0100
X-Gm-Features: AclHuK_ib7dEyaiKe1UK4pPwMx_v8L7eBFgO0-a0RmurEZQOzqGEC7L3Ybfd7oc
Message-ID: <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> .L4:
>         ldr     x1, [x0, x4]
>         adds    x2, x2, x1
>         cinc    x3, x3, cs      # adc $0,%rxx on x86
>         adds    x4, x4, 8
>         bne     .L4
Agreed, that is a nice loop for the sum-only case, one dependent op on
the sum chain and no builtin needed.
For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
19-22, -O2) with a store added, against csum-copy_64.S, as posted it ran
at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
posted 4-accumulator loop (0.88-0.95x).

=D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:14=
 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:


>
> On Mon, 2 Nov 2026 16:14:06 +0100
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > > The scalar path seems like generic C code and not restricted to arm64=
,
> > > curious how that performs against existing (e.g. x86) assembly
> > > optimized implementation.
> > Depends. I think __builtin_addcll() is needed to get roughly the same
> > performance as the asm version. In my tests GCC on arm64 turns it
> > into adds + cset instead of adcs like on x86.
> > But I will look at it, thanks!
>
> The C version I posted earlier has the loop:
>     buf +=3D count;
>     count =3D -count;
>     sum =3D carry =3D 0;
>     do {
>         val =3D *(u64 *)(buf + count);
>         sum +=3D val;
>         carry +=3D sum < val;
>     } while ((count +=3D 8));
>
> for aarch64 you get:
> .L4:
>         ldr     x1, [x0, x4]
>         adds    x2, x2, x1
>         cinc    x3, x3, cs      # adc $0,%rxx on x86
>         adds    x4, x4, 8
>         bne     .L4
>
> I suspect that is close to optimal - especially for fast cpu with
> out of order execution.
>
> https://godbolt.org/z/eso79K7Wq
>
> David
>
> >
> > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
2:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail=
.com> wrote:
> > > >
> > > > I would prefer to keep only the scalar version of the fused copy+cs=
um.
> > > > It reads the data once instead of twice, and on real Armv9 hardware=
 it
> > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > > depending on the core (+6-8% throughput). It uses only general-purp=
ose
> > > > registers, so there is no FPSIMD state to save and it is safe in an=
y
> > > > context.
> > > >
> > > > If you are OK with the scalar path, I can send v2 with NEON dropped=
,
> > > > the scalar path only, and the KUnit fix for the x86 zero-length cas=
e
> > > > Jakub reported.
> > > >
> > > The scalar path seems like generic C code and not restricted to arm64=
,
> > > curious how that performs against existing (e.g. x86) assembly
> > > optimized implementation.
> > > saeed
>
