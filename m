Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDB946B5
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729489143; cv=none; b=Jlk5cV3TbEDBG14pE/BrusKiSb486ef1asxEWlPXzdgUZzRj9B0qkqzJ+uRSs0qE62pTHNvCpaPWUmKcqacQpB4fAXfQOsnVkBgJvp0KAJOCInAtRp11T4STqJKBjdqWavAmQCkaR7GLaCvg6K39fUbLaGIGTi8pUnjLE6v6+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729489143; c=relaxed/simple;
	bh=f5+ggXlq6yLXkoBxQqpQzfX/xnlrafFn3SMvSsi5wwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RaPf3Km4ae8TQR7ZIxHRDzk7MMe6aElYO2KZ6qLU4kaa1Ljj4pqNQIGh6OB7yDubccrCiAho8N9OxeTLe0HuViEXCpd+2N6hMVxI/jDrVy9Amb2oRlUt0stP+BcfJPVxBd8fPWdBkujrnhVjZ0hDFAHqhx43olx/doCsmptxtDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gm9MfpDa; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gm9MfpDa"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so28797861fa.1
        for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 22:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729489138; x=1730093938; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9zNYRiu9uknolFzwLlq15Mi6j/Tjr3sPHN/TktoqH0=;
        b=gm9MfpDafRWNaH1dKIF+T7QM6NmS3bJnChSK2bYgArILmCZjiiU6sV1GrecSeYnj2n
         zs4oL1g4pBKCz60PPiXm0a1COo5OPU7zPJbGogcrhD3mM0mXFcBYENNzc7/2QMW0zED6
         16n84E7FqXWA1aH1p+o1R2aMrG7fmDJ3nT74E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729489138; x=1730093938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9zNYRiu9uknolFzwLlq15Mi6j/Tjr3sPHN/TktoqH0=;
        b=lNS03QD5qlLWvOZtS7+OCO5+QEW3dcA42fMtmsAD3G7fGd4U7sxnLy8N04tAbT3ure
         NELUuLKMEAdN5FpYYXL22byzmu9yN2Buy/abY1zQoSAN0CE4/fuKni1i++btlTpQXaEV
         VNaFChIVkRCqhMgH1/m3FGdC6aeReu1lYjNaFjBELwNpH0YwD9mT7/cXAQtKS+fYIIX/
         eE2v4D7ZSiUgPFAhw4k88MFOY3zpOD4iejIs2Fsj4IZF+1mn3YZZ+EeZVbsKFjE2iH87
         vwJtLVlvIUVIeqo/lBTkcT01u+WDEzD7C9f2rvyG213JsvsdQZWYVknDO0LR+27KypK+
         b9sA==
X-Forwarded-Encrypted: i=1; AJvYcCV4lO2ZL2srWCFausncqogvfpT6YSZA5aOcLHCeecrjthkle236VuHlD7sm+0dYEm9ZtsUM@lists.linux.dev
X-Gm-Message-State: AOJu0YyPaz3YS6WVGX78VlzT/z+xpvkltrRmzWAkqTiMmdGDMVvjP+7B
	4oq+ahSu6NDv8xeMFAlHwIjVCxbP1KRz8exw59oHcgbiuo4E1zcx5WD+mPePl9pevU6Bgq3zvK0
	=
X-Google-Smtp-Source: AGHT+IF/b6CUdFOAEHZSRcPyh/AQN93sngj4hhT6HZD5aW2ivYGsW7cUseiA8rxJKCzxCpH8LEdHzw==
X-Received: by 2002:a05:6512:ea2:b0:539:d10b:e389 with SMTP id 2adb3069b0e04-53a15218b50mr4660726e87.13.1729489138323;
        Sun, 20 Oct 2024 22:38:58 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e5f0esm396799e87.50.2024.10.20.22.38.56
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 22:38:57 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f84907caso4425228e87.3
        for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 22:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2sFoK7FAXcvpoycb1RCIAX2cVKQOUT1yyd364a5xI4fZhPuAGNfLMZh8qpdnk/mh0KeVd@lists.linux.dev
X-Received: by 2002:a05:6512:1315:b0:52e:76d5:9504 with SMTP id
 2adb3069b0e04-53a1520bd38mr5443903e87.3.1729489135981; Sun, 20 Oct 2024
 22:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241018152127.3958436-1-arnd@kernel.org>
In-Reply-To: <20241018152127.3958436-1-arnd@kernel.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 21 Oct 2024 14:38:42 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXgv1sHy+F1psxiN0wu0ryg5shX_u7orzgLz9+-hU59jA@mail.gmail.com>
Message-ID: <CAPBb6MXgv1sHy+F1psxiN0wu0ryg5shX_u7orzgLz9+-hU59jA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nathan Chancellor <nathan@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Fei Shao <fshao@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 12:21=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is one of three clang warnings about incompatible enum types
> in a conditional expression:
>
> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29=
: error: conditional expression between different enumeration types ('enum =
scp_ipi_id' and 'enum ipi_id') [-Werror,-Wenum-compare-conditional]
>   597 |         inst->vpu_inst.id =3D is_ext ? SCP_IPI_VENC_H264 : IPI_VE=
NC_H264;
>       |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~=
~~~~~
>
> The code is correct, so just rework it to avoid the warning.
>
> Fixes: 0dc4b3286125 ("media: mtk-vcodec: venc: support SCP firmware")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexandre Courbot <acourbot@google.com>

> ---
>  .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h26=
4_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..8522f71fc901 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -594,7 +594,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *=
ctx)
>
>         inst->ctx =3D ctx;
>         inst->vpu_inst.ctx =3D ctx;
> -       inst->vpu_inst.id =3D is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +       if (is_ext)
> +               inst->vpu_inst.id =3D SCP_IPI_VENC_H264;
> +       else
> +               inst->vpu_inst.id =3D IPI_VENC_H264;
> +
>         inst->hw_base =3D mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_bas=
e, VENC_SYS);
>
>         ret =3D vpu_enc_init(&inst->vpu_inst);
> --
> 2.39.5
>
