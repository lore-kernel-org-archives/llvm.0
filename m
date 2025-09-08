Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B686279DC0;
	Mon,  8 Sep 2025 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359721; cv=none; b=NbieiPtKGHOjOd1Fp1jqJp+9b/yuDvSjiJBWeI30d/JK0pE9N/8YgkTnmy2D5xkNCm1XRZAxbOCTF37zE3FGh7Wy/InxnciWUUorgHVmQQBn5aXwG1Fdsl79diIarzYlv/sHG+JujSSdsslFEvAz6SnseT0BV+uZ4qjyn8GnOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359721; c=relaxed/simple;
	bh=Kc1ivBx3wdmv0c+s/R8Ldc7a1tQUzs0ZvVoAwlClrVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzkEo9nN5u6v3ni+iuNsctko2fsOmlmCQ/OuoIcvpgMNPq1doHTi97kqmhMc7G7a8/6lioswufzWjAgyW03V+HIdg/oNedMUXeF78kdSDajE91xcbTBaBDVsFnhlzNLBOV6CoWMWEIx3WR+FmcZm5B3mmZqryU/3MdbyQP4no5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMOUtbaN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMOUtbaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757359720; x=1788895720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kc1ivBx3wdmv0c+s/R8Ldc7a1tQUzs0ZvVoAwlClrVM=;
  b=OMOUtbaNqHe6xMAXXM+Fn+Zgj0PFrQoHMALu/P7HplngAOdIGNxarKiQ
   PvDqiM4obXmRpOE9tUhDykjXCxkFbeDEl2IcfbgcMQGgpdiwAbwrtLtN3
   IGBcevc128XVmmLaV4RzPrtgb9g1D7RiDYvXNZ7c2lV/Zlagu/UB8JOHR
   Gfa/0qml5PTMP92KFSrf//hUCPKGYMuMn6xUKMP4wlM9XUA9cw04EiKcq
   UTqKwTr7IrtCe4pVV7FjwyhJrVeTw+82VyJkLK0woA83InRh9jLCOT2m6
   rfIixZCsGflqzvRGIINTJ7rj0Ino2elZrSqnnxgLy9hl7baIALQrb22cK
   A==;
X-CSE-ConnectionGUID: NzaUoKaaQo2Mv/k+xJ/JNw==
X-CSE-MsgGUID: D/sIGHRGTsy8aVzMoAUhnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62260140"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="62260140"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 12:28:39 -0700
X-CSE-ConnectionGUID: jdiEDUMxRp2H4jBZcO6iBw==
X-CSE-MsgGUID: e7Oi1WytQEOnmXLm/NO1yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203660826"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 12:28:38 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvhXX-000467-07;
	Mon, 08 Sep 2025 19:28:35 +0000
Date: Tue, 9 Sep 2025 03:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeongjun Park <aha310510@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jiri Kosina <jikos@kernel.org>
Subject: [linux-next:master 1042/7110] drivers/hid/hid-steelseries.c:599:1:
 warning: unused label 'srws1_remove'
Message-ID: <202509090334.76D4qGtW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e8e5822146bc396d2a7e5fbb7be13271665522a
commit: a84eeacbf9325fd7f604b80f246aaba157730cd5 [1042/7110] HID: steelseries: refactor probe() and remove()
config: um-randconfig-002-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090334.76D4qGtW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090334.76D4qGtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090334.76D4qGtW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-steelseries.c:13:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/hid/hid-steelseries.c:599:1: warning: unused label 'srws1_remove' [-Wunused-label]
     599 | srws1_remove:
         | ^~~~~~~~~~~~~
   2 warnings generated.


vim +/srws1_remove +599 drivers/hid/hid-steelseries.c

   576	
   577	static void steelseries_remove(struct hid_device *hdev)
   578	{
   579		struct steelseries_device *sd;
   580		unsigned long flags;
   581	
   582		if (hdev->product == USB_DEVICE_ID_STEELSERIES_SRWS1) {
   583	#if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
   584	    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
   585			goto srws1_remove;
   586	#endif
   587			return;
   588		}
   589	
   590		sd = hid_get_drvdata(hdev);
   591	
   592		spin_lock_irqsave(&sd->lock, flags);
   593		sd->removed = true;
   594		spin_unlock_irqrestore(&sd->lock, flags);
   595	
   596		cancel_delayed_work_sync(&sd->battery_work);
   597	
   598		hid_hw_close(hdev);
 > 599	srws1_remove:
   600		hid_hw_stop(hdev);
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
