Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FDCC2FC;
	Mon, 14 Aug 2023 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692037181; x=1723573181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=raoZRhOJv6xLl2PEtlp0MPEmTsfUo1HT8Kzl8xpLc5U=;
  b=MWngNUU+S+RYUoOjqQy4yU1NJc2ZDg6ZlMr44qiWbojTIEOA9ALQhF5r
   ZM1UOFYsa98RsowAtm2rNRhREMPPcnZ2uj7eAq0YTTzWOY413dTlfmVh+
   +PGFNH2v26usBfSTgTQe0yJPQ+y/Wi3YklrDQmWvKtwR5MRldcIB27wOm
   vtxOu4sKNaE/gm99fnrqEsYHrKNt/QL0qaga30duq/I/K+MCFfA+m7E11
   12hUKQHEjv+ekV0wxFAWJs3bE6uJA0Jr91lebnrIcnpuDz4l0Ap8j3x1D
   kMcGdKLpY2igDnQE+QduZy15GkIBsJdUP5sDV5PspdaWnqw9Ax4c+DSnN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="352434169"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="352434169"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 11:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="736609670"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="736609670"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Aug 2023 11:19:39 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVcAE-0000LH-0z;
	Mon, 14 Aug 2023 18:19:38 +0000
Date: Tue, 15 Aug 2023 02:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v13 17/19] drivers/nvme/target/configfs.c:1881:19:
 error: call to undeclared function 'key_lookup'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202308150232.X4uOBipx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v13
head:   ce525e34ae9d3f5ed12f23caea57c0aa2e8359ee
commit: 742a9e6a640d76c3d7cbb647d0da0887857e7d32 [17/19] nvmet-tcp: enable TLS handshake upcall
config: arm-randconfig-r033-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150232.X4uOBipx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150232.X4uOBipx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150232.X4uOBipx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/target/configfs.c:1881:19: error: call to undeclared function 'key_lookup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1881 |                 port->keyring = key_lookup(nvme_keyring_id());
         |                                 ^
>> drivers/nvme/target/configfs.c:1881:17: error: incompatible integer to pointer conversion assigning to 'struct key *' from 'int' [-Wint-conversion]
    1881 |                 port->keyring = key_lookup(nvme_keyring_id());
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/key_lookup +1881 drivers/nvme/target/configfs.c

  1858	
  1859	static struct config_group *nvmet_ports_make(struct config_group *group,
  1860			const char *name)
  1861	{
  1862		struct nvmet_port *port;
  1863		u16 portid;
  1864		u32 i;
  1865	
  1866		if (kstrtou16(name, 0, &portid))
  1867			return ERR_PTR(-EINVAL);
  1868	
  1869		port = kzalloc(sizeof(*port), GFP_KERNEL);
  1870		if (!port)
  1871			return ERR_PTR(-ENOMEM);
  1872	
  1873		port->ana_state = kcalloc(NVMET_MAX_ANAGRPS + 1,
  1874				sizeof(*port->ana_state), GFP_KERNEL);
  1875		if (!port->ana_state) {
  1876			kfree(port);
  1877			return ERR_PTR(-ENOMEM);
  1878		}
  1879	
  1880		if (nvme_keyring_id()) {
> 1881			port->keyring = key_lookup(nvme_keyring_id());
  1882			if (IS_ERR(port->keyring)) {
  1883				pr_warn("NVMe keyring not available, disabling TLS\n");
  1884				port->keyring = NULL;
  1885			}
  1886		}
  1887	
  1888		for (i = 1; i <= NVMET_MAX_ANAGRPS; i++) {
  1889			if (i == NVMET_DEFAULT_ANA_GRPID)
  1890				port->ana_state[1] = NVME_ANA_OPTIMIZED;
  1891			else
  1892				port->ana_state[i] = NVME_ANA_INACCESSIBLE;
  1893		}
  1894	
  1895		list_add(&port->global_entry, &nvmet_ports_list);
  1896	
  1897		INIT_LIST_HEAD(&port->entry);
  1898		INIT_LIST_HEAD(&port->subsystems);
  1899		INIT_LIST_HEAD(&port->referrals);
  1900		port->inline_data_size = -1;	/* < 0 == let the transport choose */
  1901	
  1902		port->disc_addr.portid = cpu_to_le16(portid);
  1903		port->disc_addr.adrfam = NVMF_ADDR_FAMILY_MAX;
  1904		port->disc_addr.treq = NVMF_TREQ_DISABLE_SQFLOW;
  1905		config_group_init_type_name(&port->group, name, &nvmet_port_type);
  1906	
  1907		config_group_init_type_name(&port->subsys_group,
  1908				"subsystems", &nvmet_port_subsys_type);
  1909		configfs_add_default_group(&port->subsys_group, &port->group);
  1910	
  1911		config_group_init_type_name(&port->referrals_group,
  1912				"referrals", &nvmet_referrals_type);
  1913		configfs_add_default_group(&port->referrals_group, &port->group);
  1914	
  1915		config_group_init_type_name(&port->ana_groups_group,
  1916				"ana_groups", &nvmet_ana_groups_type);
  1917		configfs_add_default_group(&port->ana_groups_group, &port->group);
  1918	
  1919		port->ana_default_group.port = port;
  1920		port->ana_default_group.grpid = NVMET_DEFAULT_ANA_GRPID;
  1921		config_group_init_type_name(&port->ana_default_group.group,
  1922				__stringify(NVMET_DEFAULT_ANA_GRPID),
  1923				&nvmet_ana_group_type);
  1924		configfs_add_default_group(&port->ana_default_group.group,
  1925				&port->ana_groups_group);
  1926	
  1927		return &port->group;
  1928	}
  1929	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
