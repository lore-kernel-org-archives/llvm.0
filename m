Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632459;
	b=Limmv3/2VgtTuTIaB5m9cpdqFfLkxNjW/TLuMaryjSgtt5bSYzIpIOJTVJlpJ1MkTfDa
	 gUWatJzvGstM1G0nDt/5sidRMOZfevBMpav4QWkrwmzEoJVRoMc8Q9vFKy8jz2k27PD62
	 T8Hsiaek9wQvOXWfeqmDpjfjgecKtpPNDriWA0yaD20pLEe4sPi4SH71DHSlm0x7mbrqG
	 WmU7dkiChuRbWpghvMCCIr0XbBa08NJPNQR0hZ1GUsiCKmYN2a1vU1wg23IQWdvcK5wD7
	 8N0HTwpAnLUmjf3tKqkM7oQxeuY7y6uBjdHsMPDamvkIJEqK68lx9sUsppnrnZ0xAzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
	b=YCmdKpxUFl/t7w6ewPYSbyI3dLhZAPuxa9OHIgd/rmVW6GmIWQrwrSzPgwkLvtyuV39B
	 zTpC/KlrLHqIHirA3h4qMSZJ766AkRVyl/Sn2IWegbBwVQpB+OUH8osbtYeoRAkgfnA+q
	 ETLkxmi0LulAvO88L96H3Am40pBtIl6N5v5kHPo+q1XYEX1MFkXczao+DRTjhwbPjYELU
	 6gVwBgsf28mdIaii7fc6C4F1qI0NImml19Gp1yPcIE59rtWV/QqznIZ0yGUsVVD2KhJ02
	 ee949RLhX2A2rCZojoP9Br5kHDXv3MgddKGgedx881mYWSj38tA0ZitUly+NS4x+mAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oecKHz71;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A95607992B
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 15:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A95607992B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oecKHz71
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so3873432c88.1
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 07:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632458; cv=none;
        d=google.com; s=arc-20260327;
        b=CZl0Kf7/DzENvi6cbWK2kJf84F15QT1OXEhW7qcJ/NwZ1ebx3ASYhWd/5NEbKEKiEz
         OUxQv+AKsw9pxQ8N03ngatIKdksqvaCRZDG9srQGrhoMi2AvBTbFgbC1ly4tqqA64I3W
         9wllZ/4mDaeroTZc4vleuOeTK/Vj+lNd+h+pFdZ5AApwmTQEVvlhdV8qRsHyP9y+5k5s
         Fvx+XDT4NAbCVsJXjTg302vfmkRyffKBL1T6cwLd3Sf7xRk1bLHLdih13g7o7myg3k94
         UqssxIF3WsP/jcq5l4J+DmNfQHnd7m8yDdFi4d1260hX0DWBfLcSJRJZLUGvMOE7DXkF
         Df/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        fh=065/qlDhIgHS75Nn6fZ80GWyzuvDw54XH3XHBPO7OEA=;
        b=HJkn9FHp2wujB9Z97PpGAtA2L9qx51XrxLWHRWzmHHqIFNffZAp7u7f2Z4/wEKgEMy
         5NZJeXKN7YZAg5LhqgeTRPVrbdFXLdHnrBDkXX5KfJiEYnxN00OK593pUXwlFZyiA0jb
         eNMtOyFXwxpEz6Kbj2qx73boXg5gfCTYdAK6ITFQ4mTiLYNr/Y258S6aAzsQSYVfEwwZ
         s4/gtthqC4MhcS7+7kGhTopHtuvX2AV0Kr4moaZrF7n26VvzvuR4NVx4BMs5vXDOQk7j
         FcIZTt44fkXy92w5eqOCvra8hNxqXWAXE+4XF8+WQJtbYZgJsLvBc0CH59w0B7tmYjZz
         TL/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632458; x=1794237258; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        b=oecKHz71tNH1OWFWOAWROeHTkORDUVP8FFHBXVi54b0VK531OdrGSh+KdXhFTxZNs8
         /dB/dbCXxPrZReWhbZACMK6B8upV9Uqjrlal4BRtNWl4gmiN0tDO9PgxqOzynPhZQIUw
         E+tbF4qT9qYzoXShaCmhjRsin2tClZ+CuYEnYnhzyMn+ceiQpcqwnl6So1FNKBvtk/Q6
         RVuogPGEQr4Sq+LKCfyvLyFp91bw1pbCHwm+ww60HKLky8aw54pjHCijCWBVV+LCbnMf
         qWxQrGAuj+G/Zj/Q+aHe7fhVxhFe/RcZTtRQjQB6EmnkT4KmdD7lcVSRdHNqvuz6o32z
         /nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632458; x=1794237258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yUDlmlI3+iGrY/dSFtrVmA03ksQdMmCOwxVGGqFig8=;
        b=iIYh2XW2I/mxTgOaGeCuXXfYH9I3pa32WgWu0Ar9QyBuRErfSLYK8dgjMslLkcNRtp
         z/sj5ypXGBZHoZ62iJujtaUVFLPWDUgDzzO1N4Guw2NbGeOLJFV25Kn7GxfVeDt9JqT2
         5BohuHe1Rc8uojkTXmsMpW1xe2GrvSi8n+nlSKx3Ws8ziyGeSv8VKtx0IPiABdX74XU7
         RZvg+flGyJb6PWYSM8b5ZH7lrbRyC9IKIFrUpDLtnlWYZl7DoXfVgk38uJkFYIV3CCBZ
         3dy2ZpGNkzmvR5HwpNi8E/Q9nG62w0X6S9PvWtWnWc5xhQgT6cdPirisKNHfaoSGi05m
         d41w==
X-Forwarded-Encrypted: i=1; AKwUvBydrcQp78upyMeSJdOxdV6sfbNBpEcLgqaK8zhD//DOasThvvqYsA8I4U6hv9ALJGsw+aiZ@lists.linux.dev
X-Gm-Message-State: AFq9FYL2mhnhDe2ZhO3bszFY5xZVmuABCZvGXIKgYxaU3AMMSPBCEIgL
	xaMVNWAxgd0UMYlJHYCERXyr0orUrWQelQuklxd8exDisSNsKE03l2eZY2Rbg/D7WzBiR8oRBkq
	cW/BBL+CmmaF4nJvLZ+//348AvN7HjTU=
X-Gm-Gg: AYBFou1EbLOdTmORagQL5HSmqleTLQhSTEklg2c1QMil58Ajwkt3h4dozfZhNExm7Uk
	tT29Uvp2c4gsEGeXMhyghaurFGRMablBRimoakkjzHVnouZGsR+JlSXNdyRgOMm8rNhae58Clej
	p2IZaemSNk8si5wxIcTQMgi0xj0Z+//Fbjo0gGlnGDfWP3zSby/KZHSCFRUoERuwSUhdgG7Z8Q/
	3XHbALpezx6ZPz7yi2ZF1xnQIkgmz1dvsnrzJpZNlEGUdR++64f/VVn3da0cMnqEhrIRKHC0O42
	OiIWPqfQIi2FWfl0EuZY2/kcjc7ePiVsS7optzfbGg2nRCAbBWpb62hy/auGmz9O3b8H8rG3Tcr
	3HtrtL4SAorZR4qXQw8UsBgxcgzuEy2Teu8m96GoNZsfd+01JCGhvwDcZpkFmNGbj3CawGTaJlS
	wtY3+fTFelI67Z
X-Received: by 2002:a05:7022:88:b0:144:fb31:a597 with SMTP id
 a92af1059eb24-1ac6069cebdmr14582009c88.47.1793632457694; Mon, 02 Nov 2026
 07:14:17 -0800 (PST)
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
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com> <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
In-Reply-To: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Mon, 2 Nov 2026 16:14:06 +0100
X-Gm-Features: AclHuK9s_qVGMHFu-dL36Q48-lWDPnNvO_Yb6GHSTKkiWePXFsWruUJSaC8neac
Message-ID: <CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: saeed bishara <saeed.bishara.os@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.
Depends. I think __builtin_addcll() is needed to get roughly the same
performance as the asm version. In my tests GCC on arm64 turns it
into adds + cset instead of adcs like on x86.
But I will look at it, thanks!

=D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:44=
 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
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
> >
> The scalar path seems like generic C code and not restricted to arm64,
> curious how that performs against existing (e.g. x86) assembly
> optimized implementation.
> saeed
