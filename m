Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C0F18B0E
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 22:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA231C43395;
	Fri, 25 Aug 2023 22:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693004362;
	bh=7cns6S8+ADgngXm0a3i8nrTUZjXYM/26rR0aGDZTI4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/BvoR86Sura+HK4lwwY7s2fyOAVDO/s8yExViZbsl9LXfvCVsc0KWXE40nUa+lDd
	 Xgmm/CEruefdvVT3wP/dikRMMohBp065gJIraKAduxaIto3kVP9hqBQCT2UI5EquqX
	 QBIILvID+FEFcSl/bmSHLWXNEc72qjo8R9TUOGfv3B43uPH9bB9Z/GJmfSSqFpKTCZ
	 08tbdCZ9TS8M4MtYJ0VO4KT0I8PA8m0lJv8Wp1VoxYZw3z0QK1Ss3KUKWSIJ2BCElm
	 U5xZvlqZlmsbLlGldCcfcj6uwa/JnCU3ffxhjV3YQWZmqMdYKdXIymF9qgxYPMuBRr
	 uyAu3pMttl0lQ==
Date: Sat, 26 Aug 2023 00:59:18 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
Message-ID: <ZOkyRoKmRTMHLm7b@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
 <ZOkofUzv6t9lXyN+@shikoro>
 <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lct9vfZQb4MUpnCc"
Content-Disposition: inline
In-Reply-To: <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>


--Lct9vfZQb4MUpnCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> There was some discussion [1] wherein it was ultimately decided that
> this warning should probably be turned off (contrary to what the title
> of the GitHub issue says).

I totally agree with your last comment in [1]. So, I also vote for
disabling the warning. Thus, I will reject these patches, but still
thank you for looking into such issues and trying to solve them!

> [1]: https://github.com/ClangBuiltLinux/linux/issues/1910

--Lct9vfZQb4MUpnCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpMkIACgkQFA3kzBSg
Kba9gg/9GrJitxIM9E2rp5zbcPYpBOq2zX6PL5iO5PdIYoO3j9goeVD0n0hnWv9B
CR/dDuAAkaBahCoewCuKdwbZQhoYS3WOZVrCCuXHT5CPmg23ujoOb3F2ANGHhsVd
MvxaM6Eti6DOr1mRlqfaprpkNcPO0P0iDRSE2c0o0zi9L2VxrKamxTxRMyxMOF+H
8KrHsetOQl4uwdCUGaQ07YKbxWp6qte2SH3/Y6FhwFpdTuSKhyco4ve/V2FdtUVL
d3rPU/5V63xgILcniopUf9c4eFkGxptZ7jYhbqM/6QNXkf0fi3eh5Xd0kz3q2tv7
7/YMRWvE7gIEwKO8UYzZtpsHcmLTDjHHcNpoqHVjYC7w/ZFkxkXANaleReeqkC15
9Gsokez9QOWVwb1YjoeakNEDpvmiceYP1KM6yd+0mTyrGMDNBJLjxd2YD/PZtYgw
k7ymNz2J0VXAXFTYA1PzQPG8RAjBeYC8HHiPtsTFX+7/DGviY1qPyRbLozYlilNE
cyB98JpW0Sh82kBdbaK6yycWuU28xPHljRizFePv0tTtUKrK55Jeu0feIbwUVq1I
ykcBs958tLnlX2vjqLGwLK35lUNJsbWTI6PgCrQ7bSo0KLm7N0q1JZTcsLbGc5Hx
KDbAODfaypBHdyy/lS5TtsspmMVzqymlGuynUevwyZ1756S1ovI=
=rq/A
-----END PGP SIGNATURE-----

--Lct9vfZQb4MUpnCc--
