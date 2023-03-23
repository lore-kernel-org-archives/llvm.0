Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2CB320A;
	Thu, 23 Mar 2023 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679560651; x=1711096651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OSryejLxt6gk+vGsE4Hu4zU8CrBKuF8/dz4YaKFo1aU=;
  b=FD8TsgTtZ4Zlcez/REi9pe13kmXptCHsNuAEyr/h03WyEQwf6BKAaFtM
   Jh5BAI+BQJbmSugSBLDLviKO3/6x2cVY+V6jRBBFfZh7C5MDY7SJ3aGOR
   qZtsAyod9Im6yaztiik5h/2Wk3uMi0MgRZo68Z+NPWcB1R2qcGkQCzSXw
   KpMyLr52eVmvS0/Gej0PvIQb7U5vwcB3Tk4SZueg6Zlmk6ghGS1cOm76c
   no7pXkNSMKJyGUPZ9uP6yiHrDdPJuSrLwM9M5dd+FhmwkIizQ+9H3ae6n
   qYNTO1e/Eft9a1HVTpfFpbLtGdQYpxF5av4pa6Pbquq3tgJOKdW9ROTLR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336934789"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="336934789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 01:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684629826"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="684629826"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 01:37:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfGRh-000EAW-2P;
	Thu, 23 Mar 2023 08:37:17 +0000
Date: Thu, 23 Mar 2023 16:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Harsha Harsha <harsha.harsha@amd.com>, herbert@gondor.apana.org.au,
	davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	michals@xilinx.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	saratcha@xilinx.com, git@amd.com,
	Harsha Harsha <harsha.harsha@amd.com>,
	Dhaval Shah <dhaval.r.shah@amd.com>
Subject: Re: [PATCH V2 3/4] crypto: xilinx: Add ZynqMP RSA driver
Message-ID: <202303231642.YR2kApeH-lkp@intel.com>
References: <20230321053446.4303-4-harsha.harsha@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321053446.4303-4-harsha.harsha@amd.com>

Hi Harsha,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harsha-Harsha/firmware-xilinx-Get-the-SoC-family-specific-data-for-crypto-operation/20230321-133614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230321053446.4303-4-harsha.harsha%40amd.com
patch subject: [PATCH V2 3/4] crypto: xilinx: Add ZynqMP RSA driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303231642.YR2kApeH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cbf02c34cdd2de014bd1b1aa58c7e1478c3c83e5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Harsha-Harsha/firmware-xilinx-Get-the-SoC-family-specific-data-for-crypto-operation/20230321-133614
        git checkout cbf02c34cdd2de014bd1b1aa58c7e1478c3c83e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/crypto/xilinx/ drivers/gpu/drm/xlnx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231642.YR2kApeH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/xilinx/xilinx-rsa.c:8:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/crypto/xilinx/xilinx-rsa.c:8:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/crypto/xilinx/xilinx-rsa.c:8:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/crypto/xilinx/xilinx-rsa.c:300:12: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   else if (rq_ctx->op == XILINX_RSA_DECRYPT)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/xilinx/xilinx-rsa.c:306:49: note: uninitialized use occurs here
           crypto_finalize_akcipher_request(engine, areq, err);
                                                          ^~~
   drivers/crypto/xilinx/xilinx-rsa.c:300:8: note: remove the 'if' if its condition is always true
                   else if (rq_ctx->op == XILINX_RSA_DECRYPT)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/xilinx/xilinx-rsa.c:285:24: note: initialize the variable 'err' to silence this warning
           int need_fallback, err;
                                 ^
                                  = 0
   7 warnings generated.


vim +300 drivers/crypto/xilinx/xilinx-rsa.c

   272	
   273	static int handle_rsa_req(struct crypto_engine *engine,
   274				  void *req)
   275	{
   276		struct akcipher_request *areq = container_of(req,
   277							     struct akcipher_request,
   278							     base);
   279		struct crypto_akcipher *akcipher = crypto_akcipher_reqtfm(req);
   280		struct akcipher_alg *cipher_alg = crypto_akcipher_alg(akcipher);
   281		struct xilinx_rsa_tfm_ctx *tfm_ctx = akcipher_tfm_ctx(akcipher);
   282		struct xilinx_rsa_req_ctx *rq_ctx = akcipher_request_ctx(areq);
   283		struct akcipher_request *subreq = akcipher_request_ctx(req);
   284		struct xilinx_rsa_drv_ctx *drv_ctx;
   285		int need_fallback, err;
   286	
   287		drv_ctx = container_of(cipher_alg, struct xilinx_rsa_drv_ctx, alg);
   288	
   289		need_fallback = xilinx_fallback_check(tfm_ctx, areq);
   290		if (need_fallback) {
   291			akcipher_request_set_tfm(subreq, tfm_ctx->fbk_cipher);
   292	
   293			akcipher_request_set_callback(subreq, areq->base.flags,
   294						      NULL, NULL);
   295			akcipher_request_set_crypt(subreq, areq->src, areq->dst,
   296						   areq->src_len, areq->dst_len);
   297	
   298			if (rq_ctx->op == XILINX_RSA_ENCRYPT)
   299				err = crypto_akcipher_encrypt(subreq);
 > 300			else if (rq_ctx->op == XILINX_RSA_DECRYPT)
   301				err = crypto_akcipher_decrypt(subreq);
   302		} else {
   303			err = drv_ctx->xilinx_rsa_xcrypt(areq);
   304		}
   305	
   306		crypto_finalize_akcipher_request(engine, areq, err);
   307	
   308		return 0;
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
