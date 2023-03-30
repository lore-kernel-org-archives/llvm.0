Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3314C2EA
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680167534; x=1711703534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ro+17oDK7rnlBrMsXFzotd23YydUQ9691qY+Ptq0G7I=;
  b=2lOg1V9L5Qx19sCL99rggfbk+LfSCwcrGah7K7VuWIlvjbbC/K+5yBl5
   ef2lmTJoy7u5MwyQYPNuDTuFhv54UPe6hPEPOg4qeH9WQmSgW12045Jrk
   J46vCrDPqFKHlVS8l/cAmX3ttv1LYNs8CAaVWRbEa/aHhdg58tuHQY3ul
   1WmPmioNpfRgN100MILPQFFNYqxVVYlVUBD5/IUjceBc3xMbx4DbfHc60
   6MVgIQSxp/HafHTKZH5/Fl1eAcYT4RdOo005OGLilkhPz0uj7v1hfrNtn
   gLBV6uVRBC9QjuAjWzRodoBaEfSyUEUDnF7wGz3LujUvpKznUjgWslV8o
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="asc'?scan'208";a="218661930"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Mar 2023 02:12:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 02:12:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 30 Mar 2023 02:12:07 -0700
Date: Thu, 30 Mar 2023 10:11:53 +0100
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
Message-ID: <b5fba6b3-177c-4325-905a-8f9f633a592a@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
 <a6220e52-9934-422b-9b05-95705b8fd684@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3sMGWrE3WbodPTsC"
Content-Disposition: inline
In-Reply-To: <a6220e52-9934-422b-9b05-95705b8fd684@spud>

--3sMGWrE3WbodPTsC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2023 at 09:23:45AM +0100, Conor Dooley wrote:
> On Tue, Mar 07, 2023 at 12:07:29PM +0100, Miguel Ojeda wrote:

> > By the way, like for the Arm patch set, if you end up doing a v2,
> > could you please add the `BINDGEN_TARGET_*` in `rust/Makefile` (GCC
> > builds are really experimental, but since they are there anyway, it is
> > best to be consistent and add it).

Hmm, so I came across this commit while looking at that:
https://github.com/Rust-for-Linux/linux/commit/cfc17fed52b9585e2f19e2381bfb7094561b8027a
(rust: bindgen: ignore RISC-V extensions for GCC builds)

I don't want to add even more workarounds for this sort of thing,
especially as in this case it is outside of arch/riscv.
The extension stuff when mixing compilers is such a massive pain & given
this one requires Rust it's even less likely to be tested when someone
comes along and adds some additional extension support that appears in
-march :(

I'd rather do this in the RISC-V Makefile so that it does not get
forgotten.

If my understanding of bindgen is correct, we don't actually need to be
honest to it about what extensions the rest of the kernel is compiled
with, only make sure that it is not called with arguments it does not
understand?

| bindgen_c_flags_patsubst1 = $(patsubst -march=rv%_zicbom,-march=rv%,$(bindgen_c_flags_patsubst2))

This one is no longer needed as of 9a5c09dd9701 ("Merge patch series
"Remove toolchain dependencies for Zicbom"").

| bindgen_c_flags_patsubst  = $(patsubst -march=rv%_zicsr_zifencei,-march=rv%,$(bindgen_c_flags_patsubst1))

Oh and clang-17 is going to support both of these, and Nathan and I
already spent a bunch of time fixing the fallout from that!
It still functions correctly without having them passed, but I have
heard requiring these may become the default at some point too.
What's done here may end up needing to be dynamic, but that bridge can be
crossed if/when we come to it.

What version of GCC do I need to replicate this? I can build tip-of-tree
gcc if needs be.

Cheers,
Conor.

--3sMGWrE3WbodPTsC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCVSWQAKCRB4tDGHoIJi
0qpsAQD93N6ZELaSuCLnFRRrVX6KqM1buvhJrxpnIPixxEBkYgEAtdX2bVK2gcK0
Nb8PM/km+TWTR+ljihbHfIH7vEsl0AE=
=NGwF
-----END PGP SIGNATURE-----

--3sMGWrE3WbodPTsC--
