Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022407B
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 23:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648856044; x=1680392044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtWDZBoZ9HU0GQJUhsn93GzpAZmBgdqKwRs7SJ1Z7S8=;
  b=RisqZWzOvPBTPyj3RPHxE/rlv2EXPnZcEhKpjcU81pUAVrGt/MvqkPDS
   kQREu6Jp4IxpDnYvtHQdGUJtSYUIL0FGjCL3PUEl5MDjxN5ucaAe++K7J
   X/egP5Wf85ABUyLR/0GZp3wfNHFZIP0VRxlUsZN4TzyfGKqMp5a81XpvB
   WUylIwc/cq7gVsPH6ont+M0tyvfTh6C0Bvk5mYEEr/3WDIim6ZDD6x3ov
   a6t6PPMeMd425e79usfq8PhAgX+az5DbWEBf8Fkub4h/4eB/zy+lzzyho
   DPa+ohmj9nCYU50l93zCVNRf0W8G0362r48KRHdK64dht6VmzWM+7ntBA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="257832269"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="257832269"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 16:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="721050141"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Apr 2022 16:34:01 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1naQmG-0001b4-TK;
	Fri, 01 Apr 2022 23:34:00 +0000
Date: Sat, 2 Apr 2022 07:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>
Subject: [ogabbay:habanalabs-next 25/28]
 drivers/misc/habanalabs/goya/goya.c:4265:5: warning: no previous prototype
 for function 'goya_debugfs_read_dma'
Message-ID: <202204020715.RF7P32XV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git habanalabs-next
head:   fa59c43c5c906277ab3b753d782488ef4fd3ba62
commit: cb162eee0d9f31c21860a9f454563abde2ff30aa [25/28] habanalabs: remove debugfs read/write callbacks
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220402/202204020715.RF7P32XV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project cc2e2b80a1f36a28fa7c96c38c2674b10868f09f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git/commit/?id=cb162eee0d9f31c21860a9f454563abde2ff30aa
        git remote add ogabbay https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
        git fetch --no-tags ogabbay habanalabs-next
        git checkout cb162eee0d9f31c21860a9f454563abde2ff30aa
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/misc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/misc/habanalabs/goya/goya.c:4265:5: warning: no previous prototype for function 'goya_debugfs_read_dma' [-Wmissing-prototypes]
   int goya_debugfs_read_dma(struct hl_device *hdev, u64 addr, u32 size,
       ^
   drivers/misc/habanalabs/goya/goya.c:4265:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int goya_debugfs_read_dma(struct hl_device *hdev, u64 addr, u32 size,
   ^
   static 
   1 warning generated.


vim +/goya_debugfs_read_dma +4265 drivers/misc/habanalabs/goya/goya.c

  4264	
> 4265	int goya_debugfs_read_dma(struct hl_device *hdev, u64 addr, u32 size,
  4266					void *blob_addr)
  4267	{
  4268		dev_err(hdev->dev, "Reading via DMA is unimplemented yet\n");
  4269		return -EPERM;
  4270	}
  4271	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
