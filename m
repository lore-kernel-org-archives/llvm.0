Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F3671A
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662481679; x=1694017679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qDWsHsFCQwjDSp4dBPjWmhuv5UCqtq/XWd+72ovAE9U=;
  b=fdWuzpKAO9oaHyn20cm831jeqtUbFzWEmPkqpRwPnRzD+dcaJtgAYkoQ
   6HGgO8x0shPfvJuwYwmvTYjuOGXZWJeM8hBPx6vOas0yPDSn6cx8F0QL5
   xBwe2xtFT4JmaK8s4GfjeSVYxY5g04Fk3jZpCsglXTnJppFzqrHP4/kNm
   hOmzMq2XPraULSZcTzCW8edhDrpydKJ5cn/bOWTCAO0ye1Tz98GNtLm5t
   95P5rDAsoSDiR723GRG82aD17Fo2fZYH+PVVDR9ywXk+Sm5GDZjISM7MP
   AZxvPj4i8Je0HQ1vMchN8Ms5HMdIzuzbrOOZJcUduqeV6etYvusUmgVMe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="296640431"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="296640431"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 09:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="591325786"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2022 09:27:30 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVbQA-0005KH-0w;
	Tue, 06 Sep 2022 16:27:30 +0000
Date: Wed, 7 Sep 2022 00:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3 3/4] PCI/CMA: Initial support for Component
 Measurement and Authentication ECN
Message-ID: <202209070030.EZSXqm6L-lkp@intel.com>
References: <20220906111556.1544-4-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906111556.1544-4-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on helgaas-pci/next]
[also build test ERROR on linus/master v6.0-rc4 next-20220906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/PCI-CMA-and-SPDM-Library-Device-attestation-etc/20220906-191943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: mips-randconfig-r023-20220906 (https://download.01.org/0day-ci/archive/20220907/202209070030.EZSXqm6L-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://github.com/intel-lab-lkp/linux/commit/694b6e0651764f4a2abe85dba7577d69d6daaba7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/PCI-CMA-and-SPDM-Library-Device-attestation-etc/20220906-191943
        git checkout 694b6e0651764f4a2abe85dba7577d69d6daaba7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/pci/ lib/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pci/cma.c:105:16: error: call to undeclared function 'keyring_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cma_keyring = keyring_alloc("_cma",
                         ^
>> drivers/pci/cma.c:108:10: error: use of undeclared identifier 'KEY_POS_ALL'
                                       (KEY_POS_ALL & ~KEY_POS_SETATTR) |
                                        ^
>> drivers/pci/cma.c:108:25: error: use of undeclared identifier 'KEY_POS_SETATTR'
                                       (KEY_POS_ALL & ~KEY_POS_SETATTR) |
                                                       ^
>> drivers/pci/cma.c:109:9: error: use of undeclared identifier 'KEY_USR_VIEW'
                                       KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRITE | KEY_USR_SEARCH,
                                       ^
>> drivers/pci/cma.c:109:24: error: use of undeclared identifier 'KEY_USR_READ'
                                       KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRITE | KEY_USR_SEARCH,
                                                      ^
>> drivers/pci/cma.c:109:39: error: use of undeclared identifier 'KEY_USR_WRITE'
                                       KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRITE | KEY_USR_SEARCH,
                                                                     ^
>> drivers/pci/cma.c:109:55: error: use of undeclared identifier 'KEY_USR_SEARCH'
                                       KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRITE | KEY_USR_SEARCH,
                                                                                     ^
>> drivers/pci/cma.c:110:9: error: use of undeclared identifier 'KEY_ALLOC_NOT_IN_QUOTA'
                                       KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_SET_KEEP, NULL, NULL);
                                       ^
>> drivers/pci/cma.c:110:34: error: use of undeclared identifier 'KEY_ALLOC_SET_KEEP'
                                       KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_SET_KEEP, NULL, NULL);
                                                                ^
   9 errors generated.
--
   In file included from lib/spdm.c:25:
>> include/keys/asymmetric-type.h:72:12: error: incomplete definition of type 'struct key'
           return key->payload.data[asym_key_ids];
                  ~~~^
   include/linux/key.h:33:8: note: forward declaration of 'struct key'
   struct key;
          ^
   In file included from lib/spdm.c:25:
   include/keys/asymmetric-type.h:78:12: error: incomplete definition of type 'struct key'
           return key->payload.data[asym_crypto];
                  ~~~^
   include/linux/key.h:33:8: note: forward declaration of 'struct key'
   struct key;
          ^
>> lib/spdm.c:974:24: error: call to undeclared function 'keyring_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           spdm_state->keyring = keyring_alloc(keyring_name,
                                 ^
>> lib/spdm.c:977:11: error: use of undeclared identifier 'KEY_POS_ALL'
                                               (KEY_POS_ALL & ~KEY_POS_SETATTR) |
                                                ^
>> lib/spdm.c:977:26: error: use of undeclared identifier 'KEY_POS_SETATTR'
                                               (KEY_POS_ALL & ~KEY_POS_SETATTR) |
                                                               ^
>> lib/spdm.c:978:10: error: use of undeclared identifier 'KEY_USR_VIEW'
                                               KEY_USR_VIEW | KEY_USR_READ,
                                               ^
>> lib/spdm.c:978:25: error: use of undeclared identifier 'KEY_USR_READ'
                                               KEY_USR_VIEW | KEY_USR_READ,
                                                              ^
>> lib/spdm.c:979:10: error: use of undeclared identifier 'KEY_ALLOC_NOT_IN_QUOTA'
                                               KEY_ALLOC_NOT_IN_QUOTA |
                                               ^
>> lib/spdm.c:980:10: error: use of undeclared identifier 'KEY_ALLOC_SET_KEEP'
                                               KEY_ALLOC_SET_KEEP,
                                               ^
>> lib/spdm.c:998:3: error: unknown type name 'key_ref_t'; did you mean 'key_perm_t'?
                   key_ref_t key2;
                   ^~~~~~~~~
                   key_perm_t
   include/linux/key.h:31:18: note: 'key_perm_t' declared here
   typedef uint32_t key_perm_t;
                    ^
>> lib/spdm.c:1000:10: error: call to undeclared function 'key_create_or_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   key2 = key_create_or_update(make_key_ref(spdm_state->keyring, 1),
                          ^
   lib/spdm.c:1003:11: error: use of undeclared identifier 'KEY_POS_ALL'
                                               (KEY_POS_ALL & ~KEY_POS_SETATTR) |
                                                ^
   lib/spdm.c:1003:26: error: use of undeclared identifier 'KEY_POS_SETATTR'
                                               (KEY_POS_ALL & ~KEY_POS_SETATTR) |
                                                               ^
   lib/spdm.c:1004:10: error: use of undeclared identifier 'KEY_USR_VIEW'
                                               KEY_USR_VIEW | KEY_USR_READ,
                                               ^
   lib/spdm.c:1004:25: error: use of undeclared identifier 'KEY_USR_READ'
                                               KEY_USR_VIEW | KEY_USR_READ,
                                                              ^
   lib/spdm.c:1005:10: error: use of undeclared identifier 'KEY_ALLOC_NOT_IN_QUOTA'
                                               KEY_ALLOC_NOT_IN_QUOTA);
                                               ^
>> lib/spdm.c:1007:14: error: incompatible integer to pointer conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of type 'const void *' [-Wint-conversion]
                   if (IS_ERR(key2)) {
                              ^~~~
   include/linux/err.h:34:60: note: passing argument to parameter 'ptr' here
   static inline bool __must_check IS_ERR(__force const void *ptr)
                                                              ^
   lib/spdm.c:1009:17: error: incompatible integer to pointer conversion passing 'key_perm_t' (aka 'unsigned int') to parameter of type 'const void *' [-Wint-conversion]
                           rc = PTR_ERR(key2);
                                        ^~~~
   include/linux/err.h:29:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
>> lib/spdm.c:1016:25: error: member reference base type 'void' is not a structure or union
                                   key_ref_to_ptr(key2)->payload.data[asym_auth];
                                   ~~~~~~~~~~~~~~~~~~~~^ ~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/keyring_alloc +105 drivers/pci/cma.c

   102	
   103	__init static int cma_keyring_init(void)
   104	{
 > 105		cma_keyring = keyring_alloc("_cma",
   106					    KUIDT_INIT(0), KGIDT_INIT(0),
   107					    current_cred(),
 > 108					    (KEY_POS_ALL & ~KEY_POS_SETATTR) |
 > 109					    KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRITE | KEY_USR_SEARCH,
 > 110					    KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_SET_KEEP, NULL, NULL);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
