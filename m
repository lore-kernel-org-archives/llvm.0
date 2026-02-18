Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAE34889C
	for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 21:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448405; cv=none; b=kDboh9CIlVLLC5xkG8n1aP89vBk+QLwvcgCHnrmwrfpUSPOFpHzGqeE4SC822Mtr7CNM+3w0exCVN393HzqpDTJ7MvDQntV2LmCOXoewXH8CBhnoaqcklIVcGWsZJLGvSEa4Gqkw8OFbuyz+N8M7I3SszKgzn1S6nv/i6EUT8ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448405; c=relaxed/simple;
	bh=3rieSb1MLS2AWN6xXHqEUMG3nsi9HN9Z3YzWuQsRPaE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c88VFDMPy0Pa3hGniVWOGAmx7RxL1bzjdlnfJPG2uER6UxqqfvWdV+uXQlRE6pFYTZn6qIISGL4JTNfhCUNPNAid8iTU8Y6NANLJZYl3CJHa8V4fNu55UcTS80m/ed3Z/Gx2khqJ0IiBuRwahhM6YELxJz5UGw6T7gCpEB35x14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nkJ9ACtY; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkJ9ACtY"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354be486779so736008a91.0
        for <llvm@lists.linux.dev>; Wed, 18 Feb 2026 13:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771448402; x=1772053202; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nsG+1lVvry8sAt+yZ2U5iF+8eZh9cfdyLiVCQKXrJX8=;
        b=nkJ9ACtY4Au7kd1CmCQIoAgnrlVA+ZAYxHBmBmuUtmpinXJgXSJzsIhte5Na6D4shx
         wi6UcqvDLqfz8WKFNAeIsQjU4X9svcgH2Z3MkPDFEjtf0ls5gaDyhwCEvEveqoUnZiRz
         oR3cgbsdEMxwOpFQcSJLXWJSYgHSO3fUJ52+dIqLL9WHvSALJH8JdesLXn8csNh2krBZ
         eBDkjfSNJfGxUMV/a3/rSB4jKFhq904kx9fbpsvwWGHqqWNhzfZuGXCOp9V6hzTkgLFK
         VZrxSPUBg1Tb4Vxoc0xLgFWY+YHymqzcIUEyv++0eLO6eMayEObWSKus53QSgFYm1SIW
         6yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448402; x=1772053202;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsG+1lVvry8sAt+yZ2U5iF+8eZh9cfdyLiVCQKXrJX8=;
        b=t9yK3Ph+RTNZFEIw9IPDzR8K/ZHIseE8N61/zzZ7pc9tYHjhFh8ZPBEpOwCpTslizs
         phmih0EbgR4aHAEEHBNmApNm2jtMXxxp364TNd8wU+gLa7F6baHYLK/WZ7nDPk8M3dPQ
         HWQitglMbT3AptdRW4jtuQ+bSSpR/FTbaj46Mf9bkNyeMHt9Eo8PfItziJ0B1N6vew1o
         940NLls3Ey2xb0DbWD3vo7IDeQMAgN0qPNYe8hewSRVBLlA0YiycEVD59ZZ5v1Jlqz5M
         NrNUQKu1Mj83dkYXBaL3B1yJ6L01srLAVEAvCFlZiayJeVA2a27x52oKGhQaUmiaaeKR
         AKjw==
X-Forwarded-Encrypted: i=1; AJvYcCXu2zW0msxZj9PArnLwZA3WHlA7pbChw2e93i4LvS7HLHUO9oxSozk7b94ZbDWd4WDhdqVO@lists.linux.dev
X-Gm-Message-State: AOJu0Yye65BeNY6j4YGkvns13QBXja8FJbeOMm+8ezT7mGhIrwCdFTyj
	GBQ1yb5X8YbyBpiGA3Ynofiu5swaOUeCBtKCl3To1NUkJMNB2OusvK4w7Vg4LP642q/AWEWYAaA
	sPS8GHQ==
X-Received: from pjm13.prod.google.com ([2002:a17:90b:2fcd:b0:354:bde2:b529])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b4f:b0:34c:fe57:2793
 with SMTP id 98e67ed59e1d1-35889183210mr3062017a91.20.1771448402130; Wed, 18
 Feb 2026 13:00:02 -0800 (PST)
Date: Wed, 18 Feb 2026 13:00:00 -0800
In-Reply-To: <20260218082133.400602-10-jgross@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260218082133.400602-1-jgross@suse.com> <20260218082133.400602-10-jgross@suse.com>
Message-ID: <aZYoUE7CmrLg3SVe@google.com>
Subject: Re: [PATCH v3 09/16] x86/msr: Use the alternatives mechanism for WRMSR
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	llvm@lists.linux.dev, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 18, 2026, Juergen Gross wrote:
> When available use one of the non-serializing WRMSR variants (WRMSRNS
> with or without an immediate operand specifying the MSR register) in
> __wrmsrq().

Silently using a non-serializing version (or not) seems dangerous (not for KVM,
but for the kernel at-large), unless the rule is going to be that MSR writes need
to be treated as non-serializing by default.  Which I'm fine with, but if we go
that route, then I'd prefer not to special case non-serializing callers.

E.g. in the KVM code, I find the use of wrmsrns() intuitive, because KVM doesn't
need the WRMSR to be serializing and so can eke out a bit of extra performance by
using wrmsrns() instead of wrmsrq().  But with native_wrmsrq(), it's not clear
why _this_ particular WRMSR in KVM needs to use the "native" version.

There are a pile of other WRMSRs in KVM that are in hot paths, especially with
the mediated PMU support.  If we're going to make the default version non-serializing,
then I'd prefer to get that via wrmsrq(), i.e. reap the benefits for all of KVM,
not just one arbitrary path.

> For the safe/unsafe variants make __wrmsrq() to be a common base
> function instead of duplicating the ALTERNATIVE*() macros. This
> requires to let native_wrmsr() use native_wrmsrq() instead of
> __wrmsrq(). While changing this, convert native_wrmsr() into an inline
> function.
> 
> Replace the only call of wsrmsrns() with the now equivalent call to
> native_wrmsrq() and remove wsrmsrns().

...

> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 3799cbbb4577..e29a2ac24669 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1473,7 +1473,7 @@ static void vmx_write_guest_host_msr(struct vcpu_vmx *vmx, u32 msr, u64 data,
>  {
>  	preempt_disable();
>  	if (vmx->vt.guest_state_loaded)
> -		wrmsrns(msr, data);
> +		native_wrmsrq(msr, data);
>  	preempt_enable();
>  	*cache = data;
>  }
> -- 
> 2.53.0
> 
