Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB3A94C;
	Fri, 23 Aug 2024 01:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724375413; cv=none; b=DL80jmrJRLB8nNfqdrdrQim1oQHh6E2I/q5ERXk03Xd2WOgg9mzHlfi2T0KbAZkAUjBL6qriLvOmKuxSch79VLQBevwPcmwx8U5qSaNQ2Eyhn23POe0/JtnF/1++mxlSIoaAOknXnaNE23l0kC+snI4Z2T4n+Zf5T7m2JZ0gqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724375413; c=relaxed/simple;
	bh=5uNZdL/Vj9c0+R1KpqNH8Y6sE76Op35G6R61ePmPr7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbJjvyK5VgZFZ2PY18892nJibKy7K82v9QIOtd2UfcSKp1M4hhLNTHsHdP0IUulNDsYULhtprnmc1Z5VPuQwKlp0jUs3JAFtE4nJyyxD8OhgEcaVPJgC/yK41kTd7U6DrDadWEnBsmySVrkhe0gIYTdiDkMzV2VokdvCsvidmMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q800tACM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q800tACM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724375412; x=1755911412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5uNZdL/Vj9c0+R1KpqNH8Y6sE76Op35G6R61ePmPr7o=;
  b=Q800tACMKTkfS1B7T4EhDOmlMTkNI8SwlDCGbgj5dfLIFK7jdNnmsISB
   kkRgKzhywix+58nnUiZrbDVuIgDcUysX5HINlebvAL+7cFM+u/44WU7fW
   /8X/PfH6evKadAyhvY35nlGMhF2z53xGfC0iy5aeJ6EY6pKJ3YDf2eFgh
   c/TwbnJirXm5Dgv7UpPL4e7I0tIcyAthFQ0zUwtOHCVhEGBkT4pNji13T
   vld2PYd8cPbsx+c+xFC0K+jWGAjy043TKINPSOQXt3WX7PdzgIt1GtCMi
   ltd/EIxSn4LpSrVDhVBoOiM6vxVkV0CbEC+0fM681YaPEqqZt2VVOEmvP
   w==;
X-CSE-ConnectionGUID: sDKbB2f/TLeFmMBt2sy3zQ==
X-CSE-MsgGUID: iH59+oS2Sm2NB2hkZYLTpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26623677"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="26623677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 18:10:11 -0700
X-CSE-ConnectionGUID: hDNqwBfYSt2gjpMDqaPAew==
X-CSE-MsgGUID: 6NMxOSNoRwq1dg/egsXZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="92421353"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Aug 2024 18:10:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shIoZ-000DMS-33;
	Fri, 23 Aug 2024 01:10:07 +0000
Date: Fri, 23 Aug 2024 09:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] fs: jbd2: try to launch cp transaction when bh
 refer cma
Message-ID: <202408230826.sUah3sIf-lkp@intel.com>
References: <20240820072609.570513-1-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820072609.570513-1-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on jack-fs/for_next linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/fs-jbd2-try-to-launch-cp-transaction-when-bh-refer-cma/20240820-152853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20240820072609.570513-1-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH 1/1] fs: jbd2: try to launch cp transaction when bh refer cma
config: i386-buildonly-randconfig-005-20240823 (https://download.01.org/0day-ci/archive/20240823/202408230826.sUah3sIf-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230826.sUah3sIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230826.sUah3sIf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
>> ERROR: modpost: "get_pfnblock_flags_mask" [fs/jbd2/jbd2.ko] undefined!
ERROR: modpost: "usb_control_msg" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_disable_autosuspend" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_alloc_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_anchor_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_submit_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_unanchor_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_free_urb" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_kill_anchored_urbs" [drivers/bluetooth/btmtk.ko] undefined!
ERROR: modpost: "usb_set_interface" [drivers/bluetooth/btmtk.ko] undefined!
WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
