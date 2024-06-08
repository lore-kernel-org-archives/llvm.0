Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576DF142E9E;
	Sat,  8 Jun 2024 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717841615; cv=none; b=CTfL6xTTWfyH0kWuqyoeH65Ka7Lt7ZACdRNsx1XcDc/XP7euTW1d5F7X0DhpxLRiANUQotJHv6c/lDNfeOidHwoQITaQUODQ/23ipm6JtiIhL+ElLUo3PhpMDThcIKvR36MD1VVHHBw+cpuHQoDggLRmtVSY1JELKvO4noz3WLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717841615; c=relaxed/simple;
	bh=R0mOfvROHxO9TTD+7rpAbMMeG9xv4d9Jn39TstlUbmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=okCSKNKvEkw0EzRVkpJ2JxkKSTMGe+VSSqzpcntn6xt9Cnt02rFh4d5P46Swfljb09XccKtf37S2/zQ83yPnGRF09U8+DW5LVMl8eqRNJFuR8KxlK7P45LC8PoOFMQ+9rYRDmzVcc6TLAniE8QLOEcOiz6iudLoc6PgQ/PKJMgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7v52Eg7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7v52Eg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717841614; x=1749377614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0mOfvROHxO9TTD+7rpAbMMeG9xv4d9Jn39TstlUbmE=;
  b=V7v52Eg7B4B3eqqAcT5TQsBzOe02fuSGPMpwHuPbClBh7THxS2f0MNxC
   490dpymm8R4lq+0SKFI4y9TzlPcC7eWHzN8eq8s3vv+irPKjRWqdwwDQi
   Ki3ZIX9+bNsGNE1M0hMzvvQlThB9QNBt39+WwOm5FCeUIeMXuDwp7n4p8
   6TO28zUiD5EKGEX6vC6kAq/y1p1yVNKNL2HDAC2I2YzaZkFpeqrYohIog
   OmnTWaQMg01X2YjeT8u/2I6XUgPGHgGX087aPc5sCbAjuRn8qoG1zjB6q
   wm9AtL7H2IUF8JDaOG40Qxmdw3VC7A5AZx5BUAEJ3qRr5PFjglbbFuT86
   g==;
X-CSE-ConnectionGUID: IwHD5eULQve9amxMazG/ig==
X-CSE-MsgGUID: tKzT5CthRpCu612gA7A6yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25980886"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25980886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 03:13:33 -0700
X-CSE-ConnectionGUID: qWgyTFH4QMKghJt1po8YWg==
X-CSE-MsgGUID: hysZj6IIQeW+0GmDGx0mfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="38571670"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2024 03:13:32 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFt4j-0001Pu-1p;
	Sat, 08 Jun 2024 10:13:29 +0000
Date: Sat, 8 Jun 2024 18:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/persistent-ring-buf-reserve-mem-v5.15 29/30]
 ERROR: modpost: "reserve_mem_find_by_name" [fs/pstore/ramoops.ko] undefined!
Message-ID: <202406081854.4sbZ0sAD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/persistent-ring-buf-reserve-mem-v5.15
head:   06c8dd8d86240bdfbab979b2a24e357380c2d742
commit: f783be663f11420cd5ea6073ed031a57015a7df4 [29/30] pstore/ramoops: Add ramoops.mem_name= command line option
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240608/202406081854.4sbZ0sAD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081854.4sbZ0sAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081854.4sbZ0sAD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "reserve_mem_find_by_name" [fs/pstore/ramoops.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
