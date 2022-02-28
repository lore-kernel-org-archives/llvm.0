Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E9B7C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 15:31:31 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 6-20020a05600c024600b0038125fa8e43so89477wmj.0
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 07:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2gH1VCXMJOCAQZMMdwA8NKZMdwDagt75ou8aHbyIUz0=;
        b=ut095mw9H1t6WgZsq59Kx6N6Whm5l58tD/csnQyzg3sRwVkNtPbOH2gIYZjAuTVxAC
         Ce2d7THpNHlx6j19dQe43RctF+aIsxdP0i5oSb2/LWutEn86m1FUcLDgyQX2BjStHyMB
         EIP+HSGqPNF1ba/Ro8mPiVGGLedsrF4z9I0vpxLZRLk35Kr4RD6ckAxQG1AAUK81KCmS
         sBua87VSFTbs7gPuCbUSj/jLl/KeTqu/ugVmvnni49k1SqL8FeOi84ucN/MvOplUnBQl
         ag9y6SNSGeacwbh9fKaddv5Rzrriyli1zWir8LaDgeJu8MS9pNVvVTYLOW25huWzgyyj
         Tvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2gH1VCXMJOCAQZMMdwA8NKZMdwDagt75ou8aHbyIUz0=;
        b=MYuxUrZDZS3vrdoK8N5QzSKFg06XbkRGRC/nC+hohDHk6Inw33t6lggFu1HWsRt9BA
         WN1Is95QsEMIxi8zTHQFcWQQVPOl5gZmY7tKJyTHWaOqr/E8a3NaCQlDzN4HNzQe5Pbd
         c4DlLDm6URDDG5lGa5Y5E+vUKTyOGH3u3VJOfkBXTnpKy0tqhmUzn3oKfREEhYfRYJbd
         fX4AFa6E0ImCgMVccbttYPteRnM9ifGeimEStOJhGSiv9TxY3mnLmvpLILo5gNxyOUwU
         oaNC8ulfo3MwnU6jJZJhilV4qnMO9SPQBmpN4wN7f03cQPMsR/SuwUglyNL8herJ7BGw
         1neg==
X-Gm-Message-State: AOAM532JkqsQJNM9PxJEyGyy/tRTT5VtccKYPYYGAePBnNxb91vAXFb+
	jzj87ZWS4zyLJyvo0q+hwE4Sgg==
X-Google-Smtp-Source: ABdhPJwZs3W4atkmlIldxtmVDitUoNs7+KJXCw3zlG03aFYebo+mCuYCi1jBc6bDQT5J1LiMod30iQ==
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id v5-20020a1cf705000000b0037df2e5d8ecmr13878273wmh.21.1646062290040;
        Mon, 28 Feb 2022 07:31:30 -0800 (PST)
Received: from [10.205.160.53] ([95.83.233.50])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b0037c3659a12fsm18783669wmq.6.2022.02.28.07.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 07:31:29 -0800 (PST)
Message-ID: <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
Date: Mon, 28 Feb 2022 15:35:03 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] SoC: polarfire: fix build warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Lewis Hanly <lewis.hanly@microchip.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220228152658.3367506-1-arnd@kernel.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220228152658.3367506-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I had sent a fix for the build warning on saturday morning - but I guess 
you missed it.

Thanks for fixing it anyway :)
Conor.

On 28/02/2022 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver causes a build warning because of a missing
> prototype:
> 
> drivers/soc/microchip/mpfs-sys-controller.c:76:6: warning: no previous prototype for function 'mpfs_sys_controller_put' [-Wmissing-prototypes]
> 
> Link: https://lore.kernel.org/llvm/202202260947.F5T1YNao-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I've applied this to the arm/drivers branch as a fixup
> 
>   include/soc/microchip/mpfs.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> index 6466515262bd..969b5239521e 100644
> --- a/include/soc/microchip/mpfs.h
> +++ b/include/soc/microchip/mpfs.h
> @@ -38,6 +38,8 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, struct mp
>   
>   struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
>   
> +void mpfs_sys_controller_put(void *data);
> +
>   #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
>   
>   #endif /* __SOC_MPFS_H__ */
