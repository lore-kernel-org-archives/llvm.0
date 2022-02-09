Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D972F23
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 16:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A36AC340E7;
	Wed,  9 Feb 2022 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644424438;
	bh=A3C28su2GZHYfO1uG6hQ8cQQJH4qr+JQ5ZUOFe6PLu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO/PkyjuoxW60tdmyRombK4TTlrUuwvcr0PZyxlW5yZxml0l4FIAUGSLU3JvJfQqQ
	 NGagnR3Gypm6RSWnahBf2FHq/JfYyr6oECie4w+YkQgZdTBdMDcPVRka8MiwQ24HRH
	 +ay4J2oUQU6ZduMuTebvtWKsz0DeElrGQR3cJpYmQJ6GT9Xl1CNT5HRxf+c3FRiO+2
	 dsrlfDKGZKQD2MnN0NrAleMzEBF4/trXnofZnXWvbu7mZ3pKbW/aCbASyjrGZTVZ/N
	 N7tepjI22myMHRkd3/HPGeuYAy16ijvNQ09MK2baYvZiscmlQFDkI4iXO7Zt31+Kx9
	 1Hf6rHBu4QCrg==
Date: Wed, 9 Feb 2022 16:33:53 +0000
From: Mark Brown <broonie@kernel.org>
To: trix@redhat.com
Cc: lhjeff911@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] spi: initialize ret variable
Message-ID: <YgPs8U85ZFbDWYlx@sirena.org.uk>
References: <20220209163029.2299009-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mu0AE5F/1tDJX1na"
Content-Disposition: inline
In-Reply-To: <20220209163029.2299009-1-trix@redhat.com>
X-Cookie: Disc space -- the final frontier!


--Mu0AE5F/1tDJX1na
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 08:30:29AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> Clang build fails with
> spi-sunplus-sp7021.c:405:2: error: variable 'ret' is used
>   uninitialized whenever switch default is taken
>         default:
>         ^~~~~~~
>=20
> Restore initializing ret.

Are you sure this is a good fix and that the compiler hasn't instead
identifed that we should be returning an error in the default case?

--Mu0AE5F/1tDJX1na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmID7PEACgkQJNaLcl1U
h9DXDQf/d8oWsM8LqjI3JFg83YZWTgTnqvzABNlCFu6Pqc7x8gKpeLY76jEejVK3
MwBzj34sZgjQNpo4Ah8Lze+CGJi3dK1Ic1nGK8woFMJJ7FX/vKWcMWQB49GQT4uv
nt0HvfituvT8Rzic252jaGaQnMslhLH04vrFmjxgCMaQof/SKOYgLUECzdLP6x8x
OSFGpC32VeuZaVwaJbmXIrsoNyZ9rp+AWjA1Xzcz321TwsB6Sja16pd+VcYTWA5i
3Pv6T0mPVd345pG4blfqWUo2eaQPyem5ZtxrcGBq07BNGWnaxNOG0F0MDBA/Xe9E
FdHPeuZBSNxjXY9liEcXkZTmrDRSoA==
=pALL
-----END PGP SIGNATURE-----

--Mu0AE5F/1tDJX1na--
