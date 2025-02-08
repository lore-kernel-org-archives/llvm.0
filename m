Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF1C1F3B97;
	Sat,  8 Feb 2025 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739034637; cv=none; b=o2EyYM2IJZrZ9HWjyffftELRy0MhVd0aYq5CIzGj34tVaPF/AhavVrW5M5aEz6utk6a2v3OBo7o8zUqomz9IEsCHYRtU2M+64GnvJt5h8GV+uPXigqt19CIhHMVnzTvCLw6k6aVBKz41ww0nm40jUrz2A74860wfHmOeaYUoAvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739034637; c=relaxed/simple;
	bh=bkfIF4AQ4n0bpyCeGoHYqeCHse3Cf7s+TMyVifTUq1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RjfvXsDwpajttfFcU/mh9a5OKeUllB+z9Icz51OScVG1rXcrAKa37pnCT0n0n45XQYfUSRaxvMVOujDuxxgt9gDn3Xln8E7v9h6AUZVtcy7opKEQUKKul+eRfTnt1Ngo9gNLeMnLR3RmRmyfKHn+QfUfNtw1UbmXaBzUmHHh1G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfFppRVf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfFppRVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739034636; x=1770570636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkfIF4AQ4n0bpyCeGoHYqeCHse3Cf7s+TMyVifTUq1w=;
  b=DfFppRVfjzK3tKEsMdke2wCkNsB9vdHU5+iC6rki3CuPjQYIA8mMRCa/
   Rkw132ZvhoM+nGG9ukeRbuyisouTNdqxlzlREvLZdzIwqjDQgoAz/LTTv
   yYGnC+3lJDG+vJjtrVVmkgzn2ble/mFdS0ntzq+ni1HwdiGcSt6fEdyW9
   ucb/YAFOgje5Cr5XeYMFUfYEA0Gqk5ifscNqn2APViKgNLfdfo7EApm+K
   dCqRLG2V8OezVyyDOEeqqBhDnvYc0Omin22thM/eJFLtAAGsnh3zWGHFM
   BuTaGrqsWXd6vNLTnIv28iJ5OebEQwiZIKjHMApUvz+wods42wE6DZQeQ
   A==;
X-CSE-ConnectionGUID: H3lQAW40SdyYQmVno1FLGw==
X-CSE-MsgGUID: sdNVOewbQQKei0CqOrqpOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51090614"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51090614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 09:10:33 -0800
X-CSE-ConnectionGUID: lce/3GB4QSeTn9TXRVG22Q==
X-CSE-MsgGUID: oCSzy4enSVydCE1YFlQi8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148998675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Feb 2025 09:10:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgoLc-0010Ox-2f;
	Sat, 08 Feb 2025 17:10:28 +0000
Date: Sun, 9 Feb 2025 01:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: [broonie-sound:for-next 6/13] sound/soc/codecs/cs35l41.c:1166:10:
 error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202502090100.SbXmGFqs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   f3a0dfda57f208c90c8c73f3bee2e8390f585b1f
commit: 1d44a30ae3f9195cb4eb7d81bb9ced2776232094 [6/13] ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available
config: arm64-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090100.SbXmGFqs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090100.SbXmGFqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090100.SbXmGFqs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/cs35l41.c:1166:10: error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1166 |                         hid = acpi_device_hid(adev);
         |                               ^
   sound/soc/codecs/cs35l41.c:1166:10: note: did you mean 'acpi_device_handle'?
   include/linux/acpi.h:857:27: note: 'acpi_device_handle' declared here
     857 | static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
         |                           ^
>> sound/soc/codecs/cs35l41.c:1166:8: error: incompatible integer to pointer conversion assigning to 'const char *' from 'int' [-Wint-conversion]
    1166 |                         hid = acpi_device_hid(adev);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/acpi_device_hid +1166 sound/soc/codecs/cs35l41.c

  1150	
  1151	static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
  1152	{
  1153		struct acpi_device *adev = ACPI_COMPANION(cs35l41->dev);
  1154		acpi_handle handle = acpi_device_handle(adev);
  1155		const char *hid;
  1156		const char *sub;
  1157	
  1158		/* If there is no acpi_device, there is no ACPI for this system, return 0 */
  1159		if (!adev)
  1160			return 0;
  1161	
  1162		sub = acpi_get_subsystem_id(handle);
  1163		if (IS_ERR(sub)) {
  1164			/* If no _SUB, fallback to _HID, otherwise fail */
  1165			if (PTR_ERR(sub) == -ENODATA) {
> 1166				hid = acpi_device_hid(adev);
  1167				/* If dummy hid, return 0 and fallback to legacy firmware path */
  1168				if (!strcmp(hid, "device"))
  1169					return 0;
  1170				sub = kstrdup(hid, GFP_KERNEL);
  1171				if (!sub)
  1172					sub = ERR_PTR(-ENOMEM);
  1173	
  1174			} else
  1175				return PTR_ERR(sub);
  1176		}
  1177	
  1178		cs35l41->dsp.system_name = sub;
  1179		dev_dbg(cs35l41->dev, "Subsystem ID: %s\n", cs35l41->dsp.system_name);
  1180	
  1181		return 0;
  1182	}
  1183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
