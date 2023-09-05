Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8A375;
	Tue,  5 Sep 2023 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693875007; x=1725411007;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4VtcMEkbZ9aQnj+tKP/+4JpgwolQ39AxmYETeZqdGgc=;
  b=jNj0pf6I5h9Nz+/DJ0AmXrUaTmjV6am751TNbFtrCGh3yRUfo/plilo/
   1A5Ll44tcriJwEb8JuCivksPZfbzZF18djaoo6jNnPh5hdd2LZqJpfFnL
   K/pVj/fOmcQMRPTubOsTX1wl54RwaXKIgCH7v/Im6dyQC3Q1UvzyHjUJg
   7O51bI2+8nxNp2IbsUQctnZvSEy6y5LVsgKhqrREUrbWiU44YDIVHSEVT
   g9XP6OrG/tupttl1lpYL9INWjslv6PyVlL2IdkfwC3FAtdAOU1IJ5/5KT
   fu/L9Zown4/TQM8lQJqVvBA+q+TGHmugla2JmKVogFAE3qECzCObrBDHy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379385646"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="379385646"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 17:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987618099"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="987618099"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Sep 2023 17:50:05 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdKGZ-00012J-0X;
	Tue, 05 Sep 2023 00:50:03 +0000
Date: Tue, 5 Sep 2023 08:47:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to
 next function raspberrypi_pwm_probe()
Message-ID: <202309050808.lYfMGbcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f86ed6ec0b390c033eae7f9c487a3fea268e027
commit: 3cd8cc98d63492f6f69edd4486c9bd1fe29f91c3 platform/x86: Drop the PMC_ATOM Kconfig option
date:   1 year, 3 months ago
config: x86_64-buildonly-randconfig-001-20230905 (https://download.01.org/0day-ci/archive/20230905/202309050808.lYfMGbcj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050808.lYfMGbcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050808.lYfMGbcj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0xf: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: fault_in_readable+0xd4: call to __tsan_volatile_write1() with UACCESS enabled
>> vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to next function raspberrypi_pwm_probe()
   vmlinux.o: warning: objtool: fixup_bad_iret+0x2d: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest+0x19: return with modified stack frame
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xd6: relocation to !ENDBR: native_write_cr4+0x4
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xe2: relocation to !ENDBR: native_write_cr4+0x4
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xf0: relocation to !ENDBR: native_write_cr4+0x5
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xfc: relocation to !ENDBR: native_write_cr4+0x5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
