Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF9119D8B7
	for <llvm@lists.linux.dev>; Thu,  5 Sep 2024 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725550834; cv=none; b=CtNj3CcIo/eKxfMVbXX34mlAc35fvHeb7SfwV9dvd4Gclqd/YDLgApKqoLt9LLIzEU6zFnxLHCWnRfuzWrlhqksFQKDVG69JUDI/qW4CF/1eE8DJ0dMJiFJySZSZmy1lW8hDYLsZ1CxSla+4lN/8tB30o1sZVKr8ypU7YODemdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725550834; c=relaxed/simple;
	bh=GcoRkRZc4Q0XVU54Uq1MbzPiHvMtf3B/i+2XF0ydMZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFTf5i4E4L/L33RjNPTJm+RPf9F4LzPKDZqGFTNDhBi9Mj/lxCCGliVN7Hb6lvwx/VT9FyxNE4dWRr9d8kHcbkhb7NbPLV0R4tijfEuyz/PHm5HGpyqogLhvInhhsE01aJg3cSW5zCkN3wGeK6K1vvz5s77PNimU9/VG3bqIsyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JogIp1E/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JogIp1E/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C462C4CEC3;
	Thu,  5 Sep 2024 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550833;
	bh=GcoRkRZc4Q0XVU54Uq1MbzPiHvMtf3B/i+2XF0ydMZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JogIp1E/8el4hSoBGh0+XPmcL0fP/gOSQGQMgtc7b9kABBWrrAQ496DFMgpun8+Eb
	 Qoor3VdC59wFW36uD5PFeETQV2WzFAwwjBbUfOfz42wbarBAHiiHpjP9udkJmw2XtM
	 Gof2s9EJfOXwynBgltmu+fNJUk+cknfuft3Xjv7FfNanDz36wjB/2gc5sOwzdUIoBr
	 uJ4xHl5X9tmKKxQKRhzZo/BVhGFZNPg63l4nTX6p6FSk0hbXM3ncHeJyUvxpiP0k/B
	 sdCf5xeIaRiOJtzB0SbpBsfOzv8hOzygsgLUK32/g2QUkWpQThYWt6ZeWJ1IxDjmFu
	 rYU5cuQJuMmEQ==
Date: Thu, 5 Sep 2024 08:40:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.11-rc1-143-g4e7795eda4459: Failure on aarch64
Message-ID: <20240905154031.GA2597978@thelio-3990X>
References: <2051722969.176113.1725489402796@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2051722969.176113.1725489402796@jenkins.jenkins>

On Wed, Sep 04, 2024 at 10:36:41PM +0000, ci_notify@linaro.org wrote:
> Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> 
> We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.
> 
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1339 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-next-allyesconfig after:
> 
>   | commit v6.11-rc1-143-g4e7795eda4459
>   | Author: Kent Overstreet <kent.overstreet@linux.dev>
>   | Date:   Sun Sep 1 18:08:25 2024 -0400
>   | 
>   |     bcachefs: bch2_sb_member_alloc()
>   |     
>   |     refactoring
>   |     
>   |     Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

Thanks for the report, this should be fixed now:

https://git.kernel.org/next/linux-next/c/da6e6a70084d99d522058bbef00b9cbe48cb7ca4

Cheers,
Nathan
