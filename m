Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519836A
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 04:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661833381; x=1693369381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d8soticUUMoqXs7bFgW/Kmk8cX0h0v8aVPHERjc5+/Q=;
  b=bXflSttB8uIsfdCWMCanKHmz/9Ga2LR0new8KOBTiT9KYGCyZJtrKkNH
   mOeEdRzKUJdopHe4SrNF6oXR1RERM2lT528p+upXnQNS0pp5bSHGHIhBN
   SBz7y0cK2SFY3yCeMUUd89xStUihhpwUmH8UVEtyLf6Ai4Or7Jxv0TlR/
   SXUQnJVF4OxkeBJd462qN5g0k5b50r6jfH4iX4aKjgfOHPyi1ajk7FlLe
   vuhIf2NWzD14HEWOo+dxAvBUOqIYhbcAGCSXBL12pNJS5uqGI48EF7Sca
   1lGormS+PjEoGOeafayPSEIwGg4558veVpmjXf+EPS9QrZgqFmQ/sak1u
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="295856218"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="295856218"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 21:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="641206469"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Aug 2022 21:22:59 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSsmB-0000Wh-05;
	Tue, 30 Aug 2022 04:22:59 +0000
Date: Tue, 30 Aug 2022 12:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/2] pci: create device tree node for selected devices
Message-ID: <202208301225.GaqbZVki-lkp@intel.com>
References: <1661809417-11370-3-git-send-email-lizhi.hou@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661809417-11370-3-git-send-email-lizhi.hou@amd.com>

Hi Lizhi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on helgaas-pci/next]
[also build test ERROR on robh/for-next linus/master v6.0-rc3 next-20220829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Hou/Generate-device-tree-node-for-pci-devices/20220830-054614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: hexagon-randconfig-r041-20220829 (https://download.01.org/0day-ci/archive/20220830/202208301225.GaqbZVki-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4c106463674a6f6de085d9a91510c385be4a620d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f78f02388fd4e94a2ce74278c2af4c983b3ed98d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lizhi-Hou/Generate-device-tree-node-for-pci-devices/20220830-054614
        git checkout f78f02388fd4e94a2ce74278c2af4c983b3ed98d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/pci/of.c:16:
>> drivers/pci/pci.h:693:1: error: expected identifier or '('
   {
   ^
   1 error generated.


vim +693 drivers/pci/pci.h

   690	
   691	static inline void
   692	of_pci_remove_node(struct pci_dev *pdev);
 > 693	{
   694	}
   695	#endif /* CONFIG_OF_DYNAMIC */
   696	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
