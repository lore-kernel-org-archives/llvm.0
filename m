Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D117980
	for <llvm@lists.linux.dev>; Wed, 29 Nov 2023 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8H9M-000510-Mf; Wed, 29 Nov 2023 10:46:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8H9L-00CNFD-W4; Wed, 29 Nov 2023 10:46:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r8H9L-00AkXS-N4; Wed, 29 Nov 2023 10:46:31 +0100
Date: Wed, 29 Nov 2023 10:46:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: gregkh@linuxfoundation.org, sashal@kernel.org, bhelgaas@google.com,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 5.4] PCI: keystone: Drop __init from
 ks_pcie_add_pcie_{ep,port}()
Message-ID: <20231129094631.msxnslknitdmmeif@pengutronix.de>
References: <20231128-5-4-fix-pci-keystone-modpost-warning-v1-1-a999b944ac81@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hvkbhzkvzu7w6p6o"
Content-Disposition: inline
In-Reply-To: <20231128-5-4-fix-pci-keystone-modpost-warning-v1-1-a999b944ac81@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--hvkbhzkvzu7w6p6o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 05:35:17PM -0700, Nathan Chancellor wrote:
> This commit has no upstream equivalent.
>=20
> After commit 012dba0ab814 ("PCI: keystone: Don't discard .probe()
> callback") in 5.4, there are two modpost warnings when building with

I'd do s/5.4/5.4.262/ here.

> clang:
>=20
>   WARNING: modpost: vmlinux.o(.text+0x5aa6dc): Section mismatch in refere=
nce from the function ks_pcie_probe() to the function .init.text:ks_pcie_ad=
d_pcie_port()
>   The function ks_pcie_probe() references
>   the function __init ks_pcie_add_pcie_port().
>   This is often because ks_pcie_probe lacks a __init
>   annotation or the annotation of ks_pcie_add_pcie_port is wrong.
>=20
>   WARNING: modpost: vmlinux.o(.text+0x5aa6f4): Section mismatch in refere=
nce from the function ks_pcie_probe() to the function .init.text:ks_pcie_ad=
d_pcie_ep()
>   The function ks_pcie_probe() references
>   the function __init ks_pcie_add_pcie_ep().
>   This is often because ks_pcie_probe lacks a __init
>   annotation or the annotation of ks_pcie_add_pcie_ep is wrong.
>=20
> ks_pcie_add_pcie_ep() was removed in upstream commit a0fd361db8e5 ("PCI:
> dwc: Move "dbi", "dbi2", and "addr_space" resource setup into common
> code") and ks_pcie_add_pcie_port() was removed in upstream
> commit 60f5b73fa0f2 ("PCI: dwc: Remove unnecessary wrappers around
> dw_pcie_host_init()"), both of which happened before upstream
> commit 7994db905c0f ("PCI: keystone: Don't discard .probe() callback").
>=20
> As neither of these removal changes are really suitable for stable, just
> remove __init from these functions in stable, as it is no longer a
> correct annotation after dropping __init from ks_pcie_probe().
>=20
> Fixes: 012dba0ab814 ("PCI: keystone: Don't discard .probe() callback")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hvkbhzkvzu7w6p6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVnCHYACgkQj4D7WH0S
/k59agf/d/ViUF9KqldUBQ+M8916KC10q0nvxu4cPYq4HovsOS04DwEN4ZasYJ6b
OiPqTI7y1EJ+KDZbT22pMZlXB86AjrB9wX4SjReBJdeCzEoRf6+iwDdWNVxtdnwL
MLY3LM95jReVLdZigFE7PYSgHpUdotP+nCPtXw05aI7Izri/9TcXfPQGaU7SwTBu
ydsNPlcJvDptzxBBHXMVkxPxhHG67an2o6OIQh4oi3KDX3pnTmEafbCBEGDR+Xyx
8t+jqC+9Nyz1cAFZK+k+w2xwm5WWJ7XqHYq155OSg8JGtag/dHDtemx5SnAiCh1L
CaCoBiApMK+vCgfmP/vmxcHxrv1fbA==
=ul9g
-----END PGP SIGNATURE-----

--hvkbhzkvzu7w6p6o--
