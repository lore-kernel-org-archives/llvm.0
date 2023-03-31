Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483415B8;
	Fri, 31 Mar 2023 02:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680231204; x=1711767204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vwqZAqAZoSYXFCqKevohRNTUhZWRXAV9uVnJi7jz5vQ=;
  b=EZcNvUHMGmaAbsH5xM7Q/95o5MbZ3mPKkcRit9bOv+aV/+sOw+XAE7UC
   lb/xLSTNDomFLNLFtsJmScs6Nhxf/So4dTafXdluFJzd7G7C9nYDoPCiY
   BB0LPHzrU/VJEmOfIGwuIafj4n9G1PhqkX/Y/Z5ko/vvtqqP2BtyOJWSi
   YVilfkSl0S0ipu43Usau+5w4n8gNT1ldUnO2zFlpWn2/YaGX356hTDgZe
   8L8SGaLGWoOy/NPPOggzTmqTLEe+JgbHwP9WEUZDcyeoSVwjmkUebPpWE
   YxtFb7VxKK6BuzIew4dVuMnIpeD14Mh7NXt3GwQRcTUWSYwiyqxdnDQ4t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="320990725"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="320990725"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 19:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="684933787"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="684933787"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Mar 2023 19:53:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi4tE-000LRQ-10;
	Fri, 31 Mar 2023 02:53:20 +0000
Date: Fri, 31 Mar 2023 10:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Aditi Ghag <aditi.ghag@isovalent.com>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kafai@fb.com,
	sdf@google.com, edumazet@google.com, aditi.ghag@isovalent.com
Subject: Re: [PATCH v5 bpf-next 3/7] udp: seq_file: Helper function to match
 socket attributes
Message-ID: <202303311022.2GVz6yAt-lkp@intel.com>
References: <20230330151758.531170-4-aditi.ghag@isovalent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330151758.531170-4-aditi.ghag@isovalent.com>

Hi Aditi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditi-Ghag/bpf-tcp-Avoid-taking-fast-sock-lock-in-iterator/20230330-232137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230330151758.531170-4-aditi.ghag%40isovalent.com
patch subject: [PATCH v5 bpf-next 3/7] udp: seq_file: Helper function to match socket attributes
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230331/202303311022.2GVz6yAt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/66cc617bebf6cb3d2162587d6e248d86bc59c1c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aditi-Ghag/bpf-tcp-Avoid-taking-fast-sock-lock-in-iterator/20230330-232137
        git checkout 66cc617bebf6cb3d2162587d6e248d86bc59c1c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311022.2GVz6yAt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/udp.c:2986:20: warning: function 'seq_sk_match' has internal linkage but is not defined [-Wundefined-internal]
   static inline bool seq_sk_match(struct seq_file *seq, const struct sock *sk);
                      ^
   net/ipv4/udp.c:3015:8: note: used here
                           if (seq_sk_match(seq, sk))
                               ^
   1 warning generated.


vim +/seq_sk_match +2986 net/ipv4/udp.c

  2985	
> 2986	static inline bool seq_sk_match(struct seq_file *seq, const struct sock *sk);
  2987	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
