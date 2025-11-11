Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB733D6D5;
	Tue, 11 Nov 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762892722; cv=none; b=kF8ZvF20yA/WsLkyNEprTW9cLYjjx8FUnZzdWh2zUtN7hHLRUg9MI+0Ls7+W2sBpvualJTuefr2WJ0nenWGT3MnaL8LNgrA74Eh16EISar8lx+Fxjdo3w5G7sQ9vfjHPuJGsXP/Os/x0ajvRen/g55wbR1fBI49F6YxMeSbhPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762892722; c=relaxed/simple;
	bh=UEEnSh/DX9bjiun+0G96k8qEzyERWkWdEd5NiXR9Z4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3hw98GhzlsDg9Db2DLhjpNF5+etffSF9tZLOyyI6Kc6RheU5jSyPDBo9QIpk8UBPHPgj/dXkbbxdNrNn3yORuwYP8QJTnVq8axFyyQzFTSsGpSxq8GDJza1d2CUHelwLGLL+L76mQJDMFBwXXemju16+NORdK7Nl+E7D9au36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bv88J3pI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bv88J3pI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762892720; x=1794428720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEEnSh/DX9bjiun+0G96k8qEzyERWkWdEd5NiXR9Z4M=;
  b=bv88J3pICQY3tH8qTkWWOZxp+jpw4wfy6ZrK4iPz1ZHyfc+d9COF8cfB
   PRcakCBGi4sDSlPIDTunHhY4Qp02YGvREKA0/Hpdhv2jPjkjYBorxGF41
   kw7KfroPvPZ4pdgIIXMjnJRJmXh+31IV0MgJHZQmC33aKs245w1j3S9HL
   3Xyjxnepra8mZvQ6BcogxjbVEGuVBsbPtTHhXWHDDv7JAY/AzkzmROwYZ
   ZPL/UpYmK1Ubm9HM/tpYWvdpZsWJB0agWHL62rUbxebIQWiRpLbuq2sTD
   6IwS2QifyPDoS5NmctEbJM9M/MZrNHi6WqVgwgFTOkOHVaYIhqQ/thkcR
   Q==;
X-CSE-ConnectionGUID: T4gTaFwCRie15hQWbHXd4g==
X-CSE-MsgGUID: Q+yzp2aGQ9WZiAl2a8VH6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64994007"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="64994007"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 12:25:19 -0800
X-CSE-ConnectionGUID: OKIhdlTsR2SJjS8+Hvc4wQ==
X-CSE-MsgGUID: +xOVMOvPQxGm1/jtZ4mMfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188687157"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2025 12:25:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIuvU-0003YB-0E;
	Tue, 11 Nov 2025 20:25:16 +0000
Date: Wed, 12 Nov 2025 04:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Maher Sanalla <msanalla@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Michael Guralnik <michaelgur@nvidia.com>
Subject: [leon-rdma:rdma-next 73/73] drivers/infiniband/hw/mlx5/main.c:517:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202511120432.QQbCnKMO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   52d63c47ac62a5c07bc4da971723794a06318dc1
commit: 52d63c47ac62a5c07bc4da971723794a06318dc1 [73/73] RDMA/mlx5: Add support for 1600_8x lane speed
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251112/202511120432.QQbCnKMO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120432.QQbCnKMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120432.QQbCnKMO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/main.c:517:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     517 |         default:
         |         ^
   drivers/infiniband/hw/mlx5/main.c:517:2: note: insert '__attribute__((fallthrough));' to silence this warning
     517 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/infiniband/hw/mlx5/main.c:517:2: note: insert 'break;' to avoid fall-through
     517 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +517 drivers/infiniband/hw/mlx5/main.c

f1b65df5a232a2 Noa Osherovich    2017-04-20  436  
639bf4415cadff Aharon Landau     2020-09-17  437  static int translate_eth_ext_proto_oper(u32 eth_proto_oper, u16 *active_speed,
08e8676f160792 Aya Levin         2019-02-12  438  					u8 *active_width)
08e8676f160792 Aya Levin         2019-02-12  439  {
08e8676f160792 Aya Levin         2019-02-12  440  	switch (eth_proto_oper) {
08e8676f160792 Aya Levin         2019-02-12  441  	case MLX5E_PROT_MASK(MLX5E_SGMII_100M):
08e8676f160792 Aya Levin         2019-02-12  442  	case MLX5E_PROT_MASK(MLX5E_1000BASE_X_SGMII):
08e8676f160792 Aya Levin         2019-02-12  443  		*active_width = IB_WIDTH_1X;
08e8676f160792 Aya Levin         2019-02-12  444  		*active_speed = IB_SPEED_SDR;
08e8676f160792 Aya Levin         2019-02-12  445  		break;
08e8676f160792 Aya Levin         2019-02-12  446  	case MLX5E_PROT_MASK(MLX5E_5GBASE_R):
08e8676f160792 Aya Levin         2019-02-12  447  		*active_width = IB_WIDTH_1X;
08e8676f160792 Aya Levin         2019-02-12  448  		*active_speed = IB_SPEED_DDR;
08e8676f160792 Aya Levin         2019-02-12  449  		break;
08e8676f160792 Aya Levin         2019-02-12  450  	case MLX5E_PROT_MASK(MLX5E_10GBASE_XFI_XAUI_1):
08e8676f160792 Aya Levin         2019-02-12  451  		*active_width = IB_WIDTH_1X;
08e8676f160792 Aya Levin         2019-02-12  452  		*active_speed = IB_SPEED_QDR;
08e8676f160792 Aya Levin         2019-02-12  453  		break;
08e8676f160792 Aya Levin         2019-02-12  454  	case MLX5E_PROT_MASK(MLX5E_40GBASE_XLAUI_4_XLPPI_4):
08e8676f160792 Aya Levin         2019-02-12  455  		*active_width = IB_WIDTH_4X;
08e8676f160792 Aya Levin         2019-02-12  456  		*active_speed = IB_SPEED_QDR;
08e8676f160792 Aya Levin         2019-02-12  457  		break;
08e8676f160792 Aya Levin         2019-02-12  458  	case MLX5E_PROT_MASK(MLX5E_25GAUI_1_25GBASE_CR_KR):
08e8676f160792 Aya Levin         2019-02-12  459  		*active_width = IB_WIDTH_1X;
08e8676f160792 Aya Levin         2019-02-12  460  		*active_speed = IB_SPEED_EDR;
08e8676f160792 Aya Levin         2019-02-12  461  		break;
08e8676f160792 Aya Levin         2019-02-12  462  	case MLX5E_PROT_MASK(MLX5E_50GAUI_2_LAUI_2_50GBASE_CR2_KR2):
cd27287562d696 Aya Levin         2019-03-11  463  		*active_width = IB_WIDTH_2X;
cd27287562d696 Aya Levin         2019-03-11  464  		*active_speed = IB_SPEED_EDR;
cd27287562d696 Aya Levin         2019-03-11  465  		break;
08e8676f160792 Aya Levin         2019-02-12  466  	case MLX5E_PROT_MASK(MLX5E_50GAUI_1_LAUI_1_50GBASE_CR_KR):
08e8676f160792 Aya Levin         2019-02-12  467  		*active_width = IB_WIDTH_1X;
08e8676f160792 Aya Levin         2019-02-12  468  		*active_speed = IB_SPEED_HDR;
08e8676f160792 Aya Levin         2019-02-12  469  		break;
cd27287562d696 Aya Levin         2019-03-11  470  	case MLX5E_PROT_MASK(MLX5E_CAUI_4_100GBASE_CR4_KR4):
cd27287562d696 Aya Levin         2019-03-11  471  		*active_width = IB_WIDTH_4X;
cd27287562d696 Aya Levin         2019-03-11  472  		*active_speed = IB_SPEED_EDR;
cd27287562d696 Aya Levin         2019-03-11  473  		break;
08e8676f160792 Aya Levin         2019-02-12  474  	case MLX5E_PROT_MASK(MLX5E_100GAUI_2_100GBASE_CR2_KR2):
08e8676f160792 Aya Levin         2019-02-12  475  		*active_width = IB_WIDTH_2X;
08e8676f160792 Aya Levin         2019-02-12  476  		*active_speed = IB_SPEED_HDR;
08e8676f160792 Aya Levin         2019-02-12  477  		break;
f946e45f59ef01 Meir Lichtinger   2020-10-26  478  	case MLX5E_PROT_MASK(MLX5E_100GAUI_1_100GBASE_CR_KR):
f946e45f59ef01 Meir Lichtinger   2020-10-26  479  		*active_width = IB_WIDTH_1X;
f946e45f59ef01 Meir Lichtinger   2020-10-26  480  		*active_speed = IB_SPEED_NDR;
f946e45f59ef01 Meir Lichtinger   2020-10-26  481  		break;
08e8676f160792 Aya Levin         2019-02-12  482  	case MLX5E_PROT_MASK(MLX5E_200GAUI_4_200GBASE_CR4_KR4):
08e8676f160792 Aya Levin         2019-02-12  483  		*active_width = IB_WIDTH_4X;
08e8676f160792 Aya Levin         2019-02-12  484  		*active_speed = IB_SPEED_HDR;
08e8676f160792 Aya Levin         2019-02-12  485  		break;
f946e45f59ef01 Meir Lichtinger   2020-10-26  486  	case MLX5E_PROT_MASK(MLX5E_200GAUI_2_200GBASE_CR2_KR2):
f946e45f59ef01 Meir Lichtinger   2020-10-26  487  		*active_width = IB_WIDTH_2X;
f946e45f59ef01 Meir Lichtinger   2020-10-26  488  		*active_speed = IB_SPEED_NDR;
f946e45f59ef01 Meir Lichtinger   2020-10-26  489  		break;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  490  	case MLX5E_PROT_MASK(MLX5E_200GAUI_1_200GBASE_CR1_KR1):
d00d16bcbc2553 Patrisious Haddad 2025-05-13  491  		*active_width = IB_WIDTH_1X;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  492  		*active_speed = IB_SPEED_XDR;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  493  		break;
b28ad32442bec2 Patrisious Haddad 2023-09-20  494  	case MLX5E_PROT_MASK(MLX5E_400GAUI_8_400GBASE_CR8):
88c9483faf15ad Maher Sanalla     2023-03-16  495  		*active_width = IB_WIDTH_8X;
88c9483faf15ad Maher Sanalla     2023-03-16  496  		*active_speed = IB_SPEED_HDR;
88c9483faf15ad Maher Sanalla     2023-03-16  497  		break;
f946e45f59ef01 Meir Lichtinger   2020-10-26  498  	case MLX5E_PROT_MASK(MLX5E_400GAUI_4_400GBASE_CR4_KR4):
f946e45f59ef01 Meir Lichtinger   2020-10-26  499  		*active_width = IB_WIDTH_4X;
f946e45f59ef01 Meir Lichtinger   2020-10-26  500  		*active_speed = IB_SPEED_NDR;
f946e45f59ef01 Meir Lichtinger   2020-10-26  501  		break;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  502  	case MLX5E_PROT_MASK(MLX5E_400GAUI_2_400GBASE_CR2_KR2):
d00d16bcbc2553 Patrisious Haddad 2025-05-13  503  		*active_width = IB_WIDTH_2X;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  504  		*active_speed = IB_SPEED_XDR;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  505  		break;
948f0bf5ad6ac1 Patrisious Haddad 2023-09-20  506  	case MLX5E_PROT_MASK(MLX5E_800GAUI_8_800GBASE_CR8_KR8):
948f0bf5ad6ac1 Patrisious Haddad 2023-09-20  507  		*active_width = IB_WIDTH_8X;
948f0bf5ad6ac1 Patrisious Haddad 2023-09-20  508  		*active_speed = IB_SPEED_NDR;
948f0bf5ad6ac1 Patrisious Haddad 2023-09-20  509  		break;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  510  	case MLX5E_PROT_MASK(MLX5E_800GAUI_4_800GBASE_CR4_KR4):
d00d16bcbc2553 Patrisious Haddad 2025-05-13  511  		*active_width = IB_WIDTH_4X;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  512  		*active_speed = IB_SPEED_XDR;
d00d16bcbc2553 Patrisious Haddad 2025-05-13  513  		break;
52d63c47ac62a5 Maher Sanalla     2025-11-02  514  	case MLX5E_PROT_MASK(MLX5E_1600TAUI_8_1600TBASE_CR8_KR8):
52d63c47ac62a5 Maher Sanalla     2025-11-02  515  		*active_width = IB_WIDTH_8X;
52d63c47ac62a5 Maher Sanalla     2025-11-02  516  		*active_speed = IB_SPEED_XDR;
08e8676f160792 Aya Levin         2019-02-12 @517  	default:
08e8676f160792 Aya Levin         2019-02-12  518  		return -EINVAL;
08e8676f160792 Aya Levin         2019-02-12  519  	}
08e8676f160792 Aya Levin         2019-02-12  520  
08e8676f160792 Aya Levin         2019-02-12  521  	return 0;
08e8676f160792 Aya Levin         2019-02-12  522  }
08e8676f160792 Aya Levin         2019-02-12  523  

:::::: The code at line 517 was first introduced by commit
:::::: 08e8676f1607925adf36e399f0faa8ce3b10bb86 IB/mlx5: Add support for 50Gbps per lane link modes

:::::: TO: Aya Levin <ayal@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
