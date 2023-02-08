Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0C749D
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 20:54:32 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id v23-20020aa78097000000b005748c087db1so10273518pff.2
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 12:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ihU1H4kZ9BjK5BcY5kQ6fGB4N5NmwmZSluNBW8G1cI=;
        b=mZ8IRkuppbwH/Q7ZOij1/LaDs10DIEKxqqKtIBPgb20l6Ct5FzmeWBp01YIQjZVf81
         Kr4ZdZYTre23RMKGNagFEoRP131lzyBy7eHruK25mWjK13ejGNFegVNjB3pcR5ICzL38
         zfbt8w/3J8M+VXDQpJv2jddRyKcMBJ7mKp9+/H0cE350oCVKoHMYyi/WN+P5szigzExc
         GA3CdT5dsF52+bmlYcRtSHWWPghOIflLUQMdZyF87Boy1dmYheS1t+IGW15z+v4ZcNEa
         wWrRCm+vw6KbYs0kTZtujmspAzB4DBBenjOryG3gIbQYfQdQDsG5kXetcyzOMj13b7X0
         xfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ihU1H4kZ9BjK5BcY5kQ6fGB4N5NmwmZSluNBW8G1cI=;
        b=qvs3U5UNxxn3ZBYOS1fhkivWHXXC7JqGptrBr6fuwMaLhN1S4dk1TiziTMEGPHLExX
         yHo0jN6z0clSCfXJ3kovIK16fC/tceOX8c2/T8nJV4voD7tFNBqOM2TaEKjhfgjnnblg
         H/RU0K1rsDUCNjq+6ILUqxCPiV2L9I1ivT+xbut4fMeKrgi79TLrjDTSxJGXtXh7Os5Z
         nz1ZN/SIInIR38YmHkjCYX+UD1NV/Mn4piBmR8w1fO1w4MzWex3Vvni1sFmdBo4D9MdW
         0OD0ZNrF/toNRnnrwqgHVQ1cP2vpeJZT31J3SW2H7WUdfTupWe53j/g6PqwAY099LcLJ
         809w==
X-Gm-Message-State: AO0yUKUHlLMoYwpSkJzzWqZ1mB3JnxKFdhy30fqJHHeJeasUXMm3H79c
	c21yod9LAqFrIyR9RL+sBwHSG3vVugE=
X-Google-Smtp-Source: AK7set+WzLnQGVkN6I5+PWOMSY+SQMCEZJbhZPXo65r0/yDnDBzQ8PwacG5KSOG6Z2oourUgRxDCL/0DV7g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:db0d:b0:199:4e77:7fa8 with SMTP id
 m13-20020a170902db0d00b001994e777fa8mr774950plx.4.1675889672359; Wed, 08 Feb
 2023 12:54:32 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  8 Feb 2023 20:54:28 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230208205430.1424667-1-seanjc@google.com>
Subject: [PATCH 0/2] KVM: VMX: Stub out enable_evmcs static key
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Stub out the enable_evmcs static key for CONFIG_HYPERV=n.  gcc (as of
gcc-12) isn't clever enough to elide the nop placeholder when there's no
code guarded by a static branch.  With gcc-12, because of the vast number
of VMCS accesses, eliminating the nops reduces the size of kvm-intel.ko by
~7.5% (200KiB).

Patch 1 is tangentially related cleanup.

Applies on `git@github.com:kvm-x86/linux.git vmx`.

Sean Christopherson (2):
  KVM: nVMX: Move EVMCS1_SUPPORT_* macros to hyperv.c
  KVM: VMX: Stub out enable_evmcs static key for CONFIG_HYPERV=n

 arch/x86/kvm/vmx/hyperv.c  | 107 +++++++++++++++++++++++++++++++++-
 arch/x86/kvm/vmx/hyperv.h  | 115 +++----------------------------------
 arch/x86/kvm/vmx/vmx.c     |  15 +++--
 arch/x86/kvm/vmx/vmx_ops.h |  22 +++----
 4 files changed, 132 insertions(+), 127 deletions(-)


base-commit: 93827a0a36396f2fd6368a54a020f420c8916e9b
-- 
2.39.1.519.gcb327c4b5f-goog

