Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749519511;
	Mon, 12 Jun 2023 15:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9607BC433EF;
	Mon, 12 Jun 2023 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686582684;
	bh=eDgQQTnNXvtYnlfPivw1uJS5LUo+wBz13Eepr0vFzj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gtt9xkuaBuj/OASEX1MDLGuhScD02hv5zKaedC0w53NvArXfbPKaWWj/7YRjCWnVT
	 9KCLx0F/2qRd6wtKVh0HLe3gsszUNSbfathiYFvTM8rN+mBExF0C/c0gD190TEn0iK
	 bl/jsqlhDN5w2A08kh8zgW6ClhAfKcam1gZW74KWX+zX1SRRuRciLPhoi+Q9kf4jSb
	 MIewmmvZxFjTKjk1UA6BsZM92wfyxb0l57tdbcNWMUWaH2x00Uj5lvjiwHaW2CGRqx
	 kv+vjAb5ntfUAQBir5A6N+yvb0hLD8GMR2KoQ7syobMSvIInoYeXq6Dhh/Mj6CZqxh
	 b1VwIXItxfIJA==
Date: Mon, 12 Jun 2023 16:11:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernelci@lists.linux.dev, clang-built-linux <llvm@lists.linux.dev>
Subject: Re: kernelci: please upgrade clang-17
Message-ID: <262df5fd-d8c4-47aa-a65d-dd79a303a9ca@sirena.org.uk>
References: <CAKwvOd=qxNfPDo-=bxzyzmY3YmsBtxv686rr9Q_thrfC6ni3eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HGnH2osC6wMqsFcL"
Content-Disposition: inline
In-Reply-To: <CAKwvOd=qxNfPDo-=bxzyzmY3YmsBtxv686rr9Q_thrfC6ni3eg@mail.gmail.com>
X-Cookie: If it heals good, say it.


--HGnH2osC6wMqsFcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 01:50:13PM -0700, Nick Desaulniers wrote:
> Starting a new thread because gmail cannot handle replying to an email
> w/ >45k warnings.
> https://lore.kernel.org/llvm/6482b7dd.170a0220.a93c3.9102@mx.google.com/
>=20
> instances of -Wbuiltin-macro-redefined have been fixed in ToT llvm.
> Updating clang-17 should resolve most of the error spew.
>=20
> Does kernel CI update ToT clang builds on a fixed cadence?

The containers with the tools should be being rebuilt during the
production update which normally happens every Monday.  There's some
disruption at the minute due to some infrastructure rebuilding that's
going on so today's update of the containers might be delayed.

--HGnH2osC6wMqsFcL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSHNZcACgkQJNaLcl1U
h9B5CQf/YylYbVq/TiEDK2iK2Nz6nl1YnYkSgEhUIlfPbAzqPd2bW5aZDGlVYRsX
uaNpbKEECGumx773wKmYxVifE9IM/u4tHrbIehIhBN/Dt9ow24d0ZsSRaL3ZtTSu
It1rJ26m21bGSXaXG8cvLmW/SZdjOhMtFlts1omrXgAg3jb+AC84EIBAPsYyHYTz
KKtN61cugvycAbDV/n86HJetzOKln78UXHjmdc99bphNWr+kYczxQzLcSxMD57qM
br6H+HIwFJQNCPQ2y7cxKbXokAGGT0I2+e7TOrL/i4Vd3wqqPmumYcNYU3/P6il1
z4mTlFFpWjdI5ifBP3QylJJbwUUQ5g==
=RPJH
-----END PGP SIGNATURE-----

--HGnH2osC6wMqsFcL--
