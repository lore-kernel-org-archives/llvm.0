Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4C7B
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:36:59 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id m1-20020a056a00080100b00543ffc4cfe0so8076115pfk.5
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=1HjnVybSCmk8PN3Kx7J1WICZYKcCSPZ9vUMHNLgvNs0=;
        b=IusJICLcxEmdez2ty2Vz8B77a5JP1QBAG0cdW/ocVron3SMKgcwJgtG928TMMmumMe
         jXbX3CojoE1ImjmaPw/GIui5hJPueMiC5uSUfsucbk50zJvddSpaE9pDWnzHcPIJOiO/
         83zZjEE+4Aqrzz2xpavzNJDV2tNQX1AOHnC7FKCGFEJzJEC8UUpOSXAgCvNDEBWqkEzl
         GHBtOz/fgSW6UYpDPU16t/Rb9aPN5s/8vITkg1otK4GGW8pmB+qG3y9u+RSyluMEjXHY
         3YRB7h7YoLGmjdscr8v2LgJOTNThjYczBQoNvapq86atBPNdj+sqHLNoFUWN6G6MF5jK
         EQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=1HjnVybSCmk8PN3Kx7J1WICZYKcCSPZ9vUMHNLgvNs0=;
        b=rEZ0ct9LFAlQ6L6iUAt/rE9nao+V5qSbR3KjKTBPL0dWusnV2eRRHkzjVyLvtIdVk2
         iLGL+cOqldiZm75AKyYI+3jGWXfUHQWDkPpcFnWPzy+YBpycA2aS9NjschSxdCoPQ9T3
         lo3+x1LrayJov/gMHQykcAqR4rlLpjZoFjrV7CyU7hWnzzut+5DwKJ2YJoHfWk0nzSHS
         S2eoh5pwb6AchMHp6uRgbRfOSw19zbVA/cGOdQta00oqgzLaSTvIA7XoyF+Mmb51FnH0
         MKD+oMqqbCohQ4m+cp9f9yKj6wzD60UkO1+dnGizVDOJshIMMklpfIVEF5rz3S3zKJyu
         2PHg==
X-Gm-Message-State: ACrzQf1H09PZJupijXToztr7j/ARdk/Qp4xKalG+lX940lhCn8fYLveq
	TMXI3My0RBURf/aS/EcApEDJKeb6P9Y=
X-Google-Smtp-Source: AMsMyM7c7CTUEAxcZIKJ3TaSJNeOpA/iJXEXySd+W0B9c+KaHrVi1iKNFO6imibHN2j7A4a4Txc/dgLEciw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:88c7:0:b0:542:3229:8d0f with SMTP id
 k7-20020aa788c7000000b0054232298d0fmr220106pff.74.1664408219026; Wed, 28 Sep
 2022 16:36:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Sep 2022 23:36:48 +0000
In-Reply-To: <20220928233652.783504-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220928233652.783504-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928233652.783504-4-seanjc@google.com>
Subject: [PATCH v2 3/7] KVM: selftests: Remove unnecessary register shuffling
 in fix_hypercall_test
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

Use input constraints to load RAX and RBX when testing that KVM correctly
does/doesn't patch the "wrong" hypercall.  There's no need to manually
load RAX and RBX, and no reason to clobber them either (KVM is not
supposed to modify anything other than RAX).

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 .../selftests/kvm/x86_64/fix_hypercall_test.c | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
index e0004bd26536..6864eb0d5d14 100644
--- a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
+++ b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
@@ -30,14 +30,11 @@ static uint64_t svm_do_sched_yield(uint8_t apic_id)
 {
 	uint64_t ret;
 
-	asm volatile("mov %1, %%rax\n\t"
-		     "mov %2, %%rbx\n\t"
-		     "svm_hypercall_insn:\n\t"
+	asm volatile("svm_hypercall_insn:\n\t"
 		     "vmmcall\n\t"
-		     "mov %%rax, %0\n\t"
-		     : "=r"(ret)
-		     : "r"((uint64_t)KVM_HC_SCHED_YIELD), "r"((uint64_t)apic_id)
-		     : "rax", "rbx", "memory");
+		     : "=a"(ret)
+		     : "a"((uint64_t)KVM_HC_SCHED_YIELD), "b"((uint64_t)apic_id)
+		     : "memory");
 
 	return ret;
 }
@@ -47,14 +44,11 @@ static uint64_t vmx_do_sched_yield(uint8_t apic_id)
 {
 	uint64_t ret;
 
-	asm volatile("mov %1, %%rax\n\t"
-		     "mov %2, %%rbx\n\t"
-		     "vmx_hypercall_insn:\n\t"
+	asm volatile("vmx_hypercall_insn:\n\t"
 		     "vmcall\n\t"
-		     "mov %%rax, %0\n\t"
-		     : "=r"(ret)
-		     : "r"((uint64_t)KVM_HC_SCHED_YIELD), "r"((uint64_t)apic_id)
-		     : "rax", "rbx", "memory");
+		     : "=a"(ret)
+		     : "a"((uint64_t)KVM_HC_SCHED_YIELD), "b"((uint64_t)apic_id)
+		     : "memory");
 
 	return ret;
 }
-- 
2.37.3.998.g577e59143f-goog

