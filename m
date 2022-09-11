Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FCC7F
	for <llvm@lists.linux.dev>; Sun, 11 Sep 2022 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662894234; x=1694430234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X0odAtVHMNF7FQEe+eTbElArWamk4jhZ7iWPQa7wX2A=;
  b=BLFLjt6w3ySz9hNoo8j3Y9jy/abCKks6l1AYTCDA3DE7GqF0rPANklfK
   UdMFzSqAWJ3oNRcJJLJAknKdsXKY9iK0FvJyrgarTTDFn4JWUsQHt9A+J
   mqIPNfP6rBBUnFS4o+qkHE5/c9Yj5H5Ma79k30zySlK9afL5IhyXBIfun
   LLTzEhKuanhOtZUpuyn44T9swCwUlsyxhup7fRd4gbfhAPFmyTOWRNyNq
   dSozCSwX+/taVDuvzyWCSSS6nPLP7Fu0Gqoy64LDF9Twf5EwghbYDmatt
   1mxHwGK0S0Ye+OrIF0MTUq8dYqzXWljDEeaudN74Nb3qiUDUaJTNdi7c+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="361667154"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; 
   d="scan'208";a="361667154"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2022 04:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; 
   d="scan'208";a="860871377"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Sep 2022 04:03:51 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXKkg-0001Mo-1y;
	Sun, 11 Sep 2022 11:03:50 +0000
Date: Sun, 11 Sep 2022 19:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Shmulik Ladkani <shmulik@metanetworks.com>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alexei Starovoitov <ast@kernel.org>,
	Paul Chaignon <paul@isovalent.com>,
	Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH v6 bpf-next 2/4] bpf: Support setting variable-length
 tunnel options
Message-ID: <202209111856.i93jzyMu-lkp@intel.com>
References: <20220911084609.102519-3-shmulik.ladkani@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911084609.102519-3-shmulik.ladkani@gmail.com>

Hi Shmulik,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Shmulik-Ladkani/bpf-Support-setting-variable-length-tunnel-options/20220911-164822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: hexagon-randconfig-r026-20220911 (https://download.01.org/0day-ci/archive/20220911/202209111856.i93jzyMu-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/caa3b97e327a79cad590d53687cc0e9eb07ecd4b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shmulik-Ladkani/bpf-Support-setting-variable-length-tunnel-options/20220911-164822
        git checkout caa3b97e327a79cad590d53687cc0e9eb07ecd4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_dynptr_get_size
   >>> referenced by filter.c
   >>>               core/filter.o:(bpf_skb_set_tunnel_opt_dynptr) in archive net/built-in.a
   >>> referenced by filter.c
   >>>               core/filter.o:(bpf_skb_set_tunnel_opt_dynptr) in archive net/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
