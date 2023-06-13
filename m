Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DC9136A;
	Tue, 13 Jun 2023 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686685347; x=1718221347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lz85jrU6iR9R6CqSIYyzCsTLAAEFjmrL/CeWk5ErFa4=;
  b=lPylbGrglXiK1nr6xN/3v6CfVNVSg+9Q/ixsPlsfApamnXWq1pZqtksK
   tDsoj00Yr/5Adw7KIG4dyuLhJu6U/iXTgAvdYq4Ip1sfDn0nf6rK1hXra
   5e0yhapwjxUBkPDVExY+murl0yMU685CQS4FlUZzUTkRGTdDQ5taOYZJU
   NCNeQbstYEfvrAUNBkjNamqIWQ07MfS37c3+KerAOn+/S0M8PAoLxML2W
   ZJurYpzxfZ2yf8ZPNzxTFBDVgtcYIxEW9uuWXYuf1TMXjBPeihYSEuFNp
   /6y1rE3HPD1/0ygiLiWHsoYb92Adynr9N38T36Fo8i9KA5MAxmFI47GH8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="355935114"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="355935114"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 12:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="856242508"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="856242508"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2023 12:42:19 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q99uE-0001ia-0x;
	Tue, 13 Jun 2023 19:42:18 +0000
Date: Wed, 14 Jun 2023 03:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenz Bauer <lmb@isovalent.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Joe Stringer <joe@wand.net.nz>, Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Hemanth Malla <hemanthmalla@gmail.com>,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Lorenz Bauer <lmb@isovalent.com>
Subject: Re: [PATCH bpf-next v2 4/6] net: remove duplicate sk_lookup helpers
Message-ID: <202306140351.Y1JjOIxo-lkp@intel.com>
References: <20230613-so-reuseport-v2-4-b7c69a342613@isovalent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613-so-reuseport-v2-4-b7c69a342613@isovalent.com>

Hi Lorenz,

kernel test robot noticed the following build errors:

[auto build test ERROR on 25085b4e9251c77758964a8e8651338972353642]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenz-Bauer/net-export-inet_lookup_reuseport-and-inet6_lookup_reuseport/20230613-181619
base:   25085b4e9251c77758964a8e8651338972353642
patch link:    https://lore.kernel.org/r/20230613-so-reuseport-v2-4-b7c69a342613%40isovalent.com
patch subject: [PATCH bpf-next v2 4/6] net: remove duplicate sk_lookup helpers
config: hexagon-randconfig-r041-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140351.Y1JjOIxo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 25085b4e9251c77758964a8e8651338972353642
        b4 shazam https://lore.kernel.org/r/20230613-so-reuseport-v2-4-b7c69a342613@isovalent.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140351.Y1JjOIxo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "inet6_lookup_run_sk_lookup" [net/ipv6/ipv6.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
