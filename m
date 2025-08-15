Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E211F37D3;
	Fri, 15 Aug 2025 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755266411; cv=none; b=lhCgQ3P0AaEy05BhCMiJQ7sT+TI3yCaQw2zgUv3SFtCeuyqtkmZUFar28SSqCpAY90OlrbRsVpNOJWP8l2hzMMnk++FfSLN/uA9y/ir/ap+MAImlSMsfL+VjSR/w739QHhdybMXUrJ2CevRhySOK/QgU2uO+OsMcwZysF6Gh8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755266411; c=relaxed/simple;
	bh=LvI5XJFvMx8itZDzTZcg34YZDZmfWXqpnHQ/l0ZAdiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KdvzXR5YXqLi7/EiMNs8VDP1W2yomUnYtf/Ab2hYFCL4Gvq6OecbHXiHq4lHo4lMLP/hSFwBHtUwLbYsYEfsdsayxleRqZpg968kCfAQHKnR6bzaQL72GDUMO/ocikCHosPNxHo93/9NoAn5nE6UNezV48dMJyptaao+GZxFeW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFlqIt2i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFlqIt2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755266410; x=1786802410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvI5XJFvMx8itZDzTZcg34YZDZmfWXqpnHQ/l0ZAdiU=;
  b=iFlqIt2iq8dUrWpSqcS6KMVJS11njzJHbhJUYpoE8AlOYLlxBNDXZYKQ
   h6d2zcXSC51fu1CyVEQXxMyn39SsLvsoTKvfeiPNKSFlkVjNbd8QThvzr
   6unVZ7+nR4wNj8eh9OBk5gb5y0qeE7s2JIr04icsR/3+NuXhYdNi7dyFI
   IAjXzeAOfLeHBq6IBRHKQhc/I0Ilyng7J6iqn+v6HNMGoGnjrRjHr3KA8
   ftp47w634TPup9yjcSzvYGa4Y+DG6dHUSDk6UeSaKVDLRnJQPjOC4KMG6
   E4wKcIgtJSS7djWtjxHHKqzGF9vX5iCkspwHbghGFDeUzyGdWo8hz6oNR
   w==;
X-CSE-ConnectionGUID: 8dGXSMjeQCKufMDz1gyqfQ==
X-CSE-MsgGUID: MEW3P4z+ScqKLng3KTmaPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="56796245"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="56796245"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 07:00:09 -0700
X-CSE-ConnectionGUID: RQgg06yDRO+b5DIvlSZAyQ==
X-CSE-MsgGUID: ANbp42CRQ+SDXjzsGKcDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167833151"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 15 Aug 2025 07:00:08 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umuyT-0000X5-35;
	Fri, 15 Aug 2025 14:00:05 +0000
Date: Fri, 15 Aug 2025 15:59:11 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1320/2770]
 arch/mips/boot/dts/ralink/mt7628a.dtsi:42.21-133.5: Warning
 (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508151551.ingWk0yV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1357b2649c026b51353c84ddd32bc963e8999603
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [1320/2770] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
config: mips-omega2p_defconfig (https://download.01.org/0day-ci/archive/20250815/202508151551.ingWk0yV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4f15debe13af14e0fd668ee4861aff6dbc5283df)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151551.ingWk0yV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151551.ingWk0yV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/ralink/mt7628a.dtsi:42.21-133.5: Warning (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

vim +42 arch/mips/boot/dts/ralink/mt7628a.dtsi

9ea34af728f720 Stefan Roese       2019-05-27   3  
7d4ad2e71d175b Harvey Hunt        2017-08-21   4  / {
7d4ad2e71d175b Harvey Hunt        2017-08-21   5  	#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21   6  	#size-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21   7  	compatible = "ralink,mt7628a-soc";
7d4ad2e71d175b Harvey Hunt        2017-08-21   8  
7d4ad2e71d175b Harvey Hunt        2017-08-21   9  	cpus {
7d4ad2e71d175b Harvey Hunt        2017-08-21  10  		#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  11  		#size-cells = <0>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  12  
7d4ad2e71d175b Harvey Hunt        2017-08-21  13  		cpu@0 {
7d4ad2e71d175b Harvey Hunt        2017-08-21  14  			compatible = "mti,mips24KEc";
7d4ad2e71d175b Harvey Hunt        2017-08-21  15  			device_type = "cpu";
7d4ad2e71d175b Harvey Hunt        2017-08-21  16  			reg = <0>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  17  		};
7d4ad2e71d175b Harvey Hunt        2017-08-21  18  	};
7d4ad2e71d175b Harvey Hunt        2017-08-21  19  
7d4ad2e71d175b Harvey Hunt        2017-08-21  20  	cpuintc: interrupt-controller {
7d4ad2e71d175b Harvey Hunt        2017-08-21  21  		#address-cells = <0>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  22  		#interrupt-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  23  		interrupt-controller;
7d4ad2e71d175b Harvey Hunt        2017-08-21  24  		compatible = "mti,cpu-interrupt-controller";
7d4ad2e71d175b Harvey Hunt        2017-08-21  25  	};
7d4ad2e71d175b Harvey Hunt        2017-08-21  26  
7d4ad2e71d175b Harvey Hunt        2017-08-21  27  	palmbus@10000000 {
7d4ad2e71d175b Harvey Hunt        2017-08-21  28  		compatible = "palmbus";
7d4ad2e71d175b Harvey Hunt        2017-08-21  29  		reg = <0x10000000 0x200000>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  30  		ranges = <0x0 0x10000000 0x1FFFFF>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  31  
7d4ad2e71d175b Harvey Hunt        2017-08-21  32  		#address-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  33  		#size-cells = <1>;
7d4ad2e71d175b Harvey Hunt        2017-08-21  34  
232085d118ff46 Sergio Paracuellos 2025-02-24  35  		sysc: syscon@0 {
0e029c91a7ec02 Ezra Buehler       2025-06-24  36  			compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
380f072c57a590 Stefan Roese       2019-05-27  37  			reg = <0x0 0x60>;
232085d118ff46 Sergio Paracuellos 2025-02-24  38  			#clock-cells = <1>;
232085d118ff46 Sergio Paracuellos 2025-02-24  39  			#reset-cells = <1>;
380f072c57a590 Stefan Roese       2019-05-27  40  		};
380f072c57a590 Stefan Roese       2019-05-27  41  
380f072c57a590 Stefan Roese       2019-05-27 @42  		pinmux: pinmux@60 {

:::::: The code at line 42 was first introduced by commit
:::::: 380f072c57a590d7593050b8533d88e18b6a7daa MIPS: ralink: mt7628a.dtsi: Add pinmux DT node

:::::: TO: Stefan Roese <sr@denx.de>
:::::: CC: Paul Burton <paul.burton@mips.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
