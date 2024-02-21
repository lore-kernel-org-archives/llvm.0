Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616AF7FBB2;
	Wed, 21 Feb 2024 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708526467; cv=none; b=ZquJNgrS7K+VSHIhepNFbVUpEr3gAv4yT2zcek8K7Fnx9pboRvur7WgWJ7PS1bBKzM/hJHrmgzcjaDfhbVVJr0CkVEv5vYhx2KziI3f7iCziFA0EcV8vSjIlIyytygwviejZMy27fDGpAVIc0dOPi3sFcgxg5PxNjYXqwjMtW54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708526467; c=relaxed/simple;
	bh=QnHhlO2Ltz+C4UWOZtQO0HpQdNmddWzbb878w4DoRMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aykiy9PDOZ5VkkYCA10tgotn/GWe4YG/0MH8/7OsCXu1FoGmlVoXz50pkdGyWRvJFN64Ki5Fd1XYdIvNYosab5/6J/1Y9ih5SPa9MrMLG+QY0vdzi/uZ7CAE/3bKvwrvHRuRHzW0wyMQAHiAK18Lsn7T9Stecc/BkuYtJapqNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Blw0Jy2c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Blw0Jy2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708526465; x=1740062465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QnHhlO2Ltz+C4UWOZtQO0HpQdNmddWzbb878w4DoRMM=;
  b=Blw0Jy2cW4QbQuDBdQexL/r/3xynyIUigc7BSDTqvjE88bxLVZOCkrhF
   0fpBN3G+Sjh4zF/75e6ZqiCv64+aA2WUN4lvXm8YUquG0YlXEuMREk45u
   juJgro3hJVEBK5aB+VOhntDwZgBXv8WWAGuIVh8RdHm2Qzo+BVCNDv5ck
   y9A1ZfMILNAIZPuWk4uGDXHtD5Mf1m6UZ0ulq8rJhMHwjZr5YJz6YK1hK
   4pZG7CvipkgaEuxQC9Ar6XrAL5gmWFVcRbnp7jhFRG1/iYeIMFftTLELm
   FRDilguYYdArVmjC2rOQ6FW1x++CeikvUOnCqUOPfFPYzKYcTp2aNGLhk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14098709"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14098709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 06:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9850125"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Feb 2024 06:41:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcnmF-0005Pc-26;
	Wed, 21 Feb 2024 14:40:54 +0000
Date: Wed, 21 Feb 2024 22:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>
Subject: [gmprice:weighted_interleave-next 6/6] drivers/base/node.c:220:16:
 error: use of undeclared identifier 'ACCESS_COORDINATE_CPU'
Message-ID: <202402212259.mzfa2fFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux weighted_interleave-next
head:   8e917672b7b0fd84a6d95297abf937b61cc16015
commit: 8e917672b7b0fd84a6d95297abf937b61cc16015 [6/6] mm/mempolicy: introduce system default interleave weights
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240221/202402212259.mzfa2fFm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212259.mzfa2fFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212259.mzfa2fFm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/node.c:220:16: error: use of undeclared identifier 'ACCESS_COORDINATE_CPU'
     220 |         if (access == ACCESS_COORDINATE_CPU) {
         |                       ^
   1 error generated.


vim +/ACCESS_COORDINATE_CPU +220 drivers/base/node.c

   187	
   188	/**
   189	 * node_set_perf_attrs - Set the performance values for given access class
   190	 * @nid: Node identifier to be set
   191	 * @coord: Heterogeneous memory performance coordinates
   192	 * @access: The access class the for the given attributes
   193	 */
   194	void node_set_perf_attrs(unsigned int nid, struct access_coordinate *coord,
   195				 unsigned int access)
   196	{
   197		struct node_access_nodes *c;
   198		struct node *node;
   199		int i;
   200	
   201		if (WARN_ON_ONCE(!node_online(nid)))
   202			return;
   203	
   204		node = node_devices[nid];
   205		c = node_init_node_access(node, access);
   206		if (!c)
   207			return;
   208	
   209		c->coord = *coord;
   210		for (i = 0; access_attrs[i] != NULL; i++) {
   211			if (sysfs_add_file_to_group(&c->dev.kobj, access_attrs[i],
   212						    "initiators")) {
   213				pr_info("failed to add performance attribute to node %d\n",
   214					nid);
   215				break;
   216			}
   217		}
   218	
   219		/* When setting CPU access coordinates, update mempolicy */
 > 220		if (access == ACCESS_COORDINATE_CPU) {
   221			if (mempolicy_set_node_perf(nid, coord))
   222				pr_info("failed to set node%d mempolicy attrs\n", nid);
   223		}
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
