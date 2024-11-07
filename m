Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3CD1EC011;
	Thu,  7 Nov 2024 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975352; cv=none; b=aOrWR5mER61YLpo5I5EQ6oyRUeTSoK/POISxXMmAgpTnW16GqtjZPRChkn7sO57uYoE5/qUCBYWbzOX9MnOMBOPMN68l4u2DQFIK8FgWFVPa2/YHd5LWJCaMQBez3R/DuOgdzxoKEhugggaHrvtNZ9glADgNUAE8vG6xIh8QXrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975352; c=relaxed/simple;
	bh=gzY4iRQXNJKf9ytRnhAtkzrTNWnRl7wvgqscZ1J086U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrwUrVso7DvHaatHNKwhGZ58/lCeSYIGYpbCVNm09DzBljrQ2A8RGNGMG3NDtXAgJD+1eb2f4PvEJoW8Pe+5D6eMPrLv1N+PKATnJuGW0K6p59xNK9uUtgmMbPwff7nq/6T+hHKQi8YG5o/om6BiC/hJXnyOL0rdO09AbJ6pSrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AiduRBIe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiduRBIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730975351; x=1762511351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gzY4iRQXNJKf9ytRnhAtkzrTNWnRl7wvgqscZ1J086U=;
  b=AiduRBIek3K+C6UYWRWQKWQb/bxTdwQniTVaXKeA72XPlCb2QObuid8M
   nuqk5qWDE5QtLWi4T1xAHebx3coFWhJXdne+uB1PZXuc9wWJ0jPMd2Icl
   v+xspRxNINjpSmC67qNXp5TAhhcM/F6KfyS73qaEWZajQRDHmbo63fzOd
   QCiwWUsn7I6JtMgfU0gvsyZcEm3A7n6qzK66ZqNn5FsA9dawq/z7Wpe8n
   uOD6g2n1Xt9Su0Gy6nsUPXVJhY/kDbc8yJccAl/cjC4FpYiZdpOwRdJvS
   FYfrEeBto9v1l2HWHiTUaBbbyFFjMkLfcOXjtwONnctQZXA4SuaJT6Xet
   g==;
X-CSE-ConnectionGUID: 1KOsq9aGSZuAZ7DWNQbPWQ==
X-CSE-MsgGUID: aAc8c2psQ+u2bUkihXZicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41427908"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="41427908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:29:07 -0800
X-CSE-ConnectionGUID: 0N3zud1DSDq6XADPT36x4w==
X-CSE-MsgGUID: krUv5L3KQVmPtwdRZOh0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="90142173"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 02:29:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8zl9-000q5y-2P;
	Thu, 07 Nov 2024 10:29:03 +0000
Date: Thu, 7 Nov 2024 18:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 16/20] ACPI: platform_profile: Make sure all profile
 handlers agree on profile
Message-ID: <202411071827.sHhBsmEW-lkp@intel.com>
References: <20241107060254.17615-17-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107060254.17615-17-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d68cb6023356af3bd3193983ad4ec03954a0b3e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-platform-profile-Add-a-name-member-to-handlers/20241107-141001
base:   d68cb6023356af3bd3193983ad4ec03954a0b3e2
patch link:    https://lore.kernel.org/r/20241107060254.17615-17-mario.limonciello%40amd.com
patch subject: [PATCH v5 16/20] ACPI: platform_profile: Make sure all profile handlers agree on profile
config: x86_64-buildonly-randconfig-004-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071827.sHhBsmEW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071827.sHhBsmEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071827.sHhBsmEW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/platform_profile.c:372:12: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
     372 |         if (i < 0 || PLATFORM_PROFILE_CUSTOM)
         |                   ^
   1 warning generated.


vim +372 drivers/acpi/platform_profile.c

   354	
   355	/**
   356	 * platform_profile_store - Set the profile for legacy sysfs interface
   357	 * @dev: The device
   358	 * @attr: The attribute
   359	 * @buf: The buffer to read from
   360	 * @count: The number of bytes to read
   361	 * Return: The number of bytes read
   362	 */
   363	static ssize_t platform_profile_store(struct device *dev,
   364					      struct device_attribute *attr,
   365					      const char *buf, size_t count)
   366	{
   367		int ret;
   368		int i;
   369	
   370		/* Scan for a matching profile */
   371		i = sysfs_match_string(profile_names, buf);
 > 372		if (i < 0 || PLATFORM_PROFILE_CUSTOM)
   373			return -EINVAL;
   374	
   375		scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
   376			ret = class_for_each_device(&platform_profile_class, NULL, &i,
   377						    _store_class_profile);
   378			if (ret)
   379				return ret;
   380			ret = class_for_each_device(&platform_profile_class, NULL, NULL,
   381						    _notify_class_profile);
   382			if (ret)
   383				return ret;
   384		}
   385	
   386		return count;
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
