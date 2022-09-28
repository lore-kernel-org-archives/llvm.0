Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E317B
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 23:45:06 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so9161320otu.7
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ESo7dYY6GfSDr+r4KK+gGMltslb0uxWselTUsHs3b/I=;
        b=oItvueHC9rGpEb1pjDREbzHBF4FsxPszjkSVzhJXqpPU49y/K5jjrfmA7oddFNQfmP
         sR629g48JwNN9T6R8G660mC9vUqTrrGYcg30Wdo+KgVe2AEYXxT0AqJRF6IxQCT7U3wz
         HN8BVD0i673m0Llrhm1mnVpn5n0b9H+HvrBP+p43/3wVnBLIluaF6JazpmqonSDZmMSx
         rcazm5CE45xgvNTlQGaHPuiick8amlxtoYzCvslzqE8f/L9VW5Mi7TziUCMHaDlzKyj+
         LnLxsGsboagft/aX9Aanz8y41bPYUD6i/5aiU+zhx4vN6qQjNMp+6HtDmMytNC2gdTlu
         GM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ESo7dYY6GfSDr+r4KK+gGMltslb0uxWselTUsHs3b/I=;
        b=RXxMf1p28elZ4eX4k3loq6o+Lr20jP613m+HiSOj1cWQ5wckcJ8+ReOWnMMv4kTw2n
         ZW+WO2aDHQVQ8PrSjBq580IKOkWX+ZLeT8ZhkW4HW1rg4MuALKy93J12CVn6m1WQiaIx
         0Agk8v3EJ052mB1XWOax/SULzeVP7wjfU8aT90yQwTLeZMR405FFgxBwB8Nxzx0Rc7kZ
         WQFi46a+REkwLW7Jk289shHzobSRKElF/woly/Lqy//NGOgsP8h/Y1eHQo5wUh8DuTh0
         IgBqSxQ8zgSRYNa3ervgpvHTMuu8q56juA3RaCXzuyqPImc1xrhkLUA8vhfdGFWA4Gu1
         OExg==
X-Gm-Message-State: ACrzQf0/knSkyd1nwWOlERaqEeHhQ71ThBn6VtbpfrlBZZAZP/LfGAdL
	F/0WEBeSIkqBK7pDlhjUMxyT2fGb6c78uPCZ5redJA==
X-Google-Smtp-Source: AMsMyM5BEgYUYkwCxhv/sZA35LzbvEoRuf+YYFHT4kB7vvwY9taFoIle4rOgzDexyQJ331I5KruMLo+4Blr6HuHoaCo=
X-Received: by 2002:a9d:6296:0:b0:656:761:28bc with SMTP id
 x22-20020a9d6296000000b00656076128bcmr172073otk.14.1664408705832; Wed, 28 Sep
 2022 16:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220928233652.783504-1-seanjc@google.com> <20220928233652.783504-8-seanjc@google.com>
In-Reply-To: <20220928233652.783504-8-seanjc@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Sep 2022 16:44:53 -0700
Message-ID: <CALMp9eTysg_AdBi3BsbMzj4uKjsHLOOa1B3x+j8=CH=Lvzr8jQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] Revert "KVM: selftests: Fix nested SVM tests when
 built with clang"
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Jones <andrew.jones@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 4:37 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Revert back to using memset() in generic_svm_setup() now that KVM
> selftests override memset() and friends specifically to prevent the
> compiler from generating fancy code and/or linking to the libc
> implementation.
>
> This reverts commit ed290e1c20da19fa100a3e0f421aa31b65984960.
>
> Suggested-by: Jim Mattson <jmattson@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
I love it!

Reviewed-by: Jim Mattson <jmattson@google.com>
