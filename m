Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D08C3D84
	for <llvm@lists.linux.dev>; Mon,  5 Jun 2023 08:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B90C433EF;
	Mon,  5 Jun 2023 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685954676;
	bh=MMkMH+tpsZ3PyspKggeYX/FCSlvfVaRWIsEuKzoAkE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJVnwLy3axTBEVeWVjc5fOAJ1d57eqjtisr0rdsZicXK1WqndHzK/+04Fqw46XxMG
	 SQN4cW7nxQ01v6cjxkSjq6t4J5ImWPXirJIrcSofQHLkgGMuHJhE1eus5/m2E5rfkT
	 Qmu7OnHFh6yx/JytJde04mm6MhT+8uAfCZTpIdREtycKCxjvrafwrif0HvuHYhvqno
	 Y1aOamQXvtJoWBOaoxVbw09gbi4Ldmnyfz73PdS79YsQlCGOI0lF2nUHm2OSATtpdB
	 KWyHTBR/S9LP58HVwcjPNJUD0p4Ka2MT8K51Pf2WCMsIzzaoxT5mCk1JEUJLdOIJqT
	 gN79yfr6coi9w==
Date: Mon, 5 Jun 2023 10:44:33 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
Message-ID: <ZH2gcekxad9JPrjJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
	llvm@lists.linux.dev
References: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EdPn873a/5CanpDf"
Content-Disposition: inline
In-Reply-To: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>


--EdPn873a/5CanpDf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 02:32:17PM +0200, Simon Horman wrote:
> Rather than casting pci1xxxx_i2c_shutdown to an incompatible function typ=
e,
> update the type to match that expected by __devm_add_action.
>=20
> Reported by clang-16 with W-1:
>=20
>  .../i2c-mchp-pci1xxxx.c:1159:29: error: cast from 'void (*)(struct pci1x=
xxx_i2c *)' to 'void (*)(void *)' converts to incompatible function type [-=
Werror,-Wcast-function-type-strict]
>          ret =3D devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shut=
down, i2c);
>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>  ./include/linux/device.h:251:29: note: expanded from macro 'devm_add_act=
ion'
>          __devm_add_action(release, action, data, #action)
>                                    ^~~~~~
>=20
> No functional change intended.
> Compile tested only.
>=20
> Signed-off-by: Simon Horman <horms@kernel.org>

Applied to for-current, thanks!


--EdPn873a/5CanpDf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9oHEACgkQFA3kzBSg
KbaAyQ/+OcGmcDOvDD+tEiGwpTJ0aIlH8fRUmehZtJKptN8zyIEY6Qd38K+ijWvJ
2BPHHVCBO8kzfrorqE6y5K0YOVLo9mNoBfeTlv4FwihFjuIAN2J/ytmgkgeQvAGO
x6WQQFliQrop9nJ7j/K2RSKjBkePGfYufOlYE0NvlqeHlUruQGJ3mle7oxJvqZ2H
FXk+qngY6eQa55CwO8l+Vb/osS9AlrlNg1FRA4rkTiDwjY9uwAsFYIwiJovUMb+L
AUGCJy55iTCLRjH3a/qZ4PJXTmdaH1Mriz+/2ipiOIMxg9hTi0EJWE1gfQunbEq1
58hyx6LShSHV6KsZ/dO8P4d7D/7qA04xCmmOnDARrG5G8q2tEcbahYTfQQ4as6x8
yDd2jaFWEgfQYbyTTRYxZJYkE82dHEz73ylIMbEmXtal9hjLQmXH3K7ljQfV34Hq
ukdMI0RELbSM9hllF+f9LVekTBasoNczShgMZFMYaDMt1DuWr9YoMvR7vAgCWxjG
KInW8756qnBqdPjdgZnfIM4VEYg8qhMW0R8+LsPyGH5IFX0LKAuIVAsP/3M3+hiC
PqAwl/xX2btMNNGJ9g7o0xXiLeEw/AI7Ba3YxUTJNtKuuw3qxapyKqZrJwgf1Rkm
gsQo47W4sZGPnaft/s/ZLeJAg+I7YuYFMvVEwOOtokCN6h7udu8=
=FCEv
-----END PGP SIGNATURE-----

--EdPn873a/5CanpDf--
