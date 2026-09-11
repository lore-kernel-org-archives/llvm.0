Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35595438466
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128021; cv=pass; b=XSWvlYiKEZeRk3kguEBoKU+aEvrcBvmXG+vYNuhmzp5lW9tvZGh7r9vU0TVwKv2hG9X1vj7qsKU2g5gduw4zrbfLR5uPheWNcbqCPU97Fj/xxluF11gwmb51DyJrBKDLQC4fLm0sTFF7ud3xkgd6l70T1c1ALG62XM69L2E1sfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128021; c=relaxed/simple;
	bh=3SyHymAnrjlvPO2mb9pb0A4ZCmnI2yTAOAi1u/9obmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhGvEyJX6ovYBb9gfOKLLu2rqCN0XO8eU68M0D30W/CqugONZrwxJkCwRqaOaUYk3PklzkVrxxSEBVgqdql8D8m0Mx5CgxEicdvnRMc/J8cvcUm8RCLMc7yAI0uDuLuS+8ExVGWsuuQFoeSFEzcGChkMp5WoRQpAceYKExViSDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srphzZSQ; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srphzZSQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so265778a91.1
        for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 05:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128018; cv=none;
        d=google.com; s=arc-20260327;
        b=NqTXIoukZfk1FFnkPG6S7h0h/g9QHy4yx+Dc6K2pgETZhg5W+dYfhm9JtOSpeaJ/w0
         T0Qniq5flfvBdDnHCD12seyaX2ePpEPnSd/5OatgstIkj+GEM3GGooR9GVaFR9VUb4w1
         wQ64LNMbuaP3bw0cgeioB2DoDRs/98BXhKeJtpCFAHHqOo6YQmeUsvithl/JS5pkRkVU
         YTwJnliOteJBHRXU1plsqGE6SvGIql8wJ77DfOiPG3R5vqoJMpZklgsRNijwi1ncWDSG
         Fap1jKz8wJsG6JcIhiEGxDdeX8FbHmaC0lK3ekGqVhQ50XauNqUhLbTIEX/2zd/cuV2H
         h19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        fh=VCfzNkzKYrBzfMjm7/gC3OWlq4cBwFG49dvFHwK3n4o=;
        b=Fbm4lx3rKseQbgrYmG2GejowlJwQ9k0n1LZe50a2TTc/+HvunIhvS9CQw0OLzrQYag
         gfuMxWVorh6dWF8HhflvxOSeEp+bJicsXFT+otiVP8HxiHdLPBgXNx8NmS5gHxdKy4ni
         go4+ycbY+UnHZpM4eZPUfv09/S5iCFsp5Wjoef8gPSRVH/3ZFItqRlB3hcNnK7MoJ8eC
         Ho46BCSSJvReHewMffowFS/48oFxAhqCUUB1NeFTXWN/mgDS3uEU+okkpzthc3wDKrub
         E4yobWRu/LPpFmxuo3rL7Yem1P0Nv811mA0Ytbd5WjfHh9x0B/bSkY2Lv9H2G8oFYgsn
         hLFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128018; x=1789732818; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=srphzZSQNZk458U//++tvH6BzqxuknyhrGHVuHACWt6wIkL69FCL4HrQIbeLe/BYJt
         /2GIYpN2pOXe3ZuYKkz2+vbmuWSxWHynH0iYfSOVGyfM/ceKssQaM2EO7JHNS4q8UFbc
         oJgFFocw0+3kwSHs7tmb9R1hM5yVhnS9w2ZbehT98sqrPtLZ5qZ3xAzcB5H6GZZ+Lp9y
         dmu9Qrx2PZugsgu2Zw91wJYZAtKRpbO7k3cyIpE7oYYvNUKnzvMgBPtS+dpxiVFqhqMx
         U08PNRTx5m/pHYBSvYyZQfPltk3gk72sfR8MgRz7JcxtE02FuJMErPnyadXHAR81AiXR
         rQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128018; x=1789732818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=OqWau5jbOEktgm2jkXesXYb9U3uuMRuVlcpzNWS2Q36BX1V4XFowzm1a7wbi51rE5G
         /OfUneIK116Go8KOXQKnKEy+hhXOe6uGSHvQcf3yj9t+q7u/9cv5qIgQpjmPBFHtIJey
         5Wh9NPlObM6CtUkSIs5+f6T0V7ZUtGC+LY2f3pPqNVblO/KawTZu+tcT2VXz+/+UVKMh
         sCb0rIPLXE9RUilcNmk9LclwEwgVAJsvqYV/WdbGaZRMPunYSlUUk1Nb5OHWOZhDGQ2C
         IhEUq0EaOea/1qB4MEvTgvLbzlEu6Swbc+0G08Y8mB9vtvFhvcJ8NdR39eV2jKlYA2On
         Wcgg==
X-Forwarded-Encrypted: i=1; AKwUvBysFYribpyyjBWt3YOn+jiHIEwDbuTYh/sjIssNp1ERWsO4rk8bw30cH2KS/LG4R8pKxWya@lists.linux.dev
X-Gm-Message-State: AFuF++nNIqR3A7kvs6R4HF3P7baMTXFznj3qiwfBDKIkmh9UtoI9hXe/
	BKustHYVfShKJ/8fwVM9nM8mmbScVc4r6FrNnBtJGJd2S9cOfKPYTKvaIzpYwl9JYKQxlYI85Pj
	Dm6jsezUB2vuYly2FCzT+gHk9+FXsoIg=
X-Gm-Gg: AYBFou2NQSEcwtqoEhx4cK1d+VTlVrd7TiFciH6EndWL3/zCYQAd+GlPM5WCC/2eKiF
	G3c2rC7w6owbs9xH9oOwvGO1l0b822tz5swm1kPq8VfAJzyxuw6J5z9w2Q3o/C1andPxUNCvTdd
	MUxOUWsDEx3O91guECdg1ulhlXgkCcHmSP6bYGcxlbWzWavbbczU0ZQ89jbzREDIk+/ZdJl1M5F
	OiCWVTlHTeJG5x67X3d+GPxuig3DKARBaaxWDQg1zhC/ot1/as1DZhZx0m8tygXBBUqZd0ZlhFS
	cJf6WoLvDlQjKQzTZ8m9mlHOa0UAxWSrKSAEASGzmenckidIWxQUHqtKhATo8Bq93u3QxkLsAP2
	BMvGH9my68zrDkRojxCYdZfEkHg61zSDZcRLxqrP/lqRKmN9Qe4TEnTb7l5M+BWsLTM8=
X-Received: by 2002:a17:90b:5108:b0:38f:657:6823 with SMTP id
 98e67ed59e1d1-39d97f392d3mr3889515a91.8.1789128018117; Fri, 11 Sep 2026
 05:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Fri, 11 Sep 2026 09:00:01 -0300
X-Gm-Features: AcwNN1UryKTs1Lw-KY6R7BmulMcgHb-91PJOnn7PiBP850ZNAVItrIcXBzp-x6o
Message-ID: <CAK+owog22cPgYj9muDUJXcTx+k9eBmPz1jfi8D9cx3H-xo1mKQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>, 
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Beleswar Padhi <b-padhi@ti.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Sebin Francis <sebin.francis@ti.com>, 
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:40=E2=80=AFAM Markus Schneider-Pargmann (TI)
<msp@baylibre.com> wrote:
>
> The wkup_r5fss0_core0_memory_region was reserved with
> 0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
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
> Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-A=
M62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> index 8a8dec80cb30..3d1a2c5bc464 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c8=
00000 {
>
>                 wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>                         compatible =3D "shared-dma-pool";
> -                       reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +                       reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
>                         no-map;
>                 };
>
>
> --
> 2.55.0
>

Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>

Thanks!
