Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB027DA8C;
	Sun, 22 Dec 2024 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734909369; cv=none; b=rpdMHSvHUUVHxkVMrhcJmpyCYGL2V2ChegU+kqR2mwvHv3k8Mrd7wokMpapA42ea+gwqYHgjsrRaGwHqfLbnj9GGOhdKLSHseVgp4QJdW7hKDN+SEpY8BpQML7hCivA54Mo08ejSRXCQFBwya/qRhF3PRWtctTobrFF6TTePA4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734909369; c=relaxed/simple;
	bh=r6HKnJOGOj/50r48P+z/0C7cAdafkLowwBy5C9itAyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qv01VFvwkX+MXnu734KKp0ScMaUvg1ut2fdhKjRQ6adHRa9bqN6g+StV80sp1+kbV9Qsi0QCfTal+amKeYwMriutJgtir3lCVh03ZJWFb7DClbTju24QgB5HpfQwi4j6Q62Qtv18tC44O7wZRRODSHdSaJB4OaJW6AO/IwwgEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESnFkb3N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESnFkb3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734909365; x=1766445365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6HKnJOGOj/50r48P+z/0C7cAdafkLowwBy5C9itAyU=;
  b=ESnFkb3NzJJuhb83VEzyTA0ATUIt+RJ017LPScx4qaFVdxPq2bunmQg1
   g6HWcFA8tJkMhaAbvCwacQ818g87F3eEzC2NuM1/kFmmEvlJYywk06jM+
   xpjCX+dLr6M6t+blSdqp21M+0+PLe/2UbeORPHBBVfDToXBVoWKdqmkoy
   At1BzAJuDFmUqaEI3GRtUpj0bqADuRchHUER64hceoiBD+S9auzMYItPG
   9NjH9gGi3ycjLk43b08EHBoJtcIVuUVS/9Y/XddgY4yqm7S+R+hcG1Uvt
   PdCrOdqtQluXeArOQdIpHwZDaf7hxnIN3OUxl7spKupQnLDBRc/9oj1Ew
   A==;
X-CSE-ConnectionGUID: YtFDRKEpR1+XIQq7jkm6lg==
X-CSE-MsgGUID: +8EQdZKYQjmxImoIom4GIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46384381"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="46384381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 15:16:05 -0800
X-CSE-ConnectionGUID: awnVERWzRYaB5hR0e+AAIA==
X-CSE-MsgGUID: Sr/Mn9qpSiG+/gFXpCKmCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="129889341"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2024 15:16:03 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPVB3-0003GD-1F;
	Sun, 22 Dec 2024 23:16:01 +0000
Date: Mon, 23 Dec 2024 07:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 106/107]
 drivers/s390/cio/chp.c:157:8: error: incompatible function pointer types
 initializing 'ssize_t (*)(struct file *, struct kobject *, const struct
 bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *,
 struct kobject *, const struct bin_att...
Message-ID: <202412230729.lM9ZqE9U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   8db3706541f19807373f27aa92d17a30c7092993
commit: dd1c32ee4842fb19b7fc433388b5e6071e135440 [106/107] read/write
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241223/202412230729.lM9ZqE9U-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230729.lM9ZqE9U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230729.lM9ZqE9U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/cio/chp.c:157:8: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long, unsigned long)') with an expression of type 'ssize_t (struct file *, struct kobject *, struct bin_attribute *, char *, loff_t, size_t)' (aka 'long (struct file *, struct kobject *, struct bin_attribute *, char *, long long, unsigned long)') [-Wincompatible-function-pointer-types]
     157 | static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:378:41: note: expanded from macro 'BIN_ATTR_ADMIN_RO'
     378 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_ADMIN_RO(_name, _size)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:369:26: note: expanded from macro '__BIN_ATTR_ADMIN_RO'
     369 |         __BIN_ATTR(_name, 0400, _name##_read, NULL, _size)
         |                                 ^~~~~~~~~~~~
   <scratch space>:62:1: note: expanded from here
      62 | measurement_chars_full_read
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:338:10: note: expanded from macro '__BIN_ATTR'
     338 |         .read = _read,                                                  \
         |                 ^~~~~
   drivers/s390/cio/chp.c:221:1: error: initializing 'struct bin_attribute **' with an expression of type 'const struct bin_attribute *const[5]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:296:15: note: expanded from macro 'BIN_ATTRIBUTE_GROUPS'
     296 |         .bin_attrs = _name##_attrs,                             \
         |                      ^~~~~~~~~~~~~
   <scratch space>:10:1: note: expanded from here
      10 | measurement_attrs
         | ^~~~~~~~~~~~~~~~~
   2 errors generated.


vim +157 drivers/s390/cio/chp.c

e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  146  
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  147  static ssize_t measurement_chars_full_read(struct file *filp,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  148  					   struct kobject *kobj,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  149  					   struct bin_attribute *bin_attr,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  150  					   char *buf, loff_t off, size_t count)
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  151  {
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  152  	struct channel_path *chp = to_channelpath(kobj_to_dev(kobj));
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  153  
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  154  	return memory_read_from_buffer(buf, count, &off, &chp->cmcb,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  155  				       sizeof(chp->cmcb));
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  156  }
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07 @157  static BIN_ATTR_ADMIN_RO(measurement_chars_full, sizeof(struct cmg_cmcb));
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  158  

:::::: The code at line 157 was first introduced by commit
:::::: 2f4b3b83b8c6e798a2e581521f00933d0f9ec777 s390/cio: Externalize full CMG characteristics

:::::: TO: Peter Oberparleiter <oberpar@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
