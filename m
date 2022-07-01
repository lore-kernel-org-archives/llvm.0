Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852E15801
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 21:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701B6C3411E;
	Fri,  1 Jul 2022 21:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656712650;
	bh=yXTRT9tzO60wn8/gIBmXfmphFtH4XAS8I5HrGSJt3a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYcd/OJnv47UiSCVC/BLS7UxrG0iKII8DcVyW1YMqe2LGfxfH09d1iOk1BmN8Xhyz
	 SZxEhyUuLWXF3gBVdHBJc+plVKOMcRJd/vcui4FSPsZuBpPlZUMOpU5UEzq9B/OY8y
	 0ZOh4VNh3m20OXE8nigK4raAvVav6Z1coa3BTlpLpbGHoc6pOq+msFEIt7XsO8IaZf
	 T5A2GGUjkPwseGQo6/TlPse6YMPPwkrhjcaR8M2rgnp7x8c3yPMUosF8nxfNQv9WWa
	 3NUDuywEd6OaL+QfIGRyO5+qaP2iidTBH0tEIly1TdHmlvXcWKDD7hyhAQPFPTXuLY
	 vtIUa/TdR+vhQ==
Date: Fri, 1 Jul 2022 22:57:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	nathan@kernel.org, ndesaulniers@google.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: codecs: wsa883x: fix fallthrough error
Message-ID: <Yr9txnScTv4rcSUm@sirena.org.uk>
References: <20220701155930.262278-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U2vGb+yzfZJZNnUw"
Content-Disposition: inline
In-Reply-To: <20220701155930.262278-1-trix@redhat.com>
X-Cookie: All models over 18 years of age.


--U2vGb+yzfZJZNnUw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 01, 2022 at 11:59:30AM -0400, Tom Rix wrote:
> clang build fails with
> sound/soc/codecs/wsa883x.c:1207:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>                 default:

Thanks but I already applied a patch for this from Srinivas.

--U2vGb+yzfZJZNnUw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK/bcAACgkQJNaLcl1U
h9A9pwf8D3nT+3EkYz7kNqdr81RfrfTfL01RSpRwy2pnhvNZgTdvgo9NpDBwkC+i
jT8J29FfGwUfe5wgNmlj/27VkhFlgW8yPXYIxQq0KpU1J5rE+nFVbbN08JYxsePj
6mS5iTQ9cXbzL8cyVPbSHtZ+brG8dtdkmwzewsYroydUPsG0VwfGrPPTFTC9bFhx
8+y2wiXB5cPfQVX28WnvQ74L1vG4W6bqOwqb8DG/eJVJGTibJ8kPl24ADnq00Eau
CxUWJcR4TcCau3m4/R7u7hiNS1DpG6IrOhT7yvZvYxUr9qC78/lC07IMim9Oe46/
HsA1tcdgESTUGEIcPZfWyyMCzav0Kg==
=2iTT
-----END PGP SIGNATURE-----

--U2vGb+yzfZJZNnUw--
