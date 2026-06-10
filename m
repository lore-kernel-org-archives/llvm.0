Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55E3382374
	for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075498; cv=none; b=OE2mlvBS3Y/mDyja0CeM72AKqmWoNNaPUGTX+kZ+nLAZvz1/GccR+Nk9hGMZcrdAt02JWX0UPCBab2JCba9HXM/99pWHmzssLzdHbIVXfWRNK/G5dX0yEPGpL3RriwbYSjftDg3jJaGxY+4TvGsfsmsBK8CwST9UZucdEXIoz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075498; c=relaxed/simple;
	bh=1OO4t4Grl2OW+LLXIPdqNnIbkyfNysrf3WTK/30c8AU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dcWkz3wa3HpEZ67HmBVFncXxWYSgVVf34sZW01pkZxKuX7Ar85SUerSKGbpVkfjaTId8mtliSYDUx1uC3MKamSuxHteuCMMCIYGel2FdC7B3X1ZkHFY8NyIPAr+r5OerwwyWAwFB+xsd3URXdvxWtfVgM9JZj0XsQDm04a7efKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Mmp40Vvt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Mmp40Vvt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so4383975f8f.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781075494; x=1781680294; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NHfSgeA/fGjDjbLrs9feaMOJjE/ZZnjX2Fhpf1TFZoY=;
        b=Mmp40VvtTdsO/GjMPlu64hRmmw9hGmtqvfUGkj5wkxO3B//NluVfBrWUDWvk1HFEHm
         ZQK99XJp+KFosA/n8FFCuwj+ahcTyIsptnB+GghlztouoA5A6n/VfqUtzf6i+7cqe8ar
         LYa1p3KrYfxnwb6fNxMN+sK8IpiOAE7Sss5Zje7c5FEy/ptvXz42ilPctQ5Y20UbliCe
         jlReoh16W3IiHULUcdo5EZSH8Vw4Z0ldsvUCse2PdwiuD5y27xhmnao68DOCxjs4yOkz
         ze5HvLGanZKCZwtw7hHdgCbbUlGCAFrnywCtXoR7RHCSYr3/NGqFnoHC4OAhC3J5E+2I
         lWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075494; x=1781680294;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHfSgeA/fGjDjbLrs9feaMOJjE/ZZnjX2Fhpf1TFZoY=;
        b=ce86WntzIYq+7dAb8WtjN9OGv0eUdP3+9s6zKD5KO1fdaCWcC/zQnT9ERRJtS5ju9b
         SMrZDOhmDxYDuoni86rBjDZu1mJkg86S9Rt8LEAQH0eufzr/3DS4ZOo84HqIm7xA6ZQK
         hh7Xw08L9RGFX7kX2pLP/YGAlv/MkeXbE8bhDF213UdtNIYssMn+BJgl7kUhJAVV6yD6
         9dQkC9k6Hw2tNnRZ/I9efPi1LV7qrROu9wTdWZ6P4F1gHwM41wOmrrvxi5hwFO4XKQGN
         FfDQdMt1ePO2qv1DllmQErmDLlvjGXQwjQYPpRqTMqnXm4AwmYp42kzDOpRm4pacCHj9
         MUFA==
X-Forwarded-Encrypted: i=1; AFNElJ/pL2aSwikZ1yCSzKdstiP+bZiLMEI1h0Z9Dujnh8a81o4o/mQM/sNyAw36fjQ0Pa6n7JY5@lists.linux.dev
X-Gm-Message-State: AOJu0YzRZXbUlKwsWjf1LzpBieSlYVYNBpfYMcoQprZaHzMaM2WRWtg1
	4eX6Sr6TilfB4bvIUsi9zxqpZ0JDYVCW9hsclPX3FHJ/q37WXy2+tq92uowTlG7T8VY=
X-Gm-Gg: Acq92OHdZZEOsWRGJj8gh66VYorsMuSONYV7/lfQ2yML+4jn9pETOmQ61DTVx0RIY4E
	XXgmVjmD4L6g65Om5gJn4kJQoOE4DPgBgQfbXaW5BSxigFu5zljUZojrZQK9SE0ElD7ZdaKGwMw
	B/eSzTfKGpdjaIJa+ooy61Ipcqpo1Onq636mPWvn+oXEBWtsOACrql5nSXN4RZWCis6E/ymRbDO
	3JgJNMkZcKMQ4Km1ZLOp1LSuAdLuueWquTwSMD5em8cCJGO9VG9oUXEhEeaOMPXetR32ljMIfgV
	j7C8H5wnOsG7FYA2urr+z7ttQA5DL5x0FPcL3+YC2E327/ZoI+rx17+G6dScDWB9bDfdUDdDqRo
	HNqeA2y2gnFzZbuIZMfMj/NqEFDf9gTTBS5ZtefsbDHiSUMQdmjdy7QGuZ5YziM6kWRbBdlaknG
	o19Prz7S9YTkZCD8j1ExboL91j5yz/82A1MXVGqalS
X-Received: by 2002:a5d:4e03:0:b0:43d:740:fb37 with SMTP id ffacd0b85a97d-46030641a81mr28093929f8f.24.1781075494136;
        Wed, 10 Jun 2026 00:11:34 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:6881:1355:3b75:b347])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm73998699f8f.6.2026.06.10.00.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 10 Jun 2026 09:11:22 +0200
Message-Id: <DJ56KCZMDJ35.3CKN0VT59QRJV@baylibre.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, "Nishanth Menon"
 <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Judith Mendez" <jm@ti.com>,
 "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis" <afd@ti.com>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
 <p-bhagat@ti.com>, "Bryan Brattlof" <bb@ti.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Beleswar Padhi" <b-padhi@ti.com>, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v6 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com> <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>

--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jun 9, 2026 at 8:56 PM CEST, Markus Schneider-Pargmann (TI) wrote:
> The wkup_r5fss0_core0_memory_region was reserved with only
> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on

This and the var-som patch incorrectly mention the reserved size to be
0x0f00000 in the commit message while it should say 0x01e00000. I will
fix the commit message with the next version.

Best
Markus

> AM62P defines the DM code/data DDR footprint differently:
>
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN =3D 0x9CAA5000 LENGTH =3D 0x1B63=
000
>
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
>
>     0x9e608000 - 0x9c900000 =3D 0x1d08000
>
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/ex=
amples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti=
-arm-clang/linker.cmd
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boo=
t/dts/ti/k3-am62p-verdin.dtsi
> index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d2=
35fd4b4e5c6af11 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 =
{
> =20
>  		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>  			compatible =3D "shared-dma-pool";
> -			reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +			reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
>  			no-map;
>  		};
>  	};


--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaikOHBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPa
gAEAyrybqnS6hv3Ovek0j7b14FzBa99hKAVYVQajdPf6WZYA/jNeWkQ0ZfOTfw7C
HBBAgvhweurSyFbfEsO3R2u7jS4M
=GC8Q
-----END PGP SIGNATURE-----

--994575abcf1e9190cecd15ed8f5aca86c3a1ed0abda2c617779b5e42dcaa--
