Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3A3182A1;
	Tue, 13 Feb 2024 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707813174; cv=none; b=I8+w9TMcdGhG3f7yiNILXTfF0kdaTF5eVcp5NENvV78H/0Ab9gCt0kvWMVt/fuk4Q8+z27kYvHHBg3DlFQ1d5w6XxKy8PCYjEZa8OnJa9HhyRJp39h3WA+oPZQqzG0OoyKaVk0tiISV82nwKqrkUa7TbbgnZqTHImnvSpznEf/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707813174; c=relaxed/simple;
	bh=vOIDoSydCH//8pVOasWDQUh0fzIXQwR4wuHoEzBECMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaAEoyTTwe13uRp8rOWgs15uhR3I04XJDcaLFOB+ia48uFjtjVxv02+M9mVv81xB3+xVnC2oHTqid0h+IBLX/tX2UbqvaZsGZeReEhkImzJyPkGUFHeTW1z4YnVhxetgOh9ahEUspZFsKrM+jjQXticAsItUIL3/wzO3Gwgu8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 69C761C007F; Tue, 13 Feb 2024 09:32:49 +0100 (CET)
Date: Tue, 13 Feb 2024 09:32:49 +0100
From: Pavel Machek <pavel@denx.de>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: cip-dev@lists.cip-project.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>, Biju Das <biju.das.jz@bp.renesas.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10.y-cip] cache: Kconfig: Add dependency for RISCV on
 AX45MP_L2_CACHE config
Message-ID: <ZcspMaCweLlpXES0@duo.ucw.cz>
References: <20240212121914.38493-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F1Ah9b1UnUoleVi5"
Content-Disposition: inline
In-Reply-To: <20240212121914.38493-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--F1Ah9b1UnUoleVi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> csr_write() is available only for RISC-V which caused build issues with
> randconfig for ax45mp_cache.c. To avoid this issue add a RISCV dependency
> on AX45MP_L2_CACHE config.

Looks good to me, thanks. I will apply it soon if it passes testing
and if there are no other comments.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--F1Ah9b1UnUoleVi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZcspMQAKCRAw5/Bqldv6
8gXoAJ4wb2wwmFE8HTZ+YIwVQUfg5/EtNQCghQ6ZQuBDjiJMWKi7367p9gOIDHk=
=t0Mt
-----END PGP SIGNATURE-----

--F1Ah9b1UnUoleVi5--
