Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5F31F991;
	Sun, 22 Mar 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774169765; cv=none; b=KU8YFTB6BByaePiQS5ua6ifaJKQ6ndu5cj3PvZIB1Drf8oOERwvErCNhg5OpLEHQkYeBfXtbegjcLCAY0h898YrnyzRAULan/jZLEuRuO6vBCAGgbMUcqIVOvXD3r7hUtTik1Nr8JJGuas8Zt19013V7OZBFQqzm6bkTRrDbgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774169765; c=relaxed/simple;
	bh=w3JZCDnYdMywrBnFxT7/YHCBmDXZOof38E9Q6QfpHOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lGuuCMCuZD+p8n0zClaB/y0iDh57uVlItIySrxG+XilVJzfT1DgoygSwL1ACupiriFFaWnubERR1Q1exORu1vCB60uZ3TXVYH82h69JZD0z78cKNMrLkD0AUd41hMNjydLrY2xbJWDYN2HfuCWnVvBW6+POueb6jTbLEzJ8AEfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlDrXuv3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlDrXuv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774169763; x=1805705763;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w3JZCDnYdMywrBnFxT7/YHCBmDXZOof38E9Q6QfpHOI=;
  b=MlDrXuv3lpllTgwOSuzY3thN9s2aWAsPwntMRu8vpIZirk6iV/DpsxLg
   StcMxWyOnTUOF2ku/I4nPm0bgx9Lz0GZBIhyCBiGPV8Ndaged91grh07U
   xji4hbC6kDdjRMLAstbRpK2Frx3Vbs5wTnE1H4n/QOakrdwgfIep3rYul
   rHicNLx44aU8A20mGBACFF9V3yEt2fTo9B4eK/Y7PGkbfpokTN6FN8ZgK
   PE91cMm1enflXHfrBrFj/HmTrkPmJfOVTZ7AtePJpjUdHVeFriR9pu5SF
   IO8KPoHtmhrhLtlN/cujDBSbR5DNIcs31401pUa6qJ1vdqnod+4JfzsdR
   A==;
X-CSE-ConnectionGUID: 0C9pHk5MScuFMQMXdJhrfg==
X-CSE-MsgGUID: SgUEkEKjQZSSuywrPlRO4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="97819483"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="97819483"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 01:56:03 -0700
X-CSE-ConnectionGUID: QRcOMOLwRgK6GHKUVK4mJQ==
X-CSE-MsgGUID: +sHP8pAVRwO2ag/o2E280A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="228453310"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Mar 2026 01:55:59 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Eb7-000000001tl-2zwD;
	Sun, 22 Mar 2026 08:55:50 +0000
Date: Sun, 22 Mar 2026 16:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 26/30] mm/huge_memory.c:3098:20: error: too
 many arguments to function call, expected 5, have 6
Message-ID: <202603221654.IVQxREaL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_s=
ize
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: cbef1d0b647d13181325aba9b7fb964d22e03829 [26/30] tmp
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260=
322/202603221654.IVQxREaL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4ab=
b927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260322/202603221654.IVQxREaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221654.IVQxREaL-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:3098:20: error: too many arguments to function call, ex=
pected 5, have 6
    3097 |                         folio_add_anon_rmap_ptes(folio, page, HP=
AGE_PMD_NR,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
    3098 |                                                  vma, haddr, rma=
p_flags);
         |                                                              ^~~=
~~~~~~~
   include/linux/rmap.h:405:6: note: 'folio_add_anon_rmap_ptes' declared he=
re
     405 | void folio_add_anon_rmap_ptes(struct folio *, struct page *, int=
 nr_ptes,
         |      ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     406 |                 struct vm_area_struct *, rmap_t flags);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3098 mm/huge_memory.c

eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  2986 =20
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  2987  static void __split_huge=
_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
ba98828088ad3f Kiryl Shutsemau   2016-01-15  2988  		unsigned long haddr, b=
ool freeze)
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  2989  {
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  2990  	struct mm_struct *mm =
=3D vma->vm_mm;
91b2978a348073 David Hildenbrand 2023-12-20  2991  	struct folio *folio;
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  2992  	struct page *page;
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  2993  	pgtable_t pgtable;
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  2994  	pmd_t old_pmd, _pmd;
1462872900233e Balbir Singh      2025-10-01  2995  	bool soft_dirty, uffd_w=
p =3D false, young =3D false, write =3D false;
0ccf7f168e17bb Peter Xu          2022-08-11  2996  	bool anon_exclusive =3D =
false, dirty =3D false;
2ac015e293bbe3 Kiryl Shutsemau   2016-02-24  2997  	unsigned long addr;
c9c1ee20ee84b1 Hugh Dickins      2023-06-08  2998  	pte_t *pte;
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  2999  	int i;
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3000 =20
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3001  	VM_BUG_ON(haddr & ~HPAG=
E_PMD_MASK);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3002  	VM_BUG_ON_VMA(vma->vm_s=
tart > haddr, vma);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3003  	VM_BUG_ON_VMA(vma->vm_e=
nd < haddr + HPAGE_PMD_SIZE, vma);
1462872900233e Balbir Singh      2025-10-01  3004 =20
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3005  	VM_WARN_ON_ONCE(!pmd_is=
_valid_softleaf(*pmd) && !pmd_trans_huge(*pmd));
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3006 =20
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3007  	count_vm_event(THP_SPLI=
T_PMD);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3008 =20
d21b9e57c74ce8 Kiryl Shutsemau   2016-07-26  3009  	if (!vma_is_anonymous(v=
ma)) {
ec8832d007cb7b Alistair Popple   2023-07-25  3010  		old_pmd =3D pmdp_huge_=
clear_flush(vma, haddr, pmd);
953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  3011  		/*
953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  3012  		 * We are going to unm=
ap this huge page. So
953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  3013  		 * just go ahead and z=
ap it
953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  3014  		 */
953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  3015  		if (arch_needs_pgtable=
_deposit())
953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  3016  			zap_deposited_table(m=
m, pmd);
38607c62b34b46 Alistair Popple   2025-02-28  3017  		if (!vma_is_dax(vma) &=
& vma_is_special_huge(vma))
d21b9e57c74ce8 Kiryl Shutsemau   2016-07-26  3018  			return;
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3019  		if (unlikely(pmd_is_mi=
gration_entry(old_pmd))) {
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3020  			const softleaf_t old_=
entry =3D softleaf_from_pmd(old_pmd);
99fa8a48203d62 Hugh Dickins      2021-06-15  3021 =20
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3022  			folio =3D softleaf_to=
_folio(old_entry);
38607c62b34b46 Alistair Popple   2025-02-28  3023  		} else if (is_huge_zer=
o_pmd(old_pmd)) {
38607c62b34b46 Alistair Popple   2025-02-28  3024  			return;
99fa8a48203d62 Hugh Dickins      2021-06-15  3025  		} else {
99fa8a48203d62 Hugh Dickins      2021-06-15  3026  			page =3D pmd_page(old=
_pmd);
a8e61d584eda0d David Hildenbrand 2023-12-20  3027  			folio =3D page_folio(=
page);
a8e61d584eda0d David Hildenbrand 2023-12-20  3028  			if (!folio_test_dirty=
(folio) && pmd_dirty(old_pmd))
db44c658f798ad David Hildenbrand 2024-01-22  3029  				folio_mark_dirty(fol=
io);
a8e61d584eda0d David Hildenbrand 2023-12-20  3030  			if (!folio_test_refer=
enced(folio) && pmd_young(old_pmd))
a8e61d584eda0d David Hildenbrand 2023-12-20  3031  				folio_set_referenced=
(folio);
a8e61d584eda0d David Hildenbrand 2023-12-20  3032  			folio_remove_rmap_pmd=
(folio, page, vma);
a8e61d584eda0d David Hildenbrand 2023-12-20  3033  			folio_put(folio);
99fa8a48203d62 Hugh Dickins      2021-06-15  3034  		}
6b27cc6c66abf0 Kefeng Wang       2024-01-11  3035  		add_mm_counter(mm, mm_=
counter_file(folio), -HPAGE_PMD_NR);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3036  		return;
99fa8a48203d62 Hugh Dickins      2021-06-15  3037  	}
99fa8a48203d62 Hugh Dickins      2021-06-15  3038 =20
3b77e8c8cde581 Hugh Dickins      2021-06-15  3039  	if (is_huge_zero_pmd(*p=
md)) {
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse     2017-11-15  3040  		/*
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse     2017-11-15  3041  		 * FIXME: Do=
 we want to invalidate secondary mmu by calling
1af5a8109904b7 Alistair Popple   2023-07-25  3042  		 * mmu_notifier_arch_i=
nvalidate_secondary_tlbs() see comments below
1af5a8109904b7 Alistair Popple   2023-07-25  3043  		 * inside __split_huge=
_pmd() ?
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse     2017-11-15  3044  		 *
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse     2017-11-15  3045  		 * We are go=
ing from a zero huge page write protected to zero
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse     2017-11-15  3046  		 * small pag=
e also write protected so it does not seems useful
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse     2017-11-15  3047  		 * to invali=
date secondary mmu at this time.
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse     2017-11-15  3048  		 */
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3049  		return __split_huge_ze=
ro_page_pmd(vma, haddr, pmd);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3050  	}
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3051 =20
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3052  	if (pmd_is_migration_en=
try(*pmd)) {
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3053  		softleaf_t entry;
84c3fc4e9c563d Zi Yan            2017-09-08  3054 =20
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3055  		old_pmd =3D *pmd;
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3056  		entry =3D softleaf_fro=
m_pmd(old_pmd);
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3057  		page =3D softleaf_to_p=
age(entry);
1462872900233e Balbir Singh      2025-10-01  3058  		folio =3D page_folio(p=
age);
1462872900233e Balbir Singh      2025-10-01  3059 =20
1462872900233e Balbir Singh      2025-10-01  3060  		soft_dirty =3D pmd_swp=
_soft_dirty(old_pmd);
1462872900233e Balbir Singh      2025-10-01  3061  		uffd_wp =3D pmd_swp_uf=
fd_wp(old_pmd);
1462872900233e Balbir Singh      2025-10-01  3062 =20
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3063  		write =3D softleaf_is_=
migration_write(entry);
6c287605fd5646 David Hildenbrand 2022-05-09  3064  		if (PageAnon(page))
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3065  			anon_exclusive =3D so=
ftleaf_is_migration_read_exclusive(entry);
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3066  		young =3D softleaf_is_=
migration_young(entry);
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3067  		dirty =3D softleaf_is_=
migration_dirty(entry);
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3068  	} else if (pmd_is_devic=
e_private_entry(*pmd)) {
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3069  		softleaf_t entry;
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3070 =20
1462872900233e Balbir Singh      2025-10-01  3071  		old_pmd =3D *pmd;
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3072  		entry =3D softleaf_fro=
m_pmd(old_pmd);
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3073  		page =3D softleaf_to_p=
age(entry);
1462872900233e Balbir Singh      2025-10-01  3074  		folio =3D page_folio(p=
age);
1462872900233e Balbir Singh      2025-10-01  3075 =20
2e83ee1d8694a6 Peter Xu          2018-12-21  3076  		soft_dirty =3D pmd_swp=
_soft_dirty(old_pmd);
f45ec5ff16a75f Peter Xu          2020-04-06  3077  		uffd_wp =3D pmd_swp_uf=
fd_wp(old_pmd);
1462872900233e Balbir Singh      2025-10-01  3078 =20
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3079  		write =3D softleaf_is_=
device_private_write(entry);
1462872900233e Balbir Singh      2025-10-01  3080  		anon_exclusive =3D Pag=
eAnonExclusive(page);
1462872900233e Balbir Singh      2025-10-01  3081 =20
1462872900233e Balbir Singh      2025-10-01  3082  		/*
1462872900233e Balbir Singh      2025-10-01  3083  		 * Device private THP =
should be treated the same as regular
1462872900233e Balbir Singh      2025-10-01  3084  		 * folios w.r.t anon e=
xclusive handling. See the comments for
1462872900233e Balbir Singh      2025-10-01  3085  		 * folio handling and =
anon_exclusive below.
1462872900233e Balbir Singh      2025-10-01  3086  		 */
1462872900233e Balbir Singh      2025-10-01  3087  		if (freeze && anon_exc=
lusive &&
1462872900233e Balbir Singh      2025-10-01  3088  		    folio_try_share_an=
on_rmap_pmd(folio, page))
1462872900233e Balbir Singh      2025-10-01  3089  			freeze =3D false;
1462872900233e Balbir Singh      2025-10-01  3090  		if (!freeze) {
1462872900233e Balbir Singh      2025-10-01  3091  			rmap_t rmap_flags =3D =
RMAP_NONE;
1462872900233e Balbir Singh      2025-10-01  3092 =20
1462872900233e Balbir Singh      2025-10-01  3093  			folio_ref_add(folio, =
HPAGE_PMD_NR - 1);
1462872900233e Balbir Singh      2025-10-01  3094  			if (anon_exclusive)
1462872900233e Balbir Singh      2025-10-01  3095  				rmap_flags |=3D RMAP=
_EXCLUSIVE;
1462872900233e Balbir Singh      2025-10-01  3096 =20
1462872900233e Balbir Singh      2025-10-01  3097  			folio_add_anon_rmap_p=
tes(folio, page, HPAGE_PMD_NR,
1462872900233e Balbir Singh      2025-10-01 @3098  						 vma, haddr, rmap_=
flags);
1462872900233e Balbir Singh      2025-10-01  3099  		}
2e83ee1d8694a6 Peter Xu          2018-12-21  3100  	} else {
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3101  		/*
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3102  		 * Up to this point th=
e pmd is present and huge and userland has
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3103  		 * the whole access to=
 the hugepage during the split (which
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3104  		 * happens in place). =
If we overwrite the pmd with the not-huge
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3105  		 * version pointing to=
 the pte here (which of course we could if
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3106  		 * all CPUs were bug f=
ree), userland could trigger a small page
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3107  		 * size TLB miss on th=
e small sized TLB while the hugepage TLB
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3108  		 * entry is still esta=
blished in the huge TLB. Some CPU doesn't
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3109  		 * like that. See
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3110  		 * http://support.amd.=
com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3111  		 * 383 on page 105. In=
tel should be safe but is also warns that
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3112  		 * it's only safe if t=
he permission and cache attributes of the
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3113  		 * two entries loaded =
in the two TLB is identical (which should
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3114  		 * be the case here). =
But it is generally safer to never allow
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3115  		 * small and huge TLB =
entries for the same virtual address to be
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3116  		 * loaded simultaneous=
ly. So instead of doing "pmd_populate();
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3117  		 * flush_pmd_tlb_range=
();" we first mark the current pmd
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3118  		 * notpresent (atomica=
lly because here the pmd_trans_huge must
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3119  		 * remain set at all t=
imes on the pmd until the split is
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3120  		 * complete for this p=
md), then we flush the SMP TLB and finally
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3121  		 * we write the non-hu=
ge version of the pmd entry with
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3122  		 * pmd_populate.
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3123  		 */
3a5a8d343e1cf9 Ryan Roberts      2024-05-01  3124  		old_pmd =3D pmdp_inval=
idate(vma, haddr, pmd);
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3125  		page =3D pmd_page(old_=
pmd);
91b2978a348073 David Hildenbrand 2023-12-20  3126  		folio =3D page_folio(p=
age);
0ccf7f168e17bb Peter Xu          2022-08-11  3127  		if (pmd_dirty(old_pmd)=
) {
0ccf7f168e17bb Peter Xu          2022-08-11  3128  			dirty =3D true;
91b2978a348073 David Hildenbrand 2023-12-20  3129  			folio_set_dirty(folio=
);
0ccf7f168e17bb Peter Xu          2022-08-11  3130  		}
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3131  		write =3D pmd_write(ol=
d_pmd);
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3132  		young =3D pmd_young(ol=
d_pmd);
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3133  		soft_dirty =3D pmd_sof=
t_dirty(old_pmd);
292924b2602474 Peter Xu          2020-04-06  3134  		uffd_wp =3D pmd_uffd_w=
p(old_pmd);
6c287605fd5646 David Hildenbrand 2022-05-09  3135 =20
91b2978a348073 David Hildenbrand 2023-12-20  3136  		VM_WARN_ON_FOLIO(!foli=
o_ref_count(folio), folio);
91b2978a348073 David Hildenbrand 2023-12-20  3137  		VM_WARN_ON_FOLIO(!foli=
o_test_anon(folio), folio);
6c287605fd5646 David Hildenbrand 2022-05-09  3138 =20
6c287605fd5646 David Hildenbrand 2022-05-09  3139  		/*
6c287605fd5646 David Hildenbrand 2022-05-09  3140  		 * Without "freeze", w=
e'll simply split the PMD, propagating the
6c287605fd5646 David Hildenbrand 2022-05-09  3141  		 * PageAnonExclusive()=
 flag for each PTE by setting it for
6c287605fd5646 David Hildenbrand 2022-05-09  3142  		 * each subpage -- no =
need to (temporarily) clear.
6c287605fd5646 David Hildenbrand 2022-05-09  3143  		 *
6c287605fd5646 David Hildenbrand 2022-05-09  3144  		 * With "freeze" we wa=
nt to replace mapped pages by
6c287605fd5646 David Hildenbrand 2022-05-09  3145  		 * migration entries r=
ight away. This is only possible if we
6c287605fd5646 David Hildenbrand 2022-05-09  3146  		 * managed to clear Pa=
geAnonExclusive() -- see
6c287605fd5646 David Hildenbrand 2022-05-09  3147  		 * set_pmd_migration_e=
ntry().
6c287605fd5646 David Hildenbrand 2022-05-09  3148  		 *
6c287605fd5646 David Hildenbrand 2022-05-09  3149  		 * In case we cannot c=
lear PageAnonExclusive(), split the PMD
6c287605fd5646 David Hildenbrand 2022-05-09  3150  		 * only and let try_to=
_migrate_one() fail later.
088b8aa537c2c7 David Hildenbrand 2022-09-01  3151  		 *
e3b4b1374f87c7 David Hildenbrand 2023-12-20  3152  		 * See folio_try_share=
_anon_rmap_pmd(): invalidate PMD first.
6c287605fd5646 David Hildenbrand 2022-05-09  3153  		 */
91b2978a348073 David Hildenbrand 2023-12-20  3154  		anon_exclusive =3D Pag=
eAnonExclusive(page);
e3b4b1374f87c7 David Hildenbrand 2023-12-20  3155  		if (freeze && anon_exc=
lusive &&
e3b4b1374f87c7 David Hildenbrand 2023-12-20  3156  		    folio_try_share_an=
on_rmap_pmd(folio, page))
6c287605fd5646 David Hildenbrand 2022-05-09  3157  			freeze =3D false;
91b2978a348073 David Hildenbrand 2023-12-20  3158  		if (!freeze) {
91b2978a348073 David Hildenbrand 2023-12-20  3159  			rmap_t rmap_flags =3D =
RMAP_NONE;
91b2978a348073 David Hildenbrand 2023-12-20  3160 =20
91b2978a348073 David Hildenbrand 2023-12-20  3161  			folio_ref_add(folio, =
HPAGE_PMD_NR - 1);
91b2978a348073 David Hildenbrand 2023-12-20  3162  			if (anon_exclusive)
91b2978a348073 David Hildenbrand 2023-12-20  3163  				rmap_flags |=3D RMAP=
_EXCLUSIVE;
91b2978a348073 David Hildenbrand 2023-12-20  3164  			folio_add_anon_rmap_p=
tes(folio, page, HPAGE_PMD_NR,
cbef1d0b647d13 Kiryl Shutsemau   2026-02-12  3165  						 vma, rmap_flags);
91b2978a348073 David Hildenbrand 2023-12-20  3166  		}
9d84604b845c38 Hugh Dickins      2022-03-22  3167  	}
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3168 =20
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3169  	/*
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3170  	 * Withdraw the table o=
nly after we mark the pmd entry invalid.
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3171  	 * This's critical for =
some architectures (Power).
423ac9af3ceff9 Aneesh Kumar K.V  2018-01-31  3172  	 */
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3173  	pgtable =3D pgtable_tra=
ns_huge_withdraw(mm, pmd);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3174  	pmd_populate(mm, &_pmd,=
 pgtable);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3175 =20
c9c1ee20ee84b1 Hugh Dickins      2023-06-08  3176  	pte =3D pte_offset_map(=
&_pmd, haddr);
c9c1ee20ee84b1 Hugh Dickins      2023-06-08  3177  	VM_BUG_ON(!pte);
2bdba9868a4ffc Ryan Roberts      2024-02-15  3178 =20
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3179  	/*
2bdba9868a4ffc Ryan Roberts      2024-02-15  3180  	 * Note that NUMA hinti=
ng access restrictions are not transferred to
2bdba9868a4ffc Ryan Roberts      2024-02-15  3181  	 * avoid any possibilit=
y of altering permissions across VMAs.
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3182  	 */
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3183  	if (freeze || pmd_is_mi=
gration_entry(old_pmd)) {
2bdba9868a4ffc Ryan Roberts      2024-02-15  3184  		pte_t entry;
ba98828088ad3f Kiryl Shutsemau   2016-01-15  3185  		swp_entry_t swp_entry;
2bdba9868a4ffc Ryan Roberts      2024-02-15  3186 =20
1462872900233e Balbir Singh      2025-10-01  3187  		for (i =3D 0, addr =3D =
haddr; i < HPAGE_PMD_NR; i++, addr +=3D PAGE_SIZE) {
4dd845b5a3e57a Alistair Popple   2021-06-30  3188  			if (write)
4dd845b5a3e57a Alistair Popple   2021-06-30  3189  				swp_entry =3D make_w=
ritable_migration_entry(
4dd845b5a3e57a Alistair Popple   2021-06-30  3190  							page_to_pfn(page =
+ i));
6c287605fd5646 David Hildenbrand 2022-05-09  3191  			else if (anon_exclusi=
ve)
6c287605fd5646 David Hildenbrand 2022-05-09  3192  				swp_entry =3D make_r=
eadable_exclusive_migration_entry(
6c287605fd5646 David Hildenbrand 2022-05-09  3193  							page_to_pfn(page =
+ i));
4dd845b5a3e57a Alistair Popple   2021-06-30  3194  			else
4dd845b5a3e57a Alistair Popple   2021-06-30  3195  				swp_entry =3D make_r=
eadable_migration_entry(
4dd845b5a3e57a Alistair Popple   2021-06-30  3196  							page_to_pfn(page =
+ i));
2e3468778dbe3e Peter Xu          2022-08-11  3197  			if (young)
2e3468778dbe3e Peter Xu          2022-08-11  3198  				swp_entry =3D make_m=
igration_entry_young(swp_entry);
2e3468778dbe3e Peter Xu          2022-08-11  3199  			if (dirty)
2e3468778dbe3e Peter Xu          2022-08-11  3200  				swp_entry =3D make_m=
igration_entry_dirty(swp_entry);
ba98828088ad3f Kiryl Shutsemau   2016-01-15  3201  			entry =3D swp_entry_t=
o_pte(swp_entry);
804dd150468cfd Andrea Arcangeli  2016-08-25  3202  			if (soft_dirty)
804dd150468cfd Andrea Arcangeli  2016-08-25  3203  				entry =3D pte_swp_mk=
soft_dirty(entry);
f45ec5ff16a75f Peter Xu          2020-04-06  3204  			if (uffd_wp)
f45ec5ff16a75f Peter Xu          2020-04-06  3205  				entry =3D pte_swp_mk=
uffd_wp(entry);
2bdba9868a4ffc Ryan Roberts      2024-02-15  3206  			VM_WARN_ON(!pte_none(=
ptep_get(pte + i)));
2bdba9868a4ffc Ryan Roberts      2024-02-15  3207  			set_pte_at(mm, addr, =
pte + i, entry);
2bdba9868a4ffc Ryan Roberts      2024-02-15  3208  		}
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3209  	} else if (pmd_is_devic=
e_private_entry(old_pmd)) {
2bdba9868a4ffc Ryan Roberts      2024-02-15  3210  		pte_t entry;
1462872900233e Balbir Singh      2025-10-01  3211  		swp_entry_t swp_entry;
2bdba9868a4ffc Ryan Roberts      2024-02-15  3212 =20
1462872900233e Balbir Singh      2025-10-01  3213  		for (i =3D 0, addr =3D =
haddr; i < HPAGE_PMD_NR; i++, addr +=3D PAGE_SIZE) {
1462872900233e Balbir Singh      2025-10-01  3214  			/*
1462872900233e Balbir Singh      2025-10-01  3215  			 * anon_exclusive was=
 already propagated to the relevant
1462872900233e Balbir Singh      2025-10-01  3216  			 * pages correspondin=
g to the pte entries when freeze
1462872900233e Balbir Singh      2025-10-01  3217  			 * is false.
1462872900233e Balbir Singh      2025-10-01  3218  			 */
1462c52e9f2b99 David Hildenbrand 2023-04-11  3219  			if (write)
1462872900233e Balbir Singh      2025-10-01  3220  				swp_entry =3D make_w=
ritable_device_private_entry(
1462872900233e Balbir Singh      2025-10-01  3221  							page_to_pfn(page =
+ i));
1462872900233e Balbir Singh      2025-10-01  3222  			else
1462872900233e Balbir Singh      2025-10-01  3223  				swp_entry =3D make_r=
eadable_device_private_entry(
1462872900233e Balbir Singh      2025-10-01  3224  							page_to_pfn(page =
+ i));
1462872900233e Balbir Singh      2025-10-01  3225  			/*
1462872900233e Balbir Singh      2025-10-01  3226  			 * Young and dirty bi=
ts are not progated via swp_entry
1462872900233e Balbir Singh      2025-10-01  3227  			 */
1462872900233e Balbir Singh      2025-10-01  3228  			entry =3D swp_entry_t=
o_pte(swp_entry);
1462872900233e Balbir Singh      2025-10-01  3229  			if (soft_dirty)
1462872900233e Balbir Singh      2025-10-01  3230  				entry =3D pte_swp_mk=
soft_dirty(entry);
1462872900233e Balbir Singh      2025-10-01  3231  			if (uffd_wp)
1462872900233e Balbir Singh      2025-10-01  3232  				entry =3D pte_swp_mk=
uffd_wp(entry);
2bdba9868a4ffc Ryan Roberts      2024-02-15  3233  			VM_WARN_ON(!pte_none(=
ptep_get(pte + i)));
2bdba9868a4ffc Ryan Roberts      2024-02-15  3234  			set_pte_at(mm, addr, =
pte + i, entry);
2bdba9868a4ffc Ryan Roberts      2024-02-15  3235  		}
ba98828088ad3f Kiryl Shutsemau   2016-01-15  3236  	} else {
2bdba9868a4ffc Ryan Roberts      2024-02-15  3237  		pte_t entry;
2bdba9868a4ffc Ryan Roberts      2024-02-15  3238 =20
2bdba9868a4ffc Ryan Roberts      2024-02-15  3239  		entry =3D mk_pte(page,=
 READ_ONCE(vma->vm_page_prot));
1462c52e9f2b99 David Hildenbrand 2023-04-11  3240  		if (write)
161e393c0f6359 Rick Edgecombe    2023-06-12  3241  			entry =3D pte_mkwrite=
(entry, vma);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3242  		if (!young)
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3243  			entry =3D pte_mkold(e=
ntry);
e833bc50340502 Peter Xu          2022-11-25  3244  		/* NOTE: this may set =
soft-dirty too on some archs */
e833bc50340502 Peter Xu          2022-11-25  3245  		if (dirty)
e833bc50340502 Peter Xu          2022-11-25  3246  			entry =3D pte_mkdirty=
(entry);
804dd150468cfd Andrea Arcangeli  2016-08-25  3247  		if (soft_dirty)
804dd150468cfd Andrea Arcangeli  2016-08-25  3248  			entry =3D pte_mksoft_=
dirty(entry);
292924b2602474 Peter Xu          2020-04-06  3249  		if (uffd_wp)
292924b2602474 Peter Xu          2020-04-06  3250  			entry =3D pte_mkuffd_=
wp(entry);
2bdba9868a4ffc Ryan Roberts      2024-02-15  3251 =20
2bdba9868a4ffc Ryan Roberts      2024-02-15  3252  		for (i =3D 0; i < HPAG=
E_PMD_NR; i++)
2bdba9868a4ffc Ryan Roberts      2024-02-15  3253  			VM_WARN_ON(!pte_none(=
ptep_get(pte + i)));
2bdba9868a4ffc Ryan Roberts      2024-02-15  3254 =20
2bdba9868a4ffc Ryan Roberts      2024-02-15  3255  		set_ptes(mm, haddr, pt=
e, entry, HPAGE_PMD_NR);
ba98828088ad3f Kiryl Shutsemau   2016-01-15  3256  	}
2bdba9868a4ffc Ryan Roberts      2024-02-15  3257  	pte_unmap(pte);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3258 =20
0ac881efe16468 Lorenzo Stoakes   2025-11-10  3259  	if (!pmd_is_migration_e=
ntry(*pmd))
a8e61d584eda0d David Hildenbrand 2023-12-20  3260  		folio_remove_rmap_pmd(=
folio, page, vma);
96d82deb743ab4 Hugh Dickins      2022-11-22  3261  	if (freeze)
96d82deb743ab4 Hugh Dickins      2022-11-22  3262  		put_page(page);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3263 =20
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3264  	smp_wmb(); /* make pte =
visible before pmd */
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3265  	pmd_populate(mm, pmd, p=
gtable);
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3266  }
eef1b3ba053aa6 Kiryl Shutsemau   2016-01-15  3267 =20

:::::: The code at line 3098 was first introduced by commit
:::::: 1462872900233e58fb2f9fc8babc24a0d5c03fd9 mm/huge_memory: implement d=
evice-private THP splitting

:::::: TO: Balbir Singh <balbirs@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
