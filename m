Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3947E
	for <llvm@lists.linux.dev>; Sun, 27 Mar 2022 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648405701; x=1679941701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/sMEqbw1Moa+gWw/LzWjzw1Rg9NXNzz2vVR5BZvh60=;
  b=jJw4Df472r78qUceTvOs4ujOK6r2LvcyZ5vDXoZlPKuKTAVHwd0fl2Fw
   7su6rEuXOxnRbHUV2BU0AaqzsMonLxic9W38kSiuzeg2fdrUG2lmDDxY/
   j2nbbULOmTEmHUc6MNzsl1FIkOqit2hs0On0UN65X8EM0ZcNCf3slMbqd
   uw9uJHnC7bPibtUWBwgf99HvmLarQr2Tl78iUhKKkgPiln/WyMpqNVWW8
   2PfW16xu8GvHBYUIAreaHEXQ9xujjcU4DDhhm+mDec0SEvIofUGKKNPdb
   CwXrgTfxMjup9C3O7HDa46McFvqbHaL6N8nJ3aprBMjUg61JFYMjLg72I
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258836849"
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; 
   d="scan'208";a="258836849"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 11:28:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,215,1643702400"; 
   d="scan'208";a="520746398"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Mar 2022 11:28:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYXcf-0001Jc-Gz; Sun, 27 Mar 2022 18:28:17 +0000
Date: Mon, 28 Mar 2022 02:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnikant Bhojani <rajnikant.bhojani@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Shubhrajyoti Datta <shubhraj@xilinx.com>,
	Jean-Francois Dagenais <jeff.dagenais@gmail.com>,
	Olivier Dugas <dugaso@sonatest.com>,
	Manish Narani <mnarani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 541/1029]
 drivers/iio/adc/xilinx-ams.c:384:10: warning: signed shift result
 (0x446A60000) requires 36 bits to represent, but 'long' only has 32 bits
Message-ID: <202203280217.8cuVg5lK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: d073b83d3f8f3ba83c59f7502371b1cf9eb35e92 [541/1029] iio: adc: Add Xilinx AMS driver
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archive/20220328/202203280217.8cuVg5lK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/d073b83d3f8f3ba83c59f7502371b1cf9eb35e92
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout d073b83d3f8f3ba83c59f7502371b1cf9eb35e92
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/xilinx-ams.c:384:10: warning: signed shift result (0x446A60000) requires 36 bits to represent, but 'long' only has 32 bits [-Wshift-overflow]
                   *val = AMS_TEMP_OFFSET;
                          ^~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.h:134:47: note: expanded from macro 'AMS_TEMP_OFFSET'
   #define AMS_TEMP_OFFSET            -((280230L << 16) / 509314)
                                         ~~~~~~~ ^  ~~
   drivers/iio/adc/xilinx-ams.c:38:20: warning: unused function 'ams_update_reg' [-Wunused-function]
   static inline void ams_update_reg(struct ams *ams, unsigned int offset,
                      ^
   2 warnings generated.


vim +/long +384 drivers/iio/adc/xilinx-ams.c

   313	
   314	static int ams_read_raw(struct iio_dev *indio_dev,
   315				struct iio_chan_spec const *chan,
   316				int *val, int *val2, long mask)
   317	{
   318		struct ams *ams = iio_priv(indio_dev);
   319	
   320		switch (mask) {
   321		case IIO_CHAN_INFO_RAW:
   322			mutex_lock(&ams->mutex);
   323			if (chan->scan_index >= (PS_SEQ_MAX * 3))
   324				ams_read_vcc_reg(ams, chan->address, val);
   325			else if (chan->scan_index >= PS_SEQ_MAX)
   326				ams->pl_bus->read(ams, chan->address, val);
   327			else
   328				ams_ps_read_reg(ams, chan->address, val);
   329			mutex_unlock(&ams->mutex);
   330	
   331			*val2 = 0;
   332			return IIO_VAL_INT;
   333		case IIO_CHAN_INFO_SCALE:
   334			switch (chan->type) {
   335			case IIO_VOLTAGE:
   336				switch (chan->address) {
   337				case AMS_SUPPLY1:
   338				case AMS_SUPPLY2:
   339				case AMS_SUPPLY3:
   340				case AMS_SUPPLY4:
   341					*val = AMS_SUPPLY_SCALE_3VOLT;
   342					break;
   343				case AMS_SUPPLY5:
   344				case AMS_SUPPLY6:
   345					if (chan->scan_index < PS_SEQ_MAX)
   346						*val = AMS_SUPPLY_SCALE_6VOLT;
   347					else
   348						*val = AMS_SUPPLY_SCALE_3VOLT;
   349					break;
   350				case AMS_SUPPLY7:
   351				case AMS_SUPPLY8:
   352					*val = AMS_SUPPLY_SCALE_6VOLT;
   353					break;
   354				case AMS_SUPPLY9:
   355				case AMS_SUPPLY10:
   356					if (chan->scan_index < PS_SEQ_MAX)
   357						*val = AMS_SUPPLY_SCALE_3VOLT;
   358					else
   359						*val = AMS_SUPPLY_SCALE_6VOLT;
   360					break;
   361				case AMS_VREFP:
   362				case AMS_VREFN:
   363						*val = AMS_SUPPLY_SCALE_3VOLT;
   364					break;
   365	
   366				default:
   367					if (chan->scan_index >= (PS_SEQ_MAX * 3))
   368						*val = AMS_SUPPLY_SCALE_3VOLT;
   369					else
   370						*val = AMS_SUPPLY_SCALE_1VOLT;
   371					break;
   372				}
   373				*val2 = AMS_SUPPLY_SCALE_DIV_BIT;
   374				return IIO_VAL_FRACTIONAL_LOG2;
   375			case IIO_TEMP:
   376				*val = AMS_TEMP_SCALE;
   377				*val2 = AMS_TEMP_SCALE_DIV_BIT;
   378				return IIO_VAL_FRACTIONAL_LOG2;
   379			default:
   380				return -EINVAL;
   381			}
   382		case IIO_CHAN_INFO_OFFSET:
   383			/* Only the temperature channel has an offset */
 > 384			*val = AMS_TEMP_OFFSET;
   385			*val2 = 0;
   386			return IIO_VAL_INT;
   387		}
   388	
   389		return -EINVAL;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
