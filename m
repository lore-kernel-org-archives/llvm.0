Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC77933D2
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678186985; x=1709722985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=297I+f2QIP3fYjyaueh8DMg0UU/5q5ZcWqC31Xzuzco=;
  b=MY4W9G3xaQo3dNwyD8TKMlj2DTdtBO7RddivFsie42s/LIDZPRqcbv/n
   QH7NwewjRHjXci2c9ZnisUgcP5kXtC3ppzwXXTwMVPHbh+aStarzMwwZr
   HAVVgmy29izQKboOXKapMHNZ/WTFkGUaC0YaDY6uHUVVGeHLEZ60OxT0z
   RkAi5IQW7OEZ6I0edhQC/19paKhw/mN/+tgbPy4RU9GZUr6Ul0X8bjFoq
   FkSfjQoTDktycGJBal3J7nj3SQDd8e651K7s5aby0SNHzYtjknqwIRF1Z
   PAdFU/EEhkpw71jUAwigPfdpKunZVdV/9Nzwq5fKH7TStrKYdRpu8Dxzb
   w==;
X-IronPort-AV: E=Sophos;i="5.98,240,1673938800"; 
   d="asc'?scan'208";a="203976780"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 04:01:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 04:01:46 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 04:01:42 -0700
Date: Tue, 7 Mar 2023 11:01:13 +0000
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
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust
 support
Message-ID: <ZAcZeWYUU75BK5FO@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230307102441.94417-3-conor.dooley@microchip.com>
 <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FkEia1k7ZMsXTyfP"
Content-Disposition: inline
In-Reply-To: <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>

--FkEia1k7ZMsXTyfP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 11:56:30AM +0100, Miguel Ojeda wrote:
> On Tue, Mar 7, 2023 at 11:25=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > While adding RISC-V to the table, I took the chance to re-sort it
> > alphabetically.
>=20
> For reference, there is a patch for this coming at:
>=20
>     https://lore.kernel.org/rust-for-linux/I0YeaNjTtc4Nh47ZLJfAs6rgfAc_QZ=
xhynNfz-GQKssVZ1S2UI_cTScCkp9-oX-hPYVcP3EfF7N0HMB9iAlm1FcvOJagnQoLeHtiW3bGC=
gM=3D@bamelis.dev/

Cool. Git should resolve that, probably without even generating a
conflict in -next, right?


--FkEia1k7ZMsXTyfP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAcZeQAKCRB4tDGHoIJi
0iWbAP9z3UWgpmmPL9iCnUOvG6wdr7hbXIjO7rXRgnhbqt0fkwD9HQMjWbIh05Hm
OgvH3JO4XhG7ZCQ2aWRBhDWQ86BUSAM=
=cBqK
-----END PGP SIGNATURE-----

--FkEia1k7ZMsXTyfP--
