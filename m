Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863588635B;
	Mon,  3 Mar 2025 17:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023287; cv=none; b=enL7aIusTdYD90PQ5weOMCA5DmPyjbhq5Taic+PprYZirXmwkY1ED3npl5XEVXIcR5NBQO60r+WshFd6Lqt7+CApzMb7R2n2LfXMkG5GTqXolz6ef/Mkjv3XaXWkw2ok3+7P3b/A7OBJZA3BoCKLuJMLdGvbNuXTU7PnR1yoR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023287; c=relaxed/simple;
	bh=9zjve9LgtisXsRVr+zSWwp3iu4RXtAVVV4UoZLp2E6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA9N+vGW7Zg9idyr64/ua4dmtbI8CviIzc61pAHbEn8m8hXyO4qwZ11ucefAALlt/W9j8Er9wERVKCIPZk4THOyktg7PQiSotQlJCo2lmd2Q09EI65BcX4N2xvdf5VZhRw+g7VabNeM2t0sqb0VWs1XHSE6Xno1Krb2dNri0wi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RM2JXoSo; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RM2JXoSo"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AA4B640E0218;
	Mon,  3 Mar 2025 17:34:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eV9hhXPRGDcb; Mon,  3 Mar 2025 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1741023276; bh=1HaHWBB1oprQ0HvLRZ96//QtAusBMHcspauJc6zYwTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RM2JXoSooxDRz7XXfK5s0iYebaMYHB3vSvFCHoXzRabsiY6zXyBHPuKuX6/WNmN0Y
	 zcsqSyi007gNfw8qtoM3gBLgYt6LghB3m9x6wKGx01QvU2qf4rI+EsrVFWCt9G6Abi
	 SINf4fQLP2dWoJF36w2pnQmLk0qkCm+qb/fnVFvOMuOHP75KjBtu+w5ZA0DA6Xbiyk
	 ZjtYXUcGW9GjJXddRMd5G2abvV/F6QVJnXqQVlUscMkD8WXNIFoU2QSEjo1YO1I6SK
	 ES4qmbLs7dcue55jMxUJZpqDHOvb7oF+cy0ayhw0wWcC987ZjDO21oF8vMLD4p8YDb
	 joa3jcLLymhhnmI5EEooXD+Dbdx1SBk/ppu/Wt1FWPSoIlkVjVwSMJkvegQN+fAHVm
	 MHXah5vpAq2g2dcXKgr6Y/tRhfeHajjHc1cj6CDxtcwxffZAEdhZgGLtr7+hrqz6Zw
	 amwjyPxdSyjAYxd0VS+4nwsVcAjVPePMuU1ws4afuSNyPtzNZW5eL0X6HfTuREHNy9
	 Onas4y5L4EdUmYY7zOQVH9XCyNQKvSP3O13NxR57619EqdP7iybGjL4Z2clUAESO+2
	 O47mD3G3Njntqj2VA6TIsqz/E7/r4Ocf152Lvj3BAq7w13kzfSq+cLDmP2llW5jOYN
	 i0jlHA9QMejqVYwZiQAdDICk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3B0AA40E020E;
	Mon,  3 Mar 2025 17:34:31 +0000 (UTC)
Date: Mon, 3 Mar 2025 18:34:25 +0100
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Rik van Riel <riel@surriel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [bp:tip-x86-cpu-tlbi 15/18] arch/x86/mm/tlb.c:492:2: error: call
 to undeclared function 'mm_clear_asid_transition'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <20250303173425.GMZ8XoIYQE4O-LOUZN@fat_crate.local>
References: <202503040000.GtiWUsBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202503040000.GtiWUsBm-lkp@intel.com>

On Tue, Mar 04, 2025 at 01:09:08AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git tip-x86-cpu-tlbi
> head:   8dce44810022279f97780a5eadda766a6f4017a3
> commit: a05a1e35e67bfe03704633c51ca9b03e16fffd06 [15/18] x86/mm: Enable broadcast TLB invalidation for multi-threaded processes
> config: i386-buildonly-randconfig-003-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040000.GtiWUsBm-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040000.GtiWUsBm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503040000.GtiWUsBm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/mm/tlb.c:492:2: error: call to undeclared function 'mm_clear_asid_transition'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      492 |         mm_clear_asid_transition(mm);
>          |         ^
>    arch/x86/mm/tlb.c:492:2: note: did you mean 'mm_in_asid_transition'?
>    arch/x86/include/asm/tlbflush.h:299:20: note: 'mm_in_asid_transition' declared here
>      299 | static inline bool mm_in_asid_transition(struct mm_struct *mm) { return false; }
>          |                    ^
>    1 error generated.

Bah, forgot the stub:

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index cbdb86d58301..214d912ac148 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -309,6 +309,7 @@ static inline void cpu_set_tlbsync(bool state)
 static inline u16 mm_global_asid(struct mm_struct *mm) { return 0; }
 static inline void mm_init_global_asid(struct mm_struct *mm) { }
 static inline void mm_assign_global_asid(struct mm_struct *mm, u16 asid) { }
+static inline void mm_clear_asid_transition(struct mm_struct *mm) { }
 static inline bool mm_in_asid_transition(struct mm_struct *mm) { return false; }
 static inline bool cpu_need_tlbsync(void) { return false; }
 static inline void cpu_set_tlbsync(bool state) { }


Thanks for letting me know.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
