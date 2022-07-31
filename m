Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D6C15D9
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 23:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659310260; x=1690846260;
  h=date:from:cc:subject:message-id:mime-version;
  bh=L7VXJdPyE/uwoIUSWUiakpLlSR4AbB/wRm3xII3L4OU=;
  b=VHFcrXFsaRLN7DfRxAUYd22SCP4CjSufsByvFlpyq0dBUZkot9ldxWzH
   MRKK7F86mGCxvQzM6BqNeKbZ+hY6/gD+0yXG+/fgbBfYgDDazYJDNUvrX
   wbAb7X5dqvt+TFNyNIkOX+coNb2/noOhljXGziBypVX/c/uZR15lAzl0l
   FVPKFwA7i/d2CAXUlgPM7iqSEbgBu1a/y9M8nysJjPCeaUCh8Cj4xcBCh
   gr0/vRxqOUm8azfkLPMVckXbdLE08jR2dPn3UEHi2RIr9NzpG701FDxsF
   9BAbAshThY8Giw/Dx13OUF0Nxv3lo6iVbpP+WEgcHgTOOVM1l6uAZCb+f
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="289046986"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="289046986"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 16:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="929353360"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2022 16:30:59 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIIOg-000Ect-1d;
	Sun, 31 Jul 2022 23:30:58 +0000
Date: Mon, 1 Aug 2022 07:30:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: net/ipv6/ipv6.o: warning: objtool: seg6_local_fill_encap() falls
 through to next function seg6_local_get_encap_size()
Message-ID: <202208010736.vAZ7rWVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>
CC: Sami Tolvanen <samitolvanen@google.com>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   334c0ef6429f261c7f53dc035632435ffbc0c60d
commit: c25e1c55822f9b3b53ccbf88b85644317a525752 kbuild: do not create *.prelink.o for Clang LTO or IBT
date:   9 weeks ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220801/202208010736.vAZ7rWVB-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c25e1c55822f9b3b53ccbf88b85644317a525752
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c25e1c55822f9b3b53ccbf88b85644317a525752
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv6/ipv6.o: warning: objtool: seg6_local_fill_encap() falls through to next function seg6_local_get_encap_size()
>> net/ipv6/ipv6.o: warning: objtool: seg6_local_cmp_encap() falls through to next function input_action_end()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
