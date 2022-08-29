Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE553A4
	for <llvm@lists.linux.dev>; Mon, 29 Aug 2022 16:21:15 +0000 (UTC)
Date: Mon, 29 Aug 2022 18:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661790073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V84lDEZ16EblHvtM8fgyVev0owrVHxHzScy/ND3jaaQ=;
	b=CaPKCCVzoPf4bcbSMTSpQx2lOZ5yESWOlPHBTiOGHy4YQpHkCtql8IPuRRpSByvC5hO8de
	6xl8kO3jvz+Vdxt6cwkLhNUnQ9HU+hkqAyGXbfk+QrVReKpiqR0UixIQTF6rHD9/2AuqXA
	G+ANmKWFLtjqyg/LGkmx1D+5lFNxgSE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
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
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH v5 6/7] KVM: selftest: Drop now-unnecessary ucall_uninit()
Message-ID: <20220829162111.wl65dxexk5qtrssf@kamzik>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-7-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825232522.3997340-7-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Aug 25, 2022 at 11:25:21PM +0000, Sean Christopherson wrote:
> Drop ucall_uninit() and ucall_arch_uninit() now that ARM doesn't modify
> the host's copy of ucall_exit_mmio_addr, i.e. now that there's no need to
> reset the pointer before potentially creating a new VM.  The few calls to
> ucall_uninit() are all immediately followed by kvm_vm_free(), and that is
> likely always going to hold true, i.e. it's extremely unlikely a test
> will want to effectively disable ucall in the middle of a test.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/dirty_log_test.c       |  1 -
>  tools/testing/selftests/kvm/include/ucall_common.h |  6 ------
>  tools/testing/selftests/kvm/kvm_page_table_test.c  |  1 -
>  tools/testing/selftests/kvm/lib/aarch64/ucall.c    | 14 ++------------
>  tools/testing/selftests/kvm/lib/perf_test_util.c   |  1 -
>  tools/testing/selftests/kvm/lib/riscv/ucall.c      |  4 ----
>  tools/testing/selftests/kvm/lib/s390x/ucall.c      |  4 ----
>  tools/testing/selftests/kvm/lib/x86_64/ucall.c     |  4 ----
>  8 files changed, 2 insertions(+), 33 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
