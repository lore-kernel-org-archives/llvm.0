Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32922407CDA
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 16:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566212; cv=pass; b=eRLP4kCsel6/XkyR3/r6UynMvVnOt1ofalTiEat57PgwQI03CtqnRTZJL4DlnSRvJPaKe/2w0aUWhwlXJE6IiE8gPQlsMuij+n4lk0D7iAhnc8UnMbUIGFaR1q83MX+xMDmywKsvj0qjU1btFzczqd6AjreilqvgRB0hM8WkYaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566212; c=relaxed/simple;
	bh=mV4C844nkmkraNjWpzUFEfGiayI1N+j0A/3+fC1As4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrxiURFz6n7i2mrbxsc++BXfZJqiDChg+h8tTfuxJ4Br26yVXKoMMirFngyEOvmbcJiBTXRpFtQe2o/E4geLRzV9ghipuTIhe3BTk0Is5X5C7/JcoPBg5uVcg2QX+C/m9dmhh0smg8IVkpaZ6YWsKkKOljdmUc1yALl6vf6IOdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gE1CaxZg; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gE1CaxZg"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15c42a45adso628650066b.0
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 09:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566209; cv=none;
        d=google.com; s=arc-20260327;
        b=UzHJUHNm3LoLFiKNTp8c7w0UipupDx+dA0jfiI9HPxCicJX4PBAyzBRxZkQPK5sXir
         VAqLlseONzZsaF/ILc3ru+ydEMpMlrgJPVJgThPwS+xXCr4cjGr+KoQezmZsfd38KoKx
         g4uoQ6KzIoS9VRHLqtuYTlRBebNLJctT2d25+Dq3oNUg55YZvO1l8PkfLousZDO5QDCs
         fkLs++b78Dvza41Nwvt0kz7BC/xAajRxosOipfaMp9WDEAFHwsz5zyT5BS06AKQXhqZV
         pIMVfaT2Eq6Kwf9cxI/0VI0z8oa9mP4l9QuH2bjnMALsb5j0+7RoHrXRqbsUmmoEw6UR
         SmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        fh=11WplYIS2PMmeABtYU3uw0gyJIGvBT7rEPnmpUqpgpQ=;
        b=hRVJqBywddtMgJwQ/97LL/BJzAYt4QcpwGkuHJ2xmzW6OZs40/iB4lbnzp4McwgD1p
         gTw1WBDG8FEi8NDq1lQ93L5EtryTKxkcIKeeMQ1y62CFcweMul2FRsysSMzw7uJR9At4
         pJKr0ix4RFfGdONBFgH17r5lAS1zL9OWPKpD675/eoug0TbCp3BYH7Cf4a8iSmonJ7BE
         MOIlS+1V+slHebfMIRXqUWPB9BgI8ffiqVRpK4a3IteYjDzyPWb6qsBrSddYvEOqHbDs
         +rQmz4VvHGynuURQrLTBzjTZBX03fwzanEriPg0izbspsSNVXj4F1bv6oM2pn0EByeAA
         2y7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566209; x=1785171009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        b=gE1CaxZg3DZvfc8gHtQiF7POPKuLmBB9VIznmLIGnLLrilM45CmBTu18QPM7+Jnb9j
         cFkaPPwJQ+YdlgALfVz4FjwkuYR9hImgm4Pic/6nh0uTnZVYKYVAQHU6/RRbUfFQAGx3
         qRkFLXE6q3s8SKBu7BWTGpijGGpw68lULLoIPBy4QBtGOlfzrGhZSGkt56sMziSeWWvF
         olaBaEwOpFqHaHasMVkaqB6fC/UQAr+zQe4QeATD1BeHlPrfJUjy+VNLpMBBuoBUpIuJ
         bg5jkvrnhGAcdZZhg6HumSYogH7yCHkN2uh9Sokg1sA0Ko5wL5WnieGH5SNwwhqG6cab
         gibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566209; x=1785171009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        b=ePA/fAgjwQZGyt6IqSwwILwuCv/z+pLFcAwBnGe674ON3qZFukBJxqeK1VQKTtC5AD
         3jsnP7WiTUBk0zlpgbOxB/0Y4I/LLWadZ5zD00WQZwTkC6n7a4FZnwc0+r63rBDzJ+4L
         5OestbvzBOPe2c6xdhvdd3cGINpK1e+R+qR01t+42AqtbbIFaf7NJJIzgOu1nKtmFEqh
         UBFzr/rQ99RgMQyYvkjH8U0jPc6atYAA3ct81kEgtU7aeAqz3l4fYm0Of6vMPq69zHBL
         sys7wq/RXztA0TqNvG7mb3zy08RMo4i3h9EukGX0tZHlT4Ptqp6MT9SWP4/NMecm8pXy
         21UA==
X-Forwarded-Encrypted: i=1; AHgh+RpY4UwCx6+mLbfNRDuQkF46Bf+5StHcA0utBc6FcanCHcqE7DlqgleTqdfnjKTp/L0evBr4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6pgYYXY1fvel/1uK5PeYDPnti3Lxztd+fj0+oFjQUOJaywZw7
	YrD0Rt8Io8osEWFk/kZnjlICFLqTDf2dzOLMIWiUYvAqNIpX45cMkZB+T+39Cfs5dHf1kTrLmm/
	TaVZb/CaWUCcjGexfo7VlrGbOL/go1H3eQan13MYH
X-Gm-Gg: AfdE7ckzTJIIEiwusTOUPqFv2JZUEJNaPDRPd9wohbuOKipJMFr6JKSyx3vEF5gOA9H
	hPiMbEphJKuAdcDez2IwNPVJrvbsWLp8sUY+uFQcrg/+bw287h9uw8+5uapnInhjSO/ITaDK5hf
	qVMRvuSQvF+5MEUUcZo5+DJDYFAoaDfKbqbIzJTAcnBzvFKNxPiRx/drEA19XtSFV+b6fNaYTNI
	d7QYlLqXoo4rWQk5Jjurb+9tONrCkmaS6u+zA0cDM54V6acL0jR6MNaIbAnq4jaCf9+oMA4FW9H
	5E+ReV/S+Cf86lYBxIR8tFI7yvJkrcXNW1jM5ScLTSpDsH95dgf1gnR0gmm0ClgIXWtSZ+pHu7B
	h
X-Received: by 2002:a17:907:e917:b0:c15:fc5b:b667 with SMTP id
 a640c23a62f3a-c16b40f8999mr685752766b.19.1784566208840; Mon, 20 Jul 2026
 09:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717141648.1007059-1-linux@yoavmoshe.com>
In-Reply-To: <20260717141648.1007059-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:49:57 -0700
X-Gm-Features: AUfX_myCkoH_ohyvAhDykS-FTisAi77kahkS1sYBNzC30PdiB5itO0E3RJF3Z5w
Message-ID: <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 7:17=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
>
> Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
> for this specific indirect call.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>

Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> Before this patch, suspending the device caused an immediate silent
> hang requiring a hard-reboot. With this patch applied, suspend and
> resume work successfully.
>
>  arch/arm/mach-imx/pm-imx6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498..d9b0c1803 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>         return 0;
>  }
>
> -static int imx6q_suspend_finish(unsigned long val)
> +static int __nocfi imx6q_suspend_finish(unsigned long val)
>  {
>         if (!imx6_suspend_in_ocram_fn) {
>                 cpu_do_idle();
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers
