Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C1A7B
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657466839; x=1689002839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGAGaSfXQm2SL/iTSZF/suXuHJIMeoRg4o5Kzyy1gkU=;
  b=W1KWyYTQiiDpyaep3ferpTUGnJXAq1ohc/uZBnASc0ZT8NIFjl7YuPVi
   edXpijXkBBbMiQ64hKdgV6H2z4pEDA9HqcwVMwn6dkv/61P1kMfEHyzYD
   eaEjX/nKCZ3X8T5JkWuRziPj9mNxoMUweJ/TvIqOSeCg//C41GJt2YxKm
   1AAb312245AozU+nTahpqDFBDqHPa6Dovt5bOOAI1AZbWU0y+xF5j4Ol4
   8qsVG6nkaL30fm61KtoiPchT8TpbBg3SNVMVAJ24MW+jnfAzyHq0htc6/
   jCFPONQLVFxyxBqqRCeb4fQDyAuwZRYIPZ3CUXXRKkZvK3auTZMWS9OBc
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="346206471"
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="346206471"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 08:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="921516363"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2022 08:27:16 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAYq4-000PxY-3F;
	Sun, 10 Jul 2022 15:27:16 +0000
Date: Sun, 10 Jul 2022 23:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>
Subject: [linux-next:master 5835/8914] kernel/bpf/bpf_lsm.c:51:26: warning:
 variable 'args' set but not used
Message-ID: <202207102321.jwphabAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: 69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e [5835/8914] bpf: per-cgroup lsm flavor
config: arm-buildonly-randconfig-r003-20220710 (https://download.01.org/0day-ci/archive/20220710/202207102321.jwphabAL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 69fd337a975c7e690dfe49d9cb4fe5ba1e6db44e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_lsm.c:51:26: warning: variable 'args' set but not used [-Wunused-but-set-variable]
           const struct btf_param *args;
                                   ^
   1 warning generated.


vim +/args +51 kernel/bpf/bpf_lsm.c

    47	
    48	void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog,
    49				     bpf_func_t *bpf_func)
    50	{
  > 51		const struct btf_param *args;
    52	
    53		if (btf_type_vlen(prog->aux->attach_func_proto) < 1 ||
    54		    btf_id_set_contains(&bpf_lsm_current_hooks,
    55					prog->aux->attach_btf_id)) {
    56			*bpf_func = __cgroup_bpf_run_lsm_current;
    57			return;
    58		}
    59	
    60		args = btf_params(prog->aux->attach_func_proto);
    61	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
