Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCD22367D5;
	Fri,  5 Dec 2025 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944577; cv=none; b=V1FFrmLjp1Rw5KUEkmpN/ujdNdxXohDD6NKqME3iNo29K5R9pH1sNqLzWsQx9aq5YfKu/DSihod+VU7tC3SlooN44LxLGKYt/6zejf64k5Nx6UGE+vuVa+xcqvClZzbNOh7wSDYc4hlvkmYzK9hywHD26B7oGf8yTEpUXMX0j/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944577; c=relaxed/simple;
	bh=q+tBDgWevp++ehnFpn2sjIn3HSrTRq3bDnmM847iVnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGDXRS6+OKrRYm4JkuVXLjI7PW6ehRjxMfUgwk9KAzrZwVqrqsv7lXEDRTM1hvuz7SPCWiOCyEFnlM69XfR7NwyVf3xFcuNHL4cDRH4ITmWiLzokT6FgtU58ah5D+kVRaEuFkUeq+R4KoOxKz2E92uHwjGJ/S6u8yrABiDfEK7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2MYA5Pl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2MYA5Pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764944574; x=1796480574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q+tBDgWevp++ehnFpn2sjIn3HSrTRq3bDnmM847iVnM=;
  b=g2MYA5PlSFC5nMG7ll6ShiTvFaPk8KyfQ0dC3Pa3WoMtohg5SJlEsX3I
   vjBKBnz5acQwAXNHrw0KgdWObdE2ynyoLKYgdrhSzr7NSxw3Oy2h0KIjn
   M7GQZGkpsa0dmapdi440Xp6L98uKyiBiXhQ64LzRFx1rHadiGRdUIUOmG
   NIx3Eor00RrI86qOpg+hZCX9w+IODJ9MSK+vj+AL3+W58tvkThvbtHM/U
   fstdjafv+hwPJ2zDdgOQIE6CMBx7ZzBHQbg27yXk8ZBoOuFUjimJwcwuo
   NY7fHjC0Ba6hLqGJ6pI6+R2oo9pmb0oseDfX34tfnZPIQP5CSNZjQdQPD
   Q==;
X-CSE-ConnectionGUID: auzCX49kQAmy+f2hiY55+A==
X-CSE-MsgGUID: CKGOCYkIRA2TVYoLWxeCVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78328470"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78328470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 06:22:51 -0800
X-CSE-ConnectionGUID: s9ZYal9aSIu9Wq7Fu5Mcqg==
X-CSE-MsgGUID: GV9enmlMQCibXRvIwZm5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="199491288"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2025 06:22:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRWhs-00000000F4D-01Aj;
	Fri, 05 Dec 2025 14:22:48 +0000
Date: Fri, 5 Dec 2025 22:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] netconsole: Plug to dynamic configfs item
Message-ID: <202512052219.nHgf3wdu-lkp@intel.com>
References: <20251202-configfs_netcon-v1-2-b4738ead8ee8@debian.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-configfs_netcon-v1-2-b4738ead8ee8@debian.org>

Hi Breno,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e538109ac71d801d26776af5f3c54f548296c29c]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/configfs-add-kernel-space-item-registration-API/20251202-233234
base:   e538109ac71d801d26776af5f3c54f548296c29c
patch link:    https://lore.kernel.org/r/20251202-configfs_netcon-v1-2-b4738ead8ee8%40debian.org
patch subject: [PATCH RFC 2/2] netconsole: Plug to dynamic configfs item
config: hexagon-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052219.nHgf3wdu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052219.nHgf3wdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052219.nHgf3wdu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/netconsole.c:231:1: warning: non-void function does not return a value [-Wreturn-type]
     231 | }
         | ^
>> drivers/net/netconsole.c:1892:10: error: no member named 'group' in 'struct netconsole_target'
    1892 |         if (nt->group.cg_item.ci_dentry)
         |             ~~  ^
   drivers/net/netconsole.c:1893:33: error: no member named 'group' in 'struct netconsole_target'
    1893 |                 configfs_unregister_item(&nt->group.cg_item);
         |                                           ~~  ^
   1 warning and 2 errors generated.


vim +1892 drivers/net/netconsole.c

  1888	
  1889	/* Cleanup netpoll for given target (from boot/module param) and free it */
  1890	static void free_param_target(struct netconsole_target *nt)
  1891	{
> 1892		if (nt->group.cg_item.ci_dentry)
  1893			configfs_unregister_item(&nt->group.cg_item);
  1894		netpoll_cleanup(&nt->np);
  1895		kfree(nt);
  1896	}
  1897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
