Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC051EDA02;
	Tue, 30 Sep 2025 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759223744; cv=none; b=i0iaRn2pMEiOBay4oONf2tAvPVHqfjaKaJIq2dtWnof0TJFEckBL1kkhdF1/C40TFLqm600ToSe2Fwj8Q2TrOi2IxvDbQbj+wZuN2wmdz4p7YheJkrp9KOAxOFtk96ktjm2ffJJselGnvX2vAQWKGW225tBXU3BHJy34vBRZDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759223744; c=relaxed/simple;
	bh=4u6qPEoom1yzsgPG/RiuqPrapQHxzaEyZJYu/J36gVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdKd08pzo1mu0bBMA4hHCellDv8LmnX1lQh6pINvKEz4OOZgnIUXg9WUECOUgsi24jJ7wemhuv68qvVNX5vhq0MtdD3zFF2yOecmCcmepRdlEvYgQxa8TXgv9oKweaHi4x8MzMENEGl+BRdxWg/HKFvumIHzPDILazP0GqSNSY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsWpFlo+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsWpFlo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759223739; x=1790759739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4u6qPEoom1yzsgPG/RiuqPrapQHxzaEyZJYu/J36gVs=;
  b=YsWpFlo+QmtmwfZKjNOwE+zdT5KiIIkifAtwf5TB0VpQp8+4JaCYGkJZ
   7o1t+th/7IfLCET2v1x9NR7cU7EfQ5HwfNZzSG6BZB/wGvyVwrazmYvs2
   iwwX8tLYTJIDljK5iMow5itmZ51LZ9bdsVCo0iiJSl0cYJIf1ViJYQC6D
   LgTsUZWECA1swltCwuMT6uEDHWRmteKLu/nyzIehdOeoox91ZdBbLh7as
   zNAJ6xWNvhJSR5aRoB5cUvKkPHyvzHuiSqvUtXgIQUWyYAVpFOfSCgvnc
   NYHAD4xccGXkVtTLuBcWXkwoo4je9W4GJaTFOI6NQ3rrgSprWZw725nhS
   Q==;
X-CSE-ConnectionGUID: EcNEPp6tRgKd3LzOpJBVeQ==
X-CSE-MsgGUID: tbmooJHCTZG9c/t/gq2UhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65296923"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65296923"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 02:15:38 -0700
X-CSE-ConnectionGUID: h3lsygxZT8yC8rzVkS8v2Q==
X-CSE-MsgGUID: t5LwEXYPSNCNRRntXuKYNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="178880006"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2025 02:15:34 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3WSK-00015t-1L;
	Tue, 30 Sep 2025 09:15:32 +0000
Date: Tue, 30 Sep 2025 17:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net,
	cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
	alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org,
	lee@kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
Message-ID: <202509301709.jGxwZmZX-lkp@intel.com>
References: <20250928013253.10869-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928013253.10869-2-W_Armin@gmx.de>

Hi Armin,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on linus/master v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Armin-Wolf/platform-x86-Add-Uniwill-laptop-driver/20250928-093543
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20250928013253.10869-2-W_Armin%40gmx.de
patch subject: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250930/202509301709.jGxwZmZX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301709.jGxwZmZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301709.jGxwZmZX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/uniwill/uniwill-acpi.c:1243:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1243 |                 guard(mutex)(&data->battery_lock);
         |                 ^
   include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:49:1: note: expanded from here
      49 | class_mutex_t
         | ^
   drivers/platform/x86/uniwill/uniwill-acpi.c:1250:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1250 |                 guard(mutex)(&data->input_lock);
         |                 ^
   include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:60:1: note: expanded from here
      60 | class_mutex_t
         | ^
>> drivers/platform/x86/uniwill/uniwill-acpi.c:1249:2: error: cannot jump from switch statement to this case label
    1249 |         default:
         |         ^
   drivers/platform/x86/uniwill/uniwill-acpi.c:1243:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1243 |                 guard(mutex)(&data->battery_lock);
         |                 ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:47:1: note: expanded from here
      47 | __UNIQUE_ID_guard1072
         | ^
   2 warnings and 1 error generated.


vim +1249 drivers/platform/x86/uniwill/uniwill-acpi.c

  1235	
  1236	static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action, void *dummy)
  1237	{
  1238		struct uniwill_data *data = container_of(nb, struct uniwill_data, nb);
  1239		struct uniwill_battery_entry *entry;
  1240	
  1241		switch (action) {
  1242		case UNIWILL_OSD_BATTERY_ALERT:
  1243			guard(mutex)(&data->battery_lock);
  1244			list_for_each_entry(entry, &data->batteries, head) {
  1245				power_supply_changed(entry->battery);
  1246			}
  1247	
  1248			return NOTIFY_OK;
> 1249		default:
  1250			guard(mutex)(&data->input_lock);
  1251			sparse_keymap_report_event(data->input_device, action, 1, true);
  1252	
  1253			return NOTIFY_OK;
  1254		}
  1255	}
  1256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
