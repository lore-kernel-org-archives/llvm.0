Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A700817;
	Mon, 26 Feb 2024 00:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708907614; cv=none; b=Icd7O72FxRE2mCGZ9n3/dx6g1fIuMb3v8ocw93PBi1kI/XWzAebL/8981jKnsAV0XviesTSWd4uyEkO6I/JuYsnXnl25u2Lg25IXPMRAL0xGVELtQ6ysU5WmTqMZTqKdDGg+z3Vv3+c+SR/O3mKTmrDq1XcJoyBeEQLonnAZVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708907614; c=relaxed/simple;
	bh=ZMBMcLK5RpzjPhN6mgEp4eouqAMk4n7fNLd456YbA+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDYaEhUTxx/X94S47dG4ktaonK847YzgbQpy+ko0PZ7GeYaIe1Q1ebwTa4OVrm3bxTwYNG6poheC0b3nInyZe0LR5I1ptPoEj5zUrxGsriEM4DZ1oj5FCHHs+uQFRFX7TaQWXlsWe5SP2NEWAxmpCL7kQZ9YCX0g8J59K36t/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkXwlrN2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkXwlrN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708907612; x=1740443612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZMBMcLK5RpzjPhN6mgEp4eouqAMk4n7fNLd456YbA+w=;
  b=ZkXwlrN2Swa+A5C4npqM9CL+umjXW8LNZ/iNjvJ6gYQhoOtHGYQqTfNx
   sQ7pO5lrF6CM9SmZGg6+k8Dhu3EKymfzRyYLej/ksWxJp6kCHkw/3g21V
   HtlWV6zlmqcKTV8LL63g3sHNAEvt4lDwsTH+F1Z/ncem6+Z4v9r1HuATb
   +lpKZ9iWfMHUc/i2wX0iQknUYhPF8mTinodJG6jti8pDKs/f/w48PjAV4
   Ky0Sh+L1+/62Z5hgiMxuN+AESaMNWVzPnhf0Ys3LGA4HOsZyS2s9eegdb
   PnaxpbISba7f5vYU14Jxq+AJ89RRpf+404RBEWwz/hxPHLOyA3zJAG3Pz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14608088"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="14608088"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 16:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="11182883"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2024 16:33:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reOvw-0009sY-0f;
	Mon, 26 Feb 2024 00:33:28 +0000
Date: Mon, 26 Feb 2024 08:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 18/20] mm/damon/core.c:752:44: warning: variable
 'goal' used in loop condition not modified in loop body
Message-ID: <202402260800.F3OIgZl9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   a9e8680aa284cf5fd994087542cfa9e6f5f491b4
commit: 74d79c7a174ab26a8f99bc482dd6b067c93bc554 [18/20] mm/damon: implement DAMON context input-only update function
config: i386-buildonly-randconfig-003-20240226 (https://download.01.org/0day-ci/archive/20240226/202402260800.F3OIgZl9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402260800.F3OIgZl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402260800.F3OIgZl9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:752:44: warning: variable 'goal' used in loop condition not modified in loop body [-Wfor-loop-analysis]
     752 |         for (goal = damos_nth_quota_goal(i, src); goal; )
         |                                                   ^~~~
>> mm/damon/core.c:799:42: warning: variable 'filter' used in loop condition not modified in loop body [-Wfor-loop-analysis]
     799 |         for (filter = damos_nth_filter(i, src); filter;)
         |                                                 ^~~~~~
>> mm/damon/core.c:853:42: warning: variable 'scheme' used in loop condition not modified in loop body [-Wfor-loop-analysis]
     853 |         for (scheme = damon_nth_scheme(i, src); scheme;)
         |                                                 ^~~~~~
>> mm/damon/core.c:841:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     841 |         int i = 0, err;
         |                    ^
>> mm/damon/core.c:929:37: warning: variable 't' used in loop condition not modified in loop body [-Wfor-loop-analysis]
     929 |         for (t = damon_nth_target(i, src); t;)
         |                                            ^
   5 warnings generated.


vim +/goal +752 mm/damon/core.c

   731	
   732	
   733	static void damos_update_quota_goals(struct damos_quota *dst,
   734			struct damos_quota *src)
   735	{
   736		struct damos_quota_goal *goal, *next;
   737		int i = 0;
   738	
   739		damos_for_each_quota_goal_safe(goal, next, dst) {
   740			struct damos_quota_goal *src_goal =
   741				damos_nth_quota_goal(i++, src);
   742	
   743			if (src_goal) {
   744				goal->metric = src_goal->metric;
   745				goal->target_value = src_goal->target_value;
   746				goal->current_value = src_goal->current_value;
   747				goal->last_psi_total = src_goal->last_psi_total;
   748				continue;
   749			}
   750			damos_destroy_quota_goal(goal);
   751		}
 > 752		for (goal = damos_nth_quota_goal(i, src); goal; )
   753			damos_move_quota_goal(dst, goal);
   754	}
   755	
   756	static struct damos_filter *damos_nth_filter(int n, struct damos *s)
   757	{
   758		struct damos_filter *filter;
   759		int i = 0;
   760	
   761		damos_for_each_filter(filter, s) {
   762			if (i++ == n)
   763				return filter;
   764		}
   765		return NULL;
   766	}
   767	
   768	static int damos_update_filters(struct damos *dst, struct damos *src)
   769	{
   770		struct damos_filter *filter, *next;
   771		int i = 0;
   772	
   773		damos_for_each_filter_safe(filter, next, dst) {
   774			struct damos_filter *src_filter = damos_nth_filter(i++, src);
   775	
   776			if (src_filter) {
   777				filter->type = src_filter->type;
   778				filter->matching = src_filter->matching;
   779				switch (src_filter->type) {
   780				case DAMOS_FILTER_TYPE_ANON:
   781					break;
   782				case DAMOS_FILTER_TYPE_MEMCG:
   783					filter->memcg_id = src_filter->memcg_id;
   784					break;
   785				case DAMOS_FILTER_TYPE_ADDR:
   786					filter->addr_range = src_filter->addr_range;
   787					break;
   788				case DAMOS_FILTER_TYPE_TARGET:
   789					filter->target_idx = src_filter->target_idx;
   790					break;
   791				default:
   792					break;
   793				}
   794				continue;
   795			}
   796			damos_destroy_filter(filter);
   797		}
   798	
 > 799		for (filter = damos_nth_filter(i, src); filter;)
   800			damos_move_filter(dst, filter);
   801		return 0;
   802	}
   803	
   804	static struct damos *damon_nth_scheme(int n, struct damon_ctx *ctx)
   805	{
   806		struct damos *s;
   807		int i = 0;
   808	
   809		damon_for_each_scheme(s, ctx) {
   810			if (i++ == n)
   811				return s;
   812		}
   813		return NULL;
   814	}
   815	
   816	static int damon_update_scheme(struct damos *dst, struct damos *src)
   817	{
   818		int err;
   819	
   820		dst->pattern = src->pattern;
   821		dst->action = src->action;
   822		dst->apply_interval_us = src->apply_interval_us;
   823		dst->quota.ms = src->quota.ms;
   824		dst->quota.sz = src->quota.sz;
   825		dst->quota.reset_interval = src->quota.reset_interval;
   826		dst->quota.weight_sz = src->quota.weight_sz;
   827		dst->quota.weight_nr_accesses = src->quota.weight_nr_accesses;
   828		dst->quota.weight_age = src->quota.weight_age;
   829	
   830		damos_update_quota_goals(&dst->quota, &src->quota);
   831	
   832		dst->wmarks = src->wmarks;
   833	
   834		err = damos_update_filters(dst, src);
   835		return err;
   836	}
   837	
   838	static int damon_update_schemes(struct damon_ctx *dst, struct damon_ctx *src)
   839	{
   840		struct damos *scheme, *next;
 > 841		int i = 0, err;
   842	
   843		damon_for_each_scheme_safe(scheme, next, dst) {
   844			struct damos *src_scheme = damon_nth_scheme(i++, src);
   845	
   846			if (src_scheme) {
   847				err = damon_update_scheme(scheme, src_scheme);
   848				continue;
   849			}
   850			damon_destroy_scheme(scheme);
   851		}
   852	
 > 853		for (scheme = damon_nth_scheme(i, src); scheme;)
   854			damon_move_scheme(dst, scheme);
   855		return 0;
   856	}
   857	
   858	static int damon_update_target_regions(struct damon_target *dst,
   859			struct damon_target *src)
   860	{
   861		struct damon_addr_range *ranges;
   862		int i = 0, err;
   863		struct damon_region *r;
   864	
   865		damon_for_each_region(r, src)
   866			i++;
   867		if (!i)
   868			return 0;
   869		ranges = kmalloc_array(i, sizeof(*ranges), GFP_KERNEL | __GFP_NOWARN);
   870		if (!ranges)
   871			return -ENOMEM;
   872		i = 0;
   873		damon_for_each_region(r, src) {
   874			if (r->ar.start > r->ar.end) {
   875				err = -EINVAL;
   876				goto out;
   877			}
   878			ranges[i].start = r->ar.start;
   879			ranges[i++].end = r->ar.end;
   880			if (i == 1)
   881				continue;
   882			if (ranges[i - 2].end > ranges[i - 1].start) {
   883				err = -EINVAL;
   884				goto out;
   885			}
   886		}
   887		err = damon_set_regions(dst, ranges, i);
   888	out:
   889		kfree(ranges);
   890		return err;
   891	}
   892	
   893	static struct damon_target *damon_nth_target(int n, struct damon_ctx *ctx)
   894	{
   895		struct damon_target *t;
   896		int i = 0;
   897	
   898		damon_for_each_target(t, ctx) {
   899			if (i++ == n)
   900				return t;
   901		}
   902		return NULL;
   903	}
   904	
   905	static int damon_update_targets(struct damon_ctx *dst, struct damon_ctx *src)
   906	{
   907		struct damon_target *t, *next;
   908		int i = 0, err;
   909	
   910		damon_for_each_target_safe(t, next, dst) {
   911			struct damon_target *src_target = damon_nth_target(i++, src);
   912	
   913			if (damon_target_has_pid(dst))
   914				put_pid(t->pid);
   915	
   916			if (src_target) {
   917				if (damon_target_has_pid(src))
   918					get_pid(src_target->pid);
   919				t->pid = src_target->pid;
   920	
   921				err = damon_update_target_regions(t, src_target);
   922				if (err)
   923					return err;
   924				continue;
   925			}
   926			damon_destroy_target(t);
   927		}
   928	
 > 929		for (t = damon_nth_target(i, src); t;)
   930			damon_move_target(dst, t);
   931		return 0;
   932	}
   933	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
