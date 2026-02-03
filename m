Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5373B8BCB;
	Tue,  3 Feb 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132324; cv=none; b=C6cRlb1ON/J0q9MarwULbXehWJA8k8X6pc5jrKU5Mhm7CVwKctrkJpNGeo6lywLJQzDtvrdMVMAhL3zf8EGUsV+AuJFPf+3lpcIP0d1Kr0ki2r5nyozGzukbNi0GPEbQ+giphvX7lcYtQqywD7DjiVmyXyDlWbQUEm59gvCOgvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132324; c=relaxed/simple;
	bh=ToXRXlFJkpvLLmf14Efrez1D31b+2qyQhzLWhUHbIr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXefX7osEmrfPsWqp/bbtnSkocOiE4MFYgFDdS7W+82W/qruplV8Nh0nsJH6lgBRSwfILkVXicacOTi/KevWyjswr30Pu3OD4OPN+8JhmBLWNBpDVwF2vWoAYbYY1ESWWw8uq5Oo+oqRemg4Feix0uIE7y4YcrmB6lYoud9OFdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkPINvvU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkPINvvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770132322; x=1801668322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToXRXlFJkpvLLmf14Efrez1D31b+2qyQhzLWhUHbIr0=;
  b=YkPINvvUEbN1SQmw2WHOXCOLo7aP4SssEgV35mKSPhoeLiTVCmTuvOAL
   WlF07yv9URGIVMzwQsBVHt4JrpPUbYJubtpb7IivkSbQlbtpAPIbeLwzz
   UkQZdwxKHWrnrX5pI903CRmps7V2gIThAbMEgFlRTKJj9x3ATI9ZDeDve
   GDc3kwLQlOjCitxVPL1NzRW9KcwVo8wkQJTMbg3KE2kphX1Uunz0fmYVC
   B9EtGvEBlROwDuY+vDzqrlO0BsgctYagIMv49PHIu+LpmWp1gzueHA9+4
   u7rNAmA566y0urH+Lr2vH7c72c1O+75lxQGBzPuq6Q+TYKLoH+iMs+Ips
   w==;
X-CSE-ConnectionGUID: xam7HqnKT5iH6hZi4IAw5Q==
X-CSE-MsgGUID: v+gdyWLOSMCXjeOyhdXdtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75162560"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="75162560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:25:22 -0800
X-CSE-ConnectionGUID: iu8YvdZOSFi1c0a9bXr+Rw==
X-CSE-MsgGUID: 1A3PdM6+T566Bej/M9wR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209580476"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2026 07:25:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnIHF-00000000gmC-3iin;
	Tue, 03 Feb 2026 15:25:17 +0000
Date: Tue, 3 Feb 2026 23:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Amirul Asyraf Mohamad Jamian <muhammadamirulasyraf.mohamadjamian@altera.com>,
	Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org,
	Ang Tien Sung <tien.sung.ang@altera.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND] firmware: stratix10-svc: Add Multi SVC clients support
Message-ID: <202602032325.MuglZ156-lkp@intel.com>
References: <20260203025815.4526-1-muhammadamirulasyraf.mohamadjamian@altera.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203025815.4526-1-muhammadamirulasyraf.mohamadjamian@altera.com>

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc8 next-20260202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Amirul-Asyraf-Mohamad-Jamian/firmware-stratix10-svc-Add-Multi-SVC-clients-support/20260203-110120
base:   linus/master
patch link:    https://lore.kernel.org/r/20260203025815.4526-1-muhammadamirulasyraf.mohamadjamian%40altera.com
patch subject: [RESEND] firmware: stratix10-svc: Add Multi SVC clients support
config: arm64-randconfig-003-20260203 (https://download.01.org/0day-ci/archive/20260203/202602032325.MuglZ156-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032325.MuglZ156-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032325.MuglZ156-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/stratix10-svc.c:1954:6: warning: variable 'svc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1954 |         if (ret) {
         |             ^~~
   drivers/firmware/stratix10-svc.c:2042:22: note: uninitialized use occurs here
    2042 |         platform_device_put(svc->stratix10_svc_rsu);
         |                             ^~~
   drivers/firmware/stratix10-svc.c:1954:2: note: remove the 'if' if its condition is always false
    1954 |         if (ret) {
         |         ^~~~~~~~~~
    1955 |                 dev_err(dev, "failed to allocate FIFO\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1956 |                 goto err_async_exit;
         |                 ~~~~~~~~~~~~~~~~~~~~
    1957 |         }
         |         ~
   drivers/firmware/stratix10-svc.c:1899:27: note: initialize the variable 'svc' to silence this warning
    1899 |         struct stratix10_svc *svc;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +1954 drivers/firmware/stratix10-svc.c

1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1891  
7ca5ce896524f5 Richard Gong                          2018-11-13  1892  static int stratix10_svc_drv_probe(struct platform_device *pdev)
7ca5ce896524f5 Richard Gong                          2018-11-13  1893  {
7ca5ce896524f5 Richard Gong                          2018-11-13  1894  	struct device *dev = &pdev->dev;
7ca5ce896524f5 Richard Gong                          2018-11-13  1895  	struct stratix10_svc_controller *controller;
7ca5ce896524f5 Richard Gong                          2018-11-13  1896  	struct stratix10_svc_chan *chans;
7ca5ce896524f5 Richard Gong                          2018-11-13  1897  	struct gen_pool *genpool;
7ca5ce896524f5 Richard Gong                          2018-11-13  1898  	struct stratix10_svc_sh_memory *sh_memory;
b5dc75c915cdae Richard Gong                          2019-09-03  1899  	struct stratix10_svc *svc;
b5dc75c915cdae Richard Gong                          2019-09-03  1900  
7ca5ce896524f5 Richard Gong                          2018-11-13  1901  	svc_invoke_fn *invoke_fn;
7ca5ce896524f5 Richard Gong                          2018-11-13  1902  	size_t fifo_size;
7ca5ce896524f5 Richard Gong                          2018-11-13  1903  	int ret;
7ca5ce896524f5 Richard Gong                          2018-11-13  1904  
7ca5ce896524f5 Richard Gong                          2018-11-13  1905  	/* get SMC or HVC function */
7ca5ce896524f5 Richard Gong                          2018-11-13  1906  	invoke_fn = get_invoke_func(dev);
7ca5ce896524f5 Richard Gong                          2018-11-13  1907  	if (IS_ERR(invoke_fn))
7ca5ce896524f5 Richard Gong                          2018-11-13  1908  		return -EINVAL;
7ca5ce896524f5 Richard Gong                          2018-11-13  1909  
7ca5ce896524f5 Richard Gong                          2018-11-13  1910  	sh_memory = devm_kzalloc(dev, sizeof(*sh_memory), GFP_KERNEL);
7ca5ce896524f5 Richard Gong                          2018-11-13  1911  	if (!sh_memory)
7ca5ce896524f5 Richard Gong                          2018-11-13  1912  		return -ENOMEM;
7ca5ce896524f5 Richard Gong                          2018-11-13  1913  
7ca5ce896524f5 Richard Gong                          2018-11-13  1914  	sh_memory->invoke_fn = invoke_fn;
7ca5ce896524f5 Richard Gong                          2018-11-13  1915  	ret = svc_get_sh_memory(pdev, sh_memory);
7ca5ce896524f5 Richard Gong                          2018-11-13  1916  	if (ret)
7ca5ce896524f5 Richard Gong                          2018-11-13  1917  		return ret;
7ca5ce896524f5 Richard Gong                          2018-11-13  1918  
7ca5ce896524f5 Richard Gong                          2018-11-13  1919  	genpool = svc_create_memory_pool(pdev, sh_memory);
e1d6ca042e62c2 Dan Carpenter                         2023-04-19  1920  	if (IS_ERR(genpool))
e1d6ca042e62c2 Dan Carpenter                         2023-04-19  1921  		return PTR_ERR(genpool);
7ca5ce896524f5 Richard Gong                          2018-11-13  1922  
7ca5ce896524f5 Richard Gong                          2018-11-13  1923  	/* allocate service controller and supporting channel */
7ca5ce896524f5 Richard Gong                          2018-11-13  1924  	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
9175ee1a99d57e Yang Yingliang                        2022-11-29  1925  	if (!controller) {
9175ee1a99d57e Yang Yingliang                        2022-11-29  1926  		ret = -ENOMEM;
9175ee1a99d57e Yang Yingliang                        2022-11-29  1927  		goto err_destroy_pool;
9175ee1a99d57e Yang Yingliang                        2022-11-29  1928  	}
7ca5ce896524f5 Richard Gong                          2018-11-13  1929  
7ca5ce896524f5 Richard Gong                          2018-11-13  1930  	chans = devm_kmalloc_array(dev, SVC_NUM_CHANNEL,
7ca5ce896524f5 Richard Gong                          2018-11-13  1931  				   sizeof(*chans), GFP_KERNEL | __GFP_ZERO);
9175ee1a99d57e Yang Yingliang                        2022-11-29  1932  	if (!chans) {
9175ee1a99d57e Yang Yingliang                        2022-11-29  1933  		ret = -ENOMEM;
9175ee1a99d57e Yang Yingliang                        2022-11-29  1934  		goto err_destroy_pool;
9175ee1a99d57e Yang Yingliang                        2022-11-29  1935  	}
7ca5ce896524f5 Richard Gong                          2018-11-13  1936  
7ca5ce896524f5 Richard Gong                          2018-11-13  1937  	controller->dev = dev;
7ca5ce896524f5 Richard Gong                          2018-11-13  1938  	controller->num_chans = SVC_NUM_CHANNEL;
7ca5ce896524f5 Richard Gong                          2018-11-13  1939  	controller->num_active_client = 0;
7ca5ce896524f5 Richard Gong                          2018-11-13  1940  	controller->chans = chans;
7ca5ce896524f5 Richard Gong                          2018-11-13  1941  	controller->genpool = genpool;
7ca5ce896524f5 Richard Gong                          2018-11-13  1942  	controller->invoke_fn = invoke_fn;
7ca5ce896524f5 Richard Gong                          2018-11-13  1943  	init_completion(&controller->complete_status);
7ca5ce896524f5 Richard Gong                          2018-11-13  1944  
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1945  	ret = stratix10_svc_async_init(controller);
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1946  	if (ret) {
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1947  		dev_dbg(dev, "Intel Service Layer Driver: Error on stratix10_svc_async_init %d\n",
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1948  			ret);
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1949  		goto err_destroy_pool;
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1950  	}
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1951  
7ca5ce896524f5 Richard Gong                          2018-11-13  1952  	fifo_size = sizeof(struct stratix10_svc_data) * SVC_NUM_DATA_IN_FIFO;
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1953  	ret = kfifo_alloc(&chans->svc_fifo, fifo_size, GFP_KERNEL);
7ca5ce896524f5 Richard Gong                          2018-11-13 @1954  	if (ret) {
b5dc75c915cdae Richard Gong                          2019-09-03  1955  		dev_err(dev, "failed to allocate FIFO\n");
bcb9f4f0706147 Mahesh Rao                            2025-10-27  1956  		goto err_async_exit;
7ca5ce896524f5 Richard Gong                          2018-11-13  1957  	}
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1958  	spin_lock_init(&chans->svc_fifo_lock);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1959  	/*
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1960  	 * This mutex is used to block threads from utilizing
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1961  	 * SDM to prevent out of order command tx
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1962  	 */
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1963  	controller->sdm_lock = &mailbox_lock;
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1964  
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1965  	fifo_size = sizeof(struct stratix10_svc_data) * SVC_NUM_DATA_IN_FIFO;
7ca5ce896524f5 Richard Gong                          2018-11-13  1966  
7ca5ce896524f5 Richard Gong                          2018-11-13  1967  	chans[0].scl = NULL;
7ca5ce896524f5 Richard Gong                          2018-11-13  1968  	chans[0].ctrl = controller;
7ca5ce896524f5 Richard Gong                          2018-11-13  1969  	chans[0].name = SVC_CLIENT_FPGA;
7ca5ce896524f5 Richard Gong                          2018-11-13  1970  	spin_lock_init(&chans[0].lock);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1971  	ret = kfifo_alloc(&chans[0].svc_fifo, fifo_size, GFP_KERNEL);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1972  	if (ret) {
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1973  		dev_err(dev, "failed to allocate FIFO 0\n");
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1974  		return ret;
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1975  	}
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1976  	spin_lock_init(&chans[0].svc_fifo_lock);
7ca5ce896524f5 Richard Gong                          2018-11-13  1977  
6b50d882d38d5a Richard Gong                          2018-11-13  1978  	chans[1].scl = NULL;
6b50d882d38d5a Richard Gong                          2018-11-13  1979  	chans[1].ctrl = controller;
6b50d882d38d5a Richard Gong                          2018-11-13  1980  	chans[1].name = SVC_CLIENT_RSU;
6b50d882d38d5a Richard Gong                          2018-11-13  1981  	spin_lock_init(&chans[1].lock);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1982  	ret = kfifo_alloc(&chans[1].svc_fifo, fifo_size, GFP_KERNEL);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1983  	if (ret) {
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1984  		dev_err(dev, "failed to allocate FIFO 1\n");
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1985  		return ret;
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1986  	}
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1987  	spin_lock_init(&chans[1].svc_fifo_lock);
6b50d882d38d5a Richard Gong                          2018-11-13  1988  
e6281c26674e03 Ang Tien Sung                         2022-07-11  1989  	chans[2].scl = NULL;
e6281c26674e03 Ang Tien Sung                         2022-07-11  1990  	chans[2].ctrl = controller;
e6281c26674e03 Ang Tien Sung                         2022-07-11  1991  	chans[2].name = SVC_CLIENT_FCS;
e6281c26674e03 Ang Tien Sung                         2022-07-11  1992  	spin_lock_init(&chans[2].lock);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1993  	ret = kfifo_alloc(&chans[2].svc_fifo, fifo_size, GFP_KERNEL);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1994  	if (ret) {
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1995  		dev_err(dev, "failed to allocate FIFO 2\n");
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1996  		return ret;
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1997  	}
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  1998  	spin_lock_init(&chans[2].svc_fifo_lock);
e6281c26674e03 Ang Tien Sung                         2022-07-11  1999  
4f49088c162579 Khairul Anuar Romli                   2025-10-08  2000  	chans[3].scl = NULL;
4f49088c162579 Khairul Anuar Romli                   2025-10-08  2001  	chans[3].ctrl = controller;
4f49088c162579 Khairul Anuar Romli                   2025-10-08  2002  	chans[3].name = SVC_CLIENT_HWMON;
4f49088c162579 Khairul Anuar Romli                   2025-10-08  2003  	spin_lock_init(&chans[3].lock);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2004  	ret = kfifo_alloc(&chans[3].svc_fifo, fifo_size, GFP_KERNEL);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2005  	if (ret) {
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2006  		dev_err(dev, "failed to allocate FIFO 3\n");
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2007  		return ret;
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2008  	}
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2009  	spin_lock_init(&chans[3].svc_fifo_lock);
4f49088c162579 Khairul Anuar Romli                   2025-10-08  2010  
7ca5ce896524f5 Richard Gong                          2018-11-13  2011  	list_add_tail(&controller->node, &svc_ctrl);
7ca5ce896524f5 Richard Gong                          2018-11-13  2012  	platform_set_drvdata(pdev, controller);
7ca5ce896524f5 Richard Gong                          2018-11-13  2013  
b5dc75c915cdae Richard Gong                          2019-09-03  2014  	/* add svc client device(s) */
b5dc75c915cdae Richard Gong                          2019-09-03  2015  	svc = devm_kzalloc(dev, sizeof(*svc), GFP_KERNEL);
d99247f9b54253 Christophe JAILLET                    2021-05-21  2016  	if (!svc) {
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2017  		return -ENOMEM;
d99247f9b54253 Christophe JAILLET                    2021-05-21  2018  	}
d0fcf70c680e4d Khairul Anuar Romli                   2025-11-03  2019  	controller->svc = svc;
b5dc75c915cdae Richard Gong                          2019-09-03  2020  
b5dc75c915cdae Richard Gong                          2019-09-03  2021  	svc->stratix10_svc_rsu = platform_device_alloc(STRATIX10_RSU, 0);
b5dc75c915cdae Richard Gong                          2019-09-03  2022  	if (!svc->stratix10_svc_rsu) {
b5dc75c915cdae Richard Gong                          2019-09-03  2023  		dev_err(dev, "failed to allocate %s device\n", STRATIX10_RSU);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2024  		return -ENOMEM;
b5dc75c915cdae Richard Gong                          2019-09-03  2025  	}
b5dc75c915cdae Richard Gong                          2019-09-03  2026  
b5dc75c915cdae Richard Gong                          2019-09-03  2027  	ret = platform_device_add(svc->stratix10_svc_rsu);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2028  	if (ret)
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2029  		goto err_put_device;
d99247f9b54253 Christophe JAILLET                    2021-05-21  2030  
4d239f447f96bd Mahesh Rao                            2025-03-26  2031  	ret = of_platform_default_populate(dev_of_node(dev), NULL, dev);
4d239f447f96bd Mahesh Rao                            2025-03-26  2032  	if (ret)
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2033  		goto err_put_device;
4d239f447f96bd Mahesh Rao                            2025-03-26  2034  
7ca5ce896524f5 Richard Gong                          2018-11-13  2035  	pr_info("Intel Service Layer Driver Initialized\n");
7ca5ce896524f5 Richard Gong                          2018-11-13  2036  
d99247f9b54253 Christophe JAILLET                    2021-05-21  2037  	return 0;
d99247f9b54253 Christophe JAILLET                    2021-05-21  2038  
bcb9f4f0706147 Mahesh Rao                            2025-10-27  2039  err_async_exit:
bcb9f4f0706147 Mahesh Rao                            2025-10-27  2040  	stratix10_svc_async_exit(controller);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2041  err_put_device:
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2042  	platform_device_put(svc->stratix10_svc_rsu);
9175ee1a99d57e Yang Yingliang                        2022-11-29  2043  err_destroy_pool:
9175ee1a99d57e Yang Yingliang                        2022-11-29  2044  	gen_pool_destroy(genpool);
1b2cdbfded37a9 Muhammad Amirul Asyraf Mohamad Jamian 2026-02-02  2045  
7ca5ce896524f5 Richard Gong                          2018-11-13  2046  	return ret;
7ca5ce896524f5 Richard Gong                          2018-11-13  2047  }
7ca5ce896524f5 Richard Gong                          2018-11-13  2048  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
