Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793878927;
	b=klyeIwOpOrWUENNMmIWaMOgD9gJHwg3OoJdVprLmv/ts6HJFx6nu7ayqse68124XHkzR
	 D3JbjudGf502aw6UojPl/pvkNuPcJF2zq+MYBJCoU/BMkbVAhbV6C3o4GQRWc4OrrYVQV
	 acuk9TzA9i/0FOrC6w0WmMury0zailgQPRMh2n6GkDBGIz+VJNj4VSjCk/17xmNrf7UYM
	 KBZ6E9UL3oWo0OM3PJUXORaq0izOqXG7c1OxgQOGr8l77ndN5eZna6xuYEh3ejelnAwpk
	 K9DpHbtJOWz4l67D0V8aDTcgG1/AsY2/5c6AEeeHC5X0qJgtZ1EAy/G2fAKdO9sh6Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=;
	b=oyKnoMoWX2BdB01e0yFZXTFdonSIXsnir4btwnZ2JxMD3haWD+5kQX/uQUCvWbIzg5Uc
	 RlLKhBQL3pLTh4xDinZLsNPI6I4zQLxMMMuVAQFqgMKvW0AzT99AsI52wtmQ3TpI6tH2K
	 eHqIX9rH4t7fQTAD1ScqgPpVtgZv22Gj9AsbxKmeBokTQmCq+l93KaIM/ZptBcI0m5gVR
	 wD9Jckwp+l/3Xg++p/HIth3lrfVyAqCc+LFRGAbhD41JGC7TsSkqumNMbjnlCO2BaR6er
	 Aymf36328QURNW9GkGqRWunv2WImU9FU4w/WdGXQnojGLs4lLLjZk+wAhMXv6fth+vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDvNflRT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF6E606A328
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 11:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF6E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDvNflRT
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so2606498c88.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 03:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878926; cv=none;
        d=google.com; s=arc-20260327;
        b=YyDiFF3r3wiiL3iOrVgqqhWZHg9RWRCmWB3xpr2INVLZkzHx9Iu+B09r6WhCKl50/r
         FTm08+A2egvYUahmjmHhxbdj1f3rAUpvTQJ5+27gzCsUoWgkzKkQzY6u8nu9uc5WSrLU
         dV6g5ubAMxkeskKw1uRb2mQlk1BnT/28mxN9b113bwVevkz2/SQoYEJfrcRTUzctAU7I
         8ao0vhHFRsPwYdbt6p6izxV3tvmat1+byBfuljGwj82ovGZdtEzWX2Pt4doOhn6tV+CJ
         pGmqIjz44AXGKpArX+zsQX6l0t3jORZ+9TOG794Hz4cfxDT8wb9CN+MOFtNscXFP3w5u
         zt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=;
        fh=/9E0IYWsJpdj9lMG/4YM9rrXhFyHg9uIOLDYuUWzLUk=;
        b=LKJQn8pdOTicK6nLHhkLz+cHOuyzPiDR+TnkytXlXP3QZHMo/4BQCkMyujw7w7p5J6
         AfFreyDJViyDhMMeV/wQDjMlEw5QCqjrpOlXO9vjqZRhOxLfmZRH0cXkV5BTxpBB1D9V
         J1jbIDf7trBxUcYA+/OZ5pRXn+WlhCVqK13GUiO7mfCwZkdXSyQRupYIGEYAvuCyDZNI
         +wdE1lgK+v3WHqpAR8i/ikgxi3P35E2vHGkSW+hoGkpKVW8tN/jW532sY+I5XBQF0I9d
         qysbdXZzZt+o/9pSl045TGg5w9nn1swXb9WFyGYFYzHFYgAJHWTFbCHVqH7ZTaP6b0oo
         ngQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878926; x=1794483726; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=;
        b=VDvNflRTa5hTfc5JEkmMI+w1ZxeHoKcDy41xnQB+HPHlG5bx7wjejzJTwH1jEi22om
         ZlYwh53/+LEBfD+57LVBwn8gHglbjORqfvnOBarmEWCl7zOdIVXfdI7NoVkHjCKwiDEg
         JYrh9qVKo3sEg7fHPvDGo2xB/8g1N92dl6faxi9kx43V9WEWtbCXsuw1VgMV7WOtmAVM
         Z/hXedNQeg13NiKwZAuSJL0BxoFLl5PGKPwHgcDfC72zelCZgiKgsVzPRJ3JvpZX9RBD
         g4SnGHR5qRy+9PG5Cc9guis1QCUTLtBU7OEN4Xn8nrd/xV+4qmovtmmaMKbPFUkltDsR
         jNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878926; x=1794483726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZy2AlGoHMhT5kSino03X+cU+0j9SA9toGXagMkx2FA=;
        b=L3MHrvPBOqS2ydUbVwOAyYSIr/ynzO28oh1cGuHgy3H0yn6UkgXCbiwLJ1G2MFuBgN
         8z7GEcEdjaGGJYSReyXPRwv96054dsQbmRo0MypcHN/jmQQ0qp2UNt8d1f67qttfKhKZ
         11mIjpgFatso+bfZqFIgULwF8w/xFkol2tEMxtbqgrIe2+oJEwQIqVVWSHGfhaV1FqFQ
         EDCcJoYY9bm8M/x+YXCJPr3TT7zGQDqtQeRM8icxAIY/06nJSj9PNeuATxnr+SluzD35
         BUi4l0IEc+vJcdH1RiZiowtawBpgFwcmfLnTLN++1slSEUh6Oqu//PmS48ahE94y/S8t
         4tyg==
X-Forwarded-Encrypted: i=1; AKwUvBwGgS6DjksJvK6cpiCN1SIl8Sq2hUB8JHOV/9WyvY4uZXoGWIVi9IBEichKK///g3Qnp4bP@lists.linux.dev
X-Gm-Message-State: APuU4Z9EVRUAyMYgpOSAfRkXcA/PLN+svqCiHBLhNcU/2Lfbiu9fpgz5
	vvH0AbwihVE09EmCLQ9YT/d1/+sSYZDpq3V1bYc1a/Ud1zImQGCkMEp+kzwuYWvlGxd/D8KS2JR
	9EI9qWwQ0GBLYsvS1f5YexIbw2AmK7YE=
X-Gm-Gg: AYBFou1GDSFrUQTZ8PMLz7o4oWJwSGxW8C8/F1s0PHs/GMvGr+7f9e8K63bFKav6R15
	NfBnxDxIaHEux/UiAbq0JwVMbw4kNq+y4REgbRJt50/HdvQ8ftXhM5WPdZyL0XMfns+OfQG6DOj
	jgYpC890K+2YX8An+dw5hib/ZZZQzUHDq6rMWU3L9rG1uzFAdNGaiQ1bVoV92rF+Ft8J9ZnlDJ9
	ZyCSXCnt+iBfYwhqsZxpMR7NfMond8BPX60SVGi46N5H1L+BC8EU6DNycVQGQKLj6hXzgMpECzJ
	snCelRd/QdoC8EgZCXKK/oJaIHoPVWyGXQBPdN0bLqBYgPG+UNSjXIbgjKO/aMzQow+f/NYfxUK
	NxHQENeFeJOdFNgocKwiPk8+aYQTAw+DTfJqW0zr2lwLXouATHmTFi5j6Cyv1aLu+l5s=
X-Received: by 2002:a05:701b:4281:20b0:158:1ed2:cb58 with SMTP id
 a92af1059eb24-1ac5e6f5362mr29461112c88.39.1793878925686; Thu, 05 Nov 2026
 03:42:05 -0800 (PST)
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
 <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
 <20261102161426.2403d308@pumpkin> <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
 <20261103223846.5e6a1dfc@pumpkin>
In-Reply-To: <20261103223846.5e6a1dfc@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Thu, 5 Nov 2026 12:41:54 +0100
X-Gm-Features: AclHuK8YmBfrvU8U1rrj8-xeeVAzdXMtREA20yl9x0xVbHvq-vQqOjWILfZrKI8
Message-ID: <CAOLeWCvDKWAuCJ1cW1bbhtmvhV6ei2cPYcQVw_4sM+i1tc+-wg@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>, 
	saeed bishara <saeed.bishara.os@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow <davidgow@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.

Hi David, Saeed,

I tested David's sum64() loop, with the store added, on x86-64 and arm64.
It is portable and correct on both, but no single C form was fast on
both:

- x86-64, vs csum-copy_64.S (GCC 15, Clang 19-22): with dst alignment
  and 64 bytes per pass it reaches 0.89-0.94 of the asm. The form costs
  two ALU ops per word (add + adc $0) against one adc in the asm, so even
  a hand-written asm version of it stays at 0.94-0.98.
- arm64, vs the scalar loop from my series (four accumulators,
  res + (res < data)): the same 64-bit loop is 0.90x, while the same
  loop on 128-bit val/sum with 2-4 independent lanes is 1.19-1.24x. On
  x86 those 128-bit lanes drop to 0.40-0.52 of the asm with GCC.

So I'll keep it in arch/arm64, and x86 keeps its asm. In the next
version I'll move the loop to 128-bit val/sum with independent lanes,
the same way arm64's do_csum() already works on __uint128_t.

Demian

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:38=
 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 3 Nov 2026 16:47:29 +0100
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > > .L4:
> > >         ldr     x1, [x0, x4]
> > >         adds    x2, x2, x1
> > >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> > >         adds    x4, x4, 8
> > >         bne     .L4
> > Agreed, that is a nice loop for the sum-only case, one dependent op on
> > the sum chain and no builtin needed.
> > For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
> > 19-22, -O2) with a store added, against csum-copy_64.S, as posted it ra=
n
> > at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
> > it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
> > posted 4-accumulator loop (0.88-0.95x).
>
> I just added *(u64 *)(dest + count) =3D val to one of my loops.
> gcc just replaces the 'add from memory' with mov/mov/add.
>
> I'm now confused though, I seem to be getting different output from earli=
er.
> With -Os (which I didn't think I was passing) clang is refusing to do the
> 'offset from end of buffer' loop.
> With -O2 it bloats everything by unrolling 4 times and adding lots of
> extra instructions.
> (AFAICT the optimiser has a completely incorrect cpu model.)
>
> If the compiler doesn't generate the expected code it is all pointless.
> The xor parity code loop had to be in the asm block to stop the compiler
> changing it to a much slower form.
>
> For the checksum code I have managed to work out how many bytes/clock
> the code was generating and getting it to (reasonably) match the expected
> values.
> But you have to use relatively short buffers to avoid D-cache effects.
>
> David
>
> >
> > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
7:14 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> >
> > >
> > > On Mon, 2 Nov 2026 16:14:06 +0100
> > > Demian Shulhan <demyansh@gmail.com> wrote:
> > >
> > > > > The scalar path seems like generic C code and not restricted to a=
rm64,
> > > > > curious how that performs against existing (e.g. x86) assembly
> > > > > optimized implementation.
> > > > Depends. I think __builtin_addcll() is needed to get roughly the sa=
me
> > > > performance as the asm version. In my tests GCC on arm64 turns it
> > > > into adds + cset instead of adcs like on x86.
> > > > But I will look at it, thanks!
> > >
> > > The C version I posted earlier has the loop:
> > >     buf +=3D count;
> > >     count =3D -count;
> > >     sum =3D carry =3D 0;
> > >     do {
> > >         val =3D *(u64 *)(buf + count);
> > >         sum +=3D val;
> > >         carry +=3D sum < val;
> > >     } while ((count +=3D 8));
> > >
> > > for aarch64 you get:
> > > .L4:
> > >         ldr     x1, [x0, x4]
> > >         adds    x2, x2, x1
> > >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> > >         adds    x4, x4, 8
> > >         bne     .L4
> > >
> > > I suspect that is close to optimal - especially for fast cpu with
> > > out of order execution.
> > >
> > > https://godbolt.org/z/eso79K7Wq
> > >
> > > David
> > >
> > > >
> > > > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 12:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > >
> > > > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@g=
mail.com> wrote:
> > > > > >
> > > > > > I would prefer to keep only the scalar version of the fused cop=
y+csum.
> > > > > > It reads the data once instead of twice, and on real Armv9 hard=
ware it
> > > > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12=
%
> > > > > > depending on the core (+6-8% throughput). It uses only general-=
purpose
> > > > > > registers, so there is no FPSIMD state to save and it is safe i=
n any
> > > > > > context.
> > > > > >
> > > > > > If you are OK with the scalar path, I can send v2 with NEON dro=
pped,
> > > > > > the scalar path only, and the KUnit fix for the x86 zero-length=
 case
> > > > > > Jakub reported.
> > > > > >
> > > > > The scalar path seems like generic C code and not restricted to a=
rm64,
> > > > > curious how that performs against existing (e.g. x86) assembly
> > > > > optimized implementation.
> > > > > saeed
> > >
>
