Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580383D74
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 18:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663438749; x=1694974749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DUa9obSGuiTqCP4Sfkc1Ji7qDShjKrPwVtjC8KTjhJg=;
  b=cDPJC2VFMbPzGb1J3IpRHzmjvlctNIDVoKKNw3j3uNZ58r6pqkkrdmkl
   +OtZFlhknCSmSHoVRzbS8FFiIC+dTEok2byq9v6D6zT/5heV4Zkjo86ka
   CvKpADnY2FkHQDYDFQK2rZNdu2efYwq7eKm5jBcCtc86d31M3nNpiTAhW
   tiuuA7dLBvxiYYg5Vp9IsvHN45NEUyJh5ZRBjFFQX+QgNAMHl8Z7iJHaE
   MJsZV5oPTcLocEzvWRh+dBF8D7dPqMAjDayn0b9YqPKk0RYcfjL0Zxy8f
   +F9DQ+v1m7TiQsQ6XFOi3NTXzoTT8348YtGllffn1qpJn3firj/gGN0EA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="363132612"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="363132612"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 11:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="743671881"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Sep 2022 11:19:04 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZcP9-0000Vn-1N;
	Sat, 17 Sep 2022 18:19:03 +0000
Date: Sun, 18 Sep 2022 02:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao@huaweicloud.com>, bpf@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Song Liu <songliubraving@fb.com>, Hao Luo <haoluo@google.com>,
	Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <kafai@fb.com>, KP Singh <kpsingh@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Lorenz Bauer <oss@lmb.io>, "Paul E . McKenney" <paulmck@kernel.org>,
	houtao1@huawei.com
Subject: Re: [PATCH bpf-next 03/10] bpf: Support bpf_dynptr-typed map key for
 bpf syscall
Message-ID: <202209180234.jN58ZaBL-lkp@intel.com>
References: <20220917153125.2001645-4-houtao@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917153125.2001645-4-houtao@huaweicloud.com>

Hi Hou,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/Add-support-for-qp-trie-map/20220917-231450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: arm-randconfig-r016-20220917 (https://download.01.org/0day-ci/archive/20220918/202209180234.jN58ZaBL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/1995ae6874ef9089b4eee12c00ba9c5af264b8bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/Add-support-for-qp-trie-map/20220917-231450
        git checkout 1995ae6874ef9089b4eee12c00ba9c5af264b8bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __get_user_bad
   >>> referenced by syscall.c:1368 (kernel/bpf/syscall.c:1368)
   >>>               bpf/syscall.o:(bpf_copy_to_dynptr_ukey) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
