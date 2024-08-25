Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175E370;
	Sun, 25 Aug 2024 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724544398; cv=none; b=Jlwlj2grPCaFelk+MEoL7N22CGKhQ4pG6ttET/xgaJ25tl6tHLKqu4RhN70gEo3NPQcWRmSRWSG1jM8Q6IPX3jnV0rjQqsKgkq/Tcj3ogF7Oxiv0W2YWsrq6HRQw77HipQ0ERpQJufKHHPsVPZoAnX96qxWkIepiyVK2VUv7Kbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724544398; c=relaxed/simple;
	bh=s9ZUymRC5N50hCwelOFwDegTY8GnrkT1qUjyrttceIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=guAaVSYkP5Ff/IX2uoLjn4F3iJ/ysgKeE9xqCdAeGnOVTJmHLXjaPUzy+GINO7fZYD0g9YPOgJxu2zKr8AZGIeDmszbeEz0FxYtl+FqsGK5RIUn9DmLF+C2m73bLHhCp+xiseyyLf+t04JRd5FdIqr2CZbq8kyAzPSKPBJBLtCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qw+/s5HW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qw+/s5HW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B39C32781;
	Sun, 25 Aug 2024 00:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724544398;
	bh=s9ZUymRC5N50hCwelOFwDegTY8GnrkT1qUjyrttceIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qw+/s5HWsZk5eRGie+x3BFqiFk/iZXsmlDUMOd7YFj5cCVLMfNKHFW4Go+GZg/+ni
	 XlWk5yJ0AdkiGpR3bD6wazE/bY916z9mJS88G4JSSJGZl8xvCJ9BGpjj/Kgcu8V746
	 N3eVxc6FHwaa9PtB7k2r6Tvfdb/mIq04ppnZfmzjjdvvCxZTUk0IRncg+MeVgghyaL
	 89PNUJ7rDxW+0fgHXVLkYa0pqSROjyYsFkj4VVcq92lvabgZFm8Tz0aDBcIPE06hn+
	 Ns27HYjmpKUpb7a2/Yhl1T0zpZiI1Xe1tKdMojloGlLtaRe50w1FyywWA6d+2X9aDt
	 9ahxbRyfkLr8w==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 357/379] mm/vma.h:114:19: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
Date: Sat, 24 Aug 2024 17:05:10 -0700
Message-Id: <20240825000510.136384-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <da1a6b2c-f792-432f-b99f-51717dcc8d83@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Sat, 24 Aug 2024 20:43:25 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Sat, Aug 24, 2024 at 11:14:17PM GMT, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   b659edec079c90012cf8d05624e312d1062b8b87
> > commit: ca39aca8db2d78ff82356defba75d14ce78a67b9 [357/379] mm/vma: track start and end for munmap in vma_munmap_struct
> > config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240824/202408242348.uGvgH9tt-lkp@intel.com/config)
> > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242348.uGvgH9tt-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408242348.uGvgH9tt-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from mm/filemap.c:15:
> >    In file included from include/linux/dax.h:6:
> >    In file included from include/linux/mm.h:2198:
> >    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
> >          |                               ~~~~~~~~~~~ ^ ~~~
> >    In file included from mm/filemap.c:52:
> >    In file included from mm/internal.h:13:
> >    include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >       47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
> >          |                                    ~~~~~~~~~~~ ^ ~~~
> >    include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
> >       49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
> >          |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
> >    In file included from mm/filemap.c:52:
> >    In file included from mm/internal.h:22:
> > >> mm/vma.h:114:19: error: use of undeclared identifier 'USER_PGTABLES_CEILING'
> >      114 |         vms->unmap_end = USER_PGTABLES_CEILING;
> >          |                          ^
> >    3 warnings and 1 error generated.
> 
> [snip]
> 
> Thanks for the report!
> 
> This is a trivial issue, and can be fixed with the attached fix-patch. This also
> resolves the issue reported in
> https://lore.kernel.org/oe-kbuild-all/202408242304.1A1fXTgE-lkp@intel.com/
> 
> ----8<----
> From 565ad376b0a3aa5822ef479faadff271e90ba51c Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Sat, 24 Aug 2024 20:20:17 +0100
> Subject: [PATCH] mm: include linux/pgtable.h in vma_internal.h
> 
> For some arches this is required in order to have access to
> USER_PGTABLES_CEILING and FIRST_USER_ADDRESS.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408242348.uGvgH9tt-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202408242304.1A1fXTgE-lkp@intel.com/
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/vma_internal.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/vma_internal.h b/mm/vma_internal.h
> index b930ab12a587..971b13e880c9 100644
> --- a/mm/vma_internal.h
> +++ b/mm/vma_internal.h
> @@ -33,6 +33,7 @@
>  #include <linux/mutex.h>
>  #include <linux/pagemap.h>
>  #include <linux/pfn.h>
> +#include <linux/pgtable.h>
>  #include <linux/rcupdate.h>
>  #include <linux/rmap.h>
>  #include <linux/rwsem.h>
> --
> 2.46.0

Even after applying the above patch, I get similar errors when CONFIG_MMU is
unset[1], as below.  Maybe the case should also be handled?

    In file included from /lib/../mm/internal.h:22:0,
                     from /lib/vsprintf.c:50:
    /lib/../mm/vma.h: In function 'init_vma_munmap':
    /lib/../mm/vma.h:113:21: error: 'FIRST_USER_ADDRESS' undeclared (first use in this function); did you mean 'IFLA_PERM_ADDRESS'?
      vms->unmap_start = FIRST_USER_ADDRESS;
                         ^~~~~~~~~~~~~~~~~~
                         IFLA_PERM_ADDRESS
    /lib/../mm/vma.h:113:21: note: each undeclared identifier is reported only once for each function it appears in
    /lib/../mm/vma.h:114:19: error: 'USER_PGTABLES_CEILING' undeclared (first use in this function)
      vms->unmap_end = USER_PGTABLES_CEILING;
                       ^~~~~~~~~~~~~~~~~~~~~


[1] https://github.com/damonitor/damon-tests/blob/master/corr/tests/build_m68k.sh


Thanks,
SJ
