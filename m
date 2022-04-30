Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F727B
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 01:00:40 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id y2so17211497ybi.7
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 18:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+/lXmWN9a4yBqHcUhGldW2cPmJygtUYS178VCmvTIc=;
        b=sae9+FjGo9T5Lw9oasK5TSXV+WiJ9kOd1rZxgJTdRsikk6ZkRbafNdUGY5LNRGAq7z
         KLeLF9me10KOS2tdhq3QqUpedIvCKSr1k5DC/BpSJXrYAbYGX36I/OHi5sPl2+ZQlekd
         66J+Wwfye+d+OmHrkDF8heOen1RhSJWCYyaI2bN5JBrcN16V9XbLRRbXVKl4swa18OO5
         tjzIGXovtKoxHb2BPhqhs7CQ8j16lH/BUJJAJBpzv9rkOq3Qi4oG9OwF3Ppi6ZYwQt7t
         c0tGVoQRbXL9RFIYG+2HjirHMKUjpclTwnxrV6ci7lqAUdDwRL4xfTYawAje7RdrXeb3
         Ouqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+/lXmWN9a4yBqHcUhGldW2cPmJygtUYS178VCmvTIc=;
        b=bIjxTz1C+HCOfbCN4DYmsUaaQMa1awyzNbBOrQTTA6VoRehe9bbXTIPZsp6ASYq1rf
         Q3b9BfbCbcXMmUxXycZb+mQbCsIhCoBXbrJ/VnqljwCjw7iN2pvGlBWA4Ila1WPGdRHA
         4VNUnSJuHYuIFiYtcrwQ2/HXPL7cHdbxoFeW8QyZAT+whUnHiWJ2Ni+jUTOfkRbE7iff
         KPBDiGobUyqaSDQY4M7BaI4JXCXw0rhZsEDFBXRFjnhJHVfuoZpt3Z/o6VkcOpxe/yP4
         QsYbqoJ4Xrn7uLT799myHG194ADUiwFTqBTKXr2dbFgRdJPfEGFd1weNa8mrLaGQlzqX
         9dUQ==
X-Gm-Message-State: AOAM531j33vsmMajxcmp6OKbu3QPdwc7owxb/MY1JQEIHyszrexBENE0
	I21Ye3vIW4RtGHP92YuXOtorx+gvEAG/rEIiXh7RuQ==
X-Google-Smtp-Source: ABdhPJyhcCyxowcmxR+EC+1LVLQSQWfwL5P0ozbbvft+6vNS3yhM7DK8vGFq8LI/3sHN0lOaYWVuT+28wwYR2ixEuLk=
X-Received: by 2002:a5b:2c9:0:b0:644:b7c9:3766 with SMTP id
 h9-20020a5b02c9000000b00644b7c93766mr1986227ybp.428.1651280439211; Fri, 29
 Apr 2022 18:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
 <20220429203644.2868448-17-samitolvanen@google.com> <Ymx1JcO36h7YqLa0@hirez.programming.kicks-ass.net>
In-Reply-To: <Ymx1JcO36h7YqLa0@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 29 Apr 2022 18:00:03 -0700
Message-ID: <CABCJKufNUoJJPcraG-o2AvTBSWmFEQAzg0z-Z=xLohBqsMA3KQ@mail.gmail.com>
Subject: Re: [RFC PATCH 16/21] objtool: Add support for CONFIG_CFI_CLANG
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 29, 2022 at 4:30 PM Peter Zijlstra <peterz@infradead.org> wrote:
> Urgh, what does this do for decode speed? This is a hash-lookup for
> every single instruction.

Two actually, since .kcfi_traps only contains compiler-emitted
locations and we also have to check for manual type annotations. I
haven't measured performance yet, but I also didn't notice a
significant impact here.

> Is that kcfi location array sorted by the compiler? Because then you can
> keep a running iterator and replace the whole lookup with a simple
> equality comparison.

The compiler generates a separate .kcfi_types section for each text
section and the entries are emitted in order, so this should be
doable.

Sami
