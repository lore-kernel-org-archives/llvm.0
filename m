Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACDCDDD5;
	Mon, 29 Jan 2024 01:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706493360; cv=none; b=bdIjO7JvmsvM9jQlr6yRlp3jzWMobjTAOsV77BVLuU4K1DhNjAeTPjbtGY8SfwY0vWSuLth4XHi//fxgagbU9jfJJz5opLgzwtZYpZhh6QAI13zzT5DAJrwg0m+cs7+Z8ntHyJahf9ElPQDvHTBf8Wl8IcTZ81QXcAhavbxyyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706493360; c=relaxed/simple;
	bh=WgCDzX+wD8z5u/9dZgZuUVQQ7305VLG1YscOuuPMeiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtWf/x84YXDeTY3pjBqKLvm33RjI7fQdhr+Jxe/YbGvHygDzRshzFngImazE+Z15wRRo98SrjhNI38QsvZEnsBlxWOSbzwghiS6heaLA7x1W89lhTWGFha6ZtqDtwvcEwd4eQVcNedyT6nde0FtErnI6hQjV1abEXBCMJW1oLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giROpL8+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giROpL8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706493359; x=1738029359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WgCDzX+wD8z5u/9dZgZuUVQQ7305VLG1YscOuuPMeiM=;
  b=giROpL8+piM5DGutiaxXyIJ1WCt9d03KhKjD2+krpno9blKaXt/MKms2
   A9zchm0Z0clnaelY4NAc+/+8sdevAFUx4ulr7BOcUPaO48jcye2DvloeO
   2kPGXiSA/BF/VXy9XEbacznECrgr2ZJsSaUIUHWy8xNW3myex9HiL9HIG
   s15uXJEwQjyj1y2tJOtCDjr/CwrbavoSP+YPeqsD9HfE7yR+MVrTY3BSJ
   uxYeWUnD4VgViYpGsIAvTl5iA+4TlmnXjS0+gUHTnQ0NNI3zy64CTXPDO
   +4xlsKyLJWXBg6PfJp2Wa8ajPMz2tpzDgnsBk7hYxWjMX3UEwIlEV2T0W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10215288"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="10215288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 17:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="29361276"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2024 17:55:55 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUGsK-0003wm-2p;
	Mon, 29 Jan 2024 01:55:52 +0000
Date: Mon, 29 Jan 2024 09:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v2 12/15] WARNING: modpost: vmlinux: section
 mismatch in reference: cmdline_find_option_bool+0x6 (section: .pi.text) ->
 __cmdline_find_option_bool (section: .text)
Message-ID: <202401290921.rFQUPRQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v2
head:   b8b16573b6d0090db2f530fb9c5f049650806e61
commit: b6f5d2d6689a9c0874044526a4eb0ac83c0383e6 [12/15] x86/sev: Make all code reachable from 1:1 mapping __pitext
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20240129/202401290921.rFQUPRQt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290921.rFQUPRQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290921.rFQUPRQt-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x6 (section: .pi.text) -> __cmdline_find_option_bool (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __cmdline_find_option+0x40 (section: .pi.text) -> myisspace (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __cmdline_find_option+0x7a (section: .pi.text) -> myisspace (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: __cmdline_find_option+0xad (section: .pi.text) -> myisspace (section: .text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
