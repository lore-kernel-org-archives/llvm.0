Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E55AEBD
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 17:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDDCC340E7;
	Wed, 23 Feb 2022 17:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645637273;
	bh=BZ72Cv96SDULoZqRBhdwvA8X1c4BIfcsSZ5Rny2PuLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQmygXJJt2g54V+d9trXkiWWQ7HNa3uYnsgmfTn6/B4dZ5SMh4YaGrrt7GRNds8ZH
	 ca94NfYv9xzDeUgKAYn/mqUPhvs9wEgDQiy99FDhAToFjjXygK6KA5tHDwXET17R8J
	 hnpD2jrwkrz1jh5ZXtC8WX04Ts76+WfixivAPUt+DFgzd1sW4Gi3qmGOwnloxEyMJM
	 E5LK4j8dUD6tK9xdFNsM8ZvmzDx4RmaQuNGu9DESaHaqoN7eYNMs1kIN2Iufkwdv0V
	 xaCpPFNhNQWPQyVz1MncyaBU8arQl/1WA01U6Cjjr0wmX/xgLJqjIsNYfMbilN4xLd
	 5fsrqlEinDLPg==
Date: Wed, 23 Feb 2022 10:27:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	kvm@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Like Xu <like.xu.linux@gmail.com>
Subject: Re: [PATCH] KVM: x86: Fix pointer mistmatch warning when patching
 RET0 static calls
Message-ID: <YhZuk8eA6rsDuJkd@dev-arch.archlinux-ax161>
References: <20220223162355.3174907-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223162355.3174907-1-seanjc@google.com>

Hi Sean,

On Wed, Feb 23, 2022 at 04:23:55PM +0000, Sean Christopherson wrote:
> Cast kvm_x86_ops.func to 'void *' when updating KVM static calls that are
> conditionally patched to __static_call_return0().  clang complains about
> using mismatching pointers in the ternary operator, which breaks the
> build when compiling with CONFIG_KVM_WERROR=y.
> 
>   >> arch/x86/include/asm/kvm-x86-ops.h:82:1: warning: pointer type mismatch
>   ('bool (*)(struct kvm_vcpu *)' and 'void *') [-Wpointer-type-mismatch]
> 
> Fixes: 5be2226f417d ("KVM: x86: allow defining return-0 static calls")
> Reported-by: Like Xu <like.xu.linux@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thank you for the patch! Is this a bug in clang? I ended up creating a
small reproducer in case we need to file a bug with clang upstream:

https://godbolt.org/z/P7nEdzejE

This does shut up the warning and I can still spawn guests on my AMD and
Intel systems so:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/x86/include/asm/kvm_host.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 713e08f62385..f285ddb8b66b 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1547,8 +1547,8 @@ static inline void kvm_ops_static_call_update(void)
>  	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
>  #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
>  #define KVM_X86_OP_OPTIONAL_RET0(func) \
> -	static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
> -			   (void *) __static_call_return0);
> +	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
> +					   (void *)__static_call_return0);
>  #include <asm/kvm-x86-ops.h>
>  #undef __KVM_X86_OP
>  }
> 
> base-commit: f4bc051fc91ab9f1d5225d94e52d369ef58bec58
> -- 
> 2.35.1.473.g83b2b277ed-goog
> 
