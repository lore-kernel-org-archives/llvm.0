Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EAD53C;
	Wed, 19 Jul 2023 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689763433; x=1721299433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AHWdE1Jmdr+u9OfN9Gc4ajHme33ul5jlTUZIMB4JMEg=;
  b=C211RRsEv0KS1PVblGTKvlqP5kLEtMUy0jlXxFV3DwqZOsFK4VRUOKGb
   VTZFGzQtFzWOtyd9DZLoORRL1kp/JqLdBy0THFtnmiRVO/0g9puG/B+iC
   wa9WJerCQi6APQPXTShHNsPTkf+P7G9Uzp/SbwfheKi7+HvcYk4hHgPOK
   ivKQ2hEM0Ax1O5hmHVHPhkRA0FECj9tz1sVcmo0NCigfkf7Wjnox41xK0
   tqE5GMYZwWYr3qkQT2nRpbGB6l6CeDzv/511AI+Y7tXHqMHmVF0P33NU9
   aqiswCg+E3ADHHJH1YocSxA5QHLUvDhiSvLVrhEH7xZC/hJ9MlaGzA/9Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452803662"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="452803662"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 03:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789376753"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="789376753"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 03:43:51 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM4es-0004gn-2C;
	Wed, 19 Jul 2023 10:43:50 +0000
Date: Wed, 19 Jul 2023 18:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:acomp-zswap-cleanup 7/21] fs/ubifs/compress.c:216:8: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202307191846.iCTVysLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git acomp-zswap-cleanup
head:   d0a9c8530b6b8659bc8b126638f5d2c907cfe5ee
commit: 9bb0bd982a78fa5d1dadadad46171275df3fae80 [7/21] ubifs: Migrate to acomp compression API
config: x86_64-randconfig-r014-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191846.iCTVysLT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191846.iCTVysLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191846.iCTVysLT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/compress.c:216:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (!compr->req) {
                               ^~~~~~~~~~~
   fs/ubifs/compress.c:222:7: note: uninitialized use occurs here
                   if (ret) {
                       ^~~
   fs/ubifs/compress.c:216:4: note: remove the 'if' if its condition is always true
                           if (!compr->req) {
                           ^~~~~~~~~~~~~~~~~
   fs/ubifs/compress.c:208:11: note: initialize the variable 'ret' to silence this warning
                   long ret;
                           ^
                            = 0
   1 warning generated.


vim +216 fs/ubifs/compress.c

   197	
   198	/**
   199	 * compr_init - initialize a compressor.
   200	 * @compr: compressor description object
   201	 *
   202	 * This function initializes the requested compressor and returns zero in case
   203	 * of success or a negative error code in case of failure.
   204	 */
   205	static int __init compr_init(struct ubifs_compressor *compr)
   206	{
   207		if (compr->capi_name) {
   208			long ret;
   209	
   210			compr->cc = crypto_alloc_acomp(compr->capi_name, 0,
   211						       CRYPTO_ALG_ASYNC);
   212			if (IS_ERR(compr->cc)) {
   213				ret = PTR_ERR(compr->cc);
   214			} else {
   215				compr->req = acomp_request_alloc(compr->cc);
 > 216				if (!compr->req) {
   217					crypto_free_acomp(compr->cc);
   218					ret = -ENOMEM;
   219				}
   220			}
   221	
   222			if (ret) {
   223				pr_err("UBIFS error (pid %d): cannot initialize compressor %s, error %ld",
   224				       current->pid, compr->name, ret);
   225				return ret;
   226			}
   227		}
   228	
   229		ubifs_compressors[compr->compr_type] = compr;
   230		return 0;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
