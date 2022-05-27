Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DFE1851
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 07:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653636926; x=1685172926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6v2EmsRePZ1dhjddWsHy3e8Q/iX3QjOW2uXTXpcHfg8=;
  b=QLinUE/kOxMReUpfeNflN567DJQem2MMXH8MXRRbxilZOI/ih9Mj7Bbh
   +jhMmV+f8ELSy9gr39zpRwvCseiR3IFjrbdMaAkQ4Lw0gDF0aLDTvlZJz
   1IsDiY9ozR49Xd2JjFsZDl15lZnQMeb89sikXvSTVaAPkbn/irlLXJQe3
   NVynPRQUMmygPx3GvzZ7acCaHe9cX9r6N1JfQRICVQBmagDn/buN5EVOE
   bQW3DPrZilTJ1ASD1f/0Hzt+L4P6LrTAkxVK0Xni+zv/lb0da+rnPY3lq
   YYHnH1bwKIWm6egWwwR1/K8k/IUSCoPc/hdb/Gzll4Uh0AOSr1gnhwH5y
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="254904369"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="254904369"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 00:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="550032971"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 May 2022 00:35:19 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuUVC-0004WV-Gl;
	Fri, 27 May 2022 07:35:18 +0000
Date: Fri, 27 May 2022 15:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	davem@davemloft.net, kuba@kernel.org, edumazet@google.com,
	pabeni@redhat.com, pablo@netfilter.org, fw@strlen.de,
	netfilter-devel@vger.kernel.org, lorenzo.bianconi@redhat.com,
	brouer@redhat.com, toke@redhat.com, memxor@gmail.com, yhs@fb.com
Subject: Re: [PATCH v4 bpf-next 06/14] bpf: Whitelist some fields in nf_conn
 for BPF_WRITE
Message-ID: <202205271522.W0HxUVz1-lkp@intel.com>
References: <2954ab26de09afeecf3a56ba93624f9629072102.1653600578.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2954ab26de09afeecf3a56ba93624f9629072102.1653600578.git.lorenzo@kernel.org>

Hi Lorenzo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/net-netfilter-add-kfunc-helper-to-update-ct-timeout/20220527-053913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220527/202205271522.W0HxUVz1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c346565af9b023d9231ca8fca2e1b8c66a782f84
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lorenzo-Bianconi/net-netfilter-add-kfunc-helper-to-update-ct-timeout/20220527-053913
        git checkout c346565af9b023d9231ca8fca2e1b8c66a782f84
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/core/filter.c:10479:9: error: call to undeclared function 'btf_struct_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return btf_struct_access(log, btf, t, off, size, atype, next_btf_id, flag);
                  ^
   1 error generated.


vim +/btf_struct_access +10479 net/core/filter.c

 10459	
 10460	static int xdp_tc_btf_struct_access(struct bpf_verifier_log *log,
 10461					    const struct btf *btf,
 10462					    const struct btf_type *t, int off, int size,
 10463					    enum bpf_access_type atype,
 10464					    u32 *next_btf_id, enum bpf_type_flag *flag)
 10465	{
 10466		int ret;
 10467	
 10468		if (atype == BPF_READ || !READ_ONCE(nf_conn_btf_struct_access))
 10469			goto end;
 10470		mutex_lock(&nf_conn_btf_struct_access_mtx);
 10471		if (!nf_conn_btf_struct_access)
 10472			goto end_unlock;
 10473		ret = nf_conn_btf_struct_access(log, btf, t, off, size, atype, next_btf_id, flag);
 10474		mutex_unlock(&nf_conn_btf_struct_access_mtx);
 10475		return ret;
 10476	end_unlock:
 10477		mutex_unlock(&nf_conn_btf_struct_access_mtx);
 10478	end:
 10479		return btf_struct_access(log, btf, t, off, size, atype, next_btf_id, flag);
 10480	}
 10481	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
