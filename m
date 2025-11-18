Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F75F30F531
	for <llvm@lists.linux.dev>; Tue, 18 Nov 2025 23:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507056; cv=none; b=Bt260itJkJmcloArpWjrUi9++KKbFXTlXSMiQQbGAwQZ39hfq1Z8dWD0MSG+eyIUpOe6kbRtUUxMEroa/dmjAXlZ1gv77g+wTzNG2Bjwb1H8zNN9jluf6+FaqOAWy2eY/I3AJyGs+/lmbcl00gV//i/AE9LtkpIaQnAXPGoCqaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507056; c=relaxed/simple;
	bh=/ymX6MZbOGP8Rnnx2h10YmGwYTYivcCZihr8XRtlTxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWcY0ZC+SaX5gYTpgvk+RZ5gPDvhxYZGJCbqUq2NPWDzfZJ4UC/a5bNn6PdfTK3zNpcY0iFF/Uh/QrT2K1v02UOimpyAyy0SmvoW08TMj75FRLpRsJ2+aWlY0RigAa381CUtYM5Up8SDpJkQohyeWjIrnqV+MU3oUiuQESGxQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjymGlyE; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjymGlyE"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-789505a2fe7so30349257b3.1
        for <llvm@lists.linux.dev>; Tue, 18 Nov 2025 15:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763507054; x=1764111854; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpyxSY5WvJi0HmvpcS1llhG6ee+xNYXsAMhYQ5ST4Es=;
        b=GjymGlyEWNUykghkd/pjm67CTKxYTgzABFq2MqLM2akBo8i0HRk6qDa4HWgbPYV/IJ
         bddGMtJ26qXtEGvlNtr5BlZO6zudklExcjuOj6SvN+Zl9n4sPqDhz/xRzWHb5Xj5BuUX
         egh8FU7z7pypJ71TAntRG21vNzDssCYSCa/iJY/yjkDOmnKZveNxhwryeDX2bYSH9Jny
         IRnktsYmwgC9DWMs03t8BT8cIqYfS1QzX/HYIbI2gcTYu7A4Eze4P/gPwQwWCLXoqc2g
         vJJi1NeuMYFqYH+6+7dpYNeNZtuPY66Ym4kuNHtmclCplmleL4honWXLC90BV2s9XLFU
         X9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763507054; x=1764111854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DpyxSY5WvJi0HmvpcS1llhG6ee+xNYXsAMhYQ5ST4Es=;
        b=v5Vf4A7ds41zsNiY49qiQwg5fyFGy/4NkEbENUa1g4bnivtJPvdL9ETbe06jSprFCV
         CqUH5jXbEtgQMBrFbrEIYIzkrcjN44bA7RaxAm4jQ79ArwgJYY4FhV2GZ4hKaRmiqb/u
         u361NhkL7vTP4INTjNNFwJBP3kmwrodSsgo3Omh6Dz9F16kPs9C1fQVOcFa2sJjg8t2G
         EnDzRZcvXIgMZBSL9ZTmq5pOAT+1szBZ630DtLJYOQASfaXO2KOs8bAZcB/yY5cK7S8P
         +illAtMGmb3w3TuXzxY0xiMCzAnf1vHHAOvjjQ4slGd75m7019/pOL/lVEs0979DFwMG
         7FEw==
X-Forwarded-Encrypted: i=1; AJvYcCU0mnV9ElfZcUmjOtsMEfVZpDcBtP+Q8ujfxi7HgLED4VwHwhBc1H5odVFqRKTUravLH1pc@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ4oUnho6zl8x7WWJNbpcvnE7Px30rWoaC1Y1BIeLzNrmPp8TD
	AuHi2edFZ7ylrJZewHqXLmSXwp8+AFaHTxMbuZHXOTWeOSkhMH1uWDRQrlezSG6EtPV0ySrw/wi
	Udva6VgJM7Hc9vjLFesbWLarl8IihJvT6oNyGfrZjng==
X-Gm-Gg: ASbGncv0/f29eIdY0zkVud4IRdiJs5nDukT6D3rXdRslBE8diO7y/4ww6YZMx2hrslI
	hmZLUtKRadgFd9qDoMBJvtBXrRrdXM7rfhk0PgY2LWBhoSOqQc8qdm1SUAmsO6r7toHkLVTz9C1
	q3d+ovds/3X98jykCrISeHNixv/5s+bNcGi3ycmbSonHaHTvJv1GyXx26CmYsYH24cFZaljsp+f
	1rjsvhMpBG3rQRWn9HNn9U8+c44B3vlVXNwGNQs3jrTz2c+AlRt6FsaM7UaUp8ECtzdnxuM7Cb5
	NWxpMw==
X-Google-Smtp-Source: AGHT+IELB+09mf9khX/1UFEnPeAm1lrX0fgELMFuofsGX4R6IFFA6KPF6dwvDM7AxfFurD19MW+eZHnF90lveBd3oI4=
X-Received: by 2002:a05:690e:155c:20b0:641:f5bc:6984 with SMTP id
 956f58d0204a3-641f5bc71d8mr9451804d50.80.1763507053863; Tue, 18 Nov 2025
 15:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
In-Reply-To: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:03:58 +0100
X-Gm-Features: AWmQ_bmTrpDRkDleDNb2XMlOjcgLl6u_OW5kVkCUfJvH2chNj2IWVVvyVcdyP9M
Message-ID: <CACRpkdaFq9PBxvxG2t6xDTN9M-7psvo=VDTCpu_qhvk30zFrMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in an7583_pinctrl_match_data
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 7:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> Clang warns (or errors with CONFIG_WERROR=3Dy / W=3De):
>
>   pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinc=
trl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneede=
d-internal-declaration]
>    2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2=
_conf[] =3D {
>         |                                         ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>
> Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
> ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
> evaluated at compile time, so it will not be needed in the final object
> file.
>
> Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
> an7583_pinctrl_match_data to clear up the warning.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs=
")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Patch applied!

Yours,
Linus Walleij
