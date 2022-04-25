Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5557E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650884313; x=1682420313;
  h=date:from:cc:subject:message-id:mime-version;
  bh=36MTGdCQNX+t+seT9OO0xkQNbcLQ6ZpXrcduD/RKDbU=;
  b=jzFRXI8soHloQNLTyCq7QBLv7sqJEDl457nUehrhCr0l+PFvXqhu5I2i
   BFlNlaKYOgvL6frjmMgL0KSwva5m510TgrAUSnsUlus/aVPM8mNuN7ydr
   niG1FhKMJk0r8QgiRixZ/c/QWNUbPvdQzKP7K18coaKQBMQyN+yS4Zidb
   cFn1um/4MWgUm9FnsAMPGLpP42/B0epfuQRQmy3EeWLvlpa3YNTelwNHp
   eAt5EkMVEofDMzrrseUrOrv2LHWr1XsVGHkHn9Vkiu3iaMc+zIetX4+eT
   TePDktvmh1XDm1xRl6TmvTeTJIa/vsB02Ab1RH6kfAwCTKbok/iSj8NHX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="252581342"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="252581342"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 03:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="704510082"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2022 03:58:31 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niwQI-0002Ng-ED;
	Mon, 25 Apr 2022 10:58:30 +0000
Date: Mon, 25 Apr 2022 18:58:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [sashal-stable:pending-5.10 26/57] net/netlink/af_netlink.o:
 warning: objtool: netlink_dump()+0xace: unreachable instruction
Message-ID: <202204251847.dIuJEawJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   9cfc31e26ebe80f91361f805c2b06dd0cae2b4a2
commit: 828cbcb627339f596f11f9f0ea4025d898f5534f [26/57] netlink: reset network and mac headers in netlink_dump()
config: x86_64-randconfig-a005-20220425 (https://download.01.org/0day-ci/archive/20220425/202204251847.dIuJEawJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=828cbcb627339f596f11f9f0ea4025d898f5534f
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 828cbcb627339f596f11f9f0ea4025d898f5534f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/netlink/af_netlink.o: warning: objtool: netlink_dump()+0xace: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
