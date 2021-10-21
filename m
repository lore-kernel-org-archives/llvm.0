Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17B02C81
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 16:44:34 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id y15so129226lfk.7
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8ufpU/tiZw01hWpUjLLHm0q5zBwS28E8OoSVMxxZig=;
        b=EHRu16wHOPFs3qQMWlhDZt4VQeC3zknrr2jb2YzYiD7/z0fvr5clViYjnlO6FuOu6q
         A5Gd6szjYz08USIjauIkLxyusi4Tq0i6g13GH9totvDgLz0tSb3SINpGn3nFqMuELc1l
         KXdHoQVqsCVsoqTYwbNCh5Hg9yZDnwkK81GZRSn7jvmfRU5lkjji8lF+chynC8pCzN3t
         WawTW/WKSKNT8IvuSwoRkadB8E9K0eiYUoqDvTtSZb36I4xNpS4wJ33Aq+onJSrpOVYd
         6Z2jzS1Jpx99JsqpkTRQhwd2K8IoA2/LVCY6jexymXmjHsL1sXCfYHGW64TtgDj1JDof
         Erlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8ufpU/tiZw01hWpUjLLHm0q5zBwS28E8OoSVMxxZig=;
        b=Vo2yX0CyYRQVHBDfkM1SHkV/eTvWwK7kGjPr7whi5hi8awFmPlmdSqfXdKnaEUMCTn
         pLDS7aVE8nBo/EgLR8KUrsaVvbq1DJGPDqfWnVmASXt9pj/1UdhwHWow8KT5233r5wRC
         elTm+cq/qSxLgu9YWjyDpcmNTzVxmjReKUKnESrVcYXvkViqYmSKjt3sEGEOGWB3dAbo
         WgXH1nHU2gm8pqaKdyxgAWKqpwpmNhQ1f/s2O8ZiyvRDlaqCIJTFpEXs1ewhLkf4SfIO
         NJZqcK/mjyj4GSSQDAkU45KB6jbvsF81QweiWv03M+ZqtHJI+Ry+aaJuWP2Sx/fhJJ2Q
         FF2w==
X-Gm-Message-State: AOAM532Nuc8sycqc7aQM0ua1aGS4xnqI/rblDNNGP7puOXmrbc/Ad965
	s2TQphuGYKf9cNhhM9Ox42siLWCmxZxHitY/AgpT/Q==
X-Google-Smtp-Source: ABdhPJxjRWvHQLiPQBqk+3JKfHsSroNJQv6Y/xJmzn72ouxjsXyphir8OGoo90N2hxIkcReLxUSzawNRhIW6jbTBj5E=
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr6520107lfu.489.1634834669598;
 Thu, 21 Oct 2021 09:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211020092453.179929-3-aneesh.kumar@linux.ibm.com>
 <202110210302.HqL0ETus-lkp@intel.com> <2815d79c-7c0f-01df-4f61-d11aa8b2012a@linux.ibm.com>
In-Reply-To: <2815d79c-7c0f-01df-4f61-d11aa8b2012a@linux.ibm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 Oct 2021 09:44:18 -0700
Message-ID: <CAKwvOd=VSmjTDxM=hKOEFimsW=KzPdwMbszivUp44UD2QJ1EqQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mm/mempolicy: wire up syscall set_mempolicy_home_node
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 11:01 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 10/21/21 00:54, kernel test robot wrote:
> > Hi "Aneesh,
> >
> > [FYI, it's a private test report for your RFC patch.]
> > [auto build test WARNING on arm64/for-next/core]
> > [also build test WARNING on linus/master v5.15-rc6]
> > [cannot apply to hnaz-mm/master tip/x86/asm next-20211020]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Aneesh-Kumar-K-V/mm-mempolicy-use-policy_node-helper-with-MPOL_PREFERRED_MANY/20211020-172721
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> > config: arm64-randconfig-r033-20211019 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9660563950aaed54020bfdf0be07e7096a9553e4)
> > reproduce (this is a W=1 build):

^ W=1

> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # install arm64 cross compiling tool for clang build
> >          # apt-get install binutils-aarch64-linux-gnu
> >          # https://github.com/0day-ci/linux/commit/10f30e8157782f17ae682c2bbca95c226af3612a
> >          git remote add linux-review https://github.com/0day-ci/linux
> >          git fetch --no-tags linux-review Aneesh-Kumar-K-V/mm-mempolicy-use-policy_node-helper-with-MPOL_PREFERRED_MANY/20211020-172721
> >          git checkout 10f30e8157782f17ae682c2bbca95c226af3612a
> >          # save the attached .config to linux build tree
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >             asmlinkage long __weak __arm64_sys_##name(const struct pt_regs *regs)   \
> >                                    ^
> >     <scratch space>:60:1: note: expanded from here
> >     __arm64_sys_process_madvise
> >     ^
> >     kernel/sys_ni.c:291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> >     arch/arm64/include/asm/syscall_wrapper.h:76:13: note: expanded from macro 'COND_SYSCALL'
> >             asmlinkage long __weak __arm64_sys_##name(const struct pt_regs *regs)   \
> >                        ^
>
> Is this clang specific? I am not able to recreate this with gcc 10 cross
> compiling.

Did you build with `make ... W=1`? I suspect GCC will print those
additional warnings, too, at W=1.
-- 
Thanks,
~Nick Desaulniers
