Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A552100
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652424371; x=1683960371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y5Rsw96DNu+y7ASQPp4Jc4rTQx2+9zd6d41L5y6H1lE=;
  b=i0dcwzJnZy70WxjEi2UiZyDSMw8+6r1jSMi8JnlPtKF2NXd7DNa9PNc3
   10DBfoSpk1T1hx00FaMz6Gz5WNZpjT6cgu6epb/whibLefjcixUotl8UJ
   P/b08fiYGTfAInDnRb+0jwckJD0VydzlwmNll4ZMxMUEPp3X8tbPk8OdR
   NSOPG1VCRwTaXA1HqjdG9SB6AsIhRzeRrnIGMUIAZ3y8quocPbTfj70s4
   rlzYwccEdyIfq6uuyuhtHUnpX1PuLnInSkfBJIU6HnzcvCsd4SFqgzvN/
   Ne86P9TzuXriH+b+zTEdqS8bJQLXrE1UzsLzFmchyclktG3SNAtWGsrZO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="333268019"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="333268019"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 23:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="624743526"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2022 23:46:09 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npP3w-000LR8-De;
	Fri, 13 May 2022 06:46:08 +0000
Date: Fri, 13 May 2022 14:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Matej Vasilevski <matej.vasilevski@seznam.cz>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/3] can: ctucanfd: add HW timestamps to RX and error
 CAN frames
Message-ID: <202205131429.CiV4nwyI-lkp@intel.com>
References: <20220512232706.24575-2-matej.vasilevski@seznam.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512232706.24575-2-matej.vasilevski@seznam.cz>

Hi Matej,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on mkl-can-next/testing]
[also build test WARNING on next-20220512]
[cannot apply to v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matej-Vasilevski/can-ctucanfd-add-HW-timestamps-to-RX-and-error-CAN-frames/20220513-082717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
config: mips-randconfig-c004-20220512 (https://download.01.org/0day-ci/archive/20220513/202205131429.CiV4nwyI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/94b774f37c0fa10955f4af8e0f26edee728e49dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matej-Vasilevski/can-ctucanfd-add-HW-timestamps-to-RX-and-error-CAN-frames/20220513-082717
        git checkout 94b774f37c0fa10955f4af8e0f26edee728e49dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/can/ctucanfd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/can/ctucanfd/ctucanfd_base.c:1391:6: warning: no previous prototype for function 'ctucan_parse_dt_timestamp_bit_width' [-Wmissing-prototypes]
   void ctucan_parse_dt_timestamp_bit_width(struct ctucan_priv *priv)
        ^
   drivers/net/can/ctucanfd/ctucanfd_base.c:1391:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ctucan_parse_dt_timestamp_bit_width(struct ctucan_priv *priv)
   ^
   static 
>> drivers/net/can/ctucanfd/ctucanfd_base.c:1409:6: warning: no previous prototype for function 'ctucan_parse_dt_timestamp_frequency' [-Wmissing-prototypes]
   void ctucan_parse_dt_timestamp_frequency(struct ctucan_priv *priv)
        ^
   drivers/net/can/ctucanfd/ctucanfd_base.c:1409:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ctucan_parse_dt_timestamp_frequency(struct ctucan_priv *priv)
   ^
   static 
   2 warnings generated.


vim +/ctucan_parse_dt_timestamp_bit_width +1391 drivers/net/can/ctucanfd/ctucanfd_base.c

  1390	
> 1391	void ctucan_parse_dt_timestamp_bit_width(struct ctucan_priv *priv)
  1392	{
  1393		if (of_property_read_u32(priv->dev->of_node, "ts-used-bits", &priv->timestamp_bit_size)) {
  1394			dev_info(priv->dev, "failed to read ts-used-bits property from device tree\n");
  1395			priv->timestamp_enabled = false;
  1396			return;
  1397		}
  1398		if (priv->timestamp_bit_size > 64) {
  1399			dev_info(priv->dev, "ts-used-bits (value: %d) is too large, (max is 64)\n",
  1400				 priv->timestamp_bit_size);
  1401				 priv->timestamp_enabled = false;
  1402		}
  1403		if (priv->timestamp_bit_size == 0) {
  1404			dev_info(priv->dev, "ts-used-bits has to be greater than zero\n");
  1405				 priv->timestamp_enabled = false;
  1406		}
  1407	}
  1408	
> 1409	void ctucan_parse_dt_timestamp_frequency(struct ctucan_priv *priv)
  1410	{
  1411		struct device *dev = priv->dev;
  1412	
  1413		if (!IS_ERR_OR_NULL(priv->timestamp_clk)) {
  1414			priv->timestamp_freq = clk_get_rate(priv->timestamp_clk);
  1415		} else {
  1416			if (of_property_read_u32(dev->of_node, "ts-frequency", &priv->timestamp_freq)) {
  1417				dev_info(dev, "failed to read ts-frequency property from device tree\n");
  1418				priv->timestamp_enabled = false;
  1419				return;
  1420			}
  1421			if (priv->timestamp_freq == 0) {
  1422				dev_info(dev, "ts-frequency has to be greater than zero\n");
  1423				priv->timestamp_enabled = false;
  1424			}
  1425		}
  1426	}
  1427	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
