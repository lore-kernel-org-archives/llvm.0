Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC64E1BA;
	Tue, 13 Feb 2024 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829026; cv=none; b=kqgjTZeKjFWBnygYJzS2oQcwv+wrrAKLCFthY86PSZyafB6ZHakm3DBpAeJTzNqq7foDrnbdnmr6CPrxfXGcsSngrXsHyhWJnZsCatmg/tjWgppIK3qPQ00WGlkWtC6gJsQGXKnE96/mLWB5ccj/A5IBS72oeeX56hEZYZsULNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829026; c=relaxed/simple;
	bh=ifF9jegQSzDgD37Coczzm0LfVpogCEbG4y2B5KG8P6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFqAuqfdmkyUl7oGQuA0+F+CwdEfCjmdXf5K5stxIWAmaMMBPsmxh27wpFiql8RbG9smOC8GEM+mUz8M3PjOumL7dA5n0qK/tGqu1HdRkQlcDuGWcO2pZCtlCkEdhz17ePy+oEm434b4YiP5bDFH72X4IRz1doOViwoVyymUfdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id E66321C007F; Tue, 13 Feb 2024 13:56:55 +0100 (CET)
Date: Tue, 13 Feb 2024 13:56:55 +0100
From: Pavel Machek <pavel@denx.de>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: cip-dev@lists.cip-project.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>, Biju Das <biju.das.jz@bp.renesas.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10.y-cip] cache: Kconfig: Add dependency for RISCV on
 AX45MP_L2_CACHE config
Message-ID: <ZctnF4UpCWGKZfEy@duo.ucw.cz>
References: <20240212121914.38493-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IGZsf/21MtZ6NQAp"
Content-Disposition: inline
In-Reply-To: <20240212121914.38493-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--IGZsf/21MtZ6NQAp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> csr_write() is available only for RISC-V which caused build issues with
> randconfig for ax45mp_cache.c. To avoid this issue add a RISCV dependency
> on AX45MP_L2_CACHE config.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402101256.mOmaXuSb-lkp@i=
ntel.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thank you, applied.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--IGZsf/21MtZ6NQAp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZctnFwAKCRAw5/Bqldv6
8vTJAJ0fNIPtlbMO6uqPnpc3HtHNcjsDIACaAyzduJqKkD3H50XKEynXC7NovFg=
=YroA
-----END PGP SIGNATURE-----

--IGZsf/21MtZ6NQAp--
