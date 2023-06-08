Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D533137F
	for <llvm@lists.linux.dev>; Thu,  8 Jun 2023 07:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686207712; x=1717743712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZLdqZM7DUuJb+zfCqM9sRlIRP3z6YOCxQmfCfYvk1o=;
  b=qnyycx72y7olbfTd0AnDKnUV1++83viKsZw8Fgt5mFxfYRG+FoHR29Fv
   xy0Ziix0+EpTJZhH1C5N3RWyq/neBUfy+b9gjSvjIoP3gZ+dacET8kF9Y
   8gS6Jp6XrjPFonp+j86Q6a/M5aW0IZIii9kCvRUVpuIu2CCP+iiEjQJwn
   6QPDhx77S9cgUa8+/SY9YMsQAUcn5JPIWnwouCc+cJOFusECHwxlG4in4
   0C6wuWPnNKXXnrAFyW1OhE+Ms3ZlR3dmD835WZ16uzWNRoQWK3G1XURKj
   QI9P+cuLNdrjuTuRo4wDyA2u3Kl4V9CjsdRT64P0AGQgf9RqpDpWqzOG3
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="asc'?scan'208";a="219382726"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2023 00:01:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 8 Jun 2023 00:01:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 8 Jun 2023 00:01:40 -0700
Date: Thu, 8 Jun 2023 08:01:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ka1WzDdcwslcLLPy"
Content-Disposition: inline
In-Reply-To: <20230307102441.94417-1-conor.dooley@microchip.com>

--Ka1WzDdcwslcLLPy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Kwang,

On 08/06/2023 05:46, =EC=86=90=EA=B4=91=ED=9B=88/Tizen Platform Lab(SR)/=EC=
=82=BC=EC=84=B1=EC=A0=84=EC=9E=90 wrote:
> Hi,
> Recently I'm trying to put a rust patch on the risc-v board.
> I saw a patch [1] and looked through it roughly.
> Only if llvm(not gcc) is allowed, it looks good with no major problems.
>=20
> > I'll revisit this when my thoughts have settled down.
>=20
> If you let me know the problematic part, may I try the patch?
>=20
> [1] https://lore.kernel.org/linux-riscv/20230405-itinerary-handgrip-
> a5ffba368148@spud/

Yeah, you can definitely try this or the downstream rust-for-linux
project - both should work well on RISC-V.
The problematic part is figuring out what ISA extensions are supported
by the rust compiler being used (and by bindgen), and deciding what to
put in -march as a result.

I think it is unlikely to matter for you, unless you're aggressively
mixing versions for different parts of your toolchain.

I do intend revisting this, probably after the min. version for rust
gets bumped, I've just been really busy with other work the last weeks.

Cheers,
Conor.

--Ka1WzDdcwslcLLPy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIF8rgAKCRB4tDGHoIJi
0k0tAP9oSP5G1PJWtLGyf1+R6tsih6t/Fcf8f5aQBdxxrsXn/gD/UYOgt9r9Nkht
w/d+pWUDXdDuNyfeTgh/x6BfVqn+TAo=
=QM1l
-----END PGP SIGNATURE-----

--Ka1WzDdcwslcLLPy--
