Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF89C6A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645623036; x=1677159036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f/0m4v1D7Q4FmvcA0EB0g3hgY2m0AgicOQr1GIshUWQ=;
  b=f7uQk3TiF0YJRMifmiWrRG23fQOrE84WYKxh8Bl9JWY9LsjgtnfFyI4T
   /k5XkiBR7PwzmT3HvlWuPw9gM8yg0Nqpnm2zHdab44Aphwk5eCjerOoYR
   13Elxp9Lyn7ulssDdKUzHgbenPWniUyzPyPODR9B7hm6CJqodxExUtCTr
   MH7DWyoNNV5knpQNH5ERnO+kyoOzZrdYTtKZkbVSbMp2LXqKmn+S+q8WM
   JEPELphPwXWVXa+k9noc2TfrVyXycpeMZDEGCkxv8q6ke09RFVAMJCav1
   IZIX+OxUO311qavwIxyQv9LmAn8vLlX9MCd1/6PdL4anRWlE7CC2ORfEX
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="250787726"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="250787726"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 05:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="491195689"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2022 05:30:33 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMriy-0001Us-Mg; Wed, 23 Feb 2022 13:30:32 +0000
Date: Wed, 23 Feb 2022 21:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 7091/7526] drivers/iio/accel/adxl367.c:887:2:
 warning: variable 'handled' is uninitialized when used here
Message-ID: <202202232151.V9qvCes4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   196d330d7fb1e7cc0d85641c89ce4602cb36f12e
commit: cbab791c5e2a58c123d84bd9202c054e5449bc96 [7091/7526] iio: accel: add ADXL367 driver
config: hexagon-randconfig-r022-20220223 (https://download.01.org/0day-ci/archive/20220223/202202232151.V9qvCes4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cbab791c5e2a58c123d84bd9202c054e5449bc96
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cbab791c5e2a58c123d84bd9202c054e5449bc96
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/adxl367.c:887:2: warning: variable 'handled' is uninitialized when used here [-Wuninitialized]
           handled |= adxl367_push_event(indio_dev, status);
           ^~~~~~~
   drivers/iio/accel/adxl367.c:879:14: note: initialize the variable 'handled' to silence this warning
           bool handled;
                       ^
                        = 0
   1 warning generated.


vim +/handled +887 drivers/iio/accel/adxl367.c

   873	
   874	static irqreturn_t adxl367_irq_handler(int irq, void *private)
   875	{
   876		struct iio_dev *indio_dev = private;
   877		struct adxl367_state *st = iio_priv(indio_dev);
   878		u16 fifo_entries;
   879		bool handled;
   880		u8 status;
   881		int ret;
   882	
   883		ret = adxl367_get_status(st, &status, &fifo_entries);
   884		if (ret)
   885			return IRQ_NONE;
   886	
 > 887		handled |= adxl367_push_event(indio_dev, status);
   888		handled |= adxl367_push_fifo_data(indio_dev, status, fifo_entries);
   889	
   890		return handled ? IRQ_HANDLED : IRQ_NONE;
   891	}
   892	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
