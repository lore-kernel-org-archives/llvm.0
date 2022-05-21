Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55422F24
	for <llvm@lists.linux.dev>; Sat, 21 May 2022 11:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BE0C385A5;
	Sat, 21 May 2022 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653133479;
	bh=x1yQFVL4D4hpP8UOzK/ojGTRSQhUqgZveDzri3xOrbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0FyR1qW/2XYWt5vYSNN2q4uEwpRpz/wffPQ58kwo7/OlfypaALlZAa+1wtH5rEoF
	 Kza961PnRCa8iR7Jf0E8anzqKUtwu83b5rt21T8mgvC9zwvpvjwsfmPiQlml3km+Ck
	 fvPFRUrV7azqkUvwsR0nVDwyZQuICquz1/F9mSKy1T/iOzHT96hLk0XmB38XTcZEuq
	 660ujwvEVOoqBoTFbj5kGSNWOBANsXwEhgCyn/QY3vQVaqzKYLbDzL7+S2yQfvet2G
	 6sczuSQ/zbWFMlB0e5NgYCWMN2Wm88v5/iEXEZmrosZJpdZsA82K9fLkQ8SPO1HD3B
	 ortPc2xRjHqUQ==
Date: Sat, 21 May 2022 13:44:35 +0200
From: Wolfram Sang <wsa@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, sgarapati@marvell.com,
	sbalcerak@marvell.com, cchavva@marvell.com
Subject: Re: [PATCH 1/3] drivers: i2c: thunderx: octeontx2 clock divisor
 logic changes
Message-ID: <YojQozzCK3Sh1Aqd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Piyush Malgujar <pmalgujar@marvell.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, sgarapati@marvell.com,
	sbalcerak@marvell.com, cchavva@marvell.com
References: <20220511133659.29176-2-pmalgujar@marvell.com>
 <202205170856.ko6UxqWi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZznfZLL5dWV5UztK"
Content-Disposition: inline
In-Reply-To: <202205170856.ko6UxqWi-lkp@intel.com>


--ZznfZLL5dWV5UztK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>    In file included from drivers/i2c/busses/i2c-octeon-platdrv.c:27:
> >> drivers/i2c/busses/i2c-octeon-core.h:223:21: error: incomplete definition of type 'struct pci_dev'
>            u32 chip_id = (pdev->subsystem_device >> 12) & 0xF;

I guess this needs some fixing?

Other than that, you should really add Robert Richter to CC when
resending. He is at least mentioned for 'Odd fixes' in MAINTAINERS.


--ZznfZLL5dWV5UztK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKI0KMACgkQFA3kzBSg
KbZqmw//c0b9rK2Uy5cf7yRZPA+WZzNdki1gx5gAi7O/iOhYTJP43H7g9pHvbAt4
h3mgy/f+1gIwjus8+8e+qLex/h2xhhJ8BJuODl32JV7wBTzEzmF2sR7P2GLFUprF
1LePFusUFwixorY7e4zIygRctk5HFkRO+rJpy7G6sz5/UnTjs8gRavLUiUJPd9uI
Sysfpnw4eOtaSeWoNv9WKthd6ufttRR/NQtPP3M2G4byWZDzWuJgKpYdX18isyb0
SySDt5/QLJI9V/4cZWIgX30KCHShQH6qLqfznV6O8QMAlekNczNVwgill1wPJ6a8
jlgqLWq/lz08XpPVGnCHdGVCWU9J6mne6dwmahXlzTg7dhhFgzqXbaHVC1doEJW6
92IHVkYxmj1WQabhC0Zju+HduIh5aSaMVjpgwmbH9bdW4CGstgqeJEqGr2CC2Q6r
vM1AVhp1Z3812M/Np476fgvDZGK4mlLAcRIjt0B1PI3Wd4UkNQtMmRuecioQ+EbY
o6kt7Ze2RZVCEbvTT9fLgdYLq1WrYnXTSMi3XO16spVBg214i6SB0VtNTx76KpDh
0oYimcFjs41+GE85FBiwQurl2hxTgBiKi4C/wcGHjV4Su8Wrgi7i5KNjQrt/GpxT
PeOSA+u7HL3C/eD28Ig3fJdgj1iuKlS8sL3vyW+BSvuh6RPH30A=
=lsfu
-----END PGP SIGNATURE-----

--ZznfZLL5dWV5UztK--
