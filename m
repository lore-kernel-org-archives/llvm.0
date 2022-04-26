Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAD7B
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 18:16:08 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id y2so15548505ybi.7
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 11:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NHalnczSrgV7nsCOyAK5ppIla2Ja271UVepo2Mtht40=;
        b=LMed7+3WdnbUqx53fGaZH7cklJ8mcbKUzxQ4vWrUD0JhVhD1z/0yPBo188RqR3Mqfy
         dRyraF6qUYiCKCr1DnJcAJXCyDB6E9df6SrzG41rsWsnrr3r8wwaIVWMq/5cYclFqhEK
         GiiXXU0PxM7lNxYyCZ6shfw3CGtEdBWheNRhRxkcQjtnpkvT2BenoTRFPM116SKAYtjW
         0s/aBVHnq+CV5f7KQ8F/lmtQB4kveuTKNTJN6xFggsEIutTZQYd3nboIlT8g83JmccaH
         SNvK/Hki8bM33pIsSbfYVi7/06kDHS/6O19532LA9rRIhEHWeOr/xL6R+z0/e0Od6olT
         fIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHalnczSrgV7nsCOyAK5ppIla2Ja271UVepo2Mtht40=;
        b=ucKQ39AzYVRp0sLZFcgkjljPFafJY0dWbXZhvtxdfLKZeirRvZx2f/Hvp6e7IA9Udv
         ZYmLJs2IJKNy8KD4mhg3U77PYGVz7Wgc5C9WBTK2no0Irn1K6ggg9C5lheUIRL9RLEO0
         /9ZBVtErAbAXGosCOJoK+CF+C/RS7qyzSIdjf7y+4L+By88fHowZZNcRqH1QT1Auodp1
         jNzuSZoYL3Wu7eEyZhfxL+Dzh4IOW37bOBjIK32uxHQjwjWQZe0POrAOQaVmHUTPfAHi
         KVc1Cdk3jkELxYNZSOn6AaocWi0bBdQJf2o+J2Jl5xgSHaPk5/UQoENH5WkYOfv25t5o
         Vlcg==
X-Gm-Message-State: AOAM5323+imgQaaE/31YL2mn7FZxPVvx6KdBJe01iuMFwNmEWgvV93q+
	58fwAaqeubYrPfe4OLhW21Yf0KkmyT+85iSUUWIjBA==
X-Google-Smtp-Source: ABdhPJz7V55S2LOXdb5KVVyv7qUZE5R5SmXc4kGPxdfbTmt31xyPMidCAhKnIhA50wcC6/lGYgkY4q2l0A1ifTcm4bA=
X-Received: by 2002:a25:b3c7:0:b0:623:e9fe:e108 with SMTP id
 x7-20020a25b3c7000000b00623e9fee108mr21492504ybf.335.1650996967408; Tue, 26
 Apr 2022 11:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220422201830.288018-1-pcc@google.com> <202204251346.WbwgrNZw-lkp@intel.com>
 <147b11c3-dbce-ccd3-3b0c-c5971135f949@suse.cz>
In-Reply-To: <147b11c3-dbce-ccd3-3b0c-c5971135f949@suse.cz>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 26 Apr 2022 11:15:56 -0700
Message-ID: <CAMn1gO7=PEz=TbDqBV+NnjyZ6pjOgYjAhfdcp4feSTX7W=B2ZA@mail.gmail.com>
Subject: Re: [PATCH v3] mm: make minimum slab alignment a runtime property
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, 
	roman.gushchin@linux.dev, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	David Rientjes <rientjes@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 8:12 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 4/25/22 07:12, kernel test robot wrote:
> > Hi Peter,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on hnaz-mm/master]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Collingbourne/mm-make-minimum-slab-alignment-a-runtime-property/20220423-042024
> > base:   https://github.com/hnaz/linux-mm master
> > config: arm64-buildonly-randconfig-r002-20220425 (https://download.01.org/0day-ci/archive/20220425/202204251346.WbwgrNZw-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         # https://github.com/intel-lab-lkp/linux/commit/3aef97055dd4a480e05dff758164f153aaddbb49
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Peter-Collingbourne/mm-make-minimum-slab-alignment-a-runtime-property/20220423-042024
> >         git checkout 3aef97055dd4a480e05dff758164f153aaddbb49
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from kernel/bounds.c:10:
> >    In file included from include/linux/page-flags.h:10:
> >    In file included from include/linux/bug.h:5:
> >    In file included from arch/arm64/include/asm/bug.h:26:
> >    In file included from include/asm-generic/bug.h:22:
> >    In file included from include/linux/printk.h:9:
> >    In file included from include/linux/cache.h:6:
> >    In file included from arch/arm64/include/asm/cache.h:56:
> >    In file included from include/linux/kasan-enabled.h:5:
> >    In file included from include/linux/static_key.h:1:
>
> Hmm looks like a circular include, cache.h is too "low-level" in the
> hierarchy to bring in kasan->static_key->jump_label.h definitions?
> jump_label.h does include bug.h, but we have it above already and have
> already passed #define _LINUX_BUG_H.
>
> So, a different kind of header with arm64-specific variant?

The fix that I'm pursuing starts with:

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 1522df223c0f..8e8d74edf121 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -6,7 +6,6 @@
 #include <linux/init.h>
 #include <linux/kern_levels.h>
 #include <linux/linkage.h>
-#include <linux/cache.h>
 #include <linux/ratelimit_types.h>
 #include <linux/once_lite.h>

and fixing the fallout from code that was including printk.h and
depending on something from cache.h. So far I haven't found much, only
3 fixups required for an arm64 defconfig kernel but I'm trying some
more configs as well.

Peter
