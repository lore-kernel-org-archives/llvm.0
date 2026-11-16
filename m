Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828509;
	b=wuhjiNRKfnsLq7arGhA6GntM4//qbArEdXt91tEZJPer3zmhlO0g8k7Av3qfVQCvAeDk
	 NynkcmFqhEiABlPDx4QMcE0Jm2ibHjTyQAj2HlHommj4QMJ2X7kIzPv8Cd9jvNjq5yPws
	 Lv+rLp+0rxoSrwnhctVZ0AUp+zCN4GsTkBlCWjD6ekVQJsRjN6NFLJE4Tu0HWP/uv4XEm
	 0CtMkzWFD43skWp1BBsc+YbzaFYHNqBEpkwDmoMNpiUF5T5bYwCrDcaLrAzNBKjRY0mHI
	 +wWrUq5KrbUfh0MoxHT+ZFif5LgjXvTWY1h3YO4koCZCRFZ5R8gjHFD6NlT/O8zmSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0JL4wR1lGs+QPvkNjJXfpba0XDMYzbIwMDG29YMLDPQ=;
	b=nktImzfe7F/8joJ4LZavmZiH3HSnkD3XumnV8e//9EjoKrxGE9HUUyCfCNRy9GSCo9Un
	 t5af8fTJiq5F+5IimsBo9sCY01epIysOFqtRH1LIKIf0ITtL4/d814zZqMx2AYqZkNSaM
	 AXFbOKIZ8BFxoyRHp+YDDk/+zEfW3PTx23AymSiWmPKsUSYt5AffU6/mqhGB1TVLu5D6y
	 l1D9hYonaeEaPPOW8mNengPgBrOS9GoXdbBCI4U+ivx18LbYrSMnbcosdj+x7jQgU+4/g
	 UaKTSMKMravCHyI2CwjBSXrF0jJjnw2Dw5cWLUrIc1sR6gvHyb07ly/JCoi/f7waK2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OYFEy+Tj;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2E606A7BB
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C2E606A7BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OYFEy+Tj
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb606491faso9554955e9.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 03:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794828506; x=1795433306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JL4wR1lGs+QPvkNjJXfpba0XDMYzbIwMDG29YMLDPQ=;
        b=OYFEy+TjftV22w39sQRkfs2vLcUIS/5nyrLBuqWYUCHMJtxH5wU6H/7f+wREK600J4
         th0jiv1oiFVRJyKpknmpEoztwJd9uC2xHS8KU2xx7EF03cZvqb9gRIA3Ss8yTfQ6zykm
         oK4nXZG5VKxU94CxCtd/6WzhDh+Pf0oN3LqH7GE+v48MvPf5dgZP3agX7iSZ6V4alLpO
         7joDx54InZlfuiNlZ7tNiqVWRV3TermKpQVjQGgD7pe/guujH4AJO2h96P60+wLNQMj2
         C4tgvaqggrGhVk3ztdq4I4ybH87HkJji9P0dv9qIjJ8/gRYiyULaTiHRsG3iCLL93uqq
         qHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828506; x=1795433306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JL4wR1lGs+QPvkNjJXfpba0XDMYzbIwMDG29YMLDPQ=;
        b=zxdlIrpQ0EsPN0MJkL3rEAWAbam5dZH+N7pPo6wtJuYC/zSoBSyZondJWCaeDbGULc
         ZuPB/M4XUFPseIN+add+zAoOoh53G74h7CbMnyjHf2qJSoF1a3dkTzYKMxjG+Xxenkz4
         LliYkucIan8p2f6S7O1zMI/m9mGqZKSfrhSLa+A/fCFl8bwR1PJhopuztqYtvi2qGn4b
         ePXgiZ15CTKYeYePq1b7+DtDdoXuQk7xAWiZndXPSwHk59jJAb7QmWj/zpT/4D6SgisT
         9gC79xvi3HlFcABM6MH3J9w2pi0CK3gZ8MKWLBavOB6bXNyt3mTXXwRmsIK1QAYSHArg
         7O0A==
X-Gm-Message-State: APuU4Z/e3FvwRN1J1fWEjHIR2bT0nZhHolNKpmUfz6TF0XgC7cqN/ZBC
	q0nygr4+SqQBQPv8fkkoOHlGAGDkvX+B6rsVFi+L40HvZ9Gv5lMHToUT1wIrYUJzzq0=
X-Gm-Gg: AYBFou3EmXdMgX09GY7ETH1fJvq3HtDJM3Mk6RKGNbThy0U9WxJictEs/4yZ6HkDpMY
	PbZTsPZslVIRSYSU1B0XKBzQs75Nix29NKn11L3jOiTVsIVrNWo6xNp8Bu8fsm2DyH/QReBt7rJ
	VQM2NYeBrCyToNPi3Q8YkEuxXhDbkqcR8B7setaqY6RulEDXz70pLC2SXBzUbqbXV9wLdz5TaGE
	1bxhzsESxvEBYoWssvfTsFH5zNGmWqNUZxDJKAopws0JqH67MekS/0AfrQNxFmSOotUgd9bPMdj
	8+pxUl7lhxvlDnm2Q53TZAFU4XhUfbm6a6LnVf6iLJojshYoNIlfoWZSNDkIN10n5lKYatf5sDb
	gP4zzNqmZaxTf+j6FNnQBzNYz+Eujcb9Rk8UxBNfmmIIb5OnkFuUoBW8k+j2inuiS4/rN8cIoaN
	+rkodI/RDpXc4t87wPL7wUgeSKgVsaKmU0WOT4mHRaS09Ab+ElwyMJ27NV4SW63E2CHSio5OFCp
	38R6UzJ2CDPjXfc2/63yT+id0S0P7fxErxvnQZz3DGu9+bEct6yaGsGSSXPrj97bRdWvKD5iJ1B
	FfDMdnDUYvvRFAiUSOAQ4S26eq8/lr+OgcMak13nbplAibRfxApyasOkzUVNE0bVej4JpAkfkN/
	gT4aSXjR5PA7855P5Jg==
X-Received: by 2002:a05:600d:2:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb55a581e6mr164572525e9.5.1794828506130;
        Mon, 16 Nov 2026 03:28:26 -0800 (PST)
Received: from localhost (p200300f65f19a9042c263c0c153a4e28.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2c26:3c0c:153a:4e28])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49d673ce75fsm15469466f8f.55.2026.11.16.03.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:28:25 -0800 (PST)
Date: Mon, 16 Nov 2026 12:28:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [linux-next:master 3784/7428]
 include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h'
 file not found
Message-ID: <avroMXSm8hiG1W4N@monoceros>
References: <202611160947.NOrZmI1p-lkp@intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5folxt6ljtu6yeis"
Content-Disposition: inline
In-Reply-To: <202611160947.NOrZmI1p-lkp@intel.com>


--5folxt6ljtu6yeis
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-next:master 3784/7428]
 include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h'
 file not found
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 09:45:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
> commit: cdfdbc11552b99dbc5c45c55f62a76527ffcc73d [3784/7428] Move struct =
cpu_feature to <linux/cpufeature.h>
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/2026=
1116/202611160947.NOrZmI1p-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c=
a14e3d05c4e63d6e8103945c86b958ed2f55d5f)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261116/202611160947.NOrZmI1p-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611160947.NOrZmI1p-lkp=
@intel.com/
>=20
> Note: the linux-next/master HEAD 84abb955b1015477aa11a96e2f3ac1b938b77f48=
 builds fine.
>       It may have been fixed somewhere.
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from scripts/mod/devicetable-offsets.c:3:
>    In file included from include/linux/cpufeature.h:30:
>    In file included from arch/loongarch/include/asm/cpufeature.h:13:
>    In file included from arch/loongarch/include/asm/elf.h:9:
>    In file included from include/linux/fs.h:5:
>    In file included from include/linux/fs/super.h:5:
>    In file included from include/linux/fs/super_types.h:7:
>    In file included from include/linux/list_lru.h:14:
>    In file included from include/linux/xarray.h:16:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:20:
> >> include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds=
=2Eh' file not found
>        6 | #include <generated/bounds.h>
>          |          ^~~~~~~~~~~~~~~~~~~~
>    1 error generated.

This is the issue that Sasha Levin already reported and fixed in the
thread about cdfdbc11552b99dbc5c45c55f62a76527ffcc73d, see
https://lore.kernel.org/all/f610c07f39df15f3e7ebdc63bfcd759ca7a687a8.179423=
3316.git.sashal@kernel.org/.
Nicolas claimed to have applied it already.

Best regards
Uwe

--5folxt6ljtu6yeis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr66NYACgkQj4D7WH0S
/k4pswf/RmI//KlVDYKhdyuKWPtJ8WKGW/CM2ZYfKGXlld02zgqVsK+EA/ksXDlw
gd6BggceGEfqs9InvoyIG7ZapDAmELpajI50WK5No3w0J3zbpkx7iMC8jZPjQjxH
rgoYPYv+RpJlHqMv46xf5nMqImnlCTftBX8dJZIiI5DrvOSYtRiu20rEJwb8uo42
IvgRCeQF/0Pm0cNz0o+JiCXI+LvnRpiQ1FtNGP/cPTG/68K9l0pZzwhar7XzNqON
SjdZeRAIp3RZxloqoFWDUcOB/nxokRYA4bIDVgV2CDtCZJ50ZsndddwVuzcD898P
9ioX7+hQ8XdCT3MKDynkU4Zi4Rg50g==
=TLBX
-----END PGP SIGNATURE-----

--5folxt6ljtu6yeis--
