Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F32CA4;
	Sat,  1 Apr 2023 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680370539; x=1711906539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFBtgcuUFLx4WVeQJZy9T38SVopF2yRxbSshV92y0p4=;
  b=Jq4ZpVJUQB2TJHZwYc85wHFL1z9Lxo/Xh678I199KcsAuGDva1z/mB+w
   7leTPOheISWtP4bdMVkQhJ6OXpqVmmkWdje2j6kKbZ5SM6zIgTaf/sMhi
   FpwQE3nizs9XTenxfUnIJ9pAilED5VFoFEcrHlJYWhki7+IfnPbhK5guc
   1yMcD53P1oHmbGUUcn/8HLWXpVDoZmLw1Dnc0zCA0SKevFOWnOr0AaZGX
   Up50h2JRlVLAZLPgmeO2NCLokeK+UKKdOKsYpRVT5cKmZ+5j2NjPG3ukc
   Vca1gSW3HkPGD1d8MYTwrDnP//eLenj5q6W9v2uP9P3hMtE9ZGE55+JOv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="330231558"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="330231558"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 10:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="809381371"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="809381371"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Apr 2023 10:35:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pif8Y-000Mwj-2q;
	Sat, 01 Apr 2023 17:35:34 +0000
Date: Sun, 2 Apr 2023 01:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [avpatel:riscv_kvm_aia_v1 25/56]
 drivers/acpi/acpica/nsaccess.c:295:6: warning: variable 'num_carats' set but
 not used
Message-ID: <202304020153.5WlY5eQ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   90863f1cb35d9cd15000b3ab3f2a563f7d7c6c3e
commit: 00698f0572edcbc8b4062b90832d843f05e735d7 [25/56] RISC-V: Add support to build the ACPI core
config: riscv-randconfig-r026-20230402 (https://download.01.org/0day-ci/archive/20230402/202304020153.5WlY5eQ8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/00698f0572edcbc8b4062b90832d843f05e735d7
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout 00698f0572edcbc8b4062b90832d843f05e735d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/acpi/acpica/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020153.5WlY5eQ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/acpica/nsaccess.c:295:6: warning: variable 'num_carats' set but not used [-Wunused-but-set-variable]
           u32 num_carats;
               ^
   1 warning generated.


vim +/num_carats +295 drivers/acpi/acpica/nsaccess.c

^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  255  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  256  /*******************************************************************************
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  257   *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  258   * FUNCTION:    acpi_ns_lookup
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  259   *
44f6c01242da4e drivers/acpi/namespace/nsaccess.c Robert Moore        2005-04-18  260   * PARAMETERS:  scope_info      - Current scope info block
ba494beeaa69bc drivers/acpi/acpica/nsaccess.c    Bob Moore           2012-07-12  261   *              pathname        - Search pathname, in internal format
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  262   *                                (as represented in the AML stream)
ba494beeaa69bc drivers/acpi/acpica/nsaccess.c    Bob Moore           2012-07-12  263   *              type            - Type associated with name
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  264   *              interpreter_mode - IMODE_LOAD_PASS2 => add name if not found
ba494beeaa69bc drivers/acpi/acpica/nsaccess.c    Bob Moore           2012-07-12  265   *              flags           - Flags describing the search restrictions
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  266   *              walk_state      - Current state of the walk
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  267   *              return_node     - Where the Node is placed (if found
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  268   *                                or created successfully)
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  269   *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  270   * RETURN:      Status
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  271   *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  272   * DESCRIPTION: Find or enter the passed name in the name space.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  273   *              Log an error if name not found in Exec mode.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  274   *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  275   * MUTEX:       Assumes namespace is locked.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  276   *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  277   ******************************************************************************/
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  278  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  279  acpi_status
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  280  acpi_ns_lookup(union acpi_generic_state *scope_info,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  281  	       char *pathname,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  282  	       acpi_object_type type,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  283  	       acpi_interpreter_mode interpreter_mode,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  284  	       u32 flags,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  285  	       struct acpi_walk_state *walk_state,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  286  	       struct acpi_namespace_node **return_node)
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  287  {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  288  	acpi_status status;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  289  	char *path = pathname;
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  290  	char *external_path;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  291  	struct acpi_namespace_node *prefix_node;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  292  	struct acpi_namespace_node *current_node = NULL;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  293  	struct acpi_namespace_node *this_node = NULL;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  294  	u32 num_segments;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16 @295  	u32 num_carats;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  296  	acpi_name simple_name;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  297  	acpi_object_type type_to_check_for;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  298  	acpi_object_type this_search_type;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  299  	u32 search_parent_flag = ACPI_NS_SEARCH_PARENT;
958dd242b691f6 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-05-12  300  	u32 local_flags;
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  301  	acpi_interpreter_mode local_interpreter_mode;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  302  
b229cf92eee616 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-04-21  303  	ACPI_FUNCTION_TRACE(ns_lookup);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  304  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  305  	if (!return_node) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  306  		return_ACPI_STATUS(AE_BAD_PARAMETER);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  307  	}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  308  
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  309  	local_flags = flags &
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  310  	    ~(ACPI_NS_ERROR_IF_FOUND | ACPI_NS_OVERRIDE_IF_FOUND |
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  311  	      ACPI_NS_SEARCH_PARENT);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  312  	*return_node = ACPI_ENTRY_NOT_FOUND;
958dd242b691f6 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-05-12  313  	acpi_gbl_ns_lookup_count++;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  314  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  315  	if (!acpi_gbl_root_node) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  316  		return_ACPI_STATUS(AE_NO_NAMESPACE);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  317  	}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  318  
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  319  	/* Get the prefix scope. A null scope means use the root scope */
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  320  
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  321  	if ((!scope_info) || (!scope_info->scope.node)) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  322  		ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  323  				  "Null scope prefix, using root node (%p)\n",
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  324  				  acpi_gbl_root_node));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  325  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  326  		prefix_node = acpi_gbl_root_node;
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  327  	} else {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  328  		prefix_node = scope_info->scope.node;
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  329  		if (ACPI_GET_DESCRIPTOR_TYPE(prefix_node) !=
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  330  		    ACPI_DESC_TYPE_NAMED) {
b8e4d89357fc43 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-01-27  331  			ACPI_ERROR((AE_INFO, "%p is not a namespace node [%s]",
4a90c7e86202f4 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-01-13  332  				    prefix_node,
b8e4d89357fc43 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-01-27  333  				    acpi_ut_get_descriptor_name(prefix_node)));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  334  			return_ACPI_STATUS(AE_AML_INTERNAL);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  335  		}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  336  
8313524a0d466f drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-03  337  		if (!(flags & ACPI_NS_PREFIX_IS_SCOPE)) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  338  			/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  339  			 * This node might not be a actual "scope" node (such as a
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  340  			 * Device/Method, etc.)  It could be a Package or other object
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  341  			 * node. Backup up the tree to find the containing scope node.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  342  			 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  343  			while (!acpi_ns_opens_scope(prefix_node->type) &&
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  344  			       prefix_node->type != ACPI_TYPE_ANY) {
c45b5c09700148 drivers/acpi/acpica/nsaccess.c    Alexey Starikovskiy 2010-05-26  345  				prefix_node = prefix_node->parent;
8313524a0d466f drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-03  346  			}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  347  		}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  348  	}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  349  
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  350  	/* Save type. TBD: may be no longer necessary */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  351  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  352  	type_to_check_for = type;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  353  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  354  	/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  355  	 * Begin examination of the actual pathname
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  356  	 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  357  	if (!pathname) {
52fc0b026e99b5 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  358  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  359  		/* A Null name_path is allowed and refers to the root */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  360  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  361  		num_segments = 0;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  362  		this_node = acpi_gbl_root_node;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  363  		path = "";
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  364  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  365  		ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  366  				  "Null Pathname (Zero segments), Flags=%X\n",
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  367  				  flags));
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  368  	} else {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  369  		/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  370  		 * Name pointer is valid (and must be in internal name format)
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  371  		 *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  372  		 * Check for scope prefixes:
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  373  		 *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  374  		 * As represented in the AML stream, a namepath consists of an
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  375  		 * optional scope prefix followed by a name segment part.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  376  		 *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  377  		 * If present, the scope prefix is either a Root Prefix (in
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  378  		 * which case the name is fully qualified), or one or more
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  379  		 * Parent Prefixes (in which case the name's scope is relative
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  380  		 * to the current scope).
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  381  		 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  382  		if (*path == (u8) AML_ROOT_PREFIX) {
52fc0b026e99b5 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  383  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  384  			/* Pathname is fully qualified, start from the root */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  385  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  386  			this_node = acpi_gbl_root_node;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  387  			search_parent_flag = ACPI_NS_NO_UPSEARCH;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  388  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  389  			/* Point to name segment part */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  390  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  391  			path++;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  392  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  393  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  394  					  "Path is absolute from root [%p]\n",
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  395  					  this_node));
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  396  		} else {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  397  			/* Pathname is relative to current scope, start there */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  398  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  399  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  400  					  "Searching relative to prefix scope [%4.4s] (%p)\n",
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  401  					  acpi_ut_get_node_name(prefix_node),
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  402  					  prefix_node));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  403  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  404  			/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  405  			 * Handle multiple Parent Prefixes (carat) by just getting
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  406  			 * the parent node for each prefix instance.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  407  			 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  408  			this_node = prefix_node;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  409  			num_carats = 0;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  410  			while (*path == (u8) AML_PARENT_PREFIX) {
52fc0b026e99b5 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  411  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  412  				/* Name is fully qualified, no search rules apply */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  413  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  414  				search_parent_flag = ACPI_NS_NO_UPSEARCH;
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  415  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  416  				/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  417  				 * Point past this prefix to the name segment
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  418  				 * part or the next Parent Prefix
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  419  				 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  420  				path++;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  421  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  422  				/* Backup to the parent node */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  423  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  424  				num_carats++;
c45b5c09700148 drivers/acpi/acpica/nsaccess.c    Alexey Starikovskiy 2010-05-26  425  				this_node = this_node->parent;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  426  				if (!this_node) {
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  427  					/*
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  428  					 * Current scope has no parent scope. Externalize
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  429  					 * the internal path for error message.
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  430  					 */
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  431  					status =
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  432  					    acpi_ns_externalize_name
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  433  					    (ACPI_UINT32_MAX, pathname, NULL,
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  434  					     &external_path);
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  435  					if (ACPI_SUCCESS(status)) {
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  436  						ACPI_ERROR((AE_INFO,
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  437  							    "%s: Path has too many parent prefixes (^)",
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  438  							    external_path));
52fc0b026e99b5 drivers/acpi/namespace/nsaccess.c Bob Moore           2006-10-02  439  
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  440  						ACPI_FREE(external_path);
6d9229d67df35f drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-08-03  441  					}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  442  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  443  					return_ACPI_STATUS(AE_NOT_FOUND);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  444  				}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  445  			}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  446  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  447  			if (search_parent_flag == ACPI_NS_NO_UPSEARCH) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  448  				ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
b27d65975c252f drivers/acpi/acpica/nsaccess.c    Bob Moore           2010-05-26  449  						  "Search scope is [%4.4s], path has %u carat(s)\n",
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  450  						  acpi_ut_get_node_name
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  451  						  (this_node), num_carats));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  452  			}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  453  		}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  454  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  455  		/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  456  		 * Determine the number of ACPI name segments in this pathname.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  457  		 *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  458  		 * The segment part consists of either:
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  459  		 *  - A Null name segment (0)
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  460  		 *  - A dual_name_prefix followed by two 4-byte name segments
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  461  		 *  - A multi_name_prefix followed by a byte indicating the
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  462  		 *      number of segments and the segments themselves.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  463  		 *  - A single 4-byte name segment
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  464  		 *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  465  		 * Examine the name prefix opcode, if any, to determine the number of
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  466  		 * segments.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  467  		 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  468  		switch (*path) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  469  		case 0:
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  470  			/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  471  			 * Null name after a root or parent prefixes. We already
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  472  			 * have the correct target node and there are no name segments.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  473  			 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  474  			num_segments = 0;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  475  			type = this_node->type;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  476  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  477  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  478  					  "Prefix-only Pathname (Zero name segments), Flags=%X\n",
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  479  					  flags));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  480  			break;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  481  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  482  		case AML_DUAL_NAME_PREFIX:
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  483  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  484  			/* More than one name_seg, search rules do not apply */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  485  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  486  			search_parent_flag = ACPI_NS_NO_UPSEARCH;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  487  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  488  			/* Two segments, point to first name segment */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  489  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  490  			num_segments = 2;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  491  			path++;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  492  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  493  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  494  					  "Dual Pathname (2 segments, Flags=%X)\n",
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  495  					  flags));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  496  			break;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  497  
9ff5a21a50301e drivers/acpi/acpica/nsaccess.c    Bob Moore           2017-04-26  498  		case AML_MULTI_NAME_PREFIX:
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  499  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  500  			/* More than one name_seg, search rules do not apply */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  501  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  502  			search_parent_flag = ACPI_NS_NO_UPSEARCH;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  503  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  504  			/* Extract segment count, point to first name segment */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  505  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  506  			path++;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  507  			num_segments = (u32) (u8) * path;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  508  			path++;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  509  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  510  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
b27d65975c252f drivers/acpi/acpica/nsaccess.c    Bob Moore           2010-05-26  511  					  "Multi Pathname (%u Segments, Flags=%X)\n",
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  512  					  num_segments, flags));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  513  			break;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  514  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  515  		default:
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  516  			/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  517  			 * Not a Null name, no Dual or Multi prefix, hence there is
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  518  			 * only one name segment and Pathname is already pointing to it.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  519  			 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  520  			num_segments = 1;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  521  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  522  			ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  523  					  "Simple Pathname (1 segment, Flags=%X)\n",
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  524  					  flags));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  525  			break;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  526  		}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  527  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  528  		ACPI_DEBUG_EXEC(acpi_ns_print_pathname(num_segments, path));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  529  	}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  530  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  531  	/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  532  	 * Search namespace for each segment of the name. Loop through and
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  533  	 * verify (or add to the namespace) each name segment.
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  534  	 *
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  535  	 * The object type is significant only at the last name
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  536  	 * segment. (We don't care about the types along the path, only
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  537  	 * the type of the final target object.)
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  538  	 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  539  	this_search_type = ACPI_TYPE_ANY;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  540  	current_node = this_node;
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  541  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  542  	while (num_segments && current_node) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  543  		num_segments--;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  544  		if (!num_segments) {
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  545  
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  546  			/* This is the last segment, enable typechecking */
d4913dc6d0c680 drivers/acpi/acpica/nsaccess.c    Bob Moore           2009-03-06  547  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  548  			this_search_type = type;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  549  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  550  			/*
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  551  			 * Only allow automatic parent search (search rules) if the caller
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  552  			 * requested it AND we have a single, non-fully-qualified name_seg
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  553  			 */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  554  			if ((search_parent_flag != ACPI_NS_NO_UPSEARCH) &&
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  555  			    (flags & ACPI_NS_SEARCH_PARENT)) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  556  				local_flags |= ACPI_NS_SEARCH_PARENT;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  557  			}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  558  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  559  			/* Set error flag according to caller */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  560  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  561  			if (flags & ACPI_NS_ERROR_IF_FOUND) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  562  				local_flags |= ACPI_NS_ERROR_IF_FOUND;
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  563  			}
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  564  
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  565  			/* Set override flag according to caller */
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  566  
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  567  			if (flags & ACPI_NS_OVERRIDE_IF_FOUND) {
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  568  				local_flags |= ACPI_NS_OVERRIDE_IF_FOUND;
8f6f0361048396 drivers/acpi/acpica/nsaccess.c    Lv Zheng            2015-07-01  569  			}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  570  		}
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  571  
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  572  		/* Handle opcodes that create a new name_seg via a full name_path */
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  573  
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  574  		local_interpreter_mode = interpreter_mode;
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  575  		if ((flags & ACPI_NS_PREFIX_MUST_EXIST) && (num_segments > 0)) {
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  576  
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  577  			/* Every element of the path must exist (except for the final name_seg) */
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  578  
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  579  			local_interpreter_mode = ACPI_IMODE_EXECUTE;
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  580  		}
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  581  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  582  		/* Extract one ACPI name from the front of the pathname */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  583  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  584  		ACPI_MOVE_32_TO_32(&simple_name, path);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  585  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  586  		/* Try to find the single (4 character) ACPI name */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  587  
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  588  		status =
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  589  		    acpi_ns_search_and_enter(simple_name, walk_state,
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  590  					     current_node,
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  591  					     local_interpreter_mode,
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  592  					     this_search_type, local_flags,
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  593  					     &this_node);
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  594  		if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  595  			if (status == AE_NOT_FOUND) {
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  596  #if !defined ACPI_ASL_COMPILER	/* Note: iASL reports this error by itself, not needed here */
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  597  				if (flags & ACPI_NS_PREFIX_MUST_EXIST) {
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  598  					acpi_os_printf(ACPI_MSG_BIOS_ERROR
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  599  						       "Object does not exist: %4.4s\n",
36056d0cd677bb drivers/acpi/acpica/nsaccess.c    Bob Moore           2019-08-16  600  						       (char *)&simple_name);
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  601  				}
927a6abf023b1a drivers/acpi/acpica/nsaccess.c    Bob Moore           2018-11-05  602  #endif
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  603  				/* Name not found in ACPI namespace */
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  604  
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  605  				ACPI_DEBUG_PRINT((ACPI_DB_NAMES,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  606  						  "Name [%4.4s] not found in scope [%4.4s] %p\n",
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  607  						  (char *)&simple_name,
4be44fcd3bf648 drivers/acpi/namespace/nsaccess.c Len Brown           2005-08-05  608  						  (char *)&current_node->name,
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  609  						  current_node));
^1da177e4c3f41 drivers/acpi/namespace/nsaccess.c Linus Torvalds      2005-04-16  610  			}
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  611  #ifdef ACPI_EXEC_APP
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  612  			if ((status == AE_ALREADY_EXISTS) &&
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  613  			    (this_node->flags & ANOBJ_NODE_EARLY_INIT)) {
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  614  				this_node->flags &= ~ANOBJ_NODE_EARLY_INIT;
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  615  				status = AE_OK;
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  616  			}
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  617  #endif
77d4e0966a8a6f drivers/acpi/acpica/nsaccess.c    Erik Kaneda         2018-08-10  618  

:::::: The code at line 295 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
