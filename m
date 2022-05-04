Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A2033E0
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 21:47:20 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id s27so3361247ljd.2
        for <llvm@lists.linux.dev>; Wed, 04 May 2022 14:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKVtqb3idxV0MFCntjnRcrvGXkta1j74VgEFUKmbJLM=;
        b=V9NyllOnzZ81jKCOqp3lk8SWrXip/qCxXulz4ko6KO+SwIAl6KNgiHu7mi4iTkI6RC
         kWb5wvPZ7yqaKSMkp+rK1uzuZNdg60isH/lejdnwswtU6h63Vm4IznQ2LOBqRTupKQ30
         ATGrqf0T0pFSV+iw0ZyecGMzgrDInrwtSL54qz7F/gM98oIyjYeQJm7JhYRNaDQ3e9oT
         DzhbkusiEZ7ultpStJQg9mCdOTvh4pqPP1lcSajczNBYHPTXqu9D7vq2LRzwpCXbsGkh
         zzMNtPnyc3TU6e0W1MRefJCdsx/+lQes56guH7Ql8wxlDgTIojZzC68K6MBK3wKIcjth
         ZZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKVtqb3idxV0MFCntjnRcrvGXkta1j74VgEFUKmbJLM=;
        b=YcSgLXw7tWQyGN3OF8dUd/EfGQ+MMABdtpuliNv6NAZA7ppmIQwrIx0nwhMPmpnbPk
         NHGoz1XltccjwjGK/Lrt6O8cMjoeH1nXUU8vDKlXc/FjyRISZORmKkLZL8WophWfJ96t
         yamYZNUlKotlJ8JRe0cSW4EpHx6L/PCki7VX3lxYyoLDnQYKOYbhTabbA/PrGajw4uxt
         2vtDsbN0uW8ImPrK0aqr4BSk3ugMr8UToi0T8Fjeo/Yhf03LmHdYlv/ZoZ9RttpSK5A9
         gNoONDgbHaWs1BS3fY2u+Bg6KXPzmSNOgjERpKiDe4lxt73hLMM5G1j5naZa91ez7Sn8
         1Bjg==
X-Gm-Message-State: AOAM5338N41+183bg7bkINLNgLk024HimsMF7gLoPXKF73A65YLr1ZSI
	K51Zs14TcKmNI+SeywCjPxPFY5rRxEWIaWx50259tw==
X-Google-Smtp-Source: ABdhPJw/slvizdLoXcaKXvjtwt46WXwD2W8A/HsnsT6MToET0d4XHzko6PDn4BdWfQylWN6B8Mo+XAkrj8T654mHF5M=
X-Received: by 2002:a05:651c:1502:b0:250:2328:d127 with SMTP id
 e2-20020a05651c150200b002502328d127mr9743926ljf.183.1651700838720; Wed, 04
 May 2022 14:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220502181714.3483177-9-zokeefe@google.com> <202205031501.6qBJrsPn-lkp@intel.com>
In-Reply-To: <202205031501.6qBJrsPn-lkp@intel.com>
From: "Zach O'Keefe" <zokeefe@google.com>
Date: Wed, 4 May 2022 14:46:42 -0700
Message-ID: <CAAa6QmSdj5j4fdsANkUKtM5OLaRQ_By0ose=7n_H-=RB9b-6+w@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] mm/madvise: introduce MADV_COLLAPSE sync
 hugepage collapse
To: kernel test robot <lkp@intel.com>
Cc: Alex Shi <alex.shi@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, 
	David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Peter Xu <peterx@redhat.com>, SeongJae Park <sj@kernel.org>, Song Liu <songliubraving@fb.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Axel Rasmussen <axelrasmussen@google.com>, 
	Chris Kennelly <ckennelly@google.com>, Chris Zankel <chris@zankel.net>, Helge Deller <deller@gmx.de>, 
	Hugh Dickins <hughd@google.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jens Axboe <axboe@kernel.dk>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sorry again - fixed in v5

On Tue, May 3, 2022 at 12:22 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Zach,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on next-20220502]
> [cannot apply to hnaz-mm/master rostedt-trace/for-next deller-parisc/for-next arnd-asm-generic/master linus/master v5.18-rc5 v5.18-rc4 v5.18-rc3 v5.18-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-khugepaged-record-SCAN_PMD_MAPPED-when-scan_pmd-finds-THP/20220503-031727
> base:    9f9b9a2972eb8dcaad09d826c5c6d7488eaca3e6
> config: x86_64-randconfig-a011-20220502 (https://download.01.org/0day-ci/archive/20220503/202205031501.6qBJrsPn-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/9f69946c58d8d53c271a4d75ac477b4a5164a511
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Zach-O-Keefe/mm-khugepaged-record-SCAN_PMD_MAPPED-when-scan_pmd-finds-THP/20220503-031727
>         git checkout 9f69946c58d8d53c271a4d75ac477b4a5164a511
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    mm/khugepaged.c:1105:29: warning: incompatible integer to pointer conversion passing 'gfp_t' (aka 'unsigned int') to parameter of type 'struct page **' [-Wint-conversion]
>            if (!khugepaged_alloc_page(gfp, node, cc))
>                                       ^~~
>    mm/khugepaged.c:963:49: note: passing argument to parameter 'hpage' here
>    static bool khugepaged_alloc_page(struct page **hpage, gfp_t gfp, int node)
>                                                    ^
>    mm/khugepaged.c:1105:40: warning: incompatible pointer to integer conversion passing 'struct collapse_control *' to parameter of type 'int' [-Wint-conversion]
>            if (!khugepaged_alloc_page(gfp, node, cc))
>                                                  ^~
>    mm/khugepaged.c:963:71: note: passing argument to parameter 'node' here
>    static bool khugepaged_alloc_page(struct page **hpage, gfp_t gfp, int node)
>                                                                          ^
> >> mm/khugepaged.c:2565:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>                    case SCAN_PMD_NULL:
>                    ^
>    mm/khugepaged.c:2565:3: note: insert 'break;' to avoid fall-through
>                    case SCAN_PMD_NULL:
>                    ^
>                    break;
>    3 warnings generated.
>
>
> vim +2565 mm/khugepaged.c
>
>   2511
>   2512  int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
>   2513                       unsigned long start, unsigned long end)
>   2514  {
>   2515          struct collapse_control cc = {
>   2516                  .enforce_pte_scan_limits = false,
>   2517                  .enforce_young = false,
>   2518                  .last_target_node = NUMA_NO_NODE,
>   2519                  .hpage = NULL,
>   2520                  .alloc_charge_hpage = &madvise_alloc_charge_hpage,
>   2521          };
>   2522          struct mm_struct *mm = vma->vm_mm;
>   2523          unsigned long hstart, hend, addr;
>   2524          int thps = 0, nr_hpages = 0, result = SCAN_FAIL;
>   2525          bool mmap_locked = true;
>   2526
>   2527          BUG_ON(vma->vm_start > start);
>   2528          BUG_ON(vma->vm_end < end);
>   2529
>   2530          *prev = vma;
>   2531
>   2532          if (IS_ENABLED(CONFIG_SHMEM) && vma->vm_file)
>   2533                  return -EINVAL;
>   2534
>   2535          hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
>   2536          hend = end & HPAGE_PMD_MASK;
>   2537          nr_hpages = (hend - hstart) >> HPAGE_PMD_SHIFT;
>   2538
>   2539          if (hstart >= hend || !transparent_hugepage_active(vma))
>   2540                  return -EINVAL;
>   2541
>   2542          mmgrab(mm);
>   2543          lru_add_drain();
>   2544
>   2545          for (addr = hstart; ; ) {
>   2546                  mmap_assert_locked(mm);
>   2547                  cond_resched();
>   2548                  result = SCAN_FAIL;
>   2549
>   2550                  if (unlikely(khugepaged_test_exit(mm))) {
>   2551                          result = SCAN_ANY_PROCESS;
>   2552                          break;
>   2553                  }
>   2554
>   2555                  memset(cc.node_load, 0, sizeof(cc.node_load));
>   2556                  result = khugepaged_scan_pmd(mm, vma, addr, &mmap_locked, &cc);
>   2557                  if (!mmap_locked)
>   2558                          *prev = NULL;  /* tell madvise we dropped mmap_lock */
>   2559
>   2560                  switch (result) {
>   2561                  /* Whitelisted set of results where continuing OK */
>   2562                  case SCAN_SUCCEED:
>   2563                  case SCAN_PMD_MAPPED:
>   2564                          ++thps;
> > 2565                  case SCAN_PMD_NULL:
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
