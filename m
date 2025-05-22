Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CC28C01E;
	Thu, 22 May 2025 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921952; cv=none; b=gmgG/nd+fxrQblo3CkHZx8J3wLwGHUXhX6xPVFMzHVbKmHKJ7LFexnvl6BWU/w9p32hIqVVRPFwLyy0kar1CmiFFvVeWvK5t+2p68Z3jJGf1/lfjhJtGMAFLnyKQhnAfLCFVSdtI4JvMauaKiLu40HhwTUtOE5WQcMLKjse5ivw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921952; c=relaxed/simple;
	bh=AVAH27NqeLH5mBl5oK+jtXQeh7KTrCqY2h9XBlA2LcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/V9UAJc/P/+EdkojUt6uInP1q1q4kDyf259hREZBzCk6szzUmYFKgy52/1gXF8Z3rOkJhgcaigafopS/ZcUncuhCxXfqESTQvOk8MElT70vrDy4VRNhldHN+HpAHVHawaJh7V5BxFezuVPsR/mYTtUl4pc68Jl7eb58tLbOcpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN3ZYteZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN3ZYteZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF571C4CEEB;
	Thu, 22 May 2025 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747921951;
	bh=AVAH27NqeLH5mBl5oK+jtXQeh7KTrCqY2h9XBlA2LcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN3ZYteZNuUjo+AjWTm3zCfu5+fmCVMfMyyRXe6YXFyZsBOYyh9AcVU5c9RNvFCKR
	 ZkmZx549zztApjactgnLJb81v0ShEnm788taPwpSiAgr1MvLKPOI08At4th0UJnoU6
	 d+zKbO3plaKFQHZT8i8eMloca1Hn53DwghBHB6wNSh9u2+B9xEkuqh3IzWGdGbmH/U
	 I7Xq6p5lZ335io/Wje25/HFGyOGEBsreIWS7NvbCDDoSJGZjGbm4UTii+iVpixGXTL
	 puBKK5ko0jutCEEKGRPLCSE1eBmgzww/pG2y53yCUerXxCU+jPZxWbwNUmqIoDVjq0
	 UggwAk3XYwVZw==
Received: by venus (Postfix, from userid 1000)
	id 9EDEB1807A4; Thu, 22 May 2025 15:52:29 +0200 (CEST)
Date: Thu, 22 May 2025 15:52:29 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: kernel test robot <lkp@intel.com>, 
	Jelle van der Waa <jvanderwaa@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 109/109]
 drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator
 'charge_types' does not refer to any field in type 'const struct
 power_supply_ext'
Message-ID: <ba4bcvf3tjqunxncrqeire4j257px4plbk5eew7sfbmycscbys@xymzswpfmadw>
References: <202505221051.khDhUKJ0-lkp@intel.com>
 <f981b9ac-41cc-489a-9f37-c9e87e748c99@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lz7i3t6ajqoytaqn"
Content-Disposition: inline
In-Reply-To: <f981b9ac-41cc-489a-9f37-c9e87e748c99@redhat.com>


--lz7i3t6ajqoytaqn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 109/109]
 drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator
 'charge_types' does not refer to any field in type 'const struct
 power_supply_ext'
MIME-Version: 1.0

Hi,

On Thu, May 22, 2025 at 11:36:47AM +0200, Hans de Goede wrote:
> On 22-May-25 4:39 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-=
drivers-x86.git review-ilpo-next
> > head:   b2012b38080e2f92d43eca59e8249c174a27527c
> > commit: b2012b38080e2f92d43eca59e8249c174a27527c [109/109] platform/x86=
: ideapad: Expose charge_types
> > config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/2=
0250522/202505221051.khDhUKJ0-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b=
5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250522/202505221051.khDhUKJ0-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505221051.khDhUKJ0-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> >>> drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator=
 'charge_types' does not refer to any field in type 'const struct power_sup=
ply_ext'
> >     2044 |         .charge_types           =3D (BIT(POWER_SUPPLY_CHARGE=
_TYPE_STANDARD) |
> >          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
> >     2045 |                                    BIT(POWER_SUPPLY_CHARGE_T=
YPE_LONGLIFE)),
> >          |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
> >    1 error generated.
> >=20
> >=20
> > vim +2044 drivers/platform/x86/ideapad-laptop.c
>=20
> Hmm, this patch depends on:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.gi=
t/commit/?h=3Dfor-next&id=3Dc1f7375a246e5f810191a6c3031d2fa2b80e9f5e

I should have merged that through an immutable branch :(

> I guess that that patch is not in review-ilpo-next,
> maybe Sebastian can take this patch instead of taking
> it through pdx86-next ?  Or it can be merged after
> 6.16-rc1?

I will be on trekking trip for 3 weeks starting on Monday (more or
less directly after sending my 6.16 PR), so I don't want to take any
late patches as I cannot handle potential problems.

Greetings,

-- Sebastian

--lz7i3t6ajqoytaqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgvLA8ACgkQ2O7X88g7
+pqpSxAAoNyiJ2o+UAgvn8PFbmpeeq2Ka42dGr8s+ZOj1o/mFVf80IWYNFH4YVD6
ZyRWztDP1oW4sWj1wMGZOHeAzq+wlvhVMDI/Z5KnybD2Y5vpkPL5rctTnQi+Vn59
AaW90TxlSaWook+RutgyGY6Cuoe+Pwq/Uv9SrfUORYs6tKQKSkbWaAMDIt2iPgyJ
WP8EohlWnXHm++vN7ezWPJ9IvLJVBW6Rgc4S6qGuu+NTeaCMgi5MfFqX/4S0K8kk
DE0NWLqZC6oNiyEQ7B+hGQySF+GCeUvjMCqJmZ+rU26aL2sm+KDx0OXeXRFA91zg
Q+10ldcOb8CziObCyCSwuqM+s3Vn4C7N7UdwEWrv5DPiN1fzDFI4XxcOVJZ7UOII
m5Y6llUiy8wSvGSoAi02y6QXNdcMU7x5k47j/5l/fLxzTkWgVCKgUCmpoe8Q00Tw
OpX/QYzxVfjkvhUdDH/McMXqp32UZmrw794GLZgGKX27iUVh//8IU2fEgspOScsx
duCMGdiAz5P5neCBMDQ/8UNwj18SekIx7wkZt8yRRPms5HWdA+OlLamI4yH7HOQP
iMur9pTarJ39q6SjrE2C2MPUHguQF2fGrxli6jqfiPuh6AqzkpYs60+oK+6Tb0Hc
/bW6vy5PlNBKAwhHfTR5ypP7w5//QVfTO/XnjoDKrC9FYM26UDI=
=uXm7
-----END PGP SIGNATURE-----

--lz7i3t6ajqoytaqn--
