Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA681F7576
	for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731573694; cv=none; b=U0srrHE8SNqlngw7TctwXnRnhcTbxR0YBRh5rdEgG2dMfE+zpmhRAcUhlo0vRsYCd4XYs8fYwzV8QHFC1+HRZh+3RqiWKfgoXN2S3VVaCsVb/0EiuiVMN8GjXJL4J22zQJEYDWCM1E0FkECzpEo92E5HGn0d3yiaJwXOXk9e984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731573694; c=relaxed/simple;
	bh=UdXM30Eaq47W0+zS0vBYvZ66OxLpHawzDlCEIhx6fk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfOfYpwOa4OXHUOUx6pptC5GboiQHJzYkI81WJ25hIvhMpRpuo8M7ux7PeeNWLSOtqBIUPXdIocdEg0krsA4GGTzD7Mc/Co+IO/eCuM40RtgCq9SUAYcH/RgUHncln+gQtRh+HNbvdyqGsqY9uyksvy7umD5nCDOGMFG4/hZ7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZ0dCVKh; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZ0dCVKh"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb561f273eso3115171fa.2
        for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731573690; x=1732178490; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0hbYbXTm77yMushKGHFUWiNBHnfNqWh3DD0ZOtWocto=;
        b=uZ0dCVKhecsUVbh0AY9uqWo4RmQBbbNI/ub1nolPbT0sQNy+w/yBtKkfUO9dUVjkHv
         vZFC+0b1hADt2t8fmG1OzIsSTda99ns9K+2y6923rSdkts/MNXLoWnD0xexk/eKVExDU
         S+vvg3rmy75cUJjVwhtRVrG0hHAVd+tXqhMSQEoAe07/PCiMHhukDbNDY0mgdynMfiNM
         rn46h90vRxCC0OJCXvBiwNQdZVEil41pcZuXOevJ5TeNMfCFhnv58ZNfbYfwnwRUkyMz
         1s2idPOlsgr+1/gNuGzdWYAnEAlpp71M66iFykuqsCXc8/QzStuYIFTiqZijvMZmcLxe
         bBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731573690; x=1732178490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hbYbXTm77yMushKGHFUWiNBHnfNqWh3DD0ZOtWocto=;
        b=axMFbaEoIR7tfCVzWqZYXXIRlKoD+Sc9Zpa1oPmKvU+LdrE6Qr3EklwIbahFlQuto1
         k5G40nzr3lSlPjw+2f9Gw3EePFnEhvSgHuw62L59ua1M9USWORLyNW9P2uPOO9NahPmV
         Rn5IO5+p+eCyJyJFtQ0NtIgGU8Y0idxQVmSgOv8dpTebqY+GbAZYcqHoWnAogciGmdft
         SDn7nzijUTFoR1uNeUOEUpwlfCFjoiUrRDjh2eF78HpPuxJ26ilTZFUFl49GRetet3+P
         A4LQl+YyvZwN0p5yV+eeaR3KL/dd4sidbkbu4TowfwIECNool9KKZyB94DHvpzpxdWmP
         teoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn8DnXfsA7hlrym5r6w5g9DyfXX6AxpOaL0asCcIfF74A4CgX3wXTUSuDFwLJEPLJkJ9bm@lists.linux.dev
X-Gm-Message-State: AOJu0YzF13CFFayoCk6avd/7fL6we50ggRICCS6eNtkjtobMpsY2bDhC
	ndMd0jUrtzXXq2AfMb2ZO8VusyNtf3uKxMdpL84P3BeJ/dCCm7pdxiGV9WJe5lc=
X-Google-Smtp-Source: AGHT+IEIEh/chz16dTEQOl7Jx49f/jl7YA5ju0+fFElhPUVjfo2OXSdETIz0u/SWTsOZWJ4tr4IEZg==
X-Received: by 2002:a2e:be1b:0:b0:2fb:6465:3183 with SMTP id 38308e7fff4ca-2ff426970bdmr53783081fa.3.1731573689125;
        Thu, 14 Nov 2024 00:41:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da280018sm15655525e9.26.2024.11.14.00.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 00:41:28 -0800 (PST)
Date: Thu, 14 Nov 2024 11:41:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: stuyoder@gmail.com, laurentiu.tudor@nxp.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc:  Fix the double free in fsl_mc_device_add()
Message-ID: <656ca826-cb81-4b46-8e15-ec0b1044db8d@stanley.mountain>
References: <20241114082751.3475110-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114082751.3475110-1-suhui@nfschina.com>

On Thu, Nov 14, 2024 at 04:27:52PM +0800, Su Hui wrote:
> Clang static checker(scan-build) warning：
> drivers/bus/fsl-mc/fsl-mc-bus.c: line 909, column 2
> Attempt to free released memory.
> 
> When 'obj_desc->type' == "dprc" and begin to free 'mc_bus' and 'mc_dev',
> there is a double free problem because of 'mc_dev = &mc_bus->mc_dev'.
> Add a judgment to fix this problem.
> 
> Fixes: a042fbed0290 ("staging: fsl-mc: simplify couple of deallocations")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 930d8a3ba722..8d2d5d3cc782 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -905,8 +905,10 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
>  
>  error_cleanup_dev:
>  	kfree(mc_dev->regions);
> -	kfree(mc_bus);
> -	kfree(mc_dev);
> +	if (strcmp(mc_dev->obj_desc.type, "dprc") == 0)

This works, but it would probably be nicer to write this as:

	if (is_fsl_mc_bus_dprc(mc_dev))
		kfree(mc_bus);
	else
		kfree(mc_dev);

That way it would match the release function.

regards,
dan carpenter
 
