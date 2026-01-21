Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33C41B361;
	Wed, 21 Jan 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010290; cv=none; b=K/auGiYFE1joHZAZ9efbcrG1+W+nR37vGMGtYHzgtHyfMU7R4VXtbHA/NsEuaH7njSYgnnUOuiURhTyH5rvNvXujW8twA3r32nYGGQ2Rd9jKFCkNgr5R+aEwzVUBM+eIU18ze/LUC/DwE69XsgYC14pzHiq4WuSivUIHGP9cbzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010290; c=relaxed/simple;
	bh=tTM9MIYJDpxfY9o4TuJ5KZ6iY8deAz2hvjUrP6wh8qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXBWFrW4oHZ1Lq91ciJyJ4vs3SwGEw/h1YU/FiqGr3lR8RD5gJMNohalZVffg4m6O85h0hF6c7PdCGGeLLRLsugXc895Fe+d7/vtFo4NB5EpxvSWpsrwhZy1xYUl79A7g83/UM6lYYZd3wIUIUumUYpJWg7EcyWB/ckwiP2+ews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IInIRaOG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IInIRaOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769010288; x=1800546288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tTM9MIYJDpxfY9o4TuJ5KZ6iY8deAz2hvjUrP6wh8qA=;
  b=IInIRaOG+619NDq8p2o5KkES8ovRyzMHkQ5Ntrea3P6FP8FRXb/KiTK5
   GU2EipoFOVdsYvtSBSXc0jvqJ3rQpi8CGDltX2PZ9b12UNPnk3ojx/ztK
   kIouT3Y88pX7yZOzssiIBrhou5Q4uWmroE0gx6i1CYRwBVNV7yEIUmIFP
   WErikY2xd38g0EF+k79KiIC0vMFMu66oK68EDEOB8LoWUhoH7bzuzXwfL
   KtWrarZnI4qKTYlst3EgXKXhKctoufrX7v0R/dFhlucPw5mkN9fJMPNYW
   g/BmA3cJZoddoFyLqxFdsfKS5h82UHMKD8oDFI/8qHtq48DpgsIOoMcBP
   Q==;
X-CSE-ConnectionGUID: QcsOocQoQNydr72ELb1MyA==
X-CSE-MsgGUID: OZ4x06/pSSeibf8WLQRruA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69435062"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69435062"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:44:45 -0800
X-CSE-ConnectionGUID: ejY6aeK9Qz29d06IowdvZQ==
X-CSE-MsgGUID: Wane3y14QECFNzlkc3A3WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="244055669"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2026 07:44:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viaNs-00000000RMT-3xoh;
	Wed, 21 Jan 2026 15:44:40 +0000
Date: Wed, 21 Jan 2026 23:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Jean Delvare <jdelvare@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [PATCH v4 6/6] x86/CPU/AMD: Print AGESA string from DMI
 additional information entry
Message-ID: <202601212323.7qxI0awN-lkp@intel.com>
References: <20260121060431.432350-7-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121060431.432350-7-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.19-rc6 next-20260120]
[cannot apply to bp/for-next tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello-AMD/firmware-dmi-Correct-an-indexing-error-in-dmi-h/20260121-140800
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260121060431.432350-7-superm1%40kernel.org
patch subject: [PATCH v4 6/6] x86/CPU/AMD: Print AGESA string from DMI additional information entry
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260121/202601212323.7qxI0awN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212323.7qxI0awN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212323.7qxI0awN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/setup.c:16:
>> include/linux/dmi.h:173:64: error: use of undeclared identifier 'dmi_empty_string'
     173 |         dmi_string_nosave(const struct dmi_header *dm, u8 s) { return dmi_empty_string; }
         |                                                                       ^~~~~~~~~~~~~~~~
   1 error generated.


vim +/dmi_empty_string +173 include/linux/dmi.h

   141	
   142	static inline int dmi_check_system(const struct dmi_system_id *list) { return 0; }
   143	static inline const char * dmi_get_system_info(int field) { return NULL; }
   144	static inline const struct dmi_device * dmi_find_device(int type, const char *name,
   145		const struct dmi_device *from) { return NULL; }
   146	static inline void dmi_setup(void) { }
   147	static inline bool dmi_get_date(int field, int *yearp, int *monthp, int *dayp)
   148	{
   149		if (yearp)
   150			*yearp = 0;
   151		if (monthp)
   152			*monthp = 0;
   153		if (dayp)
   154			*dayp = 0;
   155		return false;
   156	}
   157	static inline int dmi_get_bios_year(void) { return -ENXIO; }
   158	static inline int dmi_name_in_vendors(const char *s) { return 0; }
   159	static inline int dmi_name_in_serial(const char *s) { return 0; }
   160	#define dmi_available 0
   161	static inline int dmi_walk(void (*decode)(const struct dmi_header *, void *),
   162		void *private_data) { return -ENXIO; }
   163	static inline bool dmi_match(enum dmi_field f, const char *str)
   164		{ return false; }
   165	static inline void dmi_memdev_name(u16 handle, const char **bank,
   166			const char **device) { }
   167	static inline u64 dmi_memdev_size(u16 handle) { return ~0ul; }
   168	static inline u8 dmi_memdev_type(u16 handle) { return 0x0; }
   169	static inline u16 dmi_memdev_handle(int slot) { return 0xffff; }
   170	static inline const struct dmi_system_id *
   171		dmi_first_match(const struct dmi_system_id *list) { return NULL; }
   172	static inline const char *
 > 173		dmi_string_nosave(const struct dmi_header *dm, u8 s) { return dmi_empty_string; }
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
