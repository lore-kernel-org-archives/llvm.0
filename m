Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F0023D4;
	Tue, 18 Apr 2023 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681816666; x=1713352666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S18c4xMR3eoEe6MoWUM5OBpbTKJP+mZL5Lvmm0Efo+I=;
  b=nEsIKtVyYb7vueOL/ugUGYdR+Ur7a/IYiBgbwYxDaNX6fBQC6tw32vAi
   U3Nttm6axQa/1DWGjE0571zFMX8kPRA0fkn6l3pqw+4dk1gBEdnbVdiIU
   NRYeU9WJH7DpUbX1PNUGZ4tXiTW7LF+PlzhZEsDEUkKR1hyuw8L2pDMf9
   XkjJKnPr+ZGN8tS9/KmFZW7MWf7C+nHnbGVK7TI1+FaFLp8TjbbXdeKQN
   0wlXzbB93uOmkLRPGjT6v1HwSMUsUhGMTjRTJC/kgYj91ofC2qxpkb2da
   KHythaDdPI275j5eJnIkEk0RaaK17fP2GjE715UKy4WaGE113dmPk9DIS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347893601"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="347893601"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 04:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834847824"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="834847824"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 04:17:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pojL5-000dJR-1S;
	Tue, 18 Apr 2023 11:17:35 +0000
Date: Tue, 18 Apr 2023 19:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_sbi_nested_v1 48/74] include/linux/fwnode.h:167:37:
 error: declaration of 'struct resource' will not be visible outside of this
 function
Message-ID: <202304181902.qRBUQqyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   664b96e7a3a7d1b9d6c7ede050633ada0eda4875
commit: c0fae281cc6758ccb2c2aa3361acc62fbe038a7a [48/74] device property: Add ioresource_get to fwnode operation
config: x86_64-randconfig-a011-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181902.qRBUQqyi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/c0fae281cc6758ccb2c2aa3361acc62fbe038a7a
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout c0fae281cc6758ccb2c2aa3361acc62fbe038a7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181902.qRBUQqyi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/i915/i915_ttm_buddy_manager.h:12:
   In file included from include/drm/ttm/ttm_resource.h:31:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:332:
   In file included from include/asm-generic/io.h:609:
   In file included from include/linux/logic_pio.h:11:
>> include/linux/fwnode.h:167:37: error: declaration of 'struct resource' will not be visible outside of this function [-Werror,-Wvisibility]
                                 unsigned int index, struct resource *res);
                                                            ^
   1 error generated.


vim +167 include/linux/fwnode.h

    97	
    98	/**
    99	 * struct fwnode_operations - Operations for fwnode interface
   100	 * @get: Get a reference to an fwnode.
   101	 * @put: Put a reference to an fwnode.
   102	 * @device_is_available: Return true if the device is available.
   103	 * @device_get_match_data: Return the device driver match data.
   104	 * @property_present: Return true if a property is present.
   105	 * @property_read_int_array: Read an array of integer properties. Return zero on
   106	 *			     success, a negative error code otherwise.
   107	 * @property_read_string_array: Read an array of string properties. Return zero
   108	 *				on success, a negative error code otherwise.
   109	 * @get_name: Return the name of an fwnode.
   110	 * @get_name_prefix: Get a prefix for a node (for printing purposes).
   111	 * @get_parent: Return the parent of an fwnode.
   112	 * @get_next_child_node: Return the next child node in an iteration.
   113	 * @get_named_child_node: Return a child node with a given name.
   114	 * @get_reference_args: Return a reference pointed to by a property, with args
   115	 * @graph_get_next_endpoint: Return an endpoint node in an iteration.
   116	 * @graph_get_remote_endpoint: Return the remote endpoint node of a local
   117	 *			       endpoint node.
   118	 * @graph_get_port_parent: Return the parent node of a port node.
   119	 * @graph_parse_endpoint: Parse endpoint for port and endpoint id.
   120	 * @add_links:	Create fwnode links to all the suppliers of the fwnode. Return
   121	 *		zero on success, a negative error code otherwise.
   122	 */
   123	struct fwnode_operations {
   124		struct fwnode_handle *(*get)(struct fwnode_handle *fwnode);
   125		void (*put)(struct fwnode_handle *fwnode);
   126		bool (*device_is_available)(const struct fwnode_handle *fwnode);
   127		const void *(*device_get_match_data)(const struct fwnode_handle *fwnode,
   128						     const struct device *dev);
   129		bool (*device_dma_supported)(const struct fwnode_handle *fwnode);
   130		enum dev_dma_attr
   131		(*device_get_dma_attr)(const struct fwnode_handle *fwnode);
   132		bool (*property_present)(const struct fwnode_handle *fwnode,
   133					 const char *propname);
   134		int (*property_read_int_array)(const struct fwnode_handle *fwnode,
   135					       const char *propname,
   136					       unsigned int elem_size, void *val,
   137					       size_t nval);
   138		int
   139		(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
   140					      const char *propname, const char **val,
   141					      size_t nval);
   142		const char *(*get_name)(const struct fwnode_handle *fwnode);
   143		const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
   144		struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);
   145		struct fwnode_handle *
   146		(*get_next_child_node)(const struct fwnode_handle *fwnode,
   147				       struct fwnode_handle *child);
   148		struct fwnode_handle *
   149		(*get_named_child_node)(const struct fwnode_handle *fwnode,
   150					const char *name);
   151		int (*get_reference_args)(const struct fwnode_handle *fwnode,
   152					  const char *prop, const char *nargs_prop,
   153					  unsigned int nargs, unsigned int index,
   154					  struct fwnode_reference_args *args);
   155		struct fwnode_handle *
   156		(*graph_get_next_endpoint)(const struct fwnode_handle *fwnode,
   157					   struct fwnode_handle *prev);
   158		struct fwnode_handle *
   159		(*graph_get_remote_endpoint)(const struct fwnode_handle *fwnode);
   160		struct fwnode_handle *
   161		(*graph_get_port_parent)(struct fwnode_handle *fwnode);
   162		int (*graph_parse_endpoint)(const struct fwnode_handle *fwnode,
   163					    struct fwnode_endpoint *endpoint);
   164		void __iomem *(*iomap)(struct fwnode_handle *fwnode, int index);
   165		int (*irq_get)(const struct fwnode_handle *fwnode, unsigned int index);
   166		int (*ioresource_get)(const struct fwnode_handle *fwnode,
 > 167				      unsigned int index, struct resource *res);
   168		int (*add_links)(struct fwnode_handle *fwnode);
   169	};
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
