Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2AB16BE3A;
	Sat,  1 Mar 2025 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740803454; cv=none; b=avORb4iBCRkojDnkBxnC0Z+/pO33hZHriTVH2zuvRyh32LmhoS85o9rVVYa/xTcmGYfIn40y/UegxCKme4aIhqgQ3Q7Th9tOocbSj17ROivl+dsAKgTfRgEx/4Mb0oU6BNKD2mDtgxWgA6dC9EB7/i0cUY8Q22cUBRfKUIucpSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740803454; c=relaxed/simple;
	bh=Sq12mUDvBi6g6JffGdCJCg+ghGBFtT4aMWUM9WuN0E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHeYCsuEkDmG7nIDfKMT1U1XpwRYCpGzLt+SbOLEEys7p2fIlTL+1bb4tC9ltAV39SjxY8oS3565wpcPw6s6JMjECmfdy5iiDENd3DpqIsDQLiWZzj3YAaXUNy+mf4HveiaJ8XW3v36M754PD2+wk9Uyb+1pqVpU2ECVcE8RisY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBw6Foqa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBw6Foqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740803453; x=1772339453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sq12mUDvBi6g6JffGdCJCg+ghGBFtT4aMWUM9WuN0E8=;
  b=lBw6FoqaW7dvKqvSmLl0pbLC9sC/o4lTZdTaRZ5ll5s3q0q3235LjURW
   eLubdPKQA0jVtmt4L34SrtLDMagVawZKIDCb89fL/6y8hFTB7jbnBmO83
   9kFI9PoCBs3BRfvKNkTWE8PWBhcyGzMkO8b2dIjNJMOgrsCJZoFppZehh
   vikA/KnKZxxcvpe80J3tVWA5nYpdBTD0TkEAKKr+fvJ6Y/kbKc91rSYGi
   2xMOPMl4nPv2LA6Ikz3MIk/grvNPyrx182v5CL2zppURBFPn59SKD91wV
   hqezjrB1yHKX5u4s/cvVGQDUOtGje6StLzizqOKejUDmLmGn3yZ2KT50D
   g==;
X-CSE-ConnectionGUID: OgMbcKqKSKOn3eDLBkYh4w==
X-CSE-MsgGUID: RDvwqq6MRhC9L3bzFVol/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41861896"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="41861896"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 20:30:50 -0800
X-CSE-ConnectionGUID: QpR67C3eRiWDNPeI1/MB5A==
X-CSE-MsgGUID: Kkla+EXHR/iiFtwl31OP7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="118008903"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2025 20:30:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toEUx-000FrO-1h;
	Sat, 01 Mar 2025 04:30:47 +0000
Date: Sat, 1 Mar 2025 12:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2357/7423] drivers/bluetooth/hci_vhci.o: warning:
 objtool: .text: unexpected end of section
Message-ID: <202503011220.Y2e5vz4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ethan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 3b147be9ef08247bb74a801b4e95f9a626a27322 [2357/7423] hamradio: baycom: replace strcpy() with strscpy()
config: x86_64-buildonly-randconfig-006-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011220.Y2e5vz4w-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011220.Y2e5vz4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011220.Y2e5vz4w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/hci_vhci.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
