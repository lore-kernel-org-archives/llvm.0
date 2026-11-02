Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636071;
	b=vwkkF6Sg90sccXfH9QtrRhndm2etKYdEsfveI59b5MvtAO81WgEMIhCAn4bEV+2nocf7
	 jkEp0aZ/aWB9/lxVgVSo1RtGRbRRHkhDrpNkbUTlPnQZiGdkrSISpeSExXMj23qiAW11O
	 zEkzdKQcihf08n30SA0vEr6JwTNEWajFJpU40BqhgrYheRJKqcaFduu8FPl+IgLO6ijNr
	 G1AvOENT14ippkfhOjrwtYF0Mj02AB62u+xBNBf8RvLVfpoVHJNKigllCF1nLVR8zntE+
	 nzvOB7aWVBXgKQmpHZE/8/AOMmCxuRHW0iRBKjxUvDtousgomqjIEqT70BXTs4g1yTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
	b=JttEfYf14mS78RYB0RFhUSKqXhZbO9Sjb6Oc1Xt7M6NRyl7nS+bdU8LCUw6WvGpAKdhT
	 QgHGuCezWFauLYGRQveS3DMPfCyocHgzVR49LZ1uASkbTdMlXBKko4dqPhZKV/b58YTYH
	 QCaW9MJPtfSa5jImBVQ4TAtku3VxKs0ozif5u4gazKbUnOPh4NyfsCndvXIyS600Rca9L
	 lLYETSXfNFf1dQGqPmnB91FOAMsddCOkiy2iEcrBj6QhESsWo93GL42fOPzNnnhInMFcL
	 u7WINRum93Vfdji+/8Zn3Qb7ySME3XcmcyYogCDWDBLTBWM3Oqn1Oj/NsrNLg8Peo9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGW93SQ8;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F060824C1
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 16:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377F060824C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGW93SQ8
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so26928265e9.3
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 08:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636069; x=1794240869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
        b=OGW93SQ8Fw3OAO1F4kb0DtYa82VSABg+61h37T7+gCLmOwwxGosWzDhmJma7Tlut40
         FeL3w12we4OSvC7Lim2l+5D4gNguDKMoe/jP81jrtmWD2NHvnnZP2nl4uaxTh1xjvZ1o
         ODMEfpJCs+gDdUJBmZR1UKB0nLZYkKDO07eL+Q7DpYec68ftTcC4A4ML59yzOqNC0qdL
         cXgQLZjeGGWlWCGH8LvSFYVXLBn7j8ymuyzYZUxNtGjT66HDuaV2DDX9BxOTfmwIYaxa
         gGwziJKEyxbbHdw9IQ3Cwcs9K4Ml/I6OQYQCOjDIxxje+O0wfmyT7zyRTDm3GqaRXhxT
         lqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636069; x=1794240869;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq5JtlRc0bd7QYpBrNP/yR1XPt2PV3UUDwsNUvNWTIw=;
        b=JxQBM8W01yK4jfkEnqG7mhtf637l0G0UY6KjCl2tELvk2cDM5ExrSNHANKExaG8i68
         bShmfyZXX1HiFnLV8QQgBT22w3WiyIfy6Y39JY2V9jmk6oHmLO0SxBZErlYGBQE0kOA5
         PbLqiGRJhoeHTe1gV0sMQnv01LilNt8OgxDVFDcqIEHY7c6QaLBUVlWrkWZbES1G6lek
         XSu0MUPNIA6izYSQUmj5HE+ey/ysf6R88Kf76F6kY4KvXvPb8uaC8BBKoZiswqwFN/z7
         YNocck+fk0JKrAeiiXONkIx7y46SIv77CvSnICG+zB9EY0AoFXJKgooS3CnCHFGypuDW
         Vj8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8AY5neQBY6KyzhlSR9GprWWcui8RjlG3ZAWqjpwuGqaf2/aCnc7DK4gxq3i1eWXl8gUkN@lists.linux.dev
X-Gm-Message-State: APuU4Z9qr3zJ6M4UaPli+qOJvGP38VbEr5D5kOtwrPdyjHVcYmptyXr/
	Ap37nVw8idYT+xDghMfuNNAnR76S78Jnl+TaCeAyg4lHDZFHt8+ZlCu/
X-Gm-Gg: AYBFou1AwqfLp/0miosWCl3nJyn0Zdofo1GnYALnHmc58gNktu5K+K/RQSqK+9My4Hj
	uK9zgHjiHhp7whR/4CKxY/iHxE1wYL5oQ7cRuq8m2R0iZX4qLwqYBbx0ERjinSSk5+yH9GSPbL8
	SiPChO5wtqsWDbqMcDYVxolYejG02dVfjE1TjGekonz4dKSCA1DOsJ4w4uc+og39X2D4XBOtZhm
	e+Jy8znYmfIYP7RV61XK3nEnVh1C0jc2tqt8UOgXf8LPID4Cx6loPNQyS7ytLYqA3CyAsvZBYVe
	qhuuZGa2jfuBsd+2dDgMOQi9JfY9egh721Z14ZY9q82HGaMk7MFpyyNz767VdJnEVVI0xu45YHa
	iJWc9YCM6yHml3/hNCAJV+53xSN2Bp5mLDjUGrl1uKe192IN3OWehsBvi2F9u5L6FnAanPYhah8
	wmBRBE8JclIgkkg3IJ/nzJuoLqZg/TC5WWvMFbZbzN/sOJLbV+tLnCMxIHBMyY3sTJpvxmF5Oxj
	CkNYry6iH0lZqj/3gYjJwzhxo7ueFADmqmvmqoO5oDhRxoLy+/D8qmkxLZBoUJLPk+CG2sV/dsc
	S8svwaQLijdbG0m3IAPw2OcGi0a6UBvPkbGC1BxAtcTF4x4HbvoIjxItfUa6zx9E
X-Received: by 2002:a05:600c:c118:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4af79eef775mr111736695e9.31.1793636069327;
        Mon, 02 Nov 2026 08:14:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm267629925e9.0.2026.11.02.08.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:14:28 -0800 (PST)
Date: Mon, 2 Nov 2026 16:14:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261102161426.2403d308@pumpkin>
In-Reply-To: <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
	<CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
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

On Mon, 2 Nov 2026 16:14:06 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> > The scalar path seems like generic C code and not restricted to arm64,
> > curious how that performs against existing (e.g. x86) assembly
> > optimized implementation. =20
> Depends. I think __builtin_addcll() is needed to get roughly the same
> performance as the asm version. In my tests GCC on arm64 turns it
> into adds + cset instead of adcs like on x86.
> But I will look at it, thanks!

The C version I posted earlier has the loop:
    buf +=3D count;
    count =3D -count;
    sum =3D carry =3D 0;
    do {
        val =3D *(u64 *)(buf + count);
        sum +=3D val;
        carry +=3D sum < val;
    } while ((count +=3D 8));

for aarch64 you get:
.L4:
        ldr     x1, [x0, x4]
        adds    x2, x2, x1
        cinc    x3, x3, cs	# adc $0,%rxx on x86
        adds    x4, x4, 8
        bne     .L4

I suspect that is close to optimal - especially for fast cpu with
out of order execution.

https://godbolt.org/z/eso79K7Wq

David

>=20
> =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:=
44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.c=
om> wrote: =20
> > >
> > > I would prefer to keep only the scalar version of the fused copy+csum.
> > > It reads the data once instead of twice, and on real Armv9 hardware it
> > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > depending on the core (+6-8% throughput). It uses only general-purpose
> > > registers, so there is no FPSIMD state to save and it is safe in any
> > > context.
> > >
> > > If you are OK with the scalar path, I can send v2 with NEON dropped,
> > > the scalar path only, and the KUnit fix for the x86 zero-length case
> > > Jakub reported.
> > > =20
> > The scalar path seems like generic C code and not restricted to arm64,
> > curious how that performs against existing (e.g. x86) assembly
> > optimized implementation.
> > saeed =20

