Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E12BE7DD
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732100; cv=none; b=hWhPqAgM/IW9ErQ+ypcXoC2NgOESjHOXXocitoHKzSV2GFHk6NhKjK/XbRD4bLaIT3slnfWLV3L0YbkQzs7nq+bf4WYjLHrRaM2KVs9l77Fjw+HX0y+W9s+UMEFgEsUI3YdZPaUJt3e2eVAzPxtLjhr3A6b2aKptr2QWMLeqfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732100; c=relaxed/simple;
	bh=m27fUwmDcOIMRFZhehIIMk9kw1fQSuHQ/wfKC0E4cys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG9G7tapleLOoK1oLzMxIk2zZMCgPT/aBAQsUa/zspuhJ0banGJ9k2khDcBBQvKnDfVhLxGwGh4Bf5f3PyexluOqJcU8gFF9u2Tfzsb9b/4OeYUHl7cobkb7WSJsuicRXQpWxptbiaE7XmatHAN3Kqfd6eDmG/F1sK6+lxKtkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq0aMOAh; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq0aMOAh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so354700f8f.1
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732097; x=1790336897; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQ30eKDuAFR8JF1rGjUCcWlt9fc9x6ssQ8iWuG4SZKs=;
        b=mq0aMOAh2b4KJAKecrEwJueYgjdEGX3y5Jn1sDI2tUcRtfNftl8RZTPA4/sp5rlt3V
         ugAR33V1KefFCERIa/TpL/ugnvFQfbv+vOx9QDPdYLNCnc4QRh08uFvrUUErDLck4yFl
         26eNe+kxtJlLegN6roC7U+pEx+UjuvUw4rBk/tvIlFket33ySP8vfIaAEdZhn6BzPvP2
         rxFipMSX+8WDL5LuEol6CdtYN78lgpVYzZ/mrQzYN13fBA7j32hKYuUPy0Jmy8eIuq+l
         J4asRIXbtii6/C8qWTljKfjMBmRbSBlm0qK2V+UGufoo5ZgWvdSRyjTu1vR1awz7HaXE
         LF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732097; x=1790336897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQ30eKDuAFR8JF1rGjUCcWlt9fc9x6ssQ8iWuG4SZKs=;
        b=FRY3qtkXuOEr9uH4ugGhJJTp6KmPdLtHdBmEVJgvI8wINVbwQeFGKYwERxdIiOng6b
         ANOPK6PmlyqibgfxsS0MPAj52yne2ttnP+N3wf468f6pHywpYJLOAV0/P6BTjznzbUkI
         ftZ/I01000hq985WG0ykM1Iu9YgV2AdVA7KwnbCR57aL5pdZYJAD6oaDc/IMmSzOzhS6
         cM6Zb0fg9TwSoXKR/ahcRSVEQFP/0sAQaRVpLL7nEza7xS8iJ56wsk9sB7I5XG+jY/iP
         BY9L7sE1Q8CwrhDOSelKzvAOn3vVDMchdsJlXlxVqTQiGYzhJuQBReMkr7oKQVLIQph/
         U8jQ==
X-Forwarded-Encrypted: i=1; AKwUvByrV49z2+AjjybpXe3nrKTITUlzVUsskMxA/yeBfGDWq/s2RMidtGcKcgLtmCaJ4Vk6Sj3O@lists.linux.dev
X-Gm-Message-State: AFuF++ng98W4qjWV21TnN2HV/q+M9oIfDmc3T+u20aWzKkDEVy/axHgO
	lHbLnHggWYyD8pMOYNYO4GiHf8syu9+RoJ6xs4i8abnzwfsikKUgztX6
X-Gm-Gg: AYBFou3XtLexMsRU+MII86wInau5lknEsUYorRJzDun4vuAQ3EZUxN7+xm+3dReC9Ll
	ntSJ6jHzMfmqnS0tiIiL9c4sFw/w55VClNYW5RaEGnJKRRPVWRfm1yy35BJzPHT3hvkLK76xM9j
	PFbev0zAr6vxjEY9LmLa+iDlRFeFs45SvMJ3VKZgezJ+lJv/plEgFYbi0BQ1PL0gCNXG1LrrZTy
	QtIM8+twFzU7E10ZZDwrVQn1L1KoY8orm40YHt9AhPHEurr+lO1iwX7Cm98861SYJAumrezJJ8b
	tNbM1BXSvPZi+5+WIeUijWV7oeAPIZmcfLGy19NZ+ltme6OoF7QnncdwuOkBSI2jojZi4frXWgO
	ndqCxUMl+WPMP8jTT4TjKsAIZYswqGoeHrXOLcPLZup7WexPh/3tATL4DBhILtsz9u5fsiV91z8
	vny+8mo0O7TXYZCvKgkVj+MYeh3WLcuL50KmZ70roeYK1egFHNRCOAbgU7Tp5ogPyndDQxUiakB
	ktOdNZTkLQJpPyFzTc5PsY7yUYQfJx0nj4+/GM83ZeIOViEy9fK+esnFdlcSDl6XecyY9rNPAfT
	rzO1eda6vzz7Or5rbsoB2Gbh1BBR
X-Received: by 2002:a05:6000:25fd:b0:486:e8ee:11f3 with SMTP id ffacd0b85a97d-4871e269388mr3223709f8f.31.1789732096740;
        Fri, 18 Sep 2026 04:48:16 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff57926sm3338121f8f.14.2026.09.18.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:48:16 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:48:12 +0200
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
Subject: Re: [PATCH v9 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Message-ID: <aq0k_NyB05KTBs9f@Lord-Beerus.station>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-9-40972ef1f663@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-9-40972ef1f663@baylibre.com>

On Fri, Sep 18, 2026 at 11:17:53AM +0200, Markus Schneider-Pargmann (TI) wrote:
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
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 1 +
>  arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 1 +
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 1 +
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 4 ----
>  arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 1 +
>  8 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index 7fa19ced1a23..12be777a35ca 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -80,6 +80,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> index 94c1d60d8d7a..7beca54e75ee 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
> @@ -63,6 +63,7 @@ &wkup_r5fss0 {
>  };
>  
>  &wkup_r5fss0_core0 {
> +	bootph-pre-ram;
>  	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_ipc_region>,
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 871ec227def9..fe75f6b6b50b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -74,6 +74,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> index 7cba3ff99e6a..f87d6d515e2b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> @@ -800,10 +800,6 @@ partition@3fc0000 {
>  	};
>  };
>  
> -&wkup_r5fss0_core0 {
> -	bootph-pre-ram;
> -};
> -
>  &mcu_r5fss0_core0 {
>  	firmware-name = "am62d-mcu-r5f0_0-fw";
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> index 84dfbfd1986c..277d7e268cfe 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
> @@ -42,6 +42,7 @@ &wkup_r5fss0 {
>  };
>  
>  &wkup_r5fss0_core0 {
> +	bootph-pre-ram;
>  	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_ipc_region>,
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 45ab9d947b3a..62a518dbbdbe 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -183,6 +183,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index bb027c65eddd..39af098e4db2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -70,6 +70,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
>  			no-map;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> index 31f670fdd91d..2eefbd8d47a4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -84,6 +84,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
>  		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
> +			bootph-pre-ram;
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
