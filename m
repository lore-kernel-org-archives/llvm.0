Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CEC2C9C
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 16:59:03 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h10so16658867wrb.1
        for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=tg4oCMG6li+TDjSwe6u86VlYXa8liJ00jWszISs+oTI=;
        b=XEOBIwW/kQkclrF8e9c9xVwCab3wDlckLrQdSpSP8Q6g248n17tpuLNk/YrLR5DN5G
         polByyx+FxbcK+p4gvaiqo0wiHU6seMH9LcQqa7YxAMPHhQcjYrh6Vgp7B4/6dVr6OKN
         TU6gfhObqGnrBwxCL2NDWL66X4p7lARMmmf0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=tg4oCMG6li+TDjSwe6u86VlYXa8liJ00jWszISs+oTI=;
        b=5ulSibp2yCzzEZckCKVEcpEMTPvtrbe3Bn2F1WgkujTBL7VpwmBIEzg5aq7D5QAlNB
         Lc1JcaBN16M/kCDukUI+/tMFppqTbzFvgeHpH9bWmLXBDw65V06lcH6HQBJSdjwq8Mq5
         J+VlZ2OxUUagUtSrIHt7SzbuCGFQ3qXJA1fsw6KlfLu1A4EKYrEfLAU+J4tV7c6OfY09
         kCW+f4mKKZFx68hImufw9RjwCqj8w3K5WhvyAzDDm+QYLrgn2Jh64pzbkXLhsqM79SZh
         Eb/ylFzp12Hfm1FERqyEwYifCgWOZ/60c4Xe/hJ02wh+dGCdKvWsO0mSGhz9y3EwbKsA
         QisA==
X-Gm-Message-State: AOAM530Y7Opdqx0vFpkC39VWRO3XanWsxCg9oVzB74UjhRcuFYaj/uuL
	Y/4LoPDHtyEhBDoLcGthVZB48w==
X-Google-Smtp-Source: ABdhPJyKiq9MKoMx2tCGoLdeoS50UBy5IjTi4zD8ToVwJYkKEf3eHDu/vOLA1ET+NX5npL0uE0wh8w==
X-Received: by 2002:a5d:6903:: with SMTP id t3mr8826258wru.353.1642179541790;
        Fri, 14 Jan 2022 08:59:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm1549490wrt.37.2022.01.14.08.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 08:59:01 -0800 (PST)
Date: Fri, 14 Jan 2022 17:58:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: s3c-fb: remove redundant initialization of
 pointer bufs
Message-ID: <YeGr01WGTSy+PYXr@phenom.ffwll.local>
Mail-Followup-To: Colin Ian King <colin.i.king@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211230160626.404072-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211230160626.404072-1-colin.i.king@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 

On Thu, Dec 30, 2021 at 04:06:26PM +0000, Colin Ian King wrote:
> Pointer bufs is being initialized with a value that is never read, it
> is being re-assigned with a different value later on. The assignment
> is redundant and can be removed. Cleans up clang-scan warning:
> 
> drivers/video/fbdev/s3c-fb.c:492:16: warning: Value stored to 'buf'
> during its initialization is never read [deadcode.DeadStores]
>         void __iomem *buf = regs;
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Both of your dead store fixes queued up in drm-misc-next for 5.18.
-Daniel

> ---
>  drivers/video/fbdev/s3c-fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
> index 3b134e1bbc38..68408c499627 100644
> --- a/drivers/video/fbdev/s3c-fb.c
> +++ b/drivers/video/fbdev/s3c-fb.c
> @@ -489,7 +489,7 @@ static int s3c_fb_set_par(struct fb_info *info)
>  	struct s3c_fb_win *win = info->par;
>  	struct s3c_fb *sfb = win->parent;
>  	void __iomem *regs = sfb->regs;
> -	void __iomem *buf = regs;
> +	void __iomem *buf;
>  	int win_no = win->index;
>  	u32 alpha = 0;
>  	u32 data;
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
