Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35137370
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 00:19:59 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c73637061eso2583195ad.3
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 17:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695860399; x=1696465199; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIhlczPTAFSXJtuz0kr4uNehhoedtrBaBEaYSQ3/D3w=;
        b=IJzDO8hcwVc0iLTxwx8XQWSUIZnupgY3gexP58Sdw0/IzMxlOR5i3WkA2SAfgdVrO2
         T9PgtycalAb8uzXko3nb6cWwpd72Ts4gvzjpu4V9do/S7yvMbCp+Rm6pA7TpqD2hkc2o
         S0qQ8yJNjhVWnh80wp3P95Rtn8PC7X+1CeLPxd8A5T4vnkewTKp+9Y/QWnZow+w0Y1Vw
         THXolfPGjyXLonLvTaqoHLxVMy6+K5Auv1aGSYV+P3Sjnr7L8B7S2CHYQ49V90fCONIw
         atXns3UMAowg39rOTucfbBcKjAUwKVPiIbl5sYLgwlGBPqVyys3cnR6UY74xxttPtfVA
         z6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860399; x=1696465199;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIhlczPTAFSXJtuz0kr4uNehhoedtrBaBEaYSQ3/D3w=;
        b=d0rE/XvKy8+i2W4dAGBq4NuysyO6k8MR88x0ry2unAVkWs32j5SkzkuWOFQ7BfJ735
         DVAWUANMnLFSHJsr+8QraYfw/0amNz7qXNGQDV9plu33rwqmldhuO+anKyWbIkMe/Rq5
         +TzaG+7JgM0a7ocFdKlVnnD4GYqP8Eas40Bd6J+z9p/EZYwCBo2+EJzJZlV/M5nsbJJ5
         zzft/wCEev6wwBfbBgCl2KOc6ZfoJSQPpL7nGLIgarh/e59FfRcan0P3kDCpiamcIWRp
         qBOrpVHWVMOirX/sg/+2VKh3EujUB07N9WbW5gR7ok3LlZi4YaxWkIDPk39KMHkp9g2t
         /TKA==
X-Gm-Message-State: AOJu0YxM/HbVjieLIBFVcQAjg9rOp0ZvPSZyB8NtYwvWoel9CXBcUOFg
	w9KB2X4daRvXpznA8Qfi7KiICH1amYc=
X-Google-Smtp-Source: AGHT+IGCbuN35ynl7FnkIb26JwfUSQivcI5ht12Lhq63ANf0P98cgnGB/yAMFxzlpCJU6VRv0zB+soGU8eE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:604:b0:1c0:d418:8806 with SMTP id
 kg4-20020a170903060400b001c0d4188806mr44172plb.12.1695860399477; Wed, 27 Sep
 2023 17:19:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 27 Sep 2023 17:19:51 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928001956.924301-1-seanjc@google.com>
Subject: [PATCH 0/5] KVM: x86: Fix breakage in KVM_SET_XSAVE's ABI
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Tyler Stachecki <stachecki.tyler@gmail.com>, Leonardo Bras <leobras@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Rework how KVM limits guest-unsupported xfeatures to effectively hide
only when saving state for userspace (KVM_GET_XSAVE), i.e. to let userspace
load all host-supported xfeatures (via KVM_SET_XSAVE) irrespective of
what features have been exposed to the guest.

The effect on KVM_SET_XSAVE was knowingly done by commit ad856280ddea
("x86/kvm/fpu: Limit guest user_xfeatures to supported bits of XCR0"):

    As a bonus, it will also fail if userspace tries to set fpu features
    (with the KVM_SET_XSAVE ioctl) that are not compatible to the guest
    configuration.  Such features will never be returned by KVM_GET_XSAVE
    or KVM_GET_XSAVE2.

Peventing userspace from doing stupid things is usually a good idea, but in
this case restricting KVM_SET_XSAVE actually exacerbated the problem that
commit ad856280ddea was fixing.  As reported by Tyler, rejecting KVM_SET_XSAVE
for guest-unsupported xfeatures breaks live migration from a kernel without
commit ad856280ddea, to a kernel with ad856280ddea.  I.e. from a kernel that
saves guest-unsupported xfeatures to a kernel that doesn't allow loading
guest-unuspported xfeatures.

To make matters even worse, QEMU doesn't terminate if KVM_SET_XSAVE fails,
and so the end result is that the live migration results (possibly silent)
guest data corruption instead of a failed migration.

Patch 1 refactors the FPU code to let KVM pass in a mask of which xfeatures
to save, patch 2 fixes KVM by passing in guest_supported_xcr0 instead of
modifying user_xfeatures directly.

Patches 3-5 are regression tests.

I have no objection if anyone wants patches 1 and 2 squashed together, I
split them purely to make review easier.

Note, this doesn't fix the scenario where a guest is migrated from a "bad"
to a "good" kernel and the target host doesn't support the over-saved set
of xfeatures.  I don't see a way to safely handle that in the kernel without
an opt-in, which more or less defeats the purpose of handling it in KVM.

Sean Christopherson (5):
  x86/fpu: Allow caller to constrain xfeatures when copying to uabi
    buffer
  KVM: x86: Constrain guest-supported xfeatures only at KVM_GET_XSAVE{2}
  KVM: selftests: Touch relevant XSAVE state in guest for state test
  KVM: selftests: Load XSAVE state into untouched vCPU during state test
  KVM: selftests: Force load all supported XSAVE state in state test

 arch/x86/include/asm/fpu/api.h                |   3 +-
 arch/x86/kernel/fpu/core.c                    |   5 +-
 arch/x86/kernel/fpu/xstate.c                  |  12 +-
 arch/x86/kernel/fpu/xstate.h                  |   3 +-
 arch/x86/kvm/cpuid.c                          |   8 --
 arch/x86/kvm/x86.c                            |  37 +++---
 .../selftests/kvm/include/x86_64/processor.h  |  23 ++++
 .../testing/selftests/kvm/x86_64/state_test.c | 110 +++++++++++++++++-
 8 files changed, 168 insertions(+), 33 deletions(-)


base-commit: 5804c19b80bf625c6a9925317f845e497434d6d3
-- 
2.42.0.582.g8ccd20d70d-goog

