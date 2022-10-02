Received: from condef-06.nifty.com (condef-06.nifty.com [202.248.20.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9B7C
	for <llvm@lists.linux.dev>; Sun,  2 Oct 2022 18:54:53 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-06.nifty.com with ESMTP id 292IongZ031284
	for <llvm@lists.linux.dev>; Mon, 3 Oct 2022 03:50:49 +0900
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 292IoaHD002517
	for <llvm@lists.linux.dev>; Mon, 3 Oct 2022 03:50:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 292IoaHD002517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1664736636;
	bh=5199CJG0f9jSA2BLvx7xOsD0DWd5+auHinU5j6OGRYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lFAcyi/zZJ7+J/SGYh+kKPbNbzHQ5xwA2CpQ6jmv7w/mYUC/XcJNUGJCRJI1E/k7b
	 jDI2DOTqXAwujGa73LMr1KUd4XK7dL03vgZvRWwxL67dk/lNRl9zPQyTOGhJqrp6om
	 rUtu92rfuWYPM7FM/Gh+FdS1FzBbHbTe0Dpkl/iahqso7T043/JBvzgTzZroI8LkR1
	 aBhdrzT4UTBfkAwoF+VhIADt7BWaBcZPIG3aPDEB3rgBLWFICYTy8CDiEUA7QrITFZ
	 +TAwTzZVnxjMPW2sjcqFZdDyw1r97lrDtQlfvETuWT+1hj3d/lpbPnYog8C8cwNGb7
	 NNpDpDbuuQbpg==
X-Nifty-SrcIP: [209.85.160.43]
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1326637be6eso1159751fac.13
        for <llvm@lists.linux.dev>; Sun, 02 Oct 2022 11:50:36 -0700 (PDT)
X-Gm-Message-State: ACrzQf0ll/0gh96jEJairxJQgw22FEWgYaLleaEeSoGFZyTnHwHLdZGE
	gJa0c2gLSBwYZdEgl4+jGx4E8MHJZAe3/i3rpzA=
X-Google-Smtp-Source: AMsMyM4b8QJpq7LHOywiRmkKS3xMkhplz6k8GzxaM3pIe+EGKjjY8htMN3BXkoU04aavfeaaHTL2aNeMzd1Oe78GQ7o=
X-Received: by 2002:a05:6870:8a09:b0:132:554d:2f3d with SMTP id
 p9-20020a0568708a0900b00132554d2f3dmr1791960oaq.194.1664736635502; Sun, 02
 Oct 2022 11:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210021430.SS41iUJO-lkp@intel.com>
In-Reply-To: <202210021430.SS41iUJO-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Oct 2022 03:49:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2tuw=nNKqco1r_qz+HQhQ1cQ7GNwrn9n_86i4nwpWMQ@mail.gmail.com>
Message-ID: <CAK7LNAQ2tuw=nNKqco1r_qz+HQhQ1cQ7GNwrn9n_86i4nwpWMQ@mail.gmail.com>
Subject: Re: [linux-next:master 10827/11993] ERROR: modpost:
 "__sanitizer_cov_trace_pc" [arch/s390/mm/cmm.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 2, 2022 at 3:20 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Masahiro,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   274d7803837da78dfc911bcda0d593412676fc20
> commit: 4f62512adbe9a2fed6c99011a5a3ece929b2f633 [10827/11993] kbuild: use obj-y instead extra-y for objects placed at the head
> config: s390-randconfig-r011-20221002
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4f62512adbe9a2fed6c99011a5a3ece929b2f633
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 4f62512adbe9a2fed6c99011a5a3ece929b2f633
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__sanitizer_cov_trace_pc" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "del_timer_sync" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "unregister_oom_notifier" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "kthread_stop" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "del_timer" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "_raw_spin_lock" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "free_pages" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "__ubsan_handle_out_of_bounds" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "_raw_spin_unlock" [arch/s390/mm/cmm.ko] undefined!
> >> ERROR: modpost: "__wake_up" [arch/s390/mm/cmm.ko] undefined!
> WARNING: modpost: suppressed 16881 unresolved symbol warnings because there were too many)
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp




I will apply the following to fix a TRIM_UNUSED_KSYMS bug,
but the given config cannot yet be built successfully.

Presumably, the rest are unrelated to my patches because
even the mainline kernel is broken for s390 in multiple ways.








diff --git a/Makefile b/Makefile
index eaa7096da5f1..8da45f76ec31 100644
--- a/Makefile
+++ b/Makefile
@@ -1150,10 +1150,10 @@ quiet_cmd_ar_vmlinux.a = AR      $@
        $(AR) mPiT $$($(AR) t $@ | head -n1) $@ $(head-y)

 targets += vmlinux.a
-vmlinux.a: $(KBUILD_VMLINUX_OBJS) FORCE
+vmlinux.a: $(KBUILD_VMLINUX_OBJS) autoksyms_recursive FORCE
        $(call if_changed,ar_vmlinux.a)

-vmlinux.o: autoksyms_recursive vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
+vmlinux.o: vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
        $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o

 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)






--
Best Regards
Masahiro Yamada
