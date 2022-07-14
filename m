Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1543D79
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657810224; x=1689346224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AFviMl5dG1i9/GDCv8X4CQEyWnU/+NMHizw8PhBrUmU=;
  b=QVznmlevTOPJX9o/zhwjfgXJ0Nq9/5u9qKM5f+fixKnC99N3zumna2jr
   MYNcKzh6fcxGrvkxG90b+v7s3wT4iWjc+Bbh0oJP+PG491eorspPB1fIb
   LOY9jgCLvMcDdd08N+cGPmESVysBRfX9bB5K2UMTD5ygtKLwBXqkhfbGY
   PkDjMJmac32olHu1vosanxbhBFlNTEGu1DiszaKZ9hVv86wP/touGIq2q
   PiW6+7avVsbW5JCzpAoNHSqxZmhy+NSKDXD4EJL8I/vo8QpyMoO5j5Mbz
   00uZjS0BJIqeDJyP8i1mrqzwqseeUwpf6RnRdUMBMKYKL9j8Y1vHOnfoZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="371844575"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="371844575"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 07:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="593393570"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Jul 2022 07:50:22 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC0AX-0000lB-Om;
	Thu, 14 Jul 2022 14:50:21 +0000
Date: Thu, 14 Jul 2022 22:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next v6 12/23] HID: initial BPF implementation
Message-ID: <202207142225.7Lu43LAS-lkp@intel.com>
References: <20220712145850.599666-13-benjamin.tissoires@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712145850.599666-13-benjamin.tissoires@redhat.com>

Hi Benjamin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20220712-230852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: hexagon-randconfig-r016-20220714 (https://download.01.org/0day-ci/archive/20220714/202207142225.7Lu43LAS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/57eb5074a35029f30cc13ed3a526b3342b169788
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20220712-230852
        git checkout 57eb5074a35029f30cc13ed3a526b3342b169788
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hid/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hid/bpf/hid_bpf_dispatch.c:191:12: warning: no previous prototype for function 'hid_bpf_init' [-Wmissing-prototypes]
   int __init hid_bpf_init(void)
              ^
   drivers/hid/bpf/hid_bpf_dispatch.c:191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init hid_bpf_init(void)
   ^
   static 
>> drivers/hid/bpf/hid_bpf_dispatch.c:224:13: warning: no previous prototype for function 'hid_bpf_exit' [-Wmissing-prototypes]
   void __exit hid_bpf_exit(void)
               ^
   drivers/hid/bpf/hid_bpf_dispatch.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit hid_bpf_exit(void)
   ^
   static 
   2 warnings generated.
--
>> drivers/hid/bpf/hid_bpf_jmp_table.c:100:21: warning: no previous prototype for function '__hid_bpf_tail_call' [-Wmissing-prototypes]
   __weak noinline int __hid_bpf_tail_call(struct hid_bpf_ctx *ctx)
                       ^
   drivers/hid/bpf/hid_bpf_jmp_table.c:100:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak noinline int __hid_bpf_tail_call(struct hid_bpf_ctx *ctx)
                   ^
                   static 
   1 warning generated.


vim +/hid_bpf_init +191 drivers/hid/bpf/hid_bpf_dispatch.c

   190	
 > 191	int __init hid_bpf_init(void)
   192	{
   193		int err;
   194	
   195		/* Note: if we exit with an error any time here, we would entirely break HID, which
   196		 * is probably not something we want. So we log an error and return success.
   197		 *
   198		 * This is not a big deal: the syscall allowing to attach a BPF program to a HID device
   199		 * will not be available, so nobody will be able to use the functionality.
   200		 */
   201	
   202		err = register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &hid_bpf_kfunc_set);
   203		if (err) {
   204			pr_warn("error while setting HID BPF tracing kfuncs: %d", err);
   205			return 0;
   206		}
   207	
   208		err = hid_bpf_preload_skel();
   209		if (err) {
   210			pr_warn("error while preloading HID BPF dispatcher: %d", err);
   211			return 0;
   212		}
   213	
   214		/* register syscalls after we are sure we can load our preloaded bpf program */
   215		err = register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &hid_bpf_syscall_kfunc_set);
   216		if (err) {
   217			pr_warn("error while setting HID BPF syscall kfuncs: %d", err);
   218			return 0;
   219		}
   220	
   221		return 0;
   222	}
   223	
 > 224	void __exit hid_bpf_exit(void)
   225	{
   226		/* HID depends on us, so if we hit that code, we are guaranteed that hid
   227		 * has been removed and thus we do not need to clear the HID devices
   228		 */
   229		hid_bpf_free_links_and_skel();
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
