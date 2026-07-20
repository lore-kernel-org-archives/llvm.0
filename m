Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6C239A05A
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566407; cv=pass; b=PXW9J/bxvphrOSmx2PUU05o3bGuLAHiYLkYkOOx66qz2cZKoCZZiT5DtzXxnTFpbWJ2IrFo5/75TfEElRc56rFUAf00mPE5s7JIBCOHFkHuJQ/6bs8HAoZxdulrmTcDBwY7K5utht3o28XYDWfh7+UsFREPit5QWz3YswmCAN10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566407; c=relaxed/simple;
	bh=qSOihwAar06nv8h68gm4bvTuHPJpIJ55wjBa33x1Ebg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wh6JuZ1Cc5tsG5cknv/ZsQWE/D+f8ZNymOVrQ15HZxWFh2/2K4qB6AglIeIWYZSKXzDs62Ko9c4JpghoHvHlP1fqMzw3JL74+pUzl2mABzkAyuxVaXUttxseqE10Ejupe6lSZB+wmkiLTvqZ1q1qT3LKpooYO6BvDyRh7rikWT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uT3A8w2Y; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uT3A8w2Y"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1601d552a8so1100523666b.2
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 09:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566403; cv=none;
        d=google.com; s=arc-20260327;
        b=oyl1nWHrTZMFqMGmTHxVNKw9BYqXlLfNuaWWsAe1ZANt87Bo2WjLBd4hcJgpCF31ji
         Sm6TnecLtsDxb6KngVW/pr81E636jZ4FFucCG7mLn4HC/nVwTrLwINKQYfd2/ACuVVDV
         zIoTdXp0sMy17CarJS6dQNqnPUgkiGnMKdXy7AkSq2aUm4gqQ/9fR9sqTySPwVv0bzsh
         Y+WQVylb2IfWLGjMRsvOgPfYx3D6G5KiuurQvk6m+JSiO2kjt4t2L+ISOQcgIaPiwR7I
         wUATn9QKT3kW9YFzpSNKnZd0aSP+L5eqS8dbLsuh/j/gc3wIrDzEtt3O5ohvGUNzCRVU
         DLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        fh=5NQN/7icYxaqFDH56maaQLXWmVDuvGxz6cbNQhlupT4=;
        b=npjHsrv5BnOiYq+wdJfYF2ZEi1l3GcdFm4Em0KFlwS+N/VPO0KfpRQ1IgvHTWHW8Jy
         SwPVHJduuCC4eW66wnNcW1Y6nN344ugjrbUiJCK9tjP9jJ5/dzdB3JtBTw7xFvSE6u9G
         eW36+Mu0BUhDJ49wAMkE0LZFArgGz9F0yNjsna+f39x2biI3zGf2BxEy6g1qxYtX2D64
         On9jRMNnoSfwDfMaAZ9eA6pYZZ1WD5Ka2dMVRTH6WlT99fI2NWNvma9PhoCLcp1gj2Oo
         x2nRwQGvDk3Ghy84oF/rxkpoATuh4tV/Vdya6WXcSid5lNIH93/iyhXcWCkNiLtrMzNG
         X6DA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566403; x=1785171203; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        b=uT3A8w2Y88d5ds2DoqI+nifI9n9HtJVlqpbIL6edpGUoKRGRVpLDCoGK79eb8tVQQt
         +8E4jpt93CVUmpq2maOiH6Ab9rSG66fk34+2mkz5s1feIrl8uRhpmXJxlPql9n2sfG5s
         0ifYWQqpEpGw5apttu5u36uXQpsthgkVfEgJs+JC/Lr3wr9yMB1vrJEO9Nf9ZFdYFYV0
         /QAi/2F0yjFyQrcCPGQQUc9O88MUitfVj+YOC+6CBIyZJrGgEzfLEgLRihttScUr09zI
         LpsEJNUc5RMnKgffR5rU5IStGihIx6gkXEg4TKBmfCz9BW2w1K9YaBNXxbgqKCSxqCbs
         n/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566403; x=1785171203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TIixJrgxWFhjPBn/7cXBuahRTs588KwiH/BnLWvNO8=;
        b=cRCfejkoHIrueRioRY9uF1dmidGLGw5kX61iOf0Ld20dma9+Xm6uahRzusD0Fd2J9v
         0fqm8LqdGTE8qVJbTQ95jTF2D7o4Ovtl96wQDWzKBJ88t+uosWeGFju7Ae6uJfwbMYCD
         hNopQl9b+6SqY9u4N1B3zpmMrh3SVVHAD8fohiKps7NMh4fV+E4Sv2BFytayR2HjrZUG
         ZtcgjXuDQf5/c+VC61XGCCJ84n8cEPUFQQCWnJUysleqf1GB4ip2Bje23WtAg1meu1XA
         FE35UtQ0AMkolw7zU5HTPx9/SBY4NuaNRPC23fdwFq7GD0alP7QxtPPvJ1Xm1Z27mBSH
         +53Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqy6Vmp2bWy98RZx3w7wuzeCPH5jj6j77/+8iggq3yZOGBp1GEpOhENHUXz8dzgkY76UojI@lists.linux.dev
X-Gm-Message-State: AOJu0YzCa0JG6bQ30MOdHU+yHlbBcucaGxbLREuuE1j9xNYqoLwpfHgg
	gKJYeZaaqbm/4IhOPnsDVzvhu6qKS9gYzJJ1M0/OllFULJZGpcXUXDgLq1S8jcR99kJNOkhkxRr
	TcP6R2lLDVXBGGY+ZsQXf6gm5Go8SeCc/qbEtUr9G
X-Gm-Gg: AfdE7cmIrqCQo/K38skMVAGKWLS7zBn8LySqmS10zqZ+x3Or3ND4vptgvth7grWwVKp
	YB6j4Vp4axrIFsIORk6CTgQqrS44cNYdDVdMIn+/OkUaaujKdYr2WkHj/r7TDqAZfNhqvDLVYAK
	nO06jXFUa4vgShf1XWR8UP0ogYTYdezfpO79QmKt1ad1l2XSB8J6Wq48YXPnl99qzvl3bZw608f
	TwBeZj0M6jXY+YEMH2Gbdo7rSTSKnQYPZFEvk4QqhxWaA92pfqmKbaCTDV1IQtCDandcw5Lc9PQ
	7FFeZIcagzSoEWnp7lpn/neDIn/+uU0EYsbEHW1ti8z0KoU+JLC8MJ9S3mKkOM1MOZOJMP5aAe8
	k4BVh455QmsU=
X-Received: by 2002:a17:907:6d14:b0:c15:e137:d57f with SMTP id
 a640c23a62f3a-c16b48678d9mr657987166b.54.1784566402947; Mon, 20 Jul 2026
 09:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com>
In-Reply-To: <20260718111340.159896-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:53:11 -0700
X-Gm-Features: AUfX_mw9O2p0DT6-W8ngt0co6elfl4BwN1-CYf_F0Yc57cKNxMjDlorSGTBkHkI
Message-ID: <CAKwvOd=eAC-Mz0kZhbHQMFOY=ba=WXDH6X_Zzh6KGfuq5PmJ4A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 4:14=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
>
> To resolve this safely without reducing CFI protection scope:
> 1. Create a minimal wrapper function imx6_suspend_in_ocram annotated
>    with __nocfi to handle the unverified indirect call.
> 2. Remove the __nocfi annotation from the main imx6q_suspend_finish
>    function to preserve full CFI coverage for other indirect calls
>    in that scope (such as cpu_do_idle() and flush_cache_all()).
> 3. Mark global variables ccm_base, suspend_ocram_base, and the
>    imx6_suspend_in_ocram_fn pointer as __ro_after_init to prevent
>    them from being used as target vectors for CFI bypass exploits.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
> ---
> Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> Before this patch, suspending the device caused an immediate silent
> hang requiring a hard-reboot. With this patch applied, suspend and
> resume work successfully.
>
> Differences from v2:
> - Restrained __nocfi scope by adding a dedicated, minimal 1-line
>   wrapper function (imx6_suspend_in_ocram) for the OCRAM call,
>   avoiding disabling CFI checks for cpu_do_idle() and flush_cache_all().
> - Marked global pointers ccm_base and suspend_ocram_base as
>   __ro_after_init to fully neutralize Write-What-Where exploit bypasses.
>
>  arch/arm/mach-imx/pm-imx6.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498..3d5b960c5 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -61,9 +61,9 @@
>  #define MX6Q_SUSPEND_OCRAM_SIZE                0x1000
>  #define MX6_MAX_MMDC_IO_NUM            33
>
> -static void __iomem *ccm_base;
> -static void __iomem *suspend_ocram_base;
> -static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
> +static void __iomem *ccm_base __ro_after_init;
> +static void __iomem *suspend_ocram_base __ro_after_init;
> +static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_=
after_init;

Are we able to just put __nocfi on the declaration of
`imx6_suspend_in_ocram_fn`, rather than bother with a wrapper
(imx6_suspend_in_ocram)? I don't know if that works, but surely you
can test that quickly?

>
>  /*
>   * suspend ocram space layout:
> @@ -360,6 +360,11 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>         return 0;
>  }
>
> +static void __nocfi imx6_suspend_in_ocram(void __iomem *ocram_vbase)
> +{
> +       imx6_suspend_in_ocram_fn(ocram_vbase);
> +}
> +
>  static int imx6q_suspend_finish(unsigned long val)
>  {
>         if (!imx6_suspend_in_ocram_fn) {
> @@ -374,7 +379,7 @@ static int imx6q_suspend_finish(unsigned long val)
>                 if (!((struct imx6_cpu_pm_info *)
>                         suspend_ocram_base)->l2_base.vbase)
>                         flush_cache_all();
> -               imx6_suspend_in_ocram_fn(suspend_ocram_base);
> +               imx6_suspend_in_ocram(suspend_ocram_base);
>         }
>
>         return 0;
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers
