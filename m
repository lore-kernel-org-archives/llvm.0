Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4E1B62
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 14:23:17 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id i11so3051274eda.9
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 06:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7auIWEJM6MC8ScpEmtv1C4E/fqB/KIkHM2nvPFKd6is=;
        b=fLGvRvN1ISGysrGJQmdl7pQ/3vIpgylLRYVvIU9WbfeP/Z/gaAwPvmRzTuh3bDBcYs
         9Qn4cwkSl5uja3X0Zde9CNJVlhtmBxUh67zsrKpaWMhTkv/rJjjvbvfbOPt1SgIHabMO
         Aq9HDezf7wGyCUlS72Vm4beMvbbqvminJi7/xzTQwmA+MG3PmepPEw8Uo2s3vUOhVci0
         QAhSIhTH8rE7cb0T18qhmu1Q7t+P0FHgiy1R+un+HB9TzdbWFJ3uwkyq4Y8d/6eyxHwg
         FHoCIIanhpJhucybHC0iIPniWnyQk8jOhwwUGNuv49V72vsTmJcrXkuoJ3OCkxODxYCi
         J7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7auIWEJM6MC8ScpEmtv1C4E/fqB/KIkHM2nvPFKd6is=;
        b=c2oCzB6QfW3d8oWn1DCWORgwbA+aX7dwmhxngDc7T9BzV/1Z1UG3itRmMblRRJatWC
         57vFpSxAUESTm1C5jFPt8QOhvWMYbh4yqEvPWmUIsayuBRn33F/gRvW0sjqNlON0v1yB
         zahc82k8WmGSyWzfHa9I3TNa54Wvyrv9l7Y5cKKRsirIwRx352tCEyvYKFXK+B6hEfjW
         JbOI9tMwvYKnRXR4WLyR/PihAPiq5kogPnmeVK5w79/STWAyZL3smgYjEMywmO2P7RW8
         zqwazJrbbddegRw1m/HMDOXjbjugIHtBlbGLfIy/rLMQnu9Qc81xod8MhjXzrABVpUBV
         Qh3A==
X-Gm-Message-State: AOAM5305y6TaxT4FqOQF85N7BYTXXXC6JJaC4TRTviEJS5Vov+cMoRaK
	OKUG/wvDYQISaTPUdMTqdfk=
X-Google-Smtp-Source: ABdhPJzDqdEuS1bbYLjr5rMNEoHcI3kLnIyJYrCsWsHZa4hdnXcj+uoj5Z+K9ploCv9Nlqc9oDWDOw==
X-Received: by 2002:aa7:c3d5:0:b0:40f:b885:8051 with SMTP id l21-20020aa7c3d5000000b0040fb8858051mr2569264edr.395.1645712595524;
        Thu, 24 Feb 2022 06:23:15 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id jz17sm1402326ejb.195.2022.02.24.06.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 06:23:14 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4ce5ed1c-78e5-8150-65cd-288f1023c7a0@redhat.com>
Date: Thu, 24 Feb 2022 15:23:12 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] KVM: x86: Fix pointer mistmatch warning when patching
 RET0 static calls
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li
 <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Like Xu <like.xu.linux@gmail.com>
References: <20220223162355.3174907-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220223162355.3174907-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/22 17:23, Sean Christopherson wrote:
> Cast kvm_x86_ops.func to 'void *' when updating KVM static calls that are
> conditionally patched to __static_call_return0().  clang complains about
> using mismatching pointers in the ternary operator, which breaks the
> build when compiling with CONFIG_KVM_WERROR=y.
> 
>    >> arch/x86/include/asm/kvm-x86-ops.h:82:1: warning: pointer type mismatch
>    ('bool (*)(struct kvm_vcpu *)' and 'void *') [-Wpointer-type-mismatch]
> 
> Fixes: 5be2226f417d ("KVM: x86: allow defining return-0 static calls")
> Reported-by: Like Xu <like.xu.linux@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 713e08f62385..f285ddb8b66b 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1547,8 +1547,8 @@ static inline void kvm_ops_static_call_update(void)
>   	WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
>   #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
>   #define KVM_X86_OP_OPTIONAL_RET0(func) \
> -	static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
> -			   (void *) __static_call_return0);
> +	static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
> +					   (void *)__static_call_return0);
>   #include <asm/kvm-x86-ops.h>
>   #undef __KVM_X86_OP
>   }
> 
> base-commit: f4bc051fc91ab9f1d5225d94e52d369ef58bec58

Queued, thanks.

Paolo
