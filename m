Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E31A9F88
	for <llvm@lists.linux.dev>; Sat, 28 Feb 2026 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772239833; cv=pass; b=h8NCWwIz6tN2WNj+w+i+i6CAEGrX4Dq+OF8aqQ6DTvANx5WErWXIirivaces4A1ZUCLcTneJ3hwqFvpMkaIQNIL8XTsCGw0sagpfXF8u4MiqyzpFcOXjJg7/WzqfLjl4jDHlLG9Gc3ty+VMaNjJ5Ujrrw1lJWF0Vb4Ab2dclwMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772239833; c=relaxed/simple;
	bh=PSDN5yCVC0BV5bcehZDaSuIfMZf1xLmUhw94alfFXlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBpThi6UB3+2th+SUmpqpfKcZWgiNSLqCrWmIhUw/3j+JfXbZNAdXlihxKgulZqsyPQCYhyn1Co7q4gaWLNju1r9P24lnDpOKDO/wyODyPm4QgSWh64VKCuMlyCh+4AfY04g4yrpdOX4z8sg3FE2nR4WY/0zCSt8Xfr1onjAZVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqpQHtV8; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqpQHtV8"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3870a403a92so3379861fa.3
        for <llvm@lists.linux.dev>; Fri, 27 Feb 2026 16:50:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772239830; cv=none;
        d=google.com; s=arc-20240605;
        b=NPmTZZ9IOghl1zTS6mUjVm6b2ZHY2lAlJjwrxtu/HT7ptg60skm2qkul7pJBKEf2WM
         tNxpqyFTMHvRkQZRh+WUJOV2FPo/q9pDVtwEz+22SjI0jFaoqt/R3feoidYA/de9Z11l
         oiEdYiG+cgxirYTuTSqLXBToZvKaaWGXunHjG8LuqDOFyBSAHXgjLYpARjZbuZ4bHXRh
         csOf44TmcdgcflDGLkcMqg1FJogKMPgVf2OK1JFyDe6lu8ASwc6fp2eMZ24tUbpeqNkt
         B6hZ9DH43O4TCnndoAFpTtNwdH1udOQF65r02okDxRPI6kpaT4YkfuWzHaA26aKrhvmQ
         JmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTVB5dWAl7VOze+/PX3CwHaUaq1aNmGLz1j8IVekX6I=;
        fh=OjP5xi8JReMkp2DFACWSyFQQdoLsksM8/OsL1ToOQMw=;
        b=YfKViJmqF1qdLwNP1DVnTi4J3DoL/5p/ymyiW4BbLJrfo9o6rShnO7FFwTUlmrO9b1
         Ar6U86keBCbhYoxsMIk+vPeE9oQqDu01s33PqdpET/mfW+uxndO7ytKjI8lnJDfyjNZ5
         xToy53MEJHqHZJ7tLygaFa3DyfAIhwThwfiQaNXxMuYPR9bgQru6YvNIMGPSOOsgkTRS
         0N90RYYaI3Mh8GcGrDUJLkfFfv6v1BUlRhvxfVQlJcP6Cn+8aAnOX4AGxu7PUJwvWtOw
         4/wmXMKPPQVn96ucyiIFhvDcGpiBh8vP8fTnUotMgObywXIUzuMy0/krswYarfOysvEc
         s8cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772239830; x=1772844630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTVB5dWAl7VOze+/PX3CwHaUaq1aNmGLz1j8IVekX6I=;
        b=fqpQHtV86jRPwnGGTt+TvXwZXtPIYhQj7I0iaXcXA48G1wHszla0WpGld48G/4BNod
         5LUdh7m7YMR82Oh9K/4jhXWKNXSdhXTGLhXEq5pn2F09NTTMQnQkBQq7mZ5mLVoyNlCj
         YBPSqH9INnGd4f/O4thziRVcP8Hd3U4RAnz3LX1Xr89KhIpq90t/Ngf/Zhdx9RvzokeQ
         g9MBuJaCKzNoMFQYPjNGD+EJWVGEKcS0YMc0BQnjMSVEhy0fGuhQeLmu/iDaLYmrjXqR
         BlFyhJ0V8m2BCTFYwAadGehpDgzUNFUgWNWhBLh86Z2rMCJ9aQW2iuTl+WU4a+hyU2kt
         2XlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772239830; x=1772844630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GTVB5dWAl7VOze+/PX3CwHaUaq1aNmGLz1j8IVekX6I=;
        b=O4CrhK/+f2QjTOT9SLlvTxmCHNs5P5E7khyJMEV239iOcncdoMTjFKnPbXTQrSdDcf
         mSKinkHmmIowjsihxQbwTvr0OUb17hb9om6Dd31KXIWz4WcM24J9CjPGf3wm9bf+Z9PQ
         x1mBGut1bCGtXAcsR+W+Bynv7H9mI6bdSPDe8K/AN6MfSuRTOam20nGplg8o4d0+ioj1
         UI4dC9sUKUqPnXheoBwP7lEPTJUi7o3C/mAOM7tRBCitCnH9bdz3X8OW8+gvKgB0UoqT
         La7R+HXFxPr23le03RjGtF/FLaknBsiUETVwp4kUsKWcFFJlI2G25AHjBGz5vyLvzWQL
         /ZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGJ9+P1raPdFm5disFdOMALMFVhlzV7xk/HcNinN0snd1bkBnjErtcls4YFy7Nk5WZyrPp@lists.linux.dev
X-Gm-Message-State: AOJu0YwIUuwsTDjoi8zeEk9hmM5iDNIz4umoKnghdO2E76Y4uo9oCE4+
	l1Dlfb2YP3Po4v8Q/5ixTLD/XsmInytjKAimboCCGvXAFi1C2/BRVfdkqyUO49Q+NOJli4pKwdH
	n9a58669aEBtUlcVTiokOpQiNqaU9wX0=
X-Gm-Gg: ATEYQzzD8egAjqCLm7mTQSa0Pu5A6Y7SNUtG+UpRrpdOVU/XqMghzE1ZUNJz8wufHMC
	tIPwNDRr+jKRPpA/olY+dgA8N+D3BQBc3BCvsPt/eAwks6ZjN75dIkWvOizPL56agtfsiEYNTr8
	uCBbv4lorf6PVwNfBQYopY4eoWGJytuQR94s0yaCXMTPs4hFaTtg4x9413058eS0IDI04U5KnqQ
	j1Oa9WoBpGENH+kO/AULngE/yP3f6YklWrtAj1johC5EeEuzLitWCYQ6mypz2Y4eyHSIV6+Xqq8
	Ndat1nKeFv+lqPwpPBo=
X-Received: by 2002:a05:651c:4211:b0:385:c05a:4814 with SMTP id
 38308e7fff4ca-389ff34df78mr13920551fa.4.1772239829430; Fri, 27 Feb 2026
 16:50:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227075250.1128175-1-zhaoyang.huang@unisoc.com> <202602271916.OBNa34QU-lkp@intel.com>
In-Reply-To: <202602271916.OBNa34QU-lkp@intel.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Sat, 28 Feb 2026 08:50:17 +0800
X-Gm-Features: AaiRm53m8KqzIMzrmY-RAKJ4NM9-fml6sIeBsXd4k5lqshVtOo5_TL5oO80n_ns
Message-ID: <CAGWkznEBBRCNyxxXvcUnjJacxp1-UMcW6DS9YnhpAFntFo1H0g@mail.gmail.com>
Subject: Re: [PATCH] mm: bail out when the PMD has been set in bloom filter
To: kernel test robot <lkp@intel.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org, steve.kang@unisoc.com, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 7:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi zhaoyang.huang,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-=
bail-out-when-the-PMD-has-been-set-in-bloom-filter/20260227-155729
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/20260227075250.1128175-1-zhaoyan=
g.huang%40unisoc.com
> patch subject: [PATCH] mm: bail out when the PMD has been set in bloom fi=
lter
> config: sparc64-randconfig-002-20260227 (https://download.01.org/0day-ci/=
archive/20260227/202602271916.OBNa34QU-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9=
a109fbb6e184ec9bcce10615949f598f4c974a9)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260227/202602271916.OBNa34QU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602271916.OBNa34QU-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/vmscan.c:4206:24: warning: variable 'mm_state' is uninitialized whe=
n used here [-Wuninitialized]
>     4206 |         if (test_bloom_filter(mm_state, max_seq, pvmw->pmd))
>          |                               ^~~~~~~~
>    mm/vmscan.c:4185:35: note: initialize the variable 'mm_state' to silen=
ce this warning
>     4185 |         struct lru_gen_mm_state *mm_state;
>          |                                          ^
>          |                                           =3D NULL
> >> mm/vmscan.c:4206:34: warning: variable 'max_seq' is uninitialized when=
 used here [-Wuninitialized]
>     4206 |         if (test_bloom_filter(mm_state, max_seq, pvmw->pmd))
>          |                                         ^~~~~~~
>    mm/vmscan.c:4186:23: note: initialize the variable 'max_seq' to silenc=
e this warning
>     4186 |         unsigned long max_seq;
>          |                              ^
>          |                               =3D 0
>    2 warnings generated.
>
>
> vim +/mm_state +4206 mm/vmscan.c
>
>   4157
>   4158  /****************************************************************=
**************
>   4159   *                          rmap/PT walk feedback
>   4160   ****************************************************************=
**************/
>   4161
>   4162  /*
>   4163   * This function exploits spatial locality when shrink_folio_list=
() walks the
>   4164   * rmap. It scans the adjacent PTEs of a young PTE and promotes h=
ot pages. If
>   4165   * the scan was done cacheline efficiently, it adds the PMD entry=
 pointing to
>   4166   * the PTE table to the Bloom filter. This forms a feedback loop =
between the
>   4167   * eviction and the aging.
>   4168   */
>   4169  bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>   4170  {
>   4171          int i;
>   4172          bool dirty;
>   4173          unsigned long start;
>   4174          unsigned long end;
>   4175          struct lru_gen_mm_walk *walk;
>   4176          struct folio *last =3D NULL;
>   4177          int young =3D 1;
>   4178          pte_t *pte =3D pvmw->pte;
>   4179          unsigned long addr =3D pvmw->address;
>   4180          struct vm_area_struct *vma =3D pvmw->vma;
>   4181          struct folio *folio =3D pfn_folio(pvmw->pfn);
>   4182          struct mem_cgroup *memcg;
>   4183          struct pglist_data *pgdat =3D folio_pgdat(folio);
>   4184          struct lruvec *lruvec;
>   4185          struct lru_gen_mm_state *mm_state;
>   4186          unsigned long max_seq;
>   4187          int gen;
>   4188
>   4189          lockdep_assert_held(pvmw->ptl);
>   4190          VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
>   4191
>   4192          if (!ptep_clear_young_notify(vma, addr, pte))
>   4193                  return false;
>   4194
>   4195          if (spin_is_contended(pvmw->ptl))
>   4196                  return true;
>   4197
>   4198          /* exclude special VMAs containing anon pages from COW */
>   4199          if (vma->vm_flags & VM_SPECIAL)
>   4200                  return true;
>   4201
>   4202          /* avoid taking the LRU lock under the PTL when possible =
*/
>   4203          walk =3D current->reclaim_state ? current->reclaim_state-=
>mm_walk : NULL;
>   4204
>   4205          /* may the pmd has been set in bloom filter */
> > 4206          if (test_bloom_filter(mm_state, max_seq, pvmw->pmd))
>   4207                  return true;
>   4208
>   4209          start =3D max(addr & PMD_MASK, vma->vm_start);
>   4210          end =3D min(addr | ~PMD_MASK, vma->vm_end - 1) + 1;
>   4211
>   4212          if (end - start =3D=3D PAGE_SIZE)
>   4213                  return true;
>   4214
>   4215          if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
>   4216                  if (addr - start < MIN_LRU_BATCH * PAGE_SIZE / 2)
>   4217                          end =3D start + MIN_LRU_BATCH * PAGE_SIZE=
;
>   4218                  else if (end - addr < MIN_LRU_BATCH * PAGE_SIZE /=
 2)
>   4219                          start =3D end - MIN_LRU_BATCH * PAGE_SIZE=
;
>   4220                  else {
>   4221                          start =3D addr - MIN_LRU_BATCH * PAGE_SIZ=
E / 2;
>   4222                          end =3D addr + MIN_LRU_BATCH * PAGE_SIZE =
/ 2;
>   4223                  }
>   4224          }
>   4225
>   4226          memcg =3D get_mem_cgroup_from_folio(folio);
>   4227          lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
>   4228          max_seq =3D READ_ONCE((lruvec)->lrugen.max_seq);
>   4229          gen =3D lru_gen_from_seq(max_seq);
>   4230          mm_state =3D get_mm_state(lruvec);
I am confused about the code base which this test is based on. By
checking the base that listed above and linux-next and 7.1-rc1, I
can't find above merged result or I miss anything?
>   4231
>   4232          lazy_mmu_mode_enable();
>   4233
>   4234          pte -=3D (addr - start) / PAGE_SIZE;
>   4235
>   4236          for (i =3D 0, addr =3D start; addr !=3D end; i++, addr +=
=3D PAGE_SIZE) {
>   4237                  unsigned long pfn;
>   4238                  pte_t ptent =3D ptep_get(pte + i);
>   4239
>   4240                  pfn =3D get_pte_pfn(ptent, vma, addr, pgdat);
>   4241                  if (pfn =3D=3D -1)
>   4242                          continue;
>   4243
>   4244                  folio =3D get_pfn_folio(pfn, memcg, pgdat);
>   4245                  if (!folio)
>   4246                          continue;
>   4247
>   4248                  if (!ptep_clear_young_notify(vma, addr, pte + i))
>   4249                          continue;
>   4250
>   4251                  if (last !=3D folio) {
>   4252                          walk_update_folio(walk, last, gen, dirty)=
;
>   4253
>   4254                          last =3D folio;
>   4255                          dirty =3D false;
>   4256                  }
>   4257
>   4258                  if (pte_dirty(ptent))
>   4259                          dirty =3D true;
>   4260
>   4261                  young++;
>   4262          }
>   4263
>   4264          walk_update_folio(walk, last, gen, dirty);
>   4265
>   4266          lazy_mmu_mode_disable();
>   4267
>   4268          /* feedback from rmap walkers to page table walkers */
>   4269          if (mm_state && suitable_to_scan(i, young))
>   4270                  update_bloom_filter(mm_state, max_seq, pvmw->pmd)=
;
>   4271
>   4272          mem_cgroup_put(memcg);
>   4273
>   4274          return true;
>   4275  }
>   4276
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
