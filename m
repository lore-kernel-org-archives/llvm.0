Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D61E3D61
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 11:13:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id q21so24698559lfo.0
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hynKxUpBmUZLP/FxLm3hy+mBVxBV89eC7WIYWyCM4RA=;
        b=hZw5FTpSo/DvWzG5Z8akdgKlNmWcIBgk9FqFOjXpNCPbFWMeU9DHijYmxVQ9vrYa7B
         lEIrqpitm5cSCpF4IzYUD2/a8r+TwA3d2wh/+zrJ7nDatXOINTlwIq645fxCvSM8uPay
         kN3eEVOuAsX7uFZMy51wU5aXXsHqhI82pXonFguyOHp0X/otg7DIliqbx5HoQHaqmnt7
         P/PHBLyf1ub5NsxkNAAIN5Q6UXSO0JIcUVCUHDvw83ss0+aeAul58s+U11XYePyJqLlx
         /dM5jMxp2Dexplk3w1tOMf+Y0Pa9gBoGUhFHuoEUSw+ZNXFGZs9+BzS2W65b22DQWR4S
         YeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hynKxUpBmUZLP/FxLm3hy+mBVxBV89eC7WIYWyCM4RA=;
        b=yI1scqXxqxTvpe6N0fzCSJPECApOMO7IvSolIGhUB/ZicXfwaKYFyDe5JwN2bXU6sZ
         GPTVI4vzVMyMpYaYHl9Xf1eSjqq+FY1NDJxnuFr1V4XLghgD0wCqzQQyPilARCYKZBva
         DwzhaZ6TZkRW1UWol+gSP6aVPGqRqEm3WWCv4KROiSYtUiGCZZUDZdJB7ugeMtZZaRJt
         bm4keiEJOU/GwV8JsGnawMQl4a141cHNsrCEVoYkoQGeC/3Zad+UVbIGcDP4W5OHiMBA
         mwQxqbcL4iosfspq8ZywjCsPrMSyP6PJdwZbZDGX0u/Ky+gTk8wfMqYLRtSkKtYTMjFp
         Q+bQ==
X-Gm-Message-State: ACgBeo0Wjd6aaYi4l7kvs/4hsfmOfL3Qchd0lF0oZC7ssQmVpoTj3Iom
	evWIYhUtvsFS0rtHlqNyG5vOVM3GW7dLxYcha1M4kA==
X-Google-Smtp-Source: AA6agR5eUjGtOI405CJb9XChyUwKm/4kQXMJttGfYrSvJ6A0BGMzTPRery1kUYItV6X7QUdtyypHG9wVI9IegfnCB0w=
X-Received: by 2002:a05:6512:2382:b0:494:9d44:a5fd with SMTP id
 c2-20020a056512238200b004949d44a5fdmr11814198lfv.494.1663153995919; Wed, 14
 Sep 2022 04:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812183501.3555820-1-acdunlap@google.com> <20220908170456.3177635-1-acdunlap@google.com>
In-Reply-To: <20220908170456.3177635-1-acdunlap@google.com>
From: Peter Gonda <pgonda@google.com>
Date: Wed, 14 Sep 2022 12:13:04 +0100
Message-ID: <CAMkAt6qUs526FCq26Ht48c2KVZWe=QcNds6_LE6JJbs-7Hzk+g@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
To: Adam Dunlap <acdunlap@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Ben Dooks <ben-linux@fluff.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>, Marc Orr <marcorr@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 6:05 PM Adam Dunlap <acdunlap@google.com> wrote:
>
> Previously, when compiled with clang, native_apic_mem_read gets inlined
> into __xapic_wait_icr_idle and optimized to a testl instruction. When
> run in a VM with SEV-ES enabled, it attempts to emulate this
> instruction, but the emulator does not support it. Instead, use inline
> assembly to force native_apic_mem_read to use the mov instruction which
> is supported by the emulator.

This seems to be an issue with the SEV-ES in guest #VC handler's
"emulator" right?

If that's the case I think this should be fixed in the #VC handler
instead of fixing the code that is failing to be emulated. What if
there are other places where a testl is used and our tests have not
caught them.
