Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAAD146A76;
	Mon, 13 May 2024 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715585017; cv=none; b=TpjB+v5l4eJj3J7CCcm6rmhdYnw35CXLve3CWdNYPicofCiYUixuhcDVTL3BHNlkwDcVfmLAR+oYg6LtNHPiU0ef257jD9sZD6GpJaX8171rVEW12JZXce9D0ygX6gkPYXUInCny7oCo8jeZmkKHCsey2PLLzmSKiN2yskFJ2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715585017; c=relaxed/simple;
	bh=EwyLiFCPJ79jd0x/s3FX01TmG6JE/p2BuT/kfZYBST8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAms3EvgMlu1JP/2yA2ryxC36jOJCvFLXN3CuOK3W7LTzHB57bfR+49YgQFEbTQ+4R9CRaj8AjzRAwPfSW37/rmn3/jpjGFWb/HU0QsF4FdIkPFSpaJo7C7RFLOKvZHlLXrTgOcS0+Btjj0P6/4U9e508eiiqJ2PE/lCsv1gxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJlusMrB; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJlusMrB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f4f2b1c997so1114057b3a.0;
        Mon, 13 May 2024 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715585016; x=1716189816; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkxOXqnTBAhY/tIMjPE5oqoapUJpOqskDlUKhDUKdtU=;
        b=eJlusMrB+CQdgHJLCWMb+bxUyjymi5t2flelW4MsOJ4HKci+lSt1xKPnqfC7AzPWCj
         eEaORLYSsxqz5oAhGGZhoH77ICs1tQwZrlVwJEazRll1rYkUUFbg42xlTlL7V+wpOnde
         eStWRtn41bM98J+Zl2tZmQNH1p4mjgfSiou6fgg6TSITEjSoRCjQ5vIW6hzoprnlRW3U
         NBfAWa9HvMQJCe/HiC2SRegs21Wzy3r27FcluTEARFwXm2Tkl/k25aTCLMS6nV06FbVY
         HEcUcK2ta21h9w6Y9HkIYxpPzn7RVtgn0+Zzp+uZcP2ZfLumizlU0S2b0aja3PnB/40/
         gk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715585016; x=1716189816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkxOXqnTBAhY/tIMjPE5oqoapUJpOqskDlUKhDUKdtU=;
        b=A+eZdObnBND4hd+DU+SKmQTS/N8c1RtzENvJOhUKu6dzcL9bdZkIbLk0dkBllSN3Xx
         n435E8Da1UZvHH2ALyXBtrGHOErmux8MunlAkZB/NKVOO2wjfKdyIjHmrtlfBDgMD9Ju
         eNzp5wTjmArOmrBX2Hv2afn+5aD5bBTVusbcSnmSG8HiLFNspvmFrdIGYh1CtN1yKcZt
         WOvTEJ70/MBCJtp8fNYmgVDxkCWtk9BP/+t9eXAl+yHsKOvIeujQr+RYnuDNiJXfsbfA
         GS7PdOivHDXo+sIBTKPeoJ4VYDDb0x6DG+p8Y6LwZnCYVoTmybi53w3+GLzEfY83shWy
         G9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV4pHrwYcz1YpJ6alvvyWJ8KxCwR+6XOStlSvgHa/5oFI7u0F4t6rxJXbcfOlJftSrN/U/YpKE7xXoC3z/71U/4CChiqjdMZ9aFjFMo56xbOSHCDPskPsxTUZgjvjXKx23Rurw=
X-Gm-Message-State: AOJu0YxEZxDglE2rfN+KJkpl1ylknyFi8/kT2MMyylFbxq+2laOdqmjw
	TowylMw8M9cEB7cVAXp98FFzKFiYQ98i7dUs6NuaSLtOCVTvNbDT
X-Google-Smtp-Source: AGHT+IHowW17gu11/yK0M22fhOEW8qcMNS4xoNIh9z0IjYf2fw+m2cvq0nqva4tljyfTeocrcYhpaQ==
X-Received: by 2002:a05:6a00:845:b0:6ed:7684:484b with SMTP id d2e1a72fcca58-6f4e0359ecfmr9241749b3a.27.1715585014226;
        Mon, 13 May 2024 00:23:34 -0700 (PDT)
Received: from five231003 ([2405:201:c006:312d:c30b:6348:71fc:1f89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae0bacsm6752159b3a.105.2024.05.13.00.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 00:23:33 -0700 (PDT)
Date: Mon, 13 May 2024 12:53:27 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: ti: knav_qmss_queue: do device_node auto cleanup
Message-ID: <ZkG_7wJvIjZ4ZlcV@five231003>
References: <20240510071432.62913-3-five231003@gmail.com>
 <202405111846.3m9z398l-lkp@intel.com>
 <ZkCZTv0Gci3xxKtw@five231003>
 <20240513064451.GB652533@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513064451.GB652533@thelio-3990X>

On Sun, May 12, 2024 at 11:44:51PM -0700, Nathan Chancellor wrote:
> On Sun, May 12, 2024 at 03:56:22PM +0530, Kousik Sanagavarapu wrote:
> > On Sat, May 11, 2024 at 06:12:39PM +0800, kernel test robot wrote:
> > > Hi Kousik,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > 
> > [...]
> > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> drivers/soc/ti/knav_qmss_queue.c:1853:3: error: cannot jump from this goto statement to its label
> > >                    goto err;
> > >                    ^
> > >    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> > >            struct device_node *regions __free(device_node) =
> > >                                ^

[...]

> > Seems like gcc didn't catch this when I compiled locally.
> 
> FWIW, you may notice this as you do more conversions. The fact that GCC
> does not warn at all is a GCC bug as far as I am aware (i.e., clang's
> error is correct):
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91951
> 
> which has come up in other places:
> 
> https://lore.kernel.org/20240425174732.GA270911@dev-arch.thelio-3990X/

Thank you so much for these links :)

All my internet searches ended up at stackoverflow posts which didn't
even describe the problem correctly, which also lead me to write an
email explaining a partly erroneous solution, which is sitting in my
mailbox ;)

Thanks again, these will help a lot.
