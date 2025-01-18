Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3389A92F;
	Sat, 18 Jan 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737220905; cv=none; b=nUYltHQZ0EtD8JIqbGzB6xqyDWV4fEY/lD6bNP1+Wh4JtXBShClnMpRpU3wsougVRvgByvms1l/fHkYocQ2fu7LUZTJ9it0FRoxcnc2hHGCwGJbJ1Yit9cYmRqAnx0krsDLUOMNQDc8+riZF56li/KqDsR+/yGXeqA/7Rv9DlzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737220905; c=relaxed/simple;
	bh=a4yM/PY0OuNyP3PRXl+DwXG6/veP4fV1RfilhGc4J8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lISYE8B/0gi4XVMRw9pxfuIS2ldUKkHl0nR/i6AvbO85NMro2HEf1Ex0WcviGnakvrWaUfy0bJQ7P7/ecOBLNJCyUHZDdKwiU0OrOzJkQI6Zmb7hsF9LzRJt8sYsFqE25rwGdQU0FJDt6ETDRh7CW61+kJEUnM1/PB95cDQqxdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJlxdP6t; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJlxdP6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737220903; x=1768756903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4yM/PY0OuNyP3PRXl+DwXG6/veP4fV1RfilhGc4J8Y=;
  b=DJlxdP6thZWXo0BbATWV9SjiJVMebaR+Ek3fW7ZVn2Y0eGFQb2EbaFrG
   O3bmVNxcJU7vman8pRblP2NwsRNBYpdMQwCgMt9eKx0i8jgRhGCDdSf8T
   37lMHO7EPTh2mC9b7l3JtEoZqM1eHWBYO0UHoTUv5P2hcMv6DpCyPjTI7
   oA3EsJjBlWSaW4Lq6fxkuEgqC1LDTIHhusPuAH85fZ22tjcgU+wviIUgx
   i2+iQY//XfvJm3pIJbtwS95zuUxUmXLYrx+uYurJXWWb1knnGtyAYlgfB
   5/HgrlMY28CXEtRmSZV4IOOFS0nTJsqEBPydx7ZBJbyqZeAeM11nYwFJA
   g==;
X-CSE-ConnectionGUID: axbZr4mpQOqkLbFnC7T2LQ==
X-CSE-MsgGUID: Ng7iIkf5QXqVR9B+nh6jOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37875579"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37875579"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 09:21:42 -0800
X-CSE-ConnectionGUID: Jsn7BgJ5TAeO1M0zQGPZmQ==
X-CSE-MsgGUID: T7NoFOTbRomN85qiBvmH3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105931787"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jan 2025 09:21:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZCVu-000Uf9-2z;
	Sat, 18 Jan 2025 17:21:38 +0000
Date: Sun, 19 Jan 2025 01:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/for-next 21/22] kernel/trace/trace_events.c:860:5:
 warning: 'CONFIG_MODULES' is not defined, evaluates to 0
Message-ID: <202501190121.E2CIJuUj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   542079b4b12e89f82c8a689b6e9b119ab7d52018
commit: b355247df104ef6644288884afd2c08b7bf49897 [21/22] tracing: Cache ":mod:" events for modules not loaded yet
config: i386-buildonly-randconfig-005-20250118 (https://download.01.org/0day-ci/archive/20250119/202501190121.E2CIJuUj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190121.E2CIJuUj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190121.E2CIJuUj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:860:5: warning: 'CONFIG_MODULES' is not defined, evaluates to 0 [-Wundef]
     860 | #if CONFIG_MODULES
         |     ^
   1 warning generated.


vim +/CONFIG_MODULES +860 kernel/trace/trace_events.c

   859	
 > 860	#if CONFIG_MODULES
   861	struct event_mod_load {
   862		struct list_head	list;
   863		char			*module;
   864		char			*match;
   865		char			*system;
   866		char			*event;
   867	};
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
