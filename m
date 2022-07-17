Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BAF257A
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 17:20:27 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-10bec750eedso18531243fac.8
        for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=grw/pz3Zua7cI68+oYf/bDljO1Y2eE1dUY9D6tLE22Y=;
        b=BZdVnLIy0ONlvEdEWrgBy+TJVQaXG7t3iTPM8HvvvBRmekvlaU5268f0QWHHJTeEBD
         AHPhiSqwAnSom+gvg8z+6QjGwNTuTzI5ylsiWP+uXl5/y98RE04P4OynOw1yMibrCH+w
         aIpRp8pyeQ6J+VwPGx0CR6sf1Le1NOUcDiOPUX3Bi8Dab2A/qpPuTRavYuJSmC2F996+
         cFyWvA5oVvV8X/vEQHYtekagYsRMChgB7o29/mgQioexLC8+nj/XZ7htCdZKnuog3Lhn
         X8xhBMF44pn6n4/KCg+ojejxpIK89giNN3rynDvd+1qNrbLk1Ya5qhXocZR43YmLlspL
         FiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=grw/pz3Zua7cI68+oYf/bDljO1Y2eE1dUY9D6tLE22Y=;
        b=dM5PfC6Iqw9zLLwzD+BA2PghWu/JmPr4MBXinb8nqEjMz6etqHAAwo8PIiWuwxL+bQ
         E2eSFn6fynElfj2izNocyKTpjdHcWtXamS2xqiSerasc+SNRCdMV+krJXEUIt7Z22SaX
         X57EZ5WrZ9/qRL+JhvV/V6BwlV6srbBM0ahIP8TeyFc4nrRQFzG6xKbzFoo9ntM5H6+T
         lyfKYQyKTcHc8RoLx87ByTyehG7zmpiHDrmEXEiIuJR8QdjKLMnZsmuC6T8gURsM1kT3
         oG0YisFapC16CGZOwBEenJXG6TYHspIF9Tu/f6REoeihDL5UXKrSM9xa9bFRXctVIu0z
         uPLw==
X-Gm-Message-State: AJIora8DWhcO3cEifZhcPZrxm0rh4d1HtxFA0PpXZ07XVT7JoPwX9A8S
	0XtTka9zYBoxit4/NPnjDDySMap1Mx3oUNpTCwc=
X-Google-Smtp-Source: AGRyM1sE9lwTCXvkICNw4Vy6kiDxkwIkUti1WeuRFZCzOKVKZvcqM3doi/FAxji4fTmAYhFGxe5ALjOpr7A+KtqPlrI=
X-Received: by 2002:a05:6870:7a9:b0:10b:f5ef:5d27 with SMTP id
 en41-20020a05687007a900b0010bf5ef5d27mr12866724oab.252.1658078426479; Sun, 17
 Jul 2022 10:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUURRcY+f6OHbAqc_ruUSsft8hMttOy9TS=k0MnATpjLGg@mail.gmail.com>
 <YtA8ZH5sZWL35/Pr@dev-arch.thelio-3990X>
In-Reply-To: <YtA8ZH5sZWL35/Pr@dev-arch.thelio-3990X>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 17 Jul 2022 19:19:50 +0200
Message-ID: <CA+icZUVmJ+tu=PSTVmLUFs1Sm4-WZ4Hc_YkFZ94AptjnF9-9rw@mail.gmail.com>
Subject: Re: Linux v5.19-rc6: Building and testing x86/retbleed
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 5:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
>

Hi Nathan,

today, I had some time for testing.

> Hi Sedat!
>
> On Thu, Jul 14, 2022 at 11:49:33AM +0200, Sedat Dilek wrote:
> > Hi,
> >
> > as far as I can see to fully support x86/retbleed you need LLVM-15?
>
> > Due to:
> >
> > [ arch/x86/Kconfig ]
> > config CC_HAS_RETURN_THUNK
> > def_bool $(cc-option,-mfunction-return=thunk-extern)
>
> Per the documentation, rethunks are only effective for certain AMD Zen
> platforms so unless you have one of those CPUs, you don't need a new
> compiler for the retbleed mitigations. Additionally, you might have an
> old enough CPU that doesn't require them anyways, the affected models
> can be seen in the cpu_vuln_blacklist variable in
> arch/x86/kernel/cpu/common.c.
>
> For the record, here is the output of the retbleed sysfs node on all of
> my x86 hardware:
>
> AMD Threadripper 3990X: Mitigation: untrained return thunk; SMT enabled with STIBP protection
> Intel Core i7-11700: Mitigation: Enhanced IBRS
> AMD Ryzen 3 4300G: Mitigation: untrained return thunk; SMT enabled with STIBP protection
> Intel Core i5-4210U: Not affected
>

Thanks for these details, but my question was about compile-ability.

> > Has someone a commit-id which supports above and is stable/safe?
>
> This is the latest compiler I built and everything appears to work fine:
>
> $ clang --version | head -1
> ClangBuiltLinux clang version 15.0.0 (https://github.com/llvm/llvm-project 0406c0cda675f3cb7d294a3e65eb4f19c9efe98b)
>

I was able to build and boot...

# cat /proc/version
Linux version 5.19.0-rc6-1-amd64-clang15-lto
(sedat.dilek@gmail.com@iniza) (Debian clang version
15.0.0-++20220716100712+45067f8fbf61-1~exp1~20220716220809.624, Debian
LLD 15.0.0) #1~bookworm+dileks1 SMP PREEMPT_DYNAMIC 2022-07-17

[ DIFFCONFIG ]

$ scripts/diffconfig ../configs/config-5.19.0-rc6-1-amd64-clang14-lto
/boot/config-5.19.0-rc6-1-amd64-clang15-lto | egrep -v
'XEN_VIRTIO|XEN_GRANT_DMA_OPS|INTEL_IFS'
AS_VERSION 140005 -> 150000
BUILD_SALT "5.19.0-rc6-1-amd64-clang14-lto" -> "5.19.0-rc6-3-amd64-clang15-lto"
CC_VERSION_TEXT "dileks clang version 14.0.5
(https://github.com/llvm/llvm-project.git
c12386ae247c0d46e1d513942e322e3a0510b126)" -> "Debian clang version
15.0.0-++20220716100712+45067f8fbf61-1~exp1~20220716220809.624"
CLANG_VERSION 140005 -> 150000
LLD_VERSION 140005 -> 150000
+CC_HAS_RANDSTRUCT y
+CC_HAS_RETURN_THUNK y
+CC_HAS_SLS y
+CC_HAS_ZERO_CALL_USED_REGS y
+CPU_IBPB_ENTRY y
+CPU_IBRS_ENTRY y
+CPU_UNRET_ENTRY y
+RANDSTRUCT_FULL n
+RETHUNK y
+SLS y
+SPECULATION_MITIGATIONS y
+ZERO_CALL_USED_REGS n

Have set SLS y (as Debian enabled it) but cannot say what is with
ZERO_CALL_USED_REGS and RANDSTRUCT_FULL Kconfigs - disabled for now.

[ WARNINGS ]

Known warnings:

$ grep warning: build-log_5.19.0-rc6-1-amd64-clang15-lto.txt
59:dpkg-architecture: warning: specified GNU system type
x86_64-linux-gnu does not match CC system type x86_64-pc-linux-gnu,
try setting a correct CC environment variable
45362:drivers/net/wireless/realtek/rtlwifi/rtl8192cu/rtl8192cu.o:
warning: objtool: .text.rtl92cu_hw_init: unexpected end of section

^^ https://github.com/ClangBuiltLinux/linux/issues/1613
https://github.com/ClangBuiltLinux/linux/issues/1613#issuecomment-1077949287

New warnings:

61600:vmlinux.o: warning: objtool:
.text.seg6_local_fill_encap.llvm.12745529623442014871: unexpected end
of section
61601:vmlinux.o: warning: objtool:
.text.seg6_local_cmp_encap.llvm.12745529623442014871: unexpected end
of section

[ MITIGATIONS ]

# for v in $( ls /sys/devices/system/cpu/vulnerabilities/ ) ; do echo
[ $v ] ; cat /sys/devices/system/cpu/vulnerabilities/$v ; done
[ itlb_multihit ]
KVM: Mitigation: VMX disabled
[ l1tf ]
Mitigation: PTE Inversion; VMX: conditional cache flushes, SMT vulnerable
[ mds ]
Mitigation: Clear CPU buffers; SMT vulnerable
[ meltdown ]
Mitigation: PTI
[ mmio_stale_data ]
Not affected
[ retbleed ]
Not affected
[ spec_store_bypass ]
Mitigation: Speculative Store Bypass disabled via prctl
[ spectre_v1 ]
Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[ spectre_v2 ]
Mitigation: Retpolines, IBPB: conditional, IBRS_FW, STIBP:
conditional, RSB filling
[ srbds ]
Not affected
[ tsx_async_abort ]
Not affected

CPU: Intel SandyBridge

> > Has anyone numbers w/ and w/o enabling x86/retbleed?
>
> I haven't noticed any major slow downs while compiling kernels, which is
> the main use case for my workstation, but it is a Zen platform so I am
> not paying the IBPB penalty, which will be worse. Some stats of my full
> set of builds against linux-next and mainline:
>
> Before:
>
> linux-next: 2h 29m 44s
> mainline: 2h 21m 49s
>
> After:
>
> linux-next: 2h 34m 04s
> mainline: 2h 23m 53s
>
> I would say that is within the noise of thermal throttling and other
> variables.
>

Thanks for the numbers, Nathan.

Regards,
-Sedat-

[ x86/retbleed: Add call depth tracking mitigation ] (Skylake)
https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/log/?h=depthtracking
