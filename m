Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE431386A1
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 20:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711656182; cv=none; b=TlqL/97ERhs4MjQa9gRovve+G7rHwmMwQVx+JMKshKJhJBZ6+jYXPXDK2GYOx1n0gYMemjynhBdVPDO1sORHZysBSTtwSWU10nXu1tMxaBNIdE9k3wROa0BOI8TmYC59oTk3uZIKqujiZuBUaxwcjFCthBeneQ0CTihiQoTWJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711656182; c=relaxed/simple;
	bh=yomEqR96IXEIFQC6S763zBlMU1YU5ufY4b2syTafMEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKmVKl3XNotVz7f/8x9X/fuU7Ieaxx6eSZj0u+eIxhGGnSQj/m0GX9xWrMNKOwTely0prB1oDhzGFvMEfsO1qtSrXgr3kTk427QB62VrXY7PhIf0uF/qJt8yEkeHJpInnaaAgVHD/IO/f0MgxZ9TzuimnffGLK0IUpjRa6U8Izs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DILcMzl+; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DILcMzl+"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so1410416276.3
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711656179; x=1712260979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7nxVs1btbjyAt4L665I62koiProQo93cNnswOn6QLs=;
        b=DILcMzl+QTOz5D3TPiOIMWpPd+rHJCvJBHPyg46lyX+vz1Bcqm82+xDltmtMmYYQbj
         ao8b47iCovk9YnhLgyGyegdSEETA5myMuBp7+ZJ0xKbOZ6NyJF5ezojqMPNTas0gc4pe
         fJdRpv+WOjufiUVTS1LFrodk2CR4+rM2zfqZbxcFSB1n2TCLjtHSiRTXA/Pzn1bVLsHE
         8+gYLhi3q3kdbWXADB62f3JvKd3k3DCPL5KqOf4pqM7gqrBuBBL4Y8pIG0D4cdw6RwSE
         9xZ0RhOl3/HYBBBHPXnCtj6v9TwpIF+X9EajuS70u1jwMFQ98wviinWg2cU6JrCj+PQN
         msVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711656179; x=1712260979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7nxVs1btbjyAt4L665I62koiProQo93cNnswOn6QLs=;
        b=YzXQHKb1jHkgOaEU25icyX292SwrAJzCrQqH1yLV2aVnKIlgaA06R0JoNBLJfUiaZS
         gLNqDgVHIZEttYQrI7seIpmvDd9SJ1Wya1X63P+47NReII+d1yeZL0WXsl8T61e8csP1
         N0n2Eq3J1o5C+YG19tyR1aCeUl1rVVvy9JlaGtM5TRXE/l9a8+keYNYoJcbqat5kZmiD
         w/fAwlZmPRur7onqXO3NbmgiWkoakOkiyaKTGDngNdOHcxN9VhK5d8VdnQjp2Oq9rVSR
         BjkPfsR4LTNRWwh34h5jcKb9PyFuWC07vEhhd+96EgQcJjxoVo5Q7+pdeDvtaOKnmIXT
         wr7w==
X-Gm-Message-State: AOJu0YzXynDu4mXi2vp1ENK+4tU7idqJj+piq4AsdLzl4jUS6AAuIvfA
	DPNZLDy+A3O2TR9m9+QGOHxHMKZkOG3L8YaXjJDRRqDpkff8w2Piq9ocIRyqjxBRb5nV0kRmWDq
	gi3YCvm4L2sDpyAFvd0MZX5OoYa+jOUubzT9m
X-Google-Smtp-Source: AGHT+IHztzPdQJK8IBEI/+8QhzgjzQArplH/JxSEtbJCRHlswrnewnnBG5pSqZ5nAcuQE5yXhVcIDzg4D/WGyApfTgQ=
X-Received: by 2002:a25:6a04:0:b0:dc7:48f8:ce2e with SMTP id
 f4-20020a256a04000000b00dc748f8ce2emr349417ybc.37.1711656178639; Thu, 28 Mar
 2024 13:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403290334.USWrYrMw-lkp@intel.com>
In-Reply-To: <202403290334.USWrYrMw-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 28 Mar 2024 13:02:44 -0700
Message-ID: <CAJuCfpEKhhbG45RLFyh5yJ4iZ8NdqWcbj_+rf3=9Kg+hdxTtVg@mail.gmail.com>
Subject: Re: [linux-next:master 1076/1266] include/linux/alloc_tag.h:43:2:
 error: "Memory allocation profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 12:55=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
> commit: ce3297eef13a5e5c03f99dc81fa4948340938b36 [1076/1266] mm: enable p=
age allocation tagging
> config: s390-randconfig-002-20240328 (https://download.01.org/0day-ci/arc=
hive/20240329/202403290334.USWrYrMw-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 2=
3de3862dce582ce91c1aa914467d982cb1a73b4)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240329/202403290334.USWrYrMw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403290334.USWrYrMw-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
>    In file included from include/linux/gfp.h:9:
> >> include/linux/alloc_tag.h:43:2: error: "Memory allocation profiling is=
 incompatible with ARCH_NEEDS_WEAK_PER_CPU"
>       43 | #error "Memory allocation profiling is incompatible with ARCH_=
NEEDS_WEAK_PER_CPU"
>          |  ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
> >> include/linux/gfp.h:295:9: error: '__section__' attribute only applies=
 to functions, global variables, Objective-C methods, and Objective-C prope=
rties
>      295 |         return __folio_alloc_node(gfp, order, numa_node_id());
>          |                ^
>    include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_n=
ode'
>      258 | #define  __folio_alloc_node(...)                alloc_hooks(__=
folio_alloc_node_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/percpu-defs.h:93:2: note: expanded from macro 'DEFINE_PE=
R_CPU_SECTION'
>       93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;         =
          \
>          |         ^
>    include/linux/percpu-defs.h:54:2: note: expanded from macro '__PCPU_DU=
MMY_ATTRS'
>       54 |         __section(".discard") __attribute__((unused))
>          |         ^
>    include/linux/compiler_attributes.h:334:56: note: expanded from macro =
'__section'
>      334 | #define __section(section)              __attribute__((__secti=
on__(section)))
>          |                                                        ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
> >> include/linux/gfp.h:295:9: error: non-extern declaration of '__pcpu_un=
ique__alloc_tag_cntr' follows extern declaration
>    include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_n=
ode'
>      258 | #define  __folio_alloc_node(...)                alloc_hooks(__=
folio_alloc_node_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:93:26: note: expanded from macro 'DEFINE_P=
ER_CPU_SECTION'
>       93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;         =
          \
>          |                                 ^
>    <scratch space>:101:1: note: expanded from here
>      101 | __pcpu_unique__alloc_tag_cntr
>          | ^
>    include/linux/gfp.h:295:9: note: previous declaration is here
>    include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_n=
ode'
>      258 | #define  __folio_alloc_node(...)                alloc_hooks(__=
folio_alloc_node_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:92:33: note: expanded from macro 'DEFINE_P=
ER_CPU_SECTION'
>       92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;  =
          \
>          |                                        ^
>    <scratch space>:100:1: note: expanded from here
>      100 | __pcpu_unique__alloc_tag_cntr
>          | ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
> >> include/linux/gfp.h:295:9: error: 'section' attribute only applies to =
functions, global variables, Objective-C methods, and Objective-C propertie=
s
>      295 |         return __folio_alloc_node(gfp, order, numa_node_id());
>          |                ^
>    include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_n=
ode'
>      258 | #define  __folio_alloc_node(...)                alloc_hooks(__=
folio_alloc_node_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:95:2: note: expanded from macro 'DEFINE_PE=
R_CPU_SECTION'
>       95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
>          |         ^
>    include/linux/percpu-defs.h:50:26: note: expanded from macro '__PCPU_A=
TTRS'
>       50 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION s=
ec)))     \
>          |                                 ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
> >> include/linux/gfp.h:295:9: error: non-extern declaration of '_alloc_ta=
g_cntr' follows extern declaration
>    include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_n=
ode'
>      258 | #define  __folio_alloc_node(...)                alloc_hooks(__=
folio_alloc_node_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALL=
OC_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                                                          ^
>    include/linux/gfp.h:295:9: note: previous declaration is here
>    include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_n=
ode'
>      258 | #define  __folio_alloc_node(...)                alloc_hooks(__=
folio_alloc_node_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALL=
OC_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                                                          ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:17:
>    In file included from include/linux/kmod.h:9:
>    In file included from include/linux/umh.h:4:
> >> include/linux/gfp.h:295:9: error: weak declaration cannot have interna=
l linkage
>      295 |         return __folio_alloc_node(gfp, order, numa_node_id());
>          |                ^
>    include/linux/gfp.h:258:35: note: expanded from macro '__folio_alloc_n=
ode'
>      258 | #define  __folio_alloc_node(...)                alloc_hooks(__=
folio_alloc_node_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:95:20: note: expanded from macro 'DEFINE_P=
ER_CPU_SECTION'
>       95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
>          |                           ^
>    include/linux/compiler_attributes.h:403:56: note: expanded from macro =
'__weak'
>      403 | #define __weak                          __attribute__((__weak_=
_))
>          |                                                        ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:98:11: warning: array index 3 is past the end o=
f the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       98 |                 return (set->sig[3] | set->sig[2] |
>          |                         ^        ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:98:25: warning: array index 2 is past the end o=
f the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       98 |                 return (set->sig[3] | set->sig[2] |
>          |                                       ^        ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:99:4: warning: array index 1 is past the end of=
 the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       99 |                         set->sig[1] | set->sig[0]) =3D=3D 0;
>          |                         ^        ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:101:11: warning: array index 1 is past the end =
of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>      101 |                 return (set->sig[1] | set->sig[0]) =3D=3D 0;
>          |                         ^        ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:33:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:114:11: warning: array index 3 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      114 |                 return  (set1->sig[3] =3D=3D set2->sig[3]) &&
>          |                          ^         ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    In file included from include/linux/compat.h:17:
> --
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    include/linux/compat.h:454:10: warning: array index 7 is past the end =
of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')=
) [-Warray-bounds]
>      454 |         case 4: v.sig[7] =3D (set->sig[3] >> 32); v.sig[6] =3D=
 set->sig[3];
>          |                 ^     ~
>    include/linux/compat.h:130:2: note: array 'sig' declared here
>      130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>          |         ^
>    include/linux/compat.h:454:42: warning: array index 6 is past the end =
of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')=
) [-Warray-bounds]
>      454 |         case 4: v.sig[7] =3D (set->sig[3] >> 32); v.sig[6] =3D=
 set->sig[3];
>          |                                                 ^     ~
>    include/linux/compat.h:130:2: note: array 'sig' declared here
>      130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>          |         ^
>    include/linux/compat.h:454:53: warning: array index 3 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      454 |         case 4: v.sig[7] =3D (set->sig[3] >> 32); v.sig[6] =3D=
 set->sig[3];
>          |                                                            ^  =
      ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    include/linux/compat.h:456:22: warning: array index 2 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      456 |         case 3: v.sig[5] =3D (set->sig[2] >> 32); v.sig[4] =3D=
 set->sig[2];
>          |                             ^        ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    include/linux/compat.h:456:10: warning: array index 5 is past the end =
of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')=
) [-Warray-bounds]
>      456 |         case 3: v.sig[5] =3D (set->sig[2] >> 32); v.sig[4] =3D=
 set->sig[2];
>          |                 ^     ~
>    include/linux/compat.h:130:2: note: array 'sig' declared here
>      130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>          |         ^
>    include/linux/compat.h:456:42: warning: array index 4 is past the end =
of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')=
) [-Warray-bounds]
>      456 |         case 3: v.sig[5] =3D (set->sig[2] >> 32); v.sig[4] =3D=
 set->sig[2];
>          |                                                 ^     ~
>    include/linux/compat.h:130:2: note: array 'sig' declared here
>      130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>          |         ^
>    include/linux/compat.h:456:53: warning: array index 2 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      456 |         case 3: v.sig[5] =3D (set->sig[2] >> 32); v.sig[4] =3D=
 set->sig[2];
>          |                                                            ^  =
      ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    include/linux/compat.h:458:22: warning: array index 1 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      458 |         case 2: v.sig[3] =3D (set->sig[1] >> 32); v.sig[2] =3D=
 set->sig[1];
>          |                             ^        ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:160:
>    include/linux/compat.h:458:10: warning: array index 3 is past the end =
of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')=
) [-Warray-bounds]
>      458 |         case 2: v.sig[3] =3D (set->sig[1] >> 32); v.sig[2] =3D=
 set->sig[1];
>          |                 ^     ~
>    include/linux/compat.h:130:2: note: array 'sig' declared here
>      130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>          |         ^
>    include/linux/compat.h:458:42: warning: array index 2 is past the end =
of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')=
) [-Warray-bounds]
>      458 |         case 2: v.sig[3] =3D (set->sig[1] >> 32); v.sig[2] =3D=
 set->sig[1];
>          |                                                 ^     ~
>    include/linux/compat.h:130:2: note: array 'sig' declared here
>      130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>          |         ^
>    include/linux/compat.h:458:53: warning: array index 1 is past the end =
of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>      458 |         case 2: v.sig[3] =3D (set->sig[1] >> 32); v.sig[2] =3D=
 set->sig[1];
>          |                                                            ^  =
      ~
>    arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
>       22 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:173:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2208:
>    include/linux/vmstat.h:522:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:173:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
> >> include/linux/mm.h:2862:22: error: '__section__' attribute only applie=
s to functions, global variables, Objective-C methods, and Objective-C prop=
erties
>     2862 |         struct page *page =3D alloc_pages(gfp | __GFP_COMP, or=
der);
>          |                             ^
>    include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
>      301 | #define alloc_pages(...)                        alloc_hooks(al=
loc_pages_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/percpu-defs.h:93:2: note: expanded from macro 'DEFINE_PE=
R_CPU_SECTION'
>       93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;         =
          \
>          |         ^
>    include/linux/percpu-defs.h:54:2: note: expanded from macro '__PCPU_DU=
MMY_ATTRS'
>       54 |         __section(".discard") __attribute__((unused))
>          |         ^
>    include/linux/compiler_attributes.h:334:56: note: expanded from macro =
'__section'
>      334 | #define __section(section)              __attribute__((__secti=
on__(section)))
>          |                                                        ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:173:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
> >> include/linux/mm.h:2862:22: error: non-extern declaration of '__pcpu_u=
nique__alloc_tag_cntr' follows extern declaration
>    include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
>      301 | #define alloc_pages(...)                        alloc_hooks(al=
loc_pages_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:93:26: note: expanded from macro 'DEFINE_P=
ER_CPU_SECTION'
>       93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;         =
          \
>          |                                 ^
>    <scratch space>:67:1: note: expanded from here
>       67 | __pcpu_unique__alloc_tag_cntr
>          | ^
>    include/linux/mm.h:2862:22: note: previous declaration is here
>    include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
>      301 | #define alloc_pages(...)                        alloc_hooks(al=
loc_pages_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:92:33: note: expanded from macro 'DEFINE_P=
ER_CPU_SECTION'
>       92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;  =
          \
>          |                                        ^
>    <scratch space>:66:1: note: expanded from here
>       66 | __pcpu_unique__alloc_tag_cntr
>          | ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:173:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
> >> include/linux/mm.h:2862:22: error: 'section' attribute only applies to=
 functions, global variables, Objective-C methods, and Objective-C properti=
es
>     2862 |         struct page *page =3D alloc_pages(gfp | __GFP_COMP, or=
der);
>          |                             ^
>    include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
>      301 | #define alloc_pages(...)                        alloc_hooks(al=
loc_pages_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:95:2: note: expanded from macro 'DEFINE_PE=
R_CPU_SECTION'
>       95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
>          |         ^
>    include/linux/percpu-defs.h:50:26: note: expanded from macro '__PCPU_A=
TTRS'
>       50 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION s=
ec)))     \
>          |                                 ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:173:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
> >> include/linux/mm.h:2862:22: error: non-extern declaration of '_alloc_t=
ag_cntr' follows extern declaration
>    include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
>      301 | #define alloc_pages(...)                        alloc_hooks(al=
loc_pages_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALL=
OC_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                                                          ^
>    include/linux/mm.h:2862:22: note: previous declaration is here
>    include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
>      301 | #define alloc_pages(...)                        alloc_hooks(al=
loc_pages_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:51: note: expanded from macro 'DEFINE_ALL=
OC_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                                                          ^
>    In file included from drivers/input/rmi4/rmi_spi.c:8:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:173:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
> >> include/linux/mm.h:2862:22: error: weak declaration cannot have intern=
al linkage
>     2862 |         struct page *page =3D alloc_pages(gfp | __GFP_COMP, or=
der);
>          |                             ^
>    include/linux/gfp.h:301:28: note: expanded from macro 'alloc_pages'
>      301 | #define alloc_pages(...)                        alloc_hooks(al=
loc_pages_noprof(__VA_ARGS__))
>          |                                                 ^
>    include/linux/alloc_tag.h:155:2: note: expanded from macro 'alloc_hook=
s'
>      155 |         DEFINE_ALLOC_TAG(_alloc_tag);                         =
          \
>          |         ^
>    include/linux/alloc_tag.h:47:9: note: expanded from macro 'DEFINE_ALLO=
C_TAG'
>       47 |         static DEFINE_PER_CPU(struct alloc_tag_counters, _allo=
c_tag_cntr);      \
>          |                ^
>    include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_P=
ER_CPU'
>      115 |         DEFINE_PER_CPU_SECTION(type, name, "")
>          |         ^
>    include/linux/percpu-defs.h:95:20: note: expanded from macro 'DEFINE_P=
ER_CPU_SECTION'
>       95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
>          |                           ^
>    include/linux/compiler_attributes.h:403:56: note: expanded from macro =
'__weak'
>      403 | #define __weak                          __attribute__((__weak_=
_))
>          |                                                        ^
>    In file included from drivers/input/rmi4/rmi_spi.c:9:
>    In file included from include/linux/rmi.h:13:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      547 |         val =3D __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      560 |         val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_=
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
>    In file included from drivers/input/rmi4/rmi_spi.c:9:
>    In file included from include/linux/rmi.h:13:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:573:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      573 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_=
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
>    In file included from drivers/input/rmi4/rmi_spi.c:9:
>    In file included from include/linux/rmi.h:13:
>    In file included from include/linux/kfifo.h:42:
>    In file included from include/linux/scatterlist.h:9:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:584:33: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      584 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
>    include/asm-generic/io.h:692:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      692 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:700:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      700 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:708:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      708 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:717:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      717 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:726:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      726 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:735:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      735 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    74 warnings and 11 errors generated.
> ..
>
>
> vim +43 include/linux/alloc_tag.h
>
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  37
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  38  #ifdef ARCH_NEEDS_WEAK_=
PER_CPU
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  39  /*
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  40   * When percpu variable=
s are required to be defined as weak, static percpu
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  41   * variables can't be u=
sed inside a function (see comments for DECLARE_PER_CPU_SECTION).
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  42   */
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21 @43  #error "Memory allocati=
on profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  44  #endif
> d08b311b6d4946 Suren Baghdasaryan 2024-03-21  45
>
> :::::: The code at line 43 was first introduced by commit
> :::::: d08b311b6d4946b22d966201da4008a197736e3d lib: add allocation taggi=
ng support for memory allocation profiling
>
> :::::: TO: Suren Baghdasaryan <surenb@google.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>

Well, this is what I expected, we do not support this feature for
ARCH_NEEDS_WEAK_PER_CPU (alpha and s390 with CONFIG_SMP=3Dy &&
CONFIG_MODULE=3Dy).
Unfortunately ARCH_NEEDS_WEAK_PER_CPU is not a config option, so I
can't add it as a dependency for CONFIG_MEM_ALLOC_PROFILING. Should I
handle this differently?

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
