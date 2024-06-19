Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5AB200AE;
	Wed, 19 Jun 2024 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718814615; cv=none; b=gwGYzRbcx2pD2PXwR5I22XMi8awvKPaV4G6itZKh2/lKPHt+1VHgFvBKSvGKja343yQI7elUcEPtNf2WPfl9u7yNV0WbW3/741T4XRquiTkrzx62DJJNwtTJ24ia7Bh2VbwWskPw9o5i7rv8oUCGo2L9FnPDWsT3AqS/1Mo92ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718814615; c=relaxed/simple;
	bh=ctGlVZ7ZYopczp/5/cWxv4yGNvua3Q0ZsbBCig0yZmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pMf8D//v9/kfNLmYkeeFUI4mC0SErkFvM9a9ftHnmtCkp12AW3kXW309HdYOgA07C6kHNChtkz13nZsOpMGCczfnG8tAHiLXhu8cwf7Zo8eC8Q30E9o1gyufE+WU97gfj0T7uHCECy1mvajJNxjYoBD48VcPpnLz8/T1QrZzrI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UA5P7rLq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UA5P7rLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718814614; x=1750350614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctGlVZ7ZYopczp/5/cWxv4yGNvua3Q0ZsbBCig0yZmc=;
  b=UA5P7rLqug9JmxzK2VkGTUtfU+LiNB3C0pR5qxS8p1QmFuqqk4dEhAJe
   0zcDHD7QuOKU71cAQm160F9B+vw8NEjyHo0MTzuPBaErxGB24BfDx7Zqr
   Q5zGzLLg66i3gozdmyIKHrWEmPFq2GySRRwYcaW0U00GIMijveWvO7F1N
   1zPli43ghgKZb6bJfxVDsl/jiRcVRWGOpoN9RuoITxhJ28TjW/i34GYor
   LSnZWAU5LZqoTsh8w1gua7orOf6fqVwHNR6v1O5h6e9n4rJ93RrcvyLSu
   eIluqAoQBwNe9caCSnKnvwaurepnaWNRMECYubRMZaWnqJ7Uwsfzxgk3j
   A==;
X-CSE-ConnectionGUID: kML4/BW6TN6DJEhuZB0NTA==
X-CSE-MsgGUID: aHmahklfS6aXnGKD40zIbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26886411"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="26886411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 09:30:13 -0700
X-CSE-ConnectionGUID: jZrMQ6vzQhiAvj/VOllxow==
X-CSE-MsgGUID: +Hvi2l0kQryaveAyUqWITQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="79451555"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jun 2024 09:30:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJyCH-0006lK-1X;
	Wed, 19 Jun 2024 16:30:09 +0000
Date: Thu, 20 Jun 2024 00:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Danielle Ratson <danieller@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 35/41] net/ethtool/netlink.c:57:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202406200004.1h5efOk5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   b9b26ca93d65953c7e01c7369498f6a82f660425
commit: f03d36275736ad36e56f9ce5b34553e495ef5231 [35/41] ethtool: Add ability to flash transceiver modules' firmware
config: x86_64-buildonly-randconfig-004-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200004.1h5efOk5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200004.1h5efOk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200004.1h5efOk5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethtool/netlink.c:57:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
      57 |         default:
         |         ^
   net/ethtool/netlink.c:57:2: note: insert 'break;' to avoid fall-through
      57 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +57 net/ethtool/netlink.c

    49	
    50	static void ethnl_sock_priv_destroy(void *priv)
    51	{
    52		struct ethnl_sock_priv *sk_priv = priv;
    53	
    54		switch (sk_priv->type) {
    55		case ETHTOOL_SOCK_TYPE_MODULE_FW_FLASH:
    56			ethnl_module_fw_flash_sock_destroy(sk_priv);
  > 57		default:
    58			break;
    59		}
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
