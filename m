Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7B239E7F;
	Thu,  9 Oct 2025 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760030475; cv=none; b=UH56lHAmxdreIkP5LsNmP6nh4uH/RK3NBdqk/hViCpVMn14GAqHJlrlPW93Gt3wge2osWll/i1sDq46gvoDgM38hh61YlBKAWSqJKZjny+ZDkozNfl6eBroiWUYk1ZOnXF2/WW36Dc67X4zARwfdrbO5dGkj64vxkxudilMQXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760030475; c=relaxed/simple;
	bh=VSfn8pNXuGMVE+fCuSyar2iZCdmp1Khi5fJSnUlHE9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oaYH5dzYcDJvDio5Ut7qbBefbmmr9j8ZqoTvJVmrQFhgaG7Hrw0cCy/Ctpraob2VBOjEDXErpp0M0liTd83IpVcF/ytOJ8C+eLesfovB4SF0Hmmirhbvjg49W+6+3gzJ9CbrJfjbeN+mV07LJ+69XyZH05vBzAFpElhHIimYXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRRJEvZa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRRJEvZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760030473; x=1791566473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSfn8pNXuGMVE+fCuSyar2iZCdmp1Khi5fJSnUlHE9Q=;
  b=NRRJEvZanlOci4BGa8K5n98IIGbD0qxMZuLO4cqd1IfjjPlwAiakJlKp
   tZNyTKtvwH2fGkag3wJ4otqh0EZmA2KoJpFln59N9agpl+j32e6i4wxYq
   LbulMA6i4PZl6WSKUoMkbk7vJTb95PQ0wXT4ltbeg2XjR6fsNebslojr0
   3NaUX4SRU1iD6W116pnmUALLWh+3oXZcLfpBy4f/j+OUKhz8KCcctU53U
   woTzcueo9cmqUuSsChcRFzTKSTHzBdUyQYhouBrxca7d9L8aBDUhJSSUB
   dtHxOnZL+qlJhl9L2KNfUrxK9wVzkHZYX6Wm2+BoIkTb1q4nDNL0lzD6q
   Q==;
X-CSE-ConnectionGUID: Ln/UYb8ESfuhMtj+ujg7EQ==
X-CSE-MsgGUID: /EiUVTjzSBGduJ6wAXxNaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72930570"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="72930570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 10:21:11 -0700
X-CSE-ConnectionGUID: bjwOxSAASW+mWE0uQpXl4A==
X-CSE-MsgGUID: kudzUTmUSDCuAxWd9tCaSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180365339"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Oct 2025 10:21:09 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6uKA-00015i-2B;
	Thu, 09 Oct 2025 17:21:06 +0000
Date: Fri, 10 Oct 2025 01:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>
Subject: [linux-nvme:nvme-6.19 6/13]
 drivers/nvme/target/../host/nvme.h:1205:27: error: static declaration of
 'nvme_auth_extract_key' follows non-static declaration
Message-ID: <202510100105.cibujuUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   00e104767fe39da1798a35eb0e63663621b77556
commit: f59ae5c9e356b5eb50342ce962eb35799aa5c552 [6/13] nvme: parse dhchap keys during option parsing
config: hexagon-randconfig-002-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100105.cibujuUJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100105.cibujuUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100105.cibujuUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/target/loop.c:13:
>> drivers/nvme/target/../host/nvme.h:1205:27: error: static declaration of 'nvme_auth_extract_key' follows non-static declaration
    1205 | static inline struct key *nvme_auth_extract_key(struct key *keyring,
         |                           ^
   drivers/nvme/target/nvmet.h:896:13: note: previous declaration is here
     896 | struct key *nvme_auth_extract_key(struct key *keyring, const u8 *secret,
         |             ^
   1 error generated.


vim +/nvme_auth_extract_key +1205 drivers/nvme/target/../host/nvme.h

  1170	
  1171	#ifdef CONFIG_NVME_HOST_AUTH
  1172	int __init nvme_init_auth(void);
  1173	void __exit nvme_exit_auth(void);
  1174	int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl);
  1175	void nvme_auth_stop(struct nvme_ctrl *ctrl);
  1176	int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid);
  1177	int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid);
  1178	void nvme_auth_free(struct nvme_ctrl *ctrl);
  1179	void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl);
  1180	struct key *nvme_auth_extract_key(struct key *keyring, const u8 *secret,
  1181					  size_t secret_len, bool *generated);
  1182	#else
  1183	static inline int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
  1184	{
  1185		return 0;
  1186	}
  1187	static inline int __init nvme_init_auth(void)
  1188	{
  1189		return 0;
  1190	}
  1191	static inline void __exit nvme_exit_auth(void)
  1192	{
  1193	}
  1194	static inline void nvme_auth_stop(struct nvme_ctrl *ctrl) {};
  1195	static inline int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid)
  1196	{
  1197		return -EPROTONOSUPPORT;
  1198	}
  1199	static inline int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid)
  1200	{
  1201		return -EPROTONOSUPPORT;
  1202	}
  1203	static inline void nvme_auth_free(struct nvme_ctrl *ctrl) {};
  1204	static inline void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
> 1205	static inline struct key *nvme_auth_extract_key(struct key *keyring,
  1206							const u8 *secret,
  1207							size_t secret_len,
  1208							bool *generated)
  1209	{
  1210		return ERR_PTR(-ENOKEY);
  1211	}
  1212	#endif
  1213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
