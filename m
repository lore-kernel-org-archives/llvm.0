Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2E33ED
	for <llvm@lists.linux.dev>; Thu,  9 Feb 2023 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675948448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m+OXcoCacupTD4tofJsHdhQdQk/1iyMKEWkpC01PgCY=;
	b=N0mqsunZovmpcwGh/ET3OONivJcjFJbcZrCKmspJa+LhAluNvNPN2n+OR84ARJfatDqkg8
	5rzdwkCc9wmh/pWYsbrqiIynBQJeXzlQsOn5otfDL8+wj59U2vP40ZJsSer4DMtU9sj6I9
	b0EurOi7SCRfE7ovPEzpa1t8geooBBk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-KWbGwBX7Ora19PYj3B9FSA-1; Thu, 09 Feb 2023 08:14:02 -0500
X-MC-Unique: KWbGwBX7Ora19PYj3B9FSA-1
Received: by mail-qk1-f197.google.com with SMTP id c9-20020a05620a11a900b0072a014ecc4aso1178121qkk.18
        for <llvm@lists.linux.dev>; Thu, 09 Feb 2023 05:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+OXcoCacupTD4tofJsHdhQdQk/1iyMKEWkpC01PgCY=;
        b=J/prk2AwtNLZ2fj3qtTL6mCiRoafbTdnwAvFrFGLJxuaUkmn2R1ULDbexx0y+f7xKj
         +hhz9SSYxGGl4lKvhw6fa1K+ucJArutscRHmb6ii36Lllu9N1FKpEMb4XYlYgtlH4qev
         tsyYRXwfMD6sMDYlSa88JsVVshH40t9jQ5oc3VXuuSB1mPJ8gDV1XwK8YPtTwLxPuve0
         MEOYgcvq+0dxLg9O6mn5xf4+EPuiFp0CBSzXil8nHjuIzq8aV+jqqs5ywoMuQhwkC7id
         xv7J5kJIzU7p17BIIbEvD9FdmBdFflTzREv0sfdaTmK8/2zjiIfuigS9BvdNrx5e66E0
         jvfw==
X-Gm-Message-State: AO0yUKWCIWGOdGg9QSLK4kLJWV+T4HTKu16j5oNVxK5UP8cW0dteTb0r
	WhztCzdj84eGlpKIES4gWfm0qIyNUnQvGgKiMBIZug3b1hbv9jH+FinqRXwZ0bxz8w0N0VOuQv8
	KMnghsG3puQQA4A==
X-Received: by 2002:a05:622a:15c7:b0:3b9:a6be:56f6 with SMTP id d7-20020a05622a15c700b003b9a6be56f6mr18572029qty.26.1675948441599;
        Thu, 09 Feb 2023 05:14:01 -0800 (PST)
X-Google-Smtp-Source: AK7set90jp6zuQheeSrju4UqtIZlbt4C3l9R5ef4fJaMbX6c85xwbOyjU5jKWWUYbgrhTmJpKLP0AQ==
X-Received: by 2002:a05:622a:15c7:b0:3b9:a6be:56f6 with SMTP id d7-20020a05622a15c700b003b9a6be56f6mr18571990qty.26.1675948441247;
        Thu, 09 Feb 2023 05:14:01 -0800 (PST)
Received: from fedora (ec2-3-80-233-239.compute-1.amazonaws.com. [3.80.233.239])
        by smtp.gmail.com with ESMTPSA id j8-20020ac85c48000000b003b9b41a32b7sm1186146qtj.81.2023.02.09.05.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:13:59 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] KVM: VMX: Stub out enable_evmcs static key for
 CONFIG_HYPERV=n
In-Reply-To: <20230208205430.1424667-3-seanjc@google.com>
References: <20230208205430.1424667-1-seanjc@google.com>
 <20230208205430.1424667-3-seanjc@google.com>
Date: Thu, 09 Feb 2023 14:13:57 +0100
Message-ID: <87mt5n6kx6.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> Wrap enable_evmcs in a helper and stub it out when CONFIG_HYPERV=n in
> order to eliminate the static branch nop placeholders.  clang-14 is clever
> enough to elide the nop, but gcc-12 is not.  Stubbing out the key reduces
> the size of kvm-intel.ko by ~7.5% (200KiB) when compiled with gcc-12
> (there are a _lot_ of VMCS accesses throughout KVM).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/hyperv.c  |  4 ++--
>  arch/x86/kvm/vmx/hyperv.h  | 10 ++++++++--
>  arch/x86/kvm/vmx/vmx.c     | 15 +++++++--------
>  arch/x86/kvm/vmx/vmx_ops.h | 22 +++++++++++-----------
>  4 files changed, 28 insertions(+), 23 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/hyperv.c b/arch/x86/kvm/vmx/hyperv.c
> index b6748055c586..274fbd38c64e 100644
> --- a/arch/x86/kvm/vmx/hyperv.c
> +++ b/arch/x86/kvm/vmx/hyperv.c
> @@ -118,8 +118,6 @@
>  
>  #define EVMCS1_SUPPORTED_VMFUNC (0)
>  
> -DEFINE_STATIC_KEY_FALSE(enable_evmcs);
> -
>  #define EVMCS1_OFFSET(x) offsetof(struct hv_enlightened_vmcs, x)
>  #define EVMCS1_FIELD(number, name, clean_field)[ROL16(number, 6)] = \
>  		{EVMCS1_OFFSET(name), clean_field}
> @@ -611,6 +609,8 @@ int nested_evmcs_check_controls(struct vmcs12 *vmcs12)
>  }
>  
>  #if IS_ENABLED(CONFIG_HYPERV)
> +DEFINE_STATIC_KEY_FALSE(enable_evmcs);
> +
>  /*
>   * KVM on Hyper-V always uses the latest known eVMCSv1 revision, the assumption
>   * is: in case a feature has corresponding fields in eVMCS described and it was
> diff --git a/arch/x86/kvm/vmx/hyperv.h b/arch/x86/kvm/vmx/hyperv.h
> index 1299143d00df..a0b6d05dba5d 100644
> --- a/arch/x86/kvm/vmx/hyperv.h
> +++ b/arch/x86/kvm/vmx/hyperv.h
> @@ -16,8 +16,6 @@
>  
>  struct vmcs_config;
>  
> -DECLARE_STATIC_KEY_FALSE(enable_evmcs);
> -
>  #define current_evmcs ((struct hv_enlightened_vmcs *)this_cpu_read(current_vmcs))
>  
>  #define KVM_EVMCS_VERSION 1
> @@ -69,6 +67,13 @@ static inline u64 evmcs_read_any(struct hv_enlightened_vmcs *evmcs,
>  
>  #if IS_ENABLED(CONFIG_HYPERV)
>  
> +DECLARE_STATIC_KEY_FALSE(enable_evmcs);
> +
> +static __always_inline bool is_evmcs_enabled(void)
> +{
> +	return static_branch_unlikely(&enable_evmcs);
> +}

I have a suggestion. While 'is_evmcs_enabled' name is certainly not
worse than 'enable_evmcs', it may still be confusing as it's not clear
which eVMCS is meant: are we running a guest using eVMCS or using eVMCS
ourselves? So what if we rename this to a very explicit 'is_kvm_on_hyperv()'
and hide the implementation details (i.e. 'evmcs') inside?

> +
>  static __always_inline int get_evmcs_offset(unsigned long field,
>  					    u16 *clean_field)
>  {
> @@ -158,6 +163,7 @@ static inline void evmcs_load(u64 phys_addr)
>  
>  void evmcs_sanitize_exec_ctrls(struct vmcs_config *vmcs_conf);
>  #else /* !IS_ENABLED(CONFIG_HYPERV) */
> +static __always_inline bool is_evmcs_enabled(void) { return false; }
>  static __always_inline void evmcs_write64(unsigned long field, u64 value) {}
>  static __always_inline void evmcs_write32(unsigned long field, u32 value) {}
>  static __always_inline void evmcs_write16(unsigned long field, u16 value) {}
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 33614ee2cd67..9f0098c9ad64 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -595,7 +595,7 @@ static void hv_reset_evmcs(void)
>  {
>  	struct hv_vp_assist_page *vp_ap;
>  
> -	if (!static_branch_unlikely(&enable_evmcs))
> +	if (!is_evmcs_enabled())
>  		return;
>  
>  	/*
> @@ -2818,8 +2818,7 @@ static int vmx_hardware_enable(void)
>  	 * This can happen if we hot-added a CPU but failed to allocate
>  	 * VP assist page for it.
>  	 */
> -	if (static_branch_unlikely(&enable_evmcs) &&
> -	    !hv_get_vp_assist_page(cpu))
> +	if (is_evmcs_enabled() && !hv_get_vp_assist_page(cpu))
>  		return -EFAULT;
>  
>  	intel_pt_handle_vmx(1);
> @@ -2871,7 +2870,7 @@ struct vmcs *alloc_vmcs_cpu(bool shadow, int cpu, gfp_t flags)
>  	memset(vmcs, 0, vmcs_config.size);
>  
>  	/* KVM supports Enlightened VMCS v1 only */
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		vmcs->hdr.revision_id = KVM_EVMCS_VERSION;
>  	else
>  		vmcs->hdr.revision_id = vmcs_config.revision_id;
> @@ -2966,7 +2965,7 @@ static __init int alloc_kvm_area(void)
>  		 * still be marked with revision_id reported by
>  		 * physical CPU.
>  		 */
> -		if (static_branch_unlikely(&enable_evmcs))
> +		if (is_evmcs_enabled())
>  			vmcs->hdr.revision_id = vmcs_config.revision_id;
>  
>  		per_cpu(vmxarea, cpu) = vmcs;
> @@ -3936,7 +3935,7 @@ static void vmx_msr_bitmap_l01_changed(struct vcpu_vmx *vmx)
>  	 * 'Enlightened MSR Bitmap' feature L0 needs to know that MSR
>  	 * bitmap has changed.
>  	 */
> -	if (IS_ENABLED(CONFIG_HYPERV) && static_branch_unlikely(&enable_evmcs)) {
> +	if (is_evmcs_enabled()) {
>  		struct hv_enlightened_vmcs *evmcs = (void *)vmx->vmcs01.vmcs;
>  
>  		if (evmcs->hv_enlightenments_control.msr_bitmap)
> @@ -7313,7 +7312,7 @@ static fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu)
>  	vmx_vcpu_enter_exit(vcpu, __vmx_vcpu_run_flags(vmx));
>  
>  	/* All fields are clean at this point */
> -	if (static_branch_unlikely(&enable_evmcs)) {
> +	if (is_evmcs_enabled()) {
>  		current_evmcs->hv_clean_fields |=
>  			HV_VMX_ENLIGHTENED_CLEAN_FIELD_ALL;
>  
> @@ -7443,7 +7442,7 @@ static int vmx_vcpu_create(struct kvm_vcpu *vcpu)
>  	 * feature only for vmcs01, KVM currently isn't equipped to realize any
>  	 * performance benefits from enabling it for vmcs02.
>  	 */
> -	if (IS_ENABLED(CONFIG_HYPERV) && static_branch_unlikely(&enable_evmcs) &&
> +	if (is_evmcs_enabled() &&
>  	    (ms_hyperv.nested_features & HV_X64_NESTED_MSR_BITMAP)) {
>  		struct hv_enlightened_vmcs *evmcs = (void *)vmx->vmcs01.vmcs;
>  
> diff --git a/arch/x86/kvm/vmx/vmx_ops.h b/arch/x86/kvm/vmx/vmx_ops.h
> index db95bde52998..6b072db47fdc 100644
> --- a/arch/x86/kvm/vmx/vmx_ops.h
> +++ b/arch/x86/kvm/vmx/vmx_ops.h
> @@ -147,7 +147,7 @@ static __always_inline unsigned long __vmcs_readl(unsigned long field)
>  static __always_inline u16 vmcs_read16(unsigned long field)
>  {
>  	vmcs_check16(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_read16(field);
>  	return __vmcs_readl(field);
>  }
> @@ -155,7 +155,7 @@ static __always_inline u16 vmcs_read16(unsigned long field)
>  static __always_inline u32 vmcs_read32(unsigned long field)
>  {
>  	vmcs_check32(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_read32(field);
>  	return __vmcs_readl(field);
>  }
> @@ -163,7 +163,7 @@ static __always_inline u32 vmcs_read32(unsigned long field)
>  static __always_inline u64 vmcs_read64(unsigned long field)
>  {
>  	vmcs_check64(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_read64(field);
>  #ifdef CONFIG_X86_64
>  	return __vmcs_readl(field);
> @@ -175,7 +175,7 @@ static __always_inline u64 vmcs_read64(unsigned long field)
>  static __always_inline unsigned long vmcs_readl(unsigned long field)
>  {
>  	vmcs_checkl(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_read64(field);
>  	return __vmcs_readl(field);
>  }
> @@ -222,7 +222,7 @@ static __always_inline void __vmcs_writel(unsigned long field, unsigned long val
>  static __always_inline void vmcs_write16(unsigned long field, u16 value)
>  {
>  	vmcs_check16(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_write16(field, value);
>  
>  	__vmcs_writel(field, value);
> @@ -231,7 +231,7 @@ static __always_inline void vmcs_write16(unsigned long field, u16 value)
>  static __always_inline void vmcs_write32(unsigned long field, u32 value)
>  {
>  	vmcs_check32(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_write32(field, value);
>  
>  	__vmcs_writel(field, value);
> @@ -240,7 +240,7 @@ static __always_inline void vmcs_write32(unsigned long field, u32 value)
>  static __always_inline void vmcs_write64(unsigned long field, u64 value)
>  {
>  	vmcs_check64(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_write64(field, value);
>  
>  	__vmcs_writel(field, value);
> @@ -252,7 +252,7 @@ static __always_inline void vmcs_write64(unsigned long field, u64 value)
>  static __always_inline void vmcs_writel(unsigned long field, unsigned long value)
>  {
>  	vmcs_checkl(field);
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_write64(field, value);
>  
>  	__vmcs_writel(field, value);
> @@ -262,7 +262,7 @@ static __always_inline void vmcs_clear_bits(unsigned long field, u32 mask)
>  {
>  	BUILD_BUG_ON_MSG(__builtin_constant_p(field) && ((field) & 0x6000) == 0x2000,
>  			 "vmcs_clear_bits does not support 64-bit fields");
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_write32(field, evmcs_read32(field) & ~mask);
>  
>  	__vmcs_writel(field, __vmcs_readl(field) & ~mask);
> @@ -272,7 +272,7 @@ static __always_inline void vmcs_set_bits(unsigned long field, u32 mask)
>  {
>  	BUILD_BUG_ON_MSG(__builtin_constant_p(field) && ((field) & 0x6000) == 0x2000,
>  			 "vmcs_set_bits does not support 64-bit fields");
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_write32(field, evmcs_read32(field) | mask);
>  
>  	__vmcs_writel(field, __vmcs_readl(field) | mask);
> @@ -289,7 +289,7 @@ static inline void vmcs_load(struct vmcs *vmcs)
>  {
>  	u64 phys_addr = __pa(vmcs);
>  
> -	if (static_branch_unlikely(&enable_evmcs))
> +	if (is_evmcs_enabled())
>  		return evmcs_load(phys_addr);
>  
>  	vmx_asm1(vmptrld, "m"(phys_addr), vmcs, phys_addr);

With or without the change:

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

