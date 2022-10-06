Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C653624
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 00:34:22 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id cw4-20020a056a00450400b00561ec04e77aso235107pfb.12
        for <llvm@lists.linux.dev>; Wed, 05 Oct 2022 17:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9KMeIXPq6GpOVcN55NK7DLftKaRG2/H9/8QOpBzCftA=;
        b=mEbovaZUu6KW+QLA8E55+qeFjie4ez91koDXMg/9jrSIxWWEn7uEXQSfyV6u9Rbj0q
         au+eMV2cQU3MEP1qaqbhmLXZQ22xX+sXG6ruwTxeU1jSpEp6tgybSt375ZJjx+bepNLM
         ShKht/UF9CsHv4HlbDU1Rt5Aheu1FTSX309sP2UUTedYtoOrW+vfR9f+Rms2jv0qL311
         xhlrOVJUHNxdYz4Uf6SXwcR5JfRoPwVhg+kAqr6R6aeYjuIwiPye2GNCzJ2FMX2W/GIu
         ZBZjpz3Kikj1neTh8F0SJ5mQd3pQSFV0yDiAcIjnkYV9DVRUgpC7CVc4TxECrfjAs5Jp
         /dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KMeIXPq6GpOVcN55NK7DLftKaRG2/H9/8QOpBzCftA=;
        b=d23TBRMi6ajOI1toZMOA13L+9R70ZhDtv8WE+A2kIwAymvckHjBIvL6cV4kfVkPxVq
         zWf7WeLOA2e7agVV6T1FuPLdPpJ97YeCoPzeJr+7J6rzjDBqN5PfT2kdIMG/ucrZ7kYt
         Mfg0CZtHxDPnSpfKsoNltCrW12ArmDaqykiDmDSezD6wS9FsLzemMphrTYAUm2GZ4ika
         HYF0D1KWPkgm6vCmGUIWx64d3CDFUoL3AaQt8xDbgXCIwO2B4ef3OMJAtxMB0UNT3Rc4
         X5QY46mSYLmWkyYKwbT4eoiMnMjP/NqTRPA3XD8qUtHxWess2bn/0oJVsWYHedoDDbs2
         EcnA==
X-Gm-Message-State: ACrzQf18AjapBtDKxLl11jxTltVkQcQ3A4lJ3Y2un5sBE0OjTvt28f6G
	8C0dbe7bFmCjSSbw1/xmaug+4FDZmzw=
X-Google-Smtp-Source: AMsMyM45qnrI9G6azK6iw6bHSpADVc1CoVnhaNByhJReWqWjXc5QYOLtqbmuu2pzhK5ymOSC9YZe69vGWgs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:f0f:b0:562:3169:eba1 with SMTP id
 cr15-20020a056a000f0f00b005623169eba1mr2284230pfb.59.1665016461754; Wed, 05
 Oct 2022 17:34:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Oct 2022 00:34:07 +0000
In-Reply-To: <20221006003409.649993-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221006003409.649993-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221006003409.649993-6-seanjc@google.com>
Subject: [PATCH v6 5/7] KVM: selftests: Make arm64's MMIO ucall multi-VM friendly
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Peter Gonda <pgonda@google.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix a mostly-theoretical bug where ARM's ucall MMIO setup could result in
different VMs stomping on each other by cloberring the global pointer.

Fix the most obvious issue by saving the MMIO gpa into the VM.

A more subtle bug is that creating VMs in parallel (on multiple tasks)
could result in a VM using the wrong address.  Synchronizing a global to
a guest effectively snapshots the value on a per-VM basis, i.e. the
"global" is already prepped to work with multiple VMs, but setting the
global in the host is not thread-safe.  To fix that bug, add
write_guest_global() to allow stuffing a VM's copy of a "global" without
modifying the host value.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Tested-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     | 15 +++++++++++++++
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 19 ++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index e42a09cd24a0..c14d531a942a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -16,6 +16,7 @@
 #include <linux/kvm.h>
 #include "linux/rbtree.h"
 
+#include <asm/atomic.h>
 
 #include <sys/ioctl.h>
 
@@ -81,6 +82,7 @@ struct kvm_vm {
 	struct sparsebit *vpages_mapped;
 	bool has_irqchip;
 	bool pgd_created;
+	vm_paddr_t ucall_mmio_addr;
 	vm_paddr_t pgd;
 	vm_vaddr_t gdt;
 	vm_vaddr_t tss;
@@ -718,6 +720,19 @@ kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
 	memcpy(&(g), _p, sizeof(g));				\
 })
 
+/*
+ * Write a global value, but only in the VM's (guest's) domain.  Primarily used
+ * for "globals" that hold per-VM values (VMs always duplicate code and global
+ * data into their own region of physical memory), but can be used anytime it's
+ * undesirable to change the host's copy of the global.
+ */
+#define write_guest_global(vm, g, val) ({			\
+	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
+	typeof(g) _val = val;					\
+								\
+	memcpy(_p, &(_val), sizeof(g));				\
+})
+
 void assert_on_unhandled_exception(struct kvm_vcpu *vcpu);
 
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu,
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index f02ae27c3e43..1c38bd260f90 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -6,20 +6,29 @@
  */
 #include "kvm_util.h"
 
+/*
+ * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
+ * VM), it must not be accessed from host code.
+ */
 static vm_vaddr_t *ucall_exit_mmio_addr;
 
+static void ucall_set_mmio_addr(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
+{
+	vm->ucall_mmio_addr = mmio_gpa;
+
+	write_guest_global(vm, ucall_exit_mmio_addr, (vm_vaddr_t *)mmio_gpa);
+}
+
 void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 	virt_pg_map(vm, mmio_gpa, mmio_gpa);
 
-	ucall_exit_mmio_addr = (vm_vaddr_t *)mmio_gpa;
-	sync_global_to_guest(vm, ucall_exit_mmio_addr);
+	ucall_set_mmio_addr(vm, mmio_gpa);
 }
 
 void ucall_arch_uninit(struct kvm_vm *vm)
 {
-	ucall_exit_mmio_addr = 0;
-	sync_global_to_guest(vm, ucall_exit_mmio_addr);
+	ucall_set_mmio_addr(vm, (vm_paddr_t)NULL);
 }
 
 void ucall_arch_do_ucall(vm_vaddr_t uc)
@@ -32,7 +41,7 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 	struct kvm_run *run = vcpu->run;
 
 	if (run->exit_reason == KVM_EXIT_MMIO &&
-	    run->mmio.phys_addr == (uint64_t)ucall_exit_mmio_addr) {
+	    run->mmio.phys_addr == vcpu->vm->ucall_mmio_addr) {
 		vm_vaddr_t gva;
 
 		TEST_ASSERT(run->mmio.is_write && run->mmio.len == 8,
-- 
2.38.0.rc1.362.ged0d419d3c-goog

