Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB053E63B2;
	Mon, 19 Oct 2026 06:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390825; cv=none; b=up40ih8GxBebuE2sktT0mdy3T5VyEkG2RQhJxuuv7TR08/ihp7HXXKVAkEe/pxWnkf62LqwFa2aUQrHdDwWQ8ftCnssKiGJgfUjL28ifSD3oylNJ02T2AavvtaoxYpK1w68vD4pp7hx017ARV8hnFCmc3/gxeDVmybm3MQILgXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390825; c=relaxed/simple;
	bh=R2MLtON6QZvDKzXU8DXfFTSL9+WSxYlBfHmakkuqQ1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4lXRLbjNyPjRR4gViDQqyZcGV2rI/WGJtOt92HcJvjcxuuxh+xpgQ17NnVJTzwwYhLn0/6FZvqTJwUU45B+K9qH4pxvgQUk4VB7UIUwTwWfHjEvJEFpPXh6VqoHIApmlXuLKloreBxjGxkAOf6CfzTGErU6FvX49LUmIpCUgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0LngejM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0LngejM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792390823; x=1823926823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R2MLtON6QZvDKzXU8DXfFTSL9+WSxYlBfHmakkuqQ1M=;
  b=m0LngejMpWso5ArGU3Kn/xmLNeDEOUs0zu8k2LDxuiDEB33JOSx9+0Xr
   eKkydlAJ17uSyFZGsmsLMtrhfrHm6WJDJy6NqxCGQesKiqvbu+RbBMamS
   Nbiyr6BjVeO1uNR+qNj57zKm+C7DVatPH7NVJs+hmOT80K1VKmbLRNAJL
   U9Nx/XokhOhggCQ7AnWQTT47jb4rVPtM2h6rr3wbUesppn1Kyk++SjmWU
   MOO8rb7Sd8vUEy0jViB7mzKzHN/9RZrhHd83aTtE7bHjeiCWTb4temUPj
   drLLErDPkzWPkNYnZXEq1AR1gCc5N56pNqjw6ryGn+XHm6im8Lw9pS4li
   g==;
X-CSE-ConnectionGUID: 7RhusCKaSlGOz+zHhA3LWQ==
X-CSE-MsgGUID: UOakYBXdTDKkGqfxRJgy1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1100201"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1100201"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:20:23 -0700
X-CSE-ConnectionGUID: 0KnJaPIiSyG2YBZP6J8xiw==
X-CSE-MsgGUID: i4q5CNh/RtWSTnnn1u5XYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2431988"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Oct 2026 23:20:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIgjI-00000000LKs-35JD;
	Mon, 19 Oct 2026 06:20:16 +0000
Date: Mon, 19 Oct 2026 14:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Menachem Adin <menachem.adin@intel.com>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Reuven Abliyev <reuvenab@gmail.com>
Subject: Re: [PATCH char-misc-next v2 4/4] issei: add driver to driver
 interface
Message-ID: <202610191455.cc2xaeEs-lkp@intel.com>
References: <20261018-issei_pm_and_itf-v2-4-7a07452e3606@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-issei_pm_and_itf-v2-4-7a07452e3606@intel.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 79e5797d243a466138f641932f81dc69f796060c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Usyskin/issei-save-power_down-flag-while-processing-event/20261018-123052
base:   79e5797d243a466138f641932f81dc69f796060c
patch link:    https://lore.kernel.org/r/20261018-issei_pm_and_itf-v2-4-7a07452e3606%40intel.com
patch subject: [PATCH char-misc-next v2 4/4] issei: add driver to driver interface
config: i386-randconfig-1001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191455.cc2xaeEs-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191455.cc2xaeEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191455.cc2xaeEs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/issei/issei_device.c:163:59: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
     163 |                         dev_dbg(&idev->dev, "Failed writing data ret = %ld\n", ret);
         |                                                                        ~~~     ^~~
         |                                                                        %zd
   include/linux/dev_printk.h:171:49: note: expanded from macro 'dev_dbg'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:139:35: note: expanded from macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +163 drivers/misc/issei/issei_device.c

   113	
   114	/**
   115	 * issei_device_write - send data to the firmware client.
   116	 * @ctx: opaque context
   117	 * @ubuf: data to send
   118	 * @length: data length
   119	 * @timeout: operation timeout in milliseconds
   120	 *
   121	 * Return: >=0 data length on success, <0 on error
   122	 */
   123	ssize_t issei_device_write(void *ctx, const u8 *ubuf, size_t length, unsigned long timeout)
   124	{
   125		struct issei_host_client *cl = ctx;
   126		struct issei_device *idev = cl->idev;
   127		ssize_t ret;
   128		long wret;
   129	
   130		if (idev->rst_state != ISSEI_RST_STATE_DONE) {
   131			dev_dbg(&idev->dev, "Device is in transition\n");
   132			return -EBUSY;
   133		}
   134	
   135		if (!length)
   136			return 0;
   137	
   138		/* sanity check */
   139		if (length > idev->dma.length.h2f) {
   140			dev_dbg(&idev->dev, "Write is too big %zu > %zu\n", length,
   141				idev->dma.length.h2f);
   142			return -EFBIG;
   143		}
   144	
   145		u8 *buf __free(kfree) = kmemdup(ubuf, length, GFP_KERNEL);
   146		if (!buf)
   147			return -ENOMEM;
   148	
   149		do {
   150			ret = issei_cl_write(cl, buf, length);
   151			if (ret < 0 && ret != -EAGAIN)
   152				return ret;
   153			/* buf is consumed by issei_cl_write on success */
   154			if (ret >= 0)
   155				retain_and_null_ptr(buf);
   156			wret = wait_event_interruptible_timeout(cl->write_wait,
   157								issei_cl_check_write(cl) != 1,
   158								msecs_to_jiffies(timeout));
   159			if (wret == 0) /* timeout */
   160				wret = -ETIMEDOUT;
   161			if (wret < 0) {
   162				issei_cl_clean_all_wbuf(cl);
 > 163				dev_dbg(&idev->dev, "Failed writing data ret = %ld\n", ret);
   164				return wret;
   165			}
   166		} while (ret == -EAGAIN);
   167	
   168		return ret;
   169	}
   170	EXPORT_SYMBOL_GPL(issei_device_write);
   171	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
