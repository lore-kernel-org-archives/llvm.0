Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C1A1AED31;
	Tue,  8 Oct 2024 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383215; cv=none; b=qsk3ePv0WWgubSLpdU3v3DfSvFgKglDrwMX/+x7pxWQUsdrRkglv+wGEkZhHf7P5wYtO7/VhCsVVu206d/EX+9YNqNv4+/7FkSsiddE4LmmP5cBq2uSrpVQvWb5ZhH0j5V/splYAB0TkOcMk2A61cOJ7Legs64Xkdb14Z1BEn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383215; c=relaxed/simple;
	bh=TM5zII4InKkHkeV+Ua1uhoIQGlVg5VaY+4jBxksr/80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uv4oxgiIpuoaLWaOi7dzDiiiCy0LPMNo7uGPzYn67GYXxIvIziq8yIIlDQiZCkawgiA51ABVLz0eOVATjtF4GSJavZTzQ8uBzFGz+N4M5C+ujdTA8i0oq7sBte0gMt0/j4Bu4TK3raAyFgs82GAAb6lW16vHc3gkTYN5pB6IzGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsEHF5ZI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsEHF5ZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728383212; x=1759919212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TM5zII4InKkHkeV+Ua1uhoIQGlVg5VaY+4jBxksr/80=;
  b=OsEHF5ZIqheDSPZkEUHahsEzFRYno8au0JT/PUwD5g0mfjc3c7HI5u9W
   TZxmaQhrTvBQJgdsTe0Ux+5FgIuMqGl12yCF7TNaRvOOcmz/BXpEY0B8a
   rdWJ/2gkQcV42AI2EsBQqn4Mha7GMFTwMbs7p+LrV1Ej2OIOJP/d9g66g
   W/A1ddqF8V7c44wxvfhjoCILa8Hu8NKqDiGpmOdvtklDY3IhRF1aaBms+
   GXR8IGM+BDHeA+1VkF3Ylp95+Tx2M+Jsj161C50wrJJb98QNI7TZcyNBO
   aipujLsoZrzILzsU7SscObCI5qFOFdx3kdDbHFCsEIDR8lX8IbXKNmn6n
   w==;
X-CSE-ConnectionGUID: 0584HkkQTUuuh+lIkF9daA==
X-CSE-MsgGUID: z7cj02xhS62PEeVfLP4UEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27731540"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27731540"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 03:26:51 -0700
X-CSE-ConnectionGUID: kbdBwszoSLqJjricnWXOlw==
X-CSE-MsgGUID: zIFfp2QdSmWJpiSmu6QRRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76162299"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 03:26:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy7QV-0006FW-2l;
	Tue, 08 Oct 2024 10:26:47 +0000
Date: Tue, 8 Oct 2024 18:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaofeng Lian <1198715581lxf@gmail.com>, stefani@seibold.net,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Xiaofeng Lian <1198715581lxf@gmail.com>
Subject: Re: [PATCH v2] include/linux/kfifo.h: fix some IDEs Intelligence
 errors and the previous patch was misnamed
Message-ID: <202410081818.V12XcEDC-lkp@intel.com>
References: <20241002172427.412715-1-1198715581lxf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002172427.412715-1-1198715581lxf@gmail.com>

Hi Xiaofeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaofeng-Lian/include-linux-kfifo-h-fix-some-IDEs-Intelligence-errors-and-the-previous-patch-was-misnamed/20241006-015547
base:   linus/master
patch link:    https://lore.kernel.org/r/20241002172427.412715-1-1198715581lxf%40gmail.com
patch subject: [PATCH v2] include/linux/kfifo.h: fix some IDEs Intelligence errors and the previous patch was misnamed
config: i386-buildonly-randconfig-005-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081818.V12XcEDC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081818.V12XcEDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081818.V12XcEDC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: error: member reference base type 'typeof(struct sec_request_el *)' (aka 'struct sec_request_el *') is not a structure or union
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:46: note: expanded from macro 'INIT_KFIFO'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:34: note: expanded from macro '__KFIFO_SIZE'
     138 |                 DECLARE_KFIFO_PTR(__tmp_kfifo, get_kfifo_data_type(fifo));\
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:49: note: expanded from macro 'get_kfifo_data_type'
     130 | #define get_kfifo_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^ ~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kfifo.h:84:28: note: expanded from macro 'STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   include/linux/kfifo.h:79:24: note: expanded from macro '__STRUCT_KFIFO_PTR'
      79 |         __STRUCT_KFIFO_COMMON(type, recsize, ptrtype); \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:61:3: note: expanded from macro '__STRUCT_KFIFO_COMMON'
      61 |                 datatype        *type; \
         |                 ^~~~~~~~
>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: error: member reference base type 'typeof(struct sec_request_el *)' (aka 'struct sec_request_el *') is not a structure or union
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:46: note: expanded from macro 'INIT_KFIFO'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:34: note: expanded from macro '__KFIFO_SIZE'
     138 |                 DECLARE_KFIFO_PTR(__tmp_kfifo, get_kfifo_data_type(fifo));\
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:49: note: expanded from macro 'get_kfifo_data_type'
     130 | #define get_kfifo_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^ ~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kfifo.h:84:28: note: expanded from macro 'STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   include/linux/kfifo.h:79:24: note: expanded from macro '__STRUCT_KFIFO_PTR'
      79 |         __STRUCT_KFIFO_COMMON(type, recsize, ptrtype); \
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:62:9: note: expanded from macro '__STRUCT_KFIFO_COMMON'
      62 |                 const datatype  *const_type; \
         |                       ^~~~~~~~
>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: error: member reference base type 'typeof(struct sec_request_el *)' (aka 'struct sec_request_el *') is not a structure or union
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:46: note: expanded from macro 'INIT_KFIFO'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:34: note: expanded from macro '__KFIFO_SIZE'
     138 |                 DECLARE_KFIFO_PTR(__tmp_kfifo, get_kfifo_data_type(fifo));\
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:49: note: expanded from macro 'get_kfifo_data_type'
     130 | #define get_kfifo_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^ ~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kfifo.h:84:37: note: expanded from macro 'STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/kfifo.h:79:39: note: expanded from macro '__STRUCT_KFIFO_PTR'
      79 |         __STRUCT_KFIFO_COMMON(type, recsize, ptrtype); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/kfifo.h:64:3: note: expanded from macro '__STRUCT_KFIFO_COMMON'
      64 |                 ptrtype         *ptr; \
         |                 ^~~~~~~
>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: error: member reference base type 'typeof(struct sec_request_el *)' (aka 'struct sec_request_el *') is not a structure or union
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:46: note: expanded from macro 'INIT_KFIFO'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:34: note: expanded from macro '__KFIFO_SIZE'
     138 |                 DECLARE_KFIFO_PTR(__tmp_kfifo, get_kfifo_data_type(fifo));\
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:49: note: expanded from macro 'get_kfifo_data_type'
     130 | #define get_kfifo_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^ ~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kfifo.h:84:37: note: expanded from macro 'STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/kfifo.h:79:39: note: expanded from macro '__STRUCT_KFIFO_PTR'
      79 |         __STRUCT_KFIFO_COMMON(type, recsize, ptrtype); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/kfifo.h:65:3: note: expanded from macro '__STRUCT_KFIFO_COMMON'
      65 |                 ptrtype const   *ptr_const; \
         |                 ^~~~~~~
>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: error: member reference base type 'typeof(struct sec_request_el *)' (aka 'struct sec_request_el *') is not a structure or union
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:46: note: expanded from macro 'INIT_KFIFO'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:138:34: note: expanded from macro '__KFIFO_SIZE'
     138 |                 DECLARE_KFIFO_PTR(__tmp_kfifo, get_kfifo_data_type(fifo));\
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:49: note: expanded from macro 'get_kfifo_data_type'
     130 | #define get_kfifo_data_type(fifo) typeof(*(fifo)->type)
         |                                                 ^ ~~~~
   include/linux/kfifo.h:116:56: note: expanded from macro 'DECLARE_KFIFO_PTR'
     116 | #define DECLARE_KFIFO_PTR(fifo, type)   STRUCT_KFIFO_PTR(type) fifo
         |                                         ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/kfifo.h:84:28: note: expanded from macro 'STRUCT_KFIFO_PTR'
      84 |         struct __STRUCT_KFIFO_PTR(type, 0, type)
         |                ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   include/linux/kfifo.h:80:2: note: expanded from macro '__STRUCT_KFIFO_PTR'
      80 |         type            buf[0]; \
         |         ^~~~
>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: error: member reference base type 'typeof(struct sec_request_el *)' (aka 'struct sec_request_el *') is not a structure or union
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:46: note: expanded from macro 'INIT_KFIFO'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:139:52: note: expanded from macro '__KFIFO_SIZE'
     139 |                 (sizeof(*(fifo)) - sizeof(__tmp_kfifo)) / sizeof(get_kfifo_data_type(fifo));\
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:130:49: note: expanded from macro 'get_kfifo_data_type'
     130 | #define get_kfifo_data_type(fifo) typeof(*(fifo)->type)
         |                                           ~~~~~~^ ~~~~
>> drivers/crypto/hisilicon/sec/sec_algs.c:912:2: error: invalid operands to binary expression ('void' and 'int')
     912 |         INIT_KFIFO(ctx->queue->softqueue);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:151:71: note: expanded from macro 'INIT_KFIFO'
     151 |         __kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~
   7 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +912 drivers/crypto/hisilicon/sec/sec_algs.c

915e4e8413dacc Jonathan Cameron 2018-07-23  902  
915e4e8413dacc Jonathan Cameron 2018-07-23  903  static int sec_alg_skcipher_init_with_queue(struct crypto_skcipher *tfm)
915e4e8413dacc Jonathan Cameron 2018-07-23  904  {
915e4e8413dacc Jonathan Cameron 2018-07-23  905  	struct sec_alg_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
915e4e8413dacc Jonathan Cameron 2018-07-23  906  	int ret;
915e4e8413dacc Jonathan Cameron 2018-07-23  907  
915e4e8413dacc Jonathan Cameron 2018-07-23  908  	ret = sec_alg_skcipher_init(tfm);
915e4e8413dacc Jonathan Cameron 2018-07-23  909  	if (ret)
915e4e8413dacc Jonathan Cameron 2018-07-23  910  		return ret;
915e4e8413dacc Jonathan Cameron 2018-07-23  911  
915e4e8413dacc Jonathan Cameron 2018-07-23 @912  	INIT_KFIFO(ctx->queue->softqueue);
915e4e8413dacc Jonathan Cameron 2018-07-23  913  	ret = kfifo_alloc(&ctx->queue->softqueue, 512, GFP_KERNEL);
915e4e8413dacc Jonathan Cameron 2018-07-23  914  	if (ret) {
915e4e8413dacc Jonathan Cameron 2018-07-23  915  		sec_alg_skcipher_exit(tfm);
915e4e8413dacc Jonathan Cameron 2018-07-23  916  		return ret;
915e4e8413dacc Jonathan Cameron 2018-07-23  917  	}
915e4e8413dacc Jonathan Cameron 2018-07-23  918  	ctx->queue->havesoftqueue = true;
915e4e8413dacc Jonathan Cameron 2018-07-23  919  
915e4e8413dacc Jonathan Cameron 2018-07-23  920  	return 0;
915e4e8413dacc Jonathan Cameron 2018-07-23  921  }
915e4e8413dacc Jonathan Cameron 2018-07-23  922  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
