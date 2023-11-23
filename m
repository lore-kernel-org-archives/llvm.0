Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA382FC3B
	for <llvm@lists.linux.dev>; Thu, 23 Nov 2023 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dCFGNmbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700749492; x=1732285492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ohvzPpwHho+Wozsk3IfdLQvS5IQE5RYHnNIM727nKM4=;
  b=dCFGNmbB65Kg2N/Hd1EBYYBItJopyS2Vp00sNHyzvbeFjM4to7sGi2oj
   xmIyxOSotp0nox/vN3VUWhhUElgmMQuiv3HWIGl1muCqrWIdbd6+9iusK
   ot+65fB9d7H5nyheyXEYDjB5XB9Arn/TOIBs1Hk9L8WIggOQ7pMNS0t1t
   qP0qGrfrRyI+EgAJbbY8Lz7xb28akwLk9AQzZPOYdpa/xW+wxGYQbb5V2
   Frrc1uS7ArkIQT3yXMLx+hdBUKXItwyzv4OR3MzUdlSm5vRnN0Exp+t9w
   v6wrkurMuvAKrt3P5y+MOwc1810O8JIDaLDcZRKGrzDV23D79M+rr+sGQ
   Q==;
X-CSE-ConnectionGUID: PGZ2z8fJRMa+agPdtt+bKw==
X-CSE-MsgGUID: EwqpIQk1Qom2mh0R2QGlFQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12194934"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:23:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:23:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:23:29 -0700
Date: Thu, 23 Nov 2023 14:23:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Harry Wentland
	<harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
	<Rodrigo.Siqueira@amd.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, David
 Airlie <airlied@gmail.com>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Pan
 Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	<amd-gfx@lists.freedesktop.org>, <llvm@lists.linux.dev>, Nathan Chancellor
	<nathan@kernel.org>, <arnd@arndb.de>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231123-headdress-mold-0dd7a74477f7@wendy>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PT94HBO7SSDOZxaP"
Content-Disposition: inline
In-Reply-To: <20231122030621.3759313-4-samuel.holland@sifive.com>

--PT94HBO7SSDOZxaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> architectures. Enabling hardware FP requires overriding the ISA string
> for the relevant compilation units.

Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]

Nathan, have you given up on these being sorted out?

Also, what on earth is that function name, it exceeds 80 characters
before even considering anything else? Actually, I don't think I want
to know.

--PT94HBO7SSDOZxaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9gRQAKCRB4tDGHoIJi
0jEnAP9OKVgfXZxGyPpXzUcsNSne5N1ezJDKqBB32TBdrtW7vQD/Sd98JmdWJ4g8
Labru0YLH7jrvDUwLAIAnldCPJQbfAw=
=HKiT
-----END PGP SIGNATURE-----

--PT94HBO7SSDOZxaP--
