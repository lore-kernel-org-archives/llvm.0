Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941ED3921DD;
	Fri,  8 May 2026 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778280756; cv=none; b=p/vyrxCoG1wc+jHEgkdovMkSKuEZOr9qqtcxm3IFlz1cBNyWTHl/DJsa7fAQ3BUfFjcxdSZvZzUu/82ORqAtqvSs52UBx4VkvGUnmWq9+iw47RQ1UrAgykleD1MXkDjnx/dDr6oRijr79oyAXzKq78FiITTTM6SRm7VWAO7iuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778280756; c=relaxed/simple;
	bh=BCxpsjJIVGyGgM7YppKJEhhIiqFhcjPlE5xoJLP2fmM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e4iAurgpa28NUvxITUqyboN0VVh0ryCtN72ndIdpoYuk7rFruf2lVsNseBYm8vZ2VczFO3TFQiqtr7S5/muDtLtIGGwX5IPRAlP6IZ3PHjZ9Ssjzg33yL/WDkW1bdlLW8oCkriluEbLvckNg/ZYbnqOU7Tw/JFNQ+bkQ4p1c9vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmsg4R3C; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmsg4R3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778280754; x=1809816754;
  h=date:from:to:cc:subject:message-id;
  bh=BCxpsjJIVGyGgM7YppKJEhhIiqFhcjPlE5xoJLP2fmM=;
  b=kmsg4R3CoApFVwFcNmuZ5g/3EZnZ2iXEj1uh2ULlTjvrE4SZzb7iv/dh
   bmKhSoM0rATzhPqFYp87eWYmsEbJNapxHvEECN43FZRUwcviIC9VkD182
   VDU8xnipolm67E0K13J6cvmHprA2gqe4IiSfVyYFjFBAqjRysbeIE0oKg
   tNIBtTlP/XZsRvfh9eGTU7tfE/A/Yrpw7mWs6LgcHyW9b+II8MX3fxJTU
   iUWHAFxYRftmYXOLKEkQEzKsNpuyXk4e3uR69EuxR6Y8P6jO40fsySt4J
   bioLRU3PPqnBryk07kUnZd2yyR/YZ2qhj11Tjw8OUBVXQKFRbmFcFYqRD
   Q==;
X-CSE-ConnectionGUID: 3pCAOisFTeGgN03tfRLieg==
X-CSE-MsgGUID: Pgq6bewKQNaXJROiSqS/SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78399638"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="78399638"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 15:52:33 -0700
X-CSE-ConnectionGUID: OWFd12R4S+WiJ44xuf9OBA==
X-CSE-MsgGUID: Da4r/2cPSe60D/UHUotDRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="241844599"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2026 15:52:31 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLU3Y-000000000Tp-2xJI;
	Fri, 08 May 2026 22:52:28 +0000
Date: Sat, 09 May 2026 06:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:configfs-ns 3/9]
 drivers/nvme/host/fabrics.h:132:2: error: unknown type name 'key_ref_t'; did
 you mean 'key_perm_t'?
Message-ID: <202605090634.DZTgizp2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git configfs-ns
head:   509cbb083b05db0f02a3ceea68bb093f8725a6a5
commit: 2ea876cdebd3c84d7466f8d8f58a511ef4f6c317 [3/9] nvme: use key reference for persistent keys
config: i386-buildonly-randconfig-002-20260509 (https://download.01.org/0day-ci/archive/20260509/202605090634.DZTgizp2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090634.DZTgizp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090634.DZTgizp2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:14:
>> drivers/nvme/host/fabrics.h:132:2: error: unknown type name 'key_ref_t'; did you mean 'key_perm_t'?
     132 |         key_ref_t               keyring;
         |         ^~~~~~~~~
         |         key_perm_t
   include/linux/key.h:31:18: note: 'key_perm_t' declared here
      31 | typedef uint32_t key_perm_t;
         |                  ^
   In file included from drivers/nvme/host/fabrics.c:14:
   drivers/nvme/host/fabrics.h:133:2: error: unknown type name 'key_ref_t'; did you mean 'key_perm_t'?
     133 |         key_ref_t               tls_key;
         |         ^~~~~~~~~
         |         key_perm_t
   include/linux/key.h:31:18: note: 'key_perm_t' declared here
      31 | typedef uint32_t key_perm_t;
         |                  ^
>> drivers/nvme/host/fabrics.c:725:2: error: unknown type name 'key_ref_t'; did you mean 'key_perm_t'?
     725 |         key_ref_t keyref;
         |         ^~~~~~~~~
         |         key_perm_t
   include/linux/key.h:31:18: note: 'key_perm_t' declared here
      31 | typedef uint32_t key_perm_t;
         |                  ^
>> drivers/nvme/host/fabrics.c:739:16: error: incompatible pointer to integer conversion assigning to 'key_perm_t' (aka 'unsigned int') from 'void *' [-Wint-conversion]
     739 |         opts->tls_key = NULL;
         |                       ^ ~~~~
   drivers/nvme/host/fabrics.c:740:16: error: incompatible pointer to integer conversion assigning to 'key_perm_t' (aka 'unsigned int') from 'void *' [-Wint-conversion]
     740 |         opts->keyring = NULL;
         |                       ^ ~~~~
   drivers/nvme/host/fabrics.c:1005:11: error: incompatible pointer to integer conversion assigning to 'key_perm_t' (aka 'unsigned int') from 'void *' [-Wint-conversion]
    1005 |                         keyref = make_key_ref(key, true);
         |                                ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fabrics.c:1022:11: error: incompatible pointer to integer conversion assigning to 'key_perm_t' (aka 'unsigned int') from 'void *' [-Wint-conversion]
    1022 |                         keyref = make_key_ref(key, true);
         |                                ^ ~~~~~~~~~~~~~~~~~~~~~~~
   7 errors generated.
--
   In file included from drivers/nvme/host/fc.c:14:
>> drivers/nvme/host/fabrics.h:132:2: error: unknown type name 'key_ref_t'; did you mean 'key_perm_t'?
     132 |         key_ref_t               keyring;
         |         ^~~~~~~~~
         |         key_perm_t
   include/linux/key.h:31:18: note: 'key_perm_t' declared here
      31 | typedef uint32_t key_perm_t;
         |                  ^
   In file included from drivers/nvme/host/fc.c:14:
   drivers/nvme/host/fabrics.h:133:2: error: unknown type name 'key_ref_t'; did you mean 'key_perm_t'?
     133 |         key_ref_t               tls_key;
         |         ^~~~~~~~~
         |         key_perm_t
   include/linux/key.h:31:18: note: 'key_perm_t' declared here
      31 | typedef uint32_t key_perm_t;
         |                  ^
   2 errors generated.


vim +132 drivers/nvme/host/fabrics.h

    71	
    72	/**
    73	 * struct nvmf_ctrl_options - Used to hold the options specified
    74	 *			      with the parsing opts enum.
    75	 * @mask:	Used by the fabrics library to parse through sysfs options
    76	 *		on adding a NVMe controller.
    77	 * @max_reconnects: maximum number of allowed reconnect attempts before removing
    78	 *		the controller, (-1) means reconnect forever, zero means remove
    79	 *		immediately;
    80	 * @transport:	Holds the fabric transport "technology name" (for a lack of
    81	 *		better description) that will be used by an NVMe controller
    82	 *		being added.
    83	 * @subsysnqn:	Hold the fully qualified NQN subsystem name (format defined
    84	 *		in the NVMe specification, "NVMe Qualified Names").
    85	 * @traddr:	The transport-specific TRADDR field for a port on the
    86	 *              subsystem which is adding a controller.
    87	 * @trsvcid:	The transport-specific TRSVCID field for a port on the
    88	 *              subsystem which is adding a controller.
    89	 * @host_traddr: A transport-specific field identifying the NVME host port
    90	 *     to use for the connection to the controller.
    91	 * @host_iface: A transport-specific field identifying the NVME host
    92	 *     interface to use for the connection to the controller.
    93	 * @queue_size: Number of IO queue elements.
    94	 * @nr_io_queues: Number of controller IO queues that will be established.
    95	 * @reconnect_delay: Time between two consecutive reconnect attempts.
    96	 * @discovery_nqn: indicates if the subsysnqn is the well-known discovery NQN.
    97	 * @kato:	Keep-alive timeout.
    98	 * @host:	Virtual NVMe host, contains the NQN and Host ID.
    99	 * @dhchap_secret: DH-HMAC-CHAP secret
   100	 * @dhchap_ctrl_secret: DH-HMAC-CHAP controller secret for bi-directional
   101	 *              authentication
   102	 * @keyring:    Keyring to use for key lookups
   103	 * @tls_key:    TLS key for encrypted connections (TCP)
   104	 * @tls:        Start TLS encrypted connections (TCP)
   105	 * @concat:     Enabled Secure channel concatenation (TCP)
   106	 * @disable_sqflow: disable controller sq flow control
   107	 * @hdr_digest: generate/verify header digest (TCP)
   108	 * @data_digest: generate/verify data digest (TCP)
   109	 * @nr_write_queues: number of queues for write I/O
   110	 * @nr_poll_queues: number of queues for polling I/O
   111	 * @tos: type of service
   112	 * @fast_io_fail_tmo: Fast I/O fail timeout in seconds
   113	 */
   114	struct nvmf_ctrl_options {
   115		unsigned		mask;
   116		int			max_reconnects;
   117		char			*transport;
   118		char			*subsysnqn;
   119		char			*traddr;
   120		char			*trsvcid;
   121		char			*host_traddr;
   122		char			*host_iface;
   123		size_t			queue_size;
   124		unsigned int		nr_io_queues;
   125		unsigned int		reconnect_delay;
   126		bool			discovery_nqn;
   127		bool			duplicate_connect;
   128		unsigned int		kato;
   129		struct nvmf_host	*host;
   130		char			*dhchap_secret;
   131		char			*dhchap_ctrl_secret;
 > 132		key_ref_t		keyring;
   133		key_ref_t		tls_key;
   134		bool			tls;
   135		bool			concat;
   136		bool			disable_sqflow;
   137		bool			hdr_digest;
   138		bool			data_digest;
   139		unsigned int		nr_write_queues;
   140		unsigned int		nr_poll_queues;
   141		int			tos;
   142		int			fast_io_fail_tmo;
   143	};
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
