Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA031F708C
	for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574674; cv=none; b=KBeGmzVAWfaFTlDeCGJ/7aVrEQvcigtvZfzXQohKFVq7fLdthEA4WUgBBhKnSwsL49y7zSMnwi8ehwXEHhLBXs4ms9/05vddAJeAkTcLy8fEks73FFsT7GH+vM6awZ9RwEx5HyCj97SqJGNzZnyohVGatrlyFfqz3SULYPl1NYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574674; c=relaxed/simple;
	bh=rwLTIjTp1zdqDObkdY+d+liJFZYYxTRT5NDlHebd/78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQ3hSlPwTewFlbbpe6+oiuP2ieuGqRrtmpdgduBCzXytWlhP+w0oSR2DTm5fz9PFsFEQBKImU7mxShINRSTVSMXIGZ38i+nMDhNLRkrXptaVvLHeGPqGdhVqbb/qfAokdlXyO7wRro1EVudvIR8qrMjyEIxhZXaAPUtZ+eOu0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ElDzoWtq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ElDzoWtq"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cf71986b67so436048a12.2
        for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 00:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731574671; x=1732179471; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbQDz8bnzrpIu+TOHQPeiD1K6+1spFdelZENd64veIQ=;
        b=ElDzoWtqM94zE2WZuZmY9OLU+nKmb3O4xovLdTg4Hg129LX/heXW0qFbvIB6B9gSiA
         jQO8axlid2SUgi0NWgjP7rM2Xju4bPMOOhbgMJD0tkdQ7zk3GLzXDIYdYxf07hLXp19F
         LcrLrGJVNuVKdOQda+9kBybqAkQXXIcFLxile99G0IrdfbM7vYbgPkqh9Ga535OVKIdj
         RiNyvG/ojnqbxaEOcojl3XrQvt/xAXNt820JQU6SvOFphK0TwjBOn3rbn+61FWAVcAs2
         kB60uOwfoDyFLAgVVW6952zrM410R9SyX4300xdUYtnpH1slL39sv3roIAE4c/uDPnqD
         VFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574671; x=1732179471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbQDz8bnzrpIu+TOHQPeiD1K6+1spFdelZENd64veIQ=;
        b=Gz4fMEVsz9XqyE6IKipzWKFFGzG28eU91dm7tJUVxrdDqoptvveVtG5Q/D79BQ6z1o
         bM4kEw3KfKo7MemFPXsgyjxPfmhCGWLC3MG5pawTcuMqHC7Op1p+p+QCOjMTEwU6H/fZ
         8VeWqmt/40JIIj9JWrODrS/zvZ84e/bVOsNz6db9bzyoJ7mzdqAU8JRkndk0xMFP9yjF
         HuR/qZKoY0hOU5g2jXX5+3KCbfoWwHrzPzxSNKegdM+eYEtEhpKtXkXGgL/gfAApZeqN
         TYKEtd7xhFwx7a57+2wCaSbA1OIurwYDAXDDwSRd8XJndlp3YClrqD3bCSYFQU+QIjAh
         wL1w==
X-Forwarded-Encrypted: i=1; AJvYcCX5kS64DUEPnMaPywIXYtEKVNH+NebnxzV6MIXXnho+SKN3DufLkuCSWdhAJUz8znRekxGu@lists.linux.dev
X-Gm-Message-State: AOJu0YywQvpPmCeX5q/0+NxP/YLfGsVaB+nRFw/lteT9Lf6/VMW77SOX
	PEV74soOmBExwszDX0FT+nD6tlA8dbJO+zlpMxx1l2RIhq7KCYnrBmdKYZ7lM4E=
X-Google-Smtp-Source: AGHT+IF+lgQLdO4dE5if0pVOm/wKl9mRYOB+40nEsOkzxOGa7AvqMKFsDRtr86qysSD1D/s8l9jt6Q==
X-Received: by 2002:a05:6402:2355:b0:5c9:8a75:a707 with SMTP id 4fb4d7f45d1cf-5cf0a306754mr17336067a12.2.1731574670997;
        Thu, 14 Nov 2024 00:57:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79c0ad33sm355356a12.65.2024.11.14.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 00:57:50 -0800 (PST)
Date: Thu, 14 Nov 2024 11:57:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: stuyoder@gmail.com, laurentiu.tudor@nxp.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc:  Fix the double free in fsl_mc_device_add()
Message-ID: <b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain>
References: <20241114082751.3475110-1-suhui@nfschina.com>
 <656ca826-cb81-4b46-8e15-ec0b1044db8d@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <656ca826-cb81-4b46-8e15-ec0b1044db8d@stanley.mountain>

On Thu, Nov 14, 2024 at 11:41:25AM +0300, Dan Carpenter wrote:
> On Thu, Nov 14, 2024 at 04:27:52PM +0800, Su Hui wrote:
> > Clang static checker(scan-build) warning：
> > drivers/bus/fsl-mc/fsl-mc-bus.c: line 909, column 2
> > Attempt to free released memory.
> > 
> > When 'obj_desc->type' == "dprc" and begin to free 'mc_bus' and 'mc_dev',
> > there is a double free problem because of 'mc_dev = &mc_bus->mc_dev'.
> > Add a judgment to fix this problem.
> > 
> > Fixes: a042fbed0290 ("staging: fsl-mc: simplify couple of deallocations")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >  drivers/bus/fsl-mc/fsl-mc-bus.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > index 930d8a3ba722..8d2d5d3cc782 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> > +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > @@ -905,8 +905,10 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
> >  
> >  error_cleanup_dev:
> >  	kfree(mc_dev->regions);
> > -	kfree(mc_bus);
> > -	kfree(mc_dev);
> > +	if (strcmp(mc_dev->obj_desc.type, "dprc") == 0)
> 
> This works, but it would probably be nicer to write this as:
> 
> 	if (is_fsl_mc_bus_dprc(mc_dev))
> 		kfree(mc_bus);
> 	else
> 		kfree(mc_dev);
> 
> That way it would match the release function.

   820          mc_dev->dev.release = fsl_mc_device_release;

	[ snip ]

   891           * The device-specific probe callback will get invoked by device_add()
   892           */
   893          error = device_add(&mc_dev->dev);
   894          if (error < 0) {
   895                  dev_err(parent_dev,
   896                          "device_add() failed for device %s: %d\n",
   897                          dev_name(&mc_dev->dev), error);
   898                  goto error_cleanup_dev;

I don't think this goto is correct.  I think fsl_mc_device_release() will be
called automaticall on this path so the goto is a double free.

   899          }
   900  
   901          dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));
   902  
   903          *new_mc_dev = mc_dev;
   904          return 0;
   905  
   906  error_cleanup_dev:
   907          kfree(mc_dev->regions);
   908          if (is_fsl_mc_bus_dprc(mc_dev))
   909                  kfree(mc_bus);
   910          else
   911                  kfree(mc_dev);
   912  
   913          return error;
   914  }

regards,
dan carpenter

