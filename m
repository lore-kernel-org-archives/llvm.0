Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7914293;
	Sun, 12 Jan 2025 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736650701; cv=none; b=R3iVZWI0lJk4KqWdO/pUbie8Hvz5IV/n7oPldgEiDTn2cL1BtSWqzi7U30v3TeOI/2kv65+4EB1LB3UAYTWYo91LjYKVnm4EtZbHg8hpPoWwQKikgcm/Vdd1sJRFvqEnn1NNTDXlbyguh0Y3i8Y+TfuR2o39LifsBHzh6j/GijM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736650701; c=relaxed/simple;
	bh=IxEiiB3f0xJ4EWEPemzriMdc3QLi6o48eQiRZ3IMPnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZitvyuXS95l/DbY7mV5ETbvtwmEzukcpZ+lr69bhIdOykQzBzYTXEBodeUkuFR4XAnDOnuriI1XnMvZgfeFHJPoIPOMkrjSXWI3c4FyxXD63BbQLlK7eekzJ+Pt8CNw/LPHUKZxVponzvv4d7hGL/gWkOJHfgm2BxUE3wmLi35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVUKIneM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVUKIneM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736650698; x=1768186698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IxEiiB3f0xJ4EWEPemzriMdc3QLi6o48eQiRZ3IMPnI=;
  b=RVUKIneM4iojvxHupYknEl+6klQEmTVMj6leoQt53U8krEATq/NJ90Xo
   S6NoNkZZlCMYZjILXbP1Q9rPW8VRx/DHHfXENEY9alYt9ZMC4mkA4ygp5
   bdk81yizeBLunVqRAzNn6Ng2HnTFOqrX9e+/dvwJihnu647ZENkskvBdN
   VYotSSr2r9WRvG/3ukEAIETWbuBvEEW6x+i76AtKYaT0OcMlVbhYqEEy3
   E8DwyYgHQgcbpK03D8F1zRJh8VfOuyyoK9/x9uuQ5H5ewOvpdnhTeXTP1
   yycmy2hSZBrMp5DWW6ttmKRLtaDlRB5lsJI2BJVeQka06yvJy0StAMduT
   w==;
X-CSE-ConnectionGUID: dBv/4Hf/TDmXL/WGP+BHaA==
X-CSE-MsgGUID: IOoeHqavSvWj5pT5Q9t7tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47567871"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47567871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 18:58:18 -0800
X-CSE-ConnectionGUID: 9W+LehN2Q+ybaFdfBxKJFg==
X-CSE-MsgGUID: Ji1haj5NSwahhisAC/YH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141387404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2025 18:58:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWoAy-000LVl-38;
	Sun, 12 Jan 2025 02:58:08 +0000
Date: Sun, 12 Jan 2025 10:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Jiao <quic_jiangenj@quicinc.com>, dvyukov@google.com,
	andreyknvl@gmail.com, corbet@lwn.net, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, nogikh@google.com, elver@google.com,
	pierre.gondois@arm.com, cmllamas@google.com,
	quic_zijuhu@quicinc.com, richard.weiyang@gmail.com,
	tglx@linutronix.de, arnd@arndb.de, catalin.marinas@arm.com,
	will@kernel.org, dennis@kernel.org, tj@kernel.org, cl@linux.com,
	ruanjinjie@huawei.com, colyli@suse.de,
	andriy.shevchenko@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel@quicinc.com,
	quic_likaid@quicinc.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
Message-ID: <202501121036.JNteuRXG-lkp@intel.com>
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Jiao/kcov-add-unique-cover-edge-and-cmp-modes/20250110-153559
base:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
patch link:    https://lore.kernel.org/r/20250110073056.2594638-1-quic_jiangenj%40quicinc.com
patch subject: [PATCH] kcov: add unique cover, edge, and cmp modes
config: um-randconfig-002-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121036.JNteuRXG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121036.JNteuRXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121036.JNteuRXG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kcov.c:309:41: error: no member named 'type' in 'struct kcov_entry'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                       ~~~~~  ^
   kernel/kcov.c:309:54: error: no member named 'type' in 'struct kcov_entry'
     309 |                         if (entry->ent == ent->ent && entry->type == ent->type &&
         |                                                                      ~~~  ^
>> kernel/kcov.c:310:15: error: no member named 'arg1' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                             ~~~~~  ^
   kernel/kcov.c:310:28: error: no member named 'arg1' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                            ~~~  ^
>> kernel/kcov.c:310:43: error: no member named 'arg2' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                         ~~~~~  ^
   kernel/kcov.c:310:56: error: no member named 'arg2' in 'struct kcov_entry'
     310 |                             entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
         |                                                                        ~~~  ^
   kernel/kcov.c:343:29: error: no member named 'type' in 'struct kcov_entry'
     343 |                         area[start_index] = ent->type;
         |                                             ~~~  ^
   kernel/kcov.c:344:33: error: no member named 'arg1' in 'struct kcov_entry'
     344 |                         area[start_index + 1] = ent->arg1;
         |                                                 ~~~  ^
   kernel/kcov.c:345:33: error: no member named 'arg2' in 'struct kcov_entry'
     345 |                         area[start_index + 2] = ent->arg2;
         |                                                 ~~~  ^
   9 errors generated.


vim +309 kernel/kcov.c

   290	
   291	static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry *ent,
   292						struct task_struct *t, unsigned int mode)
   293	{
   294		struct kcov *kcov;
   295		struct kcov_entry *entry;
   296		unsigned int key = hash_key(ent);
   297		unsigned long pos, start_index, end_pos, max_pos, *area;
   298	
   299		kcov = t->kcov;
   300	
   301		if ((mode == KCOV_MODE_TRACE_UNIQ_PC ||
   302		     mode == KCOV_MODE_TRACE_UNIQ_EDGE))
   303			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
   304				if (entry->ent == ent->ent)
   305					return;
   306			}
   307		else
   308			hash_for_each_possible_rcu(map->buckets, entry, node, key) {
 > 309				if (entry->ent == ent->ent && entry->type == ent->type &&
 > 310				    entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
   311					return;
   312				}
   313			}
   314	
   315		entry = (struct kcov_entry *)gen_pool_alloc(map->pool, 1 << MIN_POOL_ALLOC_ORDER);
   316		if (unlikely(!entry))
   317			return;
   318	
   319		barrier();
   320		memcpy(entry, ent, sizeof(*entry));
   321		hash_add_rcu(map->buckets, &entry->node, key);
   322	
   323		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_CMP)
   324			area = t->kcov_area;
   325		else
   326			area = kcov->map_edge->area;
   327	
   328		pos = READ_ONCE(area[0]) + 1;
   329		if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_EDGE) {
   330			if (likely(pos < t->kcov_size)) {
   331				WRITE_ONCE(area[0], pos);
   332				barrier();
   333				area[pos] = ent->ent;
   334			}
   335		} else {
   336			start_index = 1 + (pos - 1) * KCOV_WORDS_PER_CMP;
   337			max_pos = t->kcov_size * sizeof(unsigned long);
   338			end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
   339			if (likely(end_pos <= max_pos)) {
   340				/* See comment in __sanitizer_cov_trace_pc(). */
   341				WRITE_ONCE(area[0], pos);
   342				barrier();
   343				area[start_index] = ent->type;
   344				area[start_index + 1] = ent->arg1;
   345				area[start_index + 2] = ent->arg2;
   346				area[start_index + 3] = ent->ent;
   347			}
   348		}
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
