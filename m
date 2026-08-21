Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE52C21C5;
	Fri, 21 Aug 2026 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314849; cv=none; b=rsdFpJftfG5H9Ix526ygzfNxVeuSfYdH7Y2MTiAfsrq5hmR0LgGDcDIeUt6XIrW5LeIXZIpWI9DJfh57PJX3QJl3my+i+AgVrwhrQ1iZLZw89gwWneEHjgmPNVJ7MnZ+UDxqIs6DzfBZl9n0EZLPDQnjPJf6WrPghx4OM0i2oyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314849; c=relaxed/simple;
	bh=mA5+tCJIxGMdiTafRD3UeUkrQnVqiAw1oU1EajmmdaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4MljjP47cFxs+3voIH5kTxk8zreT6L6yKvD4Sa1il8sWzlaYqIC/Jry4KvpqVqgiqwEmMCMh2wPWEPmYILbRH5VKVl/DspWY1VrMYWumEBF7knvfexNIWQW82M8ir0KOgMSqKx+vGCENW9C6GiZMKaSFJyFcqSanfTJzIhZ+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdxNnWm2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdxNnWm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787314843; x=1818850843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mA5+tCJIxGMdiTafRD3UeUkrQnVqiAw1oU1EajmmdaY=;
  b=TdxNnWm2l/QnC+gEo67ynrMBHGpgwWBcHpsamMe04RwGe5fuGBIJ/LRt
   tUry5GcNqG3rQEM03qPrLd7TMeMK+N52yOCUIGeAxrC9ur+WqLEDUvHVs
   iAtCOnaT33njKEKJCi8bpO199M1NVmsDRHX73I8u3Nb1IC1xuN7RkR0YD
   B//UOG7uEthhB1/B/QzSjPdNMjk1IFtHtQhTUZ+T2cO2Mk13KZ/YVKtNU
   9ZnqY1yMP6V2lbBM+ZW+XvHitoJS60ps1C2RPRzahb2ECVmMYGhArLvBq
   PK+/dEvOKAXrAgj6+GrN0Nnu39w8mVUoIT2sdkRqE1fd4mqgR3jqXUZD0
   A==;
X-CSE-ConnectionGUID: irYe1omeQhW09d0A0fX5pg==
X-CSE-MsgGUID: uTBTJ85BSdu6nhfI2F/wQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="75398539"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="75398539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 05:20:41 -0700
X-CSE-ConnectionGUID: htcZrFUnSMGknKLgVRtM9Q==
X-CSE-MsgGUID: lfDIRxXwRCCQOXnrNX1uig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="262054778"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Aug 2026 05:20:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxOEd-00000000ptj-225Q;
	Fri, 21 Aug 2026 12:20:35 +0000
Date: Fri, 21 Aug 2026 20:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	Lee Duncan <lduncan@suse.com>, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v2] scsi: target: pin db_root for metadata writes
Message-ID: <202608212004.Xyev8OzS-lkp@intel.com>
References: <20260818051442.1523210-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818051442.1523210-1-runyu.xiao@seu.edu.cn>

Hi Runyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on v7.2]
[cannot apply to linus/master next-20260820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Runyu-Xiao/scsi-target-pin-db_root-for-metadata-writes/20260818-131442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20260818051442.1523210-1-runyu.xiao%40seu.edu.cn
patch subject: [PATCH v2] scsi: target: pin db_root for metadata writes
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260821/202608212004.Xyev8OzS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212004.Xyev8OzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608212004.Xyev8OzS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/target/target_core_configfs.c:3757:2: warning: adding 'int' to a string does not append to the string [-Wstring-plus-int]
    3757 |         strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_PREFERRED);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:111:2: note: expanded from macro 'strscpy'
     111 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:29:1: note: expanded from here
      29 | __strscpy1
         | ^
   include/linux/string.h:80:31: note: expanded from macro '__strscpy1'
      80 |         sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
         |                                 ~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:3757:2: note: use array indexing to silence this warning
   include/linux/string.h:111:2: note: expanded from macro 'strscpy'
     111 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:29:1: note: expanded from here
      29 | __strscpy1
         | ^
   include/linux/string.h:80:31: note: expanded from macro '__strscpy1'
      80 |         sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
         |                                      ^
>> drivers/target/target_core_configfs.c:3757:25: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
    3757 |         strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_PREFERRED);
         |                                ^~~~~~~~~~~
   drivers/target/target_core_internal.h:169:22: note: expanded from macro 'DB_ROOT_LEN'
     169 | #define DB_ROOT_LEN             4096
         |                                 ^~~~
   include/linux/string.h:70:43: note: passing argument to parameter here
      70 | ssize_t sized_strscpy(char *, const char *, size_t);
         |                                           ^
>> drivers/target/target_core_configfs.c:3757:38: error: incompatible pointer to integer conversion passing 'char *' to parameter of type 'size_t' (aka 'unsigned long') [-Wint-conversion]
    3757 |         strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_PREFERRED);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/target/target_core_internal.h:171:27: note: expanded from macro 'DB_ROOT_PREFERRED'
     171 | #define DB_ROOT_PREFERRED       "/etc/target"
         |                                 ^
   include/linux/string.h:111:60: note: expanded from macro 'strscpy'
     111 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/string.h:80:26: note: expanded from macro '__strscpy1'
      80 |         sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:70:51: note: passing argument to parameter here
      70 | ssize_t sized_strscpy(char *, const char *, size_t);
         |                                                   ^
   drivers/target/target_core_configfs.c:3760:3: warning: adding 'int' to a string does not append to the string [-Wstring-plus-int]
    3760 |                 strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_DEFAULT);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:111:2: note: expanded from macro 'strscpy'
     111 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:30:1: note: expanded from here
      30 | __strscpy1
         | ^
   include/linux/string.h:80:31: note: expanded from macro '__strscpy1'
      80 |         sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
         |                                 ~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:3760:3: note: use array indexing to silence this warning
   include/linux/string.h:111:2: note: expanded from macro 'strscpy'
     111 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^
   include/linux/args.h:26:27: note: expanded from macro 'CONCATENATE'
      26 | #define CONCATENATE(a, b) __CONCAT(a, b)
         |                           ^
   include/linux/args.h:25:24: note: expanded from macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   <scratch space>:30:1: note: expanded from here
      30 | __strscpy1
         | ^
   include/linux/string.h:80:31: note: expanded from macro '__strscpy1'
      80 |         sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
         |                                      ^
   drivers/target/target_core_configfs.c:3760:26: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const char *' [-Wint-conversion]
    3760 |                 strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_DEFAULT);
         |                                        ^~~~~~~~~~~
   drivers/target/target_core_internal.h:169:22: note: expanded from macro 'DB_ROOT_LEN'
     169 | #define DB_ROOT_LEN             4096
         |                                 ^~~~
   include/linux/string.h:70:43: note: passing argument to parameter here
      70 | ssize_t sized_strscpy(char *, const char *, size_t);
         |                                           ^
   drivers/target/target_core_configfs.c:3760:39: error: incompatible pointer to integer conversion passing 'char *' to parameter of type 'size_t' (aka 'unsigned long') [-Wint-conversion]
    3760 |                 strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_DEFAULT);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/target/target_core_internal.h:170:26: note: expanded from macro 'DB_ROOT_DEFAULT'
     170 | #define DB_ROOT_DEFAULT         "/var/target"
         |                                 ^
   include/linux/string.h:111:60: note: expanded from macro 'strscpy'
     111 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/string.h:80:26: note: expanded from macro '__strscpy1'
      80 |         sized_strscpy(dst, src, size + __must_be_cstr(dst) + __must_be_cstr(src))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:70:51: note: passing argument to parameter here
      70 | ssize_t sized_strscpy(char *, const char *, size_t);
         |                                                   ^
   2 warnings and 4 errors generated.


vim +3757 drivers/target/target_core_configfs.c

  3751	
  3752	static void target_init_dbroot(void)
  3753	{
  3754		struct path path = {};
  3755		int ret;
  3756	
> 3757		strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_PREFERRED);
  3758		ret = target_validate_db_root(db_root_stage, &path);
  3759		if (ret) {
  3760			strscpy(db_root_stage, DB_ROOT_LEN, DB_ROOT_DEFAULT);
  3761			ret = target_validate_db_root(db_root_stage, &path);
  3762			if (ret)
  3763				return;
  3764		}
  3765	
  3766		db_root_path = path;
  3767		strscpy(db_root, db_root_stage);
  3768		pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
  3769	}
  3770	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
