Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C825776;
	Mon, 15 Jun 2026 17:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545703; cv=none; b=Yvelhv+1Z6f1Fde1oJyh9BNXO/b4+9gvkeO1tekqdK9jP+mBmorxcPgKOay0etvxiPI4Du9JcKeF4DP9BAfeVaBE4PpiT8fblHJAmA5EI6XbBjAzYV/fBGj0HLHG0h41Aci8B+oSCfWOuQOrArq7FLwIVzCNk9D/kM12qS8/bKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545703; c=relaxed/simple;
	bh=1bHDPA1mcuNx4N0wdvZyVgfGSTpJb+ErMfjyL92aJpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OegeaqowyUsDi7/K2DsxcsNnFhGq58yGXbp/hqmxDWC6jRXp2XEt44VdcLhNs2zYR5e/gqafUA6bAjM2dHgkY5+xPsG8MqO9IZhgsp5Qi4b9cREMtHF+qRLiUAhPcyEi7Cw4Y2uMuYHOu9GxtOgi2nu1FsvlwAlp6dGV96WTWgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=hrtk5qk+; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="hrtk5qk+"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gfHfF6Yk9z1XM2FV;
	Mon, 15 Jun 2026 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1781545696; x=1784137697; bh=Eduf/gSxjjHPkVNpIdv+Q6Nt
	FvBB4tx9fHGqlKvxamA=; b=hrtk5qk+ktjAgAkwvGcFyA+7wpXTGIjKe4yVDpJS
	ibBK+OKdKhWuiFGHiM3GwnY/yucHzvM5/PKMCKoseGTFse+XHPPXcD2i1UUXL913
	yK3Ps7sJnvL5cX3u87HFvl03M4kScx0/UjZ2qZMMTjgHtOGMSmSuE8H3qf5oWcJi
	Upu8yHPfg0TsJxEj0WhhoyGt50HsvKOUwlUs+OErqKtGWGDS+MD7Fjp9MF6gXmeH
	wv1ha6ao+1CViHJmZAo3/tDk/+TazHfX1OtGjCa84FPBrAE3d54diKm2KrHleilF
	Nazn0HBI/Gg/780xP0SsAI5XURR71Wgd6ZA9hla6gHfVTA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id woLjxbunHbRd; Mon, 15 Jun 2026 17:48:16 +0000 (UTC)
Received: from [192.168.3.219] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gfHf51nJ1z1XM6Jc;
	Mon, 15 Jun 2026 17:48:12 +0000 (UTC)
Message-ID: <91082aa9-79b3-4a23-8f7b-4e2d3b7b876e@acm.org>
Date: Mon, 15 Jun 2026 10:48:11 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:for-7.2/block 48/73] include/linux/blkdev.h:1750:15:
 error: use of undeclared identifier 'bdev'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>,
 Marco Elver <elver@google.com>
References: <202606160003.4zv1ceMM-lkp@intel.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202606160003.4zv1ceMM-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 9:57 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
> head:   c7c76f9232bd34835d821f14abdc5fafc17bc938
> commit: 3033c86fa1a8bb31d0a13738fe8c5f9e5bbaf98a [48/73] block/bdev: Annotate the blk_holder_ops callback functions
> config: x86_64-randconfig-075-20260615 (https://download.01.org/0day-ci/archive/20260616/202606160003.4zv1ceMM-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160003.4zv1ceMM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606160003.4zv1ceMM-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from kernel/sched/core.c:43:
>>> include/linux/blkdev.h:1750:15: error: use of undeclared identifier 'bdev'
>      1750 |                 __releases(&bdev->bd_holder_lock);
>           |                             ^~~~
>     include/linux/blkdev.h:1756:15: error: use of undeclared identifier 'bdev'
>      1756 |                 __releases(&bdev->bd_holder_lock);
>           |                             ^~~~
>     include/linux/blkdev.h:1762:15: error: use of undeclared identifier 'bdev'
>      1762 |                 __releases(&bdev->bd_holder_lock);
>           |                             ^~~~
>     include/linux/blkdev.h:1768:15: error: use of undeclared identifier 'bdev'
>      1768 |                 __releases(&bdev->bd_holder_lock);
>           |                             ^~~~
>     kernel/sched/core.c:8054:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
>      8054 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
>           |                                        ^             ~~~~~~~~~~~~~~~~~~~~
>     kernel/sched/core.c:8029:1: note: array 'preempt_modes' declared here
>      8029 | const char *preempt_modes[] = {
>           | ^
>     1 warning and 4 errors generated.
The code shown above requires Clang 23 while this code has been built
with Clang 22. This build error should already have been fixed in
Linus' master branch since Linus has merged a pull request that bumps
the Clang version required for lock context analysis to 23:
Ingo Molnar, [GIT PULL] locking updates for v7.2, June 14
(https://lore.kernel.org/all/ai6O4a4UstIWIsFv@gmail.com/).

Bart.
