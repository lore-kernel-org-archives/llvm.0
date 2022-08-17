Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072F441E
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 16:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45444C433C1;
	Wed, 17 Aug 2022 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660753288;
	bh=EB8auf1uFAtLTf+Qxg+8QHDmcneYTnfJMO/MXWK/HTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=To7zHbx34gaUT874XZ5fU+azhtjIBXbXyPh3os46m8LAwShwg5CHmKwhu0gcdoFDW
	 wgvYRnWvpOZMymwhtqCyjK7MXkryyAmrRcfnyfnQXqZGvrJ4WdIkLim7etvWw49bml
	 11v8kh+mHHqrckZar5PD8UgtEb1dr4psZzL4EyUujkGme7/9hf5LofvhaTvYs+jtKi
	 kQTTl8loDyBmnYckdbFuRaUWviMW3efv61VNTD6J5SBHHZKfFPxFcs7pMI9OVXIHu/
	 1gTpisunFqCou1sJy8q/MmIEQFsVvB8KR81DvWracAHx6dCdMIN8D7UEb+Nh/Sx9aj
	 NNBzL7fDfJMCw==
Date: Wed, 17 Aug 2022 17:21:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Matt Flax <flatmax@flatmax.com>, kernel test robot <lkp@intel.com>,
	alsa-devel@alsa-project.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <Yv0Vg2bkmlEqTSVk@sirena.org.uk>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J34F5h37Q62QuYk3"
Content-Disposition: inline
In-Reply-To: <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
X-Cookie: Use extra care when cleaning on stairs.


--J34F5h37Q62QuYk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 11:00:10AM -0700, Nathan Chancellor wrote:
> On Tue, Aug 09, 2022 at 09:49:38AM +0800, kernel test robot wrote:

> > config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090909.Pg0BZGie-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)

> It doesn't look like these warnings were addressed before the change was
> applied to -next as commit 4e6bedd3c396 ("ASoC: codecs: add support for
> the TI SRC4392 codec"). I now see them in next-20220816.

It's probably worth talking to the 0day people about prioritising what
they're reporting against, especially given that the reports have
evolved into a bit of an eye chart - this was reported against a Hexagon
randconfig with an unreleased compiler which is underselling it rather.

--J34F5h37Q62QuYk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL9FYMACgkQJNaLcl1U
h9DIXQf/ftJfs+bHR8zt5BTlHyxCQFhZuBic3PscdVU4Y1E2gtjAt6vLmUAYYlva
o7Wlwf3oiOjThS5EgUZNRNltyiZT1TJQE2Zoo/xeYRx/gfAof+sBsM6f1xFxuv4+
7Vh7flrmYhjUTBuSqflZszQ5kbXJyXVkfq4NdiOFsIDEzFZeR6YDfYLEnjhcTV8Y
YfmQdgHt1hBhk7Dt9sA8YXJMlcLbbGAVYiFb9qVC6uvnhwTdoXSKB3LBn0GKGsuo
2QA1zqT4TdymsMzIAEbpHih7mli4pEs/eDVHfc4Co7+0B4wuZmLg7SKZOlIVjniH
taL7aCXWp+LNvaFC2sk5331kwoM1kw==
=zux7
-----END PGP SIGNATURE-----

--J34F5h37Q62QuYk3--
