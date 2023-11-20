Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7694438DE7;
	Mon, 20 Nov 2023 21:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZT0ejfvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700515694; x=1732051694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QOZ009XPlc8q/cW8PvOmx+Fl7NzUUd/iH64JSXsiqKo=;
  b=ZT0ejfvpjiVRNaqXxom1TezKEs2Z6YlsC00/eHDPNtWTt9VPdX/lxTHn
   qrIaHK/KdVro99+/R+tRnGyNV/efKvMQQuVess8eS1eiOrro5GuWO34fC
   mJRQXzTE3q8Lels+f00Wjabt3tk2hjRXN5Rh60bzhK098ennB2z+f5+lS
   10cEZ6WVzUxvYCsqODPMZPSUYbCaj+Lua7O3XclqjHkwO5859d67qUvP8
   wz8CZv4JwbdLrdQWvkAol4cDhpKFa5V9ISWzlRDrgK2SlgTXS06kQHU8o
   TjtMZH3Waf6iY80KkhSLb1bV6DB0nv12CBHQHOgz5yIckdyUaWhiyx8cC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4823350"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4823350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7688812"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 13:28:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BoO-0006wS-09;
	Mon, 20 Nov 2023 21:28:08 +0000
Date: Tue, 21 Nov 2023 05:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org
Subject: [rafael-pm:bleeding-edge 12/27] drivers/acpi/thermal_lib.c:46:5:
 warning: no previous prototype for function 'acpi_active_trip_temp'
Message-ID: <202311210522.8Y0cnwJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   f437a8d1debff5412e36a1c9454adee193b31950
commit: 932d2c2fd0b1e8242ba7bcb7b8c2553e663e174f [12/27] ACPI: thermal_lib: Add functions returning temperature in deci-Kelvin
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231121/202311210522.8Y0cnwJ2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210522.8Y0cnwJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210522.8Y0cnwJ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/thermal_lib.c:46:5: warning: no previous prototype for function 'acpi_active_trip_temp' [-Wmissing-prototypes]
   int acpi_active_trip_temp(struct acpi_device *adev, int id, int *ret_temp)
       ^
   drivers/acpi/thermal_lib.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acpi_active_trip_temp(struct acpi_device *adev, int id, int *ret_temp)
   ^
   static 
>> drivers/acpi/thermal_lib.c:56:5: warning: no previous prototype for function 'acpi_passive_trip_temp' [-Wmissing-prototypes]
   int acpi_passive_trip_temp(struct acpi_device *adev, int *ret_temp)
       ^
   drivers/acpi/thermal_lib.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acpi_passive_trip_temp(struct acpi_device *adev, int *ret_temp)
   ^
   static 
>> drivers/acpi/thermal_lib.c:61:5: warning: no previous prototype for function 'acpi_hot_trip_temp' [-Wmissing-prototypes]
   int acpi_hot_trip_temp(struct acpi_device *adev, int *ret_temp)
       ^
   drivers/acpi/thermal_lib.c:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acpi_hot_trip_temp(struct acpi_device *adev, int *ret_temp)
   ^
   static 
>> drivers/acpi/thermal_lib.c:66:5: warning: no previous prototype for function 'acpi_critical_trip_temp' [-Wmissing-prototypes]
   int acpi_critical_trip_temp(struct acpi_device *adev, int *ret_temp)
       ^
   drivers/acpi/thermal_lib.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int acpi_critical_trip_temp(struct acpi_device *adev, int *ret_temp)
   ^
   static 
   4 warnings generated.


vim +/acpi_active_trip_temp +46 drivers/acpi/thermal_lib.c

    45	
  > 46	int acpi_active_trip_temp(struct acpi_device *adev, int id, int *ret_temp)
    47	{
    48		char obj_name[] = {'_', 'A', 'C', '0' + id, '\0'};
    49	
    50		if (id < 0 || id > 9)
    51			return -EINVAL;
    52	
    53		return acpi_trip_temp(adev, obj_name, ret_temp);
    54	}
    55	
  > 56	int acpi_passive_trip_temp(struct acpi_device *adev, int *ret_temp)
    57	{
    58		return acpi_trip_temp(adev, "_PSV", ret_temp);
    59	}
    60	
  > 61	int acpi_hot_trip_temp(struct acpi_device *adev, int *ret_temp)
    62	{
    63		return acpi_trip_temp(adev, "_HOT", ret_temp);
    64	}
    65	
  > 66	int acpi_critical_trip_temp(struct acpi_device *adev, int *ret_temp)
    67	{
    68		return acpi_trip_temp(adev, "_CRT", ret_temp);
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
