Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E924B22
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcFG78v4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b2ad4953cso34204025e9.0
        for <llvm@lists.linux.dev>; Mon, 04 Dec 2023 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695495; x=1702300295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7CvBb5ez2rIHJbMByjNRmxDcnijZJnzjRDM0SVuuo8=;
        b=pcFG78v4W2SgdDC2FfG2OWXY3FfX8gR6BgPPXBZEOz4UKfXT1DyBWGRKjr0SGjEkt2
         pfScKMMRnT+NjQFmJPCea78etELhIOKvX0l4oH7AIGe0V7QwT7x26O+q/ZLyjDNy4/Md
         cM6wRqtsO+QtSFXo/EUTEZ48MoZ7AYwyZBvDjUDv02FMOlF3tE1/e4YW311JazGhSe28
         cFl2MLkMvTAsN9QQcRWkr2bWurCWa+Otv3JN8JHvwA6hsKDZFqLJJCLpTV7pOaeubt/E
         x1jy6hneK+2c9Itk4Y5prm/cioTMbVeeWJYnDfc6b+PeSWYt46zZjnIZ6ql7Ex1VKrfb
         Ltbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695495; x=1702300295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7CvBb5ez2rIHJbMByjNRmxDcnijZJnzjRDM0SVuuo8=;
        b=IPRefBopMHjDZgIQ4dj7OWItUHJEpdZTTwAbjUdq38mJfzr3wzxGUSJMvZHHxkf1Zv
         krSQ3FLwll/zwulfYa1kbTxNW5FKspWMaGjh2d7F8KoPk+DOb8RDOcQcrAOU8aD8Uzw3
         iL5pI48dyiTg6+/r2MCDe5QF/WPf8ed6MylFFayiNkf1IHzWr8BVzUaPPCfdIsgDOK8K
         9Iix4Iyln+n3g3TEEJI0Q/mpzHkL2iL+5fiVJnwuKwoMM89YzZCIcyDWOfzrVSkrvZ8M
         Eo+hAnfQN/OyUN9J/rFNeX8VxzjzFwCoQeotaBsvrlhYSn1HMPNUIKIhdzETI5xOl4KX
         V68A==
X-Gm-Message-State: AOJu0Yy7LvbXy9tx3uTfSL0d+8JljK5BRYosj99/nUhrMAtPjba6/4PI
	6WA5RnEshOxpZI9+EIbcVyG46A==
X-Google-Smtp-Source: AGHT+IHw4m55StfKreagQZR9FEW5SpMZuKW7wPpRItxPU+RJscZo0a8NGKblqE4YoqlOtE3KO/Q3zg==
X-Received: by 2002:a05:600c:4fd2:b0:40b:5e56:7b47 with SMTP id o18-20020a05600c4fd200b0040b5e567b47mr2967883wmq.144.1701695495247;
        Mon, 04 Dec 2023 05:11:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c311200b0040b42df75fcsm15017507wmo.39.2023.12.04.05.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:11:34 -0800 (PST)
Date: Mon, 4 Dec 2023 16:11:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Su Hui <suhui@nfschina.com>, alexander.usyskin@intel.com,
	tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] misc: mei: client.c: fix problem of return
 '-EOVERFLOW' in mei_cl_write
Message-ID: <bd13cda0-6437-40fa-a73a-9770be6f0167@suswa.mountain>
References: <20231128014507.418254-1-suhui@nfschina.com>
 <2023120452-stool-party-bf2b@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023120452-stool-party-bf2b@gregkh>

On Mon, Dec 04, 2023 at 09:00:42AM +0100, Greg KH wrote:
> > diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> > index 7ea80779a0e2..0489bec4fded 100644
> > --- a/drivers/misc/mei/client.c
> > +++ b/drivers/misc/mei/client.c
> > @@ -2033,7 +2033,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
> >  	hbuf_slots = mei_hbuf_empty_slots(dev);
> >  	if (hbuf_slots < 0) {
> >  		rets = -EOVERFLOW;
> > -		goto out;
> > +		goto err;
> 
> Please prove that this is correct, as based on the code logic, it seems
> very wrong.  I can't take this unless the code is tested properly.

Hi Greg,

When Su Hui sent the v2 patch you sent an auto response about adding
stable to the CC list.
https://lore.kernel.org/all/2023112042-napped-snoring-b766@gregkh/

However, it appears that you still applied the v2 patch.  It's in
linux-next as commit ee6236027218 ("misc: mei: client.c: fix problem of
return '-EOVERFLOW' in mei_cl_write").

When I use `git am` to apply this patch, then it doesn't apply.  However,
when I use cat email.txt | patch -p1 then it tries to reverse the patch
and apply it to a different function.

So this a kind of confusing thing.

regards,
dan carpenter
