Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6986351036;
	Tue, 23 Jan 2024 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705993692; cv=none; b=NIlFD+X51SXMq0gsE7M7wyveynC0UA4Cr+rxDayNf2THuOqd2kymSkQT/YpR1CL3GPOVmh6nlo2+LRthvJrfivG/vzF9DmSYXSRS9/itvC7m7biJ2lEJjNh4F0mNQZI8iL8ycZTkvekwCstU9mcTe8bkAR9z1Ez0vWYtp4VKUXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705993692; c=relaxed/simple;
	bh=kyGJ4Du+xhxInC3McVwenQuziv9BBd1jG985+1Ehoz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T4R76NKBMq/ge15EY1sjXzP6ydAAkXP/e69QH2HZy/GeZIlQcvOYICL9AUvS+hWuqX4mTehIWDAOHy4vo6yffcen8EVndjy+KI9EjZDLU9xlGnztrQei6KeQpR1WPRBug6LXfyfb886FrRKfJs84szq2Uym2hHtHB+oXjIeZpeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TJypS2QcCz1wnCP;
	Tue, 23 Jan 2024 15:07:44 +0800 (CST)
Received: from dggpeml500021.china.huawei.com (unknown [7.185.36.21])
	by mail.maildlp.com (Postfix) with ESMTPS id E5B7D140669;
	Tue, 23 Jan 2024 15:07:50 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 15:07:50 +0800
Message-ID: <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
Date: Tue, 23 Jan 2024 15:07:50 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [brauner-vfs:vfs.misc 12/13] include/linux/fs.h:911:9: error:
 call to '__compiletime_assert_207' declared with 'error' attribute: Need
 native word sized stores/loads for atomicity.
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, <sfr@canb.auug.org.au>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Christian Brauner
	<christianvanbrauner@gmail.com>, Christian Brauner <brauner@kernel.org>,
	Baokun Li <libaokun1@huawei.com>, yangerkun <yangerkun@huawei.com>, "zhangyi
 (F)" <yi.zhang@huawei.com>, Linus Torvalds <torvalds@linux-foundation.org>,
	<linux-next@vger.kernel.org>
References: <202401230837.TXro0PHi-lkp@intel.com>
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <202401230837.TXro0PHi-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500021.china.huawei.com (7.185.36.21)

On 2024/1/23 8:12, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
> head:   297983dc9011461cba6278bfe03f4305c4a2caa0
> commit: 4bbd51d0f0ad709c0f02c100439d6c9ba6811d4b [12/13] fs: make the i_size_read/write helpers be smp_load_acquire/store_release()
> config: i386-randconfig-015-20240123 (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/config)
> compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401230837.TXro0PHi-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     In file included from fs/netfs/buffered_read.c:10:
>     In file included from fs/netfs/internal.h:9:
>     In file included from include/linux/seq_file.h:12:
>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>       911 |         return smp_load_acquire(&inode->i_size);
>           |                ^
>     include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
>       206 |         compiletime_assert_atomic_type(*p);                             \
>           |         ^
>     include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
>       438 |         compiletime_assert(__native_word(t),                            \
>           |         ^
>     include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
>       435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^
>     include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
>       423 |         __compiletime_assert(condition, msg, prefix, suffix)
>           |         ^
>     include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
>       416 |                         prefix ## suffix();                             \
>           |                         ^
>     <scratch space>:38:1: note: expanded from here
>        38 | __compiletime_assert_207
>           | ^
>     1 error generated.
> --
>     In file included from fs/netfs/buffered_write.c:9:
>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>       911 |         return smp_load_acquire(&inode->i_size);
>           |                ^
>     include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
>       206 |         compiletime_assert_atomic_type(*p);                             \
>           |         ^
>     include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
>       438 |         compiletime_assert(__native_word(t),                            \
>           |         ^
>     include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
>       435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^
>     include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
>       423 |         __compiletime_assert(condition, msg, prefix, suffix)
>           |         ^
>     include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
>       416 |                         prefix ## suffix();                             \
>           |                         ^
>     <scratch space>:253:1: note: expanded from here
>       253 | __compiletime_assert_207
>           | ^
>     In file included from fs/netfs/buffered_write.c:9:
>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>     include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
>       206 |         compiletime_assert_atomic_type(*p);                             \
>           |         ^
>     include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
>       438 |         compiletime_assert(__native_word(t),                            \
>           |         ^
>     include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
>       435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^
>     include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
>       423 |         __compiletime_assert(condition, msg, prefix, suffix)
>           |         ^
>     include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
>       416 |                         prefix ## suffix();                             \
>           |                         ^
>     <scratch space>:253:1: note: expanded from here
>       253 | __compiletime_assert_207
>           | ^
>     In file included from fs/netfs/buffered_write.c:9:
>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>     include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
>       206 |         compiletime_assert_atomic_type(*p);                             \
>           |         ^
>     include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
>       438 |         compiletime_assert(__native_word(t),                            \
>           |         ^
>     include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
>       435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^
>     include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
>       423 |         __compiletime_assert(condition, msg, prefix, suffix)
>           |         ^
>     include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
>       416 |                         prefix ## suffix();                             \
>           |                         ^
>     <scratch space>:253:1: note: expanded from here
>       253 | __compiletime_assert_207
>           | ^
>     In file included from fs/netfs/buffered_write.c:9:
>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>     include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
>       206 |         compiletime_assert_atomic_type(*p);                             \
>           |         ^
>     include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
>       438 |         compiletime_assert(__native_word(t),                            \
>           |         ^
>     include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
>       435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^
>     include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
>       423 |         __compiletime_assert(condition, msg, prefix, suffix)
>           |         ^
>     include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
>       416 |                         prefix ## suffix();                             \
>           |                         ^
>     <scratch space>:253:1: note: expanded from here
>       253 | __compiletime_assert_207
>           | ^
>     4 errors generated.
> --
>     In file included from fs/netfs/misc.c:8:
>     In file included from include/linux/swap.h:9:
>     In file included from include/linux/memcontrol.h:13:
>     In file included from include/linux/cgroup.h:17:
>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>       911 |         return smp_load_acquire(&inode->i_size);
>           |                ^
>     include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
>       206 |         compiletime_assert_atomic_type(*p);                             \
>           |         ^
>     include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
>       438 |         compiletime_assert(__native_word(t),                            \
>           |         ^
>     include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
>       435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |         ^
>     include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
>       423 |         __compiletime_assert(condition, msg, prefix, suffix)
>           |         ^
>     include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
>       416 |                         prefix ## suffix();                             \
>           |                         ^
>     <scratch space>:251:1: note: expanded from here
>       251 | __compiletime_assert_207
>           | ^
>     1 error generated.
>
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
>     Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
>     Selected by [y]:
>     - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]
>
>
> vim +911 include/linux/fs.h
>
>     874	
>     875	void filemap_invalidate_lock_two(struct address_space *mapping1,
>     876					 struct address_space *mapping2);
>     877	void filemap_invalidate_unlock_two(struct address_space *mapping1,
>     878					   struct address_space *mapping2);
>     879	
>     880	
>     881	/*
>     882	 * NOTE: in a 32bit arch with a preemptable kernel and
>     883	 * an UP compile the i_size_read/write must be atomic
>     884	 * with respect to the local cpu (unlike with preempt disabled),
>     885	 * but they don't need to be atomic with respect to other cpus like in
>     886	 * true SMP (so they need either to either locally disable irq around
>     887	 * the read or for example on x86 they can be still implemented as a
>     888	 * cmpxchg8b without the need of the lock prefix). For SMP compiles
>     889	 * and 64bit archs it makes no difference if preempt is enabled or not.
>     890	 */
>     891	static inline loff_t i_size_read(const struct inode *inode)
>     892	{
>     893	#if BITS_PER_LONG==32 && defined(CONFIG_SMP)
>     894		loff_t i_size;
>     895		unsigned int seq;
>     896	
>     897		do {
>     898			seq = read_seqcount_begin(&inode->i_size_seqcount);
>     899			i_size = inode->i_size;
>     900		} while (read_seqcount_retry(&inode->i_size_seqcount, seq));
>     901		return i_size;
>     902	#elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
>     903		loff_t i_size;
>     904	
>     905		preempt_disable();
>     906		i_size = inode->i_size;
>     907		preempt_enable();
>     908		return i_size;
>     909	#else
>     910		/* Pairs with smp_store_release() in i_size_write() */
>   > 911		return smp_load_acquire(&inode->i_size);
>     912	#endif
>     913	}
>     914	
Sorry to cause this compilation error, I have not encountered this
before when testing compilation with gcc on x86 and arm64.
Is there a special config required for this, or is it just clang that
triggers this compile error?

The compile error seems to be that some architectural implementations
of smp_load_acquire() do not support pointers to long long data
types. Can't think of a good way to avoid this problem, any ideas
from linus and christian?

-- 
With Best Regards,
Baokun Li
.
