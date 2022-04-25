Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208AE7C
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650891062; x=1682427062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7uCeImf+o2Hrbcmda0wf1EyZkteFnt4hYGpfvkGjX0w=;
  b=MDqZEOCU3zUg0IBPft3I14MjCI5aNDS5HVPtbrBG4NKevdIS69Fh0fsG
   ICkyEMpeWSKJfssSenlzsZOfW3zCuLyOICS6cDOzAVLvGYfOGOihTPw/L
   PFiojo07HK6wGlbzTglzXUE6KD/GBZ3H+N8T2wmCBUEoyM4B8TSxxzYNj
   9Vf2vRg502s3jUcVAZ3XejybUeo3O1G5fNF9b3JKwwHjyy/7oT3B+Xio+
   O9wYV0jZaAX4wJYBVItkUr0pPzXlD/+5sisA7LeEJqHjuFD7x/H/cxc6k
   hsQokJ+K6L0b6ZpdbpZ8GkZakak4oizrpfcWqUfLpDEotlkRwqrXxhofI
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351684366"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; 
   d="scan'208";a="351684366"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 05:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; 
   d="scan'208";a="872674513"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Apr 2022 05:50:58 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niyB7-0002VD-Qq;
	Mon, 25 Apr 2022 12:50:57 +0000
Date: Mon, 25 Apr 2022 20:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	"lian . chen" <lian.chen@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Bo Jiao <Bo.Jiao@mediatek.com>
Subject: Re: [PATCH v2] mt76: mt7915: dump SER stats through debugfs
Message-ID: <202204252050.kt1MHzwD-lkp@intel.com>
References: <fe715dbd6cd43651b50172acf58bb1eab66584da.1650857049.git.Bo.Jiao@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe715dbd6cd43651b50172acf58bb1eab66584da.1650857049.git.Bo.Jiao@mediatek.com>

Hi Bo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Jiao/mt76-mt7915-dump-SER-stats-through-debugfs/20220425-113739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220425/202204252050.kt1MHzwD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3d98cf66e18c4da1c5ee68eb987c34598e959da4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bo-Jiao/mt76-mt7915-dump-SER-stats-through-debugfs/20220425-113739
        git checkout 3d98cf66e18c4da1c5ee68eb987c34598e959da4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/mt7915/ lib/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:87:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:87:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +87 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c

6d6dc980e07d1f8 Ryder Lee 2021-01-14  43  
6d6dc980e07d1f8 Ryder Lee 2021-01-14  44  DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
6d6dc980e07d1f8 Ryder Lee 2021-01-14  45  			 mt7915_implicit_txbf_set, "%lld\n");
6d6dc980e07d1f8 Ryder Lee 2021-01-14  46  
e57b7901469fc0b Ryder Lee 2020-04-25  47  /* test knob of system layer 1/2 error recovery */
3d98cf66e18c4da Ryder Lee 2022-04-25  48  static ssize_t mt7915_fw_ser_set(struct file *file,
3d98cf66e18c4da Ryder Lee 2022-04-25  49  				 const char __user *user_buf,
3d98cf66e18c4da Ryder Lee 2022-04-25  50  				 size_t count, loff_t *ppos)
e57b7901469fc0b Ryder Lee 2020-04-25  51  {
e57b7901469fc0b Ryder Lee 2020-04-25  52  	enum {
3d98cf66e18c4da Ryder Lee 2022-04-25  53  		SER_QUERY = 0,
e57b7901469fc0b Ryder Lee 2020-04-25  54  		SER_SET_RECOVER_L1 = 1,
e57b7901469fc0b Ryder Lee 2020-04-25  55  		SER_SET_RECOVER_L2,
e57b7901469fc0b Ryder Lee 2020-04-25  56  		SER_ENABLE = 2,
e57b7901469fc0b Ryder Lee 2020-04-25  57  		SER_RECOVER
e57b7901469fc0b Ryder Lee 2020-04-25  58  	};
3d98cf66e18c4da Ryder Lee 2022-04-25  59  	struct mt7915_dev *dev = file->private_data;
3d98cf66e18c4da Ryder Lee 2022-04-25  60  	char buf[16];
3d98cf66e18c4da Ryder Lee 2022-04-25  61  	u16 val;
3d98cf66e18c4da Ryder Lee 2022-04-25  62  
3d98cf66e18c4da Ryder Lee 2022-04-25  63  	if (count >= sizeof(buf))
3d98cf66e18c4da Ryder Lee 2022-04-25  64  		return -EINVAL;
3d98cf66e18c4da Ryder Lee 2022-04-25  65  
3d98cf66e18c4da Ryder Lee 2022-04-25  66  	if (copy_from_user(buf, user_buf, count))
3d98cf66e18c4da Ryder Lee 2022-04-25  67  		return -EFAULT;
3d98cf66e18c4da Ryder Lee 2022-04-25  68  
3d98cf66e18c4da Ryder Lee 2022-04-25  69  	if (count && buf[count - 1] == '\n')
3d98cf66e18c4da Ryder Lee 2022-04-25  70  		buf[count - 1] = '\0';
3d98cf66e18c4da Ryder Lee 2022-04-25  71  	else
3d98cf66e18c4da Ryder Lee 2022-04-25  72  		buf[count] = '\0';
3d98cf66e18c4da Ryder Lee 2022-04-25  73  
3d98cf66e18c4da Ryder Lee 2022-04-25  74  	if (kstrtou16(buf, 0, &val))
3d98cf66e18c4da Ryder Lee 2022-04-25  75  		return -EINVAL;
e57b7901469fc0b Ryder Lee 2020-04-25  76  
e57b7901469fc0b Ryder Lee 2020-04-25  77  	switch (val) {
3d98cf66e18c4da Ryder Lee 2022-04-25  78  	case SER_QUERY:
3d98cf66e18c4da Ryder Lee 2022-04-25  79  		/* grab firmware SER stats */
3d98cf66e18c4da Ryder Lee 2022-04-25  80  		mt7915_mcu_set_ser(dev, 0, 0, 0);
3d98cf66e18c4da Ryder Lee 2022-04-25  81  		break;
e57b7901469fc0b Ryder Lee 2020-04-25  82  	case SER_SET_RECOVER_L1:
e57b7901469fc0b Ryder Lee 2020-04-25  83  	case SER_SET_RECOVER_L2:
3d98cf66e18c4da Ryder Lee 2022-04-25  84  		mt7915_mcu_set_ser(dev, SER_ENABLE, BIT(val), 0);
e57b7901469fc0b Ryder Lee 2020-04-25  85  
3d98cf66e18c4da Ryder Lee 2022-04-25  86  		mt7915_mcu_set_ser(dev, SER_RECOVER, val, 0);
e57b7901469fc0b Ryder Lee 2020-04-25 @87  	default:
e57b7901469fc0b Ryder Lee 2020-04-25  88  		break;
e57b7901469fc0b Ryder Lee 2020-04-25  89  	}
e57b7901469fc0b Ryder Lee 2020-04-25  90  
3d98cf66e18c4da Ryder Lee 2022-04-25  91  	return count;
3d98cf66e18c4da Ryder Lee 2022-04-25  92  }
3d98cf66e18c4da Ryder Lee 2022-04-25  93  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
