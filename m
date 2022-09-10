Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0FAA40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 08:33:56 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so7480818pja.5
        for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=G8nRJBytFt4zq3CBxkYjt9E6ufCcg2Kq6cvnSglYkwA=;
        b=ISuym4HLS42lUKXyE+Ag8QucwAJPGnmPJXjtEYDepCeBuU7MQyysGbXUsnBvM4995R
         f4wJ7ZvSVwrBGCAvgaBaYAct9haRKc/TdVB4OKbUV1Ia/3/jg7BulSlL8kadiAaXOLQ5
         OTUHEKIFVvY6iZVyXzdGOtmLBySj6f7hXD2TBGuqTJKBiuk3vP54im4NKqxRedV+VsEe
         nzszdBWVnK8pSPR/yh8w13f/yXR6E8BF4OH5HDjorFD36yxsv5X4sUhWPL2cWMuqn00H
         sXHzB4W97DO5PTZjzUeqMogNSOvruyR1CPPhhck62QZYMxXw9ZCygPWWjejit7plcbKE
         fwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=G8nRJBytFt4zq3CBxkYjt9E6ufCcg2Kq6cvnSglYkwA=;
        b=XlS0FfxCjJUYYxx19U5hZ6nnx/CZleuhjM6sVNErJaf4LfgNWKwBXoZR8eEsr41zE5
         QtDKKBDrka6dL5Gl0b+cBLF6VdkZ2bD/y5AERVZQKVJm2E+TMI+gh2jHezDgGAJsQ8gE
         GfA1zfcc+k3Bt+gcD6/BafJjyHo38PbSeU6hy1e0ZbpecPHCbEBVyZ1bF2yaYVXevKTs
         DN6sU0KOQ+vDlIXeBYje3Aquq7sNUhTaZf6XBAoODsbf0eAx9nO5VcsNOHRRKSbN4NE/
         4i6+LwegNbZNkB5KE2rhjPL44eHhP9TGMINj5WODkb8Lyaq+7crBYKQJBBklkwtJe3or
         p/yg==
X-Gm-Message-State: ACgBeo0sAEvdY7V0/pXWSoT5ewqaMJwxyqtz6xtS2Dg5AKVBanvntJoJ
	KFBw+b0cvf4T//MGQMISb+L9mG0BeeQ=
X-Google-Smtp-Source: AA6agR6RTnp/aCbkkO56cvk7JqVSY05q4WxLf/qhN6d/dOcEP2AaT/edmO5IcB25QPHllGMhMfFcqQ==
X-Received: by 2002:a17:90a:318a:b0:1fa:c68c:aa03 with SMTP id j10-20020a17090a318a00b001fac68caa03mr13357169pjb.172.1662798836321;
        Sat, 10 Sep 2022 01:33:56 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id k197-20020a6284ce000000b00540a8074c9dsm1116554pfd.166.2022.09.10.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 01:33:55 -0700 (PDT)
Date: Sat, 10 Sep 2022 17:33:51 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-mm@kvack.org
Subject: Re: [vbabka-slab:for-6.1/fit_rcu_head 2/2] mm/slab.h:94:1: error:
 static_assert failed due to requirement '((__builtin_offsetof(struct slab,
 counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct
 slab, counters), 16)"
Message-ID: <YxxL7zWWuWnCtXW4@hyeyoo>
References: <202209101614.lMCcS0Zj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209101614.lMCcS0Zj-lkp@intel.com>

On Sat, Sep 10, 2022 at 04:05:44PM +0800, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-6.1/fit_rcu_head
> head:   2af0ec317dc8f99f0620af23ff6c288bb6f49be5
> commit: 2af0ec317dc8f99f0620af23ff6c288bb6f49be5 [2/2] mm/sl[au]b: rearrange struct slab fields to allow larger rcu_head
> config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220910/202209101614.lMCcS0Zj-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?id=2af0ec317dc8f99f0620af23ff6c288bb6f49be5
>         git remote add vbabka-slab git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
>         git fetch --no-tags vbabka-slab for-6.1/fit_rcu_head
>         git checkout 2af0ec317dc8f99f0620af23ff6c288bb6f49be5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from mm/mempool.c:21:
> >> mm/slab.h:94:1: error: static_assert failed due to requirement '((__builtin_offsetof(struct slab, counters)) & ((unsigned int)(16) - 1)) == 0' "IS_ALIGNED(offsetof(struct slab, counters), 16)"
>    static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
>    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
>    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>                                            ^              ~~~~
>    1 error generated.
> 
> 
> vim +94 mm/slab.h
> 
>     90	
>     91	#undef SLAB_MATCH
>     92	static_assert(sizeof(struct slab) <= sizeof(struct page));
>     93	#if defined(CONFIG_HAVE_CMPXCHG_DOUBLE) && defined(CONFIG_SLUB)
>   > 94	static_assert(IS_ALIGNED(offsetof(struct slab, counters), 16));
>     95	#endif
>     96	

Ah, it should be sizeof(void *) * 2, instead of 16.

> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 

-- 
Thanks,
Hyeonggon
