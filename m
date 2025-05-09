Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DDC23E338;
	Fri,  9 May 2025 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827495; cv=none; b=VYtnQzWcG3O9v8h1sy5auslUW0Rsnbm/bo9kHHAfLLoqxHgVwNySHTsERxYCCIpqrTBl+SF6v5QZxdXakFmZU5lkcKMBxqO0e9+FuVCmG+MPGbum0qzwBqRRAzGLM6unvjln/txTJVCxoj+LOD/gaprmeriqYiqKwdkqo9Mg7GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827495; c=relaxed/simple;
	bh=6rbW+FJviCVwHyCgr8LfThWuC1PBVM/HlsNFVPdZMBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEstOMQ/k020O1xwSKoJavChjfV3O3izC7q1ixBprJdW0KYwfir6J4gasBCfbEyvrjNRIiPffZsm2TN0JaLvayXBtPP+nA9O71iHclU9g8CrRe2DVvpTCW2nI3G6Y+G29Ow2obS7fv1zQg7I1FoH257TWe19kzF8o/Z22GyzBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dR5lJQB2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dR5lJQB2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so654975f8f.3;
        Fri, 09 May 2025 14:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746827492; x=1747432292; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXz86XrTySFK/5HrFM2uARRr8eXxPZL+3FIhyg3Mrkc=;
        b=dR5lJQB2ubBRhcmhdGI1pyuMYeKrHNhu6UhPYNQ6ffr1+wTF0iQnyGB8d5U4aG6/Ns
         nLjUVTS4cDItQIw46Guq76Gc98EHfqD5AtsE0VkKHq0f3hHKiqV5rSaTG1GRKt2Zrxhl
         f7xcniv0AB0kWkifwQZoU5Fd6BA7y/VP7NtoxT0GDMPXBSM0fKXT32h/tM/7/nNZaCjS
         sks0GcuxPql/vxzi58YJRiYQD+tGsbLptUKjfNsYR6BEFJzzRI3YFBTU2AAKjzUiHaI+
         fnnDVExtRADdvDGkd+Y0L7I6xvZz3zFAfBmh0QtFOaLBNcGoqXOQpgmbea57hyeeaL/3
         J7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746827492; x=1747432292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXz86XrTySFK/5HrFM2uARRr8eXxPZL+3FIhyg3Mrkc=;
        b=UZfAOmT8VenC9dWQUY7nCEoo7qRPUewkBFXdtLdl7u8ymN17nTOyg/dIUONr8E1Sp7
         3vPy3n8MF8mi9BuZ+rAn0Y4rY02pKSw7fjbdXm89K9yUeJvYybcmRDf8W+PzNPJM+VOI
         wGnVGIdB16YkyB69gzSYdohk0heZR1BlCBImbRAzjHZQirrt1oVrhQtF2465ftzG0Az/
         oaXeCzNowLSh/PiWN4SStJXBDE+bW3RNhofWz4SpHxVTjUiV/hQfAlYG9+al8MkOACNR
         NM9leKyplfg/Qev/HV0wncnZ7YS+kD0zOCFOGMSL1Bnc7bbXzSclpJd8bfXPNJUb2gm5
         UtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIx6ia0bQaBkCMGNK9RmXGrf2INBVGKmWRxFVIG81Kgr8jgbKGQD39/0CBlk2YGtWlXdjAYentcZc1DEAY@lists.linux.dev
X-Gm-Message-State: AOJu0YwwhJfyE84dvt9bYMsw97RFAloXLF7UgheKNA1A2mEj/2Z8GBwk
	jY/g0wNPxO4dnMEZkAjB3xvNjEgZF6qyapHd09uK4N0BdLeNDjESVJV9sA==
X-Gm-Gg: ASbGncseUbDp889h3ReiQUfqXbzQ7I9JEkmyqypLw807MTkC3P1AsAa1iKHdcliT8PO
	CorWIm/DFQMl/ugEBJ0nEv1inhyAZc9zq+uzVwcFb83rWwtCHKl4s1q15uNuBmbQAbDiHdIJ097
	GUp7RGJhLyAXFIq0lV3KQEyC/IFUtddDIAKL8MwZvt5DH4l3OHwbQbgOLiKn5Dn5aaaUZBadAIF
	VyECGrJPJFTyDx4GmT4quNqjBE50YQzsdH0+iktj4xeTjE08Y6OP5eCoHtInSXPGrrsN/lVT+kp
	iL3CTG9W4qG9qjEGTbFvo8rE1nrkPyHs5vqRjTnPHEqCdKpwrWLBUy3DXZHRk5opkBmZ78BO
X-Google-Smtp-Source: AGHT+IG4nvzxsNyZEg+e8uhRVmt1RgZs9nJgdtk+9Mi05ch5zO1SPlbUVPNQ+qf8GUqjGGylts9yfg==
X-Received: by 2002:a05:6000:2481:b0:3a1:f535:e9be with SMTP id ffacd0b85a97d-3a1f642a621mr4376602f8f.7.1746827491669;
        Fri, 09 May 2025 14:51:31 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.145.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2fe6sm4536183f8f.58.2025.05.09.14.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 14:51:31 -0700 (PDT)
Message-ID: <4103341c-1d86-4d78-ab74-c16c3c6570f6@gmail.com>
Date: Fri, 9 May 2025 22:52:42 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.16/io_uring 40/40] io_uring/io_uring.c:1656:6:
 warning: variable 'nr' set but not used
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
References: <202505100200.cyy3V6oJ-lkp@intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202505100200.cyy3V6oJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/25 19:59, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.16/io_uring
> head:   55c28f431651973385c17081bdcdadf8b5c6da91
> commit: 55c28f431651973385c17081bdcdadf8b5c6da91 [40/40] io_uring: drain based on allocates reqs
> config: s390-randconfig-002-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100200.cyy3V6oJ-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100200.cyy3V6oJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505100200.cyy3V6oJ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> io_uring/io_uring.c:1656:6: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
>      1656 |         int nr = 0;

It'a dead code that was replaced with a helper, I'll send the change

-- 
Pavel Begunkov

