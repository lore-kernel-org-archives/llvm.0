Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1F171092;
	Mon,  9 Jun 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479305; cv=none; b=P6x6Jl9hir9RQAbt1c27h+SZLJNUMHQ03sGHb45K3OEN2caqVm87j6eelH8puF+tZR/NzPpjoCcuESuUIJOipUX27ViVIaOZUMsPgRJ6XwrGBiuU7yBJJANBUQUH3ctHg+Aqt4zdE18I6SHz/lRDfV24q9TzYLeLaMwloUtl/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479305; c=relaxed/simple;
	bh=olvsDFUTNHbjjliVmNre4tAB0dGuQ3Kltdr8ZQ8ZoHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoX2nxxV54/DfYMZeEzXAVPYBPX7oT9ye6lt/vk7QZsC9YNR3VerMUzP5oqUeoLtQFtDmNkslzu6zsZV0bl43O9/bqezsZUY7F9dXfrSGqYARuMUnwVF1AOh06fXkIipiRT44Atcye7SfDMkDw9f34Qm9GKweUzzjobh0gzT7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l17rLrzu; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l17rLrzu"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70a57a8ffc3so42017197b3.0;
        Mon, 09 Jun 2025 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749479303; x=1750084103; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ULBgHgW55K4uCky/f5KUdZJE/tyMyCrzkPdUsTZnDnM=;
        b=l17rLrzuwLYnih9AFVANxWvUEJeOsJ7SzIeLeCyVPlFriUyAd/aG/UQD5qi6rywW1P
         Lk+WEg5jGcjUmXOJ7zcOZVyMXqpCU339bTvffE8b6mrvJTWUQI7QpX/FqUp8xp947Anf
         wn2ksY78045fOw5Jjhj+WkFP1kxW+fjFT30e9IJwCwH/B4FXHymS62IAuW3w87mjcHYf
         EQHVjf55sXhvd7qHx7/ihf/1kRw7dQbzsUsrDbcv++72AWkMc67ZkNnHwzM96QPMRAiF
         kXoTFGHA0D07TY7Cm2oSwxcTiNNpI0el3NHJTF+p1hn0h+wbebAxWuF/YZB1ytRNSqLj
         +8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479303; x=1750084103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULBgHgW55K4uCky/f5KUdZJE/tyMyCrzkPdUsTZnDnM=;
        b=LtqSWFE06Q7WdI+FIaqpp2BFYW1fov0Dg73FG7ysUBAGv79oTbiSjmszBm89MS9tzc
         1j8m+SBYLO9R26gDux+priOt0Gba+ZudZwxspFZlqxgYre9k6da1w2Wk8/juVnhllNEF
         PZZoVZ3KKUurqqhoSGeBV6kRe3J5Uy7g2ul/FjkcLGtU+qFCTXoBcHUKzHm6GBgXXYvj
         0kgiaisAqa7oG/wiOY6vAALqzuyBizwoMTXAV/teuYYKQITEyfoWnW+1z+Vd5dvbvIvt
         WtcluSn6S66qNS5f/iTOdF/7jesWlZP38tbJ3kid4+Nqg64LNaU+Nsz7I4EIf+e6v/R/
         BK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUR5J/+CwsJjHMvyhpKGDXlfoeezKIZLOdRDVq/0Ybqbkaeo8WSaCkmKpB3ADmdtALPM/DG@lists.linux.dev, AJvYcCUV+cKIGdlOOa1cwiMfyyg6vVUArywuO/1h8fQQ5d9208kKgu18B16tViqMqDm1Rz7I6fELSeXegdtkJqLHIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy114seJh9YGUit/k9BK9DX5Zkio9eSLTZ+lmFhww9ui12mk/Vt
	fXMQYKEoyaxxTtCTjjWo88h21DH8T5ti57ynFk38Kr6GIE8a+6Qg67PB
X-Gm-Gg: ASbGnctg9/znv0sto11rz1Tfs+QTfogLHeLiA8wdCOoSgXTRGb98HkolvGpc30EubtA
	cm/oftSkwxBT/LWa+lrv9TN+bgzA8xPINDPg2as+1m3rzJAEJuJkKKsSyiCu9Iv/vEB3uxeTZKJ
	P9RUBIHzK4yCY1rsDcdnQdPhslBME5fFeIcQVn2PP8qSEhTb/GLRBECm3zE/DxS7sIlbFb6wUpE
	s12gN7aoZfVk8voSLCHCpiahz52bxKwwC2CbE6byb0qBsFcGOlflALD/y7G07UYewxXfc0ZzD3/
	idWL3gst3oA1AQPlNLgFpX534cpMVwMY2q0yuELXp+lwcFBnagb5quySa2SqOwkf8HtIv5Y2lDy
	tzbcMRdnl734=
X-Google-Smtp-Source: AGHT+IE7x/r83CjR/wFN75taS22AA4M8aAtcLjlNxIoyzoAwTuVKwgHMLdfLcGW/eUK9jarXCVZw1A==
X-Received: by 2002:a05:690c:6408:b0:70e:5eda:4940 with SMTP id 00721157ae682-710f77106a1mr185615697b3.25.1749479302621;
        Mon, 09 Jun 2025 07:28:22 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99141bbsm12528847b3.54.2025.06.09.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:28:22 -0700 (PDT)
Date: Mon, 9 Jun 2025 10:28:21 -0400
From: Yury Norov <yury.norov@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 1/3] bitmap: generalize node_random()
Message-ID: <aEbvhXP__dGv35kp@yury>
References: <20250608194536.28130-2-yury.norov@gmail.com>
 <202506090550.y3ypu2EO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506090550.y3ypu2EO-lkp@intel.com>

On Mon, Jun 09, 2025 at 05:44:47AM +0800, kernel test robot wrote:
> Hi Yury,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-nonmm-unstable]
> [also build test ERROR on tip/timers/core akpm-mm/mm-everything linus/master v6.15 next-20250606]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/bitmap-generalize-node_random/20250609-034657
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> patch link:    https://lore.kernel.org/r/20250608194536.28130-2-yury.norov%40gmail.com
> patch subject: [PATCH 1/3] bitmap: generalize node_random()
> config: arm-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090550.y3ypu2EO-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090550.y3ypu2EO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506090550.y3ypu2EO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from ./arch/arm/include/generated/asm/preempt.h:1:
>    In file included from include/asm-generic/preempt.h:5:
>    In file included from include/linux/thread_info.h:27:
>    In file included from include/linux/bitops.h:29:
>    include/asm-generic/bitops/generic-non-atomic.h:140:16: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>      140 |         return 1UL & (smp_load_acquire(p) >> (nr & (BITS_PER_LONG-1)));
>          |                       ^
>    include/asm-generic/barrier.h:204:37: note: expanded from macro 'smp_load_acquire'
>      204 |         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
>          |                                            ^
>    include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
>       49 |         compiletime_assert_rwonce_type(x);                              \
>          |         ^
>    include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
>       36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>          |         ^
>    include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
>      565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^
>    include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
>      547 |                         __compiletime_error(msg);                       \
>          |                         ^
>    include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
>      138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
>          |                                                        ^
>    include/linux/mm.h:2618:9: note: previous attribute is here
>     2618 |         return max(mm->hiwater_rss, get_mm_rss(mm));
>          |                ^
>    include/linux/minmax.h:112:19: note: expanded from macro 'max'
>      112 | #define max(x, y)       __careful_cmp(max, x, y)
>          |                         ^
>    include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
>       98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>          |         ^
>    include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
>       93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
>          |         ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
>      565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^
>    include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
>      547 |                         __compiletime_error(msg);                       \
>          |                         ^
>    include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
>      138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
>          |                                                        ^
>    In file included from crypto/krb5/rfc8009_aes2.c:10:
>    In file included from include/linux/slab.h:16:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:8:
>    In file included from include/linux/spinlock.h:56:
>    In file included from include/linux/preempt.h:79:
>    In file included from ./arch/arm/include/generated/asm/preempt.h:1:
>    In file included from include/asm-generic/preempt.h:5:
>    In file included from include/linux/thread_info.h:27:
>    In file included from include/linux/bitops.h:29:
>    include/asm-generic/bitops/generic-non-atomic.h:140:16: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
>      140 |         return 1UL & (smp_load_acquire(p) >> (nr & (BITS_PER_LONG-1)));
>          |                       ^
>    include/asm-generic/barrier.h:204:37: note: expanded from macro 'smp_load_acquire'
>      204 |         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
>          |                                            ^
>    include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
>       49 |         compiletime_assert_rwonce_type(x);                              \
>          |         ^
>    include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
>       36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
>          |         ^
>    include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
>      565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^
>    include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
>      547 |                         __compiletime_error(msg);                       \
>          |                         ^
>    include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
>      138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
>          |                                                        ^
>    include/linux/mm.h:2623:9: note: previous attribute is here
>     2623 |         return max(mm->hiwater_vm, mm->total_vm);
>          |                ^
>    include/linux/minmax.h:112:19: note: expanded from macro 'max'
>      112 | #define max(x, y)       __careful_cmp(max, x, y)
>          |                         ^
>    include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
>       98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>          |         ^
>    include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
>       93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
>          |         ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
>    include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
>      565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^
>    include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
>      547 |                         __compiletime_error(msg);                       \
>          |                         ^
>    include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
>      138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
>          |                                                        ^
> >> crypto/krb5/rfc8009_aes2.c:209:3: error: call to undeclared function 'get_random_bytes'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      209 |                 get_random_bytes(buffer, krb5->conf_len);
>          |                 ^
>    27 warnings and 1 error generated.

OK, I'll enable those locally, buld-test and send a v3. 
