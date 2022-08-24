Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3CE7E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 15:00:36 +0000 (UTC)
Date: Wed, 24 Aug 2022 10:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661353229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wpdpInv50s3/tIr2zAWlDOu11BVdoLVMcL8Ge4aE150=;
	b=vCNG6VW0yVkpK30QQEGBHc0IONpr09WwKoJRzM318XHzyPpdYjdo72Wro1vDzdAr0MYNLs
	EYH9TmimgWflNvzHC80WrzVMIezIPbQfNXq8NkEMiF6hjZuJQrG4iKwHF5FaWtL6Sovhst
	w05T8HvT2UqbKDR9ZLtxGz/iI8pVsbI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v4 5/6] KVM: selftests: Make arm64's MMIO ucall multi-VM
 friendly
Message-ID: <YwY9BYDUeiT87/Vs@google.com>
References: <20220824032115.3563686-1-seanjc@google.com>
 <20220824032115.3563686-6-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824032115.3563686-6-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

Hi Sean,

On Wed, Aug 24, 2022 at 03:21:14AM +0000, Sean Christopherson wrote:
> Fix a mostly-theoretical bug where ARM's ucall MMIO setup could result in
> different VMs stomping on each other by cloberring the global pointer.
> 
> Fix the most obvious issue by saving the MMIO gpa into the VM.
> 
> A more subtle bug is that creating VMs in parallel (on multiple tasks)
> could result in a VM using the wrong address.  Synchronizing a global to
> a guest effectively snapshots the value on a per-VM basis, i.e. the
> "global" is already prepped to work with multiple VMs, but setting the
> global in the host and copying it to the guest needs to happen atomically.
> To fix that bug, add atomic_sync_global_pointer_to_guest() to sync
> "global" pointers that hold per-VM values, i.e. technically need to be
> handled in a thread-safe manner.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 16 +++++++++++++++
>  .../testing/selftests/kvm/lib/aarch64/ucall.c | 20 ++++++++++++++-----
>  2 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 24fde97f6121..9ec7fbe941aa 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -16,6 +16,7 @@
>  #include <linux/kvm.h>
>  #include "linux/rbtree.h"
>  
> +#include <asm/atomic.h>
>  
>  #include <sys/ioctl.h>
>  
> @@ -81,6 +82,7 @@ struct kvm_vm {
>  	struct sparsebit *vpages_mapped;
>  	bool has_irqchip;
>  	bool pgd_created;
> +	vm_paddr_t ucall_mmio_addr;
>  	vm_paddr_t pgd;
>  	vm_vaddr_t gdt;
>  	vm_vaddr_t tss;
> @@ -714,6 +716,20 @@ kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
>  	memcpy(&(g), _p, sizeof(g));				\
>  })
>  
> +/*
> + * Sync a global pointer to the guest that has a per-VM value, in which case
> + * writes to the host copy of the "global" must be serialized (in case a test
> + * is being truly crazy and spawning multiple VMs concurrently).
> + */

Do we even care about writes to the host's copy of the global pointer?
I don't see how the host pointer is used beyond serializing writes into
a guest.

IOW, it looks as though we could skip the whole global illusion
altogether and write straight into guest memory.

--
Thanks,
Oliver
