Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572814;
	b=1CTaElcUMW2Nt+QfVthcwrKCIgG2j2UsWNTMZtb3MYG7QQShPXlQuB+YWlEp+kJ25h4m
	 /D0SqelbMjh3GVAUSlx8fOCt2lLF4cO6+P0DNIhM15YyvksmXnEq5q4dMqTjPTL9nj7EJ
	 ZYEOjgJiT7MroGKrKxN7Tp9B6dhEFiMS8bnU6lcIwMJyNsL9ZLabWUXLEvfjLBU+YsDiu
	 kgkBfNe2/vDzfd/i+t2+ogOb7cv93Dr15jbJaN1ojufgGhcqQBUSCuv1u07bjvYebJKiA
	 EhSDS3ZAcXRlgAhlLUFwNktIlyboCdAC0cgg1bKetJl/V2O80cCl6FOZe6t+uIJva8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572814;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zz0SgYmzMlFmYbvywWRdsNJhbZCdEWF94qrr5u2SZBg=;
	b=ACQUwOqsV761a94dVloihopGM3hvLP3X78ox9zceDWCFFiYYsKlERvETX/9FbDJxBG8m
	 IyIkPJ+EMZWThrWLQ49ikQ2yrdrbzkutpRNzffl3GEvlW054Sj/v/zLYguELfNQT5nxR2
	 lt6Kufc1i5BF18sNOIN5HEaueCn4bzeMjjw1+VA2I84RVGI9zV7tMMwxr064Nn9dzuE5M
	 XU8RLel86Rf24m6P5nzGZOXdKyLAHGc7izrYG9TJVXwiKuk2IDn5J0ebqs21TBxraY97y
	 3voLK2JaZ1PQC3Vdma8IcihRlwrZRtPQrNRzmegYaHfOYhNbMaFGu60wwoUoLT04cNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GEB8z/uT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD2606A326;
	Sun,  1 Nov 2026 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEB8z/uT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB1F1F000C1;
	Sun,  1 Nov 2026 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572814;
	bh=zz0SgYmzMlFmYbvywWRdsNJhbZCdEWF94qrr5u2SZBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GEB8z/uTQp1CRy8jvIiM4D3Tva+bUAi1CqUQ0LJdgHgywDg9ZzPO89IQ2YwunLrrF
	 nBWDsAqeAwEYkB46xe1aKwLJX3/z+lQNcuikoGXr/s7iAD/tMEsGz8yow3dfHuxrSA
	 jnGt1Trhrslmy3Pc6x/bog8KFbtwtcoqyubFtmRqiGv80+Gwjww9G6Gh7JWHk/XVul
	 U510JibNyuI59Yw4IYoDvfGa1iqvUs4M4UtTRoV9PXYmpYrevq+Me1QZEwWFijEypH
	 yHCbYQo8ScidZSHAePpYaXp8w68yVMG8ulLtKqFEFBBP626Y0Gup3lDRAV8OO0hQt/
	 86TTR7aRak/TA==
Date: Sun, 1 Nov 2026 15:40:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Fix "no-cfi indirect
 call" warning
Message-ID: <20261101224008.GA910831@ax162>
References: <20261101095538.1046918-1-l.scorcia@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101095538.1046918-1-l.scorcia@gmail.com>

On Sun, Nov 01, 2026 at 10:55:31AM +0100, Luca Leonardo Scorcia wrote:
> After converting the driver to OF probing, kernel-test-robot reported the
> following new warning:
> 
> vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!
> 
> This occurs because of_device_get_match_data() returns NULL when
> CONFIG_OF is disabled, which results in LLVM dropping the kCFI setup
> since it knows that there is no valid target for this call. Adding a
> check for a NULL timer_init avoids the warning and it makes the probe
> more robust since of_device_get_match_data() could return NULL even
> when CONFIG_OF=y.
> 
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel.com/
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/clocksource/timer-mediatek.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 842d6ee4259e..e772f5fe8742 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -353,6 +353,9 @@ static int mtk_timer_probe(struct platform_device *pdev)
>  	int (*timer_init)(struct platform_device *pdev);
>  
>  	timer_init = of_device_get_match_data(&pdev->dev);
> +	if (!timer_init)
> +		return -ENODEV;
> +
>  	return timer_init(pdev);
>  }
>  
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan
