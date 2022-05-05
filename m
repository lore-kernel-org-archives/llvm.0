Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FA2568
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 16:24:04 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f83983782fso54433797b3.6
        for <llvm@lists.linux.dev>; Thu, 05 May 2022 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=smRiEfnbDo26TwlBRyyocGS+bQqlFH9vecfF+kAEs0s=;
        b=Qchh5LkpHNgVC4oS9Z3uWgrF0tIOlBwLOSM/ue3hd7CJxr3Xz29EiGWTzgXTX2LwGK
         4uq7mH3isrmT1EXJizLeJvJFDf9LhlUWCoaapbPnape0t+PH8AJj+InrnhX20me7M3HY
         0B22flgiAh5eU+2rzqiChpz1dG3nkkfcoA5K4izNjU7LnZI5qiNJ1bES9xbfWS0aiMLn
         FMtUx1jWRGAWdwCFESrmwS5Fc8W+htfQnqj9NZBWJhEW4YYXh4B6Plfp1rs4wwS80kCy
         61wjIvrcCLt+vJmaIMIapWofk3R5LsYlU1VYyQHWZBjyEYCrwX1AeAxL3OazAT1j/diq
         aQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=smRiEfnbDo26TwlBRyyocGS+bQqlFH9vecfF+kAEs0s=;
        b=K9vFqENDr8QX8B+7//82AWjJ9saus5IIgRweJjyfvrUoRvssTctjhC3dYNObFbl5eF
         MbLtfJiGIRX9CarkLjy7kJU2ncilVGGUACUYkpoQIxaABjd7xhbi5AgYSf2n8LDcr8r8
         d9WbUfS3x/FB0q5lEKfA8NxuxG/Pn48AbloWAddsAf8bmy6NT+7NwuBXvPrLR4I1Z7XK
         QNJNepzUDDF1Igh1YWeRrSDxfGUrXu3IB5/PusbUFy/AS9FrAs3Ia8ZtBcxFD/+7mwap
         bNDDMdS2/DujkMoWPzSq6m687vpEEcT4lQxQV3tYiE5h29Fsv8OfhynNZla3CPTznFoy
         T4mg==
X-Gm-Message-State: AOAM531y5WApGnE7hBmqnHdPQaIRP1Y/qZUkVEqPe5FUPmnWBMn12MJn
	jaovCE95iagRuZB6H93QHPYFGoIhhIZf3yeF+m47uw==
X-Google-Smtp-Source: ABdhPJwBW6nLJQllaWjle33ZcjdAaJs8arGj4v4LRwbmOZTByqaTFnO79d1yMOwsSb1JbpmCL3d16OL6yDeASvHtlUs=
X-Received: by 2002:a81:a93:0:b0:2f4:d65a:d44e with SMTP id
 141-20020a810a93000000b002f4d65ad44emr23725228ywk.243.1651767843390; Thu, 05
 May 2022 09:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
 <20220429203644.2868448-10-samitolvanen@google.com> <YnPw+SiY9Ij/b7Yg@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <YnPw+SiY9Ij/b7Yg@FVFF77S0Q05N.cambridge.arm.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 May 2022 09:23:27 -0700
Message-ID: <CABCJKufjVAbSCcoQZzkemvkmMmwb6DoRYNPu3ADHGoRL_zFPtg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/21] arm64: Add CFI error handling
To: Mark Rutland <mark.rutland@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Joao Moreira <joao@overdrivepizza.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, May 5, 2022 at 8:45 AM Mark Rutland <mark.rutland@arm.com> wrote:
> It would be a bit nicer if we could encode the register index into the BRK
> immediate, i.e. allocate a range of 32 immediates (or 31 given BLR XZR is
> nonsensical), and have:
>
>         BRK #CFI_BRK_IMM + n
>
> ... where `n` is the Xn index.
>
> That way the kernel doesn't need to know the specific code sequence and
> wouldn't have to decode the instruction to find the relevant register -- we
> could determine that from the ESR alone. That would also avoid tying the
> compiler into a specific code sequence, and would allow that to change.
>
> Since the BRK immediate is 16 bits, we have enough space to also encode the
> index of the wB register, which would allow the kernel's BRK handler to recover
> and log the expected type value and the the value at the target of the branch
> (that latter we can recover from xN, so we don't need wA to be encoded into the
> immediate).

Sure, sounds like a good idea.

> ... does the compiler side of that sound possible?

Yes, this should be doable. I'll take a look and change this in the
next version.

Sami
