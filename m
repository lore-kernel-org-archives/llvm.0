Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E862C96
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636101890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEON2O/QaUYlu8aac/UW8WFRqnCIxmxxRfN8DejAkjI=;
	b=LYtFzz0mTS89ArI93qErd0LAfpugtDBHJwg/JyzE3mw5V1yi5i/KPe2tM1DGkO72Ac2kkA
	AwL4vu+edbZ5AWjhTumQpj7WAON7c6fHBkDQIRVuFOmgSNde2hMdmqhsH3kHUokyqC09wi
	gfZTN0LeugbUcKmZZsLzCkg15YMvsgQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-jp9yPzX4O_e35Q-h9Qk7_A-1; Fri, 05 Nov 2021 04:44:49 -0400
X-MC-Unique: jp9yPzX4O_e35Q-h9Qk7_A-1
Received: by mail-wm1-f71.google.com with SMTP id 67-20020a1c0046000000b0032cd88916e5so3065245wma.6
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 01:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UEON2O/QaUYlu8aac/UW8WFRqnCIxmxxRfN8DejAkjI=;
        b=n4H/s0FctSl84jxZ5R2VCXdCg/eCNt0I9zi+YaH8nK5XYxDjPOivWHxrD27WEkVNUf
         INAR9bJys5nraO9XEKfC1dmp80UzEqoLt9N9/mFf0HMhXeB67/vUvh0HuAs3Y+r26Emp
         ROiF9jYVnoZYCv5Z3gyppXOUXO5+YgUedzA57KXdF4TOOGtWV8RTs36R6nSbl68vUD7W
         lvvrPw2sBQt7D99lXkLI0K3uvRXJvv/su+MrJpjOR7KxJSM7AYBkY8B0/diSvUBqZXoR
         I1UQ7Um8V5wc61uqYjVm/ZgLtZn7AKyOcXIm8zLX3uSeRL+VptzLxCGkvLx13O0sIaka
         KU9w==
X-Gm-Message-State: AOAM531Mo1j1qju+ymVAcAXUFtKSI9spjuhxWLdmiPbKsfvLUWLkrCZn
	BBMTA9ocjnGEHM5ZNXiGXTqvMGcBOE0qafDb++RLTJdl/CNJDDLgzJHMhZ9ULohpR+UbIAmw8YU
	G908M6602vaHuIg==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr34762550wrr.365.1636101887866;
        Fri, 05 Nov 2021 01:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAUuGv0L7IVSlR//LzFEV4bKp4CmVx4Lao+THFdCwRuGtlyKCM5hyR7BsjTfxDBNvA66dvwg==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr34762522wrr.365.1636101887646;
        Fri, 05 Nov 2021 01:44:47 -0700 (PDT)
Received: from [192.168.43.15] (93-33-2-31.ip42.fastwebnet.it. [93.33.2.31])
        by smtp.gmail.com with ESMTPSA id z8sm7574365wrh.54.2021.11.05.01.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 01:44:47 -0700 (PDT)
Message-ID: <c3757fc0-09fa-b0f1-7165-795e0363058d@redhat.com>
Date: Fri, 5 Nov 2021 09:44:05 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Please apply 3d5e7a28b1ea2d603dea478e58e37ce75b9597ab to 5.15,
 5.14, and 5.10
To: Nathan Chancellor <nathan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>
References: <YYQjyo/dKfDb/no3@archlinux-ax161>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYQjyo/dKfDb/no3@archlinux-ax161>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/21 19:17, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please apply commit 3d5e7a28b1ea ("KVM: x86: avoid warning with
> -Wbitwise-instead-of-logical") to 5.10, 5.14, and 5.15, where it
> resolves a build error with tip of tree clang due to -Werror:
> 
> arch/x86/kvm/mmu/mmu.c:3548:15: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>                  reserved |= __is_bad_mt_xwr(rsvd_check, sptes[level - 1]) |
>                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                                            ||
> arch/x86/kvm/mmu/mmu.c:3548:15: note: cast one or both operands to int to silence this warning
> 1 error generated.
> 
> It applies cleanly to 5.14 and 5.15 and I have attached a backport for
> 5.10. I have added Paolo in case he has any objections to this.

No problem.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

