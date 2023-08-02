Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629F11CBC
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 23:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7534C433C7;
	Wed,  2 Aug 2023 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691017364;
	bh=cfH1Wn5ANNlrJt7DWhWpG027gOS6ON3wWgbPYyfHg2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQqZjVbpqvaYrfpPF+ZuGTyM9v/7WYukRsrEKCce8tMCyOYENKpuCIQkj6LLnVvbb
	 8L/RhLv/2SityWjurSyeKZelbk1jYpJzlnSCJR7jpsIKVQGLwplUXN4xGFatlrDhXh
	 A1vCi7I1AA1CAnyKxOmkTp3b71zy4xe0I1PRoJV+Ufb5lLtpS726ZyrXinWOEy1QJn
	 eriCtwHf0fThLhEye2SOAW9445hlsWJZxPy983W0GXtV7GfrFCoNDKRavsBbmYvLIO
	 kTTJh+gk8dPGMtBPqMOxols9/P0nnUtUuKMDyN1yiG6f5mos9n57qL7NwG0kcIGyl5
	 XTbKmNiJaFZNg==
Date: Thu, 3 Aug 2023 00:02:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	"Sahin, Okan" <okan.sahin@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"zzzzTilki, zzzzIbrahim" <Ibrahim.Tilki@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, linux@leemhuis.info
Subject: Re: [PATCH v3 2/2] regulator: max77857: Add ADI MAX77857/59/MAX77831
 Regulator Support
Message-ID: <32af6891-8246-46de-ba1d-ae1999f6eb10@sirena.org.uk>
References: <20230717050736.10075-1-okan.sahin@analog.com>
 <20230717050736.10075-3-okan.sahin@analog.com>
 <20230718155502.GA3542993@dev-arch.thelio-3990X>
 <20230726161033.GA1102409@dev-arch.thelio-3990X>
 <PH7PR03MB739122A373964651D995EA5AE701A@PH7PR03MB7391.namprd03.prod.outlook.com>
 <20230727145143.GB2013261@dev-arch.thelio-3990X>
 <CAKwvOdnPQEdbTGBO0hBn7CC4d0xtRV2zmfrYDfAhH0stfDYeJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xsT/aKpxiPD2wK9M"
Content-Disposition: inline
In-Reply-To: <CAKwvOdnPQEdbTGBO0hBn7CC4d0xtRV2zmfrYDfAhH0stfDYeJA@mail.gmail.com>
X-Cookie: Humpty Dumpty was pushed.


--xsT/aKpxiPD2wK9M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 03:52:52PM -0700, Nick Desaulniers wrote:
> Hi Okan,
> Have you sent a follow up fix? The build should not remain broken for
> so long.  Otherwise I think Broonie should drop your patch.

Someone sent what's probably a fix but I was waiting for some
confirmation that the change actually works on hardware, it's not super
obvious.

--xsT/aKpxiPD2wK9M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTK4I0ACgkQJNaLcl1U
h9C/cAf/Tj2hLig3hug1poNGwvUVoCQfdIIBy1Ybx7LkG8n1omgEmswStsUBjxr4
rNPSu+ZhhT1q1/pX+ciSndTwLwktOVMVY6seYNReSlpmkzz1mK6Yfg1ep8jM2LS7
a9Y8FLZFXE2MUqYJBKTjkGo0VA1CFCwsBeHdARO/q0NsXMDX+qO2jf/CChE4rstF
KO+Nu9aRx+ZjBs5C8EHnXuo9MLOVSI1OcW62ysTUDjcLY9SJXUDLoDr7zyzi5ZJt
pKAnmWW4cA21bV3J3PDtk8e16vQztRzAZdD395iakCyrI/UK9VeqouIzkPYWeWYo
b9ZErWJakmX21UGhw/LY09fAeljuQA==
=6Hvo
-----END PGP SIGNATURE-----

--xsT/aKpxiPD2wK9M--
