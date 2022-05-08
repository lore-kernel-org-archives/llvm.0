Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8774D7E
	for <llvm@lists.linux.dev>; Sun,  8 May 2022 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652035193; x=1683571193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ku5z9ZOYUJh+GqggbRmp5uymILKAy+CEwjEQNBeO+Ps=;
  b=XUJx8lHMyqA2k5b7Qrsnz6HO/Zq22aZFKqN4JMq5oFOXu2oykx4mPQRz
   +0TXGNFMnSk1Ey4hm895eH9b52Evs5QCaq7eDougnAkMAIo+hToLAB9U7
   dRPqgsLYDHVZrQFEIP8vUFyM09r46y+0CBEYmpx7976oXnxvSNAac+y/r
   cevDd9Fm8a23AFgGsRhoqzNEoRk4BWBnVDkc4x6XTiYh5m/yu6PGXir4N
   OIlq0LUspBbnEWbqtV2TFph/COos81pnvnp6AP8RYmH8kFXqMiXZ1Clry
   Pr7CiRNgI7xLPziXCKQjFmE30yu5RbN4cbJWKNIOByjw3VDeXcbx3e+i5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="267710172"
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="267710172"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 11:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="601650575"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 May 2022 11:39:48 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nnloq-000Fic-7M;
	Sun, 08 May 2022 18:39:48 +0000
Date: Mon, 9 May 2022 02:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	jikos@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	benjamin.tissoires@redhat.com, spbnick@gmail.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stefanberzl@gmail.com, albertofanjul@gmail.com,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH for-5.19/uclogic 1/7] HID: uclogic: Move param printing
 to a function
Message-ID: <202205090241.d7Xmt8GT-lkp@intel.com>
References: <20220508160146.13004-2-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220508160146.13004-2-jose.exposito89@gmail.com>

Hi "José,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hid/for-next]
[cannot apply to v5.18-rc5 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Exp-sito/DIGImend-patches-part-VI/20220509-000510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
config: x86_64-randconfig-a003-20220509 (https://download.01.org/0day-ci/archive/20220509/202205090241.d7Xmt8GT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c0671e4ce0687136ff71aa65539cd3a2798d99d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jos-Exp-sito/DIGImend-patches-part-VI/20220509-000510
        git checkout 4c0671e4ce0687136ff71aa65539cd3a2798d99d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag as appropriate
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
