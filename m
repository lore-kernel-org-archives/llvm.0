Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A20817CD;
	Thu, 19 Jan 2023 03:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674100473; x=1705636473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fKnSuL5JDmKqjH3nFy804uYKh7V2Mwa9PISlu/ncOLQ=;
  b=K0jIwRYWFNVv0NM8WgHHykQmzpF9aGRPSCnDthhzXSjdCNjO5/d3F0+V
   DCr3kbZPjFpbzMpDVjxkUa625IMaLPck9SN0De2gqffN9NE2DQp53nlls
   pFt1bzEJYZNib02MR82L5gZkpLSsgQnRJKfo7mv88Bhu3Vy+U0UvJlfWh
   owrvX7gPk6MBW6JgxEWfFFXUi4D5sNEYXkdl/Un+0gLGUGiqyjYhpls1s
   nqpYP8O7YAhEECJQXfzXkeKSiqp+JyZH6GZm43yAAgNbWjnTKNnvdyD3/
   A6ZBNhRWRdifJuWAekmYL6Kene0lncCelIc0tHmwubn2BSSASffb2AJem
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323869391"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323869391"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 19:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="660043118"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="660043118"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 19:54:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIM0U-00013O-18;
	Thu, 19 Jan 2023 03:54:30 +0000
Date: Thu, 19 Jan 2023 11:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 14/27]
 kernel/bpf/trampoline.c:1330:6: warning: variable 'tr_new' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202301191114.biPXnVOe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   747784185d106a06b429736196d8817cb2d12a6f
commit: d1a374a693976022b52761f1d659367447982194 [14/27] bpf: Make single trampolines aware of multi trampolines
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230119/202301191114.biPXnVOe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=d1a374a693976022b52761f1d659367447982194
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_1
        git checkout d1a374a693976022b52761f1d659367447982194
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:1330:6: warning: variable 'tr_new' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!bmap_new || !bmap_tmp) {
               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1362:9: note: uninitialized use occurs here
           return tr_new;
                  ^~~~~~
   kernel/bpf/trampoline.c:1330:2: note: remove the 'if' if its condition is always false
           if (!bmap_new || !bmap_tmp) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:1330:6: warning: variable 'tr_new' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
           if (!bmap_new || !bmap_tmp) {
               ^~~~~~~~~
   kernel/bpf/trampoline.c:1362:9: note: uninitialized use occurs here
           return tr_new;
                  ^~~~~~
   kernel/bpf/trampoline.c:1330:6: note: remove the '||' if its condition is always false
           if (!bmap_new || !bmap_tmp) {
               ^~~~~~~~~~~~
   kernel/bpf/trampoline.c:1315:36: note: initialize the variable 'tr_new' to silence this warning
           struct bpf_trampoline *tr, *tr_new;
                                             ^
                                              = NULL
   2 warnings generated.


vim +1330 kernel/bpf/trampoline.c

  1311	
  1312	static struct bpf_trampoline* check_multi_trampoline(u64 key)
  1313	{
  1314		struct btf_bitmap *bmap_tmp, *bmap_new;
  1315		struct bpf_trampoline *tr, *tr_new;
  1316		u32 obj_id, btf_id;
  1317		int err;
  1318		unsigned long *ip;
  1319	
  1320		bpf_trampoline_unpack_key(key, &obj_id, &btf_id);
  1321		if (obj_id != btf_obj_id(btf_vmlinux))
  1322			return NULL;
  1323	
  1324		tr = in_multi_trampoline(btf_id);
  1325		if (!tr)
  1326			return NULL;
  1327	
  1328		bmap_new = btf_bitmap_funcs_id(btf_id);
  1329		bmap_tmp = btf_bitmap_funcs_alloc();
> 1330		if (!bmap_new || !bmap_tmp) {
  1331			err = -ENOMEM;
  1332			goto out;
  1333		}
  1334	
  1335		tr_new = trampoline_multi_split_trampoline(tr, bmap_new);
  1336		if (IS_ERR(tr_new))
  1337			goto out;
  1338	
  1339		btf_bitmap_funcs_resolve(bmap_new, &ip);
  1340		tr_new->func.addr = (void*) *ip;
  1341		kfree(ip);
  1342	
  1343		btf_bitmap_copy(bmap_tmp, tr->multi.bmap);
  1344		btf_bitmap_andnot(tr->multi.bmap, tr->multi.bmap, bmap_new);
  1345		err = trampoline_multi_reset_bmap(tr);
  1346		if (err) {
  1347			tr_new = ERR_PTR(err);
  1348			goto out_rollback;
  1349		}
  1350	
  1351		err = bpf_trampoline_update(tr_new, true);
  1352	
  1353	out_rollback:
  1354		if (err) {
  1355			btf_bitmap_copy(tr->multi.bmap, bmap_tmp);
  1356			bpf_trampoline_free(tr_new);
  1357			tr_new = ERR_PTR(err);
  1358		}
  1359	out:
  1360		btf_bitmap_free(bmap_new);
  1361		btf_bitmap_free(bmap_tmp);
  1362		return tr_new;
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
