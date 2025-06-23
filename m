Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F622A7E4;
	Mon, 23 Jun 2025 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721989; cv=none; b=gFjtgGJjru1aljIoo1l9BTOhtBkZPbUOgQg1FcdfeqyOUEG/+Ovd1Pms/6QX4qu6LyQ5DmzC1zIeWrUtxp2zAI0+aEABzmcmU9tPVjqpqXy/G+qsCXt56jJ+vBmvkMEMR32vk7kBXTZock+cLmgIhPJgPYRdzWp/B+gJcV6hhhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721989; c=relaxed/simple;
	bh=Hym7tv5d7gfKI40fpUIiWhMlI4kRKv5SHy3vs6jk1sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OOu7oVI8yj6026zQ1hIwAblvf+TgIyx3EeP8OjLiz3MTtIwDfuwEvd2PRL9S/YCqXgK2+5xKQeR5mafkqzA1odqkoGKm9Yz3OFSgE2Q7OcGdRVfqVjatW+MgLd1yYxaR8KGloh35gghT2mYJA8Nk2em84sNwuyfq513QiOxiTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3hB5THL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3hB5THL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750721987; x=1782257987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hym7tv5d7gfKI40fpUIiWhMlI4kRKv5SHy3vs6jk1sg=;
  b=c3hB5THLyvzNKoxEFZAoqq111buIiIg4uZsUZiOueFL6DttawC7d3wfV
   RNm1pSuNBEM6IPdOkyVh75pRLjmLZMUJCkqz5FYopjXln0z9YYpL9F0mI
   ivpQ4m23Oxyn8DExcWRLKp4ngCTDaTk7w5RwTFlZnPccLWpawFmQ2vH3s
   YhRj1Sg+Mq0K/SsNCHW4llwajAWfBj63+eP2yPh0fbGmRJXu2fOD2Nz1w
   Dytc0h0J1YoffXkrXFIgxJ0NFtPS+X9JLikvIJtVuPhjUUNTxoCFfHetE
   O4KJt+FFX8dq5Aa2uOe0WSt5thALmubHi9CR3uc/MLb20dHnJBeDiL7p+
   Q==;
X-CSE-ConnectionGUID: CJNFRgLtTMuqQvsSRedMxQ==
X-CSE-MsgGUID: gGDkL1e1Q4K5dwkIm4keCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53019190"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="53019190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:39:47 -0700
X-CSE-ConnectionGUID: sVaTlNx8Sumfdto8y/rgqw==
X-CSE-MsgGUID: p/Dd2XodRt2v0iFtUPXhaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="182614408"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2025 16:39:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTqlL-000RWC-03;
	Mon, 23 Jun 2025 23:39:43 +0000
Date: Tue, 24 Jun 2025 07:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 9/22]
 kernel/bpf/trampoline.c:274:34: error: variable has incomplete type 'struct
 bpf_trampoline_ops'
Message-ID: <202506240711.d4nFtS7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: 239f8b5e1d71ef2f591943c50dc1182f64c23fe7 [9/22] bpf: Add struct bpf_trampoline_ops
config: s390-randconfig-001-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240711.d4nFtS7i-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240711.d4nFtS7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240711.d4nFtS7i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/trampoline.c:6:
   include/linux/ftrace.h:575:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:580:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:585:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:585:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> kernel/bpf/trampoline.c:274:34: error: variable has incomplete type 'struct bpf_trampoline_ops'
     274 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^
   kernel/bpf/trampoline.c:274:15: note: forward declaration of 'struct bpf_trampoline_ops'
     274 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
>> kernel/bpf/trampoline.c:460:12: error: incomplete definition of type 'struct bpf_trampoline_ops'
     460 |                 err = ops->unregister_fentry(tr, tr->cur_image->image, data);
         |                       ~~~^
   kernel/bpf/trampoline.c:274:15: note: forward declaration of 'struct bpf_trampoline_ops'
     274 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
   kernel/bpf/trampoline.c:520:12: error: incomplete definition of type 'struct bpf_trampoline_ops'
     520 |                 err = ops->modify_fentry(tr, tr->cur_image->image, im->image, lock_direct_mutex, data);
         |                       ~~~^
   kernel/bpf/trampoline.c:274:15: note: forward declaration of 'struct bpf_trampoline_ops'
     274 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
   kernel/bpf/trampoline.c:523:12: error: incomplete definition of type 'struct bpf_trampoline_ops'
     523 |                 err = ops->register_fentry(tr, im->image, data);
         |                       ~~~^
   kernel/bpf/trampoline.c:274:15: note: forward declaration of 'struct bpf_trampoline_ops'
     274 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
   3 warnings and 4 errors generated.


vim +274 kernel/bpf/trampoline.c

   273	
 > 274	static struct bpf_trampoline_ops trampoline_ops = {
   275		.register_fentry   = register_fentry,
   276		.unregister_fentry = unregister_fentry,
   277		.modify_fentry     = modify_fentry,
   278	};
   279	
   280	static struct bpf_tramp_links *
   281	bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_arg)
   282	{
   283		struct bpf_tramp_link *link;
   284		struct bpf_tramp_links *tlinks;
   285		struct bpf_tramp_link **links;
   286		int kind;
   287	
   288		*total = 0;
   289		tlinks = kcalloc(BPF_TRAMP_MAX, sizeof(*tlinks), GFP_KERNEL);
   290		if (!tlinks)
   291			return ERR_PTR(-ENOMEM);
   292	
   293		for (kind = 0; kind < BPF_TRAMP_MAX; kind++) {
   294			tlinks[kind].nr_links = tr->progs_cnt[kind];
   295			*total += tr->progs_cnt[kind];
   296			links = tlinks[kind].links;
   297	
   298			hlist_for_each_entry(link, &tr->progs_hlist[kind], tramp_hlist) {
   299				*ip_arg |= link->link.prog->call_get_func_ip;
   300				*links++ = link;
   301			}
   302		}
   303		return tlinks;
   304	}
   305	
   306	static void bpf_tramp_image_free(struct bpf_tramp_image *im)
   307	{
   308		bpf_image_ksym_del(&im->ksym);
   309		arch_free_bpf_trampoline(im->image, im->size);
   310		bpf_jit_uncharge_modmem(im->size);
   311		percpu_ref_exit(&im->pcref);
   312		kfree_rcu(im, rcu);
   313	}
   314	
   315	static void __bpf_tramp_image_put_deferred(struct work_struct *work)
   316	{
   317		struct bpf_tramp_image *im;
   318	
   319		im = container_of(work, struct bpf_tramp_image, work);
   320		bpf_tramp_image_free(im);
   321	}
   322	
   323	/* callback, fexit step 3 or fentry step 2 */
   324	static void __bpf_tramp_image_put_rcu(struct rcu_head *rcu)
   325	{
   326		struct bpf_tramp_image *im;
   327	
   328		im = container_of(rcu, struct bpf_tramp_image, rcu);
   329		INIT_WORK(&im->work, __bpf_tramp_image_put_deferred);
   330		schedule_work(&im->work);
   331	}
   332	
   333	/* callback, fexit step 2. Called after percpu_ref_kill confirms. */
   334	static void __bpf_tramp_image_release(struct percpu_ref *pcref)
   335	{
   336		struct bpf_tramp_image *im;
   337	
   338		im = container_of(pcref, struct bpf_tramp_image, pcref);
   339		call_rcu_tasks(&im->rcu, __bpf_tramp_image_put_rcu);
   340	}
   341	
   342	/* callback, fexit or fentry step 1 */
   343	static void __bpf_tramp_image_put_rcu_tasks(struct rcu_head *rcu)
   344	{
   345		struct bpf_tramp_image *im;
   346	
   347		im = container_of(rcu, struct bpf_tramp_image, rcu);
   348		if (im->ip_after_call)
   349			/* the case of fmod_ret/fexit trampoline and CONFIG_PREEMPTION=y */
   350			percpu_ref_kill(&im->pcref);
   351		else
   352			/* the case of fentry trampoline */
   353			call_rcu_tasks(&im->rcu, __bpf_tramp_image_put_rcu);
   354	}
   355	
   356	static void bpf_tramp_image_put(struct bpf_tramp_image *im)
   357	{
   358		/* The trampoline image that calls original function is using:
   359		 * rcu_read_lock_trace to protect sleepable bpf progs
   360		 * rcu_read_lock to protect normal bpf progs
   361		 * percpu_ref to protect trampoline itself
   362		 * rcu tasks to protect trampoline asm not covered by percpu_ref
   363		 * (which are few asm insns before __bpf_tramp_enter and
   364		 *  after __bpf_tramp_exit)
   365		 *
   366		 * The trampoline is unreachable before bpf_tramp_image_put().
   367		 *
   368		 * First, patch the trampoline to avoid calling into fexit progs.
   369		 * The progs will be freed even if the original function is still
   370		 * executing or sleeping.
   371		 * In case of CONFIG_PREEMPT=y use call_rcu_tasks() to wait on
   372		 * first few asm instructions to execute and call into
   373		 * __bpf_tramp_enter->percpu_ref_get.
   374		 * Then use percpu_ref_kill to wait for the trampoline and the original
   375		 * function to finish.
   376		 * Then use call_rcu_tasks() to make sure few asm insns in
   377		 * the trampoline epilogue are done as well.
   378		 *
   379		 * In !PREEMPT case the task that got interrupted in the first asm
   380		 * insns won't go through an RCU quiescent state which the
   381		 * percpu_ref_kill will be waiting for. Hence the first
   382		 * call_rcu_tasks() is not necessary.
   383		 */
   384		if (im->ip_after_call) {
   385			int err = bpf_arch_text_poke(im->ip_after_call, BPF_MOD_JUMP,
   386						     NULL, im->ip_epilogue);
   387			WARN_ON(err);
   388			if (IS_ENABLED(CONFIG_TASKS_RCU))
   389				call_rcu_tasks(&im->rcu, __bpf_tramp_image_put_rcu_tasks);
   390			else
   391				percpu_ref_kill(&im->pcref);
   392			return;
   393		}
   394	
   395		/* The trampoline without fexit and fmod_ret progs doesn't call original
   396		 * function and doesn't use percpu_ref.
   397		 * Use call_rcu_tasks_trace() to wait for sleepable progs to finish.
   398		 * Then use call_rcu_tasks() to wait for the rest of trampoline asm
   399		 * and normal progs.
   400		 */
   401		call_rcu_tasks_trace(&im->rcu, __bpf_tramp_image_put_rcu_tasks);
   402	}
   403	
   404	static struct bpf_tramp_image *bpf_tramp_image_alloc(u64 key, int size)
   405	{
   406		struct bpf_tramp_image *im;
   407		struct bpf_ksym *ksym;
   408		void *image;
   409		int err = -ENOMEM;
   410	
   411		im = kzalloc(sizeof(*im), GFP_KERNEL);
   412		if (!im)
   413			goto out;
   414	
   415		err = bpf_jit_charge_modmem(size);
   416		if (err)
   417			goto out_free_im;
   418		im->size = size;
   419	
   420		err = -ENOMEM;
   421		im->image = image = arch_alloc_bpf_trampoline(size);
   422		if (!image)
   423			goto out_uncharge;
   424	
   425		err = percpu_ref_init(&im->pcref, __bpf_tramp_image_release, 0, GFP_KERNEL);
   426		if (err)
   427			goto out_free_image;
   428	
   429		ksym = &im->ksym;
   430		INIT_LIST_HEAD_RCU(&ksym->lnode);
   431		snprintf(ksym->name, KSYM_NAME_LEN, "bpf_trampoline_%llu", key);
   432		bpf_image_ksym_init(image, size, ksym);
   433		bpf_image_ksym_add(ksym);
   434		return im;
   435	
   436	out_free_image:
   437		arch_free_bpf_trampoline(im->image, im->size);
   438	out_uncharge:
   439		bpf_jit_uncharge_modmem(size);
   440	out_free_im:
   441		kfree(im);
   442	out:
   443		return ERR_PTR(err);
   444	}
   445	
   446	static int bpf_trampoline_update_ops(struct bpf_trampoline *tr, bool lock_direct_mutex,
   447					     struct bpf_trampoline_ops *ops, void *data)
   448	{
   449		struct bpf_tramp_image *im;
   450		struct bpf_tramp_links *tlinks;
   451		u32 orig_flags = tr->flags;
   452		bool ip_arg = false;
   453		int err, total, size;
   454	
   455		tlinks = bpf_trampoline_get_progs(tr, &total, &ip_arg);
   456		if (IS_ERR(tlinks))
   457			return PTR_ERR(tlinks);
   458	
   459		if (total == 0) {
 > 460			err = ops->unregister_fentry(tr, tr->cur_image->image, data);
   461			bpf_tramp_image_put(tr->cur_image);
   462			tr->cur_image = NULL;
   463			goto out;
   464		}
   465	
   466		/* clear all bits except SHARE_IPMODIFY and TAIL_CALL_CTX */
   467		tr->flags &= (BPF_TRAMP_F_SHARE_IPMODIFY | BPF_TRAMP_F_TAIL_CALL_CTX);
   468	
   469		if (tlinks[BPF_TRAMP_FEXIT].nr_links ||
   470		    tlinks[BPF_TRAMP_MODIFY_RETURN].nr_links) {
   471			/* NOTE: BPF_TRAMP_F_RESTORE_REGS and BPF_TRAMP_F_SKIP_FRAME
   472			 * should not be set together.
   473			 */
   474			tr->flags |= BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_SKIP_FRAME;
   475		} else {
   476			tr->flags |= BPF_TRAMP_F_RESTORE_REGS;
   477		}
   478	
   479		if (ip_arg)
   480			tr->flags |= BPF_TRAMP_F_IP_ARG;
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
