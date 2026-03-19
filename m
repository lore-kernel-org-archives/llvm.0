Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB3358386
	for <llvm@lists.linux.dev>; Thu, 19 Mar 2026 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950914; cv=none; b=tnWYEWBK5LRHJ9fx6Y63NBKGFY0s97P1Bs3d9KrkAK9+4Lb24uXyYeBoilCcr8JmVfra1uEYWzRlCUkpbMR/h8UJhTvcpo+YqemvjI+hsSTzlGMZl2frs9lxVj4Q7KCXhZ/RwiO2kLlg18Zu54QnWXCg2Zv3veLlI4ba3+VKoX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950914; c=relaxed/simple;
	bh=0HYoiBf4UwYb5v2F+P/TMj6GeYjUxJ9OrBOsmkAK+k8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zh4g/dbiq1JbouN3a7ii7Pye+Zjf4J0Bh2BglO7VQAD5uOHjQDjihsEaKD1OuFHUjiEyNJBooyMAVunxmShHJfiyfN+BCBJZ3z9OhdZhDHgSGWikwHRtyOET7Ml2Y0xZP6OP22V4NI8tD1lFv2W095jdOLgNT2LhXQiXtmYzGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=U3a2jAlc; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="U3a2jAlc"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-89a05955720so11712786d6.2
        for <llvm@lists.linux.dev>; Thu, 19 Mar 2026 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773950912; x=1774555712; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ByHAIq8SKqFDrHlL2iXnLmh/0Lqol60jmXl6QH+csvw=;
        b=U3a2jAlcHxWOXQkWg6mL8GTt4k7Vw2niAxbJ2NcdUOMt7kTJb7PtlpAnjpV0EDiegf
         X/7Zhvs9rRKPpPMS3r93Et5V8bS92q6xT6WxuHi0vN3I/OrmZHAM5/2y2IicDJ2VweoF
         XKvKCYMHROm66TLVj/kqMvRYvIL1ohphuXdG8C/f64gc1V9HrHg6mhEF1kaX5iBMjKAZ
         kL9P70gtsnFrk9dqnyfdflzdRVRM9IIzRDHXy3MH/7e9Jewm7gJBDxnRa6NenEATZV0B
         82F1KaVh6Pw/IzCOJuhuNF66jUYAvyhka06wCYhtH2OV6Eu0UdoA6Kc6/Z3yvsO5vM5W
         GHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950912; x=1774555712;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByHAIq8SKqFDrHlL2iXnLmh/0Lqol60jmXl6QH+csvw=;
        b=JocHzmVrNMWXeOcP05gW9vDF5D4ZF4WW7FyhB7z28bkwEhowYhRt88y90epSXr1Avz
         D26UufpPRjnw9SUPnyLGZg9pu9e0kWBf+lyBIu0roq+U5hfoHaBKsAeBkozEU85UXPyP
         gcNswNiVuiP1+2TBrPxa8SNbzLLaToguXA5c9uSTvtpCnFa3+zu4OxIDWMoZI70dfniC
         p8iS4sQqhc9edOZrzRi06rXvlvrpB3aTpVP+Q8UoqFrScbviSLCSGxR1mHfoAOW8PAfn
         yyu741vopG4SdhiyM3KfoqQgDekduZ+Xm0H6fHiLXEDsK7aTKHAvGXqxT5lTph7WZbf0
         ZX4w==
X-Forwarded-Encrypted: i=1; AJvYcCVa6QEtwWfWY3uDpT/s5G4kGwMH8Q3ZeEHft5mOSvI6AUeqCbOm0usuCPyU6dRDFJ55CKDi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6lLN3k8HsNdDkmfDGbxf8qFEgWxwH7cte9cvvJSbiN8B8d30f
	U1LPESotFJoYn6a9dx0hYLVBYRL98a7eaxvSG/Gj4x0v+h0bMI5pq5/s54yzUykvIIc=
X-Gm-Gg: ATEYQzwOozcihBxmIqbAXq0NcFiUpxrCTyeM90bpo6vQWfLpFNe8Mj20/IG4u9IN70z
	I/WZoZYvyrjKQDNDlF/wNGSs2uZbU0mv0LbYnhlOBUX03Al2MxscjdWM6fRy7wfauQHuIMTs1h7
	aB8J2R+4qMr8vLfBrIo9Hvt85sCzFJlGvyocvd61sv7ZpE/LLFrBPI0Q4vajyZepT0S4NXjoJ27
	Hovjm2sc6cMPXoMA/87KE6/8pZN2q6QoOm6FwZlh3CBfFOK8GDcml+GxK/SDUfCfcci8J1klT8k
	rHnknTJEe+tXfJ297rDaREpdr5B+lx4wPaYfmpozQrcQjZIxJCg9c8d/tlo62aX17xefdjUBsBp
	hSJZrZ0Se8fZCXp3NBC31JZ1/OJvlBB7owlv8m2tKzMnYrXk1E+wPWfW9kQ2sDTq7+IKGapH/8H
	kXzUuBFukqhXsJ95s017x71eeLneWE
X-Received: by 2002:ad4:5749:0:b0:89c:4c6b:4615 with SMTP id 6a1803df08f44-89c859b56b1mr7040446d6.8.1773950911430;
        Thu, 19 Mar 2026 13:08:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85334b61sm4468026d6.26.2026.03.19.13.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:08:30 -0700 (PDT)
Message-ID: <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when
 compile testing for Hexagon
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Chancellor <nathan@kernel.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Brian Cain <bcain@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	llvm@lists.linux.dev
Date: Thu, 19 Mar 2026 16:08:29 -0400
In-Reply-To: <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
References: 
	<20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
	 <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-aLX8AP+3kvv0mY+uT9HF"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-aLX8AP+3kvv0mY+uT9HF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 16 f=C3=A9vrier 2026 =C3=A0 11:17 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> Hi Nathan,
>=20
> Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 15:10 -0500, Nathan Chancellor a =
=C3=A9crit=C2=A0:
> > Building rkvdec-vdpu383-h264.c can take a few hours to finish building
> > with Clang 20.1.0 or newer when compile testing for Hexagon. While this
> > is further investigated and understood on the LLVM side [1], disable
> > CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.
> >=20
> > Link: https://github.com/llvm/llvm-project/issues/178535=C2=A0[1]
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > =C2=A0drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > index 5f3bdd848a2c..d03689464206 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> > +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> > @@ -1,7 +1,8 @@
> > =C2=A0# SPDX-License-Identifier: GPL-2.0
> > =C2=A0config VIDEO_ROCKCHIP_VDEC
> > =C2=A0	tristate "Rockchip Video Decoder driver"
> > -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> > +	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
> > +	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)
>=20
> This is clearly not a pleasing change to make. As this specific data stru=
cture
> and usage of bitfield has been discussed (along with the numerous issues =
in
> clang/llvm around these). We also agreed to move away from bitfield for t=
his
> data structure and use a bitwriter. I would favour delaying this change t=
o
> give
> devs the time to port instead. Ping again if nothing moves within few wee=
ks.
>=20
> best regards,
> Nicolas

I haven't heard back about the port to plain bitwriter. I guess I have to p=
ick
this patch, but I really don't want to have to maintain too many of these h=
acks.
Anyone else with an opinion on the topic ? Or a better idea how this can be
workaround differently ?

Nicolas

>=20
> > =C2=A0	depends on VIDEO_DEV
> > =C2=A0	select MEDIA_CONTROLLER
> > =C2=A0	select VIDEOBUF2_DMA_CONTIG
> >=20
> > ---
> > base-commit: c824345288d11e269ce41b36c105715bc2286050
> > change-id: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5
> >=20
> > Best regards,
> > --=C2=A0=20
> > Nathan Chancellor <nathan@kernel.org>
> >=20

--=-aLX8AP+3kvv0mY+uT9HF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxXvQAKCRDZQZRRKWBy
9LPWAQDjmQG+J8NCldLkt5e0YHN+eY/oOMY+4gtMMaOv1QmtXgEA2xvzyNJj6OQ1
hF9ceJ9F7RRvzrexm9h/QWzmjT6UUwM=
=rPsi
-----END PGP SIGNATURE-----

--=-aLX8AP+3kvv0mY+uT9HF--
