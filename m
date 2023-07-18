Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6247E2;
	Tue, 18 Jul 2023 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1689675996;
	bh=nRbBE6dIpgDUilr8ZuaHONMIcYRzKhmkbNXaA/Q0QN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fR4m2XPaVoa+PXxOZYWdLtasFHCZ24EzCs7Mi488iSBjO/twIoZa1LhQmEjRKPoNQ
	 RJ30/0KgWvEWlppNSYgZaO+dPCx/GLHesL+Sal1guFh7Pm2qQswSmTaIAFS5zjFTG7
	 NmtmGz0Fod6S8pPxivPw9pV+Fuf11ZE9BRF8pFuVBtEZRZVpLlXVL9edPtuxXte8gC
	 QOSer+fvpm61J9FTzk2eH8djOWaUWezvvTcTR//7O1JuOZRiDe7Kb6DQoTXXd0ndPU
	 vaRT/JEEtUp/RD6+j90xBIFprEwA9eK+rwAUWH7aSXgOo8DtWKZ9pARg3ITuJ8Eo/A
	 OlwtGcAGz57qg==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4R4w975h8pzyNw;
	Tue, 18 Jul 2023 20:26:35 +1000 (AEST)
Date: Tue, 18 Jul 2023 20:26:33 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: kernel test robot <lkp@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Hu Haowen <src.res.211@gmail.com>
Subject: Re: [srcres258-doc:next 1/1] mm/memory-failure.c:1891:6: error:
 redefinition of 'is_raw_hwpoison_page_in_hugepage'
Message-ID: <20230718202633.7578c89e@pine.rothwell.emu.id.au>
In-Reply-To: <202307181715.0dwDb1O9-lkp@intel.com>
References: <202307181715.0dwDb1O9-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OsN=gRtltWiRkWk5KPRaBED";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OsN=gRtltWiRkWk5KPRaBED
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 18 Jul 2023 17:42:05 +0800 kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://github.com/srcres258/linux-doc next

This is not the linux-next tree.  It is a tree that merges linux-next
every now and then which is *not* how to work with linux-next and will
create lots of merge conflicts which may, or may not, be resolved
correctly.  Please do *not* report any problems with this tree to me.

--=20
Cheers,
Stephen Rothwell

--Sig_/OsN=gRtltWiRkWk5KPRaBED
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmS2aNkACgkQAVBC80lX
0GzbQAf9EqXD7oIxTiG3Hwzg0iEw5FWLNuzPkLZ2j6ZdhBkLR7sLI5NdIjCQCx74
KZTzRlxoUr3VWfPM3MC16EesD+EwbpEmqd1MZsBat7+RQTK/gI40/BdcjULJ6gda
0NKAKmK3IgupZjI7tVYbDvOIrJtzrpDGhe3gooQM9le1r9wRn3zm2UCdqjCXzn0R
wQW9VlsGlJwtLNBSofg5YtrycVMIcCa0jMCRbGL0dgMqB9bxjh0iySXPOZIQ+MQB
ZTzeTheF0oyf0WI3N/VwSrEgJrpYA+9BCYvxfgt100UxATdFVUa9yibPjBjhgHzU
RNmNup8uycQ/cvvjMZbBZbCfwrZRfA==
=Vjju
-----END PGP SIGNATURE-----

--Sig_/OsN=gRtltWiRkWk5KPRaBED--
