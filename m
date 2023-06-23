Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8575517D3;
	Fri, 23 Jun 2023 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687506609; x=1719042609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0nR9WePWVTpi/7VInUAkIUnAX1x8NKMltvsNWwx2Xb0=;
  b=KJtGfTB+dcHmz+MqRO5h1t/6nSHJx53blQsUJX8ghemFcs3JkZ4X29hK
   2D3HFpBpPg57uiTOKS+EpYQmeC+nv5GOfvxlI5EEF9C9BmdD/JcK0K1tX
   FLJsVu7hZA+VkJ4W79tjy1HdyL5D301DYITtyYBeHP66tVLc5gOOeMqwz
   g0F8xIl2DrvtXlyDZCsuLFw/ahD7BZztzaBLwL75aJENUoKl4mZAL+So5
   cxIFwFEqeF5A8m2jEQH+SzcxQrVe6mb023N1vPVSZK13AcFUGIFx/7DpD
   0J8r++/ASfKemmQkPDA1ih5cFNqwmjE2+/PRDLs50OJ9ekBA7iNSbqGE6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363266688"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="363266688"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 00:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="744907514"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="744907514"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jun 2023 00:50:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCbYO-00085X-2V;
	Fri, 23 Jun 2023 07:50:00 +0000
Date: Fri, 23 Jun 2023 15:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: GUO Zihua <guozihua@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/3] crypto: Introduce SM9 key exchange algorithm
Message-ID: <202306231505.h5SweAGQ-lkp@intel.com>
References: <20230619021503.29814-4-guozihua@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619021503.29814-4-guozihua@huawei.com>

Hi GUO,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.4-rc7 next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/GUO-Zihua/MPI-Export-mpi_add_ui-and-mpi_mod-for-SM9/20230619-101828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230619021503.29814-4-guozihua%40huawei.com
patch subject: [PATCH RFC v2 3/3] crypto: Introduce SM9 key exchange algorithm
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306231505.h5SweAGQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231505.h5SweAGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231505.h5SweAGQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/sm9_lib.c:16:14: warning: no previous prototype for function 'mpi_dump_to_buf' [-Wmissing-prototypes]
   unsigned int mpi_dump_to_buf(MPI a, u8 *buf, unsigned int expected_size)
                ^
   crypto/sm9_lib.c:16:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mpi_dump_to_buf(MPI a, u8 *buf, unsigned int expected_size)
   ^
   static 
>> crypto/sm9_lib.c:558:6: warning: variable 'P' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (rc)
               ^~
   crypto/sm9_lib.c:597:20: note: uninitialized use occurs here
           sm9_point_release(P);
                             ^
   crypto/sm9_lib.c:558:2: note: remove the 'if' if its condition is always false
           if (rc)
           ^~~~~~~
   crypto/sm9_lib.c:549:13: note: initialize the variable 'P' to silence this warning
           SM9_POINT P;
                      ^
                       = NULL
>> crypto/sm9_lib.c:753:6: warning: no previous prototype for function 'sm9_point_clear' [-Wmissing-prototypes]
   void sm9_point_clear(SM9_POINT p)
        ^
   crypto/sm9_lib.c:753:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sm9_point_clear(SM9_POINT p)
   ^
   static 
   3 warnings generated.
--
>> crypto/sm9.c:267:19: warning: variable 'buf_size_tmp' set but not used [-Wunused-but-set-variable]
           size_t buf_size, buf_size_tmp, Ra_buf_size, Rb_buf_size, g_size;
                            ^
   1 warning generated.


vim +/buf_size_tmp +267 crypto/sm9.c

   261	
   262	static int sm9_kdf(u8 *SK, size_t klen, const u8 *ida, size_t ida_size,
   263			   const u8 *idb, size_t idb_size, MPI_POINT Ra, MPI_POINT Rb,
   264			   SM9_DIM_FQ12 g1, SM9_DIM_FQ12 g2, SM9_DIM_FQ12 g3)
   265	{
   266		u8 *buf = NULL, *buf_tmp, *Ra_buf = NULL, *Rb_buf = NULL;
 > 267		size_t buf_size, buf_size_tmp, Ra_buf_size, Rb_buf_size, g_size;
   268		int rc = -ENOMEM;
   269	
   270		point_to_bytes(Ra, &Ra_buf, &Ra_buf_size);
   271		point_to_bytes(Rb, &Rb_buf, &Rb_buf_size);
   272		if (!Ra_buf || !Rb_buf)
   273			goto out_free;
   274	
   275		buf_size = ida_size + idb_size;
   276		buf_size += Ra_buf_size;
   277		buf_size += Rb_buf_size;
   278		g_size = sm9_dim_fq12_get_size(g1);
   279		buf_size += 3 * g_size;
   280		buf = kzalloc(buf_size, GFP_KERNEL);
   281		if (!buf)
   282			goto out_free;
   283	
   284		buf_tmp = buf;
   285		buf_size_tmp = buf_size;
   286		memcpy(buf_tmp, ida, ida_size);
   287		buf_tmp += ida_size;
   288		buf_size_tmp -= ida_size;
   289	
   290		memcpy(buf_tmp, idb, idb_size);
   291		buf_tmp += idb_size;
   292		buf_size_tmp -= idb_size;
   293	
   294		memcpy(buf_tmp, Ra_buf, Ra_buf_size);
   295		buf_tmp += Ra_buf_size;
   296		buf_size_tmp -= Ra_buf_size;
   297	
   298		memcpy(buf_tmp, Rb_buf, Rb_buf_size);
   299		buf_tmp += Rb_buf_size;
   300		buf_size_tmp -= Ra_buf_size;
   301	
   302		sm9_dim_fq12_to_buf_rev(g1, buf_tmp, g_size);
   303		buf_tmp += g_size;
   304		buf_size_tmp -= g_size;
   305	
   306		sm9_dim_fq12_to_buf_rev(g2, buf_tmp, g_size);
   307		buf_tmp += g_size;
   308		buf_size_tmp -= g_size;
   309	
   310		sm9_dim_fq12_to_buf_rev(g3, buf_tmp, g_size);
   311		buf_tmp += g_size;
   312		buf_size_tmp -= g_size;
   313	
   314		rc = _sm9_kdf(SK, klen, buf, buf_size);
   315	
   316	out_free:
   317		kfree(buf);
   318		kfree(Ra_buf);
   319		kfree(Rb_buf);
   320		return rc;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
