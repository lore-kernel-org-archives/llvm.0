Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD614204B
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729266337; cv=none; b=hP0njiqndMvKsvOhbtGlt6X/pmUz0N8tKFgnclUv7+/tIDojZg2sk4Sq3GavUrk9QS1Aa2t8F5cGM52z6JkuBT5Zib1Hw990YoOePGyEfT31hngj490cQ4YUz2YRf92Ixl/x+3zjacuxB5JHRa/4xcemY6F1vvnsLESUBlfz6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729266337; c=relaxed/simple;
	bh=htLmhrj0THXX8kcJr3iUajDNdIBVQGF8LxvK1XxbRTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/LWI/DM3ZV/XGv6LAgMZzictHVLAbBI23t+MxCIkmZ2Ad5pui41+3DUBAb1UcLZOzMWLhU+3C4ZWncQpr+t+BTprcA4bo966mFlePITsAC0AwbNUjX2LT4eF9QGAgYkb/0IHtoLg5XX+Z0kATvEtTsClolGvsKlA3CER1zc4D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7mIr6fy; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7mIr6fy"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4608dddaa35so329011cf.0
        for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729266333; x=1729871133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v92/kQWzEYkOLqZPU1rdAyapbIVR5PRwb7eagmRV5+Y=;
        b=Q7mIr6fy9bc8+Ie96/EeFzpg4Mn0YZf6eQAzrLj2giv3BXv1oIIGZvkQnQNeV/wujc
         NKTgY7M8C48D0S8tVXgUNPqIi6xt7w9EF+sF0wLzhuQOZ8uG4qBOS6kE2OqsEKrvCVqq
         JeOjyW7sHJkPVkT38bKfpT+mFuTUoUiUSNQm9dG+8byF7c6aBYSw21RR218bGqPZXHE2
         Qxg+LvdQq3E3TIk81rB4WpwF6h+TySsQUNeBpVPS9l55BhlTVzxkdU24g6IfLgm6HZJq
         h94kxwJ7iyRwKKbt309L3ryX291lS1PuuInexCPEGY/Zl3aXkfAZyc6nMB8X63OiqZKk
         O7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729266333; x=1729871133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v92/kQWzEYkOLqZPU1rdAyapbIVR5PRwb7eagmRV5+Y=;
        b=wj2caCKIeyS1+CD19O7eoxG2vo8VZiAlKy1hwZP7bkTI2MWtwaZJuxpsfpkH476jKr
         0za0n5sgC+4hT2169O2OSmQedVbo6RhfyWyPiZ99LBfSmn+n3jhcmo47lZ2wuBBTM0Y2
         3vVoFQKnc9Etsqe4LMEFKNOKX3kqgaw4FLD5FIOGAOJ8AZ7gnsAFRXbUDDWW3rcA7xse
         CusLPEZDONotDx9egjtMUK5DPwmlLn4IualueWHro4MBbpvVQ+X7ap4avKNVEgzC2ydP
         ZMrYukwvV9RPkVq2qFqNxrfvKhrSQZCSRH812cmeo6wjymPz4BJJfW7USdC4tgV45Qni
         3+tg==
X-Forwarded-Encrypted: i=1; AJvYcCWwnRoQigYixmRISOVPY5LncY1wtoTe22SFi9c9LQatxpxAj2vzZe9IWWBhNwIx49lXgZ3E@lists.linux.dev
X-Gm-Message-State: AOJu0YxduFiGqU/ewI/uIfj31YgwrzhKB1iUzx3g4H4E89J67tGxFfLw
	cwHT6GsU7ez0cCTbcpL8L+b8eyBUYu7os2b/5tP+7oMoi1dwUCwwjpPGOmWJHP8y14C7blKXxsv
	G74esukNXJrknGs9rpZQqxuD04KiajMNTaAdc
X-Google-Smtp-Source: AGHT+IEYFwu3SGTxUnPopqgl0x/zRhkaRFC1y1Bfq7DZeif9Fr2zXoGR4UbJr39YbDI06jk0siUCMXoS0F2fcfy3d0c=
X-Received: by 2002:a05:622a:5e89:b0:447:e423:a463 with SMTP id
 d75a77b69052e-460aeb98cdemr2856581cf.3.1729266333152; Fri, 18 Oct 2024
 08:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014203646.1952505-4-surenb@google.com> <202410181939.vLqV33c7-lkp@intel.com>
In-Reply-To: <202410181939.vLqV33c7-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 18 Oct 2024 08:45:18 -0700
Message-ID: <CAJuCfpEyvXN8Em+7yiQ2o=NChb=kmcKQj5gpMNK8R3Hk-Wj4ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] alloc_tag: populate memory for module tags as needed
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

On Fri, Oct 18, 2024 at 5:01=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Suren,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 828d7267c42c2aab3877c08b4bb00b1e56769557]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/maple_tree-add-mas_for_each_rev-helper/20241015-044156
> base:   828d7267c42c2aab3877c08b4bb00b1e56769557
> patch link:    https://lore.kernel.org/r/20241014203646.1952505-4-surenb%=
40google.com
> patch subject: [PATCH v3 3/5] alloc_tag: populate memory for module tags =
as needed
> config: i386-randconfig-006-20241018 (https://download.01.org/0day-ci/arc=
hive/20241018/202410181939.vLqV33c7-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241018/202410181939.vLqV33c7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410181939.vLqV33c7-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> lib/alloc_tag.c:394:4: warning: format specifies type 'unsigned long' =
but the argument has type 'unsigned int' [-Wformat]
>      393 |                 pr_err("Failed to map %lu bytes for module all=
ocation tags\n",
>          |                                       ~~~
>          |                                       %u
>      394 |                         MODULE_ALLOC_TAG_VMAP_SIZE);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~

I'll fix this warning in the next version. Thanks!

>    include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
>      533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>          |                                ~~~     ^~~~~~~~~~~
>    include/linux/printk.h:490:60: note: expanded from macro 'printk'
>      490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__V=
A_ARGS__)
>          |                                                     ~~~    ^~~=
~~~~~~~~
>    include/linux/printk.h:462:19: note: expanded from macro 'printk_index=
_wrap'
>      462 |                 _p_func(_fmt, ##__VA_ARGS__);                 =
          \
>          |                         ~~~~    ^~~~~~~~~~~
>    lib/alloc_tag.c:386:36: note: expanded from macro 'MODULE_ALLOC_TAG_VM=
AP_SIZE'
>      386 | #define MODULE_ALLOC_TAG_VMAP_SIZE (100000 * sizeof(struct all=
oc_tag))
>          |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>    1 warning generated.
>
>
> vim +394 lib/alloc_tag.c
>
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  387
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  388  static int __init all=
oc_mod_tags_mem(void)
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  389  {
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  390      /* Map space to c=
opy allocation tags */
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  391      vm_module_tags =
=3D execmem_vmap(EXECMEM_MODULE_DATA, MODULE_ALLOC_TAG_VMAP_SIZE);
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  392      if (!vm_module_ta=
gs) {
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  393              pr_err("F=
ailed to map %lu bytes for module allocation tags\n",
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14 @394                      M=
ODULE_ALLOC_TAG_VMAP_SIZE);
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  395              module_ta=
gs.start_addr =3D 0;
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  396              return -E=
NOMEM;
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  397      }
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  398
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  399      vm_module_tags->p=
ages =3D kmalloc_array(get_vm_area_size(vm_module_tags) >> PAGE_SHIFT,
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  400                       =
               sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  401      if (!vm_module_ta=
gs->pages) {
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  402              free_vm_a=
rea(vm_module_tags);
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  403              return -E=
NOMEM;
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  404      }
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  405
> f0d7ffe60ce5cf0 Suren Baghdasaryan 2024-10-14  406      module_tags.start=
_addr =3D (unsigned long)vm_module_tags->addr;
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  407      module_tags.end_a=
ddr =3D module_tags.start_addr + MODULE_ALLOC_TAG_VMAP_SIZE;
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  408
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  409      return 0;
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  410  }
> 5b662b363f38b01 Suren Baghdasaryan 2024-10-14  411
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
