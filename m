Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF72F25
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 17:09:50 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id c9so15857226plg.11
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 09:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PUIgelpXEQevWyX1W8jBsBa/dCPezZfxgXScg7BVU5c=;
        b=SW54mIhtH5QKZwMa5XF99tt04pvq6dTodAAzJOC/fyaSsk3YbovTPXlN9dJtQRy9RV
         sZ5Dr2tD8bdIVEhWaqhIYeHFefl4pgIq29m2gZi8tpzDap4fJXTdR3kIIi9/v+aYemK7
         NBsYzn2I5t8ouHEH4apgnJHW2iZ5yr/UbkcAhqdSVDWJW6R9FmeJJWj9nc4+BDqoqw7K
         Tpk2sYjpqGYmk+u2ZqauQdVk0zErJXuHJDqCphJZJ+T9yXMODdkf4BGotlaiakIQxOy0
         t25O1aVH9BsUDt+a2ggdR+VkgUv2zOMBHz7WI2miDkM4USIWtb8TTbHAVKfcAvaWPXwj
         2fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PUIgelpXEQevWyX1W8jBsBa/dCPezZfxgXScg7BVU5c=;
        b=5KrhKl+z44qxmrWzvWi+mficJZE0+ZrShPsMr1DF8Aclmwjj4eT6anmUC6Qor/F4h3
         B9o2QDP3ttc3cjiIBNz+YqdJyf/DZpsjvDoEjkP04UAtIWrENVJAkjvG5rJmaGhFdQcF
         LhiYuQ8C97XQf9OHeELcqaoLVDQVjqwzVIX96+HAULEmY14mm8P8dZt/wiBxE9t91NLd
         5cWiWpJdwKDTEgYTBfK69DUJ4rNPQODJ0YJcRC7knWZlfTWYwP8aWpKiazo1bPwvy87d
         Fl1+wCKTrNJl2o9eHFytbrA32qMTrVF37xRn5qMf8PZEwcNRtqCYfJ2iAN9lVEbEQ7Z7
         Kt+A==
X-Gm-Message-State: AOAM530nx5o8868xMwbtPTqPDyvNOO1k9zzevSDfEvgkMRCaOcftW0K4
	4/gb6KOpbwBoG3/HipKqo9o=
X-Google-Smtp-Source: ABdhPJz5yB07Ix5o19k8F+dU8Px3ktIP0ST5YMwenoAWVaxtH3aTzk6TAg04YPusVJsGsVMBn8uNyQ==
X-Received: by 2002:a17:902:e812:: with SMTP id u18mr26752712plg.12.1643735390153;
        Tue, 01 Feb 2022 09:09:50 -0800 (PST)
Received: from [192.168.254.17] ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id h14sm23508476pfh.95.2022.02.01.09.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 09:09:49 -0800 (PST)
Message-ID: <d065921b-784c-be0c-3ad2-f2ededb201ac@gmail.com>
Date: Tue, 1 Feb 2022 09:09:49 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/5] x86: uaccess CMPXCHG + KVM bug fixes
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li
 <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com,
 Tadeusz Struk <tadeusz.struk@linaro.org>
References: <20220201010838.1494405-1-seanjc@google.com>
From: Tadeusz Struk <tstruk@gmail.com>
In-Reply-To: <20220201010838.1494405-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/22 17:08, Sean Christopherson wrote:
> Add uaccess macros for doing CMPXCHG on userspace addresses and use the
> macros to fix KVM bugs by replacing flawed code that maps memory into the
> kernel address space without proper mmu_notifier protection (or with
> broken pfn calculations in one case).
> 
> Add yet another Kconfig for guarding asm_volatile_goto() to workaround a
> clang-13 bug.  I've verified the test passes on gcc versions of arm64,
> PPC, RISC-V, and s390x that also pass the CC_HAS_ASM_GOTO_OUTPUT test.
> 
> Patches 1-4 are tagged for stable@ as patches 3 and 4 (mostly 3) need a
> backportable fix, and doing CMPXCHG on the userspace address is the
> simplest fix from a KVM perspective.
> 
> Peter Zijlstra (1):
>    x86/uaccess: Implement macros for CMPXCHG on user addresses
> 
> Sean Christopherson (4):
>    Kconfig: Add option for asm goto w/ tied outputs to workaround
>      clang-13 bug
>    KVM: x86: Use __try_cmpxchg_user() to update guest PTE A/D bits
>    KVM: x86: Use __try_cmpxchg_user() to emulate atomic accesses
>    KVM: x86: Bail to userspace if emulation of atomic user access faults
> 
>   arch/x86/include/asm/uaccess.h | 131 +++++++++++++++++++++++++++++++++
>   arch/x86/kvm/mmu/paging_tmpl.h |  45 +----------
>   arch/x86/kvm/x86.c             |  35 ++++-----
>   init/Kconfig                   |   4 +
>   4 files changed, 150 insertions(+), 65 deletions(-)

This also fixes the following syzbot issue:
https://syzkaller.appspot.com/bug?id=6cb6102a0a7b0c52060753dd62d070a1d1e71347

Tested-by: Tadeusz Struk <tadeusz.struk@linaro.org>

--
Thanks,
Tadeusz
