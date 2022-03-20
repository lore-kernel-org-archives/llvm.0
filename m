Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD73FE6
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 17:37:50 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id hu12so10060680qvb.6
        for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=UpAsH3HNGYUb6pJqoGNbhy4ESgXn7LYmalYBo847NcU=;
        b=JGkyMerAd2g6F8muIKP6vKHK0v40lHv193s/7K77f/6/3RSE90D42rwWgO9T9yN08/
         IEGiL+f+vNycabezRrx40IBJIx1xq8R54iLvVMqzlKFpsY8GlAbvrRSOUofIx1zradjb
         Gw4nCwaxwZvwZeTXmQSoqf4odwfcLQGJWTL7OG1D4zejn+ChGrXQn0dmkyrKGrg/8qjv
         4dNDH3S48w2AzRA0w9PznJM7yBFyVbWLbig9q7xomTEp8XQBUfN4lcB8n8SIHhYPBcwt
         8ENRpNGp7OQsVot7pDepfZvt96m1Jx64kOrW1ISj2fTkTuOArAwwQvkYlTy9NZQoXy7Q
         p7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=UpAsH3HNGYUb6pJqoGNbhy4ESgXn7LYmalYBo847NcU=;
        b=V6Qlsb51WW6p/N8wKYwOoT3rVy+A7LzpcsfJ6iRba2/xIx6HtaXdD0sp8C9rC3v/rG
         xMPjo3f8HHz/F1wiP9ZtEjiCEG+Pq79ECmOulpzAY+78zr0oRktR9Z4/fFAp9+xrwMKh
         PJxLrnqhi5s0UPCqB9NOyxKkYjjZJqCdYlqV3x+Wsaa1MLWWL4tZ5oW75z3KsgI76RT0
         4AXAzoTDVNPihsEDxMN/4TrS9JokxuWk+0bU+yxTzLzmSYcqv6z3POgmOQUsXM3hFzKp
         nMmxHXmj+sVEFenKK0H+5em1ZgJ/agZwND3nGu969+/F2KDcg9Bf1JSPtGylizxyUARB
         D2QQ==
X-Gm-Message-State: AOAM533mDufHvgD4KDsrcVBq8zKyrI//0ISdlJ2jq/BBS02A+85S8cDN
	5JZgvaRaF8nA0+Gpw2K4kg==
X-Google-Smtp-Source: ABdhPJwh8QvADQKYx6DPR/dSdi1tzGg9wqeQVW1DOYXcHRPN0dHNgQHiyPZiuCqDYB1s0/59ZXi2HQ==
X-Received: by 2002:a05:6214:c2a:b0:440:f702:2195 with SMTP id a10-20020a0562140c2a00b00440f7022195mr10715396qvd.37.1647797869914;
        Sun, 20 Mar 2022 10:37:49 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
        by smtp.gmail.com with ESMTPSA id n8-20020ac85a08000000b002e06aa02021sm10151220qta.49.2022.03.20.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 10:37:49 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:299c:3142:517:f2da])
	by serve.minyard.net (Postfix) with ESMTPSA id 58F3F180004;
	Sun, 20 Mar 2022 17:37:48 +0000 (UTC)
Date: Sun, 20 Mar 2022 12:37:47 -0500
From: Corey Minyard <minyard@acm.org>
To: trix@redhat.com
Cc: nathan@kernel.org, ndesaulniers@google.com,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ipmi: initialize len variable
Message-ID: <20220320173747.GH3457@minyard.net>
Reply-To: minyard@acm.org
References: <20220320135954.2258545-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220320135954.2258545-1-trix@redhat.com>

On Sun, Mar 20, 2022 at 06:59:54AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> ipmi_ssif.c:1731:3: warning: 4th function call
>   argument is an uninitialized value
>   dev_info(&ssif_info->client->dev,
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The 4th parameter is the 'len' variable.
> len is only set by a successful call to do_cmd().
> Initialize to len 0.

Thanks, it's queued for next release..

-corey

> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/char/ipmi/ipmi_ssif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index ba779f1abb5b2..f199cc1948446 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1625,7 +1625,7 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	unsigned char     *resp;
>  	struct ssif_info   *ssif_info;
>  	int               rv = 0;
> -	int               len;
> +	int               len = 0;
>  	int               i;
>  	u8		  slave_addr = 0;
>  	struct ssif_addr_info *addr_info = NULL;
> -- 
> 2.26.3
> 
