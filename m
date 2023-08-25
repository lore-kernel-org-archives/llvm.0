Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2532256A
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 18:50:06 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-64bd231c95cso7498576d6.1
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692989405; x=1693594205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9OpAPTbZ3wNNM0mxwWe5mRvai82387mVIXj9OVtNdk=;
        b=6iuloOTXDJ8ZCqCBNofRfCNpRB/xEoBcGKnt7i5XEFPJbB6KQagZqwHtNTVoTBMm12
         qdAKGIc1fdSFd37Ad5yCkAkAnLKYZHlV/Ii969cnuICosCa0ZCI8ZeZaVnpga5qkI2eZ
         he+0zhe5qWfjtgbU4HObfbl+6Mvw+jBbtsDT/iYtErhMVbfbseScSKTHbYRi52+n1wjy
         tyGPCAf/RlQuX5sAaV7Wf8S1zHKu9aPe3gvHiC86ArBd3qSrgi5nRk4D02Y/LRU5buTj
         8by0CqLpNJC4cK9oXpnH7nhns2Avv4IYFPTg+Gx07ZZk3X+RkxJLfMwkn32XSIxleeIw
         eMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692989405; x=1693594205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9OpAPTbZ3wNNM0mxwWe5mRvai82387mVIXj9OVtNdk=;
        b=LfCogJ7RurTpmSS63BOC24+2E71JJ6K8V8WtsWplj3uUQ1vZ8YcYLFgEkoPFzQILXq
         Ku43L7jnI1UAhxNOptmt27JGvOLC1RcRLm14dBN9Jl3eFnJebwcWj8poLwuL2np+DkTG
         satI7VXVmbVMi+9Xh9OUE5+MJPOOaAWYrhxsKQzagXt4CGCgrsRDQoxPlvvS7t6WzU14
         SgT7Ty6qd3zawT+vB93f/qU4Ze0tYL9ojvn+tvpOSx6qjKCci4n1U7sVHG3P7UorvTnv
         6Nl2RzgIDpBzArRki8ABG6VAdZQUbol2u5AqslSEGs9DF+DH3C7S7+CiSWFOTz0kuhmK
         wgyw==
X-Gm-Message-State: AOJu0Yz0x/Hz3Mg22BsOOm87Pen05sW8O1v58/xpfYTMr3r+n2kUhA0B
	ekMHujf6uCZTK2DrH+n8X6s2I6XRGenB/yEjVnM3z4Qg1PEk9ArNFO4iKw==
X-Google-Smtp-Source: AGHT+IFq+roUlNyt9X1sD8n8JL+O82NlCWsAGoBXHT60lEuPonY8dvkPphl1k7OLoVkpKekR8n1wvi0vOjqY/DcDoJc=
X-Received: by 2002:a0c:c984:0:b0:64f:6d93:3cbe with SMTP id
 b4-20020a0cc984000000b0064f6d933cbemr6207479qvk.47.1692989405367; Fri, 25 Aug
 2023 11:50:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308251949.5IiaV0sz-lkp@intel.com> <ZOiapxgvLqM1w+DU@nvidia.com>
In-Reply-To: <ZOiapxgvLqM1w+DU@nvidia.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Aug 2023 11:49:53 -0700
Message-ID: <CAKwvOdmoewb30p1yazbkPAEDPhrSN2csngohDiC2fOJ=3Mufng@mail.gmail.com>
Subject: Re: [linux-next:master 3581/12910] arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7:
 error: attribute declaration must precede definition
To: Jason Gunthorpe <jgg@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jessica Yu <jeyu@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 5:12=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Fri, Aug 25, 2023 at 07:23:29PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   6269320850097903b30be8f07a5c61d9f7592393
> > commit: c1cce6d079b875396c9a7c6838fc5b024758e540 [3581/12910] vfio: Com=
pile vfio_group infrastructure optionally
> > config: powerpc64-randconfig-r001-20230825 (https://download.01.org/0da=
y-ci/archive/20230825/202308251949.5IiaV0sz-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.gi=
t ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce: (https://download.01.org/0day-ci/archive/20230825/2023082519=
49.5IiaV0sz-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308251949.5IiaV0sz-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute dec=
laration must precede definition [-Werror,-Wignored-attributes]
> >            fn =3D symbol_get(vfio_file_iommu_group);
> >                 ^
> >    include/linux/module.h:805:60: note: expanded from macro 'symbol_get=
'
> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visi=
bility("hidden"))); &(x); })
> >                                                               ^
> >    include/linux/vfio.h:294:35: note: previous definition is here
> >    static inline struct iommu_group *vfio_file_iommu_group(struct file =
*file)
> >                                      ^
> > >> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute dec=
laration must precede definition [-Werror,-Wignored-attributes]
> >            fn =3D symbol_get(vfio_file_iommu_group);
> >                 ^
> >    include/linux/module.h:805:65: note: expanded from macro 'symbol_get=
'
>
> This VFIO code is fine..
>
> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visi=
bility("hidden"))); &(x); })
> >                                                                    ^
> >    include/linux/vfio.h:294:35: note: previous definition is here
> >    static inline struct iommu_group *vfio_file_iommu_group(struct file =
*file)
> >                                      ^
> >    2 errors generated.
>
> Clang is complaining about this line
>
> Which is from:
>
> commit 13150bc5416f45234c955e5bed91623d178c6117
> Author: Ard Biesheuvel <ardb@kernel.org>
> Date:   Tue Oct 27 16:11:32 2020 +0100
>
>     module: use hidden visibility for weak symbol references
>
>     Geert reports that commit be2881824ae9eb92 ("arm64/build: Assert for
>     unwanted sections") results in build errors on arm64 for configuratio=
ns
>     that have CONFIG_MODULES disabled.
>
> I assume some tweaking there or a clang change is needed

In my experience, how attributes are "merged" upon redeclaration is
kind of a disaster fest.  Adding new attributes to clang has a fair
amount of boilerplate because "what should happen when something is
redeclared w/ AND w/o the attribute" is a question that the code
reviewers (who also generally happens to be the clang code owner who
had ISO WG14 standardize attributes for C23) force authors to think
about.  The semantics for some must match the compiler that initially
implemented them for compatibility.

This is the method in clang that's emitting that diagnostic:
https://github.com/llvm/llvm-project/blob/1034688d58783779168d59b47d2b3e897=
ad869c6/clang/lib/Sema/SemaDecl.cpp#L3133
As you can see above the line I highlighted, there are different rules
for different attributes, some even dependent on the language mode (C
vs C++).  And that's not all of the logic for function attribute
"merging" upon redeclaration that's alluded to in comments of that
function.

I think this example demonstrates a little clearer what's going on:
https://godbolt.org/z/9d6scv1hE

So based on the warning, it seems like symbol_get() can only be used
before the parameter it's passed is defined, otherwise the "weak" and
"visibility(hidden)" attributes are ignored.  These attributes are
merge-able upon redeclaration up until the first definition.

If the definition of vfio_file_iommu_group() is visible to
virt/kvm/vfio.c, do we even need this weak+hidden redeclaration?
```
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index ca24ce120906..b497b762ddba 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -86,7 +86,7 @@ static struct iommu_group
*kvm_vfio_file_iommu_group(struct file *file)
        struct iommu_group *(*fn)(struct file *file);
        struct iommu_group *ret;

-       fn =3D symbol_get(vfio_file_iommu_group);
+       fn =3D vfio_file_iommu_group;
        if (!fn)
                return NULL;
```
Fixes the error for me in -next (can't repro on mainline):
$ wget https://download.01.org/0day-ci/archive/20230825/202308251949.5IiaV0=
sz-lkp@intel.com/config
-O .config
$ make LLVM=3D1 ARCH=3Dpowerpc -j128 olddefconfig
arch/powerpc/kvm/../../../virt/kvm/vfio.o

The vmlinux target also builds with that change for that randconfig
the bot unearthed.

The all target hits
https://github.com/ClangBuiltLinux/linux/issues/1601 (see below).

But I'll admit I don't fully understand the implications of that
change.  Whenever I see weak symbols I get suspicious, especially for
a kernel that's heavily configurable; usually providing a definition
per config can accomplish what we sometimes use weak linkage for.  At
the least, it makes it obvious at build time what definition will be
observed at runtime; not so for weak symbols.

Also, vfio_file_iommu_group() has two different declarations based on
CONFIG_VFIO_GROUP, which is probably how the bot's randconfig dug this
up. Should my diff above be preprocessor-conditional on that config?
Or should that function be doing something else in case
CONFIG_VFIO_GROUP is not set?

$ grep -rn CONFIG_VFIO_GROUP .config
$ echo $?
1

So the bot's randconfig is reporting an issue specific to
CONFIG_VFIO_GROUP=3Dn where a static inline definition is provided as
the declaration, hence the warning.

The following does not work; the diagnostics are still observed.
```
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index ca24ce120906..fd6046a63605 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -86,6 +86,9 @@ static struct iommu_group
*kvm_vfio_file_iommu_group(struct file *file)
        struct iommu_group *(*fn)(struct file *file);
        struct iommu_group *ret;

+       if (!IS_ENABLED(CONFIG_VFIO_GROUP))
+               return NULL;
+
        fn =3D symbol_get(vfio_file_iommu_group);
        if (!fn)
                return NULL;
```
This also builds:
```
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index ca24ce120906..f76c26f2ee77 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -80,7 +80,7 @@ static bool kvm_vfio_file_is_valid(struct file *file)
        return ret;
 }

-#ifdef CONFIG_SPAPR_TCE_IOMMU
+#if defined(CONFIG_SPAPR_TCE_IOMMU) && defined(CONFIG_VFIO_GROUP)
 static struct iommu_group *kvm_vfio_file_iommu_group(struct file *file)
 {
        struct iommu_group *(*fn)(struct file *file);
@@ -207,7 +207,7 @@ static int kvm_vfio_file_del(struct kvm_device
*dev, unsigned int fd)

                list_del(&kvf->node);
                kvm_arch_end_assignment(dev->kvm);
-#ifdef CONFIG_SPAPR_TCE_IOMMU
+#if defined(CONFIG_SPAPR_TCE_IOMMU) && defined(CONFIG_VFIO_GROUP)
                kvm_spapr_tce_release_vfio_group(dev->kvm, kvf);
 #endif
                kvm_vfio_file_set_kvm(kvf->file, NULL);
@@ -226,7 +226,7 @@ static int kvm_vfio_file_del(struct kvm_device
*dev, unsigned int fd)
        return ret;
 }

-#ifdef CONFIG_SPAPR_TCE_IOMMU
+#if defined(CONFIG_SPAPR_TCE_IOMMU) && defined(CONFIG_VFIO_GROUP)
 static int kvm_vfio_file_set_spapr_tce(struct kvm_device *dev,
                                       void __user *arg)
 {
@@ -288,7 +288,7 @@ static int kvm_vfio_set_file(struct kvm_device
*dev, long attr,
                        return -EFAULT;
                return kvm_vfio_file_del(dev, fd);

-#ifdef CONFIG_SPAPR_TCE_IOMMU
+#if defined(CONFIG_SPAPR_TCE_IOMMU) && defined(CONFIG_VFIO_GROUP)
        case KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE:
                return kvm_vfio_file_set_spapr_tce(dev, arg);
 #endif
@@ -335,7 +335,7 @@ static void kvm_vfio_release(struct kvm_device *dev)
        struct kvm_vfio_file *kvf, *tmp;

        list_for_each_entry_safe(kvf, tmp, &kv->file_list, node) {
-#ifdef CONFIG_SPAPR_TCE_IOMMU
+#if defined(CONFIG_SPAPR_TCE_IOMMU) && defined(CONFIG_VFIO_GROUP)
                kvm_spapr_tce_release_vfio_group(dev->kvm, kvf);
 #endif
                kvm_vfio_file_set_kvm(kvf->file, NULL);
```
Thought that then makes me think that perhaps even better would be
some sort of Kconfig dependency expressed between
CONFIG_SPAPR_TCE_IOMMU and CONFIG_VFIO_GROUP.

Though I do see:
drivers/vfio/Kconfig
7:      select VFIO_GROUP if SPAPR_TCE_IOMMU || IOMMUFD=3Dn

Perhaps something is wrong with that, and randconfig is able to tickle
IOMMUFD=3Dn and still set VFIO_GROUP without SPAPR_TCE_IOMMU.
$ grep -rn -e CONFIG_VFIO_GROUP -e CONFIG_SPAPR_TCE_IOMMU -e
CONFIG_VFIO_GROUP .config
4678:CONFIG_SPAPR_TCE_IOMMU=3Dy

Yi, any thoughts on the above?

>
> (BTW does clang actually work on power, I tried it a bit ago and it
> didn't get very far)

So it looks like in CI we build+boot test the following configs:
https://github.com/ClangBuiltLinux/continuous-integration2/blob/32a9db9c4a4=
b4950407dfceb4bd4c36bf7a6ac4e/generator.yml#L2686
- ppc44x_defconfig
- ppc64_guest_defconfig
- allmodconfig
- fedora's ppc config
- suse's ppc config

I just tried simply defconfig and ran into some hermiticity issues
with the kbuild rules for their vdso:
https://github.com/ClangBuiltLinux/linux/issues/1601
--=20
Thanks,
~Nick Desaulniers
