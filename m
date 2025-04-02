Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0527735;
	Wed,  2 Apr 2025 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604854; cv=none; b=Q+t7EpD9WTL2m4B92ILZtAJBd3WlNacz59g6pjJlUz5f50o3AXBcaK74tZkkHWZxx1JhOwtPzetWr82wANAc2Ar/vgQCrY0dO0k8Z9XF2a+8/k+Ch+W3x8CRGwo++uYI66zazmBtwFKk8FHv/ui2ZZ3D82XxASYXE9BN6d2dYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604854; c=relaxed/simple;
	bh=5he6GMcbyMyNUKtUTvwdESnzhSBNkpXaYxscQK6pilA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHbn+8+6Q/9PxeouxITeOAKE/xTWixjj+MgHO+HZNokL5OjEfLv8UBKdrCw3xPb4nw6dcVui841njjC979LBqOkp5nM1xyCQzeQUyZ3HBQzN4xp/axJ9oWrja178YjPNiDrV0BGSZvzQ6fGw7LjUvVdhE9qTmEOpjyzJDH6qBZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVEk5nQX; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVEk5nQX"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47691d82bfbso130294371cf.0;
        Wed, 02 Apr 2025 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743604851; x=1744209651; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpoA+/FwVBLUBjhAQS2EtLKl9KXxA9hOY12cSfrhkrA=;
        b=iVEk5nQXLKxYVe9XCiv5t1l9iYXsFg113fTKZNRgj6H5HzGtpsIlEmXND6u44iwqzi
         lJ7Mmbe/4qSWrsE5djuHcTDuK6TiiYsTxbZNTxu/XZ5UyfrOUZi2YGo1RrybGYFwkUMC
         PngtlSfoBvvQx+p5lP9twwFPpH+szwOqESPbGZTkMzcv2zVVzUTsvW0ALWHGGgBZVPHy
         m21i9eRgnSKPDFYT+aBgf+ENfwwg/NqhtzaQ8wAwJdQMlo6ulDcxFz5UB2am8IThhr/c
         UbRPItLSvj+LrFZITnw/zp+K41gvQ0Hv71XfiD0WHoFwgmBkf0Wpuo/lMBU28JhS6h+s
         lOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604851; x=1744209651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpoA+/FwVBLUBjhAQS2EtLKl9KXxA9hOY12cSfrhkrA=;
        b=RljEdZO0Z8snwQhO5oQD1Qvrto4x4oc5EeeGtdQIeiiKMEaQ9XxwckcSlx12eluUTw
         oUOnsJAbjJlGfiFtY2A+djALRYfxw9gt7TsL8iE5BWlMZ0bn2D8p5NTv5NRY99NLwog7
         Y2VwL/Wz19NMJb3syDYNxKepddkoPwobL8sZInQ6faaMdkwOW8eLYmRsvYpHKhQwsG4r
         5XNf6E9DCxMOid90ttGz8bG/5oWS8FKUcpUy+CyZXWpVLEIwlY/LTXS3Fi48tXA0kMOX
         /wNiaqmYJmkxx79W8IStOG778iHzvT0VHNvO3RLZV5mYCEqFmupW/1iMhcS8/7t49uEY
         rBxA==
X-Forwarded-Encrypted: i=1; AJvYcCUliCjPeWXvn2qVtZRugG9eFi16B4anMTSmtey9vVsTslzxZ49fjMZ7FcGRuouqSgqaCh/qGT5uNMgO0h0f@lists.linux.dev
X-Gm-Message-State: AOJu0Yzivl+JjJIjFdIHNH3g4eTQPcMe7sTABLuMYQbpu1pqRVvW3eYl
	+D1oQYtSsRM0IS0vTt0AScq3LUpL9GkXuLg3I6udjARwXe3ID+ee0isPuw==
X-Gm-Gg: ASbGncuZFaP6kP0Cmjwv6PmDULcgsP/sA3CmiuHiLGAHa21SRSFEA9y02mC+vHtozUG
	w6dt2/ofjHmRTaugMslQ49x1zmX456syj8QCadOhC/DPQy4aHvfGgTi3oJvuhAfcSj8ABxazLFX
	bObhS7JIACvH/Cfewg2KPmOmoJNTR+Q+iLR9ybLyAQOzURXNprKTtC3TTFjP/vj/p2C7vp6jVgl
	aXY3iwFXTNSXaCtfKWxXzr8ycXmLPsAvZIvOPlRVDcUdMCmgwK+vDUOBFsj+ruxjjkCq4XMod79
	DwbmV617TrgNyon6hAXdc0p6rarwJGNXdfKFYhkVh2c22EY/w/RAu1qdu8wRgIafo+282fA4buY
	fCvxI
X-Google-Smtp-Source: AGHT+IEZTXJ6mg76+N8I050KHAsfQ0xKBzovVUSqYzZKgZ3N4Yf6pShgedwdkkMoUPBLZRtQOk3N7A==
X-Received: by 2002:a05:620a:440d:b0:7c3:c869:1aff with SMTP id af79cd13be357-7c68f406bb9mr2375042985a.16.1743604850452;
        Wed, 02 Apr 2025 07:40:50 -0700 (PDT)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7764e8dsm794309785a.88.2025.04.02.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:40:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:40:48 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	geert@linux-m68k.org
Subject: Re: [litex-hub:litex-rebase 8/18] drivers/gpio/gpio-litex.c:157:2:
 error: use of undeclared identifier 'class_spin_lock_irqsave_t'; did you
 mean '_raw_spin_lock_irqsave'?
Message-ID: <Z-1McIALVutx79ns@glsmbp.wifi.local.cmu.edu>
References: <202504021531.LSDxngLf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504021531.LSDxngLf-lkp@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett

Thanks, I think that was a typo. Fixed in `afc33fa39c5e` by
s/spin_lock_irqsave/spinlock_irqsave/

Thanks,
--Gabriel

On Wed, Apr 02, 2025 at 03:11:46PM +0800, kernel test robot wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   27cd831fb75ec1b1667350dcdad43e58d34ac9f5
> commit: 639fd3757f161027e4f8ec56033e598bf06d7923 [8/18] fixup: use scoped_guard() with LiteGPIO
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250402/202504021531.LSDxngLf-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021531.LSDxngLf-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504021531.LSDxngLf-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'class_spin_lock_irqsave_t'; did you mean '_raw_spin_lock_irqsave'?
>      157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |              ^
>    include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
>      258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>          |         ^
>    <scratch space>:159:1: note: expanded from here
>      159 | class_spin_lock_irqsave_t
>          | ^
>    include/linux/spinlock_api_smp.h:32:26: note: '_raw_spin_lock_irqsave' declared here
>       32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
>          |                          ^
> >> drivers/gpio/gpio-litex.c:157:2: error: expected ';' in 'for' statement specifier
>      157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |                           ^
> >> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |                           ^
>    arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
>      119 | extern struct sclp_info sclp;
>          |                         ^
> >> drivers/gpio/gpio-litex.c:157:2: error: expected ';' in 'for' statement specifier
>      157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |              ^
>    include/linux/cleanup.h:258:24: note: expanded from macro 'CLASS'
>      258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>          |                               ^
>    include/linux/compiler-clang.h:15:25: note: expanded from macro '__cleanup'
>       15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
>          |                         ^
>    include/linux/compiler_attributes.h:343:41: note: expanded from macro '__maybe_unused'
>      343 | #define __maybe_unused                  __attribute__((__unused__))
>          |                                         ^
> >> drivers/gpio/gpio-litex.c:157:2: error: call to undeclared function 'class_spin_lock_irqsave_lock_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:7: note: expanded from macro '__scoped_guard'
>      335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
>          |              ^
>    include/linux/cleanup.h:321:28: note: expanded from macro '__guard_ptr'
>      321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
>          |                            ^
>    <scratch space>:165:1: note: expanded from here
>      165 | class_spin_lock_irqsave_lock_ptr
>          | ^
>    drivers/gpio/gpio-litex.c:157:2: note: did you mean 'class_spinlock_irqsave_lock_ptr'?
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:7: note: expanded from macro '__scoped_guard'
>      335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
>          |              ^
>    include/linux/cleanup.h:321:28: note: expanded from macro '__guard_ptr'
>      321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
>          |                            ^
>    <scratch space>:165:1: note: expanded from here
>      165 | class_spin_lock_irqsave_lock_ptr
>          | ^
>    include/linux/spinlock.h:585:1: note: 'class_spinlock_irqsave_lock_ptr' declared here
>      585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
>          | ^
>    include/linux/cleanup.h:408:49: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
>      408 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
>          |                                                                         ^
>    include/linux/cleanup.h:387:10: note: expanded from macro '\
>    __DEFINE_UNLOCK_GUARD'
>      387 |                                                                         \
>          |                                                                         ^
>    include/linux/cleanup.h:295:23: note: expanded from macro '\
>    __DEFINE_GUARD_LOCK_PTR'
>      295 |         static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
>          |                              ^
>    <scratch space>:133:1: note: expanded from here
>      133 | class_spinlock_irqsave_lock_ptr
>          | ^
> >> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
>      157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:27: note: expanded from macro '__scoped_guard'
>      335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
>          |                                  ^
>    arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
>      119 | extern struct sclp_info sclp;
>          |                         ^
> >> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared identifier 'class_spin_lock_irqsave_is_conditional'; did you mean 'class_spinlock_irqsave_is_conditional'?
>      157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:38: note: expanded from macro '__scoped_guard'
>      335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
>          |                                             ^
>    include/linux/cleanup.h:322:30: note: expanded from macro '__is_cond_ptr'
>      322 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
>          |                              ^
>    <scratch space>:167:1: note: expanded from here
>      167 | class_spin_lock_irqsave_is_conditional
>          | ^
>    include/linux/spinlock.h:585:1: note: 'class_spinlock_irqsave_is_conditional' declared here
>      585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
>          | ^
>    include/linux/cleanup.h:407:65: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
>      407 | #define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)          \
>          |                                                                         ^
>    include/linux/cleanup.h:292:34: note: expanded from macro '\
>    __DEFINE_CLASS_IS_CONDITIONAL'
>      292 | static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
>          |                                  ^
>    <scratch space>:125:1: note: expanded from here
>      125 | class_spinlock_irqsave_is_conditional
>          | ^
> >> drivers/gpio/gpio-litex.c:157:2: error: expected ')'
>      157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:58: note: expanded from macro '__scoped_guard'
>      335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
>          |                                                                 ^
>    drivers/gpio/gpio-litex.c:157:2: note: to match this '('
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:6: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |             ^
> >> drivers/gpio/gpio-litex.c:157:2: error: expected ';' after expression
>      157 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:336:25: note: expanded from macro '__scoped_guard'
>      336 |              ({ goto _label; }))                                        \
>          |                                ^
> >> drivers/gpio/gpio-litex.c:157:2: error: expected expression
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:336:25: note: expanded from macro '__scoped_guard'
>      336 |              ({ goto _label; }))                                        \
>          |                                ^
> >> drivers/gpio/gpio-litex.c:157:2: error: use of undeclared label '__UNIQUE_ID_label556'
>    include/linux/cleanup.h:343:24: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |                               ^
>    include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
>      166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>          |                             ^
>    include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
>       84 | #define __PASTE(a,b) ___PASTE(a,b)
>          |                      ^
>    include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
>       83 | #define ___PASTE(a,b) a##b
>          |                       ^
>    <scratch space>:157:1: note: expanded from here
>      157 | __UNIQUE_ID_label556
>          | ^
>    drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'class_spin_lock_irqsave_t'; did you mean '_raw_spin_lock_irqsave'?
>      173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |              ^
>    include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
>      258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>          |         ^
>    <scratch space>:173:1: note: expanded from here
>      173 | class_spin_lock_irqsave_t
>          | ^
>    include/linux/spinlock_api_smp.h:32:26: note: '_raw_spin_lock_irqsave' declared here
>       32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
>          |                          ^
>    drivers/gpio/gpio-litex.c:173:2: error: expected ';' in 'for' statement specifier
>      173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |                           ^
>    drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:20: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |                           ^
>    arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
>      119 | extern struct sclp_info sclp;
>          |                         ^
>    drivers/gpio/gpio-litex.c:173:2: error: expected ';' in 'for' statement specifier
>      173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:334:7: note: expanded from macro '__scoped_guard'
>      334 |         for (CLASS(_name, scope)(args);                                 \
>          |              ^
>    include/linux/cleanup.h:258:24: note: expanded from macro 'CLASS'
>      258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
>          |                               ^
>    include/linux/compiler-clang.h:15:25: note: expanded from macro '__cleanup'
>       15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
>          |                         ^
>    include/linux/compiler_attributes.h:343:41: note: expanded from macro '__maybe_unused'
>      343 | #define __maybe_unused                  __attribute__((__unused__))
>          |                                         ^
>    drivers/gpio/gpio-litex.c:173:2: error: call to undeclared function 'class_spin_lock_irqsave_lock_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:7: note: expanded from macro '__scoped_guard'
>      335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
>          |              ^
>    include/linux/cleanup.h:321:28: note: expanded from macro '__guard_ptr'
>      321 | #define __guard_ptr(_name) class_##_name##_lock_ptr
>          |                            ^
>    <scratch space>:179:1: note: expanded from here
>      179 | class_spin_lock_irqsave_lock_ptr
>          | ^
>    drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'scope'; did you mean 'sclp'?
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:27: note: expanded from macro '__scoped_guard'
>      335 |              __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);       \
>          |                                  ^
>    arch/s390/include/asm/sclp.h:119:25: note: 'sclp' declared here
>      119 | extern struct sclp_info sclp;
>          |                         ^
>    drivers/gpio/gpio-litex.c:173:2: error: use of undeclared identifier 'class_spin_lock_irqsave_is_conditional'; did you mean 'class_spinlock_irqsave_is_conditional'?
>      173 |         scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>          |         ^
>    include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
>      343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
>          |         ^
>    include/linux/cleanup.h:335:38: note: expanded from macro '__scoped_guard'
> 
> 
> vim +157 drivers/gpio/gpio-litex.c
> 
>    145	
>    146	static void litex_gpio_irq_unmask(struct irq_data *idata)
>    147	{
>    148		struct gpio_chip *chip = irq_data_get_irq_chip_data(idata);
>    149		struct litex_gpio *gpio_s = gpiochip_get_data(chip);
>    150		int offset = irqd_to_hwirq(idata) % GPIO_PINS_MAX;
>    151		u32 bit = BIT(offset);
>    152		u32 enable;
>    153	
>    154		gpiochip_enable_irq(chip, idata->hwirq);
>    155	
>    156		/* Clear any sticky pending interrupts */
>  > 157		scoped_guard(spin_lock_irqsave, &gpio_s->gpio_lock) {
>    158			litex_gpio_set_reg(gpio_s, LITEX_GPIO_PENDING_OFFSET, bit);
>    159			enable = litex_gpio_get_reg(gpio_s, LITEX_GPIO_ENABLE_OFFSET);
>    160			enable |= bit;
>    161			litex_gpio_set_reg(gpio_s, LITEX_GPIO_ENABLE_OFFSET, enable);
>    162		}
>    163	}
>    164	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
