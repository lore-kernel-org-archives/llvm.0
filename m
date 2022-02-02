Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2392F25
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 00:49:59 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id o21-20020a17090ad25500b001b7f9cf30ddso4195762pjw.2
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 16:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=g6pUKH4WYbWgbDwKBU0IMA28eYRiLDk9vkLPEbdpMnw=;
        b=i6JiUALu1FJfRzDuhQAUfNtgTJ+zakIybzPqhobpinojJGET1wdn+8w02g/1G8c/H0
         7QiDU6eahxRSKVG3t2E+6wnV4blltOS12NFn0qEn3cTBzKBdZm4FSw4t5yT52CSuQX8E
         lXLrFH9oXa6Pki+a22egJUg8qRAHrTul1SgjAb1wUYTyEoE6HBAZtD+0GTr0+5gYVt7U
         5nzJewN75+ggCxUb7KSEUmXMOAQ/ZiJrnlrWyWJ+napeTa7EiMoh1Gim19or+92uhDWW
         AUMctQKhwgDXukqrxVdGb9WjcJc7tJSeTUJou6BVURmtfUUhsX9NY7opH+tSveXGbRIp
         wMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=g6pUKH4WYbWgbDwKBU0IMA28eYRiLDk9vkLPEbdpMnw=;
        b=ZPMgC29/WEwpX0wpagRZzpEyfWkZe0iki8BjrECYoeMFt0UY7DQoNHrck46KxRaA+0
         6Q0hBLJ6IfvFnx4gHPcyvpP12zCSc+LKMAsLvZhC0Wr0K367oQaNuCgASz2DDvFjMe+I
         9PLjbVsVHGMC956++L3hFcPyzqR0Zt3WPSQ9VbUEuH+LR058S4m4or1+7GbsQA3Sh3Zq
         uQgW7SU1iWGzCfYOt7WJ5eFuV4NuFSVUN9pq1njxuDUffA1CCq+0Mcm8+IjzrDLsbXz4
         jE6nZF9UyH+JHwHD8A0lijbqLFhwjQHZMp+s+RPBD5f6pbna1wjrZjuImG0fHAEX+HGt
         Eh/g==
X-Gm-Message-State: AOAM5328BcUMzTB1ZF8CgAq08ehgvD0f3fJfVMUOIMGdGr7jIJnNR04A
	3Zj/GdSe50ewkwBdBMgrlEdq23iGpOI=
X-Google-Smtp-Source: ABdhPJwlOwN/0H3aP3IPT+BMUXP+/p+nmyTa05iEyOcuehJZ4qfPcXwrDRkyY7xiTPbyi6tBdy0W4Scx52c=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:ecc5:: with SMTP id
 a5mr29153463plh.54.1643762998560; Tue, 01 Feb 2022 16:49:58 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Feb 2022 00:49:40 +0000
Message-Id: <20220202004945.2540433-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v2 0/5] x86: uaccess CMPXCHG + KVM bug fixes
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Tadeusz Struk <tadeusz.struk@linaro.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Peter, please take a look at unsafe_try_cmpxchg_user() to make sure it
(a) still looks right and (b) works for your use case.  I added explicit
casts to play nice with clang and sparse, as well as a __chk_user_ptr()
given the use of __force.


Add uaccess macros for doing CMPXCHG on userspace addresses and use the
macros to fix KVM bugs by replacing flawed code that maps memory into the
kernel address space without proper mmu_notifier protection (or with
broken pfn calculations in one case).

Add yet another Kconfig for guarding asm_volatile_goto() to workaround a
clang-13 bug.  I've verified the test passes on gcc versions of arm64,
PPC, RISC-V, and s390x that also pass the CC_HAS_ASM_GOTO_OUTPUT test.

Patches 1-4 are tagged for stable@ as patches 3 and 4 (mostly 3) need a
backportable fix, and doing CMPXCHG on the userspace address is the
simplest fix from a KVM perspective.

v2:
  - Explicitly cast with (__force u<size> *) to fix clang+i386
    compilation woes and sparse warnings. [kernel test robot]
  - Rework i386's CMPXCHG8B to force use of ECX for the error path so that
    clang doesn't run out of input/output GPRs...
  - Document that gcc also has/had troubles, and note the clang and gcc
    versions that (should) work with tied outputs. [Nick]
  - Collect tags [Nick, Tadeusz]

v1: https://lore.kernel.org/all/20220201010838.1494405-1-seanjc@google.com

Peter Zijlstra (1):
  x86/uaccess: Implement macros for CMPXCHG on user addresses

Sean Christopherson (4):
  Kconfig: Add option for asm goto w/ tied outputs to workaround
    clang-13 bug
  KVM: x86: Use __try_cmpxchg_user() to update guest PTE A/D bits
  KVM: x86: Use __try_cmpxchg_user() to emulate atomic accesses
  KVM: x86: Bail to userspace if emulation of atomic user access faults

 arch/x86/include/asm/uaccess.h | 142 +++++++++++++++++++++++++++++++++
 arch/x86/kvm/mmu/paging_tmpl.h |  45 +----------
 arch/x86/kvm/x86.c             |  35 ++++----
 init/Kconfig                   |   5 ++
 4 files changed, 162 insertions(+), 65 deletions(-)


base-commit: 26291c54e111ff6ba87a164d85d4a4e134b7315c
-- 
2.35.0.rc2.247.g8bbb082509-goog

