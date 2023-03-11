Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB786FC4;
	Sat, 11 Mar 2023 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678578427; x=1710114427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4Gd1VHcjoQ8Wi+HbsdA9Avlt+VcH6wuNv2XVzqYwaE=;
  b=ILrm7u6l/YTzo7atevhXQx6FlWXVO4IK6i7s+vSClUvGm3ZU1g6Ql48v
   lHP/Kiphkj2HsZvSm9gM5F/WErAMV6tJG1/Gixf3o6IBkEk+2tUi+2+dC
   tKQaa1/WGVtONv8MDVt/RvbOVfSLXOy1aDMjwgEkYoGHGIW31VA0kxG46
   bZ9oKpX581+YcrhQELrY0U7rHnkgJd17X0V76zTEtdK8Q/IEt0Kc4kN+w
   hjgWMHIxk/B5J8zDXm1PtCrotdG4PvpK8xa7eShUU/dNNrTf03E5Vz0x4
   DOsptlW8SSIL25wYZ8DM2+AM+VtGJWa1DLsDIt5ErQdvpKXyuMkrEwhoa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="399545089"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="399545089"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="1007538768"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="1007538768"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2023 15:47:05 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb8vY-0004rF-27;
	Sat, 11 Mar 2023 23:47:04 +0000
Date: Sun, 12 Mar 2023 07:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230311-module-alloc-opts 14/21]
 kernel/module/main.c:2341:19: warning: variable 'mod' is uninitialized when
 used here
Message-ID: <202303120745.57Vq9kr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230311-module-alloc-opts
head:   dbbc415a573a4afd4839c25c275926056d9df1a6
commit: 028c62ebf2c4bc4b164b58b18d77e496d3bd9661 [14/21] module: add debugging alias parsing support
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230312/202303120745.57Vq9kr6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=028c62ebf2c4bc4b164b58b18d77e496d3bd9661
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230311-module-alloc-opts
        git checkout 028c62ebf2c4bc4b164b58b18d77e496d3bd9661
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/module/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120745.57Vq9kr6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/main.c:2341:19: warning: variable 'mod' is uninitialized when used here [-Wuninitialized]
           free_mod_aliases(mod);
                            ^~~
   kernel/module/main.c:2283:20: note: initialize the variable 'mod' to silence this warning
           struct module *mod;
                             ^
                              = NULL
   1 warning generated.


vim +/mod +2341 kernel/module/main.c

  2280	
  2281	static struct module *layout_and_allocate(struct load_info *info, int flags)
  2282	{
  2283		struct module *mod;
  2284		unsigned int ndx;
  2285		int err;
  2286	
  2287		err = check_modinfo(info->mod, info, flags);
  2288		if (err)
  2289			return ERR_PTR(err);
  2290	
  2291		/* Allow arches to frob section contents and sizes.  */
  2292		err = module_frob_arch_sections(info->hdr, info->sechdrs,
  2293						info->secstrings, info->mod);
  2294		if (err < 0)
  2295			goto err_out;
  2296	
  2297		err = module_enforce_rwx_sections(info->hdr, info->sechdrs,
  2298						  info->secstrings, info->mod);
  2299		if (err < 0)
  2300			goto err_out;
  2301	
  2302		/* We will do a special allocation for per-cpu sections later. */
  2303		info->sechdrs[info->index.pcpu].sh_flags &= ~(unsigned long)SHF_ALLOC;
  2304	
  2305		/*
  2306		 * Mark ro_after_init section with SHF_RO_AFTER_INIT so that
  2307		 * layout_sections() can put it in the right place.
  2308		 * Note: ro_after_init sections also have SHF_{WRITE,ALLOC} set.
  2309		 */
  2310		ndx = find_sec(info, ".data..ro_after_init");
  2311		if (ndx)
  2312			info->sechdrs[ndx].sh_flags |= SHF_RO_AFTER_INIT;
  2313		/*
  2314		 * Mark the __jump_table section as ro_after_init as well: these data
  2315		 * structures are never modified, with the exception of entries that
  2316		 * refer to code in the __init section, which are annotated as such
  2317		 * at module load time.
  2318		 */
  2319		ndx = find_sec(info, "__jump_table");
  2320		if (ndx)
  2321			info->sechdrs[ndx].sh_flags |= SHF_RO_AFTER_INIT;
  2322	
  2323		/*
  2324		 * Determine total sizes, and put offsets in sh_entsize.  For now
  2325		 * this is done generically; there doesn't appear to be any
  2326		 * special cases for the architectures.
  2327		 */
  2328		layout_sections(info->mod, info);
  2329		layout_symtab(info->mod, info);
  2330	
  2331		/* Allocate and move to the final place */
  2332		err = move_module(info->mod, info);
  2333		if (err)
  2334			goto err_out;
  2335	
  2336		/* Module has been copied to its final place now: return it. */
  2337		mod = (void *)info->sechdrs[info->index.mod].sh_addr;
  2338		kmemleak_load_module(mod, info);
  2339		return mod;
  2340	err_out:
> 2341		free_mod_aliases(mod);
  2342		return ERR_PTR(err);
  2343	}
  2344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
