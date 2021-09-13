Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF6E3FD6
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:49:51 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id EA6771C0BA5; Mon, 13 Sep 2021 11:49:48 +0200 (CEST)
Date: Mon, 13 Sep 2021 11:49:48 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] raise minimum GCC version to 5.1
Message-ID: <20210913094947.GB12225@amd>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
User-Agent: Mutt/1.5.23 (2014-03-12)


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> commit fad7cd3310db ("nbd: add the check to prevent overflow in
> __nbd_ioctl()")
>=20
> raised an issue from the fallback helpers added in
>=20
> commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and ad=
d fallback code")
>=20
> Specifically, the helpers for checking whether the results of a
> multiplication overflowed (__unsigned_mul_overflow,
> __signed_add_overflow) use the division operator when
> !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW. This is problematic for 64b
> operands on 32b hosts.

Please don't. gcc 4.9.2 is still in use here.

Plus, someone will want to prevent overflow in -stable, too, and you
can't really raise gcc version there.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmE/HrsACgkQMOfwapXb+vIE3gCgw0HkhidmfYw6S+rmXZktbNr8
/oYAoMTOKfFL+ay0TnpmYFWqDgrZVoBY
=ZOqT
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
