Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDB6322B
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 20:04:44 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-64f76ffab85so8027046d6.2
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692993883; x=1693598683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs29xw10SRNGIK+cNNQqN7g2ipvhccnPkcKfeXZtYSs=;
        b=2DCP05hsG4eQDJywmHXXJnqzuHw9Y/wgrbGd0CVa91cm9CiOWAPFU8JkiRaGUs43sh
         GRKwTmy6aaVO4Kzpb8C1buCE+VlYi8w5hnIqxHBVCDVWiZvuAyub+atxpJOhNxFTlQbs
         uGkKPCTe+VmYSGONIjzEklBNeS8wndTpps90TGqxndQ3w2B5FrvaQ5N4kcycPBj8gPsu
         j/XK7UIhk6+xziFeYCXCPHbsLi0qwk725VFHcHtC/voBttGT7bFoB6drmMuByKZBZb25
         Lw3eoRMkcxhIp0bdLmSvcrhMFziuihKKRdJ2eWjKYxxa6RWqk0FDU6GcW35CqEda/n5K
         vRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692993883; x=1693598683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bs29xw10SRNGIK+cNNQqN7g2ipvhccnPkcKfeXZtYSs=;
        b=EJc7dPEfQGkehL7MQJ7o/OdUgk2k2Ch3/lhmobQlAnBFa1gpoNsb51LVrtSHu2/GqH
         Wj9tdRjLU6+BuIgIpMuFP+j2ZJFqX4u3SvmpJ8SHN9A9kGpiYcmMFO3lfHhzK7Mqrfa4
         QXRpbCY27/1r0aWvCgHlF23SOsoqMwHw1utuQ2jcFR1OK+Sna0GW/ug2LGDN0op0eEe2
         XReAAJtrXxcoz0hjjXy6W64j0O8QQYG9UEWkKhleArJYSsp+qxVEbX+MigmS9RikuGXV
         pU5b7MEl+ynoVIltlDf93/liu4LFQqmpFR4TD9nkHn1YdOZodXr4l78uNHAb+sYbSekp
         YdlA==
X-Gm-Message-State: AOJu0Yz9lqjCjb+IJ/zGqEIT1sYOfPqlAEbBoxAnvbHs4DK0+4PIcE8T
	yYsPLPItAQaGBt9GoLwJPCejqMP6Jk0kR/LeiVPZbg==
X-Google-Smtp-Source: AGHT+IFZ6NuIfRAXBaz7gAFVr7wWN+jiMnVHDzKWRspR3LpMEU/QY+aa/ZtinnL4fwAbN4krsf3cMJQrkYdA6NcETYQ=
X-Received: by 2002:a0c:8e83:0:b0:635:e0dd:db4b with SMTP id
 x3-20020a0c8e83000000b00635e0dddb4bmr18237764qvb.37.1692993883038; Fri, 25
 Aug 2023 13:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308251949.5IiaV0sz-lkp@intel.com> <ZOiapxgvLqM1w+DU@nvidia.com>
 <CAKwvOdmoewb30p1yazbkPAEDPhrSN2csngohDiC2fOJ=3Mufng@mail.gmail.com> <ZOkDvPOt/UMprbU4@nvidia.com>
In-Reply-To: <ZOkDvPOt/UMprbU4@nvidia.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Aug 2023 13:04:31 -0700
Message-ID: <CAKwvOdnBg2aY+WwG_GGusRcf-XPZYyqNAYoDb62dJw1MoZs_Nw@mail.gmail.com>
Subject: Re: [linux-next:master 3581/12910] arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7:
 error: attribute declaration must precede definition
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Yi Liu <yi.l.liu@intel.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jessica Yu <jeyu@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 12:40=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> On Fri, Aug 25, 2023 at 11:49:53AM -0700, Nick Desaulniers wrote:
> > I think this example demonstrates a little clearer what's going on:
> > https://godbolt.org/z/9d6scv1hE
> >
> > So based on the warning, it seems like symbol_get() can only be used
> > before the parameter it's passed is defined, otherwise the "weak" and
> > "visibility(hidden)" attributes are ignored.  These attributes are
> > merge-able upon redeclaration up until the first definition.
>
> No, that doesn't make sense. The macro does:
>
> #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibilit=
y("hidden"))); &(x); })
>
> x must be defined for typeof(x) to work.

x must be //declared// for typeof(x) to work, but x doesn't need to be
//defined//.
https://godbolt.org/z/qv6zPWf9K

But I think it's kind of moot, given the kconfig discussion below.

>
> I think the issue is that:
>
> # CONFIG_VFIO is not set
> CONFIG_KVM_VFIO=3Dy
>
> And
>
> kvm-$(CONFIG_KVM_VFIO) +=3D $(KVM)/vfio.o
>
> Which is a combination that doesn't make any sense.
>
> Looks like CONFIG_KVM_VFIO should probably be called CONFIG_KVM_ARCH_VFIO
>
> And then
>
> config KVM_VFIO
>      bool
>      depends on KVM_ARCH_VFIO
>      depends on VFIO
>
> (or similar)
>
> So we don't even attempt to compile kvm/vfio.c if we don't have VFIO
> support turned on.

Do we need to split the Kconfig?

```
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 484d0873061c..e5ebf89de855 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -61,6 +61,7 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT

 config KVM_VFIO
        bool
+       depends on VFIO

 config HAVE_KVM_INVALID_WAKEUPS
        bool
```
$ ./scripts/config -e VFIO
$ make LLVM=3D1 ARCH=3Dpowerpc -j128 olddefconfig
arch/powerpc/kvm/../../../virt/kvm/vfio.o
#
# configuration written to .config
#
  SYNC    include/config/auto.conf.cmd
  CALL    scripts/checksyscalls.sh
  CC      arch/powerpc/kvm/../../../virt/kvm/vfio.o
$
--=20
Thanks,
~Nick Desaulniers
