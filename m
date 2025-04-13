Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D3E567;
	Sun, 13 Apr 2025 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744507970; cv=none; b=n+iBi0VZZrdOjT/Dh9R0qqzSk6mtRbx2nM8Q1NBY53fSB3mEEUcbAEfypfYJpHAfAe2SrsE/QdSELukgGlibkH1PFe4Tr/Et1EnGc160jS6UhuLlo/32KXTekdCY34hUY5lRmB1ma8SxYGmg4aQKmYmQpOFUt/TJIbgMkjx7BE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744507970; c=relaxed/simple;
	bh=uiyZZeaf4wD5vpiN+5Wh8cku4ivt+ptg1BoyP2yy9w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crQuN9aLA8i/CuJ60sN1cI4qSF8GJGhn8NmKp1Hs6tm7YeTEPJUIOrJpv8EGKSwM98S9zxRD0zm5B0T9K+UUlILy3ROcLMkGmmGANI+ZBsIVEWUJ3Ky1KDIPyCttp0J3z8p4dSOK6Sx+GdDT4WyCraaRQLzGu1LR17zyVac7OcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRuh3eKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRuh3eKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769C4C4CEE3;
	Sun, 13 Apr 2025 01:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744507969;
	bh=uiyZZeaf4wD5vpiN+5Wh8cku4ivt+ptg1BoyP2yy9w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRuh3eKDy/5lkFnmcSQOWHJ3dNo03XiV1lHqYfrg6IQwSRlWzthLIE04C1pC26CjJ
	 gFVkZCjGJTIGDhDe9KsmOesLKMttxB3tHet11T5ndeRBuWI3G3zLlI2iXPh6L22576
	 rAJt7r+rbZCNfoHkBdLqb30YX1i3fwjT7Ipul8DuBa41Pbzb7Ua6rdYuJkAPPl6Rn/
	 k2bD/Wft4NIMEgReVZnmEdR6po/1k/c3T3AqIcD5e9X5KH7qctU5893kwy5Zcj5mBZ
	 uJGvJoobK4pV0X324IdPXuFwriyZPg+P2ojbW79CrPIVx9bTjSC6nMQiKDnuwjnEVH
	 8mRB2aZZORu1w==
Date: Sat, 12 Apr 2025 20:32:45 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: jlayton@kernel.org, akpm@linux-foundation.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ref_tracker: use %ld format specifier for PTR_ERR()
 during directory creation failure
Message-ID: <20250413013245.GA2989337@ax162>
References: <20250412222744.9459-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412222744.9459-1-qasdev00@gmail.com>

Hi Qasim,

On Sat, Apr 12, 2025 at 11:27:44PM +0100, Qasim Ijaz wrote:
> PTR_ERR yields type long, so use %ld format specifier in pr_warn.
> 
> Fixes: ada5a12aae58 ("ref_tracker: add a top level debugfs directory for ref_tracker")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504130520.rX5EVbVq-lkp@intel.com/ 
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com> 
> ---
>  lib/ref_tracker.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
> index 4064154252a6..02e9f0c3dd82 100644
> --- a/lib/ref_tracker.c
> +++ b/lib/ref_tracker.c
> @@ -283,7 +283,7 @@ static int __init ref_tracker_debug_init(void)
>  {
>  	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
>  	if (IS_ERR(ref_tracker_debug_dir)) {
> -		pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %d\n",
> +		pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %ld\n",

While there is nothing wrong with doing this to resolve the warning, I
think this would be a good opportunity to use the '%pe' format specifier
[1] instead of '%ld', as that will print the symbolic error name (such
as -EINVAL instead of just -22) and make it easier for people to
decipher what has gone wrong.

  pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %pe\n",
          ref_tracker_debug_dir);

[1]: From the "error pointers" section in Documentation/core-api/printk-formats.rst

Cheers,
Nathan

>  			PTR_ERR(ref_tracker_debug_dir));
>  		ref_tracker_debug_dir = NULL;
>  	}
> -- 
> 2.39.5
> 
> 
