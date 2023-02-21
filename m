Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A56FBD
	for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 17:10:34 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id f23so5035555vsa.13
        for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 09:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b6Z7dmeluzCAiXgEQohTxdBXDJvxu0eI/vMtlc7BYzQ=;
        b=PEZyD8AW0uavJc+OwmuKHKTnU/dSX6x9oirBQFAyNkBDFQCzrBeiyYC+lWnpPOrMnl
         xQ9MJPmXSOhB0OF+6YxF4T1UhH29htPE1All5rTN1Y9yumdLuN23x6Vr3OeR3BJ4+GCx
         mxcFbA7lfQRuSMV6EolNsZODky5dETgI5JlxZBevVGabafp4Qir2SkKC/HHFgxq/ftsG
         ikeHv4EUs5LpZu/Q/lBnkw5pnsaWBTiftR9W9ROMHHk1Aj5TW66Tv5pgnj4ot5sKtAut
         5uRrQCPQjQWxf+X63oVWHWyZGfj0bfHwuag4XNY9pbX7ledN+WWlVTWibheZvRa4tzU8
         nubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6Z7dmeluzCAiXgEQohTxdBXDJvxu0eI/vMtlc7BYzQ=;
        b=j7YHKc3+c0ymwVHZ0h41S/a0KHsuFfkLBgqZjxfEoIUnIjHsCUTtHqxVEhfP+/wW5e
         I0dB8dcF4sSWVt8S0CSlu90ZqCgxr+pFjPKwnE07LgW2Sqdwnbo/9i5nMpAkYU2RX81F
         q3Doz1oIH5cBxKaFZeD7T5LhznQH1/p8+ILcgSsnl5g4cTJjm/Gg9E8VuwGzqxJZo3md
         DfIjcVMYWtbVvuacRZF+pXYA2Jjnzo+eSjyGepdBPKitL7Oh21uh80YjaADx0naiud56
         1JVJiGiEKokD5S910zQmKCkg/FdERqIZMgAIT6w6jgjNiP3t6ZA4M9RLtbI2zsIhsAmi
         S57Q==
X-Gm-Message-State: AO0yUKWEPnNR5f3pQBu6weu7nh1fTW1RBci+b6nuxDof8XyGyg5/O8Rd
	X9vauDXlQjT1DD+La5TzNiQ/3iqoikGUEv9ypnorQA==
X-Google-Smtp-Source: AK7set/+2d7/pDH2gBHaBTDsVZHn4cw+WNlqroT0kOhVtkqaUEZMH8N+JmyQ9waxXjg/uhUTXMph1YPwvGuCshiNcYc=
X-Received: by 2002:a67:dc81:0:b0:41b:ed91:4d51 with SMTP id
 g1-20020a67dc81000000b0041bed914d51mr1402409vsk.84.1676999432910; Tue, 21 Feb
 2023 09:10:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230218002819.1486479-14-jthoughton@google.com> <202302190101.aoXrbN26-lkp@intel.com>
In-Reply-To: <202302190101.aoXrbN26-lkp@intel.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 21 Feb 2023 09:09:56 -0800
Message-ID: <CADrL8HXFMW4_7N+p_aLudcpkeR+0Gb4M0YSJyeQ-dPdvUZqZ1Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/46] hugetlb: add hugetlb_hgm_walk and hugetlb_walk_step
To: kernel test robot <lkp@intel.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <songmuchun@bytedance.com>, 
	Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>, 
	David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Mina Almasry <almasrymina@google.com>, "Zach O'Keefe" <zokeefe@google.com>, 
	Manish Mishra <manish.mishra@nutanix.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Yang Shi <shy828301@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Jiaqi Yan <jiaqiyan@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 18, 2023 at 10:08 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi James,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on next-20230217]
> [cannot apply to kvm/queue shuah-kselftest/next shuah-kselftest/fixes arnd-asm-generic/master linus/master kvm/linux-next v6.2-rc8 v6.2-rc7 v6.2-rc6 v6.2-rc8]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/hugetlb-don-t-set-PageUptodate-for-UFFDIO_CONTINUE/20230218-083216
> patch link:    https://lore.kernel.org/r/20230218002819.1486479-14-jthoughton%40google.com
> patch subject: [PATCH v2 13/46] hugetlb: add hugetlb_hgm_walk and hugetlb_walk_step
> config: arm64-randconfig-r005-20230217 (https://download.01.org/0day-ci/archive/20230219/202302190101.aoXrbN26-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/7e55fe945a1b5f042746277050390bdeba9e22d2
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review James-Houghton/hugetlb-don-t-set-PageUptodate-for-UFFDIO_CONTINUE/20230218-083216
>         git checkout 7e55fe945a1b5f042746277050390bdeba9e22d2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302190101.aoXrbN26-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: hugetlb_walk_step
>    >>> referenced by hugetlb.c
>    >>>               mm/hugetlb.o:(__hugetlb_hgm_walk) in archive vmlinux.a
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>

This is fixed by providing a trivial definition of __hugetlb_hgm_walk
when !CONFIG_HUGETLB_HIGH_GRANULARITY_MAPPING. Will be done for v3.
hugetlb_walk_step() is only defined by architectures that support HGM.
