Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E32EF2B6
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 17:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753463999; cv=none; b=K1lGCd0l8JdfysvgdrdgEJPsXoQpWnSK5K73M5NnOzb+9EEEhqAz1ESf1s0lPGMj+Sut4BsOLZg6rYbleuDzPjqBrxOW1uucoJvtu8iw+rSZeNXzOhGIECiAqXK/B67CKA6vYb4VJDAiynbOT98y+zrzLRp/CqWPZtTjJGU3sz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753463999; c=relaxed/simple;
	bh=DMWAH3EpttKDJMt0m2BCylOmI+Ad1mVNFOhqz3Niu7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPvvjrOFSBiArIt/nZ66eEjtRyPV3PS9mtXXt1cmPJryYCzTuCtRDQ7mhxF+yhnVghO7dnAdO9PFdlDvBmcjwzg58fHt9sw/SvcvNSmBLTNxZX38L6wFPk+S4MkLpdVoRo1TnPP0uCOg0M0dDtTHmPrfqBAhBvLHUjfcT/WCMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Rp5dYKQ1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Rp5dYKQ1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2353a2bc210so23372025ad.2
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 10:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753463997; x=1754068797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GB3HN9rENNt5w+QmMp5DXorsMPRr7NrQ810NGI8rf3c=;
        b=Rp5dYKQ1aVS2MeE2mY2G7sjCHKHOMsiDKLWJr3+xyMgD9Noxo7fCR76AzFcJZzysK+
         4qixLjjtBY/EwKSZpiR7mhnIlRjIOeb8cWl7yrZoDnz04HSwHRqFhOU9dWD/XXGLXII2
         C2za7AOqHT92fi+R1yeZC0wTz7LiiCbBvAQNXmK4P6dgKlyzeeSBQZpGJzcmdvti7yye
         Yh+bbT62pX2bBpWPPpQiBjUdnbXY507b5+IM4mMiLgMnPVA2209TcsToW2pCysqtqAvu
         01Gnq2sCyNZQLR34ZgzihyXLxaZ6GQSAc3ZbPDD//4VteqxJh7Twyh+N28ABimIDetbY
         WEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753463997; x=1754068797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GB3HN9rENNt5w+QmMp5DXorsMPRr7NrQ810NGI8rf3c=;
        b=YkZSssjqZt/WdS/zH1OE/e1CbpDvnR/oG0+1fkISF7Ide5RFzE1FW5G10T2qYF9uOn
         qQQkiRSX0xYSC7SqE+aJooIcHHeixnbQDNm5jqGnkt19WYv4u/ienaC4TjnBkiedUlj7
         r+jK9cEUeSHYjDRrN0vrGw+hYkpYBpQwNu04tYaC5fDaOdMudnFwRimx8CjJynVrWXnz
         N6lH27bQfiAewHxX711w4BnzXEtTBPmVNVn6miG4/+yG3AU+DH5tmv1NgdtWkukxIcfY
         v4Eok4YWYIObbP3HibSo5AT5t+27+jizz9S3HbT//E/HYbfgpNKcbLMuGeGhUEV84810
         iC/g==
X-Forwarded-Encrypted: i=1; AJvYcCU378Fq+UYd7XNnPYhqYJUHFEjhkuDgh1G4XTZsvINubFpGBKJdsmDLB9HwOfLPkDr3COgt@lists.linux.dev
X-Gm-Message-State: AOJu0YyobCinuU+F+eT97dCxTKEdg+hPZgC1QTCC7ZGD4EPt9VbPCA02
	8cpPpRLWPiANH2nBfUZIBHwGLvp+/o9Ckpb19NiE4IlsxgBiJ0EKrGcq5qzWQaYXGhc=
X-Gm-Gg: ASbGncswx06ZN1+puXg242makFhmHHbJphYLg61/CehXcoFAS+IPCICuQw5u9V9z9kH
	U3JH8eCDiAYMVRB144v/kYaonYNirknd8d2Toi2/ASa2160u0bql24lYH4kPbyOLMlzeegEViQ8
	tazBBEBxqiDPmwu8OPkynYkWJH+f42EPOJDpa/H/bnaafiaONEBqlFV+BdPjATSqHsuXxDBiPUK
	Q+QF/fIv0mn5/PR8BjCz5F3J1Jm54sJe/DgBucA46RGE5drgXIoBgUqVONvykV1ukwOb9Xh/k5S
	1h3A7LYWpKK2DgtvFogMKBDPfl0WGVSPbNCzhIY+8ZBgmJEia7NCEMxEXvY0SFOv955ABBQaZH7
	b3zAeE3RaZ2BxW2crV+UqPKzry76pK0oG
X-Google-Smtp-Source: AGHT+IFjom9VggtiV3miU2IzukS6s/Aukl0lHveBGocFoUm1oY8gb1MVFBAvHIxhtqVqK5CFl4GXiw==
X-Received: by 2002:a17:903:2f8c:b0:234:986c:66e0 with SMTP id d9443c01a7336-23fb2ff97cemr42397075ad.4.1753463997175;
        Fri, 25 Jul 2025 10:19:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe536c19sm1459325ad.162.2025.07.25.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:19:56 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:19:53 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "masahiroy@kernel.org" <masahiroy@kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"david@redhat.com" <david@redhat.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"morbo@google.com" <morbo@google.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"nicolas.schier@linux.dev" <nicolas.schier@linux.dev>,
	"surenb@google.com" <surenb@google.com>,
	"monk.chiang@sifive.com" <monk.chiang@sifive.com>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mhocko@suse.com" <mhocko@suse.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"andrew@sifive.com" <andrew@sifive.com>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"ved@rivosinc.com" <ved@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"jeffreyalaw@gmail.com" <jeffreyalaw@gmail.com>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>

On Fri, Jul 25, 2025 at 05:06:17PM +0000, Edgecombe, Rick P wrote:
>On Thu, 2025-07-24 at 16:37 -0700, Deepak Gupta wrote:
>> If shadow stack have memory protections from underlying cpu, use those
>> protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
>> stack pages. Hw assisted shadow stack pages grow downwards like regular
>> stack. Clang based software shadow call stack grows low to high address.
>> Thus this patch addresses some of those needs due to opposite direction
>> of shadow stack. Furthermore, hw shadow stack can't be memset because memset
>> uses normal stores. Lastly to store magic word at base of shadow stack, arch
>> specific shadow stack store has to be performed.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  include/linux/scs.h | 26 +++++++++++++++++++++++++-
>>  kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
>>  2 files changed, 60 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/scs.h b/include/linux/scs.h
>> index 4ab5bdc898cf..6ceee07c2d1a 100644
>> --- a/include/linux/scs.h
>> +++ b/include/linux/scs.h
>> @@ -12,6 +12,7 @@
>>  #include <linux/poison.h>
>>  #include <linux/sched.h>
>>  #include <linux/sizes.h>
>> +#include <asm/scs.h>
>>
>>  #ifdef CONFIG_SHADOW_CALL_STACK
>>
>> @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>>  	 * Reset the shadow stack to the base address in case the task
>>  	 * is reused.
>>  	 */
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
>> +#else
>>  	task_scs_sp(tsk) = task_scs(tsk);
>> +#endif
>>  }
>>
>>  static inline unsigned long *__scs_magic(void *s)
>>  {
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	return (unsigned long *)(s);
>> +#else
>>  	return (unsigned long *)(s + SCS_SIZE) - 1;
>> +#endif
>>  }
>>
>>  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>>  {
>>  	unsigned long *magic = __scs_magic(task_scs(tsk));
>> -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
>> +	unsigned long sz;
>> +
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
>> +#else
>> +	sz = task_scs_sp(tsk) - task_scs(tsk);
>> +#endif
>>
>>  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>>  }
>>
>> +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
>> +{
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	arch_scs_store(s, magic_val);
>> +#else
>> +	*__scs_magic(s) = magic_val;
>> +#endif
>> +}
>> +
>>  DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>>
>>  static inline bool scs_is_dynamic(void)
>> diff --git a/kernel/scs.c b/kernel/scs.c
>> index d7809affe740..5910c0a8eabd 100644
>> --- a/kernel/scs.c
>> +++ b/kernel/scs.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/scs.h>
>>  #include <linux/vmalloc.h>
>>  #include <linux/vmstat.h>
>> +#include <asm-generic/set_memory.h>
>>
>>  #ifdef CONFIG_DYNAMIC_SCS
>>  DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>> @@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
>>  {
>>  	int i;
>>  	void *s;
>> +	pgprot_t prot = PAGE_KERNEL;
>> +
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	prot = PAGE_KERNEL_SHADOWSTACK;
>> +#endif
>>
>>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>>  		s = this_cpu_xchg(scs_cache[i], NULL);
>>  		if (s) {
>>  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
>>  						   KASAN_VMALLOC_PROT_NORMAL);
>> +/*
>> + * If software shadow stack, its safe to memset. Else memset is not
>> + * possible on hw protected shadow stack. memset constitutes stores and
>> + * stores to shadow stack memory are disallowed and will fault.
>> + */
>> +#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>>  			memset(s, 0, SCS_SIZE);
>> +#endif
>>  			goto out;
>>  		}
>>  	}
>>
>>  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
>> -				    GFP_SCS, PAGE_KERNEL, 0, node,
>> +				    GFP_SCS, prot, 0, node,
>>  				    __builtin_return_address(0));
>
>This doesn't update the direct map alias I think. Do you want to protect it?

Yes any alternate address mapping which is writeable is a problem and dilutes
the mechanism. How do I go about updating direct map ? (I pretty new to linux
kernel and have limited understanding on which kernel api's to use here to unmap
direct map)

>
>>
>>  out:
>> @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>>  	if (!s)
>>  		return NULL;
>>
>> -	*__scs_magic(s) = SCS_END_MAGIC;
>> +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>>
>>  	/*
>>  	 * Poison the allocation to catch unintentional accesses to
>> @@ -87,6 +100,16 @@ void scs_free(void *s)
>>  			return;
>>
>>  	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
>> +	/*
>> +	 * Hardware protected shadow stack is not writeable by regular stores
>> +	 * Thus adding this back to free list will raise faults by vmalloc
>> +	 * It needs to be writeable again. It's good sanity as well because
>> +	 * then it can't be inadvertently accesses and if done, it will fault.
>> +	 */
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
>
>Above you don't update the direct map permissions. So I don't think you need
>this. vmalloc should flush the permissioned mapping before re-using it with the
>lazy cleanup scheme.

If I didn't do this, I was getting a page fault on this vmalloc address. It directly
uses first 8 bytes to add it into some list and that was the location of fault.

>
>> +#endif
>> +
>
>I was thinking someday when we get to this for CET we would protect the direct
>map, and so would need some pool of shadow stacks because flushing the TLB for
>every thread alloc/free would likely be too impactful.

Yes pool would be useful per-cpu.

>
>
>>  	vfree_atomic(s);
>>  }
>>
>> @@ -96,6 +119,9 @@ static int scs_cleanup(unsigned int cpu)
>>  	void **cache = per_cpu_ptr(scs_cache, cpu);
>>
>>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>
>Oh! There is a cache, but the size is only 2.

Yes.
In next iteration, I would likely increase the size of the cache if
CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK=y.

>
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +		set_memory_rw((unsigned long)cache[i], (SCS_SIZE/PAGE_SIZE));
>> +#endif
>>  		vfree(cache[i]);
>>  		cache[i] = NULL;
>>  	}
>> @@ -122,7 +148,13 @@ int scs_prepare(struct task_struct *tsk, int node)
>>  	if (!s)
>>  		return -ENOMEM;
>>
>> -	task_scs(tsk) = task_scs_sp(tsk) = s;
>> +	task_scs(tsk) = s;
>> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> +	task_scs_sp(tsk) = s + SCS_SIZE;
>> +#else
>> +	task_scs_sp(tsk) = s;
>> +#endif
>> +
>>  	return 0;
>>  }
>>
>>
>
