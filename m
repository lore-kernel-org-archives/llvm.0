Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A72C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 18:54:51 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id y4so2500078plb.0
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 11:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+RJ3QsB/eTj+hppcJD0dov4N3cQvPmL3SO8LeLuLjxE=;
        b=cGoej1/n0AWmLNq6kYcSwmgLze3D14Ri+ISowIhXx6YBVHJGP5pMFVcRwfc1oDba07
         7yY8lk5ITAQn55jjUxqGqOGoy7562ygfaBgs6TzSAPVhGTMhHghRY5RJ0gZ+N8nEgnVw
         56hwzg9vvmnD1ndbViuvUPSWlBq/EtFxiuJ9eeJNWrjl2ROKtH+H/VMDzgPxEuToQN2+
         l/2Ou/oAISRdn7eqdPpx5cZOGztPjgqr4xDlgs7Y1udy1IoMR3nV+MEjQ+OZkU9O6Kvd
         c+irOCIFfXCLN1tqpsUGe56b8S1rQB5JTa2p33ehgfmen0wQBX3eB+WodHRViXLbhnZI
         gzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+RJ3QsB/eTj+hppcJD0dov4N3cQvPmL3SO8LeLuLjxE=;
        b=VxMtRLACcblHlgK+HYLpSg23uoAP9YqG0NDRS+Z2X/oz+GCMu9CcO1/5r9QjYdQKDz
         CsK8rwKSn+7FblLG/d3tARz9l+zWh365gShvMsxGgOT54avUGvoAXVFMpio97IH41kZ4
         AdOtw2idwVD121OIABxmObphsuFd7HHBbpomRRnKBdDq4GPVuODK0Dp7cOmiJnMmCd7N
         9AoNUCwplsRx6CvDSi/GQDmE+xulEs6vZ+Le+cC23b/XCBCpEpcQnxODxsCrCpWfGoYX
         o3IN1TMwIDuF5WxSY9S/YKAz07MXvFq1JWGtOqYM2ModuG+sVk40Rvyc6Vh+J/ypjhX0
         px8Q==
X-Gm-Message-State: AOAM533XmEl/y5Th4oSo96yEebrjFfLtpcuxa4SHAtDCCPkPjYuMH722
	2J7Tpyz6Fi+yc5M5/jJpSaFon+SKZ7g=
X-Google-Smtp-Source: ABdhPJyEcfvtJRVdUrVDoOQOkLHEpV0IMoPkeN0ICpx+IXWzGII2NEmobWr1HgKHMWNuNgUx5TbotQ==
X-Received: by 2002:a17:902:ce86:b0:13f:4b5:cdde with SMTP id f6-20020a170902ce8600b0013f04b5cddemr808965plg.22.1634151290308;
        Wed, 13 Oct 2021 11:54:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x9sm6844615pjp.50.2021.10.13.11.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 11:54:49 -0700 (PDT)
Subject: Re: [PATCH] [RFC] usb: gadget: avoid unusual inline assembly
To: Arnd Bergmann <arnd@kernel.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20210927123830.1278953-1-arnd@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <877c70bd-52ef-95ed-1029-e84911e9162b@gmail.com>
Date: Wed, 13 Oct 2021 11:54:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210927123830.1278953-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/27/21 5:38 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang does not understand the "mrc%?" syntax:
> 
> drivers/usb/gadget/udc/pxa25x_udc.c:2330:11: error: invalid % escape in inline assembly string
> 
> I don't understand it either, but removing the %? here gets it to build.
> This is probably wrong and someone else should do a proper patch.
> 
> Any suggestions?
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/gadget/udc/pxa25x_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
> index a09ec1d826b2..52cdfd8212d6 100644
> --- a/drivers/usb/gadget/udc/pxa25x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa25x_udc.c
> @@ -2325,7 +2325,7 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
>  	pr_info("%s: version %s\n", driver_name, DRIVER_VERSION);
>  
>  	/* insist on Intel/ARM/XScale */
> -	asm("mrc%? p15, 0, %0, c0, c0" : "=r" (chiprev));
> +	asm("mrc p15, 0, %0, c0, c0" : "=r" (chiprev));

You could consider using read_cpuid() from
arch/arm/include/asm/cputype.h as this driver really does not seem to
have portability in mind.

>  	if ((chiprev & CP15R0_VENDOR_MASK) != CP15R0_XSCALE_VALUE) {
>  		pr_err("%s: not XScale!\n", driver_name);
>  		return -ENODEV;
> 


-- 
Florian
