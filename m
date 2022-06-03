Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D27E
	for <llvm@lists.linux.dev>; Fri,  3 Jun 2022 21:03:50 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id j7so8195190pjn.4
        for <llvm@lists.linux.dev>; Fri, 03 Jun 2022 14:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7yZRjs5yp/zT/zGdulnaH4Ufj6HPVBbkuq4QEuYkSm4=;
        b=I/BJH20dXJsO8R2BkO3xjeeDiB1ZndSp6MLA09ZjWMRCf8pWhMbkIEEsxqsUgWNEjV
         SiOwWkp8wr9v/t4liKKYVd8ls61dVPZ/ghmYp+/Y2V54Al6XHa4ah/cax70mehYBqNu1
         PiDFQacqPQfleXKfVLUMVAuFcZsOVAFuRhujPoP8JomFL6sx9nYG+gN9aCSZkp91pePK
         xsljwgPbvdbvRCcFqV1kdwWerYsN+wXiVHnRcwcDONM6+mXT+8HkLlQ2L6iPqHXkC+GP
         Kplo+59pgVTpTJ5my4omW++47U8DTsFxfhQqutlCuez4Gg01cvrzsekKDSiDCCshSmaa
         0GLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7yZRjs5yp/zT/zGdulnaH4Ufj6HPVBbkuq4QEuYkSm4=;
        b=GXcgzjv/KTl0mQY/1RsAsBE/qZjsDJJ3MlTLhmhDEV/BkxjXqMFUn+4kru3uq12T+b
         kW7FrntL5euohZDugsmxiYO15mH0SFxgJoqaAWmSPul3zCb8qTM1rGuXTgNAG9bHEgQU
         Jc7MjzBJTxrD2WVJRmf4SWJTYLBpON8SW/GRdTNfTGCV9ulu+Fi1Ke/I8OgwtNLxzMfg
         Sf53JZ8RUkW8JSaClnWh5t333GEcohAtUFdkxklusNnGZCnVn+a0HcqXw4Ljygqrw5gY
         uT+uvE8AeIsFnrJmsUrMYG6r9GRUJLP2/RbDnVhlAPgwYKMPq4m5N7i3ouT2EVZJ7iCY
         esXg==
X-Gm-Message-State: AOAM533lmkMJUqd+rzwApPORHGA2fS5NSnQkQnZwMJi5orZ5Ptaamwa+
	T4Xp51XEuvxe3hZ2I50FSnE=
X-Google-Smtp-Source: ABdhPJxhuYfvC5jG0PkzXAlAA/k8DnpSG/2/yT+hjh6CYp6LDTf1macjWgx9jZnX+V2R/RH8TQRn/w==
X-Received: by 2002:a17:902:ebca:b0:15f:4cc5:f40f with SMTP id p10-20020a170902ebca00b0015f4cc5f40fmr11897289plg.96.1654290230100;
        Fri, 03 Jun 2022 14:03:50 -0700 (PDT)
Received: from penguin ([2620:0:1000:2514:216:3eff:fe31:a1ca])
        by smtp.gmail.com with ESMTPSA id g5-20020a655805000000b003fbfa234818sm5919683pgr.54.2022.06.03.14.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 14:03:49 -0700 (PDT)
Date: Fri, 3 Jun 2022 14:03:44 -0700
From: Justin Stitt <jstitt007@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] soc: qcom: smem: use correct format characters
Message-ID: <Ypp3MA9s01bWrm2i@penguin>
References: <20220316213118.2352683-1-morbo@google.com>
 <20220321174912.164113-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321174912.164113-1-morbo@google.com>

On Mon, Mar 21, 2022 at 10:49:12AM -0700, Bill Wendling wrote:
> When compiling with -Wformat, clang emits the following warnings:
> 
> drivers/soc/qcom/smem.c:847:41: warning: format specifies type 'unsigned
> short' but the argument has type 'unsigned int' [-Wformat]
>                         dev_err(smem->dev, "bad host %hu\n", remote_host);
>                                                      ~~~     ^~~~~~~~~~~
>                                                      %u
> ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
>         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                                                ~~~     ^~~~~~~~~~~
> ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
>                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>                              ~~~    ^~~~~~~~~~~
> drivers/soc/qcom/smem.c:852:47: warning: format specifies type 'unsigned
> short' but the argument has type 'unsigned int' [-Wformat]
>                         dev_err(smem->dev, "duplicate host %hu\n", remote_host);
>                                                            ~~~     ^~~~~~~~~~~
>                                                            %u
> ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
>         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                                                ~~~     ^~~~~~~~~~~
> ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
>                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>                              ~~~    ^~~~~~~~~~~
> 
> The types of these arguments are unconditionally defined, so this patch
> updates the format character to the correct one and change type of
> remote_host to "u16" to match with other types.
> 

This patch LGTM and fixes -Wformat warning.

Tested-by: Justin Stitt <jstitt007@gmail.com>
Reviewed-by: Justin Stitt <jstitt007@gmail.com>

> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  drivers/soc/qcom/smem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index e2057d8f1eff..9dd325df5682 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -819,7 +819,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>  	struct smem_partition_header *header;
>  	struct smem_ptable_entry *entry;
>  	struct smem_ptable *ptable;
> -	unsigned int remote_host;
> +	u16 remote_host;
>  	u16 host0, host1;
>  	int i;
>  
> @@ -844,12 +844,12 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>  			continue;
>  
>  		if (remote_host >= SMEM_HOST_COUNT) {
> -			dev_err(smem->dev, "bad host %hu\n", remote_host);
> +			dev_err(smem->dev, "bad host %u\n", remote_host);
>  			return -EINVAL;
>  		}
>  
>  		if (smem->partitions[remote_host]) {
> -			dev_err(smem->dev, "duplicate host %hu\n", remote_host);
> +			dev_err(smem->dev, "duplicate host %u\n", remote_host);
>  			return -EINVAL;
>  		}
>  
> -- 
> 2.35.1.894.gb6a874cedc-goog
> 
> 
