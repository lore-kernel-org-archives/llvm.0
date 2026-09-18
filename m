Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE492BE7DD
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732062; cv=none; b=Xoz8QTzRtf/rWDdd2MjQ4mdursVlPSXaJgzQAAG9VvwnVSbtuYZyqDSjHS2iDGCUlisLLwdISzAlKIGwpWrQyEh8t0ol4GDg8xNk70KACuAc6eOtzGAHndCOZ3ijW+yMm1taxt2BjTcxf3bXAssoaoJNCyGiObzuJ+tjMzY7pAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732062; c=relaxed/simple;
	bh=w++8PWWehfnmLkOZRh89N4vWV1F11H459vhWHV/QVWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTWIN6FAWuhEuclMn1bMxSJ3zEZsgGK8I6r6v/FHgvCKPYj9qm7Z1N4+36qoCimmzWZW004WmoPZNbcGHPyDy/71F+WRYxCUaSOcWwDrNZZA8Uz4EGfqfGLEUeNwkb2REgBbZitpaHCE/QdFZc8e7F4X9C7N0RM+CYY/RQxrocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhTkNX83; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhTkNX83"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so387443f8f.3
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732059; x=1790336859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C1yOhNj+ElbGyi6lRuftaQi3PCdfbzJzEZ9LGMpAJGw=;
        b=FhTkNX83Y9uMr9HPJPyiVq43mnnUuxxGdikiBmTTvIbrg+tR+a+Vh/X0RRRDNSiBNC
         eAHb88veQwXjeT3CgaCmTY6yVYMhC7XMWNwPulZ5p6Lel4PN/097Lj/TxbFZpQcDrWWK
         mXgOMzZXUhMq3SH9QMDFmY64KOJEiwmHs96B5DDXi9F6Ak+pzab5nhp8IySo/SLjpdeo
         nuptHrr/kJ++8sfZEbkK+5gcsJGrR4VfmH1EmEEpZs0PCUbpmQNQXC2bDeIx7gr4U8uA
         kHjuveQWvN6nE6pwjPrsMOebovFOaCqvVS94DyqVNLKi3U6m7mEByYjpg39CbjdUk5LE
         Q1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732059; x=1790336859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1yOhNj+ElbGyi6lRuftaQi3PCdfbzJzEZ9LGMpAJGw=;
        b=F6eChR/ydNYgM0lEptzhys60jh3HXrk4obBnLKjRI23z110nrlkT/74aNd/olQl6mh
         nYEUj7ign6sWH5lwsTtIBLPUzhSCjrMtspcIFqLWoYj0yDa74WvIyMn8INtOs7CEJblj
         KRwLxcvrlCChstq+8r9y2WUNCzP+ZFFlhg037rf7QpQh9CidLnR4cuJ0I+C796u5FwEq
         +aCFipS7qbtYX/pelHRb8/kD4z8ctyVWfFPdoF2Typ3QIkW52sUvp75x2SbFNBpfDMgc
         YnUqdCSMuPqeNQswkqlzQ8W8cldV3ZP2CcsTR1sqZQ2jUtyeTdrR9z3gnz7h6blRLHNf
         BKow==
X-Forwarded-Encrypted: i=1; AKwUvBysQ+zJbajXsm3YJytJiHbs9rwy4+K73Lb+j8vJ3MIPOpUOylIAO767EEbbD1BvMstaZcW5@lists.linux.dev
X-Gm-Message-State: AFuF++nQ64zw08pRCc5iranW0nxDMEWe+9GukC34RGLASatg+0O6HIxc
	B+8CCVKGlLhTmg8NHpRROkdnOYSYkfDn3B0ViUcU+OH3DarT16ILPyXK
X-Gm-Gg: AYBFou1L79MuATPIW5DfFIxlcvF7nfN8efZZv7BdxRRYglfDl76Z2EUDxNde+bC6w2h
	LTVxeXPRvM31ApOezp9A0BeRxf6fFdhrg8a71YSHSFZIebPmkcOy5NY0i/qEA36iAnlZ/WB0Zub
	FHxHZsPY+BcMfeL8qHls8hx4MhlWo8SVCWqxdACpV4M0FJtcEKxjt2s1xMNmvvA2qPmARYANSDU
	s8WiEoGvpVbojVN8C9/9OxU+506vJXJLaX+/E5iiEgaQeA1UdjgBYHZSM0QZdDOq7jnnhBzQtRZ
	+yalXC6m5eaGykEn0+vZatXhruCIUQr/8IbA8lfHZC7zwYZjJo1DJm1CSPFbN8yX1KatynQnS75
	rmF4mVo8H5/pfMQEBBcv5ZuaE23OP2X++xDwqSCKH2G9vZ6cvO/J5awbDPrBPr3TWAQh/OzkeGY
	0H4DVbVwf3EB5tnYLI3c+rub/h13aRs5rQufG2tBi5VwJO5K/3GsaymTO6cS/acQi6zkp/1Ke9G
	M5qhyTJzFf6ktH7bHtLd1re8br9GltuQU2xipdGHkJn2Picva4MR8H4e3fFvI5+eOEru4kbC5fC
	g5rYYAOMYPvkR4cu14HuF+86WhF2
X-Received: by 2002:a05:6000:4b05:b0:487:981:4df7 with SMTP id ffacd0b85a97d-4871e227b08mr2783305f8f.25.1789732058399;
        Fri, 18 Sep 2026 04:47:38 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a8easm3594854f8f.9.2026.09.18.04.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:47:37 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:47:35 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
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
	Nick Desaulniers <ndesaulniers@google.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v9 8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
Message-ID: <aq0k110MlZs4-Frx@Lord-Beerus.station>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-8-40972ef1f663@baylibre.com>

On Fri, Sep 18, 2026 at 11:17:52AM +0200, Markus Schneider-Pargmann (TI) wrote:
> Split the firmware memory region in more specific parts so it is better
> described where to find which information. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data.
> 
> Reviewed-by: Bryan Brattlof <bb@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 10 ++++++--
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 28 ++++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 28 ++++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 28 ++++++++++++++++++++--
>  4 files changed, 86 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> index 5d7f701420e2..84dfbfd1986c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> @@ -44,8 +44,14 @@ &wkup_r5fss0 {
>  &wkup_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> -			<&wkup_r5fss0_core0_memory_region>;
> -	memory-region-names = "dma", "firmware";
> +			<&wkup_r5fss0_core0_ipc_region>,
> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
> +			<&wkup_r5fss0_core0_lpm_rest_region>,
> +			<&wkup_r5fss0_core0_dm_region>;
> +	memory-region-names = "dma", "ipc", "lpm-stub",
> +			      "lpm-metadata", "lpm-context",
> +			      "dm-firmware";
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 8a5ff5c45757..45ab9d947b3a 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -168,9 +168,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01d08000>;
> +			reg = <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
>  			no-map;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index b8af9ec81b0c..bb027c65eddd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x1d08000>;
> +			reg = <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> index 3d1a2c5bc464..31f670fdd91d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -69,9 +69,33 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
> +		wkup_r5fss0_core0_ipc_region: r5f-memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01d08000>;
> +			reg = <0x00 0x9c900000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca00000 0x00 0x8000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9ca09000 0x00 0x97000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dm_region: r5f-memory@9caa0000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
>  			no-map;
>  		};
>  
> 
> -- 
> 2.55.0
> 

Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>

Best Regards,
Stefano
