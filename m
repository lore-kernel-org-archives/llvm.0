Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8E15B0F9;
	Wed, 24 Jul 2024 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837197; cv=none; b=dvoTu+eVKuWdsfMWDi/7eMM7J0PEeAKTr6pJWTyRdEwN21npZIQxLv9Gb8/kVAqI7mQ2fzetQjs1CfKZLjoiPSW/cppZLwNKag4z3ICTjOfaGqyRt2KQm6IjKWB2EU/lUbTWTGQwsmVr2AmIlRKAAlDzVsksXmWSj8dIvNO2AzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837197; c=relaxed/simple;
	bh=NPCxAH+Z+vxCSHt+2RXorRffJ/MEhhCvz9nVF9+y4ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYBebrfckWCZQEbAgERI6IqF3/MJ92ezsyARESaKjkwG8pvd0sLVO7RJXwdW8UH8L1/kihi7EmXYJ+pvSOHUGDESTvWVU/S/6TyqIWjQ9gl4Cx/5TRec2V8HT0hl/aWrARPsRKROcTUm8DKxFmfyyR4Q7Ar4Oow+ELKUn1gW/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApG3sTZj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApG3sTZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721837196; x=1753373196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NPCxAH+Z+vxCSHt+2RXorRffJ/MEhhCvz9nVF9+y4ek=;
  b=ApG3sTZjuzxS4mOSsr/xc+Ztqsvi/1b3I5kEalRmbDlgqNhyGJxNVEAG
   FRe8Bk+cTFKZZezBx22zWSgpS2AU41HeYpXR5Xr+8E3ekyorgrRcZm9xR
   84UYG/JnaKgY/OZHYxRZcmxqzVX497n0vz3xsyIoEMgagYSF6hg4Kj4hn
   deQ7uY3MQVLFazOB9dxFl9sVndAeQ46KiQ2BZyBMwgKhWqd0jxgnkct7i
   rHykVr3T74VEEhHJb0oR2wPicU96MjCulF+8BvQJfThllYWxqn4/A6lM5
   Q+QFA3ms/Y0tKJvFgAZ75c12NbljZQLzTRmVYRBLKckau9HHA37SQ2sE1
   w==;
X-CSE-ConnectionGUID: QWago4YySOCWvLXUf0IkXw==
X-CSE-MsgGUID: WTkEFg+eT4C/99+/kdhejw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19654171"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19654171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 09:06:32 -0700
X-CSE-ConnectionGUID: NJ64F9jORKOlDrjbsCuwzQ==
X-CSE-MsgGUID: g4j9/42VRvOetP7uWvPXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="56778915"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2024 09:06:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWeVT-000nAG-2z;
	Wed, 24 Jul 2024 16:06:23 +0000
Date: Thu, 25 Jul 2024 00:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.fcntl 2/3] fs/smb/server/smb_common.h:46:9:
 warning: 'F_CREATED' macro redefined
Message-ID: <202407242308.vYILkXH2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.fcntl
head:   58956814948ce62e0573fd2eee77578251a09996
commit: 261896aabb381781033d868e9ad9f6a38d90f1b2 [2/3] fcntl: add F_CREATED
config: i386-buildonly-randconfig-004-20240724 (https://download.01.org/0day-ci/archive/20240724/202407242308.vYILkXH2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242308.vYILkXH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242308.vYILkXH2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/server/smb2misc.c:9:
>> fs/smb/server/smb_common.h:46:9: warning: 'F_CREATED' macro redefined [-Wmacro-redefined]
      46 | #define F_CREATED       2
         |         ^
   include/uapi/linux/fcntl.h:20:9: note: previous definition is here
      20 | #define F_CREATED       (F_LINUX_SPECIFIC_BASE + 4)
         |         ^
   1 warning generated.
--
   In file included from fs/smb/server/mgmt/share_config.c:17:
   In file included from fs/smb/server/mgmt/user_session.h:12:
>> fs/smb/server/mgmt/../smb_common.h:46:9: warning: 'F_CREATED' macro redefined [-Wmacro-redefined]
      46 | #define F_CREATED       2
         |         ^
   include/uapi/linux/fcntl.h:20:9: note: previous definition is here
      20 | #define F_CREATED       (F_LINUX_SPECIFIC_BASE + 4)
         |         ^
   1 warning generated.


vim +/F_CREATED +46 fs/smb/server/smb_common.h

363999901116ff fs/ksmbd/smb_common.h Namjae Jeon 2021-09-24  42  
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  43  /* Responses when opening a file. */
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  44  #define F_SUPERSEDED	0
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  45  #define F_OPENED	1
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16 @46  #define F_CREATED	2
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  47  #define F_OVERWRITTEN	3
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  48  

:::::: The code at line 46 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
