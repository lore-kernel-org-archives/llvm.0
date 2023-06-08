Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D54210960
	for <llvm@lists.linux.dev>; Thu,  8 Jun 2023 12:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686227325; x=1717763325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D3eGuNa1+BoSZIrVhFPmuw0PAOKIN8uK8gmRTqHfLG4=;
  b=b5Zo0HwgtsvCes7U2nsUuMFpE31Bxl3OqZc1V3knZRZ57k/f0l/YFRPo
   TaXnzikMM+GU46rjkIa+OFXiyBnyxZQTI21xhs8oFysEq5r5iao+yoVd3
   RwZA9c7wRdi5QWZODKVl/aDN+mbCOnhWxSMiyN+IXISdrh3xEH36PcFBn
   yRH/Pro3H7xPMkJ6DMeftlnG0bdn1CDKB9pmay/htdKEtToqB9V4vRXYO
   XbhcbCq7tMPzbupImC52xW69zjuveaT0nN9V+o1GtkOIDXmXQm2wESfms
   ovBjPVTemoRAm7ODR1QznfgMYONsEN2nYSRmGd3VhUbxPYD1TLViQDkCK
   A==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="asc'?scan'208";a="219411820"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2023 05:28:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 8 Jun 2023 05:28:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 8 Jun 2023 05:28:30 -0700
Date: Thu, 8 Jun 2023 13:28:06 +0100
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
Message-ID: <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
 <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HEkduUF7a/Zaoz5V"
Content-Disposition: inline
In-Reply-To: <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>

--HEkduUF7a/Zaoz5V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 01:52:47PM +0200, Miguel Ojeda wrote:
> On Thu, Jun 8, 2023 at 9:01=E2=80=AFAM Conor Dooley <conor.dooley@microch=
ip.com> wrote:
> >
> > I do intend revisting this, probably after the min. version for rust
> > gets bumped, I've just been really busy with other work the last weeks.
>=20
> Thanks Conor! That would be great. We are increasing the minimum
> version after the merge window to Rust 1.70.0 (assuming no unexpected
> issues).

Right, so probably I won't resubmit anything until after v6.6 then,
as it won't be in the RISC-V tree until then, by the sounds of your
timeline.
Gives me plenty of time to try and unravel the mess of libclang versions
and what extensions are supported by each tool. Not like I am devoid of
other things that need to be done!


--HEkduUF7a/Zaoz5V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIHJVgAKCRB4tDGHoIJi
0ikSAP9vwx3IhwT2YQBx4VTPuAhBIV9NLradoYYCFXuEPhuj0QD/TlPI2RbulZ9K
uWEHPxTMU46fCeYmbOUy5I7dtUUEwgg=
=ram8
-----END PGP SIGNATURE-----

--HEkduUF7a/Zaoz5V--
