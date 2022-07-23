Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08C5C85
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 00:01:56 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id f11so5796685plr.4
        for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 17:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5SPjP3md/CGBm0+sPT1l6nq7K2L6BN5vDp8ulsH6LwQ=;
        b=Sr+3JD7hljNlTOJg6LYONXm3XW0q/PCWlxWVd6ZMC9cg/xl5dRvDnnjCMy4ec8iPtT
         eNSGd7XCofi7taqx2a4dHM1ewP2C1NO3xClMsJ5FC0xmiw6qey+eLnyOdJKb5+hkPIO4
         hNshfc8/BKq195gMukjpRfALKlTR788EGBzesnUwhLvFiLuuZB7pXfH5v3G5wum4fSOE
         7x0MGIHfNqHROt2LsOBc+5eWYQRvFPFMGV+vn3QKvQRASAuzVCzasRzHPbiuW107rFqr
         6opqZ7hFMGu/YmEPXwdTqXAA5NlICALRYRN81zM3aUoc+GnxalRu+i5gvgqnVWJstfNF
         ABAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5SPjP3md/CGBm0+sPT1l6nq7K2L6BN5vDp8ulsH6LwQ=;
        b=vHd8AKjnbzgR+RLL0zN5U3J5YY9Db30MCpbJKgRjx01atAqtgu7+sEPRmZfbKFX77g
         /uAqTlE+e0dSbFAEUXnrAAagOc+GalEAq2nMUJu1yT01oTwh79/5B0shKQkqwFv0WGyz
         7MHCkhtwVqLb7kK7KpYXFKgmKdaV3W0qXB8m5nNFQdpypgQu3agXUbTohxQ4jbjcLNMY
         yDpP+ICeDWOt2PaodzVg4+isd6y2Lg+pkqVGgzCHLF4OzswLhVd5tCjMgZmV1syXJBBQ
         uHie+sZ//y0cX2E7Y+SMZB2q/r5O/Epv1uMCLLTP+KhJ8eNKHDxGcyxyEzoO0NnoPARX
         ckOw==
X-Gm-Message-State: AJIora9OkX8uGthylF920+/K5sCVOY1biRxtFKX3RyFkmgRpc4pBtMsM
	3o3pWUk4l7QrHg55F41xmw5eqw==
X-Google-Smtp-Source: AGRyM1uy6SDnA7IVF3c1DD/eA3do+TS/ZWD/aOJ9q562iG5rUxY95gfayC4VMwdOxE+YQK8P36NnMw==
X-Received: by 2002:a17:90a:6281:b0:1f2:1f17:4023 with SMTP id d1-20020a17090a628100b001f21f174023mr17463337pjj.243.1658534516194;
        Fri, 22 Jul 2022 17:01:56 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f70a00b0016be6a554b5sm4326483plo.233.2022.07.22.17.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 17:01:55 -0700 (PDT)
Date: Sat, 23 Jul 2022 00:01:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Peter Xu <peterx@redhat.com>,
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@google.com>,
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>,
	kvm@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: selftests: Fix KVM_EXCEPTION_MAGIC build with
 Clang
Message-ID: <Yts6cCcnfg1xV54O@google.com>
References: <20220722234838.2160385-1-dmatlack@google.com>
 <20220722234838.2160385-2-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722234838.2160385-2-dmatlack@google.com>

On Fri, Jul 22, 2022, David Matlack wrote:
> Change KVM_EXCEPTION_MAGIC to use the all-caps "ULL", rather than lower
> case. This fixes a build failure with Clang:
> 
>   In file included from x86_64/hyperv_features.c:13:
>   include/x86_64/processor.h:825:9: error: unexpected token in argument list
>           return kvm_asm_safe("wrmsr", "a"(val & -1u), "d"(val >> 32), "c"(msr));
>                  ^
>   include/x86_64/processor.h:802:15: note: expanded from macro 'kvm_asm_safe'
>           asm volatile(KVM_ASM_SAFE(insn)                 \
>                        ^
>   include/x86_64/processor.h:785:2: note: expanded from macro 'KVM_ASM_SAFE'
>           "mov $" __stringify(KVM_EXCEPTION_MAGIC) ", %%r9\n\t"   \
>           ^
>   <inline asm>:1:18: note: instantiated into assembly here
>           mov $0xabacadabaull, %r9
>                           ^
> 
> Fixes: 3b23054cd3f5 ("KVM: selftests: Add x86-64 support for exception fixup")
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

>  tools/testing/selftests/kvm/include/x86_64/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
> index 45edf45821d0..51c6661aca77 100644
> --- a/tools/testing/selftests/kvm/include/x86_64/processor.h
> +++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
> @@ -754,7 +754,7 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
>  			void (*handler)(struct ex_regs *));
>  
>  /* If a toddler were to say "abracadabra". */
> -#define KVM_EXCEPTION_MAGIC 0xabacadabaull
> +#define KVM_EXCEPTION_MAGIC 0xabacadabaULL

Really?!?!?! That's what makes clang happy?!?!?
