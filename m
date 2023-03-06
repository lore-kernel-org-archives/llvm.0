Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FCB7473
	for <llvm@lists.linux.dev>; Mon,  6 Mar 2023 21:21:01 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-53d277c1834so32871917b3.10
        for <llvm@lists.linux.dev>; Mon, 06 Mar 2023 13:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678137661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MlFoCw6xpA0Yeby89LIgDkf8kuvi2LcT1q/KHBhZkHE=;
        b=ZAYGVpf4D1O7GRwovywxggvXk4OTQux+ihm0c4TZnUFOxyFzEaDZxCK+tmXjONOHLY
         46srJT4m3azvZq2LwjFT8bzyF3T+6tEdMtxi6mK7N9MCygeyu3GQrg+BOFIeCDj0m4wn
         7WCzRUQTy9pXr4OXpgZvblnFRTVpBO3Q4UvkWHR3VXw8LUinHFjPMhPok+UGQfgvq160
         uNbg8AWqz/PHG1s4uVuWdjEQSwuAPEdqs//j7V74bnNB01xikMWN3QIoJfPoNs0d41E1
         FZ9FkL8o6obDwETESNPhFN/hcomIMomaCGMGhTo2uyChsM7+yWuBcGBGg7MsaRRTmKIb
         2O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678137661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlFoCw6xpA0Yeby89LIgDkf8kuvi2LcT1q/KHBhZkHE=;
        b=r4rCivhnpzoHtF9ibaXRu7O4k22FsNVlg23dazCHzEICHiB9Krarn+z8iY1mD6w8p2
         Na4G9IdIAeWvSF+Uee1BEwSC7ZVrHKE5txntmXdF21+uluL5dU8++bfn04+hCp7HfEtK
         c/++aMyOSPqnfguNdrg0PraETiytAtbveqCtp33/rhX7beWxFb1lv3kkGooVAAjf05KR
         +tAsD4402JvGTCNKSkoesdOqFYcSpcloNn6UFiUiWhZ5ZBAP9WviFJu0nEcC1+F1q91f
         XJJW0GuI5Nfv+3x5jmV6CcI+YtyvtjtG4h0ZOAXEN7wgocbEiyCuuKWiZET6gRjb6tba
         0owg==
X-Gm-Message-State: AO0yUKXyVU1PlwDPr3RgT/jZ/D1ShQAekn+lduogIS3CbCrc0JfS4Mdq
	hI4P/Op0CHejc2KIgsVomQfoHXSUYwngxS7tTfDSgrk5z4uIK5AIwQIghA==
X-Google-Smtp-Source: AK7set8ofd+6ONuaIc6zMLtRnSoWn9F/B9bm33wE0NnwAyC+uRV+RW7oVrp1DA0xc1b+PQnc5E+r6lwTyxSHemojGws=
X-Received: by 2002:a81:a9c8:0:b0:533:9c5b:7278 with SMTP id
 g191-20020a81a9c8000000b005339c5b7278mr7452335ywh.0.1678137660650; Mon, 06
 Mar 2023 13:21:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303041807.a3nYQrom-lkp@intel.com>
In-Reply-To: <202303041807.a3nYQrom-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 6 Mar 2023 13:20:49 -0800
Message-ID: <CAJuCfpHfEsJursUkDZ97YzPB_nVKs9YEZUdvGoii7Yk=TysO9w@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 83/143] mm/khugepaged.c:1704:9: error: call
 to undeclared function 'vma_try_start_write'; ISO C99 and later do not
 support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 4, 2023 at 2:27 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   df3ae4347aff9be1e9763ffa3b1015fca348bfbd
> commit: 92e3612279f925881e96dcc89acfb6bf96a2bb2a [83/143] mm/khugepaged: fix vm_lock/i_mmap_rwsem inversion in retract_page_tables
> config: riscv-randconfig-r004-20230303 (https://download.01.org/0day-ci/archive/20230304/202303041807.a3nYQrom-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=92e3612279f925881e96dcc89acfb6bf96a2bb2a
>         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>         git fetch --no-tags akpm-mm mm-unstable
>         git checkout 92e3612279f925881e96dcc89acfb6bf96a2bb2a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303041807.a3nYQrom-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/khugepaged.c:1704:9: error: call to undeclared function 'vma_try_start_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                            if (!vma_try_start_write(vma))
>                                 ^
>    mm/khugepaged.c:1704:9: note: did you mean 'vma_start_write'?
>    include/linux/mm.h:719:20: note: 'vma_start_write' declared here
>    static inline void vma_start_write(struct vm_area_struct *vma) {}
>                       ^
>    1 error generated.

Should be fixed once
https://lore.kernel.org/all/20230304232856.DD36BC433D2@smtp.kernel.org/
change is merged.

>
>
> vim +/vma_try_start_write +1704 mm/khugepaged.c
>
>   1641
>   1642  static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
>   1643                                 struct mm_struct *target_mm,
>   1644                                 unsigned long target_addr, struct page *hpage,
>   1645                                 struct collapse_control *cc)
>   1646  {
>   1647          struct vm_area_struct *vma;
>   1648          int target_result = SCAN_FAIL;
>   1649
>   1650          i_mmap_lock_write(mapping);
>   1651          vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
>   1652                  int result = SCAN_FAIL;
>   1653                  struct mm_struct *mm = NULL;
>   1654                  unsigned long addr = 0;
>   1655                  pmd_t *pmd;
>   1656                  bool is_target = false;
>   1657
>   1658                  /*
>   1659                   * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
>   1660                   * got written to. These VMAs are likely not worth investing
>   1661                   * mmap_write_lock(mm) as PMD-mapping is likely to be split
>   1662                   * later.
>   1663                   *
>   1664                   * Note that vma->anon_vma check is racy: it can be set up after
>   1665                   * the check but before we took mmap_lock by the fault path.
>   1666                   * But page lock would prevent establishing any new ptes of the
>   1667                   * page, so we are safe.
>   1668                   *
>   1669                   * An alternative would be drop the check, but check that page
>   1670                   * table is clear before calling pmdp_collapse_flush() under
>   1671                   * ptl. It has higher chance to recover THP for the VMA, but
>   1672                   * has higher cost too. It would also probably require locking
>   1673                   * the anon_vma.
>   1674                   */
>   1675                  if (READ_ONCE(vma->anon_vma)) {
>   1676                          result = SCAN_PAGE_ANON;
>   1677                          goto next;
>   1678                  }
>   1679                  addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
>   1680                  if (addr & ~HPAGE_PMD_MASK ||
>   1681                      vma->vm_end < addr + HPAGE_PMD_SIZE) {
>   1682                          result = SCAN_VMA_CHECK;
>   1683                          goto next;
>   1684                  }
>   1685                  mm = vma->vm_mm;
>   1686                  is_target = mm == target_mm && addr == target_addr;
>   1687                  result = find_pmd_or_thp_or_none(mm, addr, &pmd);
>   1688                  if (result != SCAN_SUCCEED)
>   1689                          goto next;
>   1690                  /*
>   1691                   * We need exclusive mmap_lock to retract page table.
>   1692                   *
>   1693                   * We use trylock due to lock inversion: we need to acquire
>   1694                   * mmap_lock while holding page lock. Fault path does it in
>   1695                   * reverse order. Trylock is a way to avoid deadlock.
>   1696                   *
>   1697                   * Also, it's not MADV_COLLAPSE's job to collapse other
>   1698                   * mappings - let khugepaged take care of them later.
>   1699                   */
>   1700                  result = SCAN_PTE_MAPPED_HUGEPAGE;
>   1701                  if ((cc->is_khugepaged || is_target) &&
>   1702                      mmap_write_trylock(mm)) {
>   1703                          /* trylock for the same lock inversion as above */
> > 1704                          if (!vma_try_start_write(vma))
>   1705                                  goto unlock_next;
>   1706
>   1707                          /*
>   1708                           * Re-check whether we have an ->anon_vma, because
>   1709                           * collapse_and_free_pmd() requires that either no
>   1710                           * ->anon_vma exists or the anon_vma is locked.
>   1711                           * We already checked ->anon_vma above, but that check
>   1712                           * is racy because ->anon_vma can be populated under the
>   1713                           * mmap lock in read mode.
>   1714                           */
>   1715                          if (vma->anon_vma) {
>   1716                                  result = SCAN_PAGE_ANON;
>   1717                                  goto unlock_next;
>   1718                          }
>   1719                          /*
>   1720                           * When a vma is registered with uffd-wp, we can't
>   1721                           * recycle the pmd pgtable because there can be pte
>   1722                           * markers installed.  Skip it only, so the rest mm/vma
>   1723                           * can still have the same file mapped hugely, however
>   1724                           * it'll always mapped in small page size for uffd-wp
>   1725                           * registered ranges.
>   1726                           */
>   1727                          if (hpage_collapse_test_exit(mm)) {
>   1728                                  result = SCAN_ANY_PROCESS;
>   1729                                  goto unlock_next;
>   1730                          }
>   1731                          if (userfaultfd_wp(vma)) {
>   1732                                  result = SCAN_PTE_UFFD_WP;
>   1733                                  goto unlock_next;
>   1734                          }
>   1735                          collapse_and_free_pmd(mm, vma, addr, pmd);
>   1736                          if (!cc->is_khugepaged && is_target)
>   1737                                  result = set_huge_pmd(vma, addr, pmd, hpage);
>   1738                          else
>   1739                                  result = SCAN_SUCCEED;
>   1740
>   1741  unlock_next:
>   1742                          mmap_write_unlock(mm);
>   1743                          goto next;
>   1744                  }
>   1745                  /*
>   1746                   * Calling context will handle target mm/addr. Otherwise, let
>   1747                   * khugepaged try again later.
>   1748                   */
>   1749                  if (!is_target) {
>   1750                          khugepaged_add_pte_mapped_thp(mm, addr);
>   1751                          continue;
>   1752                  }
>   1753  next:
>   1754                  if (is_target)
>   1755                          target_result = result;
>   1756          }
>   1757          i_mmap_unlock_write(mapping);
>   1758          return target_result;
>   1759  }
>   1760
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
