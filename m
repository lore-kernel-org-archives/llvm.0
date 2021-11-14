Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943D168
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 11:07:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA24D61164
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636888060;
	bh=buVAayEx+5CPu3OrUhG+GSO4OFTp++3bk8DHKQ6NInU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iJgzcowVy7yqxconCrKJgOWzkMpFm7nN8Ii8xKBu6JYXy0OakOFY7weL51Q0GC3Ew
	 MphYF2E9A6BKnYdNr/1X/OR94IcW9POQTqFWkU01u3AZ9CMrjuTTvmBd5aXFp/Z08N
	 kdKHRhowPBwG67/0dzqP4WMLTW8SeeAKmVW0EvROeLFZk1AjhyMoPudPsRFJ/7vBC9
	 vTTFqFJMZi5Wqk0u3FL/Hv3PD6ekAEURSE011mZA4jLieMF/X+IuqEuDq7NDPhHrW0
	 PTD3mU7okGH6utNT3qI0aJeXjUi5EPiyjaWGraH5M9FuaSFhE/7LQNQauB301V8/dc
	 Yh0qlYH3awwRA==
Received: by mail-ot1-f48.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so22044297otl.3
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 03:07:40 -0800 (PST)
X-Gm-Message-State: AOAM531Sg5o3505pj0QPaLH0YV1vN/Gx0UbRw6dGTUfa7ldFG4QvQ2No
	z7W0cQVZrzsmtseENUURdeUpw8yXOgIg0nAxZMY=
X-Google-Smtp-Source: ABdhPJxQerNUvBbNfwqiwqwBfbD4oSdMPyuFbwjHBnH1nq+K/zhIMq6dWlLuPaKrjC8MHXtA7yu+SVNEdbrepZkT3YI=
X-Received: by 2002:a05:6830:1445:: with SMTP id w5mr24853293otp.112.1636888059988;
 Sun, 14 Nov 2021 03:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202111141650.o5b2LSZU-lkp@intel.com> <0b7463e699956abb0f8b0da7a9254500@kernel.org>
In-Reply-To: <0b7463e699956abb0f8b0da7a9254500@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 14 Nov 2021 12:07:28 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE5T4pWVBUPiZRqw1S122DHVQkZn9GwNHx2cr4=MfndeQ@mail.gmail.com>
Message-ID: <CAMj1kXE5T4pWVBUPiZRqw1S122DHVQkZn9GwNHx2cr4=MfndeQ@mail.gmail.com>
Subject: Re: [arm-platforms:hack/m1-pmu 8/8] drivers/perf/apple_m1_cpu_pmu.c:100:32:
 warning: initializer overrides prior initialization of this subobject
To: Marc Zyngier <maz@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Nov 2021 at 11:11, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-11-14 08:25, kernel test robot wrote:
> > tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> > hack/m1-pmu
> > head:   a905c66ae0b391425e9ad7f261ad7b4c33af2c07
> > commit: a905c66ae0b391425e9ad7f261ad7b4c33af2c07 [8/8] drivers/perf:
> > Add Apple icestorm/firestorm CPU PMU driver
> > config: arm64-randconfig-r036-20211114 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project
> > c3dddeeafb529e769cde87bd29ef6271ac6bfa5c)
> > reproduce (this is a W=1 build):
> >         wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> > -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         #
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=a905c66ae0b391425e9ad7f261ad7b4c33af2c07
> >         git remote add arm-platforms
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> >         git fetch --no-tags arm-platforms hack/m1-pmu
> >         git checkout a905c66ae0b391425e9ad7f261ad7b4c33af2c07
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> > ARCH=arm64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/perf/apple_m1_cpu_pmu.c:100:32: warning: initializer
> >>> overrides prior initialization of this subobject
> >>> [-Winitializer-overrides]
> >            [M1_PMU_PERFCTR_UNKNOWN_01]     = BIT(7),
> >                                              ^~~~~~
> >    include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
> >    #define BIT(nr)                 (UL(1) << (nr))
> >                                    ^~~~~~~~~~~~~~~
> >    drivers/perf/apple_m1_cpu_pmu.c:99:32: note: previous initialization
> > is here
> >            [0 ... M1_PMU_PERFCTR_LAST]     = ANY_BUT_0_1,
> >                                              ^~~~~~~~~~~
>
> Oh please, not that thing again. I've commented on this many times,
> and this warning is just bogus. Initialisation override is a necessity,
> and working around this warning leads to something that is far less
> maintainable, and thus more *dangerous* than this.
>
> I really wish this warning was simply turned off, because it only
> leads to the robot emails to be ignored do to the number of false
> positives.
>

Agreed, very annoying indeed. Should we just do

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index d53825503874..feeed72fe011 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -36,6 +36,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-type-limits
+KBUILD_CFLAGS += $(call cc-option, -Wno-initializer-overrides)

 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1

@@ -45,7 +46,6 @@ else
 # Suppress them by using -Wno... except for W=1.

 ifdef CONFIG_CC_IS_CLANG
-KBUILD_CFLAGS += -Wno-initializer-overrides
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
