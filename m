Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664392EF676
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753460018; cv=none; b=gh5PBZT8XrH/YrF6DklK4QQEa+hJM6nnKoArVcAtWgQOCSndHjeoT/qLnngIyPosfH6STuXWBShdd7YMJwj22A/kge5rYcc1Z/5AFBFJlAzwI+DS+aO3LbQ5Eyq6qJMnsCoya8RWGI4nkKWlD5odp2/igxAqIGlTgqCY2/WSjL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753460018; c=relaxed/simple;
	bh=x4YQxIKQWr0zlAYssB11RNVL/V9ApQOefS1jUqYP7Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaySdhEYVtcI185pmIM9AR5YFi0GGpvnnMjWxbjhE1mOHXXIkGvyMLWtSo+G9tqL8fj8KTaEzZmlmYfP6gmbsI03iYD7HJ5EjLeMq7/si3ZO0po4Wz99bjxqr1HLyC5vlLqBn6PL7p7gqodSl7LbiFvEyu/uY1l9hEn44+z3ofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tejsnYgL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tejsnYgL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e389599fso232135ad.0
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753460015; x=1754064815; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbMA4/IPXQaEHQepmsbHPY7QV6shrVDJW0bf+hd1ByM=;
        b=tejsnYgLwSWjrwuTs0Z5fgVkypNU2vCQM4/IdM544wBdwHaImVXcIrOxV7rxJHxfDt
         5wq8hDwxKS0sP7Ij/gABrr8KTd8pSg3ppXD+ayPUgaoGsgS2dXNZK3NyKI6z6V0zrU0o
         7UbwqjsvPS3f3Ok7ba1CaTqDG5M/rUhkU5QtcyxJdwJ40BZgemJ5oKrrU+5y+vDsgbxF
         AGq/o3n3/To72ZP7rZopMJFPOOgbXGJBM11lRYGpI1iq87vZ14gqpB0SbYNIQaNvNZvL
         bAfqy4jt8CnNoaO1LIoHtodGXqIhXLO2GwgEETyz6oHqAK+/9Lvxu9WSWn1OF+eHnm/g
         mY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460016; x=1754064816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbMA4/IPXQaEHQepmsbHPY7QV6shrVDJW0bf+hd1ByM=;
        b=cEhVTkNblv0yzrG2kr+/BDf3tqP7zEo7UOxFjR8Y9UU+d8MXY7wxfjX/dz7bZ+Hs0e
         Nb1Lvd1Edz6djXQO6GlCsIsqLncAoYc7P7LfgoNcNn/rRF2R/iPJE1Ce9NfAn2nJOITR
         FuI7TbhdiHQEOVC/2RQhScL+2OoMiWUuBxUTjtIPmV97uCltDxmpCh1ktwmA2hi1PE3G
         j6xtd8iIORj1vbNv7XT1/wKkAAI2fLBoIiggAhX5WfZPt33x593s7eztMfgJPaKr7hX4
         ExHjJyBkQkuoIE0KLSAgXrV/kvoiQ3F091mppDsBBhaO7/mGQEWXjiweVM7Ywj0sdzd4
         JeYg==
X-Forwarded-Encrypted: i=1; AJvYcCWqZFYkS01EYBkGMIMeRRT+EUQwdQXrO3HNmB4WfRuSuvTiaFQ9+OS2XOrT93uqm3kO8xPu@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhy0mI2tLF2y1t0bAcRaqaLDsc8rm51ULdLoZAlAKOPfjRvN0p
	LStjFEa/6kyIAx+EJ/XqVzIq7yLRz4ENORPka+GYZ0lTkfmfiDvA9lMawI3L6VGLYw==
X-Gm-Gg: ASbGncsupmNHN5aJzQkY4sHLb+p84BKqE7kPtLAIMvCETZjhb7xQ7bt4gR69klFVcqk
	HqaLk0zv4L0UVySLrxrkar3YQB8Swa4FGADbFU3wgfL5eR2xmNpvsENSZowqoR7MdFDwgbWUoLp
	IL7S8g8lxu0gqUcFNFXkSRc0frr+t87qAHpJMryq3lOC3sx8JrQIQQcyPl1+PmvGCMWvykTrviu
	CkoiKDo68jQLGXSlI0snxUEiFKLKRuv9y4+vwjlniMV+v1U4f5gTwWnV/yEVMNAXoN+3U1rKlke
	JEHZ2WZ53bePwAedRfo1VyKW8g9u+bxfps7xmX9ytNtwfPWsc36DBuXqEmEmQxYZOZckrdjeMS0
	XtCiDeJ5ecb2LQiERSjRkBoPJITV7m8dGTSb5dHO4qmGGXzPbDSjHSnYYQNOO51lsBw==
X-Google-Smtp-Source: AGHT+IGq4HV4wynITvP6Q3jQAvqNu8aZGXk3r1rzEnuZDeWdHk39Doexv2T5tkYjqpbpWqlrXy/lSA==
X-Received: by 2002:a17:902:e947:b0:234:b2bf:e67e with SMTP id d9443c01a7336-23fb0309a88mr3165975ad.13.1753460015047;
        Fri, 25 Jul 2025 09:13:35 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fc7a4sm619335ad.120.2025.07.25.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:13:34 -0700 (PDT)
Date: Fri, 25 Jul 2025 16:13:27 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>, Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <20250725161327.GC1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>

On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
> If shadow stack have memory protections from underlying cpu, use those
> protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
> stack pages. Hw assisted shadow stack pages grow downwards like regular
> stack. Clang based software shadow call stack grows low to high address.

Is this the case for all the current hardware shadow stack
implementations? If not, we might want a separate config for the
shadow stack direction instead.

> Thus this patch addresses some of those needs due to opposite direction
> of shadow stack. Furthermore, hw shadow stack can't be memset because memset
> uses normal stores. Lastly to store magic word at base of shadow stack, arch
> specific shadow stack store has to be performed.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/linux/scs.h | 26 +++++++++++++++++++++++++-
>  kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/scs.h b/include/linux/scs.h
> index 4ab5bdc898cf..6ceee07c2d1a 100644
> --- a/include/linux/scs.h
> +++ b/include/linux/scs.h
> @@ -12,6 +12,7 @@
>  #include <linux/poison.h>
>  #include <linux/sched.h>
>  #include <linux/sizes.h>
> +#include <asm/scs.h>
>  
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  
> @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>  	 * Reset the shadow stack to the base address in case the task
>  	 * is reused.
>  	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
> +#else
>  	task_scs_sp(tsk) = task_scs(tsk);
> +#endif
>  }
>
>  static inline unsigned long *__scs_magic(void *s)
>  {
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	return (unsigned long *)(s);
> +#else
>  	return (unsigned long *)(s + SCS_SIZE) - 1;
> +#endif
>  }
>  
>  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>  {
>  	unsigned long *magic = __scs_magic(task_scs(tsk));
> -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
> +	unsigned long sz;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
> +#else
> +	sz = task_scs_sp(tsk) - task_scs(tsk);
> +#endif
>  
>  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>  }
>  
> +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
> +{
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	arch_scs_store(s, magic_val);
> +#else
> +	*__scs_magic(s) = magic_val;
> +#endif
> +}
> +

I'm not a huge fan of all the ifdefs. We could clean this up by
allowing architectures to simply override some these functions, or at
least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
this?

>  DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>  
>  static inline bool scs_is_dynamic(void)
> diff --git a/kernel/scs.c b/kernel/scs.c
> index d7809affe740..5910c0a8eabd 100644
> --- a/kernel/scs.c
> +++ b/kernel/scs.c
> @@ -11,6 +11,7 @@
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
>  #include <linux/vmstat.h>
> +#include <asm-generic/set_memory.h>
>  
>  #ifdef CONFIG_DYNAMIC_SCS
>  DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
> @@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
>  {
>  	int i;
>  	void *s;
> +	pgprot_t prot = PAGE_KERNEL;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	prot = PAGE_KERNEL_SHADOWSTACK;
> +#endif

I would rather define the shadow stack protection flags in the header
file and allow them to be overridden in asm/scs.h.

>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>  		s = this_cpu_xchg(scs_cache[i], NULL);
>  		if (s) {
>  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
>  						   KASAN_VMALLOC_PROT_NORMAL);
> +/*
> + * If software shadow stack, its safe to memset. Else memset is not
> + * possible on hw protected shadow stack. memset constitutes stores and
> + * stores to shadow stack memory are disallowed and will fault.
> + */
> +#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>  			memset(s, 0, SCS_SIZE);
> +#endif

This could also be moved to a static inline function that
architectures can override if they have hardware shadow stacks that
cannot be cleared at this point.

>  			goto out;
>  		}
>  	}
>  
>  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
> -				    GFP_SCS, PAGE_KERNEL, 0, node,
> +				    GFP_SCS, prot, 0, node,
>  				    __builtin_return_address(0));
>  
>  out:
> @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>  	if (!s)
>  		return NULL;
>  
> -	*__scs_magic(s) = SCS_END_MAGIC;
> +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>  
>  	/*
>  	 * Poison the allocation to catch unintentional accesses to
> @@ -87,6 +100,16 @@ void scs_free(void *s)
>  			return;
>  
>  	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
> +	/*
> +	 * Hardware protected shadow stack is not writeable by regular stores
> +	 * Thus adding this back to free list will raise faults by vmalloc
> +	 * It needs to be writeable again. It's good sanity as well because
> +	 * then it can't be inadvertently accesses and if done, it will fault.
> +	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
> +#endif

Another candidate for an arch-specific function to reduce the number
of ifdefs in the generic code.

Sami
