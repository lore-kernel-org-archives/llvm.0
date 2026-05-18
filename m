Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77AC36E46C;
	Mon, 18 May 2026 02:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779071106; cv=none; b=dCkvQw4JAdUOMxvd2dh1ZkGnWIlCHfB16oPmXqRF0Mte41XAFn1XZwFKxY24ueDqw9Hq03Ce5yNi+qAo9RQnXywWCZN1AFHr1NcLCOn66mtNXKNsnn1wkohXumKyRY8z6quqRLbNO1Sl+AZogS6KT0z4j5EI2rUAqYJ/wQL2M5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779071106; c=relaxed/simple;
	bh=uLrYosaCencRRjU/Egw9fQ2hdzYvygoP3D/BvZR1Bls=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=N3XmvPPiNu7o7AWxyUVLZf0ja/+IdLhBnEgGISCfZ9SpDP9W7iQkVK0xByKc86NkFOsigufNVVq19BZM+Cqb4zRaDnOQaBe73fRLFKZmBJVzrpg+P6xdLuT4+8TgWNMXhbHSb/A0aY2dDBbEMqyFCx9YUw/aUfI0lXmOHZsNyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=C60Q3usr; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="C60Q3usr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=k87A29HSt98l8xIv5aFvMIu8kygYFUCV7ws460UXUcg=;
	b=C60Q3usr/9arhNyzeH831/Yw1D+zH2Ii8OyFibRw38/K1+QvCsG+cReiWwECLR
	AOFJShTs6wNdr96WB9LnruUVcoGUBBwXIIaj3m7ev7bai1iRDz0NS+ej76qdpH8z
	ngziZkH6lvF57qHT0pQRYrSf+LVKUwSqoTaTYINOtiGHQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD33zBdeApqpDIBBw--.7062S2;
	Mon, 18 May 2026 10:24:30 +0800 (CST)
Message-ID: <6A0A7869.6080007@126.com>
Date: Mon, 18 May 2026 10:24:41 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: kernel test robot <lkp@intel.com>, 
 Hongling Zeng <zenghongling@kylinos.cn>,
 dpenkler@gmail.com, gregkh@linuxfoundation.org, 
 dominik.karol.piatkowski@protonmail.com, adam.quandour@gmail.com, 
 kees@kernel.org
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpib: cb7210: Fix region leak when request_irq fails
References: <20260515073952.54359-1-zenghongling@kylinos.cn> <202605160620.ReBOadPX-lkp@intel.com>
In-Reply-To: <202605160620.ReBOadPX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD33zBdeApqpDIBBw--.7062S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWDtry5Aw1Dtr45tF1rCrg_yoW5tw47pa
	y8GFs8KryDXr1F939rCrW8ursYyws3K3y5Ww4jkr43ZFsIyFyDCr409r4av34DKFyDGr15
	JrZYkr1rCw4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4oGPUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrh9SI2oKeF8OdgAA3-

   Hi,

   Thanks for the report. The issue is a typo where I used 'ret' instead of
   'retval'. I'll fix this in v2 and add the appropriate tags.

   Best regards,
   Hongling

在 2026年05月16日 06:23, kernel test robot 写道:
> Hi Hongling,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v7.1-rc3 next-20260508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Hongling-Zeng/gpib-cb7210-Fix-region-leak-when-request_irq-fails/20260515-222229
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20260515073952.54359-1-zenghongling%40kylinos.cn
> patch subject: [PATCH] gpib: cb7210: Fix region leak when request_irq fails
> config: x86_64-randconfig-076-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160620.ReBOadPX-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160620.ReBOadPX-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605160620.ReBOadPX-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/gpib/cb7210/cb7210.c:1066:3: error: use of undeclared identifier 'ret'
>      1066 |                 ret = -EBUSY;
>           |                 ^
>     1 error generated.
>
>
> vim +/ret +1066 drivers/gpib/cb7210/cb7210.c
>
>    1035	
>    1036	static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
>    1037	{
>    1038		int isr_flags = 0;
>    1039		struct cb7210_priv *cb_priv;
>    1040		struct nec7210_priv *nec_priv;
>    1041		unsigned int bits;
>    1042		int retval;
>    1043	
>    1044		retval = cb7210_generic_attach(board);
>    1045		if (retval)
>    1046			return retval;
>    1047		cb_priv = board->private_data;
>    1048		nec_priv = &cb_priv->nec7210_priv;
>    1049		if (!request_region(config->ibbase, cb7210_iosize, DRV_NAME)) {
>    1050			dev_err(board->gpib_dev, "ioports starting at 0x%x are already in use\n",
>    1051				config->ibbase);
>    1052			retval = -EBUSY;
>    1053			goto err_release_region;
>    1054		}
>    1055		nec_priv->iobase = config->ibbase;
>    1056		cb_priv->fifo_iobase = nec7210_iobase(cb_priv);
>    1057	
>    1058		bits = irq_bits(config->ibirq);
>    1059		if (bits == 0)
>    1060			dev_err(board->gpib_dev, "board incapable of using irq %i, try 2-5, 7, 10, or 11\n",
>    1061				config->ibirq);
>    1062	
>    1063		// install interrupt handler
>    1064		if (request_irq(config->ibirq, cb7210_interrupt, isr_flags, DRV_NAME, board)) {
>    1065			dev_err(board->gpib_dev, "failed to obtain IRQ %d\n", config->ibirq);
>> 1066			ret = -EBUSY;
>    1067			goto err_release_region;
>    1068		}
>    1069		cb_priv->irq = config->ibirq;
>    1070	
>    1071		return cb7210_init(cb_priv, board);
>    1072	
>    1073	err_release_region:
>    1074		release_region(nec7210_iobase(cb_priv), cb7210_iosize);
>    1075		return retval;
>    1076	}
>    1077	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

