Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4289C291A
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641F5C433C1;
	Tue, 23 Aug 2022 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661270644;
	bh=fYdMfktNKHFq24X7NJ8h8EJKjeWjNqBelu68P9jBtBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAW4lBiCfcbfYLEylH3hcpXAnmDCtoBdyBanrOxql8kD4MtOvJ1E1HFFsyQbkrw8m
	 vZwB+UMExBUJ6L9YKSaiIZTNl13g2LQS13aNsBVKw22iHh9tFpgsLwhGZ3vdH39ekm
	 svEvl/cH0iZV/Qni1KD765BMuDN4qdXCzFG2+9ou8s6o7Ap6vCKhcwy0d4LsB0u8yU
	 DEEOoUSULNex09GO3DoskZaoGwpPPyK4fL0KqLKqTRQUIDcYL2SZVdUEjx64y89QSW
	 v5GXwt1lj0qduhAy43VsgvuRxvkuQyZUz4Mnx4nHZoBYYjp+6nJr/qahmgrNINyInX
	 jfm4j/9pkNAoQ==
Date: Tue, 23 Aug 2022 17:03:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>, llvm@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Message-ID: <YwT6bmqeBeoYcRi7@sirena.org.uk>
References: <20220810010809.2024482-1-nathan@kernel.org>
 <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
 <YwT0oUjo/lzBDRdH@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bRD/piUAUlQcMCKB"
Content-Disposition: inline
In-Reply-To: <YwT0oUjo/lzBDRdH@dev-arch.thelio-3990X>
X-Cookie: You can't take damsel here now.


--bRD/piUAUlQcMCKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 23, 2022 at 08:39:13AM -0700, Nathan Chancellor wrote:

> I noticed that this was applied to for-6.1. I know you do not rebase or
> change your trees so this request might be rejected based on that alone
> but would it be possible to cherry-pick this to for-6.0 so that it can
> be applied to Linus's tree quicker? We have had to apply this change to
> our CI to keep our builds green in mainline, -tip, and 5.19/5.15 stable
> with clang-16 due to -Werror. If not, no worries, I should have made it
> clearer that is what I was looking for with the subject prefix.

Hrm, OK - it's a bit surprising that this didn't get fixed in -next
before the clang change made it to mainline TBH, it looked like
something that had just hit -next.

--bRD/piUAUlQcMCKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmME+m4ACgkQJNaLcl1U
h9DGGAf9FQ1B6+3Dfsp8LkqcAvNpYaPcgLbadzxOSiNhCz3nKbqjHeLn7qgXzCSi
ZsLpU8FfqcWvIzvDuDUt/lAFh2GEDS04od0HLNJ81imVRVaywR9qlc96Mpm+Ist2
Cz4yEkb9Ydw0kZCXXehsIPlCFtNVu5AKKHJJpgn6YFFjem/IMkeKrftmsIsMoQ6F
bfS+p2h7dJVYPOpEWSm3wAr2zrknfATV9SlDJcHqGd1E5GiKi3s3flgUpip2qHaX
g62kCwtHXs14FD+lbhUmIw3YxQyRrfQYXMosmDoNlvl7SahsauyoeRxgh3bCR0vk
GGUbcahF77/1Pzn+McWxNTRucJ2ueg==
=Xfht
-----END PGP SIGNATURE-----

--bRD/piUAUlQcMCKB--
