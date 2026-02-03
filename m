Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9A267B90;
	Tue,  3 Feb 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141106; cv=none; b=hmiuVxro6iYW+BaKvVQBQ1urIJT++gdwxHujoF8qMHtOdDNF5VQih6s75QADIJeXcaYbw5bHGoB/nJ1FX/KH8JM5+yCdCpO1rC4DeDSyy/xiEB94vanZPze2wdvBF82c0vZFu7hvvNJ4k5tltLxsm6L61CqMJqWEF+lxalgGJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141106; c=relaxed/simple;
	bh=bA/pvQyZ1Ihfv/zep1Z8v62t52wIy57XYBpGeeS4+jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXtJC7/3JFr3u1qh23za9zmmPxGHM8zTWc8kK8Vcz1BercQU5IxvoXCD1VhZLDyO9vwDwZc9878XMUkktfs0d9OpY+HpbmXMccjSrxjVxa/GNpxHXR3o/LL3qzPTAS72Ty0oZ17Y3BBK1UL5bKfepCtCFtFXSSrLqAUeP3Mc9QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEnTu/KR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEnTu/KR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A96DC16AAE;
	Tue,  3 Feb 2026 17:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770141106;
	bh=bA/pvQyZ1Ihfv/zep1Z8v62t52wIy57XYBpGeeS4+jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEnTu/KRn22ncxyEbg4UR/4fcHT6An4cjuOZarjUMVkMFqpLsyx4+Cb5yuqatWreC
	 hZaYnw0KawbfmjTDC0DLhnfx5WBop2knqvbF+iTIRvLhieEpQhVWorFtpEkeg9TbIk
	 Vrg29BaC2HlQvkKjiRmQzNtuMBjTQP+OhsanOykFPCdYkaWWm+6JqZIrCCTHEFpiKa
	 5mmyhQXsubyzlU+nBHkCPC4gmtNP9wsvk7tv/brXIFEnp28a5kcWHV+AKmKAjk+SKF
	 S7E9tvpWr2jHThUT7osCNd3OamYwRomTnFGyZ4+ZbQg6dT0N+GuASOhW3l37AJ8i1W
	 sBqRdq0QTZeFg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1B403F4006B;
	Tue,  3 Feb 2026 12:51:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 03 Feb 2026 12:51:45 -0500
X-ME-Sender: <xms:sTWCaXp3Znl-fqPoGe-h2-iSZ6dNB8HMdlBFWHpsSFH4KtQUasabLA>
    <xme:sTWCaa_qXZSG22ltBhKEh7aj_jeINtNuFfbkf7zI5FCKN8Kb5aL0KNL9q6Xi40_DL
    45z4gvBjeecz7kopyjie8WpvIXLi3URspR1S8pk-QyFQyRHK_Wm8w>
X-ME-Received: <xmr:sTWCabf1nw5LjU0Ngmeb1d4DNLiJLJg6sr7p9Mk7-WqG2FLJbbJQIhbk9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedtieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ffueekleehveehfeegheekhfeklefgfeejheevheetfefhueevieeigfetkeektdenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghdpghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedtleekgeejuddqud
    ejjeekheehhedvqdgsohhquhhnpeepkhgvrhhnvghlrdhorhhgsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplh
    hkphesihhnthgvlhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghi
    lhdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
    pdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghoqh
    hunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:sTWCacInwrZAnD5_WaclD29YdaeUBO7LbpbIGbpadyMhf09DUXCw5Q>
    <xmx:sTWCaTiwQzGwqiZfYdkx5MN3NBeWAwX9JheJsV-W4s_hZxlF9F6lWA>
    <xmx:sTWCaSRcksxfDB1YG4BCnVm_3-3aVIqY6VHfIcQvJHt9a80kQIlMnA>
    <xmx:sTWCaVVvja0SaiemEVm83DqhAcCz5HX8K80ahkhMdNm5pcdEv3M_Mg>
    <xmx:sTWCaWQzSt7HGvD9W2RS8bJvL-_pS3WSdUIR3jsLFSqPQjfuGvkIyRVt>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Feb 2026 12:51:44 -0500 (EST)
Date: Tue, 3 Feb 2026 09:51:42 -0800
From: Boqun Feng <boqun@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Lyude Paul <lyude@redhat.com>
Subject: Re: [boqun:rust-sync 16/18] include/linux/spinlock_api_smp.h:163:2:
 warning: raw_spinlock 'lock' is not held on every path through here
Message-ID: <aYI1rpSirB4ccvUQ@tardis-2.local>
References: <202602031729.MQ9qJ1OX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602031729.MQ9qJ1OX-lkp@intel.com>

On Tue, Feb 03, 2026 at 05:38:49PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
> head:   04c35250bb394d7bc867e1527c3250e49d486025
> commit: c54b183eeade43270288ca1fa71cb4731bc78e8e [16/18] irq & spin_lock: Add counted interrupt disabling/enabling
> config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602031729.MQ9qJ1OX-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031729.MQ9qJ1OX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602031729.MQ9qJ1OX-lkp@intel.com/
> 

Thanks for reporting these. We indeed missed a few annotations in the
new API, I just pushed an update fixing it.

Regards,
Boqun

> All warnings (new ones prefixed by >>):
> 
>    In file included from crypto/api.c:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:8:
>    In file included from include/linux/spinlock.h:311:
> >> include/linux/spinlock_api_smp.h:163:2: warning: raw_spinlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
>      163 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
>          |         ^
>    include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
>      447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
>          |         ^
>    include/linux/spinlock_api_smp.h:163:44: note: raw_spinlock acquired here
>      163 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
>          |                                                   ^
> >> include/linux/spinlock_api_smp.h:214:2: warning: releasing raw_spinlock 'lock' that was not held [-Wthread-safety-analysis]
>      214 |         do_raw_spin_unlock(lock);
>          |         ^
>    In file included from crypto/api.c:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:8:
> >> include/linux/spinlock.h:387:1: warning: raw_spinlock 'lock->.rlock' is still held at the end of function [-Wthread-safety-analysis]
>      387 | }
>          | ^
>    include/linux/spinlock.h:386:2: note: raw_spinlock acquired here
>      386 |         raw_spin_lock_irq_disable(&lock->rlock);
>          |         ^
>    include/linux/spinlock.h:276:41: note: expanded from macro 'raw_spin_lock_irq_disable'
>      276 | #define raw_spin_lock_irq_disable(lock) _raw_spin_lock_irq_disable(lock)
>          |                                         ^
> >> include/linux/spinlock.h:421:2: warning: releasing raw_spinlock 'lock->.rlock' that was not held [-Wthread-safety-analysis]
>      421 |         raw_spin_unlock_irq_enable(&lock->rlock);
>          |         ^
>    include/linux/spinlock.h:280:42: note: expanded from macro 'raw_spin_unlock_irq_enable'
>      280 | #define raw_spin_unlock_irq_enable(lock)        _raw_spin_unlock_irq_enable(lock)
>          |                                                 ^
>    4 warnings generated.
> 
> 
> vim +/lock +163 include/linux/spinlock_api_smp.h
> 
>    158	
>    159	static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
>    160	{
>    161		local_interrupt_disable();
>    162		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
>  > 163		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
>    164	}
>    165	
>    166	static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
>    167		__acquires(lock) __no_context_analysis
>    168	{
>    169		__local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
>    170		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
>    171		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
>    172	}
>    173	
>    174	static inline void __raw_spin_lock(raw_spinlock_t *lock)
>    175		__acquires(lock) __no_context_analysis
>    176	{
>    177		preempt_disable();
>    178		spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
>    179		LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
>    180	}
>    181	
>    182	#endif /* !CONFIG_GENERIC_LOCKBREAK || CONFIG_DEBUG_LOCK_ALLOC */
>    183	
>    184	static inline void __raw_spin_unlock(raw_spinlock_t *lock)
>    185		__releases(lock)
>    186	{
>    187		spin_release(&lock->dep_map, _RET_IP_);
>    188		do_raw_spin_unlock(lock);
>    189		preempt_enable();
>    190	}
>    191	
>    192	static inline void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
>    193						    unsigned long flags)
>    194		__releases(lock)
>    195	{
>    196		spin_release(&lock->dep_map, _RET_IP_);
>    197		do_raw_spin_unlock(lock);
>    198		local_irq_restore(flags);
>    199		preempt_enable();
>    200	}
>    201	
>    202	static inline void __raw_spin_unlock_irq(raw_spinlock_t *lock)
>    203		__releases(lock)
>    204	{
>    205		spin_release(&lock->dep_map, _RET_IP_);
>    206		do_raw_spin_unlock(lock);
>    207		local_irq_enable();
>    208		preempt_enable();
>    209	}
>    210	
>    211	static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
>    212	{
>    213		spin_release(&lock->dep_map, _RET_IP_);
>  > 214		do_raw_spin_unlock(lock);
>    215		local_interrupt_enable();
>    216	}
>    217	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
