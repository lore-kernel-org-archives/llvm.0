Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF81C2A3
	for <llvm@lists.linux.dev>; Wed, 29 Nov 2023 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNaZjDzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CECC433C7;
	Wed, 29 Nov 2023 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701259962;
	bh=O90B4Q0S1Q+25NbVYezH5mjoV/3TQBVl6kKEY21UdBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNaZjDzlPm9hargk7WwoEBpWiULnK5zXGjWFr4jJRVNrO6rKAOnHDjrH0yNf2rRh0
	 F4w1IjdcgUhsVUJ5fMAjZeouxDAP+fayP8yO0E81JSico4hHagDsGkQ1LnQXgY6liP
	 r4TFuZFn4pE18UFGTkuK1pNLlcBljsIFFe6YTkfMsJi6S6hCVoxmK2+bp1s5oLgR4M
	 zQlG1MWGEf/69f0YY9jMSx805g4qV86Dk2Pmg3BXngNhMA79aOQYWdzR4xfXn0Dw/R
	 cl/8v/KFNMGjOpKzSYtmtoe4KC8WR/fwyXeGmXdY9UUULe4cj92mqiAROQCU24akRG
	 0cEQvOaRvio6w==
Date: Wed, 29 Nov 2023 13:12:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, frank.binns@imgtec.com, matt.coster@imgtec.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/imagination: Fixed clang warnings for initial
 upstreamed patches.
Message-ID: <ewky6qzrzzh56pgrl3arkr5cvwncbonefmhdrjoxyvpaexlfbh@eyxh6p7znjis>
References: <20231129112014.137407-1-donald.robson@imgtec.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lkhfry2wxo7bon2c"
Content-Disposition: inline
In-Reply-To: <20231129112014.137407-1-donald.robson@imgtec.com>


--lkhfry2wxo7bon2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Donald,

On Wed, Nov 29, 2023 at 11:20:14AM +0000, Donald Robson wrote:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202311241752.3iLyyFcA-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202311250632.giVEx7MU-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202311250226.Da2yiSKp-lkp@intel.com/
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>

The expectation is that you send one patch per type of warning or bug report

Maxime

--lkhfry2wxo7bon2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWcqtwAKCRDj7w1vZxhR
xcEjAQCmFNuRLlP8MT+UK0jKa63G5J3hYc4h5qVuaAmTQju1uAEAqENb8fcwuHG7
PKDe5N+lmxJDWQH3VgZ0nUTrlN5J4wk=
=pnBq
-----END PGP SIGNATURE-----

--lkhfry2wxo7bon2c--
