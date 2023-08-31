Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1919D125CB
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 16:40:44 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a5e37a39ecso112641166b.3
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693500043; x=1694104843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drcv5mKJ9RhO4L7vLkvVuevPSBYeBJBAmcU4Oua4F00=;
        b=kJC2OdlDUiLj41uzmETx/d5sATDNSIYPE+AOqdpjiLfaCPl7J225X6msfC1sGuhme2
         7SioRcl2teMwjsjSiB5kVW09eetl2Tp/MrPDLT9soOaDZ2+LsdFQxmORHZon5mLCEhBW
         GugBJR+UIy2YHp/OSv41n6Oah9a9tA5CmzHZIVgILCzYvueAUHMhv+csTczzBbWEDPVE
         zYovhEZbyd3Nv7vwusv/pgZVnbT54sMa7WlptHZguhcR1Hq/tiExirlfK6WAeagRYM7c
         Yfywtgy5x3JUhPbsancSgK7byas9FfYyqID2NDy6h+UAwHiOdLHmJQNEiEwhRRsqyrqT
         tOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693500043; x=1694104843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drcv5mKJ9RhO4L7vLkvVuevPSBYeBJBAmcU4Oua4F00=;
        b=W0cCqbNfCILSUvCsFby5xnq5AxMAEGXTDLMKQumoiFr0CvAVd6OSPwF2VATjV8CImE
         xvws3voK/UTvE0op+/rxTPAT3Hzh7m4y2KY3bbV19ec1r5kZ3z1x8WuIavpnz10FagsC
         dyymp/vQ8YR+6A2UYU+JOSiwAyHdtwc66KOss7/gMeGE2hJKDODHk/EMmJr0aeKex0+U
         x757qV8KzdeMIaCePffC4+1+Xvib5uEvisLprtKyWrXZ9Y6TYxcAeTLSqURiyzIRTXRa
         q46UwZW2XY66aywdltGO6vn1m13qsX8qgdunMui46Z0NYuNRRcc4E2ScbpVq8r1phAcZ
         c+bg==
X-Gm-Message-State: AOJu0Ywu2CY+igboik4pBtjaNacm3ZKEyPRwqjJlLMsEhHnCb/hO6xaY
	XISsgf/49Ay0GrYcOTvQSTtWcbT+Dg4gCYd62ZLSng==
X-Google-Smtp-Source: AGHT+IGV24LZs9Ao9Nl3shUgQtSezVqin+bodeBsASR3yYN0F0gmiEmn2HA+jI3wOLaoklU27jzdjhbQxQ19eonVUNw=
X-Received: by 2002:a17:906:8450:b0:9a1:db2e:9dbb with SMTP id
 e16-20020a170906845000b009a1db2e9dbbmr4355097ejy.0.1693500042855; Thu, 31 Aug
 2023 09:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230830175335.1536008-5-yosryahmed@google.com> <202308311025.538QuXBV-lkp@intel.com>
In-Reply-To: <202308311025.538QuXBV-lkp@intel.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 31 Aug 2023 09:40:03 -0700
Message-ID: <CAJD7tkbo28Mc9ydPnqL_gKmi-QZGORE-FVcZcQnsLVTCA1UBzA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: memcg: use non-unified stats flushing for
 userspace reads
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Ivan Babrou <ivan@cloudflare.com>, Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 8:08=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yosry,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master next-20230830]
> [cannot apply to v6.5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-mem=
cg-properly-name-and-document-unified-stats-flushing/20230831-015518
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/20230830175335.1536008-5-yosryah=
med%40google.com
> patch subject: [PATCH v3 4/4] mm: memcg: use non-unified stats flushing f=
or userspace reads
> config: i386-randconfig-r013-20230831 (https://download.01.org/0day-ci/ar=
chive/20230831/202308311025.538QuXBV-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230831/202308311025.538QuXBV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308311025.538QuXBV-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/memcontrol.c:667:6: warning: no previous prototype for function 'me=
m_cgroup_user_flush_stats' [-Wmissing-prototypes]
>    void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
>         ^
>    mm/memcontrol.c:667:1: note: declare 'static' if the function is not i=
ntended to be used outside of this translation unit
>    void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
>    ^
>    static
>    1 warning generated.

Ah silly mistake on my end. Will send v4 after making
mem_cgroup_user_flush_stats() static.

>
>
> vim +/mem_cgroup_user_flush_stats +667 mm/memcontrol.c
>
>    658
>    659  /*
>    660   * mem_cgroup_user_flush_stats - do a stats flush for a user read
>    661   * @memcg: memory cgroup to flush
>    662   *
>    663   * Flush the subtree of @memcg. A mutex is used for userspace rea=
ders to gate
>    664   * the global rstat spinlock. This protects in-kernel flushers fr=
om userspace
>    665   * readers hogging the lock.
>    666   */
>  > 667  void mem_cgroup_user_flush_stats(struct mem_cgroup *memcg)
>    668  {
>    669          mutex_lock(&stats_user_flush_mutex);
>    670          do_stats_flush(memcg);
>    671          mutex_unlock(&stats_user_flush_mutex);
>    672  }
>    673
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
