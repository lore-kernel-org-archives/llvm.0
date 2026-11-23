Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445658;
	b=aBEKeUQqfn3tECPLQF202qrtfh9ewFgYgiLhVT4vmzDJUPqvmuxUjChw/V7zHqQH0yNY
	 nTJLQCZSC2nXd4tIuQOYQXP2Iev7tLdg5wKMa4cPTKGfAz+kvn2AoPIyJWp+J71QKk7rf
	 nGGhARKK9kHxPLihN8KvjsksL/qWE5HbgQ8iCyKDMRTp7LGspgZSyaxAswpC28xaeUvbQ
	 Pky7aVYaypggyBUDr3qQlCg42Y8dRV+lWZVyPmpQU2NVdOP4r/vMLfrS+eDXVnfhy11w3
	 vfCth6cJLMjfOUL/8m8IbpsxXBYgxhGgCMbgboWsogQEpyNdXg4y4TnN6ehN0g3/JDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
	b=fVqUXAEJNJRxtmOh+w3tnMWxEpYyyO2mZFnBSMqO9aBeTrtKVyYEcAAwK50FJVaSuQFT
	 2XvnU34U57TarNTX6K9B0hDPBiQ7NwUmx/Y9Vhk0sinAK/nu+7fljNbmJaTYp73Z4JEdl
	 MEjVXXlnXwabc+feVgR7GzMVLfdyisqbWbfOlvmBCvTyFPfySEYr0n9Tf/34gdl6WrsWC
	 J5rqYy493dUGWIKEnhfDkFIng/Nm6+OxdIVdTbM1pXy5z4QRt9CcCEtFTcJq9uBSB+h+C
	 g2LhalEPfQoQ5+lMYpJNF68OqqNI4DZP2LcWF9hN5xeNHkBQIK6BZiZ1qY2zMMTfDwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PqwTS798;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F046606A31F
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 14:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F046606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PqwTS798
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cdc606b47so574626466b.0
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 06:54:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445657; cv=none;
        d=google.com; s=arc-20260327;
        b=Vbcbu/63qlqmapWywVKsBsPuyKa9JEhg18Te3w2/4qB8empDV+LTuUKQH9aQR3XXDc
         seyEfVYlHS4th5BAMlu4ZrHgrUAEJqCHsxQZ18xYaiD0Lj7HR11tsr4Yqrs7D/3epJmN
         6m6UoAcmUqaMmPBB3yHO1nxW2dEqhrwS4YbTk8LqO0u/avQuQNKY0RZ8Vtg9eVVMxaW5
         txVIHROT5OrtgsTWdI+arlWpjtgo06RrORHKSzVb/jdMewh5dvo6pLku87/lUV5YIyy+
         eyZE1WlYSEgcCiAAYA9R+M9dEpi4wc+8riUix6lxhDXwY3+qVcGxRRtMm4fTkpwbmCij
         eojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
        fh=4RCZ26eteDAZjfU8HZyZcU2s8jgwYovvWzpUfkNJccw=;
        b=I3hVMuPFfLp6fx9H0zB6393CCDqxDkxy0weVaQNUwftasbIa26XKxHAxz6bcpU+Y5i
         sonDMHP1qsbxaIi+J1cLZReyF2ln9GrFlKNSlOP+0vk+sVBtava4vcC7a25aR2D7DOXv
         UbSNeh9ynKXVA3xaHYikfQU0tjWczcgx1Wv0OaYxJlMnbR1ywosqnc+QCOYXX4XYssQv
         tSmNsqOrZShgdT6f0ksgmapnDXLgStOGVx/9twYDzrBR6aZ0I/Dz+3KYc7IlTxB8G/7b
         nXvwxrhRGObNmbSM3F50W1z/fM1yLhGQ5+Q6nIlCBxiyVIabVoN0zWTwN/1jVLlNhHCJ
         5ivg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445657; x=1796050457; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
        b=PqwTS798oCTurZmTNN6zqN2KNzrZBUv6YZWwPioQ3BCBZUMzLYTr1Hxl5F3fJY0IaD
         rbR5wcX7My6EJUpLTsdxvUfb6mZh2WKHnWrYyhpe9FkMczBFfRDstAQcYXEal4iE5stP
         HEs0T5LUYboCXG4XQioWNuuWEdUfsaNy8LvpNAWMOBeCTQwxWg2rVgsN2W8iCp6i9dYm
         v6or6TFG9BztPQ3fL0UeOZZO7rVboKEXTQywAkluW65g2mdWTul75L6kw6qwrTfL4HVm
         MSK2ozqi0+ZMY/TCeElx8UFd1IeJRQwXG0bhQNbQDXkjHYDbIL4CWAJB39WcBUiRSA8T
         gJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445657; x=1796050457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufGJoKCcAS+FG1R9253xSs80GkWpyQjdUam5hUgGAsg=;
        b=Dtca6KlCzZsISQ8sa1JBqCBtXibVtigEqWhnxXKY5WOpNplbv0Bz5Ouu37/U4PiRkI
         Yf16J8hqZjjkYU+msjWyd0rarOsCdq2vFHSJuiIZEfM/uYw18n7XbP0Q95qTSGwKkgYt
         l+HsXb77ah411FYNisGTwTYOqAZSZOpEynS6Pjni07uPyjF2ofF7vljVH+f2bfIIkee0
         QvGP78lVPgR6AvnwCUix+DGhjQuppSZX5iR6yANUMiiOERG6L+pPFGRN1CV3bJ/n7Tyu
         LwPrIAV8VUAD0+pwWB7DeD3B/g7zN66qV1SnrNR0tsCSv8A16dkgIt+Ccy5zjfAShqJr
         HbTQ==
X-Forwarded-Encrypted: i=1; AL+hErGvC1BsCUTddzt9GRnwQ4d+wpmfqnLoRBYs0l/9YZwUV2iRSggwWtbgwI5C5Agr74gPCUPR@lists.linux.dev
X-Gm-Message-State: APuU4Z/Bd34foxExmoxxhfbM/EBHaDJH6pRJgEHZg0yeNnJvHar1HVwa
	+a32oRzbWvtFqMc4m92o775uZ7JTuDg2p9HSHtP+ZiTDQteel83qZOvgJxRGaTDQtj0E6F9q/5F
	/8voJjOT3MeLPFJRlq6Bs7oKPMrkEy4M=
X-Gm-Gg: AZFdTZeO7R5myZVQ5pe27/VLeFePPGKgMDpR07THBfqkLFJXpL/K77Ddq7BjVYoRWTm
	eLACOqrJdSeclPJdQ0b19fKez1CTbV3dmHW7Xyhvrg6PfYQ2KnFg+WkJfIVB4hR6ecSUg3N6KNP
	4V5pGQhRrzPw9qABt+XvPQfr+tg9gfM4vYnpVqfWeS8kVVNrpa65+Sn1tNavv5y3V7mu+HoLRFV
	zE+Pg4S+XCBZfrB8LF0ZIg71zADqTUuH82Eaa8oOtZydMPrghyVV3D+aK8AdgDFPFVyxlXnutwY
	4Ox3J5xsYaH8DJAjTuR5IlRe0hPjZQLjl8GnORduztVxONuX1a55Y+IDu28oO2rdMngi+b2tnTg
	rfoEq3IXxZalBnuGv+rgDFWCUPoDA/9O9OkzGz9SkFxWshPq/a8EKuRt2
X-Received: by 2002:a17:906:fa82:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c513a5eaea2mr740199066b.15.1795445656730; Mon, 23 Nov 2026
 06:54:16 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122152900.1113961-1-sashal@kernel.org> <20261122194200.GA2122@sol>
In-Reply-To: <20261122194200.GA2122@sol>
From: Shreesh Adiga <16567adigashreesh@gmail.com>
Date: Mon, 23 Nov 2026 20:24:05 +0530
X-Gm-Features: Aa3M54oFCYgRDogfTqeuThv0nhidW6LYPLzRsNkekwYNrTVHMWAhXuqfICGEcXo
Message-ID: <CA+-x59aKkxNODACP=HcG8g=Z2i_=pGyVOJve=r45Gm2N8Ks+Gg@mail.gmail.com>
Subject: Re: [PATCH] lib/crc: Use uint64_t for the new NEON crc64 fold constants
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Mon, Nov 23, 2026 at 1:12=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Sun, Nov 22, 2026 at 10:29:00AM -0500, Sasha Levin wrote:
> > Commit ff049836f05f ("lib/crc: Don't include <linux/types.h> in NEON in=
trinsics
> > code") in mainline switched the arrays passed to vld1q_u64() to uint64_=
t, since
> > u64 and the uint64_t that vld1q_u64() takes are different types on arm6=
4 once
> > <linux/types.h> is gone. The two arrays added by commit ef4102757fdd ("=
lib/crc:
> > Add 4-way folding in NEON crc64_nvme implementation") still use u64, so=
 the
> > combination fails to build with clang:
> >
> >   lib/crc/crc64-neon.c:66:40: error: incompatible pointer types assigni=
ng
> >   to 'const unsigned long *' from 'const u64 *' (aka 'const unsigned lo=
ng
> >   long *') [-Werror,-Wincompatible-pointer-types]
> >
> > Use uint64_t for them too. This builds with and without ff049836f05f.
> >
> > Fixes: ef4102757fdd ("lib/crc: Add 4-way folding in NEON crc64_nvme imp=
lementation")
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >
> > crc-next is based on v7.4-rc2 and ff049836f05f went into mainline after
> > rc3, so linux-next will hit this once it merges the two. all-next hit
> > it already.
> >
> > Tested on arm64: lib/crc/crc64-neon.o builds with clang and gcc on
> > crc-next, and with clang on crc-next merged with mainline 4843f6873f7c.
> > Without this patch the merged tree fails as above.
> >
> >  lib/crc/crc64-neon.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
> > index 03b46d0abcc41..f36389789fe65 100644
> > --- a/lib/crc/crc64-neon.c
> > +++ b/lib/crc/crc64-neon.c
> > @@ -11,11 +11,11 @@
> >  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
> >
> >  /* x^575 mod G, x^511 mod G */
> > -static const u64 fold_consts_4x_val[2] =3D { 0x0c32cdb31e18a84aULL,
> > -                                        0x62242240ace5045aULL };
> > +static const uint64_t fold_consts_4x_val[2] =3D { 0x0c32cdb31e18a84aUL=
L,
> > +                                             0x62242240ace5045aULL };
> >  /* x^319 mod G, x^255 mod G */
> > -static const u64 fold_consts_2x_val[2] =3D { 0xb0bc2e589204f500ULL,
> > -                                        0xe1e0bb9d45d7a44cULL };
> > +static const uint64_t fold_consts_2x_val[2] =3D { 0xb0bc2e589204f500UL=
L,
> > +                                             0xe1e0bb9d45d7a44cULL };
> >  /* x^191 mod G, x^127 mod G */
> >  static const u64 fold_consts_val[2] =3D { 0xeadc41fd2ba3d420ULL,
> >                                       0x21e9761e252621acULL };
>
> Thanks Sasha.
>
> I've dropped "lib/crc: Add 4-way folding in NEON crc64_nvme
> implementation" from crc-next temporarily.
>
> Shreesh, could you send a new patch that folds together that patch with
> the two fixups for it?  Then we'd get one clean patch.
>
>     lib/crc: Add 4-way folding in NEON crc64_nvme implementation
>     lib/crc: arm: Support partial blocks in NEON crc64_nvme
>     lib/crc: Use uint64_t for the new NEON crc64 fold constants
I've submitted v2 for "lib/crc: Add 4-way folding in NEON crc64_nvme
implementation" which essentially contains those three listed commits
(I also changed u8 to uint8_t used by vld1q_u8() in fold_partial_block
for consistency).
There are some checkpatch CHECK printed about usage of uint64_t and
uint8_t and to prefer the u64/u8 though, hopefully that can be tweaked
to allow for neon code?
I've rebased the patch on top of 7.4-rc4 latest master so hopefully it
should be sufficient here. Kindly review the v2 recently submitted and
let me know if any additional changes are necessary.

Thanks,
Shreesh
