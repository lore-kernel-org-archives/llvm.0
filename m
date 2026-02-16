Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7B1F17E8
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258657; cv=none; b=EfEFe3buaAdu8gBK8CaU0qAWL4AOEvF/psGfZgsLpoZ9Wr3m/xXHw4H7UiCZxFoq0W4gaQ+tp2zSSM93tPXfPtIy/2AnB1T9YlTMR9c9670aI4171spI3xFrhYUsP1cl6Wb6EKuN9qCUkOIQfEF133BnRru9UzGFehZyeBeqjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258657; c=relaxed/simple;
	bh=PSTw93rEWxwyptbbknvkyoCYal5ZyikU+NB5M8sxwoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jjvh9x/J5thP20Zc0kjJFy8oqQT699Rufxz4NGEgD71OwNdakgxN5SxQo9EyNFSNUfVt1vjnsaZpAOlC/83aL3qeKb48BGlFzqImGnnqogBAm1m/5HWzh/6TVe5F6XMkdg/gf8i52XIQYYX9I+JPxDzFdnUo4KcOEdn3X4H+id4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=DDe0Jtjo; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="DDe0Jtjo"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb39f64348so286889285a.0
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1771258654; x=1771863454; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yx5A2gw99GEH72oJ5J3K3NBwM48Lr9vgSpEF2S1mSc0=;
        b=DDe0Jtjoxcacl8KGAvqJsvt59aDIVFw0f3jIvgeqVutwo4z2yYsaMcuAkJ6B+kuxSa
         44RIzVZyb+0jtbaQNwJjl+TfEoYWgXTrfs0WadBEZKsp0PGvhcBiqy5ls4cdFv/jXBgQ
         KHkLM0yoA8tdizKA7lrs5uVrvJZdP/FPfNKcoAmWzC/cLV1C66beZPhfmHcQUI4TGXBe
         cs/aBPIMe7lXJ4JYifuL/NhCIQTnVoxfkZlNn48X35c6ieJU38BojfviVVf6gMXtm15A
         ot1RyfY3mQwnL3tqSPTbvdC89xEApD8poGSTDDbma/pBffmccdF0E9H7/vuYC3J/MkWx
         dKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258654; x=1771863454;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yx5A2gw99GEH72oJ5J3K3NBwM48Lr9vgSpEF2S1mSc0=;
        b=agcNLDmfOTs8r3eUvONk6afOi8E7gqlRDweKJgvmfv0njT9x4b+mb4w1sgBoZXaH7U
         u3k52ivfZu8MeAGobswyIRRPmf4VYIx+9IMeL1c+h6F4QniVmrSPnRCVvh1rlzLeU8FA
         dNxsnpc/590tyzeqIJeZryaoR9+TizHPev3TFgGGlaxx7xRsHLsmuHTMigE/JcNGVT82
         DbQ+QBJpXZHax1na1YLLglN3an38ZvXubCNV0/+J+hCx3Myv57O5hrc4IMxdOD1W6enR
         MLMI6tNRPNHnqw58KCk3vhHKjnd/5KqZbXqa7e2szimDGv9HwM6iSDZg1Q2apxfmdRcJ
         5hMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5cZk9AL8nG3z2Cqu1A9WUWdKyDsiABnCEjjT44fSzx1ibDhllNdM1mm/8/r7T0iPIJmaf@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx7yG5r0Kd4C39DVhbunZRjqtr1Atu7HDOSW8HC6J1i78TP0wg
	voEa64gV6ku0Cdm/SFzEDy8gnYBzHKN9qbR1gPpxHYyiiQbJDgP10mA1TREYIkbPLig=
X-Gm-Gg: AZuq6aJEXJNd4r/rOipXayWI2FCaa3bqv1HI5IMQWuu0R6Mw5az4sYUKxKbYuxSzRpg
	RO+k7PUVZ7NlwhRTcrevT5b7f3enTJZJnWdEEBYQpxQwQpf/3c2avClolni+7/ZewHlM0RZxkCM
	O/Z0enEaTwtb9M6LeRARSYPozP50MG2lVVxPmjAfa6LgvV5PHhNaqHcucyWe4pvkaYuQw/NeoUa
	WskwWV5GRWBnWp2kBCEOTLbY3TZoIB5ZE8kYGDyHaBiDy4sl59hPN7IdV1NcY3Tf8gRO45sSjE5
	jsErQP2VcAvwbuKItOw9eWUF1C4iyfxNtgewKH7RKMaQt5oYe8z6tHs3rNOfnB+xmBd1YmRm3wh
	xpUZ9Ljxs00GqoxDn5qDFhp6l/bYlWw1dy89d/dr5V64SXEAfD8BK0I8vdJGTp/z6eehMZbV4if
	/kkFaUzrp8/JrMTbmZEG26nghlBVpQ
X-Received: by 2002:a05:620a:40c9:b0:8ca:105b:86b6 with SMTP id af79cd13be357-8cb409219e2mr1421526385a.88.1771258653567;
        Mon, 16 Feb 2026 08:17:33 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb4120f939sm883143485a.44.2026.02.16.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:17:32 -0800 (PST)
Message-ID: <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
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
Date: Mon, 16 Feb 2026 11:17:30 -0500
In-Reply-To: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
References: 
	<20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-g0IOH3/wXifty34RwVB5"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-g0IOH3/wXifty34RwVB5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Le vendredi 13 f=C3=A9vrier 2026 =C3=A0 15:10 -0500, Nathan Chancellor a =
=C3=A9crit=C2=A0:
> Building rkvdec-vdpu383-h264.c can take a few hours to finish building
> with Clang 20.1.0 or newer when compile testing for Hexagon. While this
> is further investigated and understood on the LLVM side [1], disable
> CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.
>=20
> Link: https://github.com/llvm/llvm-project/issues/178535=C2=A0[1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/med=
ia/platform/rockchip/rkvdec/Kconfig
> index 5f3bdd848a2c..d03689464206 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
> +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
> @@ -1,7 +1,8 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0config VIDEO_ROCKCHIP_VDEC
> =C2=A0	tristate "Rockchip Video Decoder driver"
> -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
> +	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)

This is clearly not a pleasing change to make. As this specific data struct=
ure
and usage of bitfield has been discussed (along with the numerous issues in
clang/llvm around these). We also agreed to move away from bitfield for thi=
s
data structure and use a bitwriter. I would favour delaying this change to =
give
devs the time to port instead. Ping again if nothing moves within few weeks=
.

best regards,
Nicolas

> =C2=A0	depends on VIDEO_DEV
> =C2=A0	select MEDIA_CONTROLLER
> =C2=A0	select VIDEOBUF2_DMA_CONTIG
>=20
> ---
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> change-id: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5
>=20
> Best regards,
> --=C2=A0=20
> Nathan Chancellor <nathan@kernel.org>
>=20

--=-g0IOH3/wXifty34RwVB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZNDGwAKCRDZQZRRKWBy
9PhBAPwMxt2qHIuuv8Re3nGYyjxclF1akWrq8joXpNiryhAGZQD8DZ31iVeXv3Jn
qIdzhD88lbsc2tAt4dDx0Aynb0/hEQw=
=AYDo
-----END PGP SIGNATURE-----

--=-g0IOH3/wXifty34RwVB5--
