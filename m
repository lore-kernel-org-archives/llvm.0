Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043993FC2
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 07:13:58 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso684188wme.4
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0HmQUd2KFMJEUhws1btEzIXD8SogYEoR7cwxsEQ/d6w=;
        b=jdPuxmjy08rSzwXtmZx/XTAI9uH4HxbXAnSV/Hq6aPO/H7xBYiSLSCTqkiNk8wsofJ
         uTQ5grueyzXzWjL8djwIpGBNIf/sY9ApXK2H6raOQk7V94X42VGp64NWOxUgHDNBukZw
         u1lXF2fZoHuf/2tSWtnv1c9OGJPxHP3CUL30HfCGLhmuas0El7bNFlQYD2B7x6YK69l1
         BvtPnGptVm7fH42fGoQrIacGuabyR7I0OGW3B7peEjVPhP7kNFWdcLHDl2JzCLLRu5qm
         KIuURzQMpwKO2+NTQFrUqZ7Nr5hctLeWe4dIOlPiNHsOxllxUM8k2bgeT5BMrLtjep6M
         3ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0HmQUd2KFMJEUhws1btEzIXD8SogYEoR7cwxsEQ/d6w=;
        b=WInpNxHjzi85XpKkIPK2EoaXhdTZu3Zwmj304nyGqHTgRVaDq7l7uKSpoR6pF69gzq
         0OkELAyegqsR2QMmsDB0IGWS6tsEGUA/nQlG4uV99x1WdvGQK6C73quya2visJiAV+pe
         sUI8vq2YlmUtbX9K3NJyjpPIV8RRHCx1Hd8Rl7zm21O/rw8j0MeDGxA6u+jWI9H4B07+
         dapHPijuQ5dLGku3neJTeA0RDqzDT5mt24NagWbr/hq8rJ2j7+9lVv9WvGuU1YGkLrOz
         OTTGHkN/Y4vvsWgSTamvR2PboNarftQDTBEB0jclsQNcDctqDXhsTKchVB7d/kx4MFof
         nwhg==
X-Gm-Message-State: AOAM533n1+MKyXS+eCrZT9nLNv/KEBiS2CVqkMT9m0Dq7VqgN0SC+1yM
	OHfcFbuXwVKYst9HGgIvWyQ=
X-Google-Smtp-Source: ABdhPJynZwaseLpYV2D4ecNg2N/sWyj0LTKW65c2436tejIYwDoIb/EhOV2mWNTEWmJTVuMTZl3Yaw==
X-Received: by 2002:a1c:c913:: with SMTP id f19mr6784575wmb.86.1631258037361;
        Fri, 10 Sep 2021 00:13:57 -0700 (PDT)
Received: from agape.jhs ([5.171.81.87])
        by smtp.gmail.com with ESMTPSA id n14sm3680829wrx.10.2021.09.10.00.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 00:13:57 -0700 (PDT)
Date: Fri, 10 Sep 2021 09:13:54 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: kernel test robot <lkp@intel.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] extcon: extcon-axp288: use low level P-Unit semaphore
 lock for axp288 register accesses
Message-ID: <20210910071354.GB1437@agape.jhs>
References: <20210909151820.5303-1-fabioaiuto83@gmail.com>
 <202109100823.X6Isdxi1-lkp@intel.com>
 <3ecef801-7484-95ed-3e76-e7770146e626@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ecef801-7484-95ed-3e76-e7770146e626@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hans,

On Fri, Sep 10, 2021 at 09:03:42AM +0200, Hans de Goede wrote:
> Hi,

<snip>

> >            ^
> >    6 errors generated.
> 
> Ah yes, I should have caught this, we had the same issue with a similar patch to
> the axp288-fuel-gauge driver.
> 
> The fix is this:
> 
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index c69d40ae5619..aab87c9b35c8 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -23,7 +23,7 @@ config EXTCON_ADC_JACK
>  
>  config EXTCON_AXP288
>  	tristate "X-Power AXP288 EXTCON support"
> -	depends on MFD_AXP20X && USB_SUPPORT && X86 && ACPI
> +	depends on MFD_AXP20X && USB_SUPPORT && X86 && ACPI && IOSF_MBI
>  	select USB_ROLE_SWITCH
>  	help
>  	  Say Y here to enable support for USB peripheral detection
> 
> The new depends on is fine since all boards which use the AXP288 should
> always have IOSF_MBI enabled anyways.
> 
> Fabio, can you send a v2 with this Kconfig change added please ?
> 
> (and please also add my earlier Reviewed-by and Tested-by to the v2)

sure will fix and resend

> 
> 
> > 
> > 

thank you,

fabio
