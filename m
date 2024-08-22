Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89F1CDFD5
	for <llvm@lists.linux.dev>; Thu, 22 Aug 2024 20:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724359191; cv=none; b=ZBc2MzgHaWXmHLNQJe8IozjPowGfIt9Okdw3ubB9AFfedq0sHTQfIekgxBWq/LgvuLpQ4AhR1xx/1igcgMJfuDgFw6DNogm63Cq0g0HbEKg7QUxz8iMyHEt5Xv31jA7ZVgVJLQLgipvO0rGViLZ8jntCorgiypChT5eYO5WPJoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724359191; c=relaxed/simple;
	bh=JS0v38HV8Wg7E55STInBy8yWP26ksAQEwkItOSrWyEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQ5cFKx7JyqxSKrhkcyeypj4/XZAVmrhcmn4tfF7B7WpTMiuSyIOF9cIZ20vYW5/zgp8yti/vNUwEdlRzJhFROH/T2R4ZgsHO8UgvFFhP4S3pxjrzv2yyYBFWJ13GSa1xzY9EWLoeyrFlMq5CtR3qMRQq9xLlgrzAlnrGBnIn9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ltZcbdSb; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ltZcbdSb"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4518d9fa2f4so94301cf.0
        for <llvm@lists.linux.dev>; Thu, 22 Aug 2024 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724359189; x=1724963989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkYWMas3iG5xbkxW9s1JpA1hKS4hH3nB7s5U37ETy4k=;
        b=ltZcbdSbX9hmp/hTCN0v1CjKF7DVrmcaXmlXqQxokqhYEkw+ZDC83XJNhfSsT4HULf
         4qrOitYm5YmAV9G5Wo0jVFVUCVLLnVTx7GDL/WqP80b4BvaBOhxGx+ra/y4eF0GFNtf3
         4C9BT7TbpUp3CWAeIcYfU2blaVN7wguHgp7PrVvPpqODsUAxng2sctNkGqsbnoEY/pG+
         W/nQVmrHkho85RCk5rjEzoJMXmoFQs0axHl4jKSzp0y3JsJDcsT+79I50Gw262j3KYcY
         hoP6u4EN/w8JTZdiKjrVHocddYBREZ3gkKQHU8tHI8it2sKEXS1QuX1kHdpl1ARAOZ2a
         R3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724359189; x=1724963989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkYWMas3iG5xbkxW9s1JpA1hKS4hH3nB7s5U37ETy4k=;
        b=Fcaqz6/KLLBD9uBTpd0LEPF5dWVMQDPYowqFzatLqSijmWQ5SYcseyEsBxZcabj+Ph
         dpV47QQaJ1hvPIqco5fcsT8BZ9mPZRfckg3vAokE02nOTmAi/domI+KTD/uF7bnWXuEX
         JcB9vhY3zoo9y1xEG0T8xVU/eGJN2EuqJ6bE60n+TJLawdj/2ynXNtNLe7h2vdS/6v37
         ul+Kg0K5mRnuBPDvb9ntMz42zc9mQx3IKuKQ4j0MOmJZ4Cbb3GQXrSOHi5x/TVF9dsIm
         g+w4ZDzrbCB73oUgEMKmcLJ91tq1kYfG56LLuUiK0QYkqESoIzQROX6cD1QJMjwhv8nA
         88og==
X-Forwarded-Encrypted: i=1; AJvYcCVdIUxXFRoBS39ildp3X7UJmugOiUGGGjseqMXwF5xkk96Jen0dw33KhRd8YbOIUoF/vVwm@lists.linux.dev
X-Gm-Message-State: AOJu0YxoW+mw8dW1VBPyoLKHULrftdXuke2B03E8G1PwvhgoBRhos1KR
	Xkwpc2Bux57PF0fvBd68FnbAVhNgAxak/q8LNkcoDckAig4BKOzFmg+PP8m059paGxeScO9Lpuy
	fLVF0p90UOOpZMfem9eKsZ82deeHyKna+O1kB
X-Google-Smtp-Source: AGHT+IFtNH2xvRxz7FD74vkPbGXgg5sqxHKyw5vloUG+ZQNfoD1itfQBUsLqEqIVhUxSr89ba/R4FfOegUItvIMBJTg=
X-Received: by 2002:a05:622a:5b05:b0:447:d78d:773b with SMTP id
 d75a77b69052e-4550813540amr917951cf.6.1724359188351; Thu, 22 Aug 2024
 13:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819151512.2363698-2-surenb@google.com> <202408230020.U02tOvjb-lkp@intel.com>
In-Reply-To: <202408230020.U02tOvjb-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 22 Aug 2024 13:39:37 -0700
Message-ID: <CAJuCfpFQ=BQrv3o9gheZ8wXyQEk6bbEw0DLeBVFHfPKw0cufAA@mail.gmail.com>
Subject: Re: [PATCH 1/5] alloc_tag: load module tags into separate continuous memory
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	pasha.tatashin@soleen.com, souravpanda@google.com, keescook@chromium.org, 
	dennis@kernel.org, jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 10:10=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 651c8c1d735983040bec4f71d0e2e690f3c0fc2d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/alloc_tag-load-module-tags-into-separate-continuous-memory/20240819-231747
> base:   651c8c1d735983040bec4f71d0e2e690f3c0fc2d
> patch link:    https://lore.kernel.org/r/20240819151512.2363698-2-surenb%=
40google.com
> patch subject: [PATCH 1/5] alloc_tag: load module tags into separate cont=
inuous memory
> config: s390-randconfig-001-20240822 (https://download.01.org/0day-ci/arc=
hive/20240823/202408230020.U02tOvjb-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2=
6670e7fa4f032a019d23d56c6a02926e854e8af)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240823/202408230020.U02tOvjb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408230020.U02tOvjb-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from lib/alloc_tag.c:3:
>    In file included from include/linux/execmem.h:6:
>    In file included from include/linux/moduleloader.h:6:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:181:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2199:
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
> >> lib/alloc_tag.c:16:22: warning: tentative definition of variable with =
internal linkage has incomplete non-array type 'struct module' [-Wtentative=
-definition-incomplete-type]
>       16 | static struct module unloaded_mod;

Same issue here. I need to fix CONFIG_MODULES=3Dn config.

>          |                      ^
>    include/linux/printk.h:358:8: note: forward declaration of 'struct mod=
ule'
>      358 | struct module;
>          |        ^
>    lib/alloc_tag.c:18:22: warning: tentative definition of variable with =
internal linkage has incomplete non-array type 'struct module' [-Wtentative=
-definition-incomplete-type]
>       18 | static struct module prepend_mod;
>          |                      ^
>    include/linux/printk.h:358:8: note: forward declaration of 'struct mod=
ule'
>      358 | struct module;
>          |        ^
> >> lib/alloc_tag.c:16:22: error: tentative definition has type 'struct mo=
dule' that is never completed
>       16 | static struct module unloaded_mod;
>          |                      ^
>    include/linux/printk.h:358:8: note: forward declaration of 'struct mod=
ule'
>      358 | struct module;
>          |        ^
>    lib/alloc_tag.c:18:22: error: tentative definition has type 'struct mo=
dule' that is never completed
>       18 | static struct module prepend_mod;
>          |                      ^
>    include/linux/printk.h:358:8: note: forward declaration of 'struct mod=
ule'
>      358 | struct module;
>          |        ^
>    6 warnings and 2 errors generated.
>
>
> vim +16 lib/alloc_tag.c
>
>     11
>     12  static struct codetag_type *alloc_tag_cttype;
>     13  static struct alloc_tag_module_section module_tags;
>     14  static struct maple_tree mod_area_mt =3D MTREE_INIT(mod_area_mt, =
MT_FLAGS_ALLOC_RANGE);
>     15  /* A dummy object used to indicate an unloaded module */
>   > 16  static struct module unloaded_mod;
>     17  /* A dummy object used to indicate a module prepended area */
>     18  static struct module prepend_mod;
>     19
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
