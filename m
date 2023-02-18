Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7E36D;
	Sat, 18 Feb 2023 03:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676689728; x=1708225728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TghABkNdFDxnhwoCVBWnIHd/YZxbXP7k3L/OZ8uxkcM=;
  b=ZttIMAsQijgawwg1XoUDRf4pra9DUdxEgO0xX9cplsMRazPHbEFF5PP/
   P8NEYZPngo8hh/HkMbdkruDsfomtWSRMW0opvHN49aVwHCUvLtcE1fnz2
   r79Zj0FGNGNXgLFphanSsdcOxuc0rX5ydJH7JzZuptFWSkVmojnoTUDTg
   ub9PRdQe9xIcGPypNt51q1VVxzhCh/jYQZQMx4NAu5nCsp5etHRyUjF8N
   9W1ZJyE2qlpWwFII+RvQmDFs2RduD9ubcCoH0OXTAIMXiS/wXPtCegLdf
   3LrYv6VfQph1oxLAbXvd4SxjbX/WboY1hQJlXzq/x3zhh7mzVcoqR6KjK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332143103"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="332143103"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 19:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703143146"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="703143146"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 19:08:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTDaf-000C3f-0C;
	Sat, 18 Feb 2023 03:08:45 +0000
Date: Sat, 18 Feb 2023 11:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:huge-bufs 1/2] io_uring/rsrc.c:1255:3: error: implicit
 declaration of function 'bvec_set_page' is invalid in C99
Message-ID: <202302181018.yo60sgcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux huge-bufs
head:   bd037ecf4740d89242fe180de3c8514c60b6976f
commit: e3415ec0fc67ecba22d092261b752c4326f3f513 [1/2] huge
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230218/202302181018.yo60sgcx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/isilence/linux/commit/e3415ec0fc67ecba22d092261b752c4326f3f513
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence huge-bufs
        git checkout e3415ec0fc67ecba22d092261b752c4326f3f513
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181018.yo60sgcx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/rsrc.c:1255:3: error: implicit declaration of function 'bvec_set_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   bvec_set_page(&imu->bvec[0], pages[0], size, off);
                   ^
   1 error generated.


vim +/bvec_set_page +1255 io_uring/rsrc.c

  1200	
  1201	static int io_sqe_buffer_register(struct io_ring_ctx *ctx, struct iovec *iov,
  1202					  struct io_mapped_ubuf **pimu,
  1203					  struct page **last_hpage)
  1204	{
  1205		struct io_mapped_ubuf *imu = NULL;
  1206		struct page **pages = NULL;
  1207		unsigned long off;
  1208		size_t size;
  1209		int ret, nr_pages, i;
  1210		bool huge = true;
  1211		struct page *huge_head;
  1212	
  1213		*pimu = ctx->dummy_ubuf;
  1214		if (!iov->iov_base)
  1215			return 0;
  1216	
  1217		ret = -ENOMEM;
  1218		pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
  1219					&nr_pages);
  1220		if (IS_ERR(pages)) {
  1221			ret = PTR_ERR(pages);
  1222			pages = NULL;
  1223			goto done;
  1224		}
  1225	
  1226		// ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
  1227		// if (ret) {
  1228		// 	unpin_user_pages(pages, nr_pages);
  1229		// 	goto done;
  1230		// }
  1231	
  1232		huge_head = compound_head(pages[0]);
  1233		for (i = 0; i < nr_pages; i++) {
  1234			if (!PageCompound(pages[i]) || compound_head(pages[i]) != huge_head) {
  1235				huge = false;
  1236				break;
  1237			}
  1238		}
  1239	
  1240		imu = kvmalloc(struct_size(imu, bvec, nr_pages), GFP_KERNEL);
  1241		if (!imu)
  1242			goto done;
  1243	
  1244		off = (unsigned long) iov->iov_base & ~PAGE_MASK;
  1245		size = iov->iov_len;
  1246		/* store original address for later verification */
  1247		imu->ubuf = (unsigned long) iov->iov_base;
  1248		imu->ubuf_end = imu->ubuf + iov->iov_len;
  1249		imu->nr_bvecs = nr_pages;
  1250		*pimu = imu;
  1251		ret = 0;
  1252	
  1253		if (huge) {
  1254			nr_pages = 1;
> 1255			bvec_set_page(&imu->bvec[0], pages[0], size, off);
  1256			imu->huge = true;
  1257			goto done;
  1258		}
  1259		for (i = 0; i < nr_pages; i++) {
  1260			size_t vec_len;
  1261	
  1262			vec_len = min_t(size_t, size, PAGE_SIZE - off);
  1263			imu->bvec[i].bv_page = pages[i];
  1264			imu->bvec[i].bv_len = vec_len;
  1265			imu->bvec[i].bv_offset = off;
  1266			off = 0;
  1267			size -= vec_len;
  1268		}
  1269	done:
  1270		if (ret)
  1271			kvfree(imu);
  1272		kvfree(pages);
  1273		return ret;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
