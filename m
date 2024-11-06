Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54613A26F;
	Wed,  6 Nov 2024 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730922871; cv=none; b=BBNNzM286bvOK30YiXxFLVOmqQpZSTjaLk7olGb91XxWnBZZNDN+jEyKq6tRhbuFcdFN4aQcAvJpJi+OE/zLesA5QqlXAsp7Zy7YYObKItfEcUQVn8Lhh1d7rKPO8SVlx+DCqOjnYIU2OV+HGy5koZN76eF42gj8mEl4U5YbVVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730922871; c=relaxed/simple;
	bh=epIfpsPSQ9YWAfMA+W8vnyDry8+ptr0MOLOeZqf7RXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXF/m4KY1sXw+josqs8glgYcGnr62ISNOMa8oRTea7ZGE6vpB1WDcBPr0UqhelKXQaA/tmElnCP807dCPSMnb9fvygKqi+p5xhiVjlb/wfeg8TMVydYnjy4wuJ57jV3/1RM9To0U8SUKxN/7hJF9W5uEUM50wzFTHA3bS1uOs1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls3sZJqs; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls3sZJqs"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-84fcfe29e09so39625241.2;
        Wed, 06 Nov 2024 11:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730922869; x=1731527669; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8djmRG6h4bc+SzaVCVnhZXth6QCnXFelnjwgthXVPkM=;
        b=ls3sZJqsgPsEpPOYQAFvQW2VvmxD+x0lO5Ybjp44UhdS1virmFYNeZtPsU3XCjvSSj
         J6/qTWZ+RxVK4g0SkkX91NWCjmYtn+rzXEw8aIuEF0jBFZhWcd8Y3sk/gMZun4V5UtLq
         INE6uY8HZJ3/kUJ7V6W74DyqFtNkBAc5cVmjmWlf3p9Ydq6tibCm+dDOn2RN7aL3zTfl
         L8rjkSTG0BXHn9JaYVJBejw2uLZANpTCX2DyrUi6+UzHVh44yiJZeCYDDtGEfBFmXp5r
         8Q0iX0T7NF315pqX69xIXw+U/4xosdWeYBou/AAQBKsKPLl+q+oqWkRVzBOBw31A4n2v
         C8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730922869; x=1731527669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8djmRG6h4bc+SzaVCVnhZXth6QCnXFelnjwgthXVPkM=;
        b=AVl55LNpuA/XK+Gjha9fOonFY/WiNCJRy6aHmBA1iLANUjEDxTAxMFm9z/dKLV3Ar1
         08XI9v/AS5M0md2HFm4M9gjJEan2IB84+vx3wA7p6yLnO5P6y7IJd6ShhieEE0mZ+X4V
         ez4YxUcJ4ZwUM5mP8n4iOjAAHgrgBkN++dhDiDB8S4AwcBZ9fFh6z1RhJn/oAeUGhC+9
         zpnV1h1MyV3Qd8C8e/sfNs352XF6al3JwgDW4qbsaF/O/WtGYJiXbRcUgYmMGBeJzSOX
         +XSCQPRMBeD2M+HK+qHZ5dVkiaJawTdI0cR9ZzqGQnwN1UDC6OjUluXvTe+ZDLEkl1UN
         q+lA==
X-Forwarded-Encrypted: i=1; AJvYcCVvjKzrJpvq+dsZFcD0/E5s9Tw52N0Agt57GD17fh3RAYIxlFazzSF9MBWRrMak6+JBoce0@lists.linux.dev, AJvYcCW5TwJE63r/2Qyby3i4nbGo8Mey/zIfVxY87U7cxHzZW3aiEEs+0e5cwnJXChuCrOrt/1kpZPZeeq3xP9TlSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxudbADt8UnwRMzLxA8sSvbi5EC42tANhhFGLbTFLo+NASRE6cl
	1uqNZnejeyhi2khFk6dBQz7y0Gf2r2sZ9WBGqJWuWroMz5zvbZYmRNGL7Qp9pJf1lRDGkctT9pc
	9ewLfK2kToiSE6mRs8A/1wX+nYJk=
X-Google-Smtp-Source: AGHT+IHNLGON3XgJjzhfsZjCa80/60Rzycgq4mwsbD8ta/w3VL6D9p7b8x3gwVlqUR1ma+wIeq/Zh5/NDQKuNOJVOBM=
X-Received: by 2002:a05:6102:1627:b0:4a4:8d64:74bd with SMTP id
 ada2fe7eead31-4a954259b7bmr24525962137.4.1730922868682; Wed, 06 Nov 2024
 11:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411062130.JXvq8Cjt-lkp@intel.com>
In-Reply-To: <202411062130.JXvq8Cjt-lkp@intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 7 Nov 2024 08:54:17 +1300
Message-ID: <CAGsJ_4whD31+Lk0m2uq-o=ygvkRsw1uXcPeqxBONV-RUXkeEzg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 27/106] mm/page_io.c:220:3: error: call to
 undeclared function 'count_objcg_events'; ISO C99 and later do not support
 implicit function declarations
To: kernel test robot <lkp@intel.com>, Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Cc: Barry Song <v-songbaohua@oppo.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 2:24=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b2b
> commit: c10966f19a878a66206327ebe3b85500f59f47e2 [27/106] mm: count zerom=
ap read and set for swapout and swapin
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241106/20=
2411062130.JXvq8Cjt-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241106/202411062130.JXvq8Cjt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411062130.JXvq8Cjt-lkp=
@intel.com/
>
> Note: the akpm-mm/mm-unstable HEAD 7994b7ea6ac880efd0c38fedfbffd5ab8b1b7b=
2b builds fine.
>       It only hurts bisectability.
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/page_io.c:14:
>    In file included from include/linux/mm.h:2213:
>    include/linux/vmstat.h:504:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      505 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:511:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      512 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:518:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    include/linux/vmstat.h:524:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      525 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >> mm/page_io.c:220:3: error: call to undeclared function 'count_objcg_ev=
ents'; ISO C99 and later do not support implicit function declarations [-Wi=
mplicit-function-declaration]
>      220 |                 count_objcg_events(objcg, SWPOUT_ZERO, nr_page=
s);
>          |                 ^
>    mm/page_io.c:220:3: note: did you mean 'count_objcg_event'?
>    include/linux/memcontrol.h:1763:20: note: 'count_objcg_event' declared=
 here
>     1763 | static inline void count_objcg_event(struct obj_cgroup *objcg,
>          |                    ^
>    mm/page_io.c:532:3: error: call to undeclared function 'count_objcg_ev=
ents'; ISO C99 and later do not support implicit function declarations [-Wi=
mplicit-function-declaration]
>      532 |                 count_objcg_events(objcg, SWPIN_ZERO, nr_pages=
);
>          |                 ^
>    4 warnings and 2 errors generated.

Is it because Kanchana's "mm: change count_objcg_event() to count_objcg_eve=
nts()
for batch event updates" doesn't exist?
Hi Andrew, is it possible to take this one also into mm-hotfixes-unstable?

commit 206ad49987b4670e01a3a0fd5673a823a94499d5
Author: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Date:   Mon Sep 30 22:32:19 2024 -0700
    mm: change count_objcg_event() to count_objcg_events() for batch
event updates
    With the introduction of zswap_store() swapping out large folios, we ne=
ed
    to efficiently update the objcg's memcg events once per successfully
    stored folio.  For instance, the 'ZSWPOUT' event needs to be incremente=
d
    by folio_nr_pages().

    To facilitate this, the existing count_objcg_event() API is modified to=
 be
    count_objcg_events() that additionally accepts a count parameter.  The
    only existing calls to count_objcg_event() are in zswap.c - these have
    been modified to call count_objcg_events() with a count of 1.

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 15c2716f9aa3..524006313b0d 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1764,8 +1764,9 @@ static inline int memcg_kmem_id(struct mem_cgroup *me=
mcg)

 struct mem_cgroup *mem_cgroup_from_slab_obj(void *p);

-static inline void count_objcg_event(struct obj_cgroup *objcg,
-                                    enum vm_event_item idx)
+static inline void count_objcg_events(struct obj_cgroup *objcg,
+                                     enum vm_event_item idx,
+                                     unsigned long count)
 {

>
>
> vim +/count_objcg_events +220 mm/page_io.c
>
>    204
>    205  static void swap_zeromap_folio_set(struct folio *folio)
>    206  {
>    207          struct obj_cgroup *objcg =3D get_obj_cgroup_from_folio(fo=
lio);
>    208          struct swap_info_struct *sis =3D swp_swap_info(folio->swa=
p);
>    209          int nr_pages =3D folio_nr_pages(folio);
>    210          swp_entry_t entry;
>    211          unsigned int i;
>    212
>    213          for (i =3D 0; i < folio_nr_pages(folio); i++) {
>    214                  entry =3D page_swap_entry(folio_page(folio, i));
>    215                  set_bit(swp_offset(entry), sis->zeromap);
>    216          }
>    217
>    218          count_vm_events(SWPOUT_ZERO, nr_pages);
>    219          if (objcg) {
>  > 220                  count_objcg_events(objcg, SWPOUT_ZERO, nr_pages);
>    221                  obj_cgroup_put(objcg);
>    222          }
>    223  }
>    224
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Thanks
barry
