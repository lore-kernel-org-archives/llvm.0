Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369C7B
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651148487; x=1682684487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BuyVUugmKckGel4AD4tVuMjW9CTVA2LYoz+rEskg46Q=;
  b=gfGHR56/fuAJapIUjzW6ZtC4z869H/GB3S86Z0tzZ/FbMlKkfq5jTSfx
   OwljD/QzNOFP4kTm5/vp3sc/ewWhvs+ScNPNWaS9/SB0toxveQe4vLXrQ
   uYDfLWGacRMRpxWMtZqzBun+mhyIzXX240LmEAExUNZce8JJ5lQb78KqK
   ZRBALATwVZVxmDi7Rs2ul+Dpf8BgitD3TTHZtILOgDBSK52hAqdZ13DFg
   uiXWPb/uzVnrMknRVWcSbxz3ej12SEeDMJiiQlgO00CBLAcdjc43wXuYg
   2KaiOAJ1wzUY9o9dcgD7XF4geOnIBchT2CL95b6b6OimPhMi6QZzJa0gC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="266086275"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; 
   d="scan'208";a="266086275"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 05:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; 
   d="scan'208";a="629533041"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2022 05:21:25 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nk39A-0005LD-OK;
	Thu, 28 Apr 2022 12:21:24 +0000
Date: Thu, 28 Apr 2022 20:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 25/45] ERROR:
 modpost: "fscache_begin_cache_operation" [fs/ceph/ceph.ko] undefined!
Message-ID: <202204282026.rHTqR6gy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-linked-list
head:   a20ca5707a9b524115f5ded439fed1f8e552dd6b
commit: 506cacdcdfd787336db327e5f38d5a378d5998fd [25/45] fscache: Add a function to begin an cache op from a netfslib request
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220428/202204282026.rHTqR6gy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/506cacdcdfd787336db327e5f38d5a378d5998fd
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-linked-list
        git checkout 506cacdcdfd787336db327e5f38d5a378d5998fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fscache_begin_cache_operation" [fs/ceph/ceph.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
