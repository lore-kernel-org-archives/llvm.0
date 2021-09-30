Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA482F80
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 05:47:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m22so2535596wrb.0
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 22:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EzwNWjTA5Fd4xVXh78xrF5nbIKyF+4Pya3O8qiR1rIQ=;
        b=iRNJz/xqpqPoyQSLh2ywRVa0n3uxvx/wojGCs5GD4Y46iHvtmD2RbrQPoQShBDj7jV
         5U4WVatDOnZz7lcBbJuzazHLx7kFrEUd4pCUEF4Ku0W9YD0QVb5GPge0j+i5KeFYIER3
         Ld5CTKmmdfGNB+oh2aARdjI+i9Us3Y9EFpAvlGc/FdoG8pScnD/WryLC5IjDT1PCS31w
         iqm+8zLlW39WZxW+NPPHqRc6Nr5wV3we3jty1LZxBD5j2LvAltCzESLqPM3hhpSR4/Bd
         9B8j3Kw/lANMm/WIrbPLHb0dtdoRJ8hPJH8fcwvuKVB5lXrqeV15d22TyLkQmwVc7qRd
         3O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EzwNWjTA5Fd4xVXh78xrF5nbIKyF+4Pya3O8qiR1rIQ=;
        b=d83Pw3bM9R1+ouU287UJYguzl7Euc7UHO0FjPptXB0GevFiFRHGQpuc8KrcR8xg1F0
         moJirUYF8Fe/V2XP9YYLMvGAGH93iYik7dyAjW76ZuB1OJgRpYwRCMZZa0XpAEucdkHd
         tVmYJQ+qs38OQL4cOzuyoZMwPAI7q/l6KxVlf6wp6DDv036jvXjdbgt1OHcy6jzThstA
         s30lEo+KL7brpAoJYaeDxMmuplBvkrJbGE8Oy1965yyCkw+pRzqGN3C6sHV+6G29Q5B0
         DrZ3WW3jZr9d10t2P54WMoBBD1zea9G7H69cBXGit+r9HM6thK47Cl8P69WRsCN3SN6L
         3IGg==
X-Gm-Message-State: AOAM530I+3TDTgo6KOKSovw1DXU6bKfq98eBN0rWuvW2V+cdSd6uQc1Y
	eAGzijOZ4KwBQiYJ8Cjc23HydA==
X-Google-Smtp-Source: ABdhPJzHH5fuu3NOH3D91vWmB3Krt08tYXnI2l0GMVsYoBCqe6guLSe24o0X2MIAIj2+fAibSYRBkw==
X-Received: by 2002:adf:a18d:: with SMTP id u13mr3915822wru.83.1632980836200;
        Wed, 29 Sep 2021 22:47:16 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:4c54:2b8f:fabf:78b0])
        by smtp.gmail.com with ESMTPSA id h11sm1333555wru.10.2021.09.29.22.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 22:47:15 -0700 (PDT)
Date: Thu, 30 Sep 2021 07:47:09 +0200
From: Marco Elver <elver@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [mark:arm64/kcsan 11/13] ld.lld: error: undefined symbol:
 __tsan_atomic64_fetch_add
Message-ID: <YVVPXS6I6TwOudcX@elver.google.com>
References: <202109300534.s1xCnxOR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202109300534.s1xCnxOR-lkp@intel.com>
User-Agent: Mutt/2.0.5 (2021-01-21)

On Thu, Sep 30, 2021 at 05:48AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/kcsan
> head:   4fe9d6c2ef85257d80291086e4514eaaebd3504e
> commit: f5bc7f69b328f00a6accd9a11f5981d2d0c11cb5 [11/13] kcsan: remove atomic builtin support
> config: x86_64-randconfig-a011-20210929 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8dfdfe7efecfda318d43a06fae18b40eb498)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=f5bc7f69b328f00a6accd9a11f5981d2d0c11cb5
>         git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
>         git fetch --no-tags mark arm64/kcsan
>         git checkout f5bc7f69b328f00a6accd9a11f5981d2d0c11cb5
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: __tsan_atomic64_fetch_add
>    >>> referenced by initcall.h:10 (include/trace/events/initcall.h:10)
>    >>>               main.o:(__traceiter_initcall_level) in archive init/built-in.a
>    >>> referenced by initcall.h:10 (include/trace/events/initcall.h:10)
>    >>>               main.o:(__traceiter_initcall_level) in archive init/built-in.a
>    >>> referenced by initcall.h:10 (include/trace/events/initcall.h:10)
>    >>>               main.o:(__traceiter_initcall_level) in archive init/built-in.a
>    >>> referenced 744943 more times

This was another reason why I added the __tsan_atomic instrumentation
calls -- to avoid chasing the odd driver or however this happened using
builtin atomics and the blame always falling on KCSAN. ;-)

This happened more than once, and I just got frustrated and added them,
also in preparation of other odd arches wanting it. I think KCSAN isn't
meant to be the do-not-use-atomic-builtins linter.

If you can somehow keep them, I would prefer that, just to avoid going
back to a world where I have to chase the odd builtin atomic user after
they broke the KCSAN build.

Would a $(call cc-option,-mno-outline-atomics) help?

--- a/kernel/kcsan/Makefile
+++ b/kernel/kcsan/Makefile
@@ -8,7 +8,8 @@ CFLAGS_REMOVE_debugfs.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_report.o = $(CC_FLAGS_FTRACE)
 
 CFLAGS_core.o := $(call cc-option,-fno-conserve-stack) \
-	-fno-stack-protector -DDISABLE_BRANCH_PROFILING
+	-fno-stack-protector -DDISABLE_BRANCH_PROFILING \
+	$(call cc-option,-mno-outline-atomics)
 
 obj-y := core.o debugfs.o report.o
 obj-$(CONFIG_KCSAN_SELFTEST) += selftest.o

A quick test with a compiler version which generated outline
atomics suggests that this works.

Thanks,
-- Marco
