Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42341C31
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680164647; x=1711700647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBoEmEO7Dj8b7NzG7TSXvuV5ruIHbv+zWUEtKVANFTE=;
  b=dHAmqw3QRUVe+jCXOD+woxlULdkcAkuV4FN270eDJQwHyZZ6aIfRBTst
   d8H008LLbBvN2YAnkOX7pxsbjxbJFTnAA965Zqy4whi2m7NJxkDX6YZBP
   URIVPdPaFGBMkHMq8Huye8H9jiGKMF2b2CKSO2kGzpTzzX0fVjrCBbaq1
   pOAgxnZZiMSjgV0BzvStSoglYmUp9Rn1jVJktyWRNUT6gmS6LtGDy5/Q3
   5zHs65tpOs6V+d0n9oqwR6UOcERvpsHS7PlFwcJlyvp/U2Tj1O/GM6Kac
   FL5B1ssQKwieu2eWsGqc7NymnF+uptM3+ZRbcG5a/ADzwi0wURArNkrEh
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="asc'?scan'208";a="204161151"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Mar 2023 01:24:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 01:24:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 30 Mar 2023 01:23:58 -0700
Date: Thu, 30 Mar 2023 09:23:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <conor@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <a6220e52-9934-422b-9b05-95705b8fd684@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YyN1dM7SJNHGwojV"
Content-Disposition: inline
In-Reply-To: <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>

--YyN1dM7SJNHGwojV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 12:07:29PM +0100, Miguel Ojeda wrote:
> On Tue, Mar 7, 2023 at 11:25=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > I have added SoB's too, but if that is not okay Gary, then please scream
> > loudly.
>=20
> Note that `Co-developed-by`s always go with a `Signed-off-by`s, i.e.
> it is not possible to add just a `Co-developed-by`.

Aye, but that does not mean that I am entitled to add someone else's!

> By the way, like for the Arm patch set, if you end up doing a v2,
> could you please add the `BINDGEN_TARGET_*` in `rust/Makefile` (GCC
> builds are really experimental, but since they are there anyway, it is
> best to be consistent and add it).

Sure.

--YyN1dM7SJNHGwojV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCVHEQAKCRB4tDGHoIJi
0sZQAQCUXauXvBSo3TQBU7zir2CymSgO+QWCV5+jRW9nEMhawAD/bfruWxpKJBpY
m9CRaroRiPS0CZfC4rp/1I2j2aRuSQg=
=eDKb
-----END PGP SIGNATURE-----

--YyN1dM7SJNHGwojV--
