Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF261549E
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 17:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86057C433C7;
	Tue, 18 Jul 2023 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689701926;
	bh=2HFoHP9WBwjJISPakTGl2gr61R7RJNj7+5SjS9IPgg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6QrX9PfTbf0MbOdEz1PlmQx48DsaqbvGwoP8aVgYaYLjgDbuDuhMXwIWvAutDKM0
	 0Zur29Xsc0BcVEStuQGx+Tro2F+z6vQj5XwHOqNUqWm9hFNmdXXFOOY4UpBvGU1ZDt
	 ls3LUkdEYEKSJtgK9wcxy3IVMeOleoS/22ZJfp30Ox7vLPanH9nOSlzYKYTO6PCtFs
	 kLE9TV34sf8EY1CoER5Ng1Bekq9s4xX26jhLIEzQAMPFiREmcoUtJn+H692/NDxiB+
	 ZUdsh+Rjv/Q0nbzE2k7NA2eoMlXMuGVeUae+OTHkmAs7phcIU6kqh1kD3VfysI0FDy
	 0dlb0iTOazkQw==
Date: Tue, 18 Jul 2023 18:38:41 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sahin, Okan" <Okan.Sahin@analog.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Tilki, Ibrahim" <Ibrahim.Tilki@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH v3 2/2] regulator: max77857: Add ADI MAX77857/59/MAX77831
 Regulator Support
Message-ID: <94e1f1c9-df8c-4ce0-8d86-34cef6285954@sirena.org.uk>
References: <20230717050736.10075-1-okan.sahin@analog.com>
 <20230717050736.10075-3-okan.sahin@analog.com>
 <20230718155502.GA3542993@dev-arch.thelio-3990X>
 <PH7PR03MB7391206E2D2F1FEF3992C354E738A@PH7PR03MB7391.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvFYwciWCWUtLyCA"
Content-Disposition: inline
In-Reply-To: <PH7PR03MB7391206E2D2F1FEF3992C354E738A@PH7PR03MB7391.namprd03.prod.outlook.com>
X-Cookie: Nothing happens.


--lvFYwciWCWUtLyCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 05:25:32PM +0000, Sahin, Okan wrote:
> >From: Nathan Chancellor <nathan@kernel.org>
> >Sent: Tuesday, July 18, 2023 6:55 PM
> >To: Sahin, Okan <Okan.Sahin@analog.com>
> >Cc: Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
> >Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> ><krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Tilki,
> >Ibrahim <Ibrahim.Tilki@analog.com>; linux-kernel@vger.kernel.org;

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--lvFYwciWCWUtLyCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2ziAACgkQJNaLcl1U
h9BpxQf9EbN28462LWbk9BzvnLxNM9+L2YjOW+QY3nqGoyLD+29ThpbDzpXNcP4+
/MppZ6uPPUdM+cSvw0YA0wGuhNQeiItSyXYMexD5g7pDTfUrXSuRfutn+j9TpSuP
sTBcleT7XXuWEOhdQUFtRReuOujIRMdQyXyuRI1eUHvDV+SbEOcWSvb+NJOJo29P
El0IERfOqiStkDe8bl91XiF0TLp6NNyEsDJPLg2ao9QomZpwki+T5oozGtDcRWbY
2/aA4AsYrZzME1aJ669zmF5oiktSMS7BwudSQnmwscmWQwvVQsl+Mq66FjClEi6I
4W5Fc6UqQ/dm69c5fJHA+rHrhVyVOg==
=cgpb
-----END PGP SIGNATURE-----

--lvFYwciWCWUtLyCA--
