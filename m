Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2148F47;
	Fri,  3 May 2024 01:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714700074; cv=none; b=cjB+PR1dsN2hevvswPacoq/7FnXM1qnDPr0a+8jq+QZNoPwB0KBSsVra4YZjBrFo9K/mhgyj92YkkVaicAJYzzM91mRf9ZQhRy+ffZvXx6z2LOhkd9tQ2HGkazd5Z1yFFA/E//2uovCiHBcaib/WEf+maP5k3PVkkxf8BjpRNH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714700074; c=relaxed/simple;
	bh=wZGylVv7MYiGV4tr5gHTFX00Op0Vt/3c+qjBHxVd77g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WL8PR1zLoKT2Wxxr88JHqAvXYMgYZWvzVOZZz5IU2KidMY/daOctsTCcXKRmWd/Cf7SkryAJZkdvzA5Lhz05bJcoRKFsf9m2GGOfgUhlwHEZJzxL0hshImqJp/KPShVdhlmzZwhfj5AskcYA/X4ygTyHc/7XfJgHEZrfqSEqQJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7gt13UP; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7gt13UP"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5a9ef9ba998so1992706eaf.1;
        Thu, 02 May 2024 18:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714700072; x=1715304872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7uWxHsmpdu9cG8ztu7nlo3aFJFuGgy/zRZAUsrGSEc=;
        b=j7gt13UPY36OxdI10KxOOUonODNjdJ/fYyuBDUHyASV/EOAAUo2Dww3iddCxwYYxw2
         nIVYM8LxjVm7Hssjg3p0oK9Fd/QDzK43PPTlzOg0mTqLUf7SmrC/RtuJ9VIEMO4XN/7y
         N3bCm5c4P8ekVjVYMuz0WC254cVr1+shNOtZuJZt2YE0Oi7jRCL6qBIPqmXlWWdV4rVd
         fXJk+UhCw5jEeLJofkj7c9CtKzbWMqZeadShKOURknBHPzK3N2YThQTxPnUuLNLVCT+A
         Krzt8nyfwJpzpKxlTulTtFZV+TCAFB1BjK94grrD9gopKn/7pcTgQP5Rj+9ZXBv5WLpE
         DkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714700072; x=1715304872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7uWxHsmpdu9cG8ztu7nlo3aFJFuGgy/zRZAUsrGSEc=;
        b=DQPZQTzPKHq3qpK63xJLCU/6iUZwbOmphxNopvaZwHhw24IHCQACI/RkSa2pwK0u45
         Xo04Vn7Z/YvWyKYQuTkL2tREd8fXV0Xb463M6szBuLLEBvCXGTsbvxt6lLI3HySNXU6m
         seoNqYQ7sQlxnQweVBOJ7EjT68e0VUVo9jPTaitR1JVIaC56+CEIIDxDYpQuMgaUFTXZ
         ojEs96GLiAol56BzRnKEUFt58Zml9/v9KJ733M6U9Fq9nBuihztm1PP/q0xwcZ1eEyTX
         Ta2M8vi+Cus6GGCYZ+mtQukGllv69Mm6UZ9Tvdl+CvLj3tK8MSBaBKMrgSBtEIsFnveW
         Frrg==
X-Forwarded-Encrypted: i=1; AJvYcCWpLRLpBBiUEFXrg8wJj1Oxvk7Ag/bvm29y8wFCJN1v3BVjO3vIbVuZJLTJCFzxI9CmHs/LxLL6MbUzkHlZBGTYpOhjppXWNRFw4Ag4Ug==
X-Gm-Message-State: AOJu0YwF8OIaerOJwEfCJ8vKMuNXKcXVBNmzvFKRy/sRFhvOr6G4vf3a
	PCV4Yqn4VjHrzu/3t7kJHzdnvFG3VfTFHRvrt1TyZmvAy3q6grQJ
X-Google-Smtp-Source: AGHT+IERXCVvSfSfc/vfzoDIvCDs7ijhcijC2Erf4L9K3EB5vg89w43sY1EXt8fv22O4MxsOjZ7PUw==
X-Received: by 2002:a9d:4c8b:0:b0:6ed:e624:2015 with SMTP id m11-20020a9d4c8b000000b006ede6242015mr1656866otf.2.1714700072040;
        Thu, 02 May 2024 18:34:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id fi7-20020a056a00398700b006ed007b3596sm1932521pfb.69.2024.05.02.18.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 18:34:31 -0700 (PDT)
Date: Fri, 3 May 2024 09:34:28 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
Message-ID: <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name>
References: <20240502092443.6845-2-visitorckw@gmail.com>
 <202405030808.UsoMKFNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405030808.UsoMKFNP-lkp@intel.com>

On Fri, May 03, 2024 at 08:49:00AM +0800, kernel test robot wrote:
> Hi Kuan-Wei,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.9-rc6 next-20240502]
> [cannot apply to akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuan-Wei-Chiu/lib-test_bitops-Add-benchmark-test-for-fns/20240502-172638
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240502092443.6845-2-visitorckw%40gmail.com
> patch subject: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/config)
> compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030808.UsoMKFNP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405030808.UsoMKFNP-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/test_bitops.c:56:39: error: variable 'tmp' set but not used [-Werror,-Wunused-but-set-variable]
>       56 |         static volatile __used unsigned long tmp __initdata;
>          |                                              ^
>    1 error generated.
> 
> 
> vim +/tmp +56 lib/test_bitops.c
> 
>     52	
>     53	static int __init test_fns(void)
>     54	{
>     55		static unsigned long buf[10000] __initdata;
>   > 56		static volatile __used unsigned long tmp __initdata;

I apologize for causing the compilation failure with clang. I'm not
very familiar with clang and I'm not sure why something marked as
__used would result in the warning mentioned above. Perhaps clang does
not support attribute((used))? Is there a way to work around this
issue?

Regards,
Kuan-Wei

>     57		unsigned int i, n;
>     58		ktime_t time;
>     59	
>     60		get_random_bytes(buf, sizeof(buf));
>     61		time = ktime_get();
>     62	
>     63		for (n = 0; n < BITS_PER_LONG; n++)
>     64			for (i = 0; i < 10000; i++)
>     65				tmp = fns(buf[i], n);
>     66	
>     67		time = ktime_get() - time;
>     68		pr_err("fns:  %18llu ns\n", time);
>     69	
>     70		return 0;
>     71	}
>     72	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
