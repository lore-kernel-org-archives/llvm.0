Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1562F5C
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 22:23:22 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v21so177095wrv.5
        for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 14:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fy0MJJJI2gB4ymq6roYJN6kjAzccxttzL2stNrD8v6Y=;
        b=q+siJwh1ClLPC329FhiZBRM/m1SdJmWASDiwDzeM2hdV49NiAohHJV382Bkumyw60k
         9Bk/UJzwAlELq6ogiBk5CRY+u0dekRGvG4jSQTAGdlW0AcV1L4ozPVTc46T/gDvBH0GS
         Fh5hPswPyIBfNE4o7n6k2g+Ewo8cD2q1hjp9bC+lBjcycuqvXCUmNk0GLPSSBnGIa9YN
         XxD2JTpuz2aewJJOOzZCMelJLkAnrmoMFpKtwXv1pwHel3Z1uwyQmOcC4C267uPl7vIT
         nXRXRj6DUo1NlyXEpmlu+U+DelDNvF/yZNefMQGOp+25cE79/lCldftG82ueqaAsIqix
         11/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fy0MJJJI2gB4ymq6roYJN6kjAzccxttzL2stNrD8v6Y=;
        b=rVPHYGKtyOhJqSh2CsQiejWuwN2FVTL/EWVrGidpNlasxv1GjtABifXrw3MufIDRO5
         wPdbsVT7VWyqSWXGoTpdxrm/OTh4zxCQsfPlmzU5OAvQQuFwY5CTP45K6uVlEo0qZ5eu
         A+N41R4ep5D9hwWGEdZfAYJjlSINg5R8unK8JKx9/UGtEu+t4NRxyFVnbZEPLzolh1Sj
         VJTwq2ROPLgfMLIYeN6XCOLv1VR74jqU3SWc4bVK6UMjw2rdSpNbC1WXJZrWUrH5LXLu
         n26rYJGb1RtHjMktnnup+kY5WpAqshho1PNA2Hl2N/cSm8lLxIQBLaHnQjALPB7plBTo
         5zmg==
X-Gm-Message-State: AOAM530IeGNk55l+dEQQoe7Ud6DIo3VjaQVM4bVkHWfFVR7Pji0pM8Bd
	bckQEMLduWD8q1O/F05gjeqh5leu+P4S+DPSgraehw==
X-Google-Smtp-Source: ABdhPJweT+T0f+0zMs40/eYau4mlgt5Tzm7+i1OsSNV+ijoy0wYETR7YVYWprmL26EgW870OfgvbQCsGvPlnuOb9Jjo=
X-Received: by 2002:a05:6000:1e0b:b0:1ea:99dd:db35 with SMTP id
 bj11-20020a0560001e0b00b001ea99dddb35mr1188067wrb.384.1645655001209; Wed, 23
 Feb 2022 14:23:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220223162355.3174907-1-seanjc@google.com>
In-Reply-To: <20220223162355.3174907-1-seanjc@google.com>
From: David Dunn <daviddunn@google.com>
Date: Wed, 23 Feb 2022 14:23:10 -0800
Message-ID: <CABOYuvbO3ugf7RrgfsBJEP1m6RujNN0B_jmAU1UJ3k13E5tdkw@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Fix pointer mistmatch warning when patching
 RET0 static calls
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Like Xu <like.xu.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: David Dunn <daviddunn@google.com>

On Wed, Feb 23, 2022 at 8:24 AM Sean Christopherson <seanjc@google.com> wrote:

> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 713e08f62385..f285ddb8b66b 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1547,8 +1547,8 @@ static inline void kvm_ops_static_call_update(void)
>         WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
>  #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
>  #define KVM_X86_OP_OPTIONAL_RET0(func) \
> -       static_call_update(kvm_x86_##func, kvm_x86_ops.func ? : \
> -                          (void *) __static_call_return0);
> +       static_call_update(kvm_x86_##func, (void *)kvm_x86_ops.func ? : \
> +                                          (void *)__static_call_return0);
>  #include <asm/kvm-x86-ops.h>
>  #undef __KVM_X86_OP
>  }
