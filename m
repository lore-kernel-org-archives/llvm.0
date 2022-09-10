Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E36EC0
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 12:17:03 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id e5so4142704pfl.2
        for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=huVRG5XO8fcaYWZNsfy894m9PZZdD/B3JeE0oXyOsZU=;
        b=HXAZvt51+Je97DR+MEWcj3ayYLglJCe5jFajTxLsIO/11addD3i2drrq7Fs8vurgIT
         JKTDwzgAg61egHIdnF6RFQj31vGUsRmEa+ojo+yG61G1+l21DQ583wwoa6JLRhS2pwkL
         lN7+J7eGyFUKIcc7MbQ29lDUh40vZ+xgYpGwcardIHyNNqQH4IVwpqg9ap4tEVS8QQdg
         MZ0AlWzOyZnAZ8FDC+JVvwIAiXqB91J1rfoTE3WGCjFGbHRP2iB+oCb9uZOzc8C/AmpQ
         bicSVxAy91crxXiwdWlzIKy45Qm8IsyxD8HDPKhiD+fEnz/PPhMoT48rBcw6jlsHH8jR
         DEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=huVRG5XO8fcaYWZNsfy894m9PZZdD/B3JeE0oXyOsZU=;
        b=OCvB1iQ3ZuWnDAwgKlBow8xM6ENqBBYQWSKOpfzsgx617uDbFYHR+920Y9ZPNPfUii
         zcLR2Lv0GdMjIAbmOIRncNvOZkZBaQosmXwLqT+dfwkzxXiA5zlvZa5s8aI0rUXVx6IB
         Z1J3lWImzqp5Cu5tp3ykC7UhORgP0un6ZvyDsxUoDX4x5wdmCL3Uuq3OfHv9CSKZQ3UI
         elGMn0k+hzYK1GjGohpOWd1sxQNHHH4Fh03oIMeoVA8yvAQg64N/eQSQ8PuxZR8+wKf5
         Ea0pACPYK2DNIQxpsGc7d+KWWtGwlNiLO4UoGfm/1rfrSRIf9k5eO6LYk6XHOLpMo1lU
         6jkQ==
X-Gm-Message-State: ACgBeo0ATlt7y9Ym6SoSE09aHarWaEy3z78O0eL3koJLAwVZnxyNfCFX
	V53DjGXsTn9c7RPyeDlgicw=
X-Google-Smtp-Source: AA6agR6lEJhPzPWWB7hnc5HQ9fm+WGIlRmFE6WfHX/RFafS2ItsHwF9Cxm8fXLMQLFCaohEHZ6eVcw==
X-Received: by 2002:a05:6a00:16d6:b0:53b:3e58:1c6f with SMTP id l22-20020a056a0016d600b0053b3e581c6fmr18773115pfc.7.1662812222459;
        Sat, 10 Sep 2022 05:17:02 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b0016d2d2c7df1sm2116335plh.188.2022.09.10.05.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 05:17:01 -0700 (PDT)
Date: Sat, 10 Sep 2022 21:16:56 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-mm@kvack.org
Subject: Re: [vbabka-slab:for-6.1/fit_rcu_head 2/2] mm/slab.h:94:1: error:
 static_assert failed due to requirement '((__builtin_offsetof(struct slab,
 counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct
 slab, counters), 16)"
Message-ID: <YxyAOLaUf4HnABYA@hyeyoo>
References: <202209101614.lMCcS0Zj-lkp@intel.com>
 <YxxL7zWWuWnCtXW4@hyeyoo>
 <5b672980-a590-06cc-56c2-f63a3727d994@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b672980-a590-06cc-56c2-f63a3727d994@suse.cz>

On Sat, Sep 10, 2022 at 01:56:26PM +0200, Vlastimil Babka wrote:
> On 9/10/22 10:33, Hyeonggon Yoo wrote:
> > On Sat, Sep 10, 2022 at 04:05:44PM +0800, kernel test robot wrote:
> >> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-6.1/fit_rcu_head
> >> head:   2af0ec317dc8f99f0620af23ff6c288bb6f49be5
> >> commit: 2af0ec317dc8f99f0620af23ff6c288bb6f49be5 [2/2] mm/sl[au]b: rearrange struct slab fields to allow larger rcu_head
> >> config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220910/202209101614.lMCcS0Zj-lkp@intel.com/config)
> >> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> >> reproduce (this is a W=1 build):
> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?id=2af0ec317dc8f99f0620af23ff6c288bb6f49be5
> >>         git remote add vbabka-slab git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
> >>         git fetch --no-tags vbabka-slab for-6.1/fit_rcu_head
> >>         git checkout 2af0ec317dc8f99f0620af23ff6c288bb6f49be5
> >>         # save the config file
> >>         mkdir build_dir && cp config build_dir/.config
> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> >> 
> >> If you fix the issue, kindly add following tag where applicable
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> 
> >> All errors (new ones prefixed by >>):
> >> 
> >>    In file included from mm/mempool.c:21:
> >> >> mm/slab.h:94:1: error: static_assert failed due to requirement '((__builtin_offsetof(struct slab, counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct slab, counters), 16)"
> >>    static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
> >>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>    include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
> >>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> >>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>    include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
> >>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
> >>                                            ^              ~~~~
> >>    1 error generated.
> >> 
> >> 
> >> vim +94 mm/slab.h
> >> 
> >>     90	
> >>     91	#undef SLAB_MATCH
> >>     92	static_assert(sizeof(struct slab) <= sizeof(struct page));
> >>     93	#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && defined(CONFIG_SLUB)
> >>   > 94	static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
> >>     95	#endif
> >>     96	
> > 
> > Ah, it should be sizeof(void *) * 2, instead of 16.
> 
> Oops, I kinda assumed CMPXCHG_DOUBLE is 64bit only thing.
> Wonder why bots didn't catch this in the previous push...

Because with previous patch freelist was quad-word aligned (4*4==16 on 32BIT)
So anyway following 16 byte alignment on both 64/32BIT... ;) 

> >> -- 
> >> 0-DAY CI Kernel Test Service
> >> https://01.org/lkp
> >> 
> > 
> 

-- 
Thanks,
Hyeonggon
