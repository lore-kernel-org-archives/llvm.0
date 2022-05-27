Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34462185D
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653655377; x=1685191377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBf+BVce7/Id2br5aNIEC3LrdxmWWWm7Yn0rzxyk54w=;
  b=el7ef7oU06lC7gezMyDHZsSCOcQvXZY/r+QCYvSCpFTX6BvTXtspqH92
   GHXU7xLkeEKTtNyoBvlOh3TO07f4HFvUHdXVGEVt2W1dvAEaOkzIVLdv+
   I+gpBnld3pylSn2GBedRhXka08rNVXIpT/4sy5mc9xZKAlpCteKTX36a/
   Jszq5t//y/G3gipc8ChPmXfoJrmiASonzgBBzb0GcsZgLHtJii7yaVZan
   oEtaRWpuBEqZ7WZJdUnMpvxRbKiMgCpDhBnJHoHbQCiyUEMS8v5KVDV50
   s9T3QizIs9l7QmA/9Gc7CNi5M/mizYq/zz3d5/+jvo3O7Ulxa3CkZx4wZ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="272042476"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="272042476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 05:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="528104020"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 May 2022 05:42:53 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuZIq-0004kQ-TI;
	Fri, 27 May 2022 12:42:52 +0000
Date: Fri, 27 May 2022 20:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	linux-doc@vger.kernel.org
Subject: drivers/hid/hid-uclogic-params.c:48: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202205272033.XFYlYj8k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e284070abe53d448517b80493863595af4ab5f0
commit: a228809fa6f39c3fa46ac6b929024686750f7a09 HID: uclogic: Move param printing to a function
date:   2 weeks ago
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220527/202205272033.XFYlYj8k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a228809fa6f39c3fa46ac6b929024686750f7a09
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a228809fa6f39c3fa46ac6b929024686750f7a09
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-uclogic-params.c:48: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
   drivers/hid/hid-uclogic-params.c:80: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dump tablet interface frame parameters with hid_dbg(), indented with two
   drivers/hid/hid-uclogic-params.c:105: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Dump tablet interface parameters with hid_dbg().


vim +48 drivers/hid/hid-uclogic-params.c

    46	
    47	/**
  > 48	 * Dump tablet interface pen parameters with hid_dbg(), indented with one tab.
    49	 *
    50	 * @hdev:	The HID device the pen parameters describe.
    51	 * @pen:	The pen parameters to dump.
    52	 */
    53	static void uclogic_params_pen_hid_dbg(const struct hid_device *hdev,
    54						const struct uclogic_params_pen *pen)
    55	{
    56		size_t i;
    57	
    58		hid_dbg(hdev, "\t.usage_invalid = %s\n",
    59			(pen->usage_invalid ? "true" : "false"));
    60		hid_dbg(hdev, "\t.desc_ptr = %p\n", pen->desc_ptr);
    61		hid_dbg(hdev, "\t.desc_size = %u\n", pen->desc_size);
    62		hid_dbg(hdev, "\t.id = %u\n", pen->id);
    63		hid_dbg(hdev, "\t.subreport_list = {\n");
    64		for (i = 0; i < ARRAY_SIZE(pen->subreport_list); i++) {
    65			hid_dbg(hdev, "\t\t{0x%02hhx, %hhu}%s\n",
    66				pen->subreport_list[i].value,
    67				pen->subreport_list[i].id,
    68				i < (ARRAY_SIZE(pen->subreport_list) - 1) ? "," : "");
    69		}
    70		hid_dbg(hdev, "\t}\n");
    71		hid_dbg(hdev, "\t.inrange = %s\n",
    72			uclogic_params_pen_inrange_to_str(pen->inrange));
    73		hid_dbg(hdev, "\t.fragmented_hires = %s\n",
    74			(pen->fragmented_hires ? "true" : "false"));
    75		hid_dbg(hdev, "\t.tilt_y_flipped = %s\n",
    76			(pen->tilt_y_flipped ? "true" : "false"));
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
