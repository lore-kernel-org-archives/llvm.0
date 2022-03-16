Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13D7A
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647427979; x=1678963979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoN56wltdawSBnQ/5OZKTvvvjGtUupSo97DKz81C/v8=;
  b=H0yOGntfT5XoNeel7yc9lvWPJ5pVa+gm5iKi+E08zoBwdNL6c92UTHMR
   sljR1Z04pg3g94r8fA7l/aQm3NgPMZeKCt/sqJgGRU3/gxIh383fYrcQR
   0Epem+c4KYcWl3fmqSJHOvQuz+NFKGZcU2ivFSNyeryqotPJjrT7NYqfP
   3hvTnUZjtgJfyqSyqTmB+xAsmbUmDuLr1sCUY1LDlalAk9GLQ+OQH6wX8
   u4o3rKUiZm/rneXg/NccZf3kH2TEwa2OiBq36rwJ0zV9IWYnn1fTVIPZY
   KCS8F7mfpJ0cd42pkTV21mcg8vyUN43K+lwi3uDHALwlTh5xrKCuRAWUT
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342978690"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="342978690"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 03:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; 
   d="scan'208";a="540861798"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2022 03:52:56 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nURGy-000CHO-5S; Wed, 16 Mar 2022 10:52:56 +0000
Date: Wed, 16 Mar 2022 18:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: hch <hch@lst.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: drivers/nvme/host/core.c:3629:50: error: use of undeclared
 identifier 'ctrl'
Message-ID: <202203161805.I9aAHZ66-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20220315-151414/Sungup-Moon/driver-nvme-host-Support-duplicated-nsid-for-the-private-ns/20220314-191232
head:   7101b34f72a97926495a7befec1c27c502c1f792
commit: 7101b34f72a97926495a7befec1c27c502c1f792 driver/nvme/host: Support duplicated nsid for the private ns
date:   28 hours ago
config: hexagon-randconfig-r045-20220313 (https://download.01.org/0day-ci/archive/20220316/202203161805.I9aAHZ66-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7101b34f72a97926495a7befec1c27c502c1f792
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20220315-151414/Sungup-Moon/driver-nvme-host-Support-duplicated-nsid-for-the-private-ns/20220314-191232
        git checkout 7101b34f72a97926495a7befec1c27c502c1f792
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/nvme/host/core.c:3629:50: error: use of undeclared identifier 'ctrl'
                   if (h->ns_id != nsid || !nvme_is_uniqueue_nsid(ctrl, head))
                                                                  ^
>> drivers/nvme/host/core.c:3629:56: error: use of undeclared identifier 'head'
                   if (h->ns_id != nsid || !nvme_is_uniqueue_nsid(ctrl, head))
                                                                        ^
   2 errors generated.


vim +/ctrl +3629 drivers/nvme/host/core.c

  3615	
  3616	static struct nvme_ns_head *nvme_find_ns_head(struct nvme_subsystem *subsys,
  3617			unsigned nsid)
  3618	{
  3619		struct nvme_ns_head *h;
  3620	
  3621		lockdep_assert_held(&subsys->lock);
  3622	
  3623		list_for_each_entry(h, &subsys->nsheads, entry) {
  3624			/*
  3625			 * Private namespaces can share NSIDs under some conditions.
  3626			 * In that case we can't use the same ns_head for namespaces
  3627			 * with the same NSID.
  3628			 */
> 3629			if (h->ns_id != nsid || !nvme_is_uniqueue_nsid(ctrl, head))
  3630				continue;
  3631			if (!list_empty(&h->list) && nvme_tryget_ns_head(h))
  3632				return h;
  3633		}
  3634	
  3635		return NULL;
  3636	}
  3637	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
