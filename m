Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B1A950;
	Wed, 12 Apr 2023 23:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681343849; x=1712879849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZnN0w6wo4hZ1/laAuR8u9wAnD47PeojNpC2csT3lvfU=;
  b=Gkym0yEfapSg4IQTxJDw78jLU0fOKYw8vstrNv0xePSFjT5pxbGM2c+e
   BSaAyDbFkmoz4aUAYqLrES2bR0swp57/ozYfgeQMyEOJlPhax9WQ4PkkB
   2lmnIVEczokpBFroaEPxkkGmdk/hl0FuROyqG+bOC824/2STrZtgpLmG0
   HLTGL5zxJ9DNJ9O/ti/m2VwSH4chAJJLawob3SLDfIruoQ3Iu9rulHpH8
   p0kF/Ltjx3exE3wszA/SV657bpdVGe5Sys0Bgs7ihoReshoKwCH9bHiS+
   tNpANNsxwV1POejpU7VPF3153vF7QLGo0C7XDArwIptuJHEgOfKMIe2lk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332752421"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="332752421"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 16:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863507504"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863507504"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 16:57:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmkL8-000Y9T-2O;
	Wed, 12 Apr 2023 23:57:26 +0000
Date: Thu, 13 Apr 2023 07:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik =?iso-8859-1?Q?Dahlstr=F6m?= <risca@dalakolonin.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 9/10] drivers/iio/adc/palmas_gpadc.c:753:7:
 warning: variable 'old' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202304130711.Eueav3k7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   32f442dba193b5682bd1e9784b0ea42893c6e966
commit: 78441f504e3991b3f33b48de6fc8ed3cba7a40a7 [9/10] iio: adc: palmas: add support for iio threshold events
config: i386-randconfig-a002-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130711.Eueav3k7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=78441f504e3991b3f33b48de6fc8ed3cba7a40a7
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout 78441f504e3991b3f33b48de6fc8ed3cba7a40a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130711.Eueav3k7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/palmas_gpadc.c:753:7: warning: variable 'old' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (val < 0 || val > 0xFFF) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/palmas_gpadc.c:772:13: note: uninitialized use occurs here
           if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
                      ^~~
   drivers/iio/adc/palmas_gpadc.c:753:3: note: remove the 'if' if its condition is always false
                   if (val < 0 || val > 0xFFF) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/palmas_gpadc.c:753:7: warning: variable 'old' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
                   if (val < 0 || val > 0xFFF) {
                       ^~~~~~~
   drivers/iio/adc/palmas_gpadc.c:772:13: note: uninitialized use occurs here
           if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
                      ^~~
   drivers/iio/adc/palmas_gpadc.c:753:7: note: remove the '||' if its condition is always false
                   if (val < 0 || val > 0xFFF) {
                       ^~~~~~~~~~
   drivers/iio/adc/palmas_gpadc.c:744:9: note: initialize the variable 'old' to silence this warning
           int old;
                  ^
                   = 0
   2 warnings generated.


vim +753 drivers/iio/adc/palmas_gpadc.c

   734	
   735	static int palmas_gpadc_write_event_value(struct iio_dev *indio_dev,
   736						  const struct iio_chan_spec *chan,
   737						  enum iio_event_type type,
   738						  enum iio_event_direction dir,
   739						  enum iio_event_info info,
   740						  int val, int val2)
   741	{
   742		struct palmas_gpadc *adc = iio_priv(indio_dev);
   743		int adc_chan = chan->channel;
   744		int old;
   745		int ret;
   746	
   747		if (adc_chan > PALMAS_ADC_CH_MAX || type != IIO_EV_TYPE_THRESH)
   748			return -EINVAL;
   749	
   750		mutex_lock(&adc->lock);
   751		switch (info) {
   752		case IIO_EV_INFO_VALUE:
 > 753			if (val < 0 || val > 0xFFF) {
   754				ret = -EINVAL;
   755				break;
   756			}
   757			if (dir == IIO_EV_DIR_RISING) {
   758				old = adc->thresholds[adc_chan].high;
   759				adc->thresholds[adc_chan].high = val;
   760			}
   761			else {
   762				old = adc->thresholds[adc_chan].low;
   763				adc->thresholds[adc_chan].low = val;
   764			}
   765			ret = 0;
   766			break;
   767		default:
   768			ret = -EINVAL;
   769			goto out_unlock;
   770		}
   771	
   772		if (val != old && palmas_gpadc_get_event(adc, adc_chan, dir))
   773			ret = palmas_gpadc_reconfigure_event_channels(adc);
   774	
   775	out_unlock:
   776		mutex_unlock(&adc->lock);
   777	
   778		return ret;
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
