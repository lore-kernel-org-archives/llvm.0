Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3BF8468
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 20:27:28 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-583d702129cso25829497b3.3
        for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 13:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691785647; x=1692390447;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UbK4nnymHvPms4qLxQwbH3NM35gMPbEu4WBWUEgE1g=;
        b=o7DUElapNyvjmyACrVVOC7+p6ZhVxbT+HsfcVJ6xyq28u+Dhi7Ru9ReuEGNdkOyFnU
         XjZSESoC1/pAOPLHT/2ElG6/JM2ngkQyoiYCdchEJreGZvjKcOwDbB96ctiZwwb1+mzU
         8r9ob4k+1OxsY5EIJEKP2Mf9MPF5fNIrjQxdtn2F81CuB3qbEkgMl8Db2dxZ5uiYt2aM
         a/3s2CUllV78jDpS/UGf/MVZtJN440MTANe5E9lh+3zSMI67qVyueE/IZAXFY5bqAdkr
         ZdICJj/5Er3Vk0NW4nrHc/J7g1hu124/N9Xockd+puGL6F8r9BcBPH7JJEkkhXfq1uc4
         3BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691785647; x=1692390447;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0UbK4nnymHvPms4qLxQwbH3NM35gMPbEu4WBWUEgE1g=;
        b=QMzofxyu6YtSEz4nLqANQWWzb5fBb0KuMcTAU96IICj0ptdMQjNKnTZMJaahYcjjIB
         iM2SD7jmMZnKmZoixnGCz+IO8ywESVvNmM0WjVvGiXMlupVw0nr5qDZKAA1fKnqt2miy
         66pQ2Bh2u5HyS/R1UUtolmrzH9rrlKLTn03w76Xr3piRk7JGU1AF+/HCaNL7U27wc52I
         y/dbuTLk5VGZ++uDCKHRDrPUgbexIIrFP5DEY+GNwyggaBvg99bC83/K8jBTMFAkMfeo
         JEBTMkQb3t+fFRbV9/l/3ru4Om3Zv/mdvSmxiR7dDIJIMolpP2UUA2gYJQXJkUPYjUfc
         nkkg==
X-Gm-Message-State: AOJu0Yy9w65pcedMWEgImK/o6ZE87EwDqzeC11V1Nvmn5gQ0cc6sxGVj
	jL2FAIcFwg+9YK8dg4wpTQ==
X-Google-Smtp-Source: AGHT+IEVW3hz+iAn9LZuVHgGCUAJz9pTjM8+y7T/OfekbKp6pqC7IRoYZBPbj3XM/hqz7mROvhV5yA==
X-Received: by 2002:a0d:f941:0:b0:583:523e:6569 with SMTP id j62-20020a0df941000000b00583523e6569mr2706967ywf.17.1691785647070;
        Fri, 11 Aug 2023 13:27:27 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id y6-20020a818806000000b0057736c436f1sm1203438ywf.141.2023.08.11.13.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:27:26 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:e34a:4ada:ffd0:e7ff])
	by serve.minyard.net (Postfix) with ESMTPSA id 5FB071800E8;
	Fri, 11 Aug 2023 20:27:25 +0000 (UTC)
Date: Fri, 11 Aug 2023 15:27:24 -0500
From: Corey Minyard <minyard@acm.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ipmi_si: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <ZNaZrHEs5FP7Lf8A@mail.minyard.net>
Reply-To: minyard@acm.org
References: <20230809-cbl-1902-v1-1-92def12d1dea@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809-cbl-1902-v1-1-92def12d1dea@google.com>

On Wed, Aug 09, 2023 at 09:05:17PM +0000, Justin Stitt wrote:
> With W=1 we see the following warning:
> 
> |  drivers/char/ipmi/ipmi_si_platform.c:272:15: error: \
> |       cast to smaller integer type 'enum si_type' from \
> |       'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> |    272 |         io.si_type      = (enum si_type) match->data;
> |        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is due to the fact that the `si_type` enum members are int-width
> and a cast from pointer-width down to int will cause truncation and
> possible data loss. Although in this case `si_type` has only a few
> enumerated fields and thus there is likely no data loss occurring.
> Nonetheless, this patch is necessary to the goal of promoting this
> warning out of W=1.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1902
> Link: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note:
> Arnd had mentioned that there perhaps may be some semantic differences
> between GCC and Clang regarding this warning or family of warnings. For
> now, this patch (and others following) will yield less noisy W=1 builds
> and hopefully materialize into this warning getting promoted out of W=1
> to an always-on warning.
> ---
>  drivers/char/ipmi/ipmi_si_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
> index 505cc978c97a..0d509d683c0f 100644
> --- a/drivers/char/ipmi/ipmi_si_platform.c
> +++ b/drivers/char/ipmi/ipmi_si_platform.c
> @@ -269,7 +269,7 @@ static int of_ipmi_probe(struct platform_device *pdev)
>  	}
>  
>  	memset(&io, 0, sizeof(io));
> -	io.si_type	= (enum si_type) match->data;
> +	io.si_type	= (unsigned long) match->data;

Wouldn't you want to use intptr_t or uintptr_t?

-corey

>  	io.addr_source	= SI_DEVICETREE;
>  	io.irq_setup	= ipmi_std_irq_setup;
>  
> 
> ---
> base-commit: c1a515d3c0270628df8ae5f5118ba859b85464a2
> change-id: 20230809-cbl-1902-7532a747b731
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
