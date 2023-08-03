Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1698F7C
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 11:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6689BC433C8;
	Thu,  3 Aug 2023 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691061314;
	bh=pjGmRPlAy/E79h6o8s86aG5jZlbnrWvA9m8ObURWxDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lP+9YKszTF2IQFSwW9sgq0Htejb3bfsFNCd3q2H3zWsTXQMt0pUZcaxEiV6OrVacV
	 yJk7hTvtxJJFyXnQK/wPEdY9pd1nfnJsKwzxsodpCeZbAPLKwbVDm21L86siQKUtTp
	 7Rtsy+jEVKKef0wCxib4F4Mtpq6QuUrNYhEPOp5UawFzsUu+Sq2zjtWcrsdIRw0Vu3
	 OAzywBECnKb88b9zS48qcmKB7Q+bq6QPibPPNfKNTxM6fSWdEgel4QqSy3oZo01Vti
	 A07oaTvjS7MoffeEaYaDFWQfCh8FY4bwtqHE9StXAKd1sm8Y5OkcA3kpMZi1qsdBp1
	 mmmNnKpltjhqA==
Date: Thu, 3 Aug 2023 12:15:07 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sahin, Okan" <Okan.Sahin@analog.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"zzzzTilki, zzzzIbrahim" <Ibrahim.Tilki@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux@leemhuis.info" <linux@leemhuis.info>
Subject: Re: [PATCH v3 2/2] regulator: max77857: Add ADI MAX77857/59/MAX77831
 Regulator Support
Message-ID: <4ad70585-fc34-4c65-9de8-09892a6a5c2e@sirena.org.uk>
References: <20230717050736.10075-3-okan.sahin@analog.com>
 <20230718155502.GA3542993@dev-arch.thelio-3990X>
 <20230726161033.GA1102409@dev-arch.thelio-3990X>
 <PH7PR03MB739122A373964651D995EA5AE701A@PH7PR03MB7391.namprd03.prod.outlook.com>
 <20230727145143.GB2013261@dev-arch.thelio-3990X>
 <CAKwvOdnPQEdbTGBO0hBn7CC4d0xtRV2zmfrYDfAhH0stfDYeJA@mail.gmail.com>
 <32af6891-8246-46de-ba1d-ae1999f6eb10@sirena.org.uk>
 <20230802230426.GA3027248@dev-arch.thelio-3990X>
 <ae431bb5-d132-4737-b4bb-58a323f877a6@sirena.org.uk>
 <PH7PR03MB7391287FA2CF2C1982724952E708A@PH7PR03MB7391.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R/HZQ6bJxQ0iW7Z7"
Content-Disposition: inline
In-Reply-To: <PH7PR03MB7391287FA2CF2C1982724952E708A@PH7PR03MB7391.namprd03.prod.outlook.com>
X-Cookie: One Bell System - it works.


--R/HZQ6bJxQ0iW7Z7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 09:10:26AM +0000, Sahin, Okan wrote:
> 02, 2023 at 04:04:26PM -0700, Nathan Chancellor wrote:

> >Oh, they didn't actuallly send it to the list :(

> Actually, I have received email about fix before I send new patch. As
> far as I understand, it was not sent to correct list, right?=20

It wasn't sent to any list.

--R/HZQ6bJxQ0iW7Z7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTLjDsACgkQJNaLcl1U
h9DyBAf/UKpKmgHPs4JduVO5LeffXUxbce0yWa511vfySs/RbbC5avP0rrBSPqi8
tFAERFuR1H0RdqnRN4xUeDRkVmfARKO0k7jMVhRMYiQXn/EjNfXDuzdxeNQethK/
J7f+GnEOc44tY6W+bDOTv/pv32i5YqEMaq7phyXQ4Wdj8IRChL6qU6giFn8N+i7K
SLj+berL9wp9+vSbmhYw5LXIUMGVR5dv65DpaSqhj7O2asSb0tCbzyB2ICdizhGQ
uTc2Ebp/6Pbt8jyFO+zxeaivi3Hrh9B+xeexb31KfkYHkOkkf+lDu6Ya+7f98jiw
4tMsHDsNAG6AZC4I81QV5OakNTelQw==
=4fvC
-----END PGP SIGNATURE-----

--R/HZQ6bJxQ0iW7Z7--
