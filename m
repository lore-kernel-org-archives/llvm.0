Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDF1A00F0
	for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753799068; cv=none; b=nUwRU43RzD1Et6o4XAm7pJS1E2a1TmBb+Y2MVH9sZLN+kvwUeBuu5hezBPS7eynNvBbOF2PqGUzuiLQuhxWWSYFyWXRHSlF6+M3qi+EIR3ulO4/iL9pLjBfKn68pHQdA7C3hXBXxC1xCSfonINeSget3gzwSFZRaLozjqigtiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753799068; c=relaxed/simple;
	bh=xRXyGwni6xiYtnm8ZbqUkc6iEgaQ7Xp7nL19BSMO+nE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BFT+ZWSZxc3e4LlVddztZ9Sq4VCoz4o2WjqqP1U1qwPLDkCA+kr8MtSZXUgrBq73oplAQrvGjK/NQA3oCwEqnrh0VW8FaXFNwY1be+QZi5Qi0deTubkhYdkaTDSnJiPWEe589UgsleAvZ2BW0uNFJDAvaEP2dp7X1JoSz1PqCE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=xfFLC9s9; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xfFLC9s9"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab39fb71dbso58145561cf.3
        for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1753799066; x=1754403866; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rmeKc3jet6u3gOUQd2X+WQs6A8Udrvi7OwSfi5a8wj0=;
        b=xfFLC9s9b2N7Hf6MKwL6PnITT025+U2wn3uCsOZTGX3Kag6eeRuZpkYlh5pAjELbs9
         XnaZ8apXwLo5YI2eCqNl52qn55UauzwIPvDH8l7Y8WOK5FjpY8noOtWdPn7bZyr/XDoi
         f92zwHWTU4jvBMNcfsy0xP9WslCYfouK96Uo6/CBHA6fYY+JCr+tDQtsWnq1H8WdOoeM
         Z8jrHi+SCD34QWZTmxNpwF2RcZxX615B3jxEqjmEdOgoBQroa0XQ2bqxuIzGNr4dttS3
         AMLwrI+5wY3giC86jxFCD7ZDmf8T9jTjiMmvBcuc1I2LDtiUBxqzRtGA4Jd072NozguW
         nh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753799066; x=1754403866;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmeKc3jet6u3gOUQd2X+WQs6A8Udrvi7OwSfi5a8wj0=;
        b=YcIZmCSik2T3hBE0pz3ZVdsZNxFCi7CcXrj3KCqKrPKaf6GCir7gdilH8NmN+LTzgT
         SnfAB1ZFKJIbHDeVXhgfkByjB4TvNzYeH/5s7dmphy+9Jx45Zijd8Xj7wpuZfTUuOrGm
         xN+HaViqZzUU71v56ou+sUlnuW5hW96zc4PoIzVfKUBAsyhLuLJ2EAhmhVBPfhKEHymE
         6B/NqkbWZ/Ckx+QhZno1SfjbxbNBO/wxq+ZkESlxweZdCrxq8AMGV54h/K6D6iAzG+Vx
         EVdyYhTzHH8HeuO1ejxqz3ttXrHTAiDBAdNGM0EMhvIMNvpu7jFHSu+H/ShflDOXa/du
         zsWw==
X-Forwarded-Encrypted: i=1; AJvYcCU27sYdpZxDGGfY5kZBVTESRTyNEDULlfE+jKvVUZw+/GcJKI9J96B9ex78rc7WDr8BmYVF@lists.linux.dev
X-Gm-Message-State: AOJu0YwzTyEIahE+jGtWc+4CMRri/yFAKXmgwrGLzHbJ7C5IY1yumkvw
	ppWeOLt6K1+c8eTomWBPjPITGHa5aa8RQX3X0A7DCmGbXaHtt5Hatmu4Rx1tT3pYJ8s=
X-Gm-Gg: ASbGncuyh5+TlpdURFWJ6wJfpYQHLni/eh92ZAC0ZvQ1M/OfjnbZFf7KeyFQG+y/DgC
	PDWgiGSxpd+pClKgAjqd5wbuMghj5fbBivX8PLRpen1FF7i0WVI641HzXxg7jMTfgc5p5ZeJRNg
	nSBC7FXYM5hlljsINUxW1kxrGEj3eVpZodSrg7Me8CLQUkInQujRtpTlx+dA9keVZXeEcYovCYG
	EjukGsLLqtyOWJGSd8nFPgF0O/UZygoYpFVDkIUNRtZzs08cvBu9zM207bbfmLUCfNMe4kfSbhK
	5zavGYJXN9WGUN31wtc2FxtwjFGLegaRK+xYyG9CcXpN1USz4FHwkM2DlcTgp1Aqc0PrGFBGyEy
	lHiuA5Fslcxo8r51zkzzZZ3dFbfWN/3IESz+ZGQ==
X-Google-Smtp-Source: AGHT+IEls/QVu7ZlIlUQJ28Xm3RrlwZ4/ODLxhT+f7gRkpVOEKn45LTTgozTNCaJLKONRyTYZ09YoQ==
X-Received: by 2002:ac8:7c47:0:b0:4ab:6531:1288 with SMTP id d75a77b69052e-4ae8f08eb9dmr256458761cf.35.1753799065474;
        Tue, 29 Jul 2025 07:24:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9963b732sm48999481cf.39.2025.07.29.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:24:24 -0700 (PDT)
Message-ID: <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Chancellor <nathan@kernel.org>, Marek Szyprowski
	 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Date: Tue, 29 Jul 2025 10:24:22 -0400
In-Reply-To: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
References: 
	<20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eEnUSaAdqhTct/4k3GEr"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-eEnUSaAdqhTct/4k3GEr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Le mardi 15 juillet 2025 =C3=A0 15:13 -0700, Nathan Chancellor a =C3=A9crit=
=C2=A0:
> A new warning in clang [1] points out a few places in s5p_mfc_cmd_v6.c
> where an uninitialized variable is passed as a const pointer:
>=20
> =C2=A0 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:45:7: erro=
r: variable 'h2r_args' is uninitialized when passed as a const pointer argu=
ment here [-Werror,-Wuninitialized-const-pointer]
> =C2=A0=C2=A0=C2=A0=C2=A0 45 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &h2r_args);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~
> =C2=A0 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:133:7: err=
or: variable 'h2r_args' is uninitialized when passed as a const pointer arg=
ument here [-Werror,-Wuninitialized-const-pointer]
> =C2=A0=C2=A0=C2=A0 133 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &h2r_args);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~
> =C2=A0 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:148:7: err=
or: variable 'h2r_args' is uninitialized when passed as a const pointer arg=
ument here [-Werror,-Wuninitialized-const-pointer]
> =C2=A0=C2=A0=C2=A0 148 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &h2r_args);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~
>=20
> The args parameter in s5p_mfc_cmd_host2risc_v6() is never actually used,
> so just pass NULL to it in the places where h2r_args is currently
> passed, clearing up the warning and not changing the functionality of
> the code.
>=20
> Cc: stable@vger.kernel.org
> Fixes: f96f3cfa0bb8 ("[media] s5p-mfc: Update MFC v4l2 driver to support =
MFC6.x")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14=
cd091d441f19b319e=C2=A0[1]
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2103
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> From what I can tell, it seems like ->cmd_host2risc() is only ever
> called from v6 code, which always passes NULL? It seems like it should
> be possible to just drop .cmd_host2risc on the v5 side, then update
> .cmd_host2risc to only take two parameters? If so, I can send a follow
> up as a clean up, so that this can go back relatively conflict free.

It seems so yes. For this specific patch, I would probably rename "args" to
"__unused" to make the reading faster. But does not matter so much if you l=
ater
remove it.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 22 +++++-----------------
> =C2=A01 file changed, 5 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/dr=
ivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> index 47bc3014b5d8..735471c50dbb 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> @@ -31,7 +31,6 @@ static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev =
*dev, int cmd,
> =C2=A0
> =C2=A0static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
> =C2=A0{
> -	struct s5p_mfc_cmd_args h2r_args;
> =C2=A0	const struct s5p_mfc_buf_size_v6 *buf_size =3D dev->variant->buf_s=
ize->priv;
> =C2=A0	int ret;
> =C2=A0
> @@ -41,33 +40,23 @@ static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev=
 *dev)
> =C2=A0
> =C2=A0	mfc_write(dev, dev->ctx_buf.dma, S5P_FIMV_CONTEXT_MEM_ADDR_V6);
> =C2=A0	mfc_write(dev, buf_size->dev_ctx, S5P_FIMV_CONTEXT_MEM_SIZE_V6);
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6, NULL=
);
> =C2=A0}
> =C2=A0
> =C2=A0static int s5p_mfc_sleep_cmd_v6(struct s5p_mfc_dev *dev)
> =C2=A0{
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6,
> -			&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6, NULL);
> =C2=A0}
> =C2=A0
> =C2=A0static int s5p_mfc_wakeup_cmd_v6(struct s5p_mfc_dev *dev)
> =C2=A0{
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6, NULL);
> =C2=A0}
> =C2=A0
> =C2=A0/* Open a new instance and get its number */
> =C2=A0static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
> =C2=A0{
> =C2=A0	struct s5p_mfc_dev *dev =3D ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
> =C2=A0	int codec_type;
> =C2=A0
> =C2=A0	mfc_debug(2, "Requested codec mode: %d\n", ctx->codec_mode);
> @@ -130,14 +119,13 @@ static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_=
ctx *ctx)
> =C2=A0	mfc_write(dev, 0, S5P_FIMV_D_CRC_CTRL_V6); /* no crc */
> =C2=A0
> =C2=A0	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_OPEN_INSTANC=
E_V6,
> -					&h2r_args);
> +					NULL);
> =C2=A0}
> =C2=A0
> =C2=A0/* Close instance */
> =C2=A0static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
> =C2=A0{
> =C2=A0	struct s5p_mfc_dev *dev =3D ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	dev->curr_ctx =3D ctx->num;
> @@ -145,7 +133,7 @@ static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_c=
tx *ctx)
> =C2=A0		mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
> =C2=A0		ret =3D s5p_mfc_cmd_host2risc_v6(dev,
> =C2=A0					S5P_FIMV_H2R_CMD_CLOSE_INSTANCE_V6,
> -					&h2r_args);
> +					NULL);
> =C2=A0	} else {
> =C2=A0		ret =3D -EINVAL;
> =C2=A0	}
>=20
> ---
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
> change-id: 20250715-media-s5p-mfc-fix-uninit-const-pointer-cbf944ae4b4b
>=20
> Best regards,
> --=C2=A0=20
> Nathan Chancellor <nathan@kernel.org>
>=20

--=-eEnUSaAdqhTct/4k3GEr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaIjZlwAKCRDZQZRRKWBy
9MSgAPoDXRwf5Lxtcq7Hp7OG4Atltr1GrYd2XN3KIA0gsC/AKwD9FHG0AEjkTtQA
V4fMhdBvUCT66a8f4JosODa/RnqNtwE=
=4vZk
-----END PGP SIGNATURE-----

--=-eEnUSaAdqhTct/4k3GEr--
