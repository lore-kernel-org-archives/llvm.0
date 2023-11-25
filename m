Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDD1377;
	Sat, 25 Nov 2023 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/HWne4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700871584; x=1732407584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4N9PNwQKYEElwcro6ShUUOLIAJISn+hfskynoE/BFA=;
  b=h/HWne4iwWW3g3bptiojsMqh0Gb8mMEBl99DQh5dK+3EG5gx4PwaIM14
   QTPo6FewhQS18cDxKOwFcJTLPjTGhwNem1zRpOMgYqNUXH7NOFi41Snl0
   4sr7vIw+28lwaMg5CtwICyUhF0IE1i6YyLF3zZvZTq8pgDF1NcUV3US23
   U/iNWpbKZIWZ0QrGsvzuKhJLLCAtVDPZlIPxzGnUWlOquleLu8YJnOP5D
   zMBmmP+1lfupDKICR0BxaHpgNozRgFT9ZX1vDvMyRsv/C8kw2MmI7oL/+
   FF75zGfjzRtTnd3nEfAnTz/0fdfRX5yelHfm8DeuA5oCOat8KeEXcQV9k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391350878"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391350878"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 16:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911558730"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911558730"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 16:19:37 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6gOV-0003QY-09;
	Sat, 25 Nov 2023 00:19:35 +0000
Date: Sat, 25 Nov 2023 08:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-xe:drm-xe-next 879/898] ld.lld: error: undefined symbol:
 wmi_query_block
Message-ID: <202311250637.lvc4Xqzu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   1832821c7e4c5bd24353183f060f1435b2eb7992
commit: 556206e017f1aebd4b3637bf8b0e65606c0b1796 [879/898] drm/xe/display: Implement display support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231125/202311250637.lvc4Xqzu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250637.lvc4Xqzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250637.lvc4Xqzu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: wmi_query_block
   >>> referenced by surface3-wmi.c
   >>>               drivers/platform/surface/surface3-wmi.o:(s3_wmi_send_lid_state) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: wmi_instance_count
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_install_notify_handler
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_remove_notify_handler
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_probe) in archive vmlinux.a
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_devm_notify_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_evaluate_method
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_wmi_probe) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_wmi_probe) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_wmi_sensor_info) in archive vmlinux.a
   >>> referenced 4 more times
--
>> ld.lld: error: undefined symbol: wmi_get_event_data
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_notify) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __wmi_driver_register
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_driver_init) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_sensors_wmi_driver_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_driver_unregister
   >>> referenced by hp-wmi-sensors.c
   >>>               drivers/hwmon/hp-wmi-sensors.o:(hp_wmi_sensors_driver_exit) in archive vmlinux.a
   >>> referenced by asus_wmi_sensors.c
   >>>               drivers/hwmon/asus_wmi_sensors.o:(asus_sensors_wmi_driver_exit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: wmi_has_guid
   >>> referenced by base.c
   >>>               drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o:(mxm_shadow_wmi) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_WMI
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
   Selected by [y]:
   - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m && MODULES [=y] || y && KUNIT [=y]=y) && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
