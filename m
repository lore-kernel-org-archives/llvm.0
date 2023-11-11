Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F546FC3;
	Sat, 11 Nov 2023 06:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv7jYA47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699685285; x=1731221285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N3Rs7kXApIuac3DexWx8a5sGFF8+8QGSHfNHgz9CQWk=;
  b=mv7jYA47sDDdpxj38QnbeDTtfnFcqiwe5kfMWGgo7hFof0EkgUvS/R7A
   dr4kEjBqLiuflVCWNIDAtgU8Vu5HOlinXYwb84iv0egg72gQLE2rEALkv
   nYISgEiMJHlJLUAuywdtipDjadEwOuJ6YP4/79b4gaOIu1XuoSc+keLU2
   bDQcgERsr54sVmEMZ3BYX0C+mVpxdkjU9JZDJzzYDM0YnNqcUutOhtKD/
   cwOZXdGaBzBGSFVny8zldWhdAa/2wwemiFg/qpTRHxMP9Da05zr/xDr2J
   AY+AkBUeH1nP/4pNhZzSGRvbd49KH7edmg+4EvAFq21+11/qc28pooqEH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="8909785"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="8909785"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 22:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="829814714"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="829814714"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2023 22:47:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1hmf-000AHG-02;
	Sat, 11 Nov 2023 06:47:57 +0000
Date: Sat, 11 Nov 2023 14:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
	gregkh@linuxfoundation.org, tanmay.shah@amd.com,
	mathieu.poirier@linaro.org, nava.kishore.manne@amd.com,
	ben.levinsky@amd.com, sai.krishna.potthuri@amd.com, marex@denx.de,
	robh@kernel.org, ruanjinjie@huawei.com, arnd@arndb.de,
	shubhrajyoti.datta@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>
Subject: Re: [PATCH v4 1/5] firmware: xilinx: Update firmware call interface
 to support additional args
Message-ID: <202311111439.Hxd4wZ6x-lkp@intel.com>
References: <20231109070021.16291-2-jay.buddhabhatti@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109070021.16291-2-jay.buddhabhatti@amd.com>

Hi Jay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.6 next-20231110]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jay-Buddhabhatti/firmware-xilinx-Update-firmware-call-interface-to-support-additional-args/20231109-191827
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231109070021.16291-2-jay.buddhabhatti%40amd.com
patch subject: [PATCH v4 1/5] firmware: xilinx: Update firmware call interface to support additional args
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231111/202311111439.Hxd4wZ6x-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111439.Hxd4wZ6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111439.Hxd4wZ6x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/xilinx/zynqmp.c:139:21: warning: passing an object that undergoes default argument promotion to 'va_start' has undefined behavior [-Wvarargs]
     139 |         va_start(arg_list, num_args);
         |                            ^
   drivers/firmware/xilinx/zynqmp.c:129:57: note: parameter of type 'u8' (aka 'unsigned char') is declared here
     129 | static noinline int do_fw_call_smc(u32 *ret_payload, u8 num_args, ...)
         |                                                         ^
   drivers/firmware/xilinx/zynqmp.c:179:21: warning: passing an object that undergoes default argument promotion to 'va_start' has undefined behavior [-Wvarargs]
     179 |         va_start(arg_list, num_args);
         |                            ^
   drivers/firmware/xilinx/zynqmp.c:169:57: note: parameter of type 'u8' (aka 'unsigned char') is declared here
     169 | static noinline int do_fw_call_hvc(u32 *ret_payload, u8 num_args, ...)
         |                                                         ^
   drivers/firmware/xilinx/zynqmp.c:349:21: warning: passing an object that undergoes default argument promotion to 'va_start' has undefined behavior [-Wvarargs]
     349 |         va_start(arg_list, num_args);
         |                            ^
   drivers/firmware/xilinx/zynqmp.c:335:61: note: parameter of type 'u8' (aka 'unsigned char') is declared here
     335 | int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u8 num_args, ...)
         |                                                             ^
   3 warnings generated.


vim +/va_start +139 drivers/firmware/xilinx/zynqmp.c

   119	
   120	/**
   121	 * do_fw_call_smc() - Call system-level platform management layer (SMC)
   122	 * @num_args:		Number of variable arguments should be <= 8
   123	 * @ret_payload:	Returned value array
   124	 *
   125	 * Invoke platform management function via SMC call (no hypervisor present).
   126	 *
   127	 * Return: Returns status, either success or error+reason
   128	 */
   129	static noinline int do_fw_call_smc(u32 *ret_payload, u8 num_args, ...)
   130	{
   131		struct arm_smccc_res res;
   132		u64 args[8] = {0};
   133		va_list arg_list;
   134		u8 i;
   135	
   136		if (num_args > 8)
   137			return -EINVAL;
   138	
 > 139		va_start(arg_list, num_args);
   140	
   141		for (i = 0; i < num_args; i++)
   142			args[i] = va_arg(arg_list, u64);
   143	
   144		va_end(arg_list);
   145	
   146		arm_smccc_smc(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], &res);
   147	
   148		if (ret_payload) {
   149			ret_payload[0] = lower_32_bits(res.a0);
   150			ret_payload[1] = upper_32_bits(res.a0);
   151			ret_payload[2] = lower_32_bits(res.a1);
   152			ret_payload[3] = upper_32_bits(res.a1);
   153		}
   154	
   155		return zynqmp_pm_ret_code((enum pm_ret_status)res.a0);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
