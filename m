Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9D038E5FD;
	Mon,  9 Mar 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095273; cv=none; b=fHiyBhjNGIM0HIvwtsONERdlSZ0g7PleIJVe/qHcxGwnyq2PecPBgCbVotqvhrYOdG1f1R4zkHiHU3DGUeezXbGr4ovwx+H0KROT16dXHBFowpbriPoBKJD9ROHUHdUUhsyQVYd2oAQ5cAhXGdKzjtQTNSl7GNyNPYhcbCXvrZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095273; c=relaxed/simple;
	bh=9Rl2WbM1oZr4JdMPfYF/JEp9M8mukeGeg0b869JAMzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KOqnHDaBogbuoNnHrrlI0bd2R+sJygyH7Zil30Mry3Vz+VtBvwGoqxhZXsi/kHiw09Pn3hePc96l9jh1F/RYMoskq1JX7yPS0xd4bGZGN+NtD0At+d6VKRB0Ixs6Oq3Y6KEh6oQLexT2b2ZZMXmZJijU8wlGKo4qrXFcJ+V4iOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJr97LZ2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJr97LZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773095271; x=1804631271;
  h=date:from:to:cc:subject:message-id;
  bh=9Rl2WbM1oZr4JdMPfYF/JEp9M8mukeGeg0b869JAMzg=;
  b=GJr97LZ2M13d4V4Yu+OdLzDare6cebM9YTAuXu1AwFj4NaunZZClOlLX
   fKzCCV+RpwoPc/1hGiIj5CdcYQzJgO5hM6pPsmIynSWtb8TrS42Fh+8qt
   Tm6r5aad4yssaCA2j68xOMeNnqdfAgcDKFhiyqpL0qYBFl0xAz+GdPL7s
   PKLcD/+SMx+WfuIrkZADXSe+tbSiceJ7TLbhZYT5z0Ji9BnsiXjp9/4C3
   +6Jlqzro3r7DYL8S2hsQAghktF7V9szSk3NkTlia5TqTu6EP/1ZOI6bdB
   dicRj2ZybhJNbFeVFZ8iboXwYE0E/wnzKxF4F6vaVBdwvzNzG9l2fI2hg
   w==;
X-CSE-ConnectionGUID: L7G5ShJBRtWut1Y1JbGG3w==
X-CSE-MsgGUID: a2S5rmP+Quu2wDnwlBO8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73331913"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73331913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 15:27:49 -0700
X-CSE-ConnectionGUID: X2whZEpiTl6xavrknKFNCQ==
X-CSE-MsgGUID: 52MtHrgPRl62pycXqoMgkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224594757"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2026 15:27:47 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzj4j-000000000uQ-18Bp;
	Mon, 09 Mar 2026 22:27:45 +0000
Date: Tue, 10 Mar 2026 06:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Leon Romanovsky <leon@kernel.org>, Maher Sanalla <msanalla@nvidia.com>,
 Edward Srouji <edwards@nvidia.com>
Subject: [leon-rdma:fw-lsm-hook-v2 2/4] security/security.c:5392:1:
 error: expected identifier or '('
Message-ID: <202603100634.gK2y4AYT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git fw-lsm-hook-v2
head:   6ecd3e51800ae840af7be672077ab1e9d0af365e
commit: 59b61e265be95f103df6fa7a195c287b7604dd67 [2/4] lsm: add hook for firmware command validation
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260310/202603100634.gK2y4AYT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100634.gK2y4AYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100634.gK2y4AYT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/security.c:5392:1: error: expected identifier or '('
    5392 | {
         | ^
   1 error generated.


vim +5392 security/security.c

  5375	
  5376	/**
  5377	 * security_fw_validate_cmd() - Validate a firmware command
  5378	 * @in: pointer to the firmware command input buffer
  5379	 * @in_len: length of the firmware command input buffer
  5380	 * @dev: device associated with the command
  5381	 * @class_id: class of the firmware command
  5382	 * @id: device identifier, specific to the command @class_id
  5383	 *
  5384	 * Check permissions before sending a firmware command generated by
  5385	 * userspace to the device.
  5386	 *
  5387	 * Return: Returns 0 if permission is granted.
  5388	 */
  5389	int security_fw_validate_cmd(const void *in, size_t in_len,
  5390				     const struct device *dev,
  5391				     enum fw_cmd_class class_id, u32 id);
> 5392	{
  5393		if (class_id >= FW_CMD_CLASS_MAX)
  5394			return -EINVAL;
  5395	
  5396		return call_int_hook(fw_validate_cmd, in, in_len, dev, class_id, id);
  5397	}
  5398	EXPORT_SYMBOL_GPL(security_fw_validate_cmd);
  5399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
