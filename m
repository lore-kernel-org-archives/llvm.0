Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E985D4D5BF;
	Wed,  1 May 2024 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714553754; cv=none; b=FiAqJ2TpVecarTw0mY6lxZBFmKUnm+Oczj36B+qsK1Mx0OgkSKaSIIvC43bSIfMSnZBlNAAXQU+AyuWq3+ohYxQz298W5Y/ahAny5p2TPuyTG37/3klNsGXVeIvkNAsslORv8bexXDUVh9gyRgRizwbsqcsu4qmMjvTZvEm6TFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714553754; c=relaxed/simple;
	bh=SIfA3xRUvUXxds/f3nO4ALMD0QxTsWABpsDVAO0RZeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgqGtGrfcLwUJOXvqCoZxwMbjSbBC+42DaHe0b46uGiK1dAxqG1AXSmeUrILpACdDLh28zTNKDGEPXt4BqTR7QU7uBPsJTE+wuz6FtOhKezCmZcv2Wr4c1iYiLw9QwTSSQWosRVqETql3IWR1/a42Jgo/XNBCYStMHRk/UlZ8no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5+qzIcR; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5+qzIcR"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso11381692a12.3;
        Wed, 01 May 2024 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714553750; x=1715158550; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y8UeTwlLpqIPwiAOtel8TLXxGQ0tanieNFNQRaWUEs=;
        b=R5+qzIcRjQEsZY9idydBIr4iVJvZhcO8oJRyyY3TiUpRlaek4byMtisueKp+fWhV55
         JfypGyY7FAU7C+LuIoTlYz13Rejzhfc8A5f6Fd15omL93eJL2abump7IdMwKBLo7moaE
         qMLSG0Vf6zleN/0TQv1EahB7Md7Bx7NUHugGG3e06BPSFyHjPqunKY0g/iZyJ0qz/hMS
         YObYiWoW34OGVGcl1tvzf1rwjp7jXkmz62idtyCKQJMN5aPOMjD+V6dJs8quCBjP0Qug
         boGNR/0T//4PkiWgRo9xZhp6irqBjAgrRjhuHQJ98iBvTR72fGp2P4yjk++1yKwdnw2k
         mmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714553750; x=1715158550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y8UeTwlLpqIPwiAOtel8TLXxGQ0tanieNFNQRaWUEs=;
        b=ZuqxMwd6X6x30SO/nsT9QhzeEJk0SiFJIIVpj1rXOEhHVmTZRgdfH7CxYSJXL0pnQW
         N1drISaCBKyyqWOi+pRnA4MDx5FiFVHQT7pjal+6MKAmz7zoS4xvn3aHdiyr3jwHYs92
         l8wtyKDkvhQAR6OOsMtrAieqEUVbHQpog6bYlVKy5vo9uCoOxTgWWxGWFcCbtjDniL0L
         itdCtWXj8COhEf07vFiY3ZLe2/dSPMXcXxAtokYi7A1IDm8SDLfUB/hrT28ZOqIpe68K
         iZ0fGBTnM8wv6D+QF1g0M9MZukdCXu2sQ+0cU5c4u9EusTcXLmBj4sw8BHjmDLYV4Nw6
         qwfg==
X-Forwarded-Encrypted: i=1; AJvYcCW3YZRSTzMTulyZmQ1K6P7mLkYH/h6R+Ib13SHQjZQnIDvOTi6qWp9hgwh6ZTZEGWz2kv5I6ZAlTyelWlFcI+TMw9hxE46WFOvT+87jGA==
X-Gm-Message-State: AOJu0Yzi7hiE1HChDyAB7BlqMR79rFMmU6Gqc7ARwEP+Ose6K8iKqElP
	bsqUZWQJF8MvX39ZIU3A0kZLXcp5IfGH9ewPPrB3/AwdoV7gsJV5fgv4nrB3a7B3bWgA18Ol7Vv
	8PVzmHzqQGVbftGxfszo4K+ZZmvBA2S8lnns=
X-Google-Smtp-Source: AGHT+IH9wLbZoblHxsvWRGIs1/8StuWcQcwwNMVUkoxgdj+i5GoqKiK/QEyyw6KyQuo3j0y+wdWRKUoGGn7m+PH4ESg=
X-Received: by 2002:a50:cd17:0:b0:572:9b20:2929 with SMTP id
 z23-20020a50cd17000000b005729b202929mr1432626edi.37.1714553749981; Wed, 01
 May 2024 01:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405011624.KzqucHwp-lkp@intel.com>
In-Reply-To: <202405011624.KzqucHwp-lkp@intel.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 1 May 2024 16:55:38 +0800
Message-ID: <CAK1f24nstGx3QZ5dzUkNDuLdOF948Q-r12snLZmXXacJ0FHXfg@mail.gmail.com>
Subject: Re: [linux-next:master 9311/9709] mm/rmap.c:1651:27: error: call to
 '__compiletime_assert_333' declared with 'error' attribute: BUILD_BUG failed
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

This bug was introduced in v3[1] and has been fixed in v4[2]. Sorry
for any trouble this may have caused :(

[1] https://lore.kernel.org/linux-mm/20240429132308.38794-1-ioworker0@gmail=
.com
[2] https://lore.kernel.org/linux-mm/20240501042700.83974-1-ioworker0@gmail=
.com

Thanks,
Lance Yang

On Wed, May 1, 2024 at 4:38=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   d04466706db5e241ee026f17b5f920e50dee26b5
> commit: 34d66beb14bdedb5c12733f2fd2498634dd1fd91 [9311/9709] mm/rmap: int=
egrate PMD-mapped folio splitting into pagewalk loop
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/2024050=
1/202405011624.KzqucHwp-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 3=
7ae4ad0eef338776c7e2cffb3896153d43dcd90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240501/202405011624.KzqucHwp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405011624.KzqucHwp-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD d04466706db5e241ee026f17b5f920e50dee26b5=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/rmap.c:56:
>    In file included from include/linux/mm.h:2253:
>    include/linux/vmstat.h:514:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from mm/rmap.c:77:
>    include/linux/mm_inline.h:47:41: warning: arithmetic between different=
 enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum=
-conversion]
>       47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages=
);
>          |                                    ~~~~~~~~~~~ ^ ~~~
>    include/linux/mm_inline.h:49:22: warning: arithmetic between different=
 enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum=
-conversion]
>       49 |                                 NR_ZONE_LRU_BASE + lru, nr_pag=
es);
>          |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
> >> mm/rmap.c:1651:27: error: call to '__compiletime_assert_333' declared =
with 'error' attribute: BUILD_BUG failed
>     1651 |                 range.start =3D address & HPAGE_PMD_MASK;
>          |                                         ^
>    include/linux/huge_mm.h:103:27: note: expanded from macro 'HPAGE_PMD_M=
ASK'
>      103 | #define HPAGE_PMD_MASK  (~(HPAGE_PMD_SIZE - 1))
>          |                            ^
>    include/linux/huge_mm.h:104:34: note: expanded from macro 'HPAGE_PMD_S=
IZE'
>      104 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
>          |                                   ^
>    include/linux/huge_mm.h:97:28: note: expanded from macro 'HPAGE_PMD_SH=
IFT'
>       97 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
>          |                            ^
>    note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:448:2: note: expanded from macro '_comp=
iletime_assert'
>      448 |         __compiletime_assert(condition, msg, prefix, suffix)
>          |         ^
>    include/linux/compiler_types.h:441:4: note: expanded from macro '__com=
piletime_assert'
>      441 |                         prefix ## suffix();                   =
          \
>          |                         ^
>    <scratch space>:140:1: note: expanded from here
>      140 | __compiletime_assert_333
>          | ^
>    3 warnings and 1 error generated.
>
>
> vim +1651 mm/rmap.c
>
>   1613
>   1614  /*
>   1615   * @arg: enum ttu_flags will be passed to this argument
>   1616   */
>   1617  static bool try_to_unmap_one(struct folio *folio, struct vm_area_=
struct *vma,
>   1618                       unsigned long address, void *arg)
>   1619  {
>   1620          struct mm_struct *mm =3D vma->vm_mm;
>   1621          DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>   1622          pte_t pteval;
>   1623          struct page *subpage;
>   1624          bool anon_exclusive, ret =3D true;
>   1625          struct mmu_notifier_range range;
>   1626          enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
>   1627          unsigned long pfn;
>   1628          unsigned long hsz =3D 0;
>   1629
>   1630          /*
>   1631           * When racing against e.g. zap_pte_range() on another cp=
u,
>   1632           * in between its ptep_get_and_clear_full() and folio_rem=
ove_rmap_*(),
>   1633           * try_to_unmap() may return before page_mapped() has bec=
ome false,
>   1634           * if page table locking is skipped: use TTU_SYNC to wait=
 for that.
>   1635           */
>   1636          if (flags & TTU_SYNC)
>   1637                  pvmw.flags =3D PVMW_SYNC;
>   1638
>   1639          /*
>   1640           * For THP, we have to assume the worse case ie pmd for i=
nvalidation.
>   1641           * For hugetlb, it could be much worse if we need to do p=
ud
>   1642           * invalidation in the case of pmd sharing.
>   1643           *
>   1644           * Note that the folio can not be freed in this function =
as call of
>   1645           * try_to_unmap() must hold a reference on the folio.
>   1646           */
>   1647          range.end =3D vma_address_end(&pvmw);
>   1648          mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma-=
>vm_mm,
>   1649                                  address, range.end);
>   1650          if (flags & TTU_SPLIT_HUGE_PMD) {
> > 1651                  range.start =3D address & HPAGE_PMD_MASK;
>   1652                  range.end =3D (address & HPAGE_PMD_MASK) + HPAGE_=
PMD_SIZE;
>   1653          }
>   1654          if (folio_test_hugetlb(folio)) {
>   1655                  /*
>   1656                   * If sharing is possible, start and end will be =
adjusted
>   1657                   * accordingly.
>   1658                   */
>   1659                  adjust_range_if_pmd_sharing_possible(vma, &range.=
start,
>   1660                                                       &range.end);
>   1661
>   1662                  /* We need the huge page size for set_huge_pte_at=
() */
>   1663                  hsz =3D huge_page_size(hstate_vma(vma));
>   1664          }
>   1665          mmu_notifier_invalidate_range_start(&range);
>   1666
>   1667          while (page_vma_mapped_walk(&pvmw)) {
>   1668                  /*
>   1669                   * If the folio is in an mlock()d vma, we must no=
t swap it out.
>   1670                   */
>   1671                  if (!(flags & TTU_IGNORE_MLOCK) &&
>   1672                      (vma->vm_flags & VM_LOCKED)) {
>   1673                          /* Restore the mlock which got missed */
>   1674                          if (!folio_test_large(folio))
>   1675                                  mlock_vma_folio(folio, vma);
>   1676                          goto walk_done_err;
>   1677                  }
>   1678
>   1679                  if (!pvmw.pte && (flags & TTU_SPLIT_HUGE_PMD)) {
>   1680                          /*
>   1681                           * We temporarily have to drop the PTL an=
d start once
>   1682                           * again from that now-PTE-mapped page ta=
ble.
>   1683                           */
>   1684                          split_huge_pmd_locked(vma, range.start, p=
vmw.pmd, false,
>   1685                                                folio);
>   1686                          pvmw.pmd =3D NULL;
>   1687                          spin_unlock(pvmw.ptl);
>   1688                          flags &=3D ~TTU_SPLIT_HUGE_PMD;
>   1689                          continue;
>   1690                  }
>   1691
>   1692                  /* Unexpected PMD-mapped THP? */
>   1693                  VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>   1694
>   1695                  pfn =3D pte_pfn(ptep_get(pvmw.pte));
>   1696                  subpage =3D folio_page(folio, pfn - folio_pfn(fol=
io));
>   1697                  address =3D pvmw.address;
>   1698                  anon_exclusive =3D folio_test_anon(folio) &&
>   1699                                   PageAnonExclusive(subpage);
>   1700
>   1701                  if (folio_test_hugetlb(folio)) {
>   1702                          bool anon =3D folio_test_anon(folio);
>   1703
>   1704                          /*
>   1705                           * The try_to_unmap() is only passed a hu=
getlb page
>   1706                           * in the case where the hugetlb page is =
poisoned.
>   1707                           */
>   1708                          VM_BUG_ON_PAGE(!PageHWPoison(subpage), su=
bpage);
>   1709                          /*
>   1710                           * huge_pmd_unshare may unmap an entire P=
MD page.
>   1711                           * There is no way of knowing exactly whi=
ch PMDs may
>   1712                           * be cached for this mm, so we must flus=
h them all.
>   1713                           * start/end were already adjusted above =
to cover this
>   1714                           * range.
>   1715                           */
>   1716                          flush_cache_range(vma, range.start, range=
.end);
>   1717
>   1718                          /*
>   1719                           * To call huge_pmd_unshare, i_mmap_rwsem=
 must be
>   1720                           * held in write mode.  Caller needs to e=
xplicitly
>   1721                           * do this outside rmap routines.
>   1722                           *
>   1723                           * We also must hold hugetlb vma_lock in =
write mode.
>   1724                           * Lock order dictates acquiring vma_lock=
 BEFORE
>   1725                           * i_mmap_rwsem.  We can only try lock he=
re and fail
>   1726                           * if unsuccessful.
>   1727                           */
>   1728                          if (!anon) {
>   1729                                  VM_BUG_ON(!(flags & TTU_RMAP_LOCK=
ED));
>   1730                                  if (!hugetlb_vma_trylock_write(vm=
a))
>   1731                                          goto walk_done_err;
>   1732                                  if (huge_pmd_unshare(mm, vma, add=
ress, pvmw.pte)) {
>   1733                                          hugetlb_vma_unlock_write(=
vma);
>   1734                                          flush_tlb_range(vma,
>   1735                                                  range.start, rang=
e.end);
>   1736                                          /*
>   1737                                           * The ref count of the P=
MD page was
>   1738                                           * dropped which is part =
of the way map
>   1739                                           * counting is done for s=
hared PMDs.
>   1740                                           * Return 'true' here.  W=
hen there is
>   1741                                           * no other sharing, huge=
_pmd_unshare
>   1742                                           * returns false and we w=
ill unmap the
>   1743                                           * actual page and drop m=
ap count
>   1744                                           * to zero.
>   1745                                           */
>   1746                                          goto walk_done;
>   1747                                  }
>   1748                                  hugetlb_vma_unlock_write(vma);
>   1749                          }
>   1750                          pteval =3D huge_ptep_clear_flush(vma, add=
ress, pvmw.pte);
>   1751                  } else {
>   1752                          flush_cache_page(vma, address, pfn);
>   1753                          /* Nuke the page table entry. */
>   1754                          if (should_defer_flush(mm, flags)) {
>   1755                                  /*
>   1756                                   * We clear the PTE but do not fl=
ush so potentially
>   1757                                   * a remote CPU could still be wr=
iting to the folio.
>   1758                                   * If the entry was previously cl=
ean then the
>   1759                                   * architecture must guarantee th=
at a clear->dirty
>   1760                                   * transition on a cached TLB ent=
ry is written through
>   1761                                   * and traps if the PTE is unmapp=
ed.
>   1762                                   */
>   1763                                  pteval =3D ptep_get_and_clear(mm,=
 address, pvmw.pte);
>   1764
>   1765                                  set_tlb_ubc_flush_pending(mm, pte=
val, address);
>   1766                          } else {
>   1767                                  pteval =3D ptep_clear_flush(vma, =
address, pvmw.pte);
>   1768                          }
>   1769                  }
>   1770
>   1771                  /*
>   1772                   * Now the pte is cleared. If this pte was uffd-w=
p armed,
>   1773                   * we may want to replace a none pte with a marke=
r pte if
>   1774                   * it's file-backed, so we don't lose the trackin=
g info.
>   1775                   */
>   1776                  pte_install_uffd_wp_if_needed(vma, address, pvmw.=
pte, pteval);
>   1777
>   1778                  /* Set the dirty flag on the folio now the pte is=
 gone. */
>   1779                  if (pte_dirty(pteval))
>   1780                          folio_mark_dirty(folio);
>   1781
>   1782                  /* Update high watermark before we lower rss */
>   1783                  update_hiwater_rss(mm);
>   1784
>   1785                  if (PageHWPoison(subpage) && (flags & TTU_HWPOISO=
N)) {
>   1786                          pteval =3D swp_entry_to_pte(make_hwpoison=
_entry(subpage));
>   1787                          if (folio_test_hugetlb(folio)) {
>   1788                                  hugetlb_count_sub(folio_nr_pages(=
folio), mm);
>   1789                                  set_huge_pte_at(mm, address, pvmw=
.pte, pteval,
>   1790                                                  hsz);
>   1791                          } else {
>   1792                                  dec_mm_counter(mm, mm_counter(fol=
io));
>   1793                                  set_pte_at(mm, address, pvmw.pte,=
 pteval);
>   1794                          }
>   1795
>   1796                  } else if (pte_unused(pteval) && !userfaultfd_arm=
ed(vma)) {
>   1797                          /*
>   1798                           * The guest indicated that the page cont=
ent is of no
>   1799                           * interest anymore. Simply discard the p=
te, vmscan
>   1800                           * will take care of the rest.
>   1801                           * A future reference will then fault in =
a new zero
>   1802                           * page. When userfaultfd is active, we m=
ust not drop
>   1803                           * this page though, as its main user (po=
stcopy
>   1804                           * migration) will not expect userfaults =
on already
>   1805                           * copied pages.
>   1806                           */
>   1807                          dec_mm_counter(mm, mm_counter(folio));
>   1808                  } else if (folio_test_anon(folio)) {
>   1809                          swp_entry_t entry =3D page_swap_entry(sub=
page);
>   1810                          pte_t swp_pte;
>   1811                          /*
>   1812                           * Store the swap location in the pte.
>   1813                           * See handle_pte_fault() ...
>   1814                           */
>   1815                          if (unlikely(folio_test_swapbacked(folio)=
 !=3D
>   1816                                          folio_test_swapcache(foli=
o))) {
>   1817                                  WARN_ON_ONCE(1);
>   1818                                  goto walk_done_err;
>   1819                          }
>   1820
>   1821                          /* MADV_FREE page check */
>   1822                          if (!folio_test_swapbacked(folio)) {
>   1823                                  int ref_count, map_count;
>   1824
>   1825                                  /*
>   1826                                   * Synchronize with gup_pte_range=
():
>   1827                                   * - clear PTE; barrier; read ref=
count
>   1828                                   * - inc refcount; barrier; read =
PTE
>   1829                                   */
>   1830                                  smp_mb();
>   1831
>   1832                                  ref_count =3D folio_ref_count(fol=
io);
>   1833                                  map_count =3D folio_mapcount(foli=
o);
>   1834
>   1835                                  /*
>   1836                                   * Order reads for page refcount =
and dirty flag
>   1837                                   * (see comments in __remove_mapp=
ing()).
>   1838                                   */
>   1839                                  smp_rmb();
>   1840
>   1841                                  /*
>   1842                                   * The only page refs must be one=
 from isolation
>   1843                                   * plus the rmap(s) (dropped by d=
iscard:).
>   1844                                   */
>   1845                                  if (ref_count =3D=3D 1 + map_coun=
t &&
>   1846                                      !folio_test_dirty(folio)) {
>   1847                                          dec_mm_counter(mm, MM_ANO=
NPAGES);
>   1848                                          goto discard;
>   1849                                  }
>   1850
>   1851                                  /*
>   1852                                   * If the folio was redirtied, it=
 cannot be
>   1853                                   * discarded. Remap the page to p=
age table.
>   1854                                   */
>   1855                                  set_pte_at(mm, address, pvmw.pte,=
 pteval);
>   1856                                  folio_set_swapbacked(folio);
>   1857                                  goto walk_done_err;
>   1858                          }
>   1859
>   1860                          if (swap_duplicate(entry) < 0) {
>   1861                                  set_pte_at(mm, address, pvmw.pte,=
 pteval);
>   1862                                  goto walk_done_err;
>   1863                          }
>   1864                          if (arch_unmap_one(mm, vma, address, ptev=
al) < 0) {
>   1865                                  swap_free(entry);
>   1866                                  set_pte_at(mm, address, pvmw.pte,=
 pteval);
>   1867                                  goto walk_done_err;
>   1868                          }
>   1869
>   1870                          /* See folio_try_share_anon_rmap(): clear=
 PTE first. */
>   1871                          if (anon_exclusive &&
>   1872                              folio_try_share_anon_rmap_pte(folio, =
subpage)) {
>   1873                                  swap_free(entry);
>   1874                                  set_pte_at(mm, address, pvmw.pte,=
 pteval);
>   1875                                  goto walk_done_err;
>   1876                          }
>   1877                          if (list_empty(&mm->mmlist)) {
>   1878                                  spin_lock(&mmlist_lock);
>   1879                                  if (list_empty(&mm->mmlist))
>   1880                                          list_add(&mm->mmlist, &in=
it_mm.mmlist);
>   1881                                  spin_unlock(&mmlist_lock);
>   1882                          }
>   1883                          dec_mm_counter(mm, MM_ANONPAGES);
>   1884                          inc_mm_counter(mm, MM_SWAPENTS);
>   1885                          swp_pte =3D swp_entry_to_pte(entry);
>   1886                          if (anon_exclusive)
>   1887                                  swp_pte =3D pte_swp_mkexclusive(s=
wp_pte);
>   1888                          if (pte_soft_dirty(pteval))
>   1889                                  swp_pte =3D pte_swp_mksoft_dirty(=
swp_pte);
>   1890                          if (pte_uffd_wp(pteval))
>   1891                                  swp_pte =3D pte_swp_mkuffd_wp(swp=
_pte);
>   1892                          set_pte_at(mm, address, pvmw.pte, swp_pte=
);
>   1893                  } else {
>   1894                          /*
>   1895                           * This is a locked file-backed folio,
>   1896                           * so it cannot be removed from the page
>   1897                           * cache and replaced by a new folio befo=
re
>   1898                           * mmu_notifier_invalidate_range_end, so =
no
>   1899                           * concurrent thread might update its pag=
e table
>   1900                           * to point at a new folio while a device=
 is
>   1901                           * still using this folio.
>   1902                           *
>   1903                           * See Documentation/mm/mmu_notifier.rst
>   1904                           */
>   1905                          dec_mm_counter(mm, mm_counter_file(folio)=
);
>   1906                  }
>   1907  discard:
>   1908                  if (unlikely(folio_test_hugetlb(folio)))
>   1909                          hugetlb_remove_rmap(folio);
>   1910                  else
>   1911                          folio_remove_rmap_pte(folio, subpage, vma=
);
>   1912                  if (vma->vm_flags & VM_LOCKED)
>   1913                          mlock_drain_local();
>   1914                  folio_put(folio);
>   1915                  continue;
>   1916  walk_done_err:
>   1917                  ret =3D false;
>   1918  walk_done:
>   1919                  page_vma_mapped_walk_done(&pvmw);
>   1920                  break;
>   1921          }
>   1922
>   1923          mmu_notifier_invalidate_range_end(&range);
>   1924
>   1925          return ret;
>   1926  }
>   1927
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
