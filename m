Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0957E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 00:14:14 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r186so5646270pgr.2
        for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 17:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i4zvV8GRjb4CrksrmpeUffrn22CRBZOzQFKuTF6Of8o=;
        b=GwQS5AWoFCrKaW0tM0L+1wgUcavoqVtR0CO+RI9GAR8Q8tmmT8/2Vos7cnQE80DeNw
         Sbunv77tuAvGZpH95RAIwyg1fCn1o4BP0p1qF0cAnoj/DpSa1AREdV9wYu8+fIExdBme
         dlXWOoATf55aQvyff1tfbg+qxN42o28VYlwEE545oWdhEZh7QVTUfviwZm4VBqNbbclF
         u5DHcGD2U1wn37AyNCxwOVvsed+2lg5pgqxyiWUNQYIvNR0uebTng/kYZz+nfK+Alx9Z
         B0rjdwzFM/+IjZ+mhtG4qoT858pGbDlKGf6gpMctt+QOyr4LgTfroisA/CzLYIs8l7N2
         EzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i4zvV8GRjb4CrksrmpeUffrn22CRBZOzQFKuTF6Of8o=;
        b=kvJwcajk9vKEKK4PBH1r9hEIByvuzidDOZ0hGGBOQLJhAZYZd/Ch8vrwN+OGVQJhDr
         mJvAbILbg1xmg7krSsXPkDQw0+gWwR/IUI95jNdC2M7zjyBv9gnOjn+mjlUEL/UkiCl1
         idKybUvzLEi1VFrdBDuZ1wIwL1Xa1mPqvhK4xLu5pdBbwvepgYDUfEpypQ0aRPcNC6QI
         wshT2d2qiTBXPzY04QJ1u053sXAf8qciXknQZeyhf6bl/VNRpEFjFnPIK4vvEQs8nm6R
         nW7e5Es4VYj6vsenkBaeIFa0bCAgYlZcn7G4uIZeaq67qbdEHZwSBLCxB7JEjdK9q/FH
         sUOA==
X-Gm-Message-State: AJIora/6WrzW/tJufgEz0InVlBngXsvUckxWbznQJRDk26do4uObOHAX
	Y/u7ifuLpshAzcXBkaAxfv0KqA==
X-Google-Smtp-Source: AGRyM1s0JzbXAEiT7frXN665wcHYrzXMgqGSKZtyAjZYTnu5nScuZ4YundvPe2A/a5yDGR73fiep3Q==
X-Received: by 2002:a05:6a00:1ad3:b0:52b:37ac:4435 with SMTP id f19-20020a056a001ad300b0052b37ac4435mr2304241pfv.25.1658535253553;
        Fri, 22 Jul 2022 17:14:13 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id 203-20020a6214d4000000b0052ba5fe74c8sm4543145pfu.54.2022.07.22.17.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 17:14:12 -0700 (PDT)
Date: Sat, 23 Jul 2022 00:14:08 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Peter Xu <peterx@redhat.com>,
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@google.com>,
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>,
	kvm@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: selftests: Fix ambiguous mov in KVM_ASM_SAFE()
Message-ID: <Yts9UCEyOmr3uY4D@google.com>
References: <20220722234838.2160385-1-dmatlack@google.com>
 <20220722234838.2160385-3-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722234838.2160385-3-dmatlack@google.com>

On Fri, Jul 22, 2022, David Matlack wrote:
> Change the mov in KVM_ASM_SAFE() that zeroes @vector to a movb to
> make it unambiguous.
> 
> This fixes a build failure with Clang since, unlike the GNU assembler,
> the LLVM integrated assembler rejects ambiguous X86 instructions that
> don't have suffixes:
> 
>   In file included from x86_64/hyperv_features.c:13:
>   include/x86_64/processor.h:825:9: error: ambiguous instructions require an explicit suffix (could be 'movb', 'movw', 'movl', or 'movq')
>           return kvm_asm_safe("wrmsr", "a"(val & -1u), "d"(val >> 32), "c"(msr));
>                  ^
>   include/x86_64/processor.h:802:15: note: expanded from macro 'kvm_asm_safe'
>           asm volatile(KVM_ASM_SAFE(insn)                 \
>                        ^
>   include/x86_64/processor.h:788:16: note: expanded from macro 'KVM_ASM_SAFE'
>           "1: " insn "\n\t"                                       \
>                         ^
>   <inline asm>:5:2: note: instantiated into assembly here
>           mov $0, 15(%rsp)
>           ^
> 
> It seems like this change could introduce undesirable behavior in the
> future, e.g. if someone used a type larger than a u8 for @vector, since
> KVM_ASM_SAFE() will only zero the bottom byte. I tried changing the type
> of @vector to an int to see what would happen. GCC failed to compile due
> to a size mismatch between `movb` and `%eax`. Clang succeeded in
> compiling, but the generated code looked correct, so perhaps it will not
> be an issue. That being said it seems like there could be a better
> solution to this issue that does not assume @vector is a u8.

Hrm, IIRC my intent was to not care about the size of "vector", but that may just
be revisionist thinking because the:

	"mov  %%r9b, %[vector]\n\t"				\

suggests it's nothing more than a screwed up.  A static assert on the size would
be nice, but I don't know how to make that work since the macros dump directly
into the asm.

> Fixes: 3b23054cd3f5 ("KVM: selftests: Add x86-64 support for exception fixup")
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Sean Christopherson <seanjc@google.com>
