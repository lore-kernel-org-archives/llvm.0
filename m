Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB11519BC;
	Sun, 13 Apr 2025 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541419; cv=none; b=IdWtdhS6Wb2gWVWI44Kk7pgvX3wd9sJJ4EVey7LR/nAlXHwOE9PBnf26/GT33120mho7QzVN6teaSMjdbLC6+uso8jc2udMlvuLwf4gp6G8E4AJ60LY/amjJBVPArK+f2K0upIzfHX9sR0LYjNkP4vyl5dbQQzao2S4/r/Q3l3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541419; c=relaxed/simple;
	bh=nPpW/rLTRLacqlEkhK8H0le2bB71Gb08AEC9nY/Oops=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzRQLhBgSp21GvlH51lU2WnVdqj1fM6uPmSOd1RBM5QIrrir09x7gwLsOXHXxnhYwOkxgy/j0H5pQCWBiZrfG6hwOlvETzATV1TXFkIKHp4Qmj7YryAk2m+x5aU++uqqYhII892oHW7vvkRH4ZGsU1uFb7wCmMjhFqUW2DFmH6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTaraAX4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTaraAX4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27023175e9.1;
        Sun, 13 Apr 2025 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744541416; x=1745146216; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnS2vv43STetwOnQ+/gZ9IZihJGIDun4siJ5AOVvyV0=;
        b=gTaraAX4z++etLG85hYzo+NnJV3gcDER3t3LafPERxsatLOG5U9MoQ0cb8XF39Fj/O
         l0RDJwR/xGT+aLFEEeX8syYYDQ58QlxWww5rgaAYsC0wwJTpXlKtve/X3kI+nPqmJ9wZ
         REc2U1yqxejES5hueOdyJhDCZEfmD/od2NRuOD0vswgit/Ox2Lh/p6enUbnW4VKcaEVB
         jn5rMIYqlalgVK/d62dI2/dImTEBJy3eu2R7A8AogQ2+SUXzTx5WxZ0ulp8D/RUSN8J5
         EuTtqGlovHD7d4GXbFQOTV6Gm1a19AmKid3ZGKkAjv+0Lw3SLLXJMlTULPgJiKh1TJRT
         X25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744541416; x=1745146216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnS2vv43STetwOnQ+/gZ9IZihJGIDun4siJ5AOVvyV0=;
        b=Z1z43ON7t20Xf0yCY0RN7imZFXGPNI0W36tHKtomgeRd566soC5msTVd/S9XTcpwkw
         lKrXIVsjMBDG16VcQlvykY0d9c2EfCpOhaS7YLXrhV/BUoRzbh6Jhh3C8sIuoc8MW7P7
         u3ZD+s+xeeZDB9V29a0Jg2AJcbAYjpCr94Z6mhbKl6kttSEaou5NAYV4sAOoJ3F1Zh9F
         mtvat4J0JRfARSbt+i7F1adkKtoO4U6ubF6uE6C6E5+dxt/U5y13mwZRy4S1LvPWMEbk
         CB/9kssIhZr84axz0kTahcn6Q9YAL3F0RAgKJLU0v+heK00YEdbQPkCliPpHF2pv4/Xt
         DKTw==
X-Forwarded-Encrypted: i=1; AJvYcCUnfYjKhSyRboK0bmpsq6ghk6Z8vA0XqQ/ZF8YfOzSD1/Zw9ZNIRjFxZIMinb8EuaaVOkbK@lists.linux.dev, AJvYcCWbhUc86U82v1FZcdycFntXD6Xpnh2umIEohcY9BuBi0cpNKGrBEksytFsKSY8XLpu/vhXopu8sAHCsqvKKoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9NPUZKxsy7AH+8pHHo1hsTfpUnDkzEcNYfRUjlM6FpHofQ4m0
	6tAh7QZ/YbFSFu3SCQpgUgg+FWjlt1EGv8u65p+UXcfzTCF4FgvG
X-Gm-Gg: ASbGncthIWu8G7shxi1wICPD6y8WpGM6tQWwWR2NOI0gKFF18ETs1wGpFRdVlP0oisU
	AvkyO2/RY6O8LfoaAQEavAxUj6ak29eVtczPXPvAbtfFcazmKfktWSWClqHozHWLl7Zu2lh9Ziw
	a8UuE9eLnI1P8gNis1b2YrR5EgquZbA+dSZl6uiMsvQhWzgqls23PztBC23AV12WTj4KIEQfKSs
	hQ5Qz72EHLKDJZINHag639TjYqVn2izcWsjXxxAr5Ym+sxz63hB12vaIiNroEh97a1F8QR8g2vu
	A00W8PqDZh9e1A9UhINuvDroYgJfRRp07y2HVg70J7ryV1pSinwy16Y=
X-Google-Smtp-Source: AGHT+IHsX3Q+yhSQiC2xzt56fxtaYD0PiuvXdfPybLE+YFjCU4IkOhXtzmd7puI7yABHfMjXmjTvaw==
X-Received: by 2002:a05:600c:c06:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-43f3a9b00c2mr71671995e9.28.1744541415424;
        Sun, 13 Apr 2025 03:50:15 -0700 (PDT)
Received: from qasdev.system ([2a02:c7c:6696:8300:71dd:ba03:ed49:5ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d92csm143779875e9.24.2025.04.13.03.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 03:50:15 -0700 (PDT)
Date: Sun, 13 Apr 2025 11:50:00 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: jlayton@kernel.org, akpm@linux-foundation.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ref_tracker: use %ld format specifier for PTR_ERR()
 during directory creation failure
Message-ID: <Z_uW2DLS7_NLU4gh@qasdev.system>
References: <20250412222744.9459-1-qasdev00@gmail.com>
 <20250413013245.GA2989337@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413013245.GA2989337@ax162>

On Sat, Apr 12, 2025 at 08:32:45PM -0500, Nathan Chancellor wrote:
> Hi Qasim,
> 
> On Sat, Apr 12, 2025 at 11:27:44PM +0100, Qasim Ijaz wrote:
> > PTR_ERR yields type long, so use %ld format specifier in pr_warn.
> > 
> > Fixes: ada5a12aae58 ("ref_tracker: add a top level debugfs directory for ref_tracker")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202504130520.rX5EVbVq-lkp@intel.com/ 
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com> 
> > ---
> >  lib/ref_tracker.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> > index 4064154252a6..02e9f0c3dd82 100644
> > --- a/lib/ref_tracker.c
> > +++ b/lib/ref_tracker.c
> > @@ -283,7 +283,7 @@ static int __init ref_tracker_debug_init(void)
> >  {
> >  	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
> >  	if (IS_ERR(ref_tracker_debug_dir)) {
> > -		pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %d\n",
> > +		pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %ld\n",
> 
> While there is nothing wrong with doing this to resolve the warning, I
> think this would be a good opportunity to use the '%pe' format specifier
> [1] instead of '%ld', as that will print the symbolic error name (such
> as -EINVAL instead of just -22) and make it easier for people to
> decipher what has gone wrong.
> 
Hi Nathan,

Thanks for the suggestion, I think this would be an improvement over
using %ld.

Would you like me to include you in a suggested-by tag in patch v2?

Regards,
Qasim
>   pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %pe\n",
>           ref_tracker_debug_dir);
> 
> [1]: From the "error pointers" section in Documentation/core-api/printk-formats.rst
> 
> Cheers,
> Nathan
> 
> >  			PTR_ERR(ref_tracker_debug_dir));
> >  		ref_tracker_debug_dir = NULL;
> >  	}
> > -- 
> > 2.39.5
> > 
> > 
