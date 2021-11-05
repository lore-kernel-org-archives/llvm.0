Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD82C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:10:19 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id g3so16787896ljm.8
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xctl1x0wAPIpZlnq6f38f2NZp6soUETgtNqOArwJJzM=;
        b=S901sIe1SJGG93aoKfsS855Gm77PThXsiZdupcnF8NawwhnX20BnCJNfQRT7I0TxMO
         7NcAAYhXDHJaMszjR1y7zPAZkWv7APWLkT8ZjLXDov83/KLwmoy6vSVUnhLxm7eKCBnK
         dnez262baGeTrvWDGsfHLH47V/gt1WwLxxsskLRbr4mPEUnmM1M9YLeaTXMjsmUhfvD0
         zPTBNTsyQG9JU5oXRLaS2d/xgnmCgHpaUo+yg0DZFT3D9+wtTukXpxUdHVEFlOneVsvW
         exrKtYaaOXZXXs6rOfxP6fuZjnNVZy5PAbZCtFKzOZ6w4c1y9/WRhoYskeoMslhytMZF
         qKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xctl1x0wAPIpZlnq6f38f2NZp6soUETgtNqOArwJJzM=;
        b=wAAle6EcVIy4lZ8tCxf8NMxaNmEHBgnGvR0FySKMG56RQ+HDlTQWKzXzflCC8okyl6
         fQc5mmutfcPWM8ZqQD50iSV0B8vUEj9QMo5yWc0XBfkryTZhFRHF2z3ztAv6t3lKgQWu
         0HSh0/xYR54wjfrWHH9zxqFIhWpECQgbPOzL8l3py3AMX9kMHD8jtNgYXuKYm88i1XyV
         pLoodo2wEH3LGnDc7D4ShVZfMHMGw2wmizvxI2d35aYw+S9fq8ExB4guV8HESmPqMzv/
         1OLYajRPfWxMGbu+FhHNBI7DsqZKHjs4CaeQkRms20xVWCNeE9s2FwqxGugHA3YLDE/M
         HJhw==
X-Gm-Message-State: AOAM532gPWnX75NUw6f7aa12AwuHB6+MEg+uwqHWanisPII2EZu0d0xP
	DXDI111WS6L1zjjHan1dsOoNSMbDpcLG+qtNAVWikw==
X-Google-Smtp-Source: ABdhPJz/pNuybxTziHGrKEHQAev7MHrqaTDzXDbZbR+tropi2HXYuNyxDQQ0qclanKRlpwBlP0UbmMJgxcTUW8EHNBU=
X-Received: by 2002:a2e:834b:: with SMTP id l11mr31087388ljh.339.1636143017849;
 Fri, 05 Nov 2021 13:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105162530.3307666-1-anders.roxell@linaro.org>
In-Reply-To: <20211105162530.3307666-1-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:10:07 -0700
Message-ID: <CAKwvOd=zLuKqo__MyKYdftMgM1Y9K68ppSddokHunrw1Y5qfuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests: cgroup: build error multiple outpt files
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, christian@brauner.io, nathan@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, Andrew Delgadillo <adelg@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:25 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building selftests/cgroup: with clang the following error are seen:

Thanks for the patches!

typo in subject/oneline, and the `:` above can be dropped.

Andrew reported similar failures throughout selftests:
https://lore.kernel.org/linux-kselftest/20211005222739.2491124-1-adelg@google.com/

Both patches touch the same part of tools/testing/selftests/lib.mk.
This approach looks cleaner to me, but it should reconcile the changes
to tools/testing/selftests/filesystems/binderfs/Makefile that Andrew
made in the link above.

>
> clang -Wall -pthread    test_memcontrol.c cgroup_util.c ../clone3/clone3_selftests.h  -o /home/anders/.cache/tuxmake/builds/current/kselftest/cgroup/test_memcontrol
> clang: error: cannot specify -o when generating multiple output files
> make[3]: *** [../lib.mk:146: /home/anders/.cache/tuxmake/builds/current/kselftest/cgroup/test_memcontrol] Error 1
>
> Rework to add the header files to LOCAL_HDRS before including ../lib.mk,
> since the dependency is evaluated in '$(OUTPUT)/%:%.c $(LOCAL_HDRS)' in
> file lib.mk.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  tools/testing/selftests/cgroup/Makefile | 12 +++++++-----
>  tools/testing/selftests/lib.mk          |  2 +-
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/selftests/cgroup/Makefile
> index 59e222460581..745fe25fa0b9 100644
> --- a/tools/testing/selftests/cgroup/Makefile
> +++ b/tools/testing/selftests/cgroup/Makefile
> @@ -11,10 +11,12 @@ TEST_GEN_PROGS += test_core
>  TEST_GEN_PROGS += test_freezer
>  TEST_GEN_PROGS += test_kill
>
> +LOCAL_HDRS += $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/pidfd.h
> +
>  include ../lib.mk
>
> -$(OUTPUT)/test_memcontrol: cgroup_util.c ../clone3/clone3_selftests.h
> -$(OUTPUT)/test_kmem: cgroup_util.c ../clone3/clone3_selftests.h
> -$(OUTPUT)/test_core: cgroup_util.c ../clone3/clone3_selftests.h
> -$(OUTPUT)/test_freezer: cgroup_util.c ../clone3/clone3_selftests.h
> -$(OUTPUT)/test_kill: cgroup_util.c ../clone3/clone3_selftests.h ../pidfd/pidfd.h
> +$(OUTPUT)/test_memcontrol: cgroup_util.c
> +$(OUTPUT)/test_kmem: cgroup_util.c
> +$(OUTPUT)/test_core: cgroup_util.c
> +$(OUTPUT)/test_freezer: cgroup_util.c
> +$(OUTPUT)/test_kill: cgroup_util.c
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index fe7ee2b0f29c..a40add31a2e3 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -141,7 +141,7 @@ endif
>  # Selftest makefiles can override those targets by setting
>  # OVERRIDE_TARGETS = 1.
>  ifeq ($(OVERRIDE_TARGETS),)
> -LOCAL_HDRS := $(selfdir)/kselftest_harness.h $(selfdir)/kselftest.h
> +LOCAL_HDRS += $(selfdir)/kselftest_harness.h $(selfdir)/kselftest.h
>  $(OUTPUT)/%:%.c $(LOCAL_HDRS)
>         $(LINK.c) $(filter-out $(LOCAL_HDRS),$^) $(LDLIBS) -o $@
>
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
