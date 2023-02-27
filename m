Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED636AB3
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677505408; x=1709041408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8kKgrBjxWQyCV0wZXde3NVGF5SDI0kmpRoxcky0ObQ=;
  b=p1IaZ4apEVG39AHSao49Vuo5v5vedUn57LrlF2oG4pEugtMdNpko8OzR
   ZWhUU6G2nIC4TgTRohd9jCbfLXL6//7aPJKMyWLhtMIxKXac9YyAMMnFt
   3FACC1ljVKTDYgJIOecuE8FB229MVHOYhQOTgY39BD73wi+SEB4qP+8YR
   QeWoUP3PQAzh8StLuDFhA5CUmDxfCXwFLmaAvEYX9KjMx3sddJR0RzIhK
   +8LIiFlMrAWSjOEAeG4en4wwm8NV40173ENyMA5iHIdSpjKXmfhd6KwRi
   zBREdSjx1UhG23Xt4/SgVEGmlWUlwLoYo+lbVtd5H4xe9PSFcmC7Yq9M+
   g==;
X-IronPort-AV: E=Sophos;i="5.97,332,1669100400"; 
   d="asc'?scan'208";a="198931385"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 06:43:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 06:43:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 06:43:13 -0700
Date: Mon, 27 Feb 2023 13:42:46 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Ard Biesheuvel <ardb@kernel.org>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, <nathan@kernel.org>, <llvm@lists.linux.dev>,
	<ndesaulniers@google.com>
Subject: Re: [PATCH v7 1/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <Y/yzVv717htZLuRY@wendy>
References: <20230224100218.1824569-1-alexghiti@rivosinc.com>
 <20230224100218.1824569-2-alexghiti@rivosinc.com>
 <Y/yilORflGv3vXjX@wendy>
 <CAMj1kXGCkqpHY7rHZv0EFKhPNk6jpbh1OfG_Jm3vSW8c5Y+9_A@mail.gmail.com>
 <6bd8012a-7311-7956-b0ae-966b8534a64a@ghiti.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i8ZwX1OEi/syzAPO"
Content-Disposition: inline
In-Reply-To: <6bd8012a-7311-7956-b0ae-966b8534a64a@ghiti.fr>

--i8ZwX1OEi/syzAPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2023 at 02:27:11PM +0100, Alexandre Ghiti wrote:
> On 2/27/23 13:56, Ard Biesheuvel wrote:

> > Note that we switched
> > to --orphan-handling=error on other arches, as the linker sometimes

> It seems orphan-handling is set to "error" only when WERROR is set (see
> CONFIG_LD_ORPHAN_WARN_LEVEL).

My CI explicitly disables CONFIG_WERROR for allmodconfig builds so that
it can run with W=1, it is indeed set to "error" for regular
allmodconfig runs.

Thanks Alex/Ard,
Conor.


--i8ZwX1OEi/syzAPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/yzVgAKCRB4tDGHoIJi
0v7sAP97bImU6hzDN3fw3MI74GR1HLzo1JA7yvIRvToGW+BFVQD9E0SqjMsSvsa0
8IM3znP8VY/yIXWltmbmNqpvKDHp5QI=
=46Kj
-----END PGP SIGNATURE-----

--i8ZwX1OEi/syzAPO--
