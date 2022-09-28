Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E317B
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:36:54 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id l72-20020a63914b000000b00434ac6f8214so8169921pge.13
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date;
        bh=2pXCrSXWl1T4eX1bVR4OHLDGtpZ9ki0sWDT+FbUrrU8=;
        b=b+9vn0zTKNR2FojgWlts3uoe/JXZN2JH1KJjrm0TZRBrRuIXf5FDv29xkQBUtG3n+j
         XpP7L1IsksHQj6mCNmyYd4MmcvLYD4wgZfZt4ZzNWZpjOLu0lfD9h1eX5ifx7rVLlUOw
         zqsURMqdQVsKTv0pkJdciO9ACPAcWhlvrHefVXME5RhIO1XgceAYz9ec7C+EFGiRBxlR
         h26zbVdWE77aD9Mwy3sgUr3+ORSWMw2vLR+0duXGgAcbwSGTdpIzuOp0509LaEmurTB9
         xyL7BfQxQ8CTuTXPh6RS29X1rsdDaSrolyGKDZam/H79Ct4omhtCF4am61ScSPVSBTBW
         g2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2pXCrSXWl1T4eX1bVR4OHLDGtpZ9ki0sWDT+FbUrrU8=;
        b=OfY+VAVU1t/PilYbD3Zz7wc70QaFzwJgLVF7/GTjInvkCgLyZuHrEtWCkOoe9/BriF
         nVuBE+LbsIHHnhgqhqlwdLYA7zZ6uwgK2uo/yDaRJWBfXJLHx1yAzFwxSFOnJTc1GpMl
         K8ilPdG6cX9FGVUjlonwIUGYfU+7zUWhbw4V9dEp4cAemJyd+I9HSWr/wXQC+Pb6pK/E
         SoZR/Tz+UxSKFaqEpOTmqG4JPwOkV2cO3bM4T4ho+Ex0AIl2HSvfHEu5i/MOeNWbBJgD
         J9K29hS/CHpOR1h5FXKQTOsZrogBHZJIY+b2p3fMwA6cMrqoq3MfkrO+y/j2q3Ogu67Z
         t+zQ==
X-Gm-Message-State: ACrzQf3zNKn/BuZRCf6NBdqt8bP0W/sw9iiIiMMBkFHv1siVHbEihjtr
	jKaYlh0igysaqYm8sOY6TMFrh7ShdVM=
X-Google-Smtp-Source: AMsMyM4m1kvBj79SpCMVIWeOzwVKAmDgr9al369YFf9ecOKFtWXFeDu5iqUC3jBWHQNYG2DKFWb3uPHkL7I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:13a5:b0:542:4a6d:9a1e with SMTP id
 t37-20020a056a0013a500b005424a6d9a1emr497304pfg.43.1664408214406; Wed, 28 Sep
 2022 16:36:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Sep 2022 23:36:45 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928233652.783504-1-seanjc@google.com>
Subject: [PATCH v2 0/7] KVM: selftests: Fix "fix hypercall test" build errors
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

After a toolchain upgrade, the x86 fix_hypercall_test started throwing
warnings due to -Werror=array-bounds rightly complaining that the test is
generating an out-of-bounds array access.

The "obvious" fix is to replace the memcpy() with a memcmp() and compare
only the exact size of the hypercall instruction.  That worked, until I
fiddled with the code a bit more and suddenly the test started jumping into
the weeds due to gcc generating a call to the external memcmp() through the
PLT, which isn't supported in the selftests.

To fix that mess, which has been a pitfall for quite some time, provide
implementations of memcmp(), memcpy(), and memset() to effectively override
the compiler built-ins.  My thought is to start with the helpers that are
most likely to be used in guest code, and then add more as needed.

v2:
 - Revert a patch that avoided memset(). [Jim]
 - Collect reviews. [Oliver]
 - Rename kvm_string.c => string_overrides.c. [David]
 - Tweak the "fix hypercall" test to verify that the original opcode
   is preserved exactly. [Oliver]
 - Further dedup code in the "fix hypercall" test.

v1: https://lore.kernel.org/all/20220908233134.3523339-1-seanjc@google.com

Sean Christopherson (7):
  KVM: selftests: Implement memcmp(), memcpy(), and memset() for guest
    use
  KVM: selftests: Compare insn opcodes directly in fix_hypercall_test
  KVM: selftests: Remove unnecessary register shuffling in
    fix_hypercall_test
  KVM: selftests: Hardcode VMCALL/VMMCALL opcodes in "fix hypercall"
    test
  KVM: selftests: Explicitly verify KVM doesn't patch hypercall if
    quirk==off
  KVM: selftests: Dedup subtests of fix_hypercall_test
  Revert "KVM: selftests: Fix nested SVM tests when built with clang"

 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/lib/string_override.c       |  39 +++++
 tools/testing/selftests/kvm/lib/x86_64/svm.c  |  14 +-
 .../selftests/kvm/x86_64/fix_hypercall_test.c | 134 +++++++-----------
 4 files changed, 103 insertions(+), 95 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/lib/string_override.c


base-commit: c59fb127583869350256656b7ed848c398bef879
-- 
2.37.3.998.g577e59143f-goog

