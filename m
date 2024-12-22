Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFCB7485;
	Sun, 22 Dec 2024 03:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734836569; cv=none; b=aqmQuifWbuVjWjsJr7uipYLKCZS+wTQx+nnjpvywCDGlpJb9EgdnsARQaKSNs1wNhFCu2n8y4rMgOiVfDswPXoKPD/qSgr5oai5IOx+zh+nil7IvlOo4mEcYr53JTdKZ69OWzUP0eT2bttYjsX48V73lQLLSs554sJZBxAri4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734836569; c=relaxed/simple;
	bh=Zn6qcpLGTr40r+SNiedh2PFJXc0hYWCaPTsySbA8VuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db3vbAIjOPwvMqmh6MU15FTNtfnDy0QTVQPqGtVFV8TieCGgM2lmeg8b0YqsRn0RbZSULFaUOxCUB6zVON02Aw/TyoKvNkDdX0JJppvvIFlvFfRvSpfqoPhpD346hRyayj1pxYUChwV9aILHWx5SKDvs0qUz9EWS3c+Ibnt84wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl4UW1JK; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl4UW1JK"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ef81222be7so28162437b3.3;
        Sat, 21 Dec 2024 19:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734836566; x=1735441366; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dm4R1e7HMm7QYtZL5pRONu49DOzWvyi65Erpa/yU35U=;
        b=Dl4UW1JKUQ6wrXq6XMP5axhE0JNn3hugHjyJYiU5YlM6K6edLO+uO0F2S+YKhwTWle
         CGRHxd7wQ4S4RG2DxR2FnS+EifI8szncbC1L8Cw+pA8x6Q8KWv0f3IGYCEpmxlnP73VF
         dPHMmTgPSlbl0VFeRhnwsda+bNaPa+COO7SR/wlxKIfGEnsbckwO4pGlsSTP/8twfEWd
         ku+O1Pq2kIAajbXVcvSe3FZs6pozUii9lRkBZDebsIZ2AsoWDDndZAdSjJiMlFxxds8w
         QKv4iGh3NhJIA2kxSVbZU5xGxDqcMsi2xLOI3RHFk7RtmTmoVA/u+K4xMCilMGC9kv2F
         nE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734836566; x=1735441366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm4R1e7HMm7QYtZL5pRONu49DOzWvyi65Erpa/yU35U=;
        b=ng1ZS/iGfp2lajTGBx+m+Q5G3Sz5pBKFUsLsbweRNMdCu5vxR8XexgHQtsjfbhhpQQ
         0pf+eMHV38gQqcsIqsVDYVcpVhu4WU6K7CSLRLxBqtxDwqRTB7yDIM7IAmghiUr9jVKT
         V5irB8vg99ru5i+1SQtKDu7K8650yzPkG9qO6xUViVoc1FA/B9c5mXga1MsTCH+o08oq
         yr2FQlnLuR0DVuNjypHPiV5Io8rG1WpfiV1wKQJtficsR9JGgFovVPErou6k2K1jINxh
         op1KtPMsX8CFfZle+wXg/GYr8l7V7AzlO6ifQjtKRiboMO1FdwCbbdPbZ9sidhHjahjY
         JVHA==
X-Forwarded-Encrypted: i=1; AJvYcCWsztXzgrYrGuBSYe8OJOmmojScSIW85VsnrOmLsFULWdVZHcDdIoi7M1ZgcbEqKuu3K/EG@lists.linux.dev, AJvYcCXl4wU0qzLDDmbTu/QDFQx7/LDtLqerPJPHZ0h+UOleCSp8v0KJ1jAC9ZDHRyZ+HjrqYH69Nc3l0VI/HvwX9w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc7CjqT8IK1NbhSS19r8hyV6vxOfNPwqwEoCVsUUulJ4urUWVt
	9jnR4sWUnWA1/DvxYkIf87UFXyUcm1HUCLywI+trqM2zVL0501RjKJ5g39leJJc+aFbtfhy3v57
	XyHrWUaBwllw83Y5UEoLG76MShR8=
X-Gm-Gg: ASbGncvnsa3tg9lAKHE8cJmCWZ4kKPGHBshDuGX2TignxlyW2hs4j+vTJF7RaLw+cp0
	G7+M1Fr2y0+n7JodpjOXykJNz2UVClIqT5ppA0tc=
X-Google-Smtp-Source: AGHT+IG0x0dI+33YAGFA+2oJ4rnD0hwGijkMRySWSqBlQWqcks11Iu/ctl0s8mSqUUR4Zo809YLkIUPTOfc39dDQ7RA=
X-Received: by 2002:a05:690c:113:b0:6ef:96f8:b609 with SMTP id
 00721157ae682-6f3f821a21dmr75466387b3.31.1734836565963; Sat, 21 Dec 2024
 19:02:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241222012628.2703802-1-guoweikang.kernel@gmail.com> <202412221000.r1NzXJUO-lkp@intel.com>
In-Reply-To: <202412221000.r1NzXJUO-lkp@intel.com>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 11:02:36 +0800
Message-ID: <CAOm6qn=kVJYR1D=cxeQnzKYh9y5iN89qPLgMfO+5K1tO7hxbVg@mail.gmail.com>
Subject: Re: [PATCH v4] mm/memblock: Add memblock_alloc_or_panic interface
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux-foundation.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sam Creasey <sammy@sammy.net>, Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"

kernel test robot <lkp@intel.com> wrote on Sunday, 22 December 2024 10:56:
>
> Hi Guo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Weikang/mm-memblock-Add-memblock_alloc_or_panic-interface/20241222-092858
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20241222012628.2703802-1-guoweikang.kernel%40gmail.com
> patch subject: [PATCH v4] mm/memblock: Add memblock_alloc_or_panic interface
> config: i386-buildonly-randconfig-002-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221000.r1NzXJUO-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221000.r1NzXJUO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412221000.r1NzXJUO-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from init/main.c:29:
> >> include/linux/memblock.h:421:29: error: expected ';' after top level declarator
>      421 |                                        const char *func)
>          |                                                         ^
>          |                                                         ;
>    1 error generated.
>
>
> vim +421 include/linux/memblock.h
>
>    419
>    420  void *__memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
>  > 421                                         const char *func)
>    422
>
> --
Sorry, this is a very basic mistake. Actually, I have fixed it in my
local test, but I forgot to commit it.


> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
