Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40972279324;
	Mon, 16 Mar 2026 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645175; cv=none; b=uOofsDDC7ge2ueDXo5QRPFVrsYjAgKPvLQVVPnbF6z+tCcEtkXGyOfV7p5OKiZzyssgIF5O9kZU3aVZ/6gTasnU6f5CpUK/o2L825oGvSYwNs4UKzQhsYCr8zzqcx5gPExEGoOY8aLBK/LjjwJRQ7APuD6FqJsbxb0vIgBgUWHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645175; c=relaxed/simple;
	bh=csmW8+0vk8ePHltXghMcxvD+0rWN3gKYZg5DsV2YUHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPtrN74wtoMyFADhdRW/sNNGRuDPI+CV3m8EG+lMWw/us87mmCnuvZFJ0Or1ZoptMa+hXTGycnqr4xxH+kfkd4iR6TmGlZ0PV9f6fz2088J4krycz5xMl1Mj8uBbTx66qdxULqTmLY82vdFDQHGFVeFUy1U1R60GVinMDeVV16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMDd1Sl2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMDd1Sl2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECF8C2BC9E;
	Mon, 16 Mar 2026 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773645174;
	bh=csmW8+0vk8ePHltXghMcxvD+0rWN3gKYZg5DsV2YUHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMDd1Sl2gDiqkcGkpasG9q5rUYW/ZH+KeDmVfiWwasTyYVe1CHG0UHj95ptABoGzC
	 NZkfRwI/MddUlG9iq4aNqWixkshRqz6nupTt86/2KmkyH0kSIMEAcsM0mJv99fwg4Q
	 kn3pEY4O+MigkoHHqItE+T3mvNLqBvh2Jx6xBocRgbmUu6L2ISMaiO2yjmqxACsWs1
	 aNKzaw/bFnP1Jy+OOwRWa03bLiaj0sz5gIF3m8M1DXhP6NBlQISitsMlAWhcFAAK1T
	 ZB+gH+xw6j8qxiykH4n2i13rosSAlhW7nsjm7xAb1B3FcunnQkjxaNkVyQajjZgimT
	 WRJPhNNad6RTg==
Date: Mon, 16 Mar 2026 07:12:51 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 378/389] drivers/mtd/mtdchar.c:1384:9: error:
 call to undeclared function 'vma_desc_test_flags'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <57eb2d3a-b9e5-49fd-ac71-4d48e444b7b5@lucifer.local>
References: <202603161221.qNrB6fVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603161221.qNrB6fVE-lkp@intel.com>

On Mon, Mar 16, 2026 at 12:20:38PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   c5a81ff6071bcf42531426e6336b5cc424df6e3d
> commit: cf0dfae0323aa8b75cee0b94d5c7553b511d7bc3 [378/389] mtdchar: replace deprecated mmap hook with mmap_prepare, clean up
> config: arm-randconfig-002-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161221.qNrB6fVE-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 36041192cf6c9042615c8d2364cacc698ef89865)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161221.qNrB6fVE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603161221.qNrB6fVE-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/mtd/mtdchar.c:1384:9: error: call to undeclared function 'vma_desc_test_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1384 |         return vma_desc_test_flags(desc, VMA_SHARED_BIT) ? 0 : -EACCES;
>          |                ^

Ack, this should be vma_desc_test_any(). Will fix!

>    1 error generated.
>
>
> vim +/vma_desc_test_flags +1384 drivers/mtd/mtdchar.c
>
>   1375
>   1376	/*
>   1377	 * set up a mapping for shared memory segments
>   1378	 */
>   1379	static int mtdchar_mmap_prepare(struct vm_area_desc *desc)
>   1380	{
>   1381	#ifdef CONFIG_MMU
>   1382		return -ENODEV;
>   1383	#else
> > 1384		return vma_desc_test_flags(desc, VMA_SHARED_BIT) ? 0 : -EACCES;
>   1385	#endif
>   1386	}
>   1387
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Cheers, Lorenzo
