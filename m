Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8583613D
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678193552; x=1709729552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=db3CujOdnnk4JvHTbGCquQDaWmCdFrEeKYWPbrMS3TQ=;
  b=crYrgKpw8RQDQY9Ms7Pf2vA5mztFXmP/OupoQMUIDxXjWmDPxWAHTNLn
   R1Wrr+VZY72lnqaltv0wXE5b4fUJH24sWnkdqp7b0MnAYpujaG5GrcSm1
   +6og5tCbKXr6qo2mZC2RUWxqBA/L5Inb0l2ktzMu1wc+ZiXmrhiaNO5oQ
   ZPEBT4KlMXGBm3FSonhiAgb/xxGP9LbmdC1Y49D1aLD1JDM23PA8x4XMh
   yqvbjsXSd5d3BF6Qwpgbk1Sfm3tUG5wShZKOPoILcvzPhCuAXNDqNiprK
   i7/lqg4A7KhXFXb3AmuDeyjb4HQBnwL86IFbC9ZbPdtzrhXxkOX+/Mlj2
   A==;
X-IronPort-AV: E=Sophos;i="5.98,240,1673938800"; 
   d="asc'?scan'208";a="200357617"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 05:52:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 05:52:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 05:52:23 -0700
Date: Tue, 7 Mar 2023 12:51:55 +0000
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
Message-ID: <36af5bd6-883c-4968-8ace-2e31ec51907d@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230307102441.94417-3-conor.dooley@microchip.com>
 <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
 <ZAcZeWYUU75BK5FO@wendy>
 <CANiq72kz2qxsB9JG7OB02KMAfy-YvokCFWMuEj_bkaY8i5tdVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OghjveGlJgfPwijn"
Content-Disposition: inline
In-Reply-To: <CANiq72kz2qxsB9JG7OB02KMAfy-YvokCFWMuEj_bkaY8i5tdVg@mail.gmail.com>

--OghjveGlJgfPwijn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 12:56:30PM +0100, Miguel Ojeda wrote:
> On Tue, Mar 7, 2023 at 12:01=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > Cool. Git should resolve that, probably without even generating a
> > conflict in -next, right?
>=20
> I think it will conflict.
>=20
> Since the cleanup is elsewhere and it may add work for the -next
> maintainer, it is probably best to take it out in v2.

If you think it will conflict as-is, it's probably gonna conflict either
way.
You've pointed out several small bits, I'll send a v2 in a few days.

Cheers,
Conor.

--OghjveGlJgfPwijn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAczawAKCRB4tDGHoIJi
0q2zAQCGrMXmp1otmx9KctfrHf1Ol5KJTxzDmuBtPfHgBLOgQAEA74Ce5Fhsb+MK
1rRf0Dnx0FHgQLhpzxjlfV51kr0qUwc=
=QvX9
-----END PGP SIGNATURE-----

--OghjveGlJgfPwijn--
