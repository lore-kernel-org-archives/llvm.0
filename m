Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24A18A93E;
	Sat,  2 Nov 2024 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730567570; cv=none; b=tklpVFYvXAECBiUKAL1OB97GFAFa0YOKWK3ZKdGOraEnH9SyAbSvorKQL96Txk9Vi4eLOipwnP2hbXCqDWuCHnG1cuj/Y5Anu113Zw2TPmPc3pfdwzfmxaf2qei3FHbaq17/VLuMsJ4NX4LRzdFY/O4+BTmBRzydL4JqcxADMrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730567570; c=relaxed/simple;
	bh=asyuoFLaFKdUCe5G1d61lWe7UpdRsPkuPYtkyr5+/T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUYdCS7jGxjn65T7BGd3Ms2USUxZr1NuN02V9Qa0wdfqNis6jJyWPsLaGE6fhbjsY1Kr6WCRNWJ8SiGYx77Tby72QJ7ozAuZcvSxZhprC6wxH5oAk3i2TThxKPL+Sgl8lr3FocDDr1LSemPAKOilxZzoSAoAVQ8c6/bqJVLEWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsolEumU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsolEumU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730567568; x=1762103568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=asyuoFLaFKdUCe5G1d61lWe7UpdRsPkuPYtkyr5+/T0=;
  b=ZsolEumUc8fyEOcLWg8tt2h4sdIt9h0uIofJoI7g3ZJmDBv3bh80PkWx
   DZGL/0i4vqwUkM8h0z+NT8HaGOtnYJzMAX7FEyqWgdG0+S4WaxBfrjkwD
   yreFEQ3JI4fc4cgK4rLVuDwJJN4ygzMa405Vd3Hz0AfcepWRRH0wAmHnS
   ChXbc7pXtZ2L7RNtW9DEMIKz0QFbQIIAY3l6FdbMj30YcEjV39zTpUauo
   h9owDDWhZVNo5sy0NSJUnw/fhGeE93PI25pqzTVAw2r4RV8Wu+QETG38R
   cT6iU+Hi+DAIBTfOTQm4treN3blSQnNxaEybzS+DTeG5YwomXVtJKbsC2
   A==;
X-CSE-ConnectionGUID: bcjGZWzLTd69uOIHQH+3hA==
X-CSE-MsgGUID: 8348xpk0Tj6uyQS0dIkJ8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30160046"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30160046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 10:12:48 -0700
X-CSE-ConnectionGUID: qKLyXNBUSkGuySGkfey+bg==
X-CSE-MsgGUID: TgXbcXiOSl2JrpyEoJdS2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83590704"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2024 10:12:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Hg3-000jCH-2h;
	Sat, 02 Nov 2024 17:12:43 +0000
Date: Sun, 3 Nov 2024 01:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-simple 14/14]
 kernel/module/sysfs.c:199:16: error: incompatible function pointer types
 assigning to 'ssize_t (*)(struct file *, struct kobject *, struct
 bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *,
 struct kobject *, struct bin_attribute *, ch...
Message-ID: <202411030153.kwfbG9J6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-simple
head:   621fe990596bff092203435a832fd67c3aefb87a
commit: 621fe990596bff092203435a832fd67c3aefb87a [14/14] sysfs_bin_attr_simple_read
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241103/202411030153.kwfbG9J6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030153.kwfbG9J6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030153.kwfbG9J6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/module/sysfs.c:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/module/sysfs.c:199:16: error: incompatible function pointer types assigning to 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned long)') from 'ssize_t (struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned long)') [-Wincompatible-function-pointer-types]
     199 |                         nattr->read = sysfs_bin_attr_simple_read;
         |                                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +199 kernel/module/sysfs.c

44c09535de4784 Aaron Tomlin 2022-03-22  165  
ce47f7cbbcadbc Chunhui Li   2024-09-11  166  static int add_notes_attrs(struct module *mod, const struct load_info *info)
44c09535de4784 Aaron Tomlin 2022-03-22  167  {
44c09535de4784 Aaron Tomlin 2022-03-22  168  	unsigned int notes, loaded, i;
44c09535de4784 Aaron Tomlin 2022-03-22  169  	struct module_notes_attrs *notes_attrs;
44c09535de4784 Aaron Tomlin 2022-03-22  170  	struct bin_attribute *nattr;
ce47f7cbbcadbc Chunhui Li   2024-09-11  171  	int ret;
44c09535de4784 Aaron Tomlin 2022-03-22  172  
44c09535de4784 Aaron Tomlin 2022-03-22  173  	/* Count notes sections and allocate structures.  */
44c09535de4784 Aaron Tomlin 2022-03-22  174  	notes = 0;
44c09535de4784 Aaron Tomlin 2022-03-22  175  	for (i = 0; i < info->hdr->e_shnum; i++)
44c09535de4784 Aaron Tomlin 2022-03-22  176  		if (!sect_empty(&info->sechdrs[i]) &&
44c09535de4784 Aaron Tomlin 2022-03-22  177  		    info->sechdrs[i].sh_type == SHT_NOTE)
44c09535de4784 Aaron Tomlin 2022-03-22  178  			++notes;
44c09535de4784 Aaron Tomlin 2022-03-22  179  
44c09535de4784 Aaron Tomlin 2022-03-22  180  	if (notes == 0)
ce47f7cbbcadbc Chunhui Li   2024-09-11  181  		return 0;
44c09535de4784 Aaron Tomlin 2022-03-22  182  
44c09535de4784 Aaron Tomlin 2022-03-22  183  	notes_attrs = kzalloc(struct_size(notes_attrs, attrs, notes),
44c09535de4784 Aaron Tomlin 2022-03-22  184  			      GFP_KERNEL);
44c09535de4784 Aaron Tomlin 2022-03-22  185  	if (!notes_attrs)
ce47f7cbbcadbc Chunhui Li   2024-09-11  186  		return -ENOMEM;
44c09535de4784 Aaron Tomlin 2022-03-22  187  
44c09535de4784 Aaron Tomlin 2022-03-22  188  	notes_attrs->notes = notes;
44c09535de4784 Aaron Tomlin 2022-03-22  189  	nattr = &notes_attrs->attrs[0];
44c09535de4784 Aaron Tomlin 2022-03-22  190  	for (loaded = i = 0; i < info->hdr->e_shnum; ++i) {
44c09535de4784 Aaron Tomlin 2022-03-22  191  		if (sect_empty(&info->sechdrs[i]))
44c09535de4784 Aaron Tomlin 2022-03-22  192  			continue;
44c09535de4784 Aaron Tomlin 2022-03-22  193  		if (info->sechdrs[i].sh_type == SHT_NOTE) {
44c09535de4784 Aaron Tomlin 2022-03-22  194  			sysfs_bin_attr_init(nattr);
44c09535de4784 Aaron Tomlin 2022-03-22  195  			nattr->attr.name = mod->sect_attrs->attrs[loaded].battr.attr.name;
44c09535de4784 Aaron Tomlin 2022-03-22  196  			nattr->attr.mode = 0444;
44c09535de4784 Aaron Tomlin 2022-03-22  197  			nattr->size = info->sechdrs[i].sh_size;
44c09535de4784 Aaron Tomlin 2022-03-22  198  			nattr->private = (void *)info->sechdrs[i].sh_addr;
66bc1a173328de Lukas Wunner 2024-04-06 @199  			nattr->read = sysfs_bin_attr_simple_read;
44c09535de4784 Aaron Tomlin 2022-03-22  200  			++nattr;
44c09535de4784 Aaron Tomlin 2022-03-22  201  		}
44c09535de4784 Aaron Tomlin 2022-03-22  202  		++loaded;
44c09535de4784 Aaron Tomlin 2022-03-22  203  	}
44c09535de4784 Aaron Tomlin 2022-03-22  204  
44c09535de4784 Aaron Tomlin 2022-03-22  205  	notes_attrs->dir = kobject_create_and_add("notes", &mod->mkobj.kobj);
ce47f7cbbcadbc Chunhui Li   2024-09-11  206  	if (!notes_attrs->dir) {
ce47f7cbbcadbc Chunhui Li   2024-09-11  207  		ret = -ENOMEM;
44c09535de4784 Aaron Tomlin 2022-03-22  208  		goto out;
ce47f7cbbcadbc Chunhui Li   2024-09-11  209  	}
44c09535de4784 Aaron Tomlin 2022-03-22  210  
ce47f7cbbcadbc Chunhui Li   2024-09-11  211  	for (i = 0; i < notes; ++i) {
ce47f7cbbcadbc Chunhui Li   2024-09-11  212  		ret = sysfs_create_bin_file(notes_attrs->dir, &notes_attrs->attrs[i]);
ce47f7cbbcadbc Chunhui Li   2024-09-11  213  		if (ret)
44c09535de4784 Aaron Tomlin 2022-03-22  214  			goto out;
ce47f7cbbcadbc Chunhui Li   2024-09-11  215  	}
44c09535de4784 Aaron Tomlin 2022-03-22  216  
44c09535de4784 Aaron Tomlin 2022-03-22  217  	mod->notes_attrs = notes_attrs;
ce47f7cbbcadbc Chunhui Li   2024-09-11  218  	return 0;
44c09535de4784 Aaron Tomlin 2022-03-22  219  
44c09535de4784 Aaron Tomlin 2022-03-22  220  out:
44c09535de4784 Aaron Tomlin 2022-03-22  221  	free_notes_attrs(notes_attrs, i);
ce47f7cbbcadbc Chunhui Li   2024-09-11  222  	return ret;
44c09535de4784 Aaron Tomlin 2022-03-22  223  }
44c09535de4784 Aaron Tomlin 2022-03-22  224  

:::::: The code at line 199 was first introduced by commit
:::::: 66bc1a173328dec3e37c203a999f2a2914c96b56 treewide: Use sysfs_bin_attr_simple_read() helper

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
