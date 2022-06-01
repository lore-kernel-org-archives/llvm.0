Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61D37E
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 17:10:11 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id a64so4008918ybg.11
        for <llvm@lists.linux.dev>; Wed, 01 Jun 2022 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6EIbcZatjpkcX8dY4bwdnoH1xzyHXXsA5PemFtBbPz0=;
        b=LitNWAoKnCNBo/+Y6eTtHcGB+UktbMCytoK/KfsB0z1zxiyeVlvZLTymGyq7JIcx67
         qtbhNvIFzsdY5hHF+TC83u0kmsF3q0a7m1hjt2sZZz27p5H0QgQYnLtzwBZcmjwg+L2d
         RY3QWXtA+fEbWENtNbh2G2/7J7LJdeLLN3Q5ph45kvan/vxoxxSWDNL0SXekJ7unUrKk
         KSj5WStmg4TBQ852rdGgH5CNs1eU8ugK8FLW27hJQTFIMcIGNCPGjKaFhMief6Hll0E2
         DGHEcKPujsVori84PAgGP2GKRSjlO8B+aPrrpuU1dWoiXfsTejGkFXW7EWqp9bK74WT3
         0LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6EIbcZatjpkcX8dY4bwdnoH1xzyHXXsA5PemFtBbPz0=;
        b=KOrGDUTyxCWboza4j7XkeejYnDhysvcvCbTuPjwyrS1A1zl77kdwrItiE7HRwRUXtt
         RJvBHDszhYn6B6L//VLu1pgmsAaqBze9Swh9ElwWsNrMtVF76pn1Joh3tRJa3RDgcmNP
         WbSoKNjsILT3IuVUV+l4KS53o0MmYCtm1CHCmnuLe98HTj3uVv0yQtSioqoah1PyOndH
         bDKU1g2Das5c3g8s+mbM/MlXIkW9EzMT3YHT1bVAKVtEeiJv9gLTEFP/z/r4+LIpNpvC
         Jg4NxdzT4lbR0ukoIA8A7thE1aoa27exsC9bVZBce2InkD6z/KxBWb7ryz/l2J7vNWGw
         dkHQ==
X-Gm-Message-State: AOAM5307mI50zYZlMg6wtU69kVfcFkp9ggv+RWGo95G5yTJer7lhZAuh
	kigNHR5OVg5rVVEMo59a54UJ82xudG0TpBVUf0RMMsh/D2HXpg==
X-Google-Smtp-Source: ABdhPJxpz9bLhf5zOnRMDNDPY4GJt3hD/hubv30XC+ue+qJXWvDMeCeEXeftVz4VvzDCXkwzUrYBNuxOn53wzPriDs0=
X-Received: by 2002:a05:6902:191:b0:660:26f4:3318 with SMTP id
 t17-20020a056902019100b0066026f43318mr809185ybh.5.1654103410578; Wed, 01 Jun
 2022 10:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220426164315.625149-5-glider@google.com> <202204271215.wfSd4UMp-lkp@intel.com>
In-Reply-To: <202204271215.wfSd4UMp-lkp@intel.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 1 Jun 2022 19:09:34 +0200
Message-ID: <CAG_fn=UvF=WPdY-3438BaS2sLXoA_TU6aEZJTALiwWe6MbQWUg@mail.gmail.com>
Subject: Re: [PATCH v3 04/46] instrumented.h: allow instrumenting both sides
 of copy_from_user()
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 6:37 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Alexander,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on tip/x86/core]
> [also build test ERROR on tip/x86/mm linus/master v5.18-rc4 next-20220426]
> [cannot apply to hnaz-mm/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220427-004851
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 203d8919a9eda5d1bc68ac3cd7637588334c9dc1
> config: s390-randconfig-r034-20220425 (https://download.01.org/0day-ci/archive/20220427/202204271215.wfSd4UMp-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/c30e163fc48e694440a08d8445bf06254e933bf1
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Alexander-Potapenko/Add-KernelMemorySanitizer-infrastructure/20220427-004851
>         git checkout c30e163fc48e694440a08d8445bf06254e933bf1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/s390/lib/uaccess.c:84:3: error: call to undeclared function 'instrument_copy_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    instrument_copy_from_user(to, from, n);
>                    ^
>    arch/s390/lib/uaccess.c:84:3: note: did you mean 'instrument_copy_to_user'?
>    include/linux/instrumented.h:116:1: note: 'instrument_copy_to_user' declared here
>    instrument_copy_to_user(void __user *to, const void *from, unsigned long n)
>    ^
>    1 error generated.
Will replace this occurrence of instrument_copy_to_user() in v4.
