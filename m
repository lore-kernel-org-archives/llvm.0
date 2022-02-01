Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47303FDD
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 01:08:55 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id bd15-20020a056a00278f00b004c7617c47dbso8290927pfb.0
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 17:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:message-id:mime-version:subject:from:to:cc;
        bh=o/Ctb5pvdqwrLO0223Se29dTZOlhSsjZ5d2ehUka66I=;
        b=etjsVyvxzc7GGnO//2K7LB7LkTZ1BVRdiBiYBT1C6zYTHsbZrDskSdgDCC3t1iuWzA
         Es73xw3u8AMCXcdAB6FBLEtaXATkKNJfB7voLQt8EAL97SGbadTk3YIlKbLggC6mp6Rw
         bfbPLyUfUSO1Z0VEEU0tKKwmoRgBbapm2RMizqdLtxUyXTivDY4q3UZYY8Sj2OGjZO3g
         scKPmN8PY6hbjMILBLGd1aKaSKKyzZmaoaLhRzw9lJ+GvIAn2XCcLVMtjst/Lp9tK/qG
         SjGnTxEy5+GzBOcMCyzMKFFrAJIM7VeLveT5mwaxT19QtEKA5IXXJn8o89iXxjJBSMn2
         pPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
         :from:to:cc;
        bh=o/Ctb5pvdqwrLO0223Se29dTZOlhSsjZ5d2ehUka66I=;
        b=ONNKgTxYjR5WbKuwiFsSONN3T4dL7XdLk550AeN5xQrAuHON7uy17joeiAkpVquty2
         EykIu9YQmmlfR6WVUCCNYuKImDOZnBiscAzTbqZlYwYLd9pFx+j8f6mAw24vJK0a7iuT
         OGBxTsnOUPOtapfIEOBS74SgaBUAnfd80bNSxUY6qA5HMuvjploh9Qn+oFFZTwImPMJX
         pbjnWRLYxOxb4uD2jEZoPm69eRgFZAKTrL9SlII62VxkUlCS8VkHbe5uPsQcC5/6y3Yb
         lF0PdGfQ1rH8mIc8ypf1Djrnrai5ThlJSpZNP8jg6+uYnm8E2075TmhVpqq2uLJ7NDj1
         fRrA==
X-Gm-Message-State: AOAM531j2cnm5jwBDtyLZGwetCZhxe22eBXcuKpVB7Ltr/2+7mnCDPVO
	rOwL8G26Tee/tLd0RNNl6bOrQUHH0zM=
X-Google-Smtp-Source: ABdhPJxoV8PyBKTYstfYoP9G1h0gzxSu1PyQr0nSaF8PIuXs5c2bvk3gV2Jkm8KymhboRC/DVy2FtpVEd+k=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:17c6:: with SMTP id
 q64mr27331538pja.170.1643677735134; Mon, 31 Jan 2022 17:08:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Feb 2022 01:08:33 +0000
Message-Id: <20220201010838.1494405-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH 0/5] x86: uaccess CMPXCHG + KVM bug fixes
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

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

Peter Zijlstra (1):
  x86/uaccess: Implement macros for CMPXCHG on user addresses

Sean Christopherson (4):
  Kconfig: Add option for asm goto w/ tied outputs to workaround
    clang-13 bug
  KVM: x86: Use __try_cmpxchg_user() to update guest PTE A/D bits
  KVM: x86: Use __try_cmpxchg_user() to emulate atomic accesses
  KVM: x86: Bail to userspace if emulation of atomic user access faults

 arch/x86/include/asm/uaccess.h | 131 +++++++++++++++++++++++++++++++++
 arch/x86/kvm/mmu/paging_tmpl.h |  45 +----------
 arch/x86/kvm/x86.c             |  35 ++++-----
 init/Kconfig                   |   4 +
 4 files changed, 150 insertions(+), 65 deletions(-)


base-commit: 26291c54e111ff6ba87a164d85d4a4e134b7315c
-- 
2.35.0.rc2.247.g8bbb082509-goog

