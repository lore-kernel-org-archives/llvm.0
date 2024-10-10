Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE71D041A;
	Thu, 10 Oct 2024 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592595; cv=none; b=q6lKvYnM4FDUusWWtNS8uF8A6KySr0XEeT1fHltKeC5lD6ExTe3TvsZ3NNFj50fQadaLOlJPvT8RNEYnYttSL4eqUgYEyQSyUQNtTAiHqVentZ9byimO715rpSSzXqNbh9n3+8yrcUPM32XxYE+1FvENpKIHzQ3WT/UMorQJUcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592595; c=relaxed/simple;
	bh=d2Aw5DP9ua7gQuvx1cYA0VH+kutfaRfJs5BI5Z4ra/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIy//404HjM4TlK41S3PZoG2Kqcvl/H9EjiHlJxKfB+vN3k+HsbA86ap0hUF4+uL8BWgAWSF+o7BoBtq+fGIpoMnKY6eKT4df0BzNiCjbCd4qQJzMV2wxb9GKgrCr4ZfoNWdImmDpruEGFClT2x2AhcJ8DEewSeeLKtT1iZ1jxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1z2j5Pz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1z2j5Pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728592593; x=1760128593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2Aw5DP9ua7gQuvx1cYA0VH+kutfaRfJs5BI5Z4ra/A=;
  b=Z1z2j5Pz5TSf9GDw1JRs+WfF3GOYJ5ZO4S6D5XcJq18yaCK+eyh6xhrg
   5XFIxkgjUvPtKLert27P7b9X+QvaxtjtRYy/LSN09PCwX+4jKSQfTYJPK
   GM4LtIVF83Ny4OShq4i81sFO7LkiCbKlaBK1g0ykYNcav9E0KkXMa01rh
   Y9uT9vhB3Ip/wsk2viD+4JFSENjDwaWEeweC+oN0OHh8ltt+48rDubRoA
   9ch62lb+gxJ08agXzuSD8E4J1HHZ1hriWgDlY8yI8P1d9oUBiBk7zYA7g
   RbE3CYibvGBwg8jg5Y0pVqRM9i+LmQjewVfdgWSJMm9W/M4a89F7llohp
   g==;
X-CSE-ConnectionGUID: ADj+ALoLR6WycPOsRJZlew==
X-CSE-MsgGUID: 6gG3L5wfSHKjdPWtvB+cEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28121497"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="28121497"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 13:36:33 -0700
X-CSE-ConnectionGUID: q27T7ruVRLuIqPd/Ge3Qnw==
X-CSE-MsgGUID: Qpc6BGtWT32/i+LJfWsw1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76912561"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2024 13:36:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syztd-000BEj-1k;
	Thu, 10 Oct 2024 20:36:29 +0000
Date: Fri, 11 Oct 2024 04:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:scmi/ffa-transport 1/1]
 drivers/firmware/arm_scmi/transports/ffa.c:117: warning: Function parameter
 or struct member 'ffa_dev' not described in 'scmi_ffa_service'
Message-ID: <202410110427.dXKHEJVt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git scmi/ffa-transport
head:   d613a19181fee0ca12b6b5a9dff302c1207a2e15
commit: d613a19181fee0ca12b6b5a9dff302c1207a2e15 [1/1] scmi/ffa: add a new scmi transport layer based on ffa
config: arm64-randconfig-002-20241011 (https://download.01.org/0day-ci/archive/20241011/202410110427.dXKHEJVt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110427.dXKHEJVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110427.dXKHEJVt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/transports/ffa.c:117: warning: Function parameter or struct member 'ffa_dev' not described in 'scmi_ffa_service'
>> drivers/firmware/arm_scmi/transports/ffa.c:117: warning: Excess struct member 'dev' description in 'scmi_ffa_service'


vim +117 drivers/firmware/arm_scmi/transports/ffa.c

   103	
   104	/**
   105	 * struct scmi_ffa_service - FFA transport private data
   106	 *
   107	 * @dev: Device used for communication with Secure Partition
   108	 * @caps: Supported capabilities
   109	 * @mu: Mutex for protection of @channel_list
   110	 * @channel_list: List of all created channels for the agent
   111	 */
   112	struct scmi_ffa_service {
   113		struct ffa_device *ffa_dev;
   114		u32 caps;
   115		struct mutex mu;
   116		struct list_head channel_list;
 > 117	};
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
