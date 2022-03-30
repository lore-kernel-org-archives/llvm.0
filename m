Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C0E2F46
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 22:14:04 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id f23so8733502ybj.7
        for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 15:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ohUWdk6Jv4uJ7zckc+ZPE6o/UzyPHrqVidE3nB9Y/io=;
        b=PogmDeYUl/eypsEXkLeet0WhRAoDMh6f38F2N76vij2zPAC8y90JL9MU4vcDEV9LjF
         7ih2jUnRHHnGY3igDrZvZNMIQb6ywhQZO8ImF9am0UByH4BY+qudLWX6eBGZXg2bds1f
         fSsvgqRHXHIa61wLRKQXVypCg7kUehZBDuoiRiutFmRQDkqlPty5aYaam5L+NKkLWSYx
         Fu3345HdTsFJwz/LN3pO76LHXodqtrj0+ZNF9ss24Z+pcaLebrXVVZxaSBuMXYNdO9cL
         BLeMQoXdPFjyGDPMlCXLQrlMWX4t8q7xcvfuAOox++5c/0xdx9gv+1KfFdQuXhb54SCd
         L8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ohUWdk6Jv4uJ7zckc+ZPE6o/UzyPHrqVidE3nB9Y/io=;
        b=Z5lZUr83lvlK0+iUr9S8vuTMt8K3t5/jhwJ5BEqL/W5/s5PhUefRLnUDcdpgJ8NddV
         xtROl60V3t3qXuBtvTzQQ3CsvYiMh7lfUfhS/oCnDS6BUpxuSNuyl50ZxVJ7kYtJrYhq
         +r+DCuMsU8pS4KQvEvjKaQ7s6EQAc5CeK55qa/8k4Y/snTvC0WhFK62HOrSs8tLrQlUd
         rc1LcTGKFOy/LsRh7w1B5+g5FD1SnAO5AzrlZ26vFEuPbc9PexvD/i1efezT+/RNRiMw
         U9s2R64zGYsroBNGssmPDl/h20epc1NDtyrHKJrjh+CmO7OY+hD/nfmSdhfMLNBfGN3/
         SeaA==
X-Gm-Message-State: AOAM533DPGHEgUEbe8iXSnxBmm17jUi/LyWhD7Mnf/beHIECms6Azv+q
	bAvjBQoLlHKPiX8IhXznVbK+sa3N6wUw+CPPv69ZVQ==
X-Google-Smtp-Source: ABdhPJyF7b99kJY78kD00gUjvcpr8Yge4gTbtMxUjw2qC+5vXXsI2OytH/lZhWGiymk5czKjtKawMEb+KwlUc7JzHks=
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr1766360ybs.543.1648678443446; Wed, 30
 Mar 2022 15:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203301416.uykWxBeR-lkp@intel.com>
In-Reply-To: <202203301416.uykWxBeR-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 30 Mar 2022 15:13:52 -0700
Message-ID: <CAJuCfpG_em1O+11oE0fC4htmKd11ygT_phF5hOjbyfxw68Xq1A@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 5835/5872] mm/compaction.c:766:15: error: redefinition of 'isolate_and_split_free_page'
To: kernel test robot <lkp@intel.com>
Cc: Charan Teja Reddy <charante@codeaurora.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 29, 2022 at 11:32 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-trusty-5.10
> head:   07055bfd3d810d41a38354693dfaa55a6f8c0025
> commit: 8cd9aa93b7269460e8d5e4407738f21fe5d6e720 [5835/5872] ANDROID: implement wrapper for reverse migration
> config: arm64-randconfig-r036-20220327 (https://download.01.org/0day-ci/archive/20220330/202203301416.uykWxBeR-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/ammarfaizi2/linux-block/commit/8cd9aa93b7269460e8d5e4407738f21fe5d6e720
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
>         git checkout 8cd9aa93b7269460e8d5e4407738f21fe5d6e720
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> mm/compaction.c:766:15: error: redefinition of 'isolate_and_split_free_page'
>    unsigned long isolate_and_split_free_page(struct page *page,
>                  ^
>    include/linux/compaction.h:241:22: note: previous definition is here
>    static unsigned long isolate_and_split_free_page(struct page *page,
>                         ^
>    1 error generated.
>

This issue has been fixed by
https://android-review.googlesource.com/c/kernel/common/+/1685698


>
> vim +/isolate_and_split_free_page +766 mm/compaction.c
>
>    765
>  > 766  unsigned long isolate_and_split_free_page(struct page *page,
>    767                                                  struct list_head *list)
>    768  {
>    769          unsigned long isolated;
>    770          unsigned int order;
>    771
>    772          if (!PageBuddy(page))
>    773                  return 0;
>    774
>    775          order = buddy_order(page);
>    776          isolated = __isolate_free_page(page, order);
>    777          if (!isolated)
>    778                  return 0;
>    779
>    780          set_page_private(page, order);
>    781          list_add(&page->lru, list);
>    782
>    783          split_map_pages(list);
>    784
>    785          return isolated;
>    786  }
>    787  EXPORT_SYMBOL_GPL(isolate_and_split_free_page);
>    788
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
