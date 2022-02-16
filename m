Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB6523A9
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644998076; x=1676534076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vdPa9R5BjgCaVVicsZ9eZ/gq8vB5/OnDmoGpO0xT5Ng=;
  b=PZTI0+FDxVWkll8SfOSc/8A0tyWuBh9LqmRAQFc/L6YwQ8Ad936ur3pT
   9KuLG97V5GB+kQCfCw0XkWb//Zw241P+xdtaf/sK3k5JuQefxIcHIh4eK
   AefikUl8QuAnj0wRKAuzUxSDsol5Ttu+cNpQu8gs5IVdBYaPJPa+AFRq3
   IM9noeKjkM4grmDEvyDbR/bcXOe7ITe1h0V9aQgl4jjJ9YgigWyFu4p9G
   eoFGHQ6+IrPs4I1X/ODYiiYLvbFCCu1opt3s+ym9S9Ql6y3z74TvT5pFK
   YjOVF2Hgrkp542F2gShT7m3QW7/TahUtlAhnKummae5Z/OeZpk0nY1yZS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248143487"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="248143487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 23:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571169143"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Feb 2022 23:54:30 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKF8v-000Aah-DY; Wed, 16 Feb 2022 07:54:29 +0000
Date: Wed, 16 Feb 2022 15:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: cgel.zte@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] soc/qcom: use struct_size over open coded arithmetic
Message-ID: <202202161548.Pvcgszt3-lkp@intel.com>
References: <20220216030759.1839582-1-chi.minghao@zte.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216030759.1839582-1-chi.minghao@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/cgel-zte-gmail-com/soc-qcom-use-struct_size-over-open-coded-arithmetic/20220216-111200
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c5d9ae265b105d9a67575fb67bd4650a6fc08e25
config: hexagon-randconfig-r045-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161548.Pvcgszt3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/51dde142db132ac922a62df2932acb6f27528e99
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review cgel-zte-gmail-com/soc-qcom-use-struct_size-over-open-coded-arithmetic/20220216-111200
        git checkout 51dde142db132ac922a62df2932acb6f27528e99
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/qcom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/soc/qcom/apr.c:174:18: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           abuf = kzalloc((struct_size(abuf, buf, len), GFP_ATOMIC);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:193:2: note: expanded from macro 'struct_size'
           __ab_c_size(count,                                              \
           ^~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/qcom/apr.c:174:58: error: expected ')'
           abuf = kzalloc((struct_size(abuf, buf, len), GFP_ATOMIC);
                                                                   ^
   drivers/soc/qcom/apr.c:174:16: note: to match this '('
           abuf = kzalloc((struct_size(abuf, buf, len), GFP_ATOMIC);
                         ^
   1 warning and 1 error generated.


vim +174 drivers/soc/qcom/apr.c

   160	
   161	static int apr_callback(struct rpmsg_device *rpdev, void *buf,
   162					  int len, void *priv, u32 addr)
   163	{
   164		struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
   165		struct apr_rx_buf *abuf;
   166		unsigned long flags;
   167	
   168		if (len <= APR_HDR_SIZE) {
   169			dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n",
   170				buf, len);
   171			return -EINVAL;
   172		}
   173	
 > 174		abuf = kzalloc((struct_size(abuf, buf, len), GFP_ATOMIC);
   175		if (!abuf)
   176			return -ENOMEM;
   177	
   178		abuf->len = len;
   179		memcpy(abuf->buf, buf, len);
   180	
   181		spin_lock_irqsave(&apr->rx_lock, flags);
   182		list_add_tail(&abuf->node, &apr->rx_list);
   183		spin_unlock_irqrestore(&apr->rx_lock, flags);
   184	
   185		queue_work(apr->rxwq, &apr->rx_work);
   186	
   187		return 0;
   188	}
   189	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
