Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DD2CA7
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639737253; x=1671273253;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rOF7HAx6fNwZtCxO7I5iyge9DZgy63Qo3QwhA65eFBk=;
  b=mn64yezXGogbW/GR7M99kndhCi7XA6d2J89yiNXp0SMxVx7nB8v5MGmH
   NMi1RjqypMomcJDi2E+XKhZOlaiidrd2jNArw7wwifDoFtgUpAAw/Z7R3
   H0b9S2QzJTFX7PP94E8fEAUH9GIxxk6EFAqLtiGie3/xVjiFofjIse5b8
   TE9uW+6gEzkc0/HbUiZUeeKNvEZNZiDBu6hDlcI5d96oPKeJIodzhhOEx
   Ei8K8hWVbfkYK+budqPcWrlEmCxpvVPCaXDCqhTEgTjbvcHNc68+Nm0/h
   6MAdhVRzPvLwQkoIm7o18+DdllRHsZWZaFTTjO8q+vVBDco63qUTrO3Us
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="227015028"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="227015028"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 02:34:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="465082983"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Dec 2021 02:34:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myAYz-0004bF-4H; Fri, 17 Dec 2021 10:34:09 +0000
Date: Fri, 17 Dec 2021 18:33:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH mptcp-next 03/21] mptcp: reflect remote port (not 0) in
 ANNOUNCED events
Message-ID: <202112171855.pp7XfSkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

In-Reply-To: <20211216222314.1244708-4-kishen.maloor@intel.com>
References: <20211216222314.1244708-4-kishen.maloor@intel.com>
TO: Kishen Maloor <kishen.maloor@intel.com>
TO: kishen.maloor@intel.com
TO: mptcp@lists.linux.dev

Hi Kishen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on f81a8b95bfe9cae8ff02739e3e263d9310422af7]

url:    https://github.com/0day-ci/linux/commits/Kishen-Maloor/mptcp-support-userspace-path-management/20211217-062636
base:   f81a8b95bfe9cae8ff02739e3e263d9310422af7
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171855.pp7XfSkU-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bdb267794b512f230544060dba463c0fa9881780
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kishen-Maloor/mptcp-support-userspace-path-management/20211217-062636
        git checkout bdb267794b512f230544060dba463c0fa9881780
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/mptcp/pm_netlink.o: warning: objtool: mptcp_event_addr_announced()+0x39e: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
