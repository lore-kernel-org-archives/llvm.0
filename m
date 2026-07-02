Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557D523393F;
	Thu,  2 Jul 2026 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001948; cv=none; b=lK4/ANDwq4rUBbwYSAe63EG2BJpiNW/DCVTDrcwNtHQoMdfcKhgYJpEpwE0VSzgDeexpHUozJF777jy2ihxm1hx4KAFYsFzChBnvXV2OG1GWzwdkyMZ8VFgBMdzhHEQ7fnZzlwAKWf8cTFJ07GTKdX3oEaXnivIOYi+FfWD/hCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001948; c=relaxed/simple;
	bh=8Ckt8OWwSxUDS3+aZ1wGeZLdt0/wQb2Kt0XypOsnj/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O+BybeROemwnYYMFFmhc85ZacLVAd8e/qX6jBivzw7GPhomLGI8fF5a0gQqAfY3jJNSIOSmP6zOTZJXR5v56sAkA59T58b0gzAmivD1sVNBu5kaifNE43RfW2+xO0SdtAo4NIfbrrgt8BIrI+f+2onQd/K/RetNpk/wUOBk4f+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDYIxTtd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDYIxTtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783001947; x=1814537947;
  h=date:from:to:cc:subject:message-id;
  bh=8Ckt8OWwSxUDS3+aZ1wGeZLdt0/wQb2Kt0XypOsnj/w=;
  b=HDYIxTtdow10C0CySYAqTLbF5w7+9W6v2zWvjbt+YSzxykds0eh/kTR3
   lIrdR6QjkoJjlzjLjEwV23RwpgCYmfBaxzvRyEmXz7BE5tlx0zMyIrt9l
   RWIBolTM4pf/cC2KG2H5CZFgggOxa95Ds1WehmKbHOmjGMdQY70nzlJIY
   Mr1hlcvWo8HUVIebfDPwzHUpiPy8UfvKFb+fJ7wDarhwiZaYlJ72IPmuG
   v3DeJcX9fDbCHCPs8IgB8wKabt3w81No1qQZjdDRNblNUA3DG2PGcxWMS
   4EZarZrXOy+rKyTnH7vae87rpXFx1RWAlNeTPf+aJpKyKdTYuM3iFx8ot
   g==;
X-CSE-ConnectionGUID: +eosXx/lSoyFHtNkPvKeeg==
X-CSE-MsgGUID: 7mwJRBbbQdyrgAUwRCJ4nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94412167"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94412167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:19:07 -0700
X-CSE-ConnectionGUID: +CpoN2kFRty9iUI3oQnh/A==
X-CSE-MsgGUID: Sgvyw5fjR9CF9ABCibqCpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256462685"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2026 07:19:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfIFq-00000000AqZ-2pEz;
	Thu, 02 Jul 2026 14:19:02 +0000
Date: Thu, 02 Jul 2026 22:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 19/23]
 include/acpi/acpi_bus.h:29:28: warning: declaration of 'union acpi_object'
 will not be visible outside of this function
Message-ID: <202607022235.pnx44b9j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   c1daed90f65670f1d0231c3ab8a569b682181b2b
commit: 7a2657c9e1f143ed73c88d292c22c5225720d100 [19/23] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607022235.pnx44b9j-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022235.pnx44b9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022235.pnx44b9j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/arm_scmi/driver.c:19:
   include/acpi/acpi_bus.h:24:2: error: unknown type name 'acpi_handle'
      24 |         acpi_handle *handles;
         |         ^
   include/acpi/acpi_bus.h:28:1: error: unknown type name 'acpi_status'
      28 | acpi_status
         | ^
>> include/acpi/acpi_bus.h:29:28: warning: declaration of 'union acpi_object' will not be visible outside of this function [-Wvisibility]
      29 | acpi_extract_package(union acpi_object *package,
         |                            ^
>> include/acpi/acpi_bus.h:30:15: warning: declaration of 'struct acpi_buffer' will not be visible outside of this function [-Wvisibility]
      30 |                      struct acpi_buffer *format, struct acpi_buffer *buffer);
         |                             ^
   include/acpi/acpi_bus.h:31:1: error: unknown type name 'acpi_status'
      31 | acpi_status
         | ^
   include/acpi/acpi_bus.h:32:23: error: unknown type name 'acpi_handle'
      32 | acpi_evaluate_integer(acpi_handle handle,
         |                       ^
   include/acpi/acpi_bus.h:33:9: error: unknown type name 'acpi_string'
      33 |                       acpi_string pathname,
         |                       ^
>> include/acpi/acpi_bus.h:34:16: warning: declaration of 'struct acpi_object_list' will not be visible outside of this function [-Wvisibility]
      34 |                       struct acpi_object_list *arguments, unsigned long long *data);
         |                              ^
   include/acpi/acpi_bus.h:35:30: error: unknown type name 'acpi_handle'
      35 | bool acpi_evaluate_reference(acpi_handle handle, acpi_string pathname,
         |                              ^
   include/acpi/acpi_bus.h:35:50: error: unknown type name 'acpi_string'
      35 | bool acpi_evaluate_reference(acpi_handle handle, acpi_string pathname,
         |                                                  ^
   include/acpi/acpi_bus.h:36:16: warning: declaration of 'struct acpi_object_list' will not be visible outside of this function [-Wvisibility]
      36 |                              struct acpi_object_list *arguments,
         |                                     ^
   include/acpi/acpi_bus.h:43:22: error: unknown type name 'acpi_handle'
      43 | bool acpi_device_dep(acpi_handle target, acpi_handle match);
         |                      ^
   include/acpi/acpi_bus.h:43:42: error: unknown type name 'acpi_handle'
      43 | bool acpi_device_dep(acpi_handle target, acpi_handle match);
         |                                          ^
   include/acpi/acpi_bus.h:44:1: error: unknown type name 'acpi_status'
      44 | acpi_status
         | ^
   include/acpi/acpi_bus.h:45:19: error: unknown type name 'acpi_handle'
      45 | acpi_evaluate_ost(acpi_handle handle, u32 source_event, u32 status_code,
         |                   ^
   include/acpi/acpi_bus.h:46:12: warning: declaration of 'struct acpi_buffer' will not be visible outside of this function [-Wvisibility]
      46 |                   struct acpi_buffer *status_buf);
         |                          ^
   include/acpi/acpi_bus.h:48:22: error: unknown type name 'acpi_handle'
      48 | bool acpi_has_method(acpi_handle handle, char *name);
         |                      ^
   include/acpi/acpi_bus.h:49:1: error: unknown type name 'acpi_status'
      49 | acpi_status acpi_execute_simple_method(acpi_handle handle, char *method,
         | ^
   include/acpi/acpi_bus.h:49:40: error: unknown type name 'acpi_handle'
      49 | acpi_status acpi_execute_simple_method(acpi_handle handle, char *method,
         |                                        ^
   include/acpi/acpi_bus.h:51:1: error: unknown type name 'acpi_status'
      51 | acpi_status acpi_evaluate_ej0(acpi_handle handle);
         | ^
   include/acpi/acpi_bus.h:51:31: error: unknown type name 'acpi_handle'
      51 | acpi_status acpi_evaluate_ej0(acpi_handle handle);
         |                               ^
   include/acpi/acpi_bus.h:52:1: error: unknown type name 'acpi_status'
      52 | acpi_status acpi_evaluate_lck(acpi_handle handle, int lock);
         | ^
   include/acpi/acpi_bus.h:52:31: error: unknown type name 'acpi_handle'
      52 | acpi_status acpi_evaluate_lck(acpi_handle handle, int lock);
         |                               ^
   include/acpi/acpi_bus.h:53:1: error: unknown type name 'acpi_status'
      53 | acpi_status acpi_evaluate_reg(acpi_handle handle, u8 space_id, u32 function);
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   5 warnings and 20 errors generated.


vim +29 include/acpi/acpi_bus.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  26  
^1da177e4c3f41 Linus Torvalds    2005-04-16  27  /* acpi_utils.h */
^1da177e4c3f41 Linus Torvalds    2005-04-16  28  acpi_status
4be44fcd3bf648 Len Brown         2005-08-05 @29  acpi_extract_package(union acpi_object *package,
4be44fcd3bf648 Len Brown         2005-08-05 @30  		     struct acpi_buffer *format, struct acpi_buffer *buffer);
^1da177e4c3f41 Linus Torvalds    2005-04-16  31  acpi_status
4be44fcd3bf648 Len Brown         2005-08-05  32  acpi_evaluate_integer(acpi_handle handle,
^1da177e4c3f41 Linus Torvalds    2005-04-16  33  		      acpi_string pathname,
27663c5855b10a Matthew Wilcox    2008-10-10 @34  		      struct acpi_object_list *arguments, unsigned long long *data);
6909e0f322b052 Rafael J. Wysocki 2023-12-08  35  bool acpi_evaluate_reference(acpi_handle handle, acpi_string pathname,
^1da177e4c3f41 Linus Torvalds    2005-04-16  36  			     struct acpi_object_list *arguments,
^1da177e4c3f41 Linus Torvalds    2005-04-16  37  			     struct acpi_handle_list *list);
2e57d10a659156 Rafael J. Wysocki 2023-09-27  38  bool acpi_handle_list_equal(struct acpi_handle_list *list1,
2e57d10a659156 Rafael J. Wysocki 2023-09-27  39  			    struct acpi_handle_list *list2);
2e57d10a659156 Rafael J. Wysocki 2023-09-27  40  void acpi_handle_list_replace(struct acpi_handle_list *dst,
2e57d10a659156 Rafael J. Wysocki 2023-09-27  41  			      struct acpi_handle_list *src);
2e57d10a659156 Rafael J. Wysocki 2023-09-27  42  void acpi_handle_list_free(struct acpi_handle_list *list);
d70d141bb15f32 Rafael J. Wysocki 2023-12-14  43  bool acpi_device_dep(acpi_handle target, acpi_handle match);
275c58d77062bb Toshi Kani        2012-05-23  44  acpi_status
05730c1952787f Jiang Liu         2014-02-19  45  acpi_evaluate_ost(acpi_handle handle, u32 source_event, u32 status_code,
05730c1952787f Jiang Liu         2014-02-19  46  		  struct acpi_buffer *status_buf);
^1da177e4c3f41 Linus Torvalds    2005-04-16  47  

:::::: The code at line 29 was first introduced by commit
:::::: 4be44fcd3bf648b782f4460fd06dfae6c42ded4b [ACPI] Lindent all ACPI files

:::::: TO: Len Brown <len.brown@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
