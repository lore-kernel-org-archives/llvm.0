Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521443F7A9F
	for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661796; cv=none; b=JkJvR5jybqbuIy/sebKA2yhYouarpmPlaMW+WdXiALmU7CC2MIyYV3elws5iebL03ErgY1TFjWunujA2yczV2xXgWyBvfN3lt/CHbc8W4hPL6JSxgfCbHXI7f303msHMNbwddJmZGr14mLaHJWxtSAuGiBc7ydbgYATgdfyiV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661796; c=relaxed/simple;
	bh=qKVDN6780BM7FpRbqGfcw4sKV8utIJkRbQ4/Bz1H7P4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=p98PktM3ix3uuM/gfuwqTkE6w4hGNwSTr9W9IPK7Fsm2GQjKLXxpTiIcYkdHcmOkgchzpItDehY8JdNg/h3LGwmQxUXxT86tAUOJ99zcb8gyx3bIbDuUDBZKBnDmD6SxghUX1J5KUqoIDFpTpw3Bakio8kFmP9S2uOO8bv++Zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SArALQ7d; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SArALQ7d"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2074710751so852569966b.1
        for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787661792; x=1788266592; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TFI3yyLn9l19QnGbVm2do/qnURFM3qOYJajHXsZKIRI=;
        b=SArALQ7d0xNSAqZK3550ezN8Z5uheJAobFvTtMUw4VtZ1nCxLrLg+5kTlA+OlBoDVq
         /NEGPrfuYM4SqUaM23r3fPhOCu1kJ25Zq0iXqRdrDWzBLKMXdBSPVRADZAj+DXqUzscr
         WRf2+QDmz2quX5/9ERjonGAowwra7VTjoGeZT5wjLUhcmBdUr+SkZafCAterVacLHGUc
         D/kJoVkoxDKfmOKM05qnTD8fWwl0OcC4xdFVbjidQhQ+wmmO4l4ui2XeZoUFWQl5fgmo
         1SSXcCPc4rd2E+jwZlpNaNR2ZeKLFjcSLeHOp7ukCrZawK1fAFFZM4hHQqsAwJX0Yq73
         vV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661792; x=1788266592;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TFI3yyLn9l19QnGbVm2do/qnURFM3qOYJajHXsZKIRI=;
        b=cjBwkVVlse8WvZ5Oo2T2dX8dVsGWM1qf5QxrK3kLx+mZtX4isAB6RSbRNAnGphAstu
         mpQH9TVtO45Q9y1jN1SoBA2ocxLamnYo++9U9BVdgVzRwSTcTFLUTevYTmiF2BuK/pFh
         vqmIKE3w8g3hW1QuSz0c7s1Ukd8Xq0qwOZwbaHe7Ui1zHAnhHtH7RPrbp1PqCa31JMKh
         LvIL+fu3zdMDPcLs3iQ1fD8GGKxi6UxhniPnarw7iY8mr3Nc4Ix8201p/AB5nJHUcPVO
         sjuBjieWGF4ip3a4en9IRo1qC8ah0Tvr6rj/whXRy0BkjIV2BKdHGfLzKa0ZOW7Eg5ln
         V1wA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+QyfPkNzUY1D4GVTCq24WJK1aIIfBcL8fncOZyaObJczu7DMLxgS5BkC6vS/iubqjusIC@lists.linux.dev
X-Gm-Message-State: AFuF++mkRk1tKjVZsksdbdFaFaadBb7HTJzBvigjV+GCu7bJJuDibBss
	aVfApafo1cN0yo0hxUQyQVd9ZfK4TsbfrdBpj9l1oHWdpM4u/uLXMrCaP2oU6QoLqx8=
X-Gm-Gg: AR+sD10sKktMONbQEPHXccPCSidAmRH1ZdxYO+jF0x4MiYpuMPZyMSsjNsidYxwqCMF
	Eey2pR+jQG96Y99+xEVbeM2+OOlJ0iuCgGDIJmZ8punGP7eIaIlaK38RTi9sttkdZCgq2UP/57I
	UTKdD6PNJwhPldOk3C3jtV3zTjfcqS5b/QXpjXND3pLsRzxETukn7KX6ALmBvEP3zel1EAXIpm4
	qPYdl4yYzHAxdqRHlnpQ0W8Z2grmG5m83IEhZyUJ77C/TsWKX0uMavNwLKRzZ1GrDirCZml05DK
	cDO1723YP+tfvAizyTAm+KRiWu+K92kEaswPBBHtKPmbyzUeAQQQo3zLCzPhywGejCRxi0NWJmc
	m9h9w0ujXf3ccT+Qs/wzMY5NwoxurTH9z6i9JvGHl0ASn1hXgCLRAEXCGir9NDvsP+HZoQ952/4
	k2m6OLLvMUwZ/vejIC8jj4iqxpunFZ/nsH4rHtAtw5x0Sr/Oheyv6huKuM
X-Received: by 2002:a17:907:1c27:b0:c21:382e:9a38 with SMTP id a640c23a62f3a-c2491c2a110mr2907599166b.2.1787661792297;
        Tue, 25 Aug 2026 05:43:12 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f809bsm1943085966b.41.2026.08.25.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 25 Aug 2026 14:43:01 +0200
Message-Id: <DKY17OVPN49B.3U7OKB7NIMLF2@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Andrew Davis" <afd@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Judith
 Mendez" <jm@ti.com>, "Daniel Schultz" <d.schultz@phytec.de>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat" <p-bhagat@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, "Jai Luthra" <jai.luthra@ideasonboard.com>, "Devarsh
 Thakkar" <devarsht@ti.com>, "Beleswar Padhi" <b-padhi@ti.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com> <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com> <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>
In-Reply-To: <f9a23a59-4346-4408-92c6-11b9162f0efa@ti.com>

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

On Thu Jul 9, 2026 at 9:33 PM CEST, Andrew Davis wrote:
> On 7/1/26 7:39 AM, Markus Schneider-Pargmann (TI) wrote:
>> Move the reserved memory regions used for wkup_r5fss0_core0 to the
>> k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
>> boards as well, so we can combine them here similar to what is already
>> done for the mcu_r5fss0_core0 memory regions.
>
> The reason we left this region here in the base DTSI is this region
> is for the DM firmware and is required for the SoC to function.
> The other firmware regions are all optional.

I left this in the base dts before and Nishanth pointed out that it
should be in the ipc-firmware.dtsi so it only needs to be changed in one
place:

  That was the entire purpose of splitting ipc-firmware.dtsi out -
  if the default firmware carveouts have changed, do the change in
  ipc-firmware.dtsi. That way some other firmware people will have could
  potentially have their own dtsi files and handle things appropriately
  there, even if they are using the same evm OR if they use the exact
  ipc-firmware on different boards, that will appropriately introduce
  the change there as well. BUT, do check first.

https://lore.kernel.org/r/20260507155710.5zch4ghhzrj7hnlh@immovably

Maybe I am misunderstanding what you are suggesting. Also note that the
memory-region list in wkup_r5fss0_core0 which references the memory
regions defined in the base dts were always in the ipc-firmware.dtsi.

Could you please help me understand how this is modeled so I can update
the patches appropriately?

Thanks!

Best
Markus

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCao2N1RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMY
0wD+MW1P+fXLHbnT0Q5q0xRZNdlX5mzZrZjflYaQeXlZQVkBALnL4EjrbB40bxbu
e80zmZ+OmW/bF+SzGKpJy8SoyqYK
=pVaV
-----END PGP SIGNATURE-----

--14a369f1291804ff25a36242752313e74f8647a8095442ea6e38a796f654--
