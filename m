Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAA23A5;
	Thu, 23 Feb 2023 10:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677146779; x=1708682779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G1eyd6plZRhl7C9gSgBC4jqgdrPdoVIj9daKdi61y44=;
  b=K0GzUO/wkta5bZWvQbCnZBnXv55nAfZXWo6o8AWbxtW52d9OtUt0OlqF
   o2GhnqQ3uKNW6ooANUC/tmgDfx2/O8PN1ZTXQuMKtyFXMjvbVk0Ajob6I
   h94yYCgObGIUXT8rbZmnTjEJnd52iB3PddaWus3XqVVw1SjUTnrpKfuDt
   ag5C0R49f4dOHUDBXJsf7gWbIid+OXxBICSKv2sU4NM+nvT51oSv7Czie
   7kWETxq7ZoaNNew9K9mRWL37q9I5HRFofDpKpsBQcEA7nZ6s+mpn5VeoK
   ukdbGNafuOoKez6tGpam1roh7hrGpGLRrbi+uKAEPwZ1NoWwqEcUZe7Go
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312797171"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312797171"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 02:05:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="736302469"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="736302469"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2023 02:05:56 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV8U7-0001Ev-1P;
	Thu, 23 Feb 2023 10:05:55 +0000
Date: Thu, 23 Feb 2023 18:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeremy Kerr <jk@ozlabs.org>,
	Maximilian Luz <luzmaximilian@gmail.com>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH] efivarfs: fix NULL-deref on mount when no efivars
Message-ID: <202302231733.iymwHTPf-lkp@intel.com>
References: <20230126112129.4602-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126112129.4602-1-johan+linaro@kernel.org>

Hi Johan,

I love your patch! Yet something to improve:

[auto build test ERROR on v6.2-rc5]
[also build test ERROR on linus/master]
[cannot apply to efi/next next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/efivarfs-fix-NULL-deref-on-mount-when-no-efivars/20230128-094525
patch link:    https://lore.kernel.org/r/20230126112129.4602-1-johan%2Blinaro%40kernel.org
patch subject: [PATCH] efivarfs: fix NULL-deref on mount when no efivars
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230223/202302231733.iymwHTPf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/da57163cc9d947884520240ec71c2806f48b8a64
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johan-Hovold/efivarfs-fix-NULL-deref-on-mount-when-no-efivars/20230128-094525
        git checkout da57163cc9d947884520240ec71c2806f48b8a64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231733.iymwHTPf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/efivarfs/super.c:246:7: error: implicit declaration of function 'efivar_is_available' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (!efivar_is_available())
                ^
   fs/efivarfs/super.c:246:7: note: did you mean 'slab_is_available'?
   include/linux/slab.h:171:6: note: 'slab_is_available' declared here
   bool slab_is_available(void);
        ^
   1 error generated.


vim +/efivar_is_available +246 fs/efivarfs/super.c

   241	
   242	static void efivarfs_kill_sb(struct super_block *sb)
   243	{
   244		kill_litter_super(sb);
   245	
 > 246		if (!efivar_is_available())
   247			return;
   248	
   249		/* Remove all entries and destroy */
   250		efivar_entry_iter(efivarfs_destroy, &efivarfs_list, NULL);
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
