Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875813D8B0;
	Thu,  1 Aug 2024 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722491302; cv=none; b=WmsCEo/PkZroV2nZgPCmpsjBafDrmq92/VJkUEM7w1MovQ+mszRTIQ4eMUTi2M1XnxmCRKozSQQftGLAB1OmqDNVCQaq3L0u1fEmvdfwTU5tEpuL+QaS6QDSuPMixXc6DDhWiwa0eXXZv4gxKV3+s8IPS9oHcUcaf1MrozenfDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722491302; c=relaxed/simple;
	bh=uWxQHPBkuSEVMcaam0CN0odq9jQrgSJmc6R4SdVxiSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OYXx0A8hn2Yb4R9OsvAr6IjhaIEH+yjPhubsf+9xXtiaKurq4OG16lbmqIlg4D11ClYuTOkqKIn8HpvdE5SPbqbnWhPkW/FSp5tgwIvLvR0qcTpbWwIEHXzNzX2AU8rjKFlh8EJ8WuoZ+ZJE7OR2mkivcsmIdpT1RenOiyzYTAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keBWjLo6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keBWjLo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722491300; x=1754027300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWxQHPBkuSEVMcaam0CN0odq9jQrgSJmc6R4SdVxiSM=;
  b=keBWjLo69Y9+je/NK1ytG8lFGA3NiQ7SjbPWdoCWdjU1rUdxi1Ljhc39
   NRu615I7hf4WTyHWbzZvuKIQLNDAlFeYyIizPmbE7emwemkh0bcviEpwG
   Jn1paqQlTvKNx3hGsgK8N2wqmjd1M0ffZKDJS9ypEKnZNerajiTcanMB8
   VGN0hdilYDODMLTebgr0iqcv42yd9lcOgUVYFj8rOAcR2lC6NFuoAwNvJ
   ZG5uS5lRYcx2/2zFtzGVP5UsJuzljayXL4I7TXADA0z/icWUxuSvYT/Tn
   HYyhmZBBFrOYwlb9WuhrmTGgaacpr2hAQH43gc9QH37no+n1zlKooZ//8
   g==;
X-CSE-ConnectionGUID: QNYZHIe/Ti+jsl2hNTUzBw==
X-CSE-MsgGUID: Ou4SDC3sQ0KIrFaEgNYqog==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31073153"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="31073153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 22:48:19 -0700
X-CSE-ConnectionGUID: QUSqkXGmR7idAN8wI69vWA==
X-CSE-MsgGUID: uEcBVrhmRduW0q1sz6bAhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59720022"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Jul 2024 22:48:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZOfe-000vF4-31;
	Thu, 01 Aug 2024 05:48:14 +0000
Date: Thu, 1 Aug 2024 13:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>
Subject: [brauner-vfs:work.procfs 2/2] include/linux/proc_fs.h:182:24:
 warning: no previous prototype for function 'proc_self_symlink'
Message-ID: <202408011301.6Md4ykiF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs
head:   168c8d86d8ac87a04878717d8d13d6b63339db8d
commit: 168c8d86d8ac87a04878717d8d13d6b63339db8d [2/2] [DRAFT & RFC]: proc: restrict overmounting of ephemeral entities
config: arm-randconfig-003-20240801 (https://download.01.org/0day-ci/archive/20240801/202408011301.6Md4ykiF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011301.6Md4ykiF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011301.6Md4ykiF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/edac/edac_mc.c:16:
>> include/linux/proc_fs.h:182:24: warning: no previous prototype for function 'proc_self_symlink' [-Wmissing-prototypes]
     182 | struct proc_dir_entry *proc_self_symlink(const char *name,
         |                        ^
   include/linux/proc_fs.h:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | struct proc_dir_entry *proc_self_symlink(const char *name,
         | ^
         | static 
   In file included from drivers/edac/edac_mc.c:22:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   2 warnings generated.


vim +/proc_self_symlink +182 include/linux/proc_fs.h

   179	
   180	static inline struct proc_dir_entry *proc_symlink(const char *name,
   181			struct proc_dir_entry *parent,const char *dest) { return NULL;}
 > 182	struct proc_dir_entry *proc_self_symlink(const char *name,
   183						 struct proc_dir_entry *parent,
   184						 const char *dest) { return NULL;}
   185	static inline struct proc_dir_entry *proc_mkdir(const char *name,
   186		struct proc_dir_entry *parent) {return NULL;}
   187	static inline struct proc_dir_entry *proc_create_mount_point(const char *name) { return NULL; }
   188	static inline struct proc_dir_entry *_proc_mkdir(const char *name, umode_t mode,
   189							 struct proc_dir_entry *parent,
   190							 void *data, bool force_lookup,
   191							 u8 flags)
   192	{
   193		return NULL;
   194	}
   195	static inline struct proc_dir_entry *proc_mkdir_data(const char *name,
   196		umode_t mode, struct proc_dir_entry *parent, void *data) { return NULL; }
   197	static inline struct proc_dir_entry *proc_mkdir_mode(const char *name,
   198		umode_t mode, struct proc_dir_entry *parent) { return NULL; }
   199	#define proc_create_seq_private(name, mode, parent, ops, size, data) ({NULL;})
   200	#define proc_create_seq_data(name, mode, parent, ops, data) ({NULL;})
   201	#define proc_create_seq(name, mode, parent, ops) ({NULL;})
   202	#define proc_create_single(name, mode, parent, show) ({NULL;})
   203	#define proc_create_single_data(name, mode, parent, show, data) ({NULL;})
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
