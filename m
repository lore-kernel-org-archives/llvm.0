Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DBD25569
	for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723484865; cv=none; b=SboeA6vbsZMya+NZXeFKFuvUsrMhFODfQWcd6fnyfroDMS+t0nGzcTHJ8Uikfrzj4UWdwXN3SxEq73SijS+y4Csa2n8umeZ7h0awpx1mwG0ELTMqo8x/yrTupnEhYm1LrRufBKMNlskE9w8xtk030JiK+3jmtcDaYqSc6GpyAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723484865; c=relaxed/simple;
	bh=jZQK+poRucBtWzgcuwcqiKINqDU8YVePMNhka0KbYZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hmHf4b2PvxFTdt93N1xKrIkh4zC6HMU8RN0S9fq1ayoV4ARAMbfbpRVxSoHSOnBptandfn7MfREny6ZuCxMZvTYmBVFM5U4sKDu4YtMRRqQhxhUTiD+/XBayy4qx3Aq97ipsSdEnOZraRpAHfRwumstfp9AfUCAw3HDfWGF7FR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RvTgw768; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RvTgw768"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723484862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E1ofoLxp3v9N9kOKPS4vF+5E/Ihl5ZKLAS+ztCOSQ6U=;
	b=RvTgw7682UJbxgMgWLFXRqYFYyzsiCMOuAQF/hbGiCFNiuuzLt0GeC/J3ZsRlDpwlDjwi/
	Ory+Azq1HfEEV7rb/fskAcvd7nwIsn9IxQ3g1KNbjy4X3u25pTkzy3WuZ+6NSyk5apUYVd
	YsxxhAC9kqpjaTmQV28Im7jzcvs71lQ=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-kWvzMPBnPKKgIPBZqnnOOg-1; Mon, 12 Aug 2024 13:47:41 -0400
X-MC-Unique: kWvzMPBnPKKgIPBZqnnOOg-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4f51f3b2e7fso220595e0c.2
        for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 10:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723484858; x=1724089658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1ofoLxp3v9N9kOKPS4vF+5E/Ihl5ZKLAS+ztCOSQ6U=;
        b=V4xiOgkOzVZjOXs/tKgu7gh+gTAxFDVFm20L6MfCiwLYgJ9iaFcHTyRvriS/lW/UJk
         qFpcekImqlxYUXLXrvJmnhrWIUIQMlhVyuvDb06qBAWj39BCOzAoq/3QrH+I3QisJ+7p
         7uEVuJgL0wGKZbb+28pzditWhiwwVVu/SrG9mbvn8txMlEyGGfpFpOUxwO0xaGSQQrOu
         AfsASPKNyaZXeEYSPsnEVcwq6tcS2fkbkyNyb6Va713oALULAFLxYHo9rzXPU5fkIRoA
         HbVjJXrPUkUYj29C8usgWUXDsv/CL5l5cuI6aMxWUyDrrIx70GY1F5pBHfeXxvjcVRBJ
         yagw==
X-Gm-Message-State: AOJu0Yw0dIoQ/Jznr+MHDWnyempeniIwlgk4trYOKjq34rHdFCvcggAa
	l/+gqKFumfZLsDgxCk9bWstC6/Tj+6Fz3WgF/vuwdkA6epNtgxcAAewee6aiIAkGilWEUzvMk/A
	bf2qxAEEceIJUWFz10fbbHCO0Ge8uUxMhJSnSQhshL2yfCOfVrJk=
X-Received: by 2002:a05:6102:26ce:b0:493:bb70:940 with SMTP id ada2fe7eead31-4974399f57fmr795432137.2.1723484858460;
        Mon, 12 Aug 2024 10:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7jmM8bUGT9xUj4x1h0ExmS602EAdMtMjszbitwdc1aRSXvgBoY3SBo0Dp410qEwslG0IOIg==
X-Received: by 2002:a05:6102:26ce:b0:493:bb70:940 with SMTP id ada2fe7eead31-4974399f57fmr795410137.2.1723484857962;
        Mon, 12 Aug 2024 10:47:37 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e05658sm266933085a.121.2024.08.12.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 10:47:37 -0700 (PDT)
Date: Mon, 12 Aug 2024 13:47:34 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 206/222]
 arch/x86/include/asm/pgtable.h:1420:10: error: invalid output size for
 constraint '+q'
Message-ID: <ZrpKtnQqkrbfaUhp@x1n>
References: <202408111850.Y7rbVXOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202408111850.Y7rbVXOo-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Aug 11, 2024 at 06:14:39PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   7d7894afcca68b40bfca49f4d1303167d224919e
> commit: a5c1d6b162e7568305f50186568d6e033ad6d81f [206/222] mm/x86: add missing pud helpers
> config: i386-randconfig-002-20240811 (https://download.01.org/0day-ci/archive/20240811/202408111850.Y7rbVXOo-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111850.Y7rbVXOo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408111850.Y7rbVXOo-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/kernel/asm-offsets.c:14:
>    In file included from include/linux/suspend.h:5:
>    In file included from include/linux/swap.h:9:
>    In file included from include/linux/memcontrol.h:13:
>    In file included from include/linux/cgroup.h:17:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:9:
>    In file included from include/linux/sched/task.h:13:
>    In file included from include/linux/uaccess.h:12:
>    In file included from arch/x86/include/asm/uaccess.h:17:
>    In file included from arch/x86/include/asm/tlbflush.h:16:
> >> arch/x86/include/asm/pgtable.h:1420:10: error: invalid output size for constraint '+q'
>     1420 |                 return xchg(pudp, pud);
>          |                        ^
>    include/linux/atomic/atomic-instrumented.h:4758:2: note: expanded from macro 'xchg'
>     4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
>          |         ^
>    include/linux/atomic/atomic-arch-fallback.h:12:18: note: expanded from macro 'raw_xchg'
>       12 | #define raw_xchg arch_xchg
>          |                  ^
>    arch/x86/include/asm/cmpxchg.h:78:27: note: expanded from macro 'arch_xchg'
>       78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
>          |                                 ^
>    arch/x86/include/asm/cmpxchg.h:48:19: note: expanded from macro '__xchg_op'
>       48 |                                       : "+q" (__ret), "+m" (*(ptr))     \
>          |                                               ^
>    1 error generated.
>    make[3]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3464415616
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1193: prepare0] Error 2 shuffle=3464415616
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=3464415616
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:224: __sub-make] Error 2 shuffle=3464415616
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +1420 arch/x86/include/asm/pgtable.h
> 
>   1414	
>   1415	static inline pud_t pudp_establish(struct vm_area_struct *vma,
>   1416			unsigned long address, pud_t *pudp, pud_t pud)
>   1417	{
>   1418		page_table_check_pud_set(vma->vm_mm, pudp, pud);
>   1419		if (IS_ENABLED(CONFIG_SMP)) {
> > 1420			return xchg(pudp, pud);
>   1421		} else {
>   1422			pud_t old = *pudp;
>   1423			WRITE_ONCE(*pudp, pud);
>   1424			return old;
>   1425		}
>   1426	}
>   1427	

It's a bit weird that the build won't fail if with gcc, but only trigger
this if with clang.

The issue reported here seems to be real, where it's still the i386 PAE
config and pud here should be u64.  We may need below to fix it:

===========8<============
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 1e463c9a650f..4c2d080d26b4 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1436,6 +1436,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif

+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
                unsigned long address, pud_t *pudp, pud_t pud)
 {
@@ -1448,6 +1449,7 @@ static inline pud_t pudp_establish(struct vm_area_struct *vma,
                return old;
        }
 }
+#endif

 #define __HAVE_ARCH_PMDP_INVALIDATE_AD
 extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
===========8<============

I'll squash this when I repost the whole 1g pud series soon (with quite a
few commit message enhancements, and English fixes).

Thanks,

-- 
Peter Xu

