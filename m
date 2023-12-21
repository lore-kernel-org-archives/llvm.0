Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B444B77F10;
	Thu, 21 Dec 2023 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSPnnEyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703198431; x=1734734431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JgFAA/yAGSTY1mMbMshFzeV9Y3dqsVr0MEJYSYsbvUE=;
  b=kSPnnEyv/lqYtcQeF406Y8u+C7u6nCRGxJC8nlFkpowu5BaJSUUzNu10
   Z5B6cqvJKEgaG3qnXXONLoyZYbTiKE7uStCddZaX/WQOfBNRawU8NmBSc
   iLxQdc84iReyl+7oMqtSX1YoAvRcuGGhL4G/ng1fxcjHbC3REXbnyjKAU
   b9e3AMFs8HjeFDS7Req3KAfMKzQKx23g2QU4eEePsSKCcNhKZDk9gc4hU
   VnT/v1d6C6I/9wrsm1DEkRlDDz8brJdW1vCYqF05Yy4i2NNEGADgfZGK0
   oq38DXMpgw8PpxPelIf52ho1D/uyebHukzlxRXQKXDo8xASPABeQBRfsF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="14728610"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="14728610"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 14:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="753080200"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="753080200"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Dec 2023 14:40:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGRiF-0008od-0p;
	Thu, 21 Dec 2023 22:40:23 +0000
Date: Fri, 22 Dec 2023 06:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 48/110] WARNING: modpost: vmlinux:
 section mismatch in reference: resctrl_init+0x2f (section: .text) ->
 rdtgroup_setup_default (section: .init.text)
Message-ID: <202312220636.jUrCgJo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: 28d32c96e36c6f16616ebeec57f639dcfbaf6c65 [48/110] x86/resctrl: Drop __init/__exit on assorted symbols
config: i386-randconfig-001-20231221 (https://download.01.org/0day-ci/archive/20231222/202312220636.jUrCgJo8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220636.jUrCgJo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220636.jUrCgJo8-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: resctrl_init+0x2f (section: .text) -> rdtgroup_setup_default (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/clocksource-wdtest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/resource_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8data.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/rational-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_string.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_dhry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cpumask_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_sort.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ref_tracker.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_kmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_bm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_fsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/list-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_linear_ranges.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bits.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cmdline_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/memcpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/is_signed_type_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/stackinit_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strcat_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/rt4831-backlight.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/platform_profile.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/custom_method.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_kunit_helpers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_device_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_pool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/mdio_devres.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/slip/slip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/ath/wcn36xx/wcn36xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt76.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt76-sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt76-connac-lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt792x-lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt7615/mt7615-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt7615/mt7663-usb-sdio-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt7615/mt7663s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/wireless/mediatek/mt76/mt7921/mt7921-common.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
