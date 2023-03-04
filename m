Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCEE2F56
	for <llvm@lists.linux.dev>; Sat,  4 Mar 2023 23:24:28 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id e82so5001562ybh.9
        for <llvm@lists.linux.dev>; Sat, 04 Mar 2023 15:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677972267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0d66i14Puqgk0lU5lePdvOrx7+mF3lc/D8M9Xv0e5xw=;
        b=HJHtxL186AnA4BssQkKYpJzVzgyhTWB+a/3MfJZgnJByxdDNHFJodmAyQQt7POtomj
         xxlUT7VfTRahoamfYRg2KQwP5eMIl4XfrmME+f6GhRkEbIGVaFVLD4QPN189z/0M/7L3
         rLuz2lKEw7IDVDE8PwjVY4kZkyyS2kUDjbIsSP0A6jM+cmSryFRLlwI6bk52iaCm3myd
         Wx2RqG6yRQADPFbR+v9GpAtG0gS89OKg5lZXhpjtRiLfyEEJD7RW26VU1euPBOyX1ttg
         s7sCsY7jRpsF/KlFX++rgYoHzGqDUKwSncMMWvUa9FkJqTnu/S/iHhlMGkBbXQV6YvxA
         zb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677972267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0d66i14Puqgk0lU5lePdvOrx7+mF3lc/D8M9Xv0e5xw=;
        b=2B+WXzjzItduti+M9nh0Uam9JGMep6PoQoMfz6fh5DU54blJMC4AHhTApfTq+t+Au3
         sDEyyY+RXMX0gvyK1jKoDlCH8Vctr8E01GYT6pr7NqSX2av4MdTd45Yc/jkmdFT+3htY
         betggaz+61bOVAq45rvuk1YnpSCUsZ1hCSImymF6FduZKG5PtWjXFS4nUFmCbTf930O6
         AnU0UBNv1MjzOhaTKV8pbA7c0kLP13cZW7XbTLSSduMIgtxniC4kH/guNlwZUWWv25Ut
         hLCJL9z96ZtMPc9XZw5kwcxJgwVrfG0JGRkYCcGq/Vd6QKRyFw1e1HJKNgndqSv0NSdg
         2IIg==
X-Gm-Message-State: AO0yUKU8263TxMT/qEhH6I7bbkpJU40nxJ9ZLdb6Mw35TLzpOcj6Lw44
	RYfxrnqjhzqGCyW5wXn/tp+czOXwrkybnrQhCbYNY75+znZgBlhVZ5NMiA==
X-Google-Smtp-Source: AK7set+HsKU7ocEGLdmmzh1nynodV4i7DC0Yf0U/Lc/jywjCadRg4odvsr07oKkEI4vWxJ8hiXx9IKX/d2gKF1HJbIM=
X-Received: by 2002:a5b:c08:0:b0:9fe:1493:8b8 with SMTP id f8-20020a5b0c08000000b009fe149308b8mr3624642ybq.6.1677972266771;
 Sat, 04 Mar 2023 15:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303213250.3555716-1-surenb@google.com> <202303041842.Cv8cTjlL-lkp@intel.com>
In-Reply-To: <202303041842.Cv8cTjlL-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 4 Mar 2023 15:24:15 -0800
Message-ID: <CAJuCfpFjWhtzRE1X=J+_JjgJzNKhq-=JT8yTBSTHthwp0pqWZw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/khugepaged: fix vm_lock/i_mmap_rwsem inversion in retract_page_tables
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,
I missed vma_try_start_write() definition for CONFIG_PER_VMA_LOCK=n
configuration. Could you please patch this with the following?:

--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -740,6 +740,8 @@ static inline bool vma_start_read(struct
vm_area_struct *vma)
  { return false; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
+static inline bool vma_try_start_write(struct vm_area_struct *vma) {
return true; }
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}

or should I send a separate patch?
Thanks,
Suren.



On Sat, Mar 4, 2023 at 2:57 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Suren,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-khugepaged-fix-vm_lock-i_mmap_rwsem-inversion-in-retract_page_tables/20230304-053401
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20230303213250.3555716-1-surenb%40google.com
> patch subject: [PATCH 1/1] mm/khugepaged: fix vm_lock/i_mmap_rwsem inversion in retract_page_tables
> config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230304/202303041842.Cv8cTjlL-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/338d2ee433a0559b3c6c3966b8d4ffe55e8dc6c9
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Suren-Baghdasaryan/mm-khugepaged-fix-vm_lock-i_mmap_rwsem-inversion-in-retract_page_tables/20230304-053401
>         git checkout 338d2ee433a0559b3c6c3966b8d4ffe55e8dc6c9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303041842.Cv8cTjlL-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/khugepaged.c:1799:9: error: implicit declaration of function 'vma_try_start_write' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                            if (!vma_try_start_write(vma))
>                                 ^
>    mm/khugepaged.c:1799:9: note: did you mean 'vma_start_write'?
>    include/linux/mm.h:742:20: note: 'vma_start_write' declared here
>    static inline void vma_start_write(struct vm_area_struct *vma) {}
>                       ^
>    1 error generated.
>
>
> vim +/vma_try_start_write +1799 mm/khugepaged.c
>
>   1736
>   1737  static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
>   1738                                 struct mm_struct *target_mm,
>   1739                                 unsigned long target_addr, struct page *hpage,
>   1740                                 struct collapse_control *cc)
>   1741  {
>   1742          struct vm_area_struct *vma;
>   1743          int target_result = SCAN_FAIL;
>   1744
>   1745          i_mmap_lock_write(mapping);
>   1746          vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
>   1747                  int result = SCAN_FAIL;
>   1748                  struct mm_struct *mm = NULL;
>   1749                  unsigned long addr = 0;
>   1750                  pmd_t *pmd;
>   1751                  bool is_target = false;
>   1752
>   1753                  /*
>   1754                   * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
>   1755                   * got written to. These VMAs are likely not worth investing
>   1756                   * mmap_write_lock(mm) as PMD-mapping is likely to be split
>   1757                   * later.
>   1758                   *
>   1759                   * Note that vma->anon_vma check is racy: it can be set up after
>   1760                   * the check but before we took mmap_lock by the fault path.
>   1761                   * But page lock would prevent establishing any new ptes of the
>   1762                   * page, so we are safe.
>   1763                   *
>   1764                   * An alternative would be drop the check, but check that page
>   1765                   * table is clear before calling pmdp_collapse_flush() under
>   1766                   * ptl. It has higher chance to recover THP for the VMA, but
>   1767                   * has higher cost too. It would also probably require locking
>   1768                   * the anon_vma.
>   1769                   */
>   1770                  if (READ_ONCE(vma->anon_vma)) {
>   1771                          result = SCAN_PAGE_ANON;
>   1772                          goto next;
>   1773                  }
>   1774                  addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
>   1775                  if (addr & ~HPAGE_PMD_MASK ||
>   1776                      vma->vm_end < addr + HPAGE_PMD_SIZE) {
>   1777                          result = SCAN_VMA_CHECK;
>   1778                          goto next;
>   1779                  }
>   1780                  mm = vma->vm_mm;
>   1781                  is_target = mm == target_mm && addr == target_addr;
>   1782                  result = find_pmd_or_thp_or_none(mm, addr, &pmd);
>   1783                  if (result != SCAN_SUCCEED)
>   1784                          goto next;
>   1785                  /*
>   1786                   * We need exclusive mmap_lock to retract page table.
>   1787                   *
>   1788                   * We use trylock due to lock inversion: we need to acquire
>   1789                   * mmap_lock while holding page lock. Fault path does it in
>   1790                   * reverse order. Trylock is a way to avoid deadlock.
>   1791                   *
>   1792                   * Also, it's not MADV_COLLAPSE's job to collapse other
>   1793                   * mappings - let khugepaged take care of them later.
>   1794                   */
>   1795                  result = SCAN_PTE_MAPPED_HUGEPAGE;
>   1796                  if ((cc->is_khugepaged || is_target) &&
>   1797                      mmap_write_trylock(mm)) {
>   1798                          /* trylock for the same lock inversion as above */
> > 1799                          if (!vma_try_start_write(vma))
>   1800                                  goto unlock_next;
>   1801
>   1802                          /*
>   1803                           * Re-check whether we have an ->anon_vma, because
>   1804                           * collapse_and_free_pmd() requires that either no
>   1805                           * ->anon_vma exists or the anon_vma is locked.
>   1806                           * We already checked ->anon_vma above, but that check
>   1807                           * is racy because ->anon_vma can be populated under the
>   1808                           * mmap lock in read mode.
>   1809                           */
>   1810                          if (vma->anon_vma) {
>   1811                                  result = SCAN_PAGE_ANON;
>   1812                                  goto unlock_next;
>   1813                          }
>   1814                          /*
>   1815                           * When a vma is registered with uffd-wp, we can't
>   1816                           * recycle the pmd pgtable because there can be pte
>   1817                           * markers installed.  Skip it only, so the rest mm/vma
>   1818                           * can still have the same file mapped hugely, however
>   1819                           * it'll always mapped in small page size for uffd-wp
>   1820                           * registered ranges.
>   1821                           */
>   1822                          if (hpage_collapse_test_exit(mm)) {
>   1823                                  result = SCAN_ANY_PROCESS;
>   1824                                  goto unlock_next;
>   1825                          }
>   1826                          if (userfaultfd_wp(vma)) {
>   1827                                  result = SCAN_PTE_UFFD_WP;
>   1828                                  goto unlock_next;
>   1829                          }
>   1830                          collapse_and_free_pmd(mm, vma, addr, pmd);
>   1831                          if (!cc->is_khugepaged && is_target)
>   1832                                  result = set_huge_pmd(vma, addr, pmd, hpage);
>   1833                          else
>   1834                                  result = SCAN_SUCCEED;
>   1835
>   1836  unlock_next:
>   1837                          mmap_write_unlock(mm);
>   1838                          goto next;
>   1839                  }
>   1840                  /*
>   1841                   * Calling context will handle target mm/addr. Otherwise, let
>   1842                   * khugepaged try again later.
>   1843                   */
>   1844                  if (!is_target) {
>   1845                          khugepaged_add_pte_mapped_thp(mm, addr);
>   1846                          continue;
>   1847                  }
>   1848  next:
>   1849                  if (is_target)
>   1850                          target_result = result;
>   1851          }
>   1852          i_mmap_unlock_write(mapping);
>   1853          return target_result;
>   1854  }
>   1855
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
