Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB014B965;
	Sat, 22 Jun 2024 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719048767; cv=none; b=ltXpPuW0eSUP+O5itIN62wl/v2AHImmWJq9uzKKfGKL1/XJROloZim2N5y6hE/cMMfhHZRC5dJaFwmonorZlpWZbl/J1B2twKaVfuSzh42WjzHrzYqCCmcaduuUEMYDI+7vHvjJ49WrtHaIUbnOf4dCEZ6EM7zfH/rP26D04EYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719048767; c=relaxed/simple;
	bh=W2vO+MhPVEQE6EGayvdc03cCAxGUO4Xc2fdmz2I/eBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kAY9wo6UspXQhaNEgYSQi1j/Mo/mKyFrFzhAU86ficIBWnKhM2UenDzP+pZIi7VKwJjzTc0Gj9UMqMJNCfGkRUeZ/hrO0TTXWeT4EXulU9UFsJdhjnFYVBGCCRKZMc7S8GSU31+GqoFlh21yKPnT+y6hfvSsce59cvI67g0L3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JScH60+3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JScH60+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719048766; x=1750584766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2vO+MhPVEQE6EGayvdc03cCAxGUO4Xc2fdmz2I/eBI=;
  b=JScH60+3rdOW30+52wtxCHLSXC4ysQP02cx8LQ48TkmLuUDQ8v39fvtN
   wbvbIxZwLjah8au29P0EbOOD3a6Gppo4MnOhbKXbOw45vkakhyMEKTWoK
   RUMRrJ5zQ1utQ4FjmvDa1uORzIe9uQCwu7otZrpQ25C/elYZUj5h1vfi9
   Y3EkcK09LIFfKFIXXVEhjJiS0pWJSdpxiJ6+Pd71kwZGT5yMUZ9Ug1poV
   370nPxdGGKCL5q+f82DN34eRX+iniqHt5lA7ScHcpiU1W20uyzEnH+kU6
   8SnX7Ie+ewmr2DLqthruWLj3VNP9dml7en9BT17YEODUGWCGyE+3vCvHn
   w==;
X-CSE-ConnectionGUID: GESuZs6eQQeUbaSW/YrJrA==
X-CSE-MsgGUID: IBL/nUv1TMu93S2auxFPCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="27484899"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="27484899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 02:32:43 -0700
X-CSE-ConnectionGUID: 5bpCH7fkTg6x4MvPvi/pVw==
X-CSE-MsgGUID: 4rfv4OkuREepAGh+CwnXaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="42915707"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jun 2024 02:32:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKx6t-0009Vq-0x;
	Sat, 22 Jun 2024 09:32:39 +0000
Date: Sat, 22 Jun 2024 17:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [bpf-next:master 9/12] kernel/bpf/btf.c:8251:22: error: call to
 undeclared function 'btf_relocate_id'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202406221742.d2srFLVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   93265a0b79e48fde8ee23fb6e1195d7d99717063
commit: 8646db238997df36c6ad71a9d7e0b52ceee221b2 [9/12] libbpf,bpf: Share BTF relocate-related code with kernel
config: i386-buildonly-randconfig-003-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221742.d2srFLVI-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221742.d2srFLVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221742.d2srFLVI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/btf.c:8251:22: error: call to undeclared function 'btf_relocate_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8251 |                 set->pairs[i].id = btf_relocate_id(btf, set->pairs[i].id);
         |                                    ^
   kernel/bpf/btf.c:8251:22: note: did you mean 'btf_relocate'?
   include/linux/btf.h:556:5: note: 'btf_relocate' declared here
     556 | int btf_relocate(struct btf *btf, const struct btf *base_btf, __u32 **map_ids);
         |     ^
   kernel/bpf/btf.c:8376:37: error: call to undeclared function 'btf_relocate_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8376 |                 ret = btf_check_kfunc_protos(btf, btf_relocate_id(btf, kset->set->pairs[i].id),
         |                                                   ^
   kernel/bpf/btf.c:8440:17: error: call to undeclared function 'btf_relocate_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8440 |                 dtor_btf_id = btf_relocate_id(btf, dtors[i].kfunc_btf_id);
         |                               ^
   kernel/bpf/btf.c:8529:26: error: call to undeclared function 'btf_relocate_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8529 |                 tab->dtors[i].btf_id = btf_relocate_id(btf, tab->dtors[i].btf_id);
         |                                        ^
   4 errors generated.
--
>> tools/lib/bpf/btf_relocate.c:206:23: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     206 |                 info[id].needs_size = true;
         |                                     ^ ~~~~
   tools/lib/bpf/btf_relocate.c:256:25: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     256 |                         base_info.needs_size = true;
         |                                              ^ ~~~~
   2 warnings generated.


vim +/btf_relocate_id +8251 kernel/bpf/btf.c

  8155	
  8156	static int btf_populate_kfunc_set(struct btf *btf, enum btf_kfunc_hook hook,
  8157					  const struct btf_kfunc_id_set *kset)
  8158	{
  8159		struct btf_kfunc_hook_filter *hook_filter;
  8160		struct btf_id_set8 *add_set = kset->set;
  8161		bool vmlinux_set = !btf_is_module(btf);
  8162		bool add_filter = !!kset->filter;
  8163		struct btf_kfunc_set_tab *tab;
  8164		struct btf_id_set8 *set;
  8165		u32 set_cnt, i;
  8166		int ret;
  8167	
  8168		if (hook >= BTF_KFUNC_HOOK_MAX) {
  8169			ret = -EINVAL;
  8170			goto end;
  8171		}
  8172	
  8173		if (!add_set->cnt)
  8174			return 0;
  8175	
  8176		tab = btf->kfunc_set_tab;
  8177	
  8178		if (tab && add_filter) {
  8179			u32 i;
  8180	
  8181			hook_filter = &tab->hook_filters[hook];
  8182			for (i = 0; i < hook_filter->nr_filters; i++) {
  8183				if (hook_filter->filters[i] == kset->filter) {
  8184					add_filter = false;
  8185					break;
  8186				}
  8187			}
  8188	
  8189			if (add_filter && hook_filter->nr_filters == BTF_KFUNC_FILTER_MAX_CNT) {
  8190				ret = -E2BIG;
  8191				goto end;
  8192			}
  8193		}
  8194	
  8195		if (!tab) {
  8196			tab = kzalloc(sizeof(*tab), GFP_KERNEL | __GFP_NOWARN);
  8197			if (!tab)
  8198				return -ENOMEM;
  8199			btf->kfunc_set_tab = tab;
  8200		}
  8201	
  8202		set = tab->sets[hook];
  8203		/* Warn when register_btf_kfunc_id_set is called twice for the same hook
  8204		 * for module sets.
  8205		 */
  8206		if (WARN_ON_ONCE(set && !vmlinux_set)) {
  8207			ret = -EINVAL;
  8208			goto end;
  8209		}
  8210	
  8211		/* In case of vmlinux sets, there may be more than one set being
  8212		 * registered per hook. To create a unified set, we allocate a new set
  8213		 * and concatenate all individual sets being registered. While each set
  8214		 * is individually sorted, they may become unsorted when concatenated,
  8215		 * hence re-sorting the final set again is required to make binary
  8216		 * searching the set using btf_id_set8_contains function work.
  8217		 *
  8218		 * For module sets, we need to allocate as we may need to relocate
  8219		 * BTF ids.
  8220		 */
  8221		set_cnt = set ? set->cnt : 0;
  8222	
  8223		if (set_cnt > U32_MAX - add_set->cnt) {
  8224			ret = -EOVERFLOW;
  8225			goto end;
  8226		}
  8227	
  8228		if (set_cnt + add_set->cnt > BTF_KFUNC_SET_MAX_CNT) {
  8229			ret = -E2BIG;
  8230			goto end;
  8231		}
  8232	
  8233		/* Grow set */
  8234		set = krealloc(tab->sets[hook],
  8235			       offsetof(struct btf_id_set8, pairs[set_cnt + add_set->cnt]),
  8236			       GFP_KERNEL | __GFP_NOWARN);
  8237		if (!set) {
  8238			ret = -ENOMEM;
  8239			goto end;
  8240		}
  8241	
  8242		/* For newly allocated set, initialize set->cnt to 0 */
  8243		if (!tab->sets[hook])
  8244			set->cnt = 0;
  8245		tab->sets[hook] = set;
  8246	
  8247		/* Concatenate the two sets */
  8248		memcpy(set->pairs + set->cnt, add_set->pairs, add_set->cnt * sizeof(set->pairs[0]));
  8249		/* Now that the set is copied, update with relocated BTF ids */
  8250		for (i = set->cnt; i < set->cnt + add_set->cnt; i++)
> 8251			set->pairs[i].id = btf_relocate_id(btf, set->pairs[i].id);
  8252	
  8253		set->cnt += add_set->cnt;
  8254	
  8255		sort(set->pairs, set->cnt, sizeof(set->pairs[0]), btf_id_cmp_func, NULL);
  8256	
  8257		if (add_filter) {
  8258			hook_filter = &tab->hook_filters[hook];
  8259			hook_filter->filters[hook_filter->nr_filters++] = kset->filter;
  8260		}
  8261		return 0;
  8262	end:
  8263		btf_free_kfunc_set_tab(btf);
  8264		return ret;
  8265	}
  8266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
