Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A571865
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 17:19:36 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id y32so27869091lfa.6
        for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 10:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sZJ+MNwAciw6Za81vh0kJtEffYGodA8iLGsoa2KZf08=;
        b=LzcU0aZv/6CDhFiflC924+Jc7H2aim9M6dUW6jucnwaxEubJLgwAdAmCTGeYZ9skSY
         y8RmWRedLJl0I0Nl8/0tZCollZRF5rebiuu0CXC0YwwhSyGIL4Ty5VkIqs4mHEBllQl/
         hVFZ0i5MhkrAEoZLSr9w5DVxdzKVy4PtHtFI0AZHxtlL/doaEV7/Bc/rChocZlSfFWq6
         R8SUbN+PB21+JQI0DvhgzrpZBgen8qjFo99e8I+Xy3/FsP23my0D/g9PKjLwKsBN7ZZt
         AHhU7yJP62sFnJ2ypYzcZJcgKiCEEmiGhBMjfIG+rSYQdJpiGquEbcnXFa2x0a3iACrO
         ai/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sZJ+MNwAciw6Za81vh0kJtEffYGodA8iLGsoa2KZf08=;
        b=bf1mEyHucaz/cG8wbud/MkmOK4WwszZT+E6dTrDIHTj+Lw03oHmN7kHINvM8Eiqy+S
         FT0X2/2E7oSA9BzH8B8nIQ6GTSqUYX3pbDNDDzlq6LWREYMCPaFqbHhfvM5hvDDqw2EA
         Fqnj91Ih8EZT87FCM+3XHxgoq6p7F8MGx03vn7/5uS0H2HyDcr5uAM2AiJeis3SxPRVA
         KoaFg02UZ+Wi4EFzdZtybhCfN+lv5IhHPmHsxfFBnmbMbNvjHEqx+6r0SXhgGDFxJsbc
         TE3aI+MhtA+if4oevlL5MRVBBMegIben3M2FPJEOAzMqIw49XW8fserAQQE6Jll60Dh6
         45Cw==
X-Gm-Message-State: AOAM531HEqy6OWrkDIWRwh9uzPPWOlsTygKHwO95bdi1Bo2sheig6RRH
	qNbyk7mJP0cgC66rp0Gc/xVfMsv5xXXD2evagZn01g==
X-Google-Smtp-Source: ABdhPJwNLkuKfff3xs6R27TRX6B0kuh9UF9QoMlqqC0hFOjeTCYS2TPGwxbEtngHsIvPyBnWOZlR3/62WxOj9E84QhE=
X-Received: by 2002:a19:6d1b:0:b0:46b:94a8:da55 with SMTP id
 i27-20020a196d1b000000b0046b94a8da55mr8067188lfc.354.1649697574293; Mon, 11
 Apr 2022 10:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220410135445.3897054-6-zokeefe@google.com> <202204110059.a0PLTrVC-lkp@intel.com>
In-Reply-To: <202204110059.a0PLTrVC-lkp@intel.com>
From: "Zach O'Keefe" <zokeefe@google.com>
Date: Mon, 11 Apr 2022 12:18:56 -0500
Message-ID: <CAAa6QmS6Em31OT5n4GtBNEvoss5DmL3crfMAe0ho_Ceaw0_EbA@mail.gmail.com>
Subject: Re: [PATCH 05/12] mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse
To: kernel test robot <lkp@intel.com>
Cc: Alex Shi <alex.shi@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, 
	David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Michal Hocko <mhocko@suse.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	SeongJae Park <sj@kernel.org>, Song Liu <songliubraving@fb.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Andrea Arcangeli <aarcange@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Axel Rasmussen <axelrasmussen@google.com>, 
	Chris Kennelly <ckennelly@google.com>, Chris Zankel <chris@zankel.net>, Helge Deller <deller@gmx.de>, 
	Hugh Dickins <hughd@google.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jens Axboe <axboe@kernel.dk>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Minchan Kim <minchan@kernel.org>, Patrick Xia <patrickx@google.com>
Content-Type: text/plain; charset="UTF-8"

Sorry about this. Will add support for:

alpha
mips
parisc
xtensa

in respective arch/$ARCH/include/uapi/asm/mman.h files

On Sun, Apr 10, 2022 at 11:15 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Zach,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on hnaz-mm/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zach-O-Keefe/mm-userspace-hugepage-collapse/20220410-215722
> base:   https://github.com/hnaz/linux-mm master
> config: mips-randconfig-r002-20220410 (https://download.01.org/0day-ci/archive/20220411/202204110059.a0PLTrVC-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/4f4775a3e4a722525787b2c309032810356473c2
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Zach-O-Keefe/mm-userspace-hugepage-collapse/20220410-215722
>         git checkout 4f4775a3e4a722525787b2c309032810356473c2
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> mm/madvise.c:62:7: error: use of undeclared identifier 'MADV_COLLAPSE'
>            case MADV_COLLAPSE:
>                 ^
>    mm/madvise.c:1055:7: error: use of undeclared identifier 'MADV_COLLAPSE'
>            case MADV_COLLAPSE:
>                 ^
>    2 errors generated.
>
>
> vim +/MADV_COLLAPSE +62 mm/madvise.c
>
>     44
>     45  /*
>     46   * Any behaviour which results in changes to the vma->vm_flags needs to
>     47   * take mmap_lock for writing. Others, which simply traverse vmas, need
>     48   * to only take it for reading.
>     49   */
>     50  static int madvise_need_mmap_write(int behavior)
>     51  {
>     52          switch (behavior) {
>     53          case MADV_REMOVE:
>     54          case MADV_WILLNEED:
>     55          case MADV_DONTNEED:
>     56          case MADV_DONTNEED_LOCKED:
>     57          case MADV_COLD:
>     58          case MADV_PAGEOUT:
>     59          case MADV_FREE:
>     60          case MADV_POPULATE_READ:
>     61          case MADV_POPULATE_WRITE:
>   > 62          case MADV_COLLAPSE:
>     63                  return 0;
>     64          default:
>     65                  /* be safe, default to 1. list exceptions explicitly */
>     66                  return 1;
>     67          }
>     68  }
>     69
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>
