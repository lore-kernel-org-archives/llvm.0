Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180C28BA92
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717153; cv=none; b=t4fmyups9lVKG1XI5iYrcV13pFZOMYfyyU52iwaOZ61JLPl8Q046SedFcC4Pc77K8/Tx22Aq1AkPM9L0t+t/E6RQqcfIolQ4WcTgpBdaDQU7q8/3+hZ/MDntvaZyuvxSc173ssNX9u84LXCZtkP6T5xlSwlJY3w1EIIjjK/XInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717153; c=relaxed/simple;
	bh=BhNz9z2uhmXkHpxm02pi4D65XhZgtBupMPkVQYFgDBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnohgKyJmVrUbXW8DO2QZN1Pjo1Ko2602LD17tnakAogwMQdy0M1b304LpGNyrA3BKNlMkNbkQOHN/xKCHKZcqpwvG/AMuw20bz5lqKhxOzwH1XfTchT3WlNYzM4oS0QQfcx17W68FLb0SmI88y1axTIj5hpmSNHerrEuCOA1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=e3BZ4Njf; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="e3BZ4Njf"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6041e84715eso3760045eaf.1
        for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744717150; x=1745321950; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdC+ybos8o0ITBqE7ZOhXVTr+xRo3uW3qXJPs1bo0DU=;
        b=e3BZ4NjftI+yhg8bCE8DQ1KPi3c5f+Ga+ds3vzuGZ2IsePDQAcXPiz7Y1vIwGVSW+N
         43xY9ognEF7YpQyHQ0ZlkW/zO1A2mDPaasOscxhhsNaiO0O+JPx303aFoX7VxDX17skz
         xf81/mNOY1K2KmZPklW/crIT+eXc68bUY5fzdt7yD0UlWn2l1VVpvuE6PxXOib767JVl
         Ga23x8wEtCVte3xDF8xx2K09gY27mCnUzqg/iUPQzIENlyBFWD7BdN7paR7mByKuqgHD
         c3YnHlbr6F3+u0yl5qOsi6bHW6waVbyhAL1nYMTYVDm64VB2D3Y7m4Wwgafv7hrpna84
         bFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744717150; x=1745321950;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdC+ybos8o0ITBqE7ZOhXVTr+xRo3uW3qXJPs1bo0DU=;
        b=BaEfPPUnXID5L/8tV6L7aw3hbSDWNm2TRSxODouhUL4cYiyjhtHmYxI59uHmS3Osg8
         RZ/4cvmfyDa9cXFRrIk4Gq18Y1cGMmvhgl03CpkcU+u1/itG+XKQSb6prSz7yQdhYR43
         dwuoeieFoliiHArk5JgcZ7IjurkNdOdCN8q5oZ1or0Ra1cm8MQzu1IxXXJM3PCV+OKtq
         01Nc2/dZxDMi/hn8WU/kLl7zHcHhwBOUpdxdlwvlheH1lF38UFLLKHbFbI2ZVVNhZfch
         B+Ji5S1oMbp1vhekdPv0z0Yq+BLMXfPB9CvknedHGnm2uLC2UB9iMTriNSeC+8hLlaNx
         xQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCWIcLVY729XwAdRTL6ORU9H613e0DjKfy99BihbpU28Op3y9VPoqESiiRs+Wt8Ex8qsUSAK@lists.linux.dev
X-Gm-Message-State: AOJu0YxHoT5yS+BoOB9Xs77i2ujUM1kL7BzRrnKP00Ak9OzY1cINZjv1
	6Lw9Ub/fDiViLmUEifT6HFrKztzXgkRMNTTRog7Dm0iugdwx7WQkWWQdBrKZysw=
X-Gm-Gg: ASbGncvzCom8y8m65GIQZvTR/iWQ0S/uereyZFimPNTfNwPD7rVlYdnWByDAC+B+I7c
	sPlbE9xmzOs1ekFp/MJ7g2b3jGVBoGcs6djq0pl49/a+5oGg5cZTJ9KcaBl8duwhgGcwesGx6wO
	Gj4TCZaWX7CRxJizkCetBc/3e9POYjX/RTTjg5rs7VhielD8NJdYr/qwUXny0ghXdkrrmHQUbX8
	+0g8ph7ycKb8eteVc7+K1Ax4Wbxr31V/QWgWBXGYKdPOTXWUxuZdppXP4n9oZ9wruJw4yZ53TL9
	J8jCfLb5OzypI2NVeMBgPZGjT0AYE5w9cuP/I0/v4qGI
X-Google-Smtp-Source: AGHT+IEWPVoxhxIvxVHdnqC7V9/omUZ3FlFGZ3fwPxEPX6EqBcnW2Xm7wlYDSJKTdcPaMOSX3JLTkg==
X-Received: by 2002:a05:6820:99b:b0:604:d2b:c585 with SMTP id 006d021491bc7-6046f587ad1mr9852773eaf.3.1744717150155;
        Tue, 15 Apr 2025 04:39:10 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:2b95:bd83:8713:77cf])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f53776esm2340926eaf.22.2025.04.15.04.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:39:08 -0700 (PDT)
Date: Tue, 15 Apr 2025 06:39:03 -0500
From: Corey Minyard <corey@minyard.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] ipmi: si: Cast to smaller integer type without
 warning
Message-ID: <Z_5FV65cyIwiI9rs@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415085156.446430-1-andriy.shevchenko@linux.intel.com>

On Tue, Apr 15, 2025 at 11:51:56AM +0300, Andy Shevchenko wrote:
> Debian clang version 19.1.7 is not happy when compiled with
> `make W=1` (note, CONFIG_WERROR=y is the default):
> 
> ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>   268 |         io.si_type      = (enum si_type)device_get_match_data(&pdev->dev);
> 
> Fix this by intermediate cast to the uintptr_t, that makes compiler happy.

Unless things have changed recently, Linus prefers "unsigned long" per
https://patchwork.kernel.org/project/linux-hardening/patch/20220616143617.449094-1-Jason@zx2c4.com/#24899749

And it would match what is in the match table.

Is that change ok?

-corey

> 
> Fixes: 5be50eb5ae99 ("ipmi: si: Use device_get_match_data()")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/char/ipmi/ipmi_si_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
> index 550cabd43ae6..47d3cbeb3fa0 100644
> --- a/drivers/char/ipmi/ipmi_si_platform.c
> +++ b/drivers/char/ipmi/ipmi_si_platform.c
> @@ -265,7 +265,7 @@ static int of_ipmi_probe(struct platform_device *pdev)
>  	}
>  
>  	memset(&io, 0, sizeof(io));
> -	io.si_type	= (enum si_type)device_get_match_data(&pdev->dev);
> +	io.si_type	= (enum si_type)(uintptr_t)device_get_match_data(&pdev->dev);
>  	io.addr_source	= SI_DEVICETREE;
>  	io.irq_setup	= ipmi_std_irq_setup;
>  
> -- 
> 2.47.2
> 
