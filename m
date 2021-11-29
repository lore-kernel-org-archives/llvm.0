Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD84572
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638203752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+0UH7faosVx15h46/+E0XlxJz/7Dmc273dgHrakKzk=;
	b=SCrtFlgRH18bubuGaxfWSkSaDf6aSSH78RS+nIQPEIKne3k2bGKAtcSCHSZlG8wQPG7Opm
	Ll3mBiHdiLD9BqBs2FuEZVD3n7rn0WFbFBsEZW8j6iJ0SWrQbAGwsOtumZZ0+fajPoZaPR
	SbtR9FnE4f6VZg+b5/dlCVqRA5sYYgU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-485-zGiLWHKQP2aYzhLnD3M8Fg-1; Mon, 29 Nov 2021 11:35:49 -0500
X-MC-Unique: zGiLWHKQP2aYzhLnD3M8Fg-1
Received: by mail-ot1-f69.google.com with SMTP id n13-20020a9d6f0d000000b00579e30aaa02so9206905otq.0
        for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 08:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=z+0UH7faosVx15h46/+E0XlxJz/7Dmc273dgHrakKzk=;
        b=ua9fqwwcqkl1DZ3utQAZX+DLdO3OSLbVwKhp54kElh+szLeM8WXx/KsV2tqMo/m+Wo
         mwW1RxiPg4tkWjnVEgDOFeCGsedAXhI78XHrcNSdUAhqlkunB9CcPI4Nzg5fSYtXTJ5p
         Q43WzNxHLLIbdLCIZnxznGgaxJZCBHEtNfMsN91RWcDKqv/kSquY7OrcEItRuYT48GXf
         IZGbkhZMOAK9qJPXaJF/lmI5ayblxDqKBMpA/7MYuEiuKxDjG0uFrQmfxli+/m9a1Lxn
         JE4WfO3vwdSATwHFLZpcewc2Y9egnSj1F2YxErKmESSk4ekuxfj/Q2n9P0yZ9DDFMmTD
         bAvA==
X-Gm-Message-State: AOAM532ToPSRud2AoE4A21ZJbHo7Us2GQ26da7ZD1M2Diq4ZN3i66bD1
	c3zgulQEtaeikycWW/4AOit2IQwgfjlQ1tO8G1hPZEos+1vbvgL1wEYjSTjHpfhLQVtVdL+wTJy
	ZoZbK9iVZfMVIWv1910xegGwNjO8zoAlYLyArSnIankbpqMt2KFgMDYYH0T4p
X-Received: by 2002:a9d:12f2:: with SMTP id g105mr45667030otg.301.1638203748656;
        Mon, 29 Nov 2021 08:35:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS/EyfAXGDPdwrwrmhMPGzKG/buDJaP6G2uXiiEwETMILIBNk9kd7VMt0tC6GrUGvPKMhIuw==
X-Received: by 2002:a9d:12f2:: with SMTP id g105mr45666930otg.301.1638203747840;
        Mon, 29 Nov 2021 08:35:47 -0800 (PST)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id a16sm2710200otj.79.2021.11.29.08.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 08:35:47 -0800 (PST)
Subject: Re: [PATCH] fpga: stratix10-soc: Do not use ret uninitialized in
 s10_probe()
To: Nathan Chancellor <nathan@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Russ Weight <russell.h.weight@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20211129161009.3625548-1-nathan@kernel.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <410b9067-588b-881e-da03-fa970ef576b1@redhat.com>
Date: Mon, 29 Nov 2021 08:35:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211129161009.3625548-1-nathan@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/29/21 8:10 AM, Nathan Chancellor wrote:
> Clang warns:
>
> drivers/fpga/stratix10-soc.c:431:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>          return ret;
>                 ^~~
> drivers/fpga/stratix10-soc.c:402:9: note: initialize the variable 'ret' to silence this warning
>          int ret;
>                 ^
>                  = 0

This line to contradicts what you did, to reduce confusion, remove the 
'silence this warning line'

Change itself looks fine.

Reviewed-by: Tom Rix <trix@redhat.com>

> 1 warning generated.
>
> ret is only assigned in an error path now so just return 0 directly.
>
> Fixes: 4ba0b2c294fe ("fpga: mgr: Use standard dev_release for class driver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1517
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/fpga/stratix10-soc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fpga/stratix10-soc.c b/drivers/fpga/stratix10-soc.c
> index 737d14c6e0de..357cea58ec98 100644
> --- a/drivers/fpga/stratix10-soc.c
> +++ b/drivers/fpga/stratix10-soc.c
> @@ -428,7 +428,7 @@ static int s10_probe(struct platform_device *pdev)
>   	}
>   
>   	platform_set_drvdata(pdev, mgr);
> -	return ret;
> +	return 0;
>   
>   probe_err:
>   	stratix10_svc_free_channel(priv->chan);
>
> base-commit: 8886a579744fbfa53e69aa453ed10ae3b1f9abac

