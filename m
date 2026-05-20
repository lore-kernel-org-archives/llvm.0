Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C963546E0;
	Wed, 20 May 2026 04:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779253174; cv=none; b=G4vOnuZkHvA0+v2hisHHtYr/jDkrqgywBQR6D2NJEjNV9eXJ4Cf+JuPe0Q1I5OKepVjzgWZfCZGxSjz6M2UGzBn88JIdu2yKaX98DFIychtNlqvcuUOBVLmlRt/BxbbL0WqtwNv8ifC2M7jia776fNaQbAW9BU0uUUFcfQlsR1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779253174; c=relaxed/simple;
	bh=BUFsqCG/hiPEurVGvgxbTgt1J+21cUheXlM4vztXVHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEIqVM4YOwMmFeruJkl+VLB7CSnovjaU9wrwhuGBPadTkriqdCw0hmQvwYu0fCoS61rNOaKh9I3MtoHfOXGIx5WF16vuD6u1YSYhLdWPVQeDdwo4y+wyYo6/qZqBdcVm1H3wsG0EAcOTSCtv9XYOPUml3yQfZ6gIlR4oJ/Db8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aooyEfF1; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aooyEfF1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779253163; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=R3dWlOeoGeaL6fqlWRSQQ2vR0Pb9C6LNoxzpFVBBgco=;
	b=aooyEfF1JxBuaYc7inb7aTyXJekeLh91bMGjyVsk0MPiwgw6DkGze5x6zoxPx2W+XqX8iC3xJID4/IQNBKin80JdbQOelgBMBtyZKTLI5zosQ7BQImamDFIeEXfEURJUty1NAxce7KrB346K1jl7Xf19NveHitiC2+03ApCYTXQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0X3HX1PK_1779253161;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X3HX1PK_1779253161 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 May 2026 12:59:22 +0800
Date: Wed, 20 May 2026 12:59:21 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: kernel test robot <lkp@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5548/6445] kernel/dma/contiguous.c:139:13:
 warning: variable 'numa_cma_configured' set but not used
Message-ID: <ag0_qU5BS9KBBiWK@U-2FWC9VHC-2323.local>
References: <202605200341.a1HLq7XC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202605200341.a1HLq7XC-lkp@intel.com>

On Wed, May 20, 2026 at 03:13:09AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6a50ba100ace43f43c87384367eb2d2605fcc16c
> commit: 38ce91195a7c6f76fa88ef5c03bad0bbabbf5556 [5548/6445] dma-contiguous: add kconfig option to setup numa cma area if not configured explicitly
> config: s390-randconfig-002-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200341.a1HLq7XC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605200341.a1HLq7XC-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/dma/contiguous.c:139:13: warning: variable 'numa_cma_configured' set but not used [-Wunused-but-set-global]
>      139 | static bool numa_cma_configured;
>          |             ^
>    1 warning generated.

Thanks for the catch!

In this config, CONFIG_CMA_SIZE_PERNUMA is not set, which triggers the
warning.

The patch below should fix it.

Hi Marek,

Could you help to squash this follow-on fix patch, or I can send
you a modified new version of the original patch? Thanks!

- Feng

---
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 42227c823893..f286d49bf068 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -136,7 +136,7 @@ static struct cma *dma_contiguous_numa_area[MAX_NUMNODES];
 static phys_addr_t numa_cma_size[MAX_NUMNODES] __initdata;
 static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
 static phys_addr_t pernuma_size_bytes __initdata;
-static bool numa_cma_configured;
+static bool __maybe_unused numa_cma_configured;
 
 static int __init early_numa_cma(char *p)
 {
