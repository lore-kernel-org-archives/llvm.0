Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073A13594B
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 01:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571557; cv=none; b=FjPb5MRZm0LrPonXFwDyalqHE2bvrdw4yJjrYRWZXDcGRRaW4BGAIvQPf1PoFTX0OWQjrPTQtYs/itWdpae5k+K91LLuCAZkEt8g79ubQkqn1GfSkiEkNSv8sh3KWAoHoHVYhykLFkhn1sR7IYTRDBOk/+GFUXgGpyV57t/EGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571557; c=relaxed/simple;
	bh=2Dsf61/7CTSu04vldpJc6g9vN2n4R3Sf+/+qxTD4tfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AynkaUNjvQH2Hu7Rfx98XyQxiUSGdmEctRfqFwe4/cd/VMgb44APVqN2rWhgWC5syFactksBiTC+CXZYaVKUkbe3pcCS8+p75HzcL85pgofI3ph6ufrKrN4GU7xBrDpamxe78VReN/ibUeJEPkAYKTM0kTlLWrAzHVqs6AV2PCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z0dP+5d3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z0dP+5d3"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-725dc290c00so1159897b3a.0
        for <llvm@lists.linux.dev>; Wed, 18 Dec 2024 17:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571555; x=1735176355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifr3ayHIXYnUY/bBziOfNp0H3xeqKGEAJL0/80vlIrs=;
        b=z0dP+5d3NJqqFQrpFSYLpKjJsmbXe8spKYgUzcFjk3nhwYy6esSmGja/GNghdvzDzY
         jOniC+i1lAZGgn+gKlDf8Tlq9Nc/vs7hIxBKm5RRn6Zrzz3yAp0EM3kEpi0SNAczqQb0
         wocpg05d3MQlq3RlEXPlI30bmXTJSDeMvqxzIz5P7o2Yg1VnNSqpPPgvj3y8aIJmqPOI
         BD+6b7REIlw/vvvjCzueTX9wJC0yxwLm4v3HPt3kyRbzjYvKUpEWvMTCNvxAFQnhQKvX
         X/unAJDIr5Pto9vw7QRpYqJIzOgRP40LJC0uEZZqyvLAf4fY+X4jqxsluMdU/DNHKLKn
         20nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571555; x=1735176355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ifr3ayHIXYnUY/bBziOfNp0H3xeqKGEAJL0/80vlIrs=;
        b=RKTDGtyfcTdWARPuB/8YXoF/8ls0+YmgB0/gtu1FKAb8ADuPRwuBukoSX7+ONQ7afl
         llK/Enx0EJo8skgWnOw2xmneOwNotyQAnjx35n6xRJb+C3cMUOQSvbuypP2xSzQ4CTsK
         zlY9axtP6R2Zq3KUfyYYkySSE/hCnFLUx0srpZBNmggCC6wLyXey52vuIPJx4hpAJaFe
         32ZW81GGuUt1ITwtafxMN4Kxytb0bcry9eND17v402AmzA55Z5rTSSAtHcL3AjULF/yq
         5LTOO3sfGhuJoIa0bCaifErFx71Yd+K2vFkuB12Mcc2oW0OYWhV62CfjW2c1UknmViNp
         3qfA==
X-Forwarded-Encrypted: i=1; AJvYcCU1UfexR8NABiPP6b/G0eeE1egdFZEAvQ4pvHyveYWVyCunY0/k5S6JHqeBXAyVu+t3kFlx@lists.linux.dev
X-Gm-Message-State: AOJu0YzC3+7ZjmdWmOwAlCVI3v1kIUmbKy7KudUgsGoCtJoiiR7DIHSb
	/TCTJj5O1jeg+Q/Sr7uHOOU5cwDFYO8sM17BFncgmyU1mbWQ6tyOzTs+rOhujQ==
X-Gm-Gg: ASbGncu8IJZZeCcutxOkx3l6i9Ie8qCTNvzsBfNyjraCpUVZooa8XbDrvzbHte60NXF
	PL8ehKScp5r6IIaImYMzGd+aTa9ihRqhmvVO0jr5v0unv/sbHc4snEZPYaQFARKXkGB14K1sIPw
	HTNHCg5AbLSN8rcUb86rYV60b7vfilPHBdkAvUo+WGIFWG5E1KJc+Kr6YxMNKNi1mfUe9bCm3tK
	c+ONPctaiau3HbZ20trb1cduxC1Vvv7DaiEeN8aMFYe36kkshmgc/Lg8X3mn0HKIucMfBqUmTta
	pGQ4DrQo4afNjNV3
X-Google-Smtp-Source: AGHT+IHaUtXpvS/Hr2aDFT2gXzn/HZ2P+Vpy2i8XwtK/2MHIKvZk286tXxhVBHLLpf4XBoweUFYGfA==
X-Received: by 2002:a05:6a21:3997:b0:1d9:a94:feec with SMTP id adf61e73a8af0-1e5c70190f7mr2478459637.2.1734571555057;
        Wed, 18 Dec 2024 17:25:55 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c225sm111371b3a.197.2024.12.18.17.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:25:53 -0800 (PST)
Date: Thu, 19 Dec 2024 01:25:49 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 4/8] usb: typec: Print err when displayport fails to
 enter
Message-ID: <Z2N2HeljULoCsdAi@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tnXtIProi7xyxxSe"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>


--tnXtIProi7xyxxSe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:45PM -0800, Abhishek Pandit-Subedi wrote:
> Print the error reason for typec_altmode_enter so users can understand
> why displayport failed to enter.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Put dev_err on single line.
> - Slip clang-format a washington to look the other way.
>=20
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 3245e03d59e6..ac84a6d64c2f 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -252,7 +252,7 @@ static void dp_altmode_work(struct work_struct *work)
>  	case DP_STATE_ENTER:
>  		ret =3D typec_altmode_enter(dp->alt, NULL);
>  		if (ret && ret !=3D -EBUSY)
> -			dev_err(&dp->alt->dev, "failed to enter mode\n");
> +			dev_err(&dp->alt->dev, "failed to enter mode: %d\n", ret);
>  		break;
>  	case DP_STATE_ENTER_PRIME:
>  		ret =3D typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--tnXtIProi7xyxxSe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N2HQAKCRBzbaomhzOw
whX+AQDbKOoKjJw/ywfmFiIx+z/bwE9H8nxc+cnA77TQLewf/gD7BdIO9xpPe+WT
6MxZLxwAWDTtUQuMW4ewsFAM/8ss4QQ=
=LfMz
-----END PGP SIGNATURE-----

--tnXtIProi7xyxxSe--
