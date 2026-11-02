Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631500;
	b=iQEr6p23S7mNzc/w7603vgnKYm+tXqW6u3Pmj5bXcSax7uqbiSo4UHbxSQmFu/CAtIjS
	 7p1XVkNvyDptry9pakB+xFD0ljm16aCmSS9+0N2JnIbhJKs/b4IdmPQsTfiCU8OxDevZ4
	 qPEvQsfUPnHTeUTI8M4fOGlTFbou6BtaKMY8iaT6HV3FmBW7B8e7/VUu0+935ooqISh/d
	 fjqPGz5vBCiOX6QUG4Hkz4FCsuEcwnU3Q4UpO++uH0KVsb7iTVwwAAronoO9dyDBpMSTn
	 Z3eMOJ15lojszfBe1XSPC3NZoUtER8ncnHJSaeNDLHQWEyosoGIJXnqBrvBzmTdt+VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
	b=XhqNbxY5IadC89EORbB8XZKCwpbQrKesuS7aAPgr0O9WaocB7VDXFp4QXX5C47YDLXgP
	 dBMWA1B4jmWMyZoP3sag+vdsveSaKO6+Y1qURcxdGQqIWrl2L9yXqcKKpgDrYHRvyLRTJ
	 dRXu286gJQMwnTlyOz+H6bBTeQmPZo62+5EBKJJ4EFcjMkEGDramDs6oWP/sVbaYvgdK9
	 gbf1Q6FNpRnfdQ0cky1ATRgazQMR4So2As5VHl5odRyh77jlMHC2FNG6MmqdoK51Pw9ZE
	 Ves8eoyS6QQDoyse2djQJYsO9Nu8l+V+OC5B+CazWsxsuI2a8sTFwM9KmSNhaDB0mgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZmVBcms;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C46B606FB63
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 14:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C46B606FB63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZmVBcms
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so24011115e9.3
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 06:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631499; x=1794236299; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
        b=KZmVBcms0npPoO2XbD5/a/Ui2wRtrBDZOaZYf60eaiN9AiyfgciS0m9UeYyCUvoVdK
         WPrFH76gf+KvT7pkcMDVG/JxS0dlTKAO7nrbSJ5sxOG3AOwocSVWBRtRzmR9tZL4FmGR
         l3Xyh9/paoEuTP8jR95MWzts7Haim/jQlJ8+dxr926d4URAJd14HISLwvMNP0IzGn8eB
         De4+sWLUGeXmQAqS+mvnMyyIhZTL62bdngv/dz1Asz1sZLvRnl8lbK2Bftz/cqywiCtA
         Bfr3Iys+cn7B9Cef87qv73hMpXBrRnzay6XU6eYx+u3c1v80PZ2q8MrrX3TJl517HX4/
         k8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631499; x=1794236299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjJ2Hwu3lUOd6ON7ncjs7o5wy86KpEGCg7RvieuPzxo=;
        b=GUSIuEzaZyjxlOPEUPWdmLpqACCfPOdf+okIIHgZBQF91BqDM+8WR1btQBJmxtlIT1
         W9QQXaxmYIuX/gIoAuJsEk1Nzfr8fpftaF24NYcXgYs01iIdp/vwfEpaP9kLdSqAcIsJ
         IrKd3O6l+Dj6ldSqcC3aFv5OBLpKfdc0WaSq3SyLIH9IX+ADMKKD/KXd62H+Gqi2J2i8
         ac9i73qWedxnIU2maxgZEse33dhVsB0kY/tUtNopiGMoZfgdhE3FSn6MLU5Fr5ho3XrI
         mBCT38UlSDrQah81A5cnE5k737px6O9DWJwYOZEP+g6sDPkmvMjL8/ndRE3k+O+R4f7u
         Zqdg==
X-Forwarded-Encrypted: i=1; AKwUvBw32xzbbkZ8zNtJNkTlxQF0OogwcJUa6ZsGAjs6jhONJ9f4lAuBQ1wEgIb9MO1NtMOubSpn@lists.linux.dev
X-Gm-Message-State: AFq9FYKyZJiaCdcH0p5OwVYPn4T1YaZt9Uawm/P2fv4RXj/tX4n75aXE
	GDpFElPaiMMOOaMmK1wBC7C/XtoPqarRdr0FyiT7ufkAr2+NJ1Vuq/Rx
X-Gm-Gg: AYBFou3748iEUVVIJa+arwEyfuNnIP7+mWzhlrjbQVpAHR9/4cfIf4Sa1flt5J+LQiw
	t2f8pWSRxGhNnfmjQgh9ojUBhPvmDThRACTwo3zsXxAhkkwsqpBjdJDsgkWNYMdB5iEF7cKpAbT
	XGaZm4aiNwIPclIqhfuZezyRTu8MH2k8MQaqIbn3oLRHY+EjML3zaidfSYL0laVqOjlLvPvPr6l
	GfyyadxNfsfpF/x3dA+Q8O8zTf6ZGbgSeX4xBRdU/n0gyffc7V4KAgfpGRNujF4d7yYu9jnED8M
	FB6qIlXbWF05tXKQ/vR8kcjobwR1BLPrH8oWt/e42ZnlNJ14opRajIhJfvBBSUGZ0p3CsPDZZ3U
	42AddLrkmx+rafrb9Ig2diowKxP/XajKvIwVZuDQgcP2pKJepRg1qrcD16f3jXK2Hoq4qlOqTnL
	Wja/fr6FANM66LzMhJ3b8ff39kJCsBlVsb81vs9q+k9+8CyKiHxWzXEohhP4fZ+I6t9QaDcUtZe
	UxLkYzCJy2hpb3svxrj8mUMfRS/OivFk9rvpjUaafcSf0u1f843s9r1vd3zkVabNgy01QZ1QrlQ
	7D0s7TrBdMEXInNLupPhYxKj04UMAHXSRtHiFzbnF0aTvif9zEdVLvWOOjjONuHp
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr230617865e9.28.1793631498658;
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0b4df257sm164791725e9.4.2026.11.02.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Date: Mon, 2 Nov 2026 14:58:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: saeed bishara <saeed.bishara.os@gmail.com>
Cc: Demian Shulhan <demyansh@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261102145816.00a06c47@pumpkin>
In-Reply-To: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
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

On Mon, 2 Nov 2026 13:44:37 +0200
saeed bishara <saeed.bishara.os@gmail.com> wrote:

> On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com=
> wrote:
> >
> > I would prefer to keep only the scalar version of the fused copy+csum.
> > It reads the data once instead of twice, and on real Armv9 hardware it
> > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > depending on the core (+6-8% throughput). It uses only general-purpose
> > registers, so there is no FPSIMD state to save and it is safe in any
> > context.
> >
> > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > the scalar path only, and the KUnit fix for the x86 zero-length case
> > Jakub reported.
> > =20
> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly

The x86 asm version manages to do more than one 'add with carry' every
clock. That needs the massive out-of-order execution unit and the ability
to have multiple independent 'flags' registers live at the same time.
The generic C do_csum() (I just looked at lib/checksum.c) is horrid
There are three dependent alu operations per iteration.

It is likely that the pipelineable:
u64 sum64_a(unsigned char *buf, unsigned long count)
{
    u64 val, sum =3D 0, carry =3D 0;

    buf +=3D count;
    count =3D -count;
    do {
        val =3D *(u64 *)(buf + count);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((count +=3D 8));

    sum +=3D carry;
    sum +=3D sum < carry;
    return sum;
}
or:
u64 sum64_b(unsigned char *buf, unsigned long count)
{
    u64 val, sum =3D 0, carry =3D 0;
    unsigned char *end =3D buf + count;

    do {
        val =3D *(u64 *)(buf);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((buf +=3D 8) !=3D end);

    sum +=3D carry;
    sum +=3D sum < carry;
    return sum;
}

will generate 'pretty good' code https://godbolt.org/z/K9ob6d8vv.
The first needs 'reg+reg' addressing, the second better for mips-like
cpu that have 'compare and branch' rather than a flags register.

gcc and clang seem to make a reasonable job of compiling those
(provided buf isn't u64 *).
Today it left the 'negative offset from end' loop alone,
but it has a nasty habit of pessimising it.
For x86-64 gcc is generating:
.L4:
        addq    (%rdi,%rdx), %rax
        adcq    $0, %rcx
        addq    $8, %rdx
        jne     .L4

I think a zen5 would execute that at one iteration per clock.
Intel cpu can only execute two clock loops - so it needs unrolling once.
If you unroll it once (with separate sum/carry variables) there
is a moderate chance of it running faster than 'one word per clock'
(two words/clock is probably wishful thinking, zen5 can do 6 add/clock
but some timings I've done imply that memory addressing can use and alu
add).

For slower cpu (especially in-order ones with memory read delays)
you may need interleave the code, eg giving the loop:
    val0 =3D *(u64 *)buf;
    do {
        val1 =3D *(u64 *)(buf + 8);
        sum0 +=3D val0;
        carry0 +=3D sum0 < val0;
        val0 =3D *(u64 *)(buf + 16);
        sum1 +=3D val1;
        carry1 +=3D sum1 < val1;
    } while ((buf +=3D 16) !=3D end);

I didn't try those loops when I was timing the cksum code a few
years back.

They have the big advantage of a small loop stride.

David

> optimized implementation.
> saeed

