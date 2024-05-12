Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2871C69D;
	Sun, 12 May 2024 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715509592; cv=none; b=kf9IIqe3h+4hC2pWpQ1RiWGB0BsLuHDWC3bIUoGGIbBQthZiH65Q8K10tHbLJh1ShGH615kUWY64AwDOl/Dn6YhOy81kLUehp10dm+ajVws/hxf7YmMTfXu429Basf9H7cTj/B6foeBHn3BMgipfSnCsx9PtibmATPOzW1bunhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715509592; c=relaxed/simple;
	bh=+9pJXpQgPt2lHwMONUOemo2q9+iF6WTtWDicG6lMru4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHvMUXB4k4Ocl5vsjRah5t63uf9jqbtiVADvEspfIDFoiEcsyLQqWWgLuzOe3rOnUSDl1Ywo70FSKYoNbUcmL6M1iWlWZ75mbW/s9GLz/JkA6FEGbEWtR7cERBTnv0YMmXJb471lfH/DfnO/u9K/XuDoLeUjY8CXaqZXgndqxsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSLBJ1H0; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSLBJ1H0"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so2935041a12.1;
        Sun, 12 May 2024 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715509591; x=1716114391; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lr1WXbRSQZLTTHa7cFPRGYFpMRh1Ph2AIduJlL752P8=;
        b=BSLBJ1H0xoGDHoKQjJ1zOc8UglikBI1kq/fstGvKHXE5pFR0vS219udOYQHp3pYf+2
         K3Hjh51jwxmSggi27AA9pIpYfPOW9tVdF/kPAMJMGKCzruz6XQjTly1iLSbeNC0gGwQ8
         uUezUbVzLEBwIUdR9BJjvRGhZP6M7TLD+IYs5WX675SR+9HPWOQ1Nb0D1mD4gTMaKPcs
         gVjvDdRfuGpP5oRVZXqjnrEPLipfH9AN5RY58xZAU81fhWEMZpIHLsdemT3YYX3g/gXY
         l2KrvP5+8mSqHS4jD1lX6m0WdYtrL7kbU60ARxr8bQQDnilYEZpPZo1uizrGnU74bKmS
         CPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715509591; x=1716114391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr1WXbRSQZLTTHa7cFPRGYFpMRh1Ph2AIduJlL752P8=;
        b=C5dcNbNHYegPxB9/mfplOINM8M8pJ9EGwoe/3hcVjDGhrDb47MZivnNPcAr9Fy5XbW
         I+aV5SwIpFEqbInZAZ0QxNzV5HAWTz37qZ/4TQL6ZE+HbEXhTKCfHBaPJNEtrCql/wrI
         Je/9eB7I21Wm6ROYY6Ta9QaKMszo8bDnt0YCtwTP8V79H+FOHCvEOLR2uhjIWhmL1rqZ
         kzh2TyW2Au+9RbKmswkc/HU9WHVbPDUyY0190CPK9NHrFkA8+ChcQs5yKdxUsfMbe+Ri
         nPkgnMj1pjI8bqngdHgXsD8gfqKREFDuxM1R0pN/Z0vh/GPIRW4ppuOeudriZudT/IyJ
         oHyg==
X-Forwarded-Encrypted: i=1; AJvYcCUoldMMwgwgU5FmfU027iQJ+8PKfSgloRNwyrVXDTzQc7Pox/EMBED0tyZOJjr37BeinviMxXvhzeL+wfR+sGXnk4XmXVw5spCrBiQ1KFYMK+X2MnXDhYKCS1Q7+IFuwhwxehI=
X-Gm-Message-State: AOJu0Yx8E0Py3Hl+0gULubyrbm5SP+qUHXguRc6dUbO0wiWStctDQx0/
	FKKkocjSlE+b+Ut0TRpNQutzrANvlLUQ2OQlJek/tjOVlx7Rj8GP
X-Google-Smtp-Source: AGHT+IEFgljEemnXmHYaYEZNRwlIHszI6LnaACziDBUoVD9+Ku7bb0vKsVX72jtPhwQgQBbzm6bgrQ==
X-Received: by 2002:a17:902:b949:b0:1e4:48e7:3dab with SMTP id d9443c01a7336-1ef43e269ddmr91828255ad.38.1715509590471;
        Sun, 12 May 2024 03:26:30 -0700 (PDT)
Received: from five231003 ([2409:40f0:1038:c113:806e:6d6a:367e:63ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf32b4dsm61454005ad.137.2024.05.12.03.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 03:26:30 -0700 (PDT)
Date: Sun, 12 May 2024 15:56:22 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: ti: knav_qmss_queue: do device_node auto cleanup
Message-ID: <ZkCZTv0Gci3xxKtw@five231003>
References: <20240510071432.62913-3-five231003@gmail.com>
 <202405111846.3m9z398l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202405111846.3m9z398l-lkp@intel.com>

On Sat, May 11, 2024 at 06:12:39PM +0800, kernel test robot wrote:
> Hi Kousik,
> 
> kernel test robot noticed the following build errors:
> 

[...]

> All errors (new ones prefixed by >>):
> 
> >> drivers/soc/ti/knav_qmss_queue.c:1853:3: error: cannot jump from this goto statement to its label
>                    goto err;
>                    ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1840:3: error: cannot jump from this goto statement to its label
>                    goto err;
>                    ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1835:3: error: cannot jump from this goto statement to its label
>                    goto err;
>                    ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1831:3: error: cannot jump from this goto statement to its label
>                    goto err;
>                    ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1822:4: error: cannot jump from this goto statement to its label
>                            goto err;
>                            ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1826:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *queue_pools __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1818:4: error: cannot jump from this goto statement to its label
>                            goto err;
>                            ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1826:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *queue_pools __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1810:3: error: cannot jump from this goto statement to its label
>                    goto err;
>                    ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1826:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *queue_pools __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1813:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *pdsps __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1806:3: error: cannot jump from this goto statement to its label
>                    goto err;
>                    ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1826:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *queue_pools __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1813:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *pdsps __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1795:3: error: cannot jump from this goto statement to its label
>                    goto err;
>                    ^
>    drivers/soc/ti/knav_qmss_queue.c:1855:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *regions __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1826:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *queue_pools __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1813:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *pdsps __free(device_node) =
>                                ^
>    drivers/soc/ti/knav_qmss_queue.c:1801:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            struct device_node *qmgrs __free(device_node) =
>                                ^
>    9 errors generated.

Seems like gcc didn't catch this when I compiled locally.

Normally, this would be fixed if we placed braces around the individual
initialization blocks, that is, say

	{
		struct device_node *qmgrs __free(device_node) =
			of_get_child_by_name(node, "qmgrs");
		...
	}


That would make the code look a lot more dirty though and is purely
unnecessary.  So I'd say I'd drop this patch and do a v2 with the
remaining two patches.  Thoughts?

There's also some stuff with classes but that too is not really worth
doing because the code will end up looking very ugly.

Thanks
