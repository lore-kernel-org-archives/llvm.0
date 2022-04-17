Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1222594
	for <llvm@lists.linux.dev>; Sun, 17 Apr 2022 19:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6BDC385A4;
	Sun, 17 Apr 2022 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650224270;
	bh=d493NgaHWpGeOOrg1HPPk4wwspwcEi67zAXBZYQCvzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCBcl470QWmMIDQHkr8+YOi7Ny1iJQZe7021EemkvZYgWh6+en6SI4n5RKKFvloPR
	 pBcYJPi3C4V/3F7Yg3nesfuHqM+6CrHh8t6gIA841Y5WsvHeYe3pNEvNADRC49MYOh
	 uBvB12JBaXrg3uqbvbsu/hzZXOgjY6FT4vinPepQJlX0ye2l7or+gIRaGKUMRmXoUr
	 3sG9bFqV5hiGifWafuSaRi7ktENvLgNcviy4BYkOvnhY+F+Vq+Oqk/0RWP+qscfBxl
	 uX8c9d3/kn2X3VtpHAI/6B8eQhlh033qqD5dweXp3Upd3sKBMfTlmSBmh9zMSRu+Mk
	 lMxGmV2r9Lr0w==
Date: Sun, 17 Apr 2022 20:37:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: nathan@kernel.org, ndesaulniers@google.com,
	paul.kocialkowski@bootlin.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] spi: initialize status to success
Message-ID: <YlxsiQL4ZnGTGQfF@sirena.org.uk>
References: <20220416205132.295779-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wOgWwyIImvA/vFHa"
Content-Disposition: inline
In-Reply-To: <20220416205132.295779-1-trix@redhat.com>
X-Cookie: Stay on the trail.


--wOgWwyIImvA/vFHa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 16, 2022 at 04:51:32PM -0400, Tom Rix wrote:
> Clang static analysis reports this issue
> spi.c:3583:2: warning: 2nd function call argument

The same patch was sent and applied several days ago? =20
73f93db5c49b9f52c902e5dc6c750bf9832e0450

--wOgWwyIImvA/vFHa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJcbIkACgkQJNaLcl1U
h9DA/Af/exlZOq0myZjy4rldyHuk0wIzcRzo2U/s2eFa+LEi8F6SFTVTFS3AJ9NV
Z2x7iFQqO8eD2eroIQc0oDJmRhNwcdLgG/f+pDf3BQ0kEcyUXr3j8/81N3g8xSck
nUB4yC1xLnpssHK5lWpCIW+Thp9nbQ2dr7/gbvNUSaQVeAzdFh9huUWvUWhkJbXl
XBoKLIS2nK0N30tIBTvb2BOerFWHDxOl+ie6TiE4FAT8jGQdVDqwcSpw5dvP16x4
1ufAr/F+6g6rHcDMJz21axLrOyHmdPW/vsVZhYxyR5ibHuPrsUNmuyk3ibyYzkaO
XIu9ZxYDh+GjVimtSaVIuiXTxHxDZA==
=5fpU
-----END PGP SIGNATURE-----

--wOgWwyIImvA/vFHa--
