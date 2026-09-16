Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A14EA395
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554189; cv=none; b=fiHPwIy5SMnsxRL48kqzm6irEH4qA2cxtZtm0qqJj2jJL4H1TeouLvJFg93joZoEU0/eYUFLiXjTdrIndNCL+sXb/YVnz2ZQkecNnS7Aw+BbuZmvbuCzvIC+ukw25YS4RnBRSVMB8qEqXsxU56xAIjHbbsbl24J50fDvT92pACs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554189; c=relaxed/simple;
	bh=9Jl4vgLjlkns9w1TzXuJs2UdxbB6eEhBBB9cmhqBEi8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Lifm33PfvHsHox6taCX2QF9Y1zsG1TNNau0c1aQSCUxPGebKz/ks2RaLQz8f5B05tdM8M3dd6O8mfAfc4E3D2jZmwqSq1KpqZpnX1iJ9Eb5l/eV3Li3aEWGxkwFy34wdMnra9aaO/kiLPiSjjnHkbpVmJnDsCY/gRZSkKuITWRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AATIMfm1; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AATIMfm1"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so331165f8f.0
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789554181; x=1790158981; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MusB319/W5rKi26RtEZ1yy6e5hMKt8D1KmhppeMb+Rg=;
        b=AATIMfm1T90tna8u7R1YCpe0tn23YokR3B6JaL7ugkjaIZCP64J7n6YEM1TJzAP0ld
         2Ffbbbd1tHCpq7qZqxGpmkP/XNVxfzle4STHkVpeRL/jP8uS9ZfukTV8UzePZ6hYT/kJ
         FtY5aEcuxIq4afVHo2kLwHKdp2YyRixrnwwIsxFuuOyIksU+VU166vxzXFzzvqqmOIEh
         A7tSixDPGeaAyGyHYoFkNNgZBsCR5Giw+TJBPjB6sfPzxeL4PdGYz/ez0OLFNri4Mlvp
         N6b+oy7WFLj/NuDVsANz+p4txrRxx9isWcyq1X/elkzRakjMn3pg8qSn69u4GkjinWaM
         bfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554181; x=1790158981;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MusB319/W5rKi26RtEZ1yy6e5hMKt8D1KmhppeMb+Rg=;
        b=rnQGf5+J+THlmgi4q1yXLnC9EICdFq41oXXtw+fle02owxtkL1v9f4W6YG2SGjjEBn
         pvps2QwXGISIr3Ug81ldyZH6AVGI1j0Uih2fJ8VAHTPnDxImeE+wZs8XHvsUwTuhNoqK
         i3MOf+Ue9sMWuoQcQNW1gtY+5tj3rdvtX5GPUWm8m8IOpm4TxAIxbQ0ovPspZSQrLDJP
         OyF2ruVV25R+LhNcuBaNcQ0Ims0m+kI4sNeR3FCscdmDz8DJpDH/Y1T7BK9rcNAxjyrC
         HUAN1eD4SM/WvM2znP4Fzveiug6lGlOy0g3D3UVCdWmTvPgur/DlkY3Cp1jmSSJOlpSH
         umlA==
X-Forwarded-Encrypted: i=1; AKwUvBwkr7Am+y8tDoqfuHkxSJ+JXJSON9JbqletQInGMQjnh8RrygPjVv8hqYEAr4UIykv7voZB@lists.linux.dev
X-Gm-Message-State: AFuF++nq+dI7BrKdDMwEfl9sv9g5nC6y5Ho/Wi8TDXAxkyZA3y+qgZ8o
	pWQHGeQl8yLuyh1nTIyMdHac+S/iICTC8CAb54NT2jnEb8tvXjYq6DPUirr4pn86X7M=
X-Gm-Gg: AYBFou2sO7zUk/yNRUb2NkLruAz/FXqgi7z5OH4FfgGF20FDIHAI7FTG6YOnMT4wPMB
	CSK+AjeU33X2xtkJQ+6XiL8yC0ZOFEJjW/J7akvGkwNLiQcuykl2XSMXQMtZIWIpg8RCwaYc4IE
	2iSkNwyqlzOvA9SZVPBKEhflet1y1IgfCdx50AAMITClCorIaKSmPJxtgq7CrLQzZR28hxuqA2z
	bH6HzP6vofsgCwe6RPjwtIZEcu8nzopPU+nIlpn2FloaTv5sAvMPkUQC313S0L8MJUKmIHek2MM
	rSlzbf4zlM6EUhXChJ2QlPGOGPtwdtByf/NCeKRF7SiLcjmC+pxf5GLEJzC75VrhF+SxRv/EYAc
	jie3M6soTSwXnxwJS1WX29GU/rsYnN9pnZ3b4ILy/9wLM4SNJekPKzJgnnriHgOw6F/sEAuXBUF
	YBz5hmZOzJXdMBSdLYQ0RgFSJH1ahXCiQRw8bTqSukLjgK9IpdyU0ekN5E6N6S+MgM7ULJ0A1Hd
	YIy
X-Received: by 2002:a05:6000:1789:b0:487:528:cd3b with SMTP id ffacd0b85a97d-4870d057324mr2601650f8f.53.1789554181539;
        Wed, 16 Sep 2026 03:23:01 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm6429347f8f.14.2026.09.16.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 12:22:55 +0200
Message-Id: <DLGO0EVE0R9G.3MLT4ORYWOK8D@baylibre.com>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
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
 <stefano.radaelli21@gmail.com>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>,
 "Kendall Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com> <20260911074213.uucibicxngghf4rt@famine>
In-Reply-To: <20260911074213.uucibicxngghf4rt@famine>

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 9:42 AM CEST, Nishanth Menon wrote:
> On 14:39-20260903, Markus Schneider-Pargmann (TI) wrote:
> [...]
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch=
/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> index 84dfbfd1986c..a343166b815e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> @@ -53,6 +53,7 @@ &wkup_r5fss0_core0 {
>>  			      "lpm-metadata", "lpm-context",
>>  			      "dm-firmware";
>>  	status =3D "okay";
>> +	bootph-pre-ram;
>
> Additionally, please check for dt style (status comes last and has an
> EoL prefix).
>
> Documentation/devicetree/bindings/dts-coding-style.rst
>
> Could you kindly see closer with dt-style-check --strict as well (it is
> a bit noisy atm, but it does need manual check on the log)
>
> This specific one was caught by review-prompts[1].
>
> [1] https://github.com/masoncl/review-prompts

Thanks, indeed, I will fix these. Also thanks for the link I didn't know
that existed.

Best
Markus

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqpt/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlN/
DwD/TUtAHwXUjrcmYytdre2lYelDM8Hv7O5A38tPdzGKZyEBALivuMFtjvENBV4o
sYGZRRl4K26KXxKWAlRx8OBIAYwJ
=8jd7
-----END PGP SIGNATURE-----

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f--
