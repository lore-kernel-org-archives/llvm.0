Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437D145B06;
	Thu, 11 Apr 2024 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830071; cv=none; b=aLaA2kmIVZLjlS8uX5r25NuwbUmw9m1t7eh/RV0X2H29cKBLGio8IxD+/uvz+qz0gDmUQYNVsErfKmr72buapUVhCy8cD0SPJ+o8F7Tbcd7c/NWZ0U6ePeIim6bTqFYPvzozJOg5AWoXraaWXKrLcj443tnN9llNkzJ8Qn1rVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830071; c=relaxed/simple;
	bh=+8YJbyIE4HM2T5U1j98W7CiCeUoLx/XEjNZQm4TgIHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbfNfs+0wUaoyPZlxIJ1/TrwuIjJTafK8mLvFKXlpQWHvDj/+WZqCqd/KiKpsDaGozh79hn1ckB7aXQWMB05d6Nnw75pu+dV5Gl7BbaW73t6sjHfs+pFaz2ZvX6PzcCqqRWX/5dw7XAmmHtpsF4/3/8473FEGK6AZZ0aqj39aTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEQ0zJwa; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEQ0zJwa"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7e057fb0b69so2070121241.0;
        Thu, 11 Apr 2024 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712830067; x=1713434867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiGSHaogmvE7BjPhrrAUSU81lcIoLjHQAtEXKnyMgTo=;
        b=lEQ0zJwam+X6eBC7a8r8Hp/FPIMFSafMqbr9qYCXRCjXjKUFW+OEX8ZLoMm4pihlGm
         ZlEghYhnXpspt+0ibO6iGIKmv1+fXCZRKW2we6LexgaGuAlG+n62u1fzuDd+jHZy142D
         F/YXxiptgX7oS3VtSbCODvY4A9+b719wQAPwOTezfyoOejEqgLjgOzeXPq7fTqG3vhNI
         dAOZ6D3pIY86km6Ow8Z37aqMF3pXJ+qeOwYzTSVGnnZsRE7Jzie7TJgmVzFTWAvzQEd6
         Fay+3Uee49W1poxyxELYA3y03/TGmdgERt2OZOdJAmUQEd+RfHgodzit4ssV3/iy0ptu
         jAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830068; x=1713434868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiGSHaogmvE7BjPhrrAUSU81lcIoLjHQAtEXKnyMgTo=;
        b=OPnhBobVVUjbtlna79bQB5KRmaoK9cFB6EfD0gP6ue447Q6PUB7nrTxVEkypSc5/N9
         oWoGdFM+scVoxFnevS7opfMDbtSgC7pzUKQWTxu+xcQ7X6116qX6eggPALNoxxejF7DQ
         RMPb9I2mIO/eg80jbRV5rAbcdYS8nkg4Yf/eaMbI3/I3sBI0zObFC2QdQXfdWJ+VPN6o
         qPW57FkHYCa3fspcMZk4N7lXkig0qMqWVZx/GsVNVooXz9TDHHIQUructVwHScseJHE9
         EUur0kRJxIx9wvddtiUw/QHBeUsZB8K9LWVu2QnrEAqx6aQS647x7/68hbbQ6kWLTTXw
         rHDA==
X-Forwarded-Encrypted: i=1; AJvYcCVY39RNGXe3Ej/qDKcQdqoKBhE7tUhVqn4fpzELdBR/mfkvmK7LRUff0YXImxVZSsNb7EO0xl/JFZOywnkPtSGP2WWPzYkS88XUR7YKT9Fkg6aribesiOkYVk/ACN5W6nbXr38=
X-Gm-Message-State: AOJu0Yy8q8yRZcHKO7221js9JSB0PO7enFGm6Zn6OePdfsReJaJufBQF
	oRVUE8MnSFzC5gZoPSX1LcTvvMUf9KIfcGA3XX0xOPd/+BzjYDzo3qD48vcYB/5UpqBxOIC/p7+
	tYyz8UjruSYbHIZ2dIGdSnvjbb4I=
X-Google-Smtp-Source: AGHT+IFdpJ4H3R4yvyUrEl9pyWfA/Nb4f4miYziRNhM6pZzM46ycVD7H9Fmbn3gLx9ipEJRbwjWgpNUJ85P1txL5JWg=
X-Received: by 2002:a05:6102:e0c:b0:47a:3902:3f5d with SMTP id
 o12-20020a0561020e0c00b0047a39023f5dmr882882vst.23.1712830067476; Thu, 11 Apr
 2024 03:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404111716.GLefx4HG-lkp@intel.com>
In-Reply-To: <202404111716.GLefx4HG-lkp@intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 11 Apr 2024 22:07:35 +1200
Message-ID: <CAGsJ_4yEa0PJrwQmEEmcjaUAMSWgES7rPjNDh1_WAcnx3pwOwg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 364/372] mm/memory.c:4169:3: error: call to
 undeclared function 'count_mthp_stat'; ISO C99 and later do not support
 implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: Barry Song <v-songbaohua@oppo.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 9:50=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
> commit: 37a4ecbf36cbc84bb1aff0f9c81e58261f8826d9 [364/372] mm: add per-or=
der mTHP swpin_refault counter
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/2024041=
1/202404111716.GLefx4HG-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8=
b3b4a92adee40483c27f26c478a384cd69c6f05)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240411/202404111716.GLefx4HG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404111716.GLefx4HG-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/memory.c:44:
>    In file included from include/linux/mm.h:2254:
>    include/linux/vmstat.h:514:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from mm/memory.c:45:
>    In file included from include/linux/mm_inline.h:8:
>    include/linux/swap.h:565:6: warning: no previous prototype for functio=
n 'swap_free_nr' [-Wmissing-prototypes]
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          |      ^
>    include/linux/swap.h:565:1: note: declare 'static' if the function is =
not intended to be used outside of this translation unit
>      565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          | ^
>          | static
>    In file included from mm/memory.c:45:
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
>    In file included from mm/memory.c:84:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val =3D __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_=
IOBASE + addr));
>          |                                                         ~~~~~~=
~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from m=
acro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
>      102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
>          |                                                      ^
>    In file included from mm/memory.c:84:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_=
IOBASE + addr));
>          |                                                         ~~~~~~=
~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from m=
acro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
>      115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
>          |                                                      ^
>    In file included from mm/memory.c:84:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
>    include/asm-generic/io.h:693:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      693 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:701:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      701 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:709:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      709 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:718:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      718 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:727:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      727 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:736:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      736 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
> >> mm/memory.c:4169:3: error: call to undeclared function 'count_mthp_sta=
t'; ISO C99 and later do not support implicit function declarations [-Wimpl=
icit-function-declaration]
>     4169 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_=
ANON_SWPIN_REFAULT);
>          |                 ^
> >> mm/memory.c:4169:39: error: use of undeclared identifier 'MTHP_STAT_AN=
ON_SWPIN_REFAULT'
>     4169 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_=
ANON_SWPIN_REFAULT);
>          |                                                     ^
>    16 warnings and 2 errors generated.

Hi,
Thanks! SeongJae also reported this issue, and I had a fix here
https://lore.kernel.org/linux-mm/20240411014636.14023-1-21cnbao@gmail.com/

Can you please test it?

>
>
> vim +/count_mthp_stat +4169 mm/memory.c
>
>   3927
>   3928  /*
>   3929   * We enter with non-exclusive mmap_lock (to exclude vma changes,
>   3930   * but allow concurrent faults), and pte mapped but not yet locke=
d.
>   3931   * We return with pte unmapped and unlocked.
>   3932   *
>   3933   * We return with the mmap_lock locked or unlocked in the same ca=
ses
>   3934   * as does filemap_fault().
>   3935   */
>   3936  vm_fault_t do_swap_page(struct vm_fault *vmf)
>   3937  {
>   3938          struct vm_area_struct *vma =3D vmf->vma;
>   3939          struct folio *swapcache, *folio =3D NULL;
>   3940          struct page *page;
>   3941          struct swap_info_struct *si =3D NULL;
>   3942          rmap_t rmap_flags =3D RMAP_NONE;
>   3943          bool need_clear_cache =3D false;
>   3944          bool exclusive =3D false;
>   3945          swp_entry_t entry;
>   3946          pte_t pte;
>   3947          vm_fault_t ret =3D 0;
>   3948          void *shadow =3D NULL;
>   3949          int nr_pages =3D 1;
>   3950          unsigned long start_address =3D vmf->address;
>   3951          pte_t *start_pte =3D vmf->pte;
>   3952          bool any_swap_shared =3D false;
>   3953
>   3954          if (!pte_unmap_same(vmf))
>   3955                  goto out;
>   3956
>   3957          entry =3D pte_to_swp_entry(vmf->orig_pte);
>   3958          if (unlikely(non_swap_entry(entry))) {
>   3959                  if (is_migration_entry(entry)) {
>   3960                          migration_entry_wait(vma->vm_mm, vmf->pmd=
,
>   3961                                               vmf->address);
>   3962                  } else if (is_device_exclusive_entry(entry)) {
>   3963                          vmf->page =3D pfn_swap_entry_to_page(entr=
y);
>   3964                          ret =3D remove_device_exclusive_entry(vmf=
);
>   3965                  } else if (is_device_private_entry(entry)) {
>   3966                          if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>   3967                                  /*
>   3968                                   * migrate_to_ram is not yet read=
y to operate
>   3969                                   * under VMA lock.
>   3970                                   */
>   3971                                  vma_end_read(vma);
>   3972                                  ret =3D VM_FAULT_RETRY;
>   3973                                  goto out;
>   3974                          }
>   3975
>   3976                          vmf->page =3D pfn_swap_entry_to_page(entr=
y);
>   3977                          vmf->pte =3D pte_offset_map_lock(vma->vm_=
mm, vmf->pmd,
>   3978                                          vmf->address, &vmf->ptl);
>   3979                          if (unlikely(!vmf->pte ||
>   3980                                       !pte_same(ptep_get(vmf->pte)=
,
>   3981                                                          vmf->orig=
_pte)))
>   3982                                  goto unlock;
>   3983
>   3984                          /*
>   3985                           * Get a page reference while we know the=
 page can't be
>   3986                           * freed.
>   3987                           */
>   3988                          get_page(vmf->page);
>   3989                          pte_unmap_unlock(vmf->pte, vmf->ptl);
>   3990                          ret =3D vmf->page->pgmap->ops->migrate_to=
_ram(vmf);
>   3991                          put_page(vmf->page);
>   3992                  } else if (is_hwpoison_entry(entry)) {
>   3993                          ret =3D VM_FAULT_HWPOISON;
>   3994                  } else if (is_pte_marker_entry(entry)) {
>   3995                          ret =3D handle_pte_marker(vmf);
>   3996                  } else {
>   3997                          print_bad_pte(vma, vmf->address, vmf->ori=
g_pte, NULL);
>   3998                          ret =3D VM_FAULT_SIGBUS;
>   3999                  }
>   4000                  goto out;
>   4001          }
>   4002
>   4003          /* Prevent swapoff from happening to us. */
>   4004          si =3D get_swap_device(entry);
>   4005          if (unlikely(!si))
>   4006                  goto out;
>   4007
>   4008          folio =3D swap_cache_get_folio(entry, vma, vmf->address);
>   4009          if (folio)
>   4010                  page =3D folio_file_page(folio, swp_offset(entry)=
);
>   4011          swapcache =3D folio;
>   4012
>   4013          if (!folio) {
>   4014                  if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
>   4015                      __swap_count(entry) =3D=3D 1) {
>   4016                          /*
>   4017                           * Prevent parallel swapin from proceedin=
g with
>   4018                           * the cache flag. Otherwise, another thr=
ead may
>   4019                           * finish swapin first, free the entry, a=
nd swapout
>   4020                           * reusing the same entry. It's undetecta=
ble as
>   4021                           * pte_same() returns true due to entry r=
euse.
>   4022                           */
>   4023                          if (swapcache_prepare(entry)) {
>   4024                                  /* Relax a bit to prevent rapid r=
epeated page faults */
>   4025                                  schedule_timeout_uninterruptible(=
1);
>   4026                                  goto out;
>   4027                          }
>   4028                          need_clear_cache =3D true;
>   4029
>   4030                          /* skip swapcache */
>   4031                          folio =3D vma_alloc_folio(GFP_HIGHUSER_MO=
VABLE, 0,
>   4032                                                  vma, vmf->address=
, false);
>   4033                          page =3D &folio->page;
>   4034                          if (folio) {
>   4035                                  __folio_set_locked(folio);
>   4036                                  __folio_set_swapbacked(folio);
>   4037
>   4038                                  if (mem_cgroup_swapin_charge_foli=
o(folio,
>   4039                                                          vma->vm_m=
m, GFP_KERNEL,
>   4040                                                          entry)) {
>   4041                                          ret =3D VM_FAULT_OOM;
>   4042                                          goto out_page;
>   4043                                  }
>   4044                                  mem_cgroup_swapin_uncharge_swap(e=
ntry);
>   4045
>   4046                                  shadow =3D get_shadow_from_swap_c=
ache(entry);
>   4047                                  if (shadow)
>   4048                                          workingset_refault(folio,=
 shadow);
>   4049
>   4050                                  folio_add_lru(folio);
>   4051
>   4052                                  /* To provide entry to swap_read_=
folio() */
>   4053                                  folio->swap =3D entry;
>   4054                                  swap_read_folio(folio, true, NULL=
);
>   4055                                  folio->private =3D NULL;
>   4056                          }
>   4057                  } else {
>   4058                          page =3D swapin_readahead(entry, GFP_HIGH=
USER_MOVABLE,
>   4059                                                  vmf);
>   4060                          if (page)
>   4061                                  folio =3D page_folio(page);
>   4062                          swapcache =3D folio;
>   4063                  }
>   4064
>   4065                  if (!folio) {
>   4066                          /*
>   4067                           * Back out if somebody else faulted in t=
his pte
>   4068                           * while we released the pte lock.
>   4069                           */
>   4070                          vmf->pte =3D pte_offset_map_lock(vma->vm_=
mm, vmf->pmd,
>   4071                                          vmf->address, &vmf->ptl);
>   4072                          if (likely(vmf->pte &&
>   4073                                     pte_same(ptep_get(vmf->pte), v=
mf->orig_pte)))
>   4074                                  ret =3D VM_FAULT_OOM;
>   4075                          goto unlock;
>   4076                  }
>   4077
>   4078                  /* Had to read the page from swap area: Major fau=
lt */
>   4079                  ret =3D VM_FAULT_MAJOR;
>   4080                  count_vm_event(PGMAJFAULT);
>   4081                  count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
>   4082          } else if (PageHWPoison(page)) {
>   4083                  /*
>   4084                   * hwpoisoned dirty swapcache pages are kept for =
killing
>   4085                   * owner processes (which may be unknown at hwpoi=
son time)
>   4086                   */
>   4087                  ret =3D VM_FAULT_HWPOISON;
>   4088                  goto out_release;
>   4089          }
>   4090
>   4091          ret |=3D folio_lock_or_retry(folio, vmf);
>   4092          if (ret & VM_FAULT_RETRY)
>   4093                  goto out_release;
>   4094
>   4095          if (swapcache) {
>   4096                  /*
>   4097                   * Make sure folio_free_swap() or swapoff did not=
 release the
>   4098                   * swapcache from under us.  The page pin, and pt=
e_same test
>   4099                   * below, are not enough to exclude that.  Even i=
f it is still
>   4100                   * swapcache, we need to check that the page's sw=
ap has not
>   4101                   * changed.
>   4102                   */
>   4103                  if (unlikely(!folio_test_swapcache(folio) ||
>   4104                               page_swap_entry(page).val !=3D entry=
.val))
>   4105                          goto out_page;
>   4106
>   4107                  /*
>   4108                   * KSM sometimes has to copy on read faults, for =
example, if
>   4109                   * page->index of !PageKSM() pages would be nonli=
near inside the
>   4110                   * anon VMA -- PageKSM() is lost on actual swapou=
t.
>   4111                   */
>   4112                  folio =3D ksm_might_need_to_copy(folio, vma, vmf-=
>address);
>   4113                  if (unlikely(!folio)) {
>   4114                          ret =3D VM_FAULT_OOM;
>   4115                          folio =3D swapcache;
>   4116                          goto out_page;
>   4117                  } else if (unlikely(folio =3D=3D ERR_PTR(-EHWPOIS=
ON))) {
>   4118                          ret =3D VM_FAULT_HWPOISON;
>   4119                          folio =3D swapcache;
>   4120                          goto out_page;
>   4121                  }
>   4122                  if (folio !=3D swapcache)
>   4123                          page =3D folio_page(folio, 0);
>   4124
>   4125                  /*
>   4126                   * If we want to map a page that's in the swapcac=
he writable, we
>   4127                   * have to detect via the refcount if we're reall=
y the exclusive
>   4128                   * owner. Try removing the extra reference from t=
he local LRU
>   4129                   * caches if required.
>   4130                   */
>   4131                  if ((vmf->flags & FAULT_FLAG_WRITE) && folio =3D=
=3D swapcache &&
>   4132                      !folio_test_ksm(folio) && !folio_test_lru(fol=
io))
>   4133                          lru_add_drain();
>   4134          }
>   4135
>   4136          folio_throttle_swaprate(folio, GFP_KERNEL);
>   4137
>   4138          /*
>   4139           * Back out if somebody else already faulted in this pte.
>   4140           */
>   4141          vmf->pte =3D pte_offset_map_lock(vma->vm_mm, vmf->pmd, vm=
f->address,
>   4142                          &vmf->ptl);
>   4143
>   4144          /* We hit large folios in swapcache */
>   4145          if (start_pte && folio_test_large(folio) && folio_test_sw=
apcache(folio)) {
>   4146                  int nr =3D folio_nr_pages(folio);
>   4147                  int idx =3D folio_page_idx(folio, page);
>   4148                  unsigned long folio_start =3D vmf->address - idx =
* PAGE_SIZE;
>   4149                  unsigned long folio_end =3D folio_start + nr * PA=
GE_SIZE;
>   4150                  pte_t *folio_ptep;
>   4151                  pte_t folio_pte;
>   4152
>   4153                  if (unlikely(folio_start < max(vmf->address & PMD=
_MASK, vma->vm_start)))
>   4154                          goto check_pte;
>   4155                  if (unlikely(folio_end > pmd_addr_end(vmf->addres=
s, vma->vm_end)))
>   4156                          goto check_pte;
>   4157
>   4158                  folio_ptep =3D vmf->pte - idx;
>   4159                  folio_pte =3D ptep_get(folio_ptep);
>   4160                  if (!is_swap_pte(folio_pte) || non_swap_entry(pte=
_to_swp_entry(folio_pte)) ||
>   4161                      swap_pte_batch(folio_ptep, nr, folio_pte, &an=
y_swap_shared) !=3D nr)
>   4162                          goto check_pte;
>   4163
>   4164                  start_address =3D folio_start;
>   4165                  start_pte =3D folio_ptep;
>   4166                  nr_pages =3D nr;
>   4167                  entry =3D folio->swap;
>   4168                  page =3D &folio->page;
> > 4169                  count_mthp_stat(folio_order(folio), MTHP_STAT_ANO=
N_SWPIN_REFAULT);
>   4170          }
>   4171
>   4172  check_pte:
>   4173          if (unlikely(!vmf->pte || !pte_same(ptep_get(vmf->pte), v=
mf->orig_pte)))
>   4174                  goto out_nomap;
>   4175
>   4176          if (unlikely(!folio_test_uptodate(folio))) {
>   4177                  ret =3D VM_FAULT_SIGBUS;
>   4178                  goto out_nomap;
>   4179          }
>   4180
>   4181          /*
>   4182           * PG_anon_exclusive reuses PG_mappedtodisk for anon page=
s. A swap pte
>   4183           * must never point at an anonymous page in the swapcache=
 that is
>   4184           * PG_anon_exclusive. Sanity check that this holds and es=
pecially, that
>   4185           * no filesystem set PG_mappedtodisk on a page in the swa=
pcache. Sanity
>   4186           * check after taking the PT lock and making sure that no=
body
>   4187           * concurrently faulted in this page and set PG_anon_excl=
usive.
>   4188           */
>   4189          BUG_ON(!folio_test_anon(folio) && folio_test_mappedtodisk=
(folio));
>   4190          BUG_ON(folio_test_anon(folio) && PageAnonExclusive(page))=
;
>   4191
>   4192          /*
>   4193           * Check under PT lock (to protect against concurrent for=
k() sharing
>   4194           * the swap entry concurrently) for certainly exclusive p=
ages.
>   4195           */
>   4196          if (!folio_test_ksm(folio)) {
>   4197                  exclusive =3D pte_swp_exclusive(vmf->orig_pte);
>   4198                  if (folio !=3D swapcache) {
>   4199                          /*
>   4200                           * We have a fresh page that is not expos=
ed to the
>   4201                           * swapcache -> certainly exclusive.
>   4202                           */
>   4203                          exclusive =3D true;
>   4204                  } else if (exclusive && folio_test_writeback(foli=
o) &&
>   4205                            data_race(si->flags & SWP_STABLE_WRITES=
)) {
>   4206                          /*
>   4207                           * This is tricky: not all swap backends =
support
>   4208                           * concurrent page modifications while un=
der writeback.
>   4209                           *
>   4210                           * So if we stumble over such a page in t=
he swapcache
>   4211                           * we must not set the page exclusive, ot=
herwise we can
>   4212                           * map it writable without further checks=
 and modify it
>   4213                           * while still under writeback.
>   4214                           *
>   4215                           * For these problematic swap backends, s=
imply drop the
>   4216                           * exclusive marker: this is perfectly fi=
ne as we start
>   4217                           * writeback only if we fully unmapped th=
e page and
>   4218                           * there are no unexpected references on =
the page after
>   4219                           * unmapping succeeded. After fully unmap=
ped, no
>   4220                           * further GUP references (FOLL_GET and F=
OLL_PIN) can
>   4221                           * appear, so dropping the exclusive mark=
er and mapping
>   4222                           * it only R/O is fine.
>   4223                           */
>   4224                          exclusive =3D false;
>   4225                  }
>   4226
>   4227                  /* Reuse the whole large folio iff all entries ar=
e exclusive */
>   4228                  if (nr_pages > 1 && any_swap_shared)
>   4229                          exclusive =3D false;
>   4230          }
>   4231
>   4232          /*
>   4233           * Some architectures may have to restore extra metadata =
to the page
>   4234           * when reading from swap. This metadata may be indexed b=
y swap entry
>   4235           * so this must be called before swap_free().
>   4236           */
>   4237          arch_swap_restore(folio_swap(entry, folio), folio);
>   4238
>   4239          /*
>   4240           * Remove the swap entry and conditionally try to free up=
 the swapcache.
>   4241           * We're already holding a reference on the page but have=
n't mapped it
>   4242           * yet.
>   4243           */
>   4244          swap_free_nr(entry, nr_pages);
>   4245          if (should_try_to_free_swap(folio, vma, vmf->flags))
>   4246                  folio_free_swap(folio);
>   4247
>   4248          folio_ref_add(folio, nr_pages - 1);
>   4249          add_mm_counter(vma->vm_mm, MM_ANONPAGES, nr_pages);
>   4250          add_mm_counter(vma->vm_mm, MM_SWAPENTS, -nr_pages);
>   4251
>   4252          pte =3D mk_pte(page, vma->vm_page_prot);
>   4253
>   4254          /*
>   4255           * Same logic as in do_wp_page(); however, optimize for p=
ages that are
>   4256           * certainly not shared either because we just allocated =
them without
>   4257           * exposing them to the swapcache or because the swap ent=
ry indicates
>   4258           * exclusivity.
>   4259           */
>   4260          if (!folio_test_ksm(folio) &&
>   4261              (exclusive || (folio_ref_count(folio) =3D=3D nr_pages=
 &&
>   4262                             folio_nr_pages(folio) =3D=3D nr_pages)=
)) {
>   4263                  if (vmf->flags & FAULT_FLAG_WRITE) {
>   4264                          pte =3D maybe_mkwrite(pte_mkdirty(pte), v=
ma);
>   4265                          vmf->flags &=3D ~FAULT_FLAG_WRITE;
>   4266                  }
>   4267                  rmap_flags |=3D RMAP_EXCLUSIVE;
>   4268          }
>   4269          flush_icache_pages(vma, page, nr_pages);
>   4270          if (pte_swp_soft_dirty(vmf->orig_pte))
>   4271                  pte =3D pte_mksoft_dirty(pte);
>   4272          if (pte_swp_uffd_wp(vmf->orig_pte))
>   4273                  pte =3D pte_mkuffd_wp(pte);
>   4274
>   4275          /* ksm created a completely new copy */
>   4276          if (unlikely(folio !=3D swapcache && swapcache)) {
>   4277                  folio_add_new_anon_rmap(folio, vma, start_address=
);
>   4278                  folio_add_lru_vma(folio, vma);
>   4279          } else {
>   4280                  folio_add_anon_rmap_ptes(folio, page, nr_pages, v=
ma, start_address,
>   4281                                           rmap_flags);
>   4282          }
>   4283
>   4284          VM_BUG_ON(!folio_test_anon(folio) ||
>   4285                          (pte_write(pte) && !PageAnonExclusive(pag=
e)));
>   4286          set_ptes(vma->vm_mm, start_address, start_pte, pte, nr_pa=
ges);
>   4287          vmf->orig_pte =3D ptep_get(vmf->pte);
>   4288          arch_do_swap_page(vma->vm_mm, vma, start_address, pte, pt=
e);
>   4289
>   4290          folio_unlock(folio);
>   4291          if (folio !=3D swapcache && swapcache) {
>   4292                  /*
>   4293                   * Hold the lock to avoid the swap entry to be re=
used
>   4294                   * until we take the PT lock for the pte_same() c=
heck
>   4295                   * (to avoid false positives from pte_same). For
>   4296                   * further safety release the lock after the swap=
_free
>   4297                   * so that the swap count won't change under a
>   4298                   * parallel locked swapcache.
>   4299                   */
>   4300                  folio_unlock(swapcache);
>   4301                  folio_put(swapcache);
>   4302          }
>   4303
>   4304          if (vmf->flags & FAULT_FLAG_WRITE) {
>   4305                  ret |=3D do_wp_page(vmf);
>   4306                  if (ret & VM_FAULT_ERROR)
>   4307                          ret &=3D VM_FAULT_ERROR;
>   4308                  goto out;
>   4309          }
>   4310
>   4311          /* No need to invalidate - it was non-present before */
>   4312          update_mmu_cache_range(vmf, vma, start_address, start_pte=
, nr_pages);
>   4313  unlock:
>   4314          if (vmf->pte)
>   4315                  pte_unmap_unlock(vmf->pte, vmf->ptl);
>   4316  out:
>   4317          /* Clear the swap cache pin for direct swapin after PTL u=
nlock */
>   4318          if (need_clear_cache)
>   4319                  swapcache_clear(si, entry);
>   4320          if (si)
>   4321                  put_swap_device(si);
>   4322          return ret;
>   4323  out_nomap:
>   4324          if (vmf->pte)
>   4325                  pte_unmap_unlock(vmf->pte, vmf->ptl);
>   4326  out_page:
>   4327          folio_unlock(folio);
>   4328  out_release:
>   4329          folio_put(folio);
>   4330          if (folio !=3D swapcache && swapcache) {
>   4331                  folio_unlock(swapcache);
>   4332                  folio_put(swapcache);
>   4333          }
>   4334          if (need_clear_cache)
>   4335                  swapcache_clear(si, entry);
>   4336          if (si)
>   4337                  put_swap_device(si);
>   4338          return ret;
>   4339  }
>   4340
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
