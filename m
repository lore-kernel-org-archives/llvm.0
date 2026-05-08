Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3003E3DB2
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778246566; cv=none; b=Irfkp5LYOIoLhjrhnLHsaQMoK4f/ix3pDiOKqqaOBAHrohZaGAWJi9IfDuY5LC0/QQBD1QKBbnBMUAnomy3QIrVCUjxGLxIBV+Q07Enh16b+awK73tUSTQ2haYGqAyN+uVGC0OL5zm5zsy2gLX8HdHCYyoA9hiR2JXEp3L2IXns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778246566; c=relaxed/simple;
	bh=fnk2WYtspGKK05+6RhoArWdO2sbLJKdVZlrbd2erSBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngBCTiodkZLRtQQcGnB4Ed/f3Dy8hbbnKEboEJ2ZArrDJYph5I33YzPdwPQhYspMRNRfJTGFxOykdisFzEKp++3KvcbukehJIL85POSzcufh6XBvU0IerTEmeXjOmgpKLDlIB9Ks9G6awvC2COGbEGdUEbjWYORNMKcv8SSfX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMHPyT5A; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMHPyT5A"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dea72099eso1946324e87.0
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778246563; x=1778851363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1gbUobD+K/QE4KT+ICDeIySBZSA03dYWML/JHPIkeU=;
        b=jMHPyT5AOkwSLU6RlcrOeSR2eYVlTwlGSPuT18keMkJX2ODYzPIxAr2VhQbjDyfpMG
         2d3S1lZeyLjXyJ9kpBgtfv/iprkONiwN+Ju8mKS+jRWw+Z+EvcMdK8By/w8WqzdJ6o9s
         xAxKZxIPeRG1Xp/nExyunBGeYHODmHCpQQJyOFFuhmB6BK3V7KuOqx/EKqrVWr/kCOsq
         p0dVgABWDHjuOI+WHWV6ZcK+2CBd8N8QdFoxhjqJmJsWmsVp+9fXsoGoz9BXILdKIK/x
         2mYT5SnC9AWXTXEWZS1VxcTs9rKVlOoRUlGNqDTstbDn4sbE2H6u3o1j5/GCH0amd9XK
         Oghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778246563; x=1778851363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1gbUobD+K/QE4KT+ICDeIySBZSA03dYWML/JHPIkeU=;
        b=K5yJrYpQxkRjxQL4oP6m+sghNIS9s9Qcth21JfWDXksTedkgv6YDDByiS6IlM15Pmp
         /vfWEFkp7i3m4da/Y6rET7GKj52No1NrTMDqX/63ECHstJCiLCIxJ8Xo9AnMYUA68qMN
         +bi79gZ+hElgO68MdABAwH3/yKQJZ/a3aadQAH4tBvRau9qYSuwaOo4jaN0QZkBXHw3U
         twGfNo8Ia5fhMhd/tLIg6zhWi5XrwY4a+NWfKgFkR26d8Rn3xQrQ03+TUic9tASlo3XK
         AmiIiJjepMwcUtx2otNt+ZzP6ZwQrXaKiyUdoY7JUVFX87aif7HU5/etIk3V7ZFwL2or
         zLQA==
X-Forwarded-Encrypted: i=1; AFNElJ/kP49TlP64e77yaLyhUd9cZEMclWclB5J/bXOXe2g3yZvguCep+Ac3elAZ9velN6KSxZhb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3tztVof/mDpJZRKmxvRjjfB8iFdZqaCIL63i6pyQP0SE2NQzM
	/Zj+4yTt+h9+9fTGO7GBAQr/iKJfxdc6dLzh7xKLxLFsS7jwvdS00jfa
X-Gm-Gg: Acq92OH8irhIVkct4JKsQ9ww6J+rLRuxWKiLfelg3SZs+EH0FJqhx8jcA06XWA6UAg9
	lAj3IUz3aAiwY3zAh1Uax8qtMiRaM6b2tZcvWySBKf85LzwmXVkYsX/KddM0CndVo37GGO70HuY
	W3FLJ+pqc/+Wk99J0gDF7MaOWaLeDLesX/mxvRUb7C12iGJMtErYeRiBqnMdXSDcl9sbPY87YJM
	R3pQGC2x9LBxBfaGXh8LdMl45THp/17pdfYold0MPlZFQ63q+CBQUSECIJVZfvdrP0t2hlNM9zH
	B0D24UP7yWeyioHnJOUaj9Y/NRpP7PauNIoQiKDuEX8r19a0U138PINy+wHG1woj2gksnuRhILf
	MYJBkxQ4qq/ZWFJ01I8XViwe00IUjcjziepv6kKrV6Wdmn0t2zkySSe+4EP07h206hMxd15X90N
	k0+Qwxnfn2mdTHjzbpjmPhlsUNC8OumEx6A3e29tPlnKhzkr5/0X/phkZpoxTbo10+a4AbZyovp
	nkPb9y+RCfW0Q==
X-Received: by 2002:a05:6512:3195:b0:5a2:c4f1:2635 with SMTP id 2adb3069b0e04-5a887cec51cmr5030150e87.41.1778246562820;
        Fri, 08 May 2026 06:22:42 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9565401sm503421e87.57.2026.05.08.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:22:41 -0700 (PDT)
Date: Fri, 8 May 2026 15:22:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
Message-ID: <af3jjg4z77TIpFeV@orome>
References: <20260507232131.438589-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6e4xp2knzxedgfuf"
Content-Disposition: inline
In-Reply-To: <20260507232131.438589-1-rosenp@gmail.com>


--6e4xp2knzxedgfuf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
MIME-Version: 1.0

On Thu, May 07, 2026 at 04:21:31PM -0700, Rosen Penev wrote:
> A MIPS allmodconfig build with LLVM fails during modpost:
>=20
>   ERROR: modpost: "__udivdi3"
>   [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
>=20
> tegra210_mixer_configure_gain() divides a 64-bit BIT_ULL() value by the
> fade duration. On 32-bit MIPS, clang emits a call to __udivdi3 for that
> plain C division, but that compiler helper is not exported to modules.
>=20
> Use div_u64() for the inverse duration calculation so the driver uses the
> kernel's 64-bit division helper instead of emitting a compiler runtime
> call.
>=20
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/tegra/tegra210_mixer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--6e4xp2knzxedgfuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn9454ACgkQ3SOs138+
s6G3sQ//eW7jTS8DwLqJPErEu/uNx+44KbrkCa6KCZ1CuzzSJGgTtCgkI/TqPto2
sBta/eSpFQWwWl8w6SDvdgtpZK4Dy+0cB9C9yfwLH0UcvcG//rA3znW8SmjclGMu
T3zD7HwyNtJfSMxbLBc1oEw6PkvNMuDVXD8L5X+PR0Yj9mUVNIEzyY2Tp0EDl8ra
u1nwej+8rDpXokACkmNLnnTOfRUQT/gbVwpIpl7+ekcf0GGdAJtfxCYA35BteE/F
fws6hCqz4i1Bjp6PWuHvhGuNqAP7yMlY+L7HOAOykKJAs7vOF6GTYyiJJKXQMQRh
u1o3BVQJsrrNY3gpXc5xcoXuDYmL35q+7spqMaYHlAvbzi1uDcmXS0ZOnM1NnQod
9S0DOZejxA2dIO94sSrelz49K0MkJpBxRWW+YAStC86OwfEjetcoitDbJzrCLIhB
uKGfKQe/8kfdY9An8BipfIt/B+jussJ1x73KsuTjACqiAWnC846iACtEUlyE8tu5
Jv5MJKGpE/sJS78MKigEGdg5Y4Dako0Dq1bkM/QV1v2JoCR5NUPASNBfz4cBXx0r
NQD3++YOCtD0onHPk8NNZ8/c3p7bDWBWB3VgUeVPUrngLDuuh74FrP0cfRDnWe3R
+WQF2Il5x9IjK0LbghmnCD7hx+uMvg7MCaWlL+Pricc1yTOqMLo=
=dCDE
-----END PGP SIGNATURE-----

--6e4xp2knzxedgfuf--
