Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600B6134A4
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 11:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9794EC433C8;
	Thu, 17 Aug 2023 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692271706;
	bh=QizM/IZpfLB5gNw8uILxz1bnW3evYEoQkYuca1IFqRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzpKUutHKba8ti7KWcq4IRNp9NGE4BkW2di4vdwKz1cPKO8O1qsvYuSIHBmW1wxYK
	 sb0PaaKdbMVYe8TJJ90r0myvrEjIlIa7kOTZGEyoEfoT11y6ubtyrcphl/14OnCKqr
	 a5hF2O/Xxl9sghpr5dCAelyU1KlgNW1WvyBxyk7n6CYKUSOwxEfp/6hp6upZZt/8RT
	 Z+2AOpCx3qc2wwQS7Q7M7My/emxmDgrvvbHG6QC+epF9ZKo0Oq9JLsefTogBPnm97I
	 3bN4qnjJdKUZk59BwjXLsPgBRBf6EI/U0pU7ls4YH5mERZb1JKoomv9h87OVPHS3RQ
	 IgatkkD3ALkNg==
Date: Thu, 17 Aug 2023 12:28:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: selftests: arm64: hwcap.c:51:15: error: instruction requires: crc
Message-ID: <a7b678d9-d6ba-4cf1-a6b3-89098cc90f6e@sirena.org.uk>
References: <CA+G9fYvVZmOJvf=+JM8LRGxV6ynCPuPreipCP3+fmti=M+dxwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+S02MxnRuwcq6WP5"
Content-Disposition: inline
In-Reply-To: <CA+G9fYvVZmOJvf=+JM8LRGxV6ynCPuPreipCP3+fmti=M+dxwA@mail.gmail.com>
X-Cookie: Walk softly and carry a BFG-9000.


--+S02MxnRuwcq6WP5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 17, 2023 at 03:33:18PM +0530, Naresh Kamboju wrote:
> While building selftests arm64 following warnings / errors noticed on the
> Linux next-20230817 tag ( from next-20230815 )

Fix already sent.

--+S02MxnRuwcq6WP5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTeBFEACgkQJNaLcl1U
h9Cgrgf/Wenr4NZxC38M3/DbG/CskZ16LCseE4pV7yjyBMeEtE/oUrSZ2CEncxvr
2XFFcdmCptO6ndzRpfqZWtz+x5IOhq29QbBcHgNQQwSaUaFuDAOcZIcuEBZnK7dT
6k1cnXwDNBxFxrZR371CdZKb6csnBGbgTL/AWSvxwXUx/ho8O1iz1ouaXKmZS9Pc
t6xenkAHV14HFX3eg0RvleE5549UcQrX67Tt5nSblpISxSu6e0sSPNi4PfwRGijr
qltuZNiKI7ESyv9oEv5AcVjJsga+LraklRUdsXyhYt2FJ6Q61gjkXWzXOgCHrLu3
8iVuXhnI7k8B6QESUjEZlgD9bB8PqA==
=M49M
-----END PGP SIGNATURE-----

--+S02MxnRuwcq6WP5--
