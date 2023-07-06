Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF07F;
	Thu,  6 Jul 2023 01:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=RNqj58sR6D2iCKUxyhJptVbzfTzgXZ/kvCTP8dmpNJQ=; b=UyUETjxTTWij72ndUBaCJj6d7H
	aLKeV2tVHZ12Ji4JGFUC9YyJAhdQAevae+N33ZkbBrM9ilr2FTc9jTxwj7bctsenXfAmEjfs+66yz
	lsPOBfNo3TF3v/IlaAIsHKo11RWJ+zpnxqCSJ17A1W4iMeGgNy+417rzFvdvpMTiGddddXRSDPZ4U
	56d0BFCPdAyW6MxEIZQ24+z0EUUBBVfJW/2PxJlcL4e+ojKEp4JoRIrVM19fA3ppxyXz6VJeOVBws
	26M/OGmjftFcLEOk3M+ULlY8KsN4awWV/sTtFRPXw3BHC9awXVmnAQu+CSIZbbolk2+oces2u/LBr
	MzLUTXNw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qHDd3-00HY8z-2I;
	Thu, 06 Jul 2023 01:17:53 +0000
Message-ID: <84c4b254-0bfd-b72f-c3c1-69afa45a0874@infradead.org>
Date: Wed, 5 Jul 2023 18:17:53 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: ld.lld: error: undefined symbol: firmware_upload_register
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Vishal Verma
 <vishal.l.verma@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>
References: <202307060742.vdkvv1Z3-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202307060742.vdkvv1Z3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/5/23 16:43, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   73a3fcdaa73200e38e38f7e8a32c9b901c5b95b5
> commit: 9521875bbe0055805557fff0b08fd9a29d02b7bc cxl: add a firmware update mechanism using the sysfs firmware loader
> date:   10 days ago
> config: x86_64-randconfig-x016-20230706 (https://download.01.org/0day-ci/archive/20230706/202307060742.vdkvv1Z3-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060742.vdkvv1Z3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307060742.vdkvv1Z3-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: firmware_upload_register
>    >>> referenced by memdev.c:836 (drivers/cxl/core/memdev.c:836)
>    >>>               drivers/cxl/core/memdev.o:(cxl_memdev_setup_fw_upload) in archive vmlinux.a
> --
>>> ld.lld: error: undefined symbol: firmware_upload_unregister
>    >>> referenced by memdev.c:824 (drivers/cxl/core/memdev.c:824)
>    >>>               drivers/cxl/core/memdev.o:(cxl_memdev_setup_fw_upload) in archive vmlinux.a
>    >>> referenced by memdev.c:824 (drivers/cxl/core/memdev.c:824)
>    >>>               drivers/cxl/core/memdev.o:(devm_cxl_remove_fw_upload) in archive vmlinux.a
> 


Fix from Arnd:
https://lore.kernel.org/all/20230703112928.332321-1-arnd@kernel.org/

-- 
~Randy
