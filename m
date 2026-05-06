Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3CD3E3C59
	for <llvm@lists.linux.dev>; Wed,  6 May 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060404; cv=none; b=nS97xgZCjeSvdanHEDt5fuIrjNXq8rO6AbDQNVWKdH0AE4wAqAxLV9SUHRYmHXjF+z9zXqtEOH/T3T/dgUwvgQISZCwMC6Xw7EDNgaVw7xMTMV7FQLISvbBXot//g8o3305eHkEm2zw/rDsj2P5HTOlIrg97rZyV5aFwESOx7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060404; c=relaxed/simple;
	bh=qmjYHGZXtiYUtQtV14Rvb+sQ5RX2t6MVyg4wbNNzAnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0b/sU1EtYBZopAXJsfcwoItupD5eKY+3bDOZopm1BTP+G3jlziKStyCMBEhp2BgMErt42nHaR0jcHUXzBkMpoqCOXMdPrd9EctQYAgCGbOye9Xab0TLbcCiuvEcb7DJu4It4MaQI+m+xyhHw4qLo/3+OgJV3mzvX2xFTd36MLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwaZOiSM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwaZOiSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778060403; x=1809596403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qmjYHGZXtiYUtQtV14Rvb+sQ5RX2t6MVyg4wbNNzAnY=;
  b=cwaZOiSMxOu9/yXQaji5SHDr14fh6OsRmOTPoaGXKUCh6IHfFlL/OvQ/
   JQXMqSDl3ztTwASb4LYOTgaTimlwesx5Zby1tjQeJeGJNYhahChUeWj90
   HVgr7IHsFj7yRoqHuJcvrTr2Jk+X+OANivvvBIDsq2+hZmcrjGsNEaa0H
   3KsU87w0udlU8gVIJy9u0V3qhq6FOi4PX7YQTJsYpMGDJ9Xvbyi9fA+6e
   UNto3RZSdHeu/xVqdyo3SV3pxcd9ZFn1cAwkoGpMfyE/sYTTMHMUr/kyQ
   S5zXTiwMCUF2Vi6/THHyspdq4BGeKroe3npKW74MFxn81Nbx/s3ZC5oiH
   A==;
X-CSE-ConnectionGUID: tgplG0szTiWlRpBOhNqvHw==
X-CSE-MsgGUID: R9AkDNlyRhm2dPYnqUBu9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78875564"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78875564"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:40:03 -0700
X-CSE-ConnectionGUID: BZvwe19/RBGv8e+twRE6WQ==
X-CSE-MsgGUID: wj1vVCwCQq+amL1x7Gp8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="237904989"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 02:40:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5273595; Wed, 06 May 2026 11:39:59 +0200 (CEST)
Date: Wed, 6 May 2026 12:39:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	"kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH] usb: typec: intel_pmc_mux: Zero initialize num_ports in
 pmc_usb_probe()
Message-ID: <afsMbeGfk5EHxFHV@kuha>
References: <20260506-typec-intel_pmc_mux-fix-uninit-num_ports-v1-1-929b128a32e9@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-typec-intel_pmc_mux-fix-uninit-num_ports-v1-1-929b128a32e9@kernel.org>

On Wed, May 06, 2026 at 02:05:54PM +0800, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
>     740 |                 num_ports++;
>         |                 ^~~~~~~~~
> 
> This should have been initialized to zero. Do so now to clean up the
> warning and ensure num_ports does not use uninitialized memory.
> 
> Fixes: 8bdb0b3830ea ("usb: typec: intel_pmc_mux: combine kzalloc + kcalloc")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://lore.kernel.org/177793914437.2560.9287713196857718000@997d03828cfd/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index e22b070a140f..219a32da1348 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -732,7 +732,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
>  {
>  	struct fwnode_handle *fwnode = NULL;
>  	struct pmc_usb *pmc;
> -	u8 num_ports;
> +	u8 num_ports = 0;
>  	int i = 0;
>  	int ret;
>  

thanks,

-- 
heikki
