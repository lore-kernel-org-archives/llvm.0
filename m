Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE123338939
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 05:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104281; cv=none; b=R9cPZ20rSQygV2dPDNzwUyn3NvJaSh1IgnvNepsMCAqLu/Pr4wPFSMOXaqWSx2uMHhEmS3D8EI7L8oiAM5jgXQ/6H6nIn4oW+XCrtAJ6g9saPVPl+P8gAofOt+t0sGdSf/b+aocy4rYLiZI5KI3mDSy/acvLWLINst7bSOvD0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104281; c=relaxed/simple;
	bh=K/lFXyXnlzmVr7ZpusjKtGIQx986K//AXPUXiJed/Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaTPZsMhYvw75V6TJUqGbPhlxUDB++cXSrKPPIxrPKLVd13KrlP+XpbOqNppUsayw7DGDHWxGVffjDZi+aCjjnd/qlE6V1LgCdAkAe10wcBFxAjcrYsUEXQ13bRq1wFZIMe6wMKi6/mZZVmaGxKmngWn/JS9ZVAk8I/w0T8W+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=JbPSjiN/; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="JbPSjiN/"
Received: from francesco-nb (unknown [185.12.129.179])
	by mail11.truemail.it (Postfix) with ESMTPA id 65D9822A64;
	Fri, 11 Sep 2026 07:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789104277;
	bh=HD7CwDSBdI7ApvW9myNSUssqtq9jDio3I05Sz3qKMAk=; h=From:To:Subject;
	b=JbPSjiN/w4LO9ADIbdIKV/vFf+H2SWOFS8oSWFQKzh0kkEmEYcB13lBle3Kq7WHAo
	 WJyVffgJeIcbtVWFM+wZIobEHtAbTcg/S8HA2TI3INwZwmVfSy5lW3CzMUC/NHgima
	 2UpgOO7EcyxRxRlHThqRfxuUGRZXVAZGTPNu45AhJaFILlEemwYWMvsKXLKHTxzEN9
	 Xhl4VaMtisNJTMuLbZPBSv9dodVRnOtylbZSVL/luVqHgE4BHjECsF8DiCD3QsOnpf
	 4ZCAr3TWcncmfn/oMCF4ojhGFOPbtBgCMtkimt3OXaHdqwB8+w9v0Algi1A0PpFMNH
	 Axg//UkbZ0wUg==
Date: Fri, 11 Sep 2026 07:24:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>,
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Message-ID: <20260911052428.GB5377@francesco-nb>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>

Hello Markus

On Thu, Sep 03, 2026 at 02:39:30PM +0200, Markus Schneider-Pargmann (TI) wrote:
> For IO+DDR the wkup_r5fss0_core0 and the
> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
> setup is done. These are used to read the lpm metadata region in
> which data is stored to resume. This needs to be done before RAM is
> in use to avoid overwriting data.
> 
> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
> ipc-firmware dtsi files and to the lpm metadata region nodes of the
> AM62A and AM62P boards.
> 
> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
> redundant with the dtsi-wide flag and is dropped.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 45ab9d947b3a..8976c0424cd1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
>  			no-map;
> +			bootph-pre-ram;
>  		};

verdin-am62p has the various bootph tags only in the U-Boot dtsi
(k3-am62p5-verdin-wifi-dev-u-boot.dtsi) as of now, I am not convinced it
is a good idea to just add this single one here.

Francesco

