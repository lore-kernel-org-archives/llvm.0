Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971D8C0F;
	Sat, 12 Aug 2023 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691832851; x=1723368851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Miwj/S4yFvABO0rpgtOz7gtFIXVICX6zNXzgRsx24h8=;
  b=XtO7udSTLPaZ6YRKTmx1H3x3PT7ZOSDPy3PqeK15glvZcL6suVNboKDz
   oH4I88jmdSSuDmYUd5UluDXUXuKrOnFeU3DPYgp3hjXFzLY9k8BrfpmaX
   8oMY0Unq/w1NMavQWHs62axBdN9Sv7bpXHxXbHMoKDrEoe27dBHSQlwmW
   ElTRHSTR9V3zlyZebtJXEtmP5QbP7PaMvkfAcPrvIlO8leqXfrW2FHTTl
   3tus6GwFWFBXcAFmSW4DXZiWT6fOhP2JxvFIZH19ycDfVJdbHmK01MXkr
   sCxvSX/3mhlisz1qxLcxJBE4BVDKVKOJvHZIbPmwnpYfqcqPsGxVkPAk6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371822553"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="371822553"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 02:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="736003181"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="736003181"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2023 02:34:09 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUl0a-0008Ru-1E;
	Sat, 12 Aug 2023 09:34:08 +0000
Date: Sat, 12 Aug 2023 17:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 05/10] fs: Add DCACHE_CASEFOLDED_NAME flag
Message-ID: <202308121727.Nz2wb72n-lkp@intel.com>
References: <20230812004146.30980-6-krisman@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812004146.30980-6-krisman@suse.de>

Hi Gabriel,

kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master]
[cannot apply to tyhicks-ecryptfs/next ericvh-v9fs/for-next viro-vfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Krisman-Bertazi/fs-Expose-helper-to-check-if-a-directory-needs-casefolding/20230812-084506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230812004146.30980-6-krisman%40suse.de
patch subject: [PATCH v5 05/10] fs: Add DCACHE_CASEFOLDED_NAME flag
config: arm64-randconfig-r013-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121727.Nz2wb72n-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121727.Nz2wb72n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121727.Nz2wb72n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/dcache.c:1967:15: error: use of undeclared identifier 'd_set_casefold_lookup'; did you mean 'd_set_casefolded_name'?
    1967 | EXPORT_SYMBOL(d_set_casefold_lookup);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               d_set_casefolded_name
   include/linux/export.h:86:44: note: expanded from macro 'EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                                        ^
   include/linux/export.h:83:54: note: expanded from macro '_EXPORT_SYMBOL'
      83 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^
   include/linux/export.h:74:16: note: expanded from macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^
   fs/dcache.c:1961:6: note: 'd_set_casefolded_name' declared here
    1961 | void d_set_casefolded_name(struct dentry *dentry)
         |      ^
   1 error generated.


vim +1967 fs/dcache.c

  1960	
  1961	void d_set_casefolded_name(struct dentry *dentry)
  1962	{
  1963		spin_lock(&dentry->d_lock);
  1964		dentry->d_flags |= DCACHE_CASEFOLDED_NAME;
  1965		spin_unlock(&dentry->d_lock);
  1966	}
> 1967	EXPORT_SYMBOL(d_set_casefold_lookup);
  1968	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
