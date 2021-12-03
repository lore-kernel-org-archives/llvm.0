Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF5568
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 04:10:15 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id v23so1353556pjr.5
        for <llvm@lists.linux.dev>; Thu, 02 Dec 2021 20:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5dUl5HdkR0eg9y5QTrryCRoApnzLb7oQF9XjkHY42JI=;
        b=gV83zBXLDdulSwlhGdpvCYxjVPsqVxPWBOWWWdiBlAUASMrjWNDi8E7pagHnSGaM8o
         igAT9MKPPxVf3T4qFkJ6GoB5LPpdv6rlZVhUTbcBpTTt/lv9AfpGCNAJLm+FQjqiHBTN
         Tl4gFuHsfZeboRSlxPOLycOh812lrNzpEmn1CnslopYbiscMM0rR5pb8fOSmb1xyI8yo
         UQ239LvpXEEoRc4TSIK04iIXlLIqOVoexHDK8rdZSJILc8WhPBfCBrPGFPM6Gfy6ZCJS
         wyrfi5ESV9x/Qt3Og97+DN4911o/bJFRGi4ZweJFbF1rb2iHB7KejToMze6WzC2LGOGy
         ypog==
X-Gm-Message-State: AOAM533lnrKP2RpbHu4JGgOZs6IAtFFhPeA9aNPtIxshOfhqE2Fxpd7C
	FC+tqhKEpVXPFovB5b28Nmo=
X-Google-Smtp-Source: ABdhPJxOeK4PB48yR/W31gTuD6Tzw65ltOta9S3mIcP+awksWAaaFA/W1yPncC3RXIPSPnxYeosDXA==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id cx12mr11004583pjb.11.1638504614892;
        Thu, 02 Dec 2021 20:10:14 -0800 (PST)
Received: from localhost ([2601:647:5b00:ece0:aab:34ff:52ca:a7a5])
        by smtp.gmail.com with ESMTPSA id mi14sm3809367pjb.6.2021.12.02.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 20:10:14 -0800 (PST)
Date: Thu, 2 Dec 2021 20:10:13 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Russ Weight <russell.h.weight@intel.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2] fpga: stratix10-soc: Do not use ret uninitialized in
 s10_probe()
Message-ID: <YamYpQfrGcfuOBsa@epycbox.lan>
References: <20211130221123.3800420-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130221123.3800420-1-nathan@kernel.org>

On Tue, Nov 30, 2021 at 03:11:24PM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> drivers/fpga/stratix10-soc.c:431:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>         return ret;
>                ^~~
> 
> ret is only assigned in an error path now so just return 0 directly.
> 
> Fixes: 4ba0b2c294fe ("fpga: mgr: Use standard dev_release for class driver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1517
> Reviewed-by: Russ Weight <russell.h.weight@intel.com>
> Reviewed-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> v1 -> v2: https://lore.kernel.org/r/20211129161009.3625548-1-nathan@kernel.org/
> 
> * Drop clang's suggestion text (Tom).
> 
> * Pick up Russ and Tom's review tags.
> 
>  drivers/fpga/stratix10-soc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/fpga/stratix10-soc.c b/drivers/fpga/stratix10-soc.c
> index 737d14c6e0de..357cea58ec98 100644
> --- a/drivers/fpga/stratix10-soc.c
> +++ b/drivers/fpga/stratix10-soc.c
> @@ -428,7 +428,7 @@ static int s10_probe(struct platform_device *pdev)
>  	}
>  
>  	platform_set_drvdata(pdev, mgr);
> -	return ret;
> +	return 0;
>  
>  probe_err:
>  	stratix10_svc_free_channel(priv->chan);
> 
> base-commit: 8886a579744fbfa53e69aa453ed10ae3b1f9abac
> -- 
> 2.34.1
> 
Applied to for-next,

Thanks
