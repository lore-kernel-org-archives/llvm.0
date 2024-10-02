Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFAE637;
	Wed,  2 Oct 2024 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727837507; cv=none; b=tyAnUqFlaI3ToeSpPrkQbrKiLtjQsBxDoyc1fs9idO4kabSTgjWk6ARyxnV6gAcjhGKQMJsGzaxExbc5nQL24/hiFEwwNvcygAa6hlrtqIKkAEom3vI90rS4WCC7AKQgNf2xMGlXEU/LpcyugWTGDTNgKwwGjdWvWa0svSVxNfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727837507; c=relaxed/simple;
	bh=B+FUZuFWxYHvLYyyWVyTt1B22q82J5LHg9jh2CAQat8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkCElpFlilNdYWpmoRQBYYdRElaL3fx6qZ4uw9xhSsGZNx/UEDG2m7W4snstMoVDQXICDesMpROsyL1c2bj0J1yPYk4iwoiNq8nBSoKBbAJBb5jlJ8acnCNxZUK9LSKQRwUFjQLudBqSZfWtIpGuNpSd1vINv2WWBVmeRmCy6PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG+J4jkN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG+J4jkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727837506; x=1759373506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B+FUZuFWxYHvLYyyWVyTt1B22q82J5LHg9jh2CAQat8=;
  b=VG+J4jkNm8aRkKIkuvqEqIpzmmE3RGcddlDIrPp5sW/iSUtQdhyn0laF
   5HvZ82qI5wW7JtgquecFBWqG/lQ+sc80E/G89eUojPZdofght8+ukUZY+
   +QfOMzfMaV/gluFdnc/CfWx3k2fYfM29otgHD31wLER9RoSguTHYzRCp2
   Ok0h4GyiZ6edE5qj4WU+vP2tBNwvTtrqpeO2AfJxzI/ebiyto+cvYR3rd
   ZY/59msFF3Ud38qcluHFL4/TplN9C0Q+raMemR8amJXaU37qx0AnrV1T1
   XO8LkD9V6LzipAzPY/WggFX2ks2U/U0etFZ2f/XPhR5EjNWpIdYIKT+1K
   A==;
X-CSE-ConnectionGUID: PQ/KLTyISgC69x1Jm7y8bg==
X-CSE-MsgGUID: rJ1NGKKnTZ+UVugVEl0gDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="29873728"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="29873728"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 19:51:45 -0700
X-CSE-ConnectionGUID: +KwYc8hdRJW79bCl5SSmcA==
X-CSE-MsgGUID: vFg15c4qTG+mpTH8OaI5pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78845568"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2024 19:51:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svpSn-000RSV-0d;
	Wed, 02 Oct 2024 02:51:41 +0000
Date: Wed, 2 Oct 2024 10:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:memblock_align 1/3] WARNING: modpost: vmlinux:
 set_memory_block_size_order: EXPORT_SYMBOL used for init symbol. Remove
 __init or EXPORT_SYMBOL.
Message-ID: <202410021006.WAvhWHt6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux memblock_align
head:   cfea4dee5d4cf39fa5f13e25ae6c3a07fcec413e
commit: 91b1c5360c957b61ccfaa26318b308032ab25979 [1/3] memory: wire up a weak stub for set_memory_block_size_order
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241002/202410021006.WAvhWHt6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021006.WAvhWHt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021006.WAvhWHt6-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: set_memory_block_size_order: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
