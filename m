Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AA7261B9E;
	Sat, 20 Dec 2025 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238421; cv=none; b=n3yZdmos+ou4FJHjdMmJaVeuEdfw8hv3T7kZer+ju6VEq8L1sF5XSt6+835dKppKmyeao/9otkf9L3Rajgm5zM0YtD8ZLI7flYSJDKHH5RMCdTQ1iIcPtbFstKjD8y38N11YB9iUTb0TD5X7iRWcRFUQ13fc2Wff9BtCqDkZ5MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238421; c=relaxed/simple;
	bh=fwEnVU632jQp3xX9fNf+XRyU3Xz7aPvzaryLxZ99YrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttSLjr2fJ9yn3yw+3aTTr6aCzVfqJSjDTHUCw6vO5xwzZ4W8cZl31gnGut9UtEM0wzOlL/9bWEPRn9cFZxGrFpsoOFl9aRTmNBwalUeFpTRlSDeOvf3JumnjwmXKNSK/RxBkJd6GwSmuBw5zz/ddXZqVG+BZy7yQjoMvcTujhzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsI08jpd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsI08jpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766238420; x=1797774420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwEnVU632jQp3xX9fNf+XRyU3Xz7aPvzaryLxZ99YrU=;
  b=CsI08jpdqI0q7L33AhR9u+NbSx1xE/QO3HVRKPs7PsJHXe4Sxom1l/YO
   zREKG8GfTso0hq+ICUNmn9r39QFliNynx6rHamBWhFOhskX3dsP11succ
   iqBfq6UeEFWmAx0Z8xUqCOrotohHPzg/lSi7LlwwAEYXvPAd36SeTOFbb
   VgHvbjbwkd93XgDD/p/FV1NOwcklvFz3fm6z4PPI8LGlxrv/pO3FhCc+L
   qKaXTZjssSQXBqSPTOS2zbfFr/KPDhE4trdKOTNN0P2DJgukYMfQxvCNc
   qT4TS+B6Pj3W69Spvs9PIh2Ki6OCPbyggfcduiVX0Yw1ClfIHBilN3HJG
   Q==;
X-CSE-ConnectionGUID: PJVvm0UAQFCu733DMslIVA==
X-CSE-MsgGUID: 5mqFdszzQNil2EmJHIikPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68110713"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68110713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:46:57 -0800
X-CSE-ConnectionGUID: 17aZnHqxSKKD6eFowB/CDA==
X-CSE-MsgGUID: AnamBMT7TS6TjWc+OoEyWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198864812"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 05:46:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxIK-000000004a3-3wR1;
	Sat, 20 Dec 2025 13:46:52 +0000
Date: Sat, 20 Dec 2025 21:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: pr-hung <bkedx0000@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/28 1/1] net/ipv4/netfilter/ip_tables.c:329:35:
 error: expected ';' after expression
Message-ID: <202512202119.VqDj7w7y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/28
head:   76e15fe6ef9321298cff1ef706e46852baa4915b
commit: 76e15fe6ef9321298cff1ef706e46852baa4915b [1/1] Fix potential vulnerability in cloned code (net/ipv4/netfilter/ip_tables.c)
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202119.VqDj7w7y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202119.VqDj7w7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202119.VqDj7w7y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/ipv4/netfilter/ip_tables.c:329:35: error: expected ';' after expression
     329 |                             !(e->ip.flags & IPT_F_GOTO)) {
         |                                                        ^
         |                                                        ;
>> net/ipv4/netfilter/ip_tables.c:329:35: error: expected expression
>> net/ipv4/netfilter/ip_tables.c:343:30: error: use of undeclared identifier 'v'
     343 |                         e = get_entry(table_base, v);
         |                                                   ^
>> net/ipv4/netfilter/ip_tables.c:347:3: error: expected 'while' in do/while loop
     347 |                 acpar.target   = t->u.kernel.target;
         |                 ^
   net/ipv4/netfilter/ip_tables.c:277:2: note: to match this 'do'
     277 |         do {
         |         ^
>> net/ipv4/netfilter/ip_tables.c:348:20: error: use of undeclared identifier 't'
     348 |                 acpar.targinfo = t->data;
         |                                  ^
   net/ipv4/netfilter/ip_tables.c:350:13: error: use of undeclared identifier 't'
     350 |                 verdict = t->u.kernel.target->target(skb, &acpar);
         |                           ^
>> net/ipv4/netfilter/ip_tables.c:357:4: error: 'break' statement not in loop or switch statement
     357 |                         break;
         |                         ^
>> net/ipv4/netfilter/ip_tables.c:329:8: warning: expression result unused [-Wunused-value]
     329 |                             !(e->ip.flags & IPT_F_GOTO)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/netfilter/ip_tables.c:359:4: error: while loop outside of a function
     359 |         } while (!acpar.hotdrop);
         |           ^
>> net/ipv4/netfilter/ip_tables.c:361:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     361 |         xt_write_recseq_end(addend);
         |         ^
         |         int
>> net/ipv4/netfilter/ip_tables.c:361:22: error: a parameter list without types is only allowed in a function definition
     361 |         xt_write_recseq_end(addend);
         |                             ^
   net/ipv4/netfilter/ip_tables.c:362:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     362 |         local_bh_enable();
         |         ^
         |         int
>> net/ipv4/netfilter/ip_tables.c:362:17: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     362 |         local_bh_enable();
         |                        ^
         |                         void
>> net/ipv4/netfilter/ip_tables.c:362:2: error: conflicting types for 'local_bh_enable'
     362 |         local_bh_enable();
         |         ^
   include/linux/bottom_half.h:31:20: note: previous definition is here
      31 | static inline void local_bh_enable(void)
         |                    ^
>> net/ipv4/netfilter/ip_tables.c:364:2: error: expected identifier or '('
     364 |         if (acpar.hotdrop)
         |         ^
   net/ipv4/netfilter/ip_tables.c:366:2: error: expected identifier or '('
     366 |         else return verdict;
         |         ^
>> net/ipv4/netfilter/ip_tables.c:367:1: error: extraneous closing brace ('}')
     367 | }
         | ^
   1 warning and 16 errors generated.


vim +329 net/ipv4/netfilter/ip_tables.c

98e86403162d08 Jan Engelhardt            2009-04-15  220  
^1da177e4c3f41 Linus Torvalds            2005-04-16  221  /* Returns one of the generic firewall policies, like NF_ACCEPT. */
^1da177e4c3f41 Linus Torvalds            2005-04-16  222  unsigned int
8844e01062ddd8 Florian Westphal          2021-10-11  223  ipt_do_table(void *priv,
8844e01062ddd8 Florian Westphal          2021-10-11  224  	     struct sk_buff *skb,
8844e01062ddd8 Florian Westphal          2021-10-11  225  	     const struct nf_hook_state *state)
^1da177e4c3f41 Linus Torvalds            2005-04-16  226  {
8844e01062ddd8 Florian Westphal          2021-10-11  227  	const struct xt_table *table = priv;
6cb8ff3f1a535b Eric W. Biederman         2015-09-18  228  	unsigned int hook = state->hook;
^1da177e4c3f41 Linus Torvalds            2005-04-16  229  	static const char nulldevname[IFNAMSIZ] __attribute__((aligned(sizeof(long))));
5452e425adfdfc Jan Engelhardt            2008-04-14  230  	const struct iphdr *ip;
^1da177e4c3f41 Linus Torvalds            2005-04-16  231  	/* Initializing verdict to NF_DROP keeps gcc happy. */
^1da177e4c3f41 Linus Torvalds            2005-04-16  232  	unsigned int verdict = NF_DROP;
^1da177e4c3f41 Linus Torvalds            2005-04-16  233  	const char *indev, *outdev;
d5d1baa15f5b05 Jan Engelhardt            2009-06-26  234  	const void *table_base;
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  235  	struct ipt_entry *e, **jumpstack;
7814b6ec6d0d63 Florian Westphal          2015-07-14  236  	unsigned int stackidx, cpu;
d5d1baa15f5b05 Jan Engelhardt            2009-06-26  237  	const struct xt_table_info *private;
de74c169962872 Jan Engelhardt            2009-07-05  238  	struct xt_action_param acpar;
7f5c6d4f665bb5 Eric Dumazet              2011-04-04  239  	unsigned int addend;
^1da177e4c3f41 Linus Torvalds            2005-04-16  240  
^1da177e4c3f41 Linus Torvalds            2005-04-16  241  	/* Initialization */
7814b6ec6d0d63 Florian Westphal          2015-07-14  242  	stackidx = 0;
3db05fea51cdb1 Herbert Xu                2007-10-15  243  	ip = ip_hdr(skb);
1c491ba2592f62 David S. Miller           2015-04-03  244  	indev = state->in ? state->in->name : nulldevname;
1c491ba2592f62 David S. Miller           2015-04-03  245  	outdev = state->out ? state->out->name : nulldevname;
^1da177e4c3f41 Linus Torvalds            2005-04-16  246  	/* We handle fragments by dealing with the first fragment as
^1da177e4c3f41 Linus Torvalds            2005-04-16  247  	 * if it was a normal packet.  All other fragments are treated
^1da177e4c3f41 Linus Torvalds            2005-04-16  248  	 * normally, except that they will NEVER match rules that ask
^1da177e4c3f41 Linus Torvalds            2005-04-16  249  	 * things we don't know, ie. tcp syn flag or ports).  If the
^1da177e4c3f41 Linus Torvalds            2005-04-16  250  	 * rule is also a fragment-specific rule, non-fragments won't
^1da177e4c3f41 Linus Torvalds            2005-04-16  251  	 * match it. */
de74c169962872 Jan Engelhardt            2009-07-05  252  	acpar.fragoff = ntohs(ip->frag_off) & IP_OFFSET;
de74c169962872 Jan Engelhardt            2009-07-05  253  	acpar.thoff   = ip_hdrlen(skb);
b4ba26119b0605 Jan Engelhardt            2009-07-07  254  	acpar.hotdrop = false;
613dbd95723aee Pablo Neira Ayuso         2016-11-03  255  	acpar.state   = state;
^1da177e4c3f41 Linus Torvalds            2005-04-16  256  
9efdb14f76f4d7 Varsha Rao                2017-08-30  257  	WARN_ON(!(table->valid_hooks & (1 << hook)));
7f5c6d4f665bb5 Eric Dumazet              2011-04-04  258  	local_bh_disable();
7f5c6d4f665bb5 Eric Dumazet              2011-04-04  259  	addend = xt_write_recseq_begin();
d3d40f237480ab Mark Tomlinson            2021-03-08  260  	private = READ_ONCE(table->private); /* Address dependency. */
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  261  	cpu        = smp_processor_id();
482cfc318559e2 Florian Westphal          2015-06-11  262  	table_base = private->entries;
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  263  	jumpstack  = (struct ipt_entry **)private->jumpstack[cpu];
7814b6ec6d0d63 Florian Westphal          2015-07-14  264  
7814b6ec6d0d63 Florian Westphal          2015-07-14  265  	/* Switch to alternate jumpstack if we're being invoked via TEE.
7814b6ec6d0d63 Florian Westphal          2015-07-14  266  	 * TEE issues XT_CONTINUE verdict on original skb so we must not
7814b6ec6d0d63 Florian Westphal          2015-07-14  267  	 * clobber the jumpstack.
7814b6ec6d0d63 Florian Westphal          2015-07-14  268  	 *
7814b6ec6d0d63 Florian Westphal          2015-07-14  269  	 * For recursion via REJECT or SYNPROXY the stack will be clobbered
7814b6ec6d0d63 Florian Westphal          2015-07-14  270  	 * but it is no problem since absolute verdict is issued by these.
7814b6ec6d0d63 Florian Westphal          2015-07-14  271  	 */
dcebd3153e0a77 Florian Westphal          2015-07-14  272  	if (static_key_false(&xt_tee_enabled))
a1f1acb9c5db9b Sebastian Andrzej Siewior 2025-05-12  273  		jumpstack += private->stacksize * current->in_nf_duplicate;
784544739a25c3 Stephen Hemminger         2009-02-20  274  
2e4e6a17af35be Harald Welte              2006-01-12  275  	e = get_entry(table_base, private->hook_entry[hook]);
^1da177e4c3f41 Linus Torvalds            2005-04-16  276  
^1da177e4c3f41 Linus Torvalds            2005-04-16 @277  	do {
87a2e70db62fec Jan Engelhardt            2010-10-13  278  		const struct xt_entry_target *t;
dcea992aca82cb Jan Engelhardt            2010-02-24  279  		const struct xt_entry_match *ematch;
71ae0dff02d756 Florian Westphal          2015-06-11  280  		struct xt_counters *counter;
a1ff4ac84e5850 Jan Engelhardt            2009-04-15  281  
9efdb14f76f4d7 Varsha Rao                2017-08-30  282  		WARN_ON(!e);
a1ff4ac84e5850 Jan Engelhardt            2009-04-15  283  		if (!ip_packet_match(ip, indev, outdev,
de74c169962872 Jan Engelhardt            2009-07-05  284  		    &e->ip, acpar.fragoff)) {
dcea992aca82cb Jan Engelhardt            2010-02-24  285   no_match:
a1ff4ac84e5850 Jan Engelhardt            2009-04-15  286  			e = ipt_next_entry(e);
a1ff4ac84e5850 Jan Engelhardt            2009-04-15  287  			continue;
a1ff4ac84e5850 Jan Engelhardt            2009-04-15  288  		}
^1da177e4c3f41 Linus Torvalds            2005-04-16  289  
ef53d702c3614f Jan Engelhardt            2009-07-09  290  		xt_ematch_foreach(ematch, e) {
de74c169962872 Jan Engelhardt            2009-07-05  291  			acpar.match     = ematch->u.kernel.match;
de74c169962872 Jan Engelhardt            2009-07-05  292  			acpar.matchinfo = ematch->data;
de74c169962872 Jan Engelhardt            2009-07-05  293  			if (!acpar.match->match(skb, &acpar))
dcea992aca82cb Jan Engelhardt            2010-02-24  294  				goto no_match;
ef53d702c3614f Jan Engelhardt            2009-07-09  295  		}
dcea992aca82cb Jan Engelhardt            2010-02-24  296  
71ae0dff02d756 Florian Westphal          2015-06-11  297  		counter = xt_get_this_cpu_counter(&e->counters);
71ae0dff02d756 Florian Westphal          2015-06-11  298  		ADD_COUNTER(*counter, skb->len, 1);
^1da177e4c3f41 Linus Torvalds            2005-04-16  299  
dc3c09d327220d Taehee Yoo                2018-04-13  300  		t = ipt_get_target_c(e);
9efdb14f76f4d7 Varsha Rao                2017-08-30  301  		WARN_ON(!t->u.kernel.target);
ba9dda3ab5a865 Jozsef Kadlecsik          2007-07-07  302  
f0165888610a17 Gao feng                  2013-03-21  303  #if IS_ENABLED(CONFIG_NETFILTER_XT_TARGET_TRACE)
ba9dda3ab5a865 Jozsef Kadlecsik          2007-07-07  304  		/* The packet is traced: log it */
3db05fea51cdb1 Herbert Xu                2007-10-15  305  		if (unlikely(skb->nf_trace))
9dff2c966a0a79 Eric W. Biederman         2015-09-15  306  			trace_packet(state->net, skb, hook, state->in,
9dff2c966a0a79 Eric W. Biederman         2015-09-15  307  				     state->out, table->name, private, e);
ba9dda3ab5a865 Jozsef Kadlecsik          2007-07-07  308  #endif
^1da177e4c3f41 Linus Torvalds            2005-04-16  309  		/* Standard target? */
^1da177e4c3f41 Linus Torvalds            2005-04-16  310  		if (!t->u.kernel.target->target) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  311  			int v;
^1da177e4c3f41 Linus Torvalds            2005-04-16  312  
87a2e70db62fec Jan Engelhardt            2010-10-13  313  			v = ((struct xt_standard_target *)t)->verdict;
^1da177e4c3f41 Linus Torvalds            2005-04-16  314  			if (v < 0) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  315  				/* Pop from stack? */
243bf6e29eef64 Jan Engelhardt            2010-10-13  316  				if (v != XT_RETURN) {
95c961747284a6 Eric Dumazet              2012-04-15  317  					verdict = (unsigned int)(-v) - 1;
^1da177e4c3f41 Linus Torvalds            2005-04-16  318  					break;
^1da177e4c3f41 Linus Torvalds            2005-04-16  319  				}
7814b6ec6d0d63 Florian Westphal          2015-07-14  320  				if (stackidx == 0) {
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  321  					e = get_entry(table_base,
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  322  					    private->underflow[hook]);
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  323  				} else {
7814b6ec6d0d63 Florian Westphal          2015-07-14  324  					e = jumpstack[--stackidx];
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  325  					e = ipt_next_entry(e);
f3c5c1bfd43085 Jan Engelhardt            2010-04-19  326  				}
^1da177e4c3f41 Linus Torvalds            2005-04-16  327  				continue;
^1da177e4c3f41 Linus Torvalds            2005-04-16  328  			}
57ebd808a97d7c Florian Westphal          2018-02-07 @329  			    !(e->ip.flags & IPT_F_GOTO)) {
76e15fe6ef9321 pr-hung                   2025-12-18  330  			if (table_base + v != ipt_next_entry(e) &&
57ebd808a97d7c Florian Westphal          2018-02-07  331  				if (unlikely(stackidx >= private->stacksize)) {
76e15fe6ef9321 pr-hung                   2025-12-18  332  				if (unlikely(stackidx >= private->stacksize)) {
76e15fe6ef9321 pr-hung                   2025-12-18  333  					verdict = NF_DROP;
57ebd808a97d7c Florian Westphal          2018-02-07  334  					verdict = NF_DROP;
57ebd808a97d7c Florian Westphal          2018-02-07  335  					break;
76e15fe6ef9321 pr-hung                   2025-12-18  336  					break;
76e15fe6ef9321 pr-hung                   2025-12-18  337  				}
57ebd808a97d7c Florian Westphal          2018-02-07  338  				}
7814b6ec6d0d63 Florian Westphal          2015-07-14  339  				jumpstack[stackidx++] = e;
57ebd808a97d7c Florian Westphal          2018-02-07  340  			}
76e15fe6ef9321 pr-hung                   2025-12-18  341  			}
^1da177e4c3f41 Linus Torvalds            2005-04-16  342  
^1da177e4c3f41 Linus Torvalds            2005-04-16 @343  			e = get_entry(table_base, v);
7a6b1c46e28ab0 Jan Engelhardt            2009-04-15  344  			continue;
7a6b1c46e28ab0 Jan Engelhardt            2009-04-15  345  		}
7a6b1c46e28ab0 Jan Engelhardt            2009-04-15  346  
de74c169962872 Jan Engelhardt            2009-07-05 @347  		acpar.target   = t->u.kernel.target;
de74c169962872 Jan Engelhardt            2009-07-05 @348  		acpar.targinfo = t->data;
bb70dfa5f8ab4a Jan Engelhardt            2009-04-15  349  
de74c169962872 Jan Engelhardt            2009-07-05 @350  		verdict = t->u.kernel.target->target(skb, &acpar);
9beceb54fa2c0b Taehee Yoo                2017-07-27  351  		if (verdict == XT_CONTINUE) {
^1da177e4c3f41 Linus Torvalds            2005-04-16  352  			/* Target might have changed stuff. */
3db05fea51cdb1 Herbert Xu                2007-10-15  353  			ip = ip_hdr(skb);
98e86403162d08 Jan Engelhardt            2009-04-15  354  			e = ipt_next_entry(e);
9beceb54fa2c0b Taehee Yoo                2017-07-27  355  		} else {
^1da177e4c3f41 Linus Torvalds            2005-04-16  356  			/* Verdict */
^1da177e4c3f41 Linus Torvalds            2005-04-16 @357  			break;
9beceb54fa2c0b Taehee Yoo                2017-07-27  358  		}
b4ba26119b0605 Jan Engelhardt            2009-07-07 @359  	} while (!acpar.hotdrop);
7814b6ec6d0d63 Florian Westphal          2015-07-14  360  
7f5c6d4f665bb5 Eric Dumazet              2011-04-04 @361  	xt_write_recseq_end(addend);
7f5c6d4f665bb5 Eric Dumazet              2011-04-04 @362  	local_bh_enable();
7f5c6d4f665bb5 Eric Dumazet              2011-04-04  363  
b4ba26119b0605 Jan Engelhardt            2009-07-07 @364  	if (acpar.hotdrop)
^1da177e4c3f41 Linus Torvalds            2005-04-16  365  		return NF_DROP;
^1da177e4c3f41 Linus Torvalds            2005-04-16  366  	else return verdict;
^1da177e4c3f41 Linus Torvalds            2005-04-16 @367  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  368  

:::::: The code at line 329 was first introduced by commit
:::::: 57ebd808a97d7c5b1e1afb937c2db22beba3c1f8 netfilter: add back stackpointer size checks

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
