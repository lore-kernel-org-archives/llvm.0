Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965B42568
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 16:01:16 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f16645872fso53579717b3.4
        for <llvm@lists.linux.dev>; Thu, 05 May 2022 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DcrivyRXvs78RFPsaHX0wtRuc37eGonVpkZc+fBUUp4=;
        b=SWulOcJxmVeZWRUP1r6ihWVnsx4vTmwi4LLMgKz74yg3+KJ+ewPEUGHzph6ZBsR7QZ
         haxC8UhbOAPhatpgkvmR/Z0HRRx55tsMFnC7gxS2LGQXN7HnykS4CwtaRiK942O3wUKs
         qq7RDt1iU7ye3njrHkDpfcGYzJOBhIvjlCrLcHN2SxElDLdjKCX5+N9AQDaeLr+h6/Hf
         TF8MWUYRetgCTAH5kOeSGpj1SY3scjUUziOdTuetbjph81XA+lyZc07zWmOfjgZ8vZFf
         waw0UDrA/7G20XsiZcN9b6KVrkqZAiOyy6KeEVEWmIIe3q5I8FjCPuxlZkcbx449hoV+
         +rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DcrivyRXvs78RFPsaHX0wtRuc37eGonVpkZc+fBUUp4=;
        b=uR239KesqV26L4d4cGnJyX20dcIzEXx8i/fvh/I+4XTCjHy4OwHXUTSLqSiolgY2s1
         DtSUuD4voOql6pb+29u+YRB+Z/MTbj744dgzfZ7lygvVGH+tNOIB/Dq9S6kgAToL1EmQ
         723Mf1OCV5DeXDJ9RDMCBDPKp87O9Z4OBBHRV8DCXFwRozz767cEL8nVyzN/u2dQSHTW
         fLk1vxzxiiLdVe+Nf3jTIynRABOxWMuiQCmoZsMjJR4MZHc57PVorqw/6ORbuU9495xT
         xMfCPOTPsNcdvNppA2buwz+8GcFHWoTAcD5hUj0sQfUO5rvS8sZpG80wJNhK/aU84QVX
         /FSQ==
X-Gm-Message-State: AOAM533fRgogHqgyEDcng7BCZLSXcKSQvMbo61BIZ5+iUfunA/+5Wbaw
	+wD5ClY9mz+rUTbUEpes5zdM/HeoK9Q3fcPyUy22Fg==
X-Google-Smtp-Source: ABdhPJyeRJ1A9AX0DmoDqRxo1/DLQHUcof5m2XXSj8lNypY3bHNmQWOqrUEnbss0WuBMSpwMGU3MP94Rte1iYZrYks8=
X-Received: by 2002:a81:8d02:0:b0:2f8:c9f7:4041 with SMTP id
 d2-20020a818d02000000b002f8c9f74041mr24674320ywg.117.1651766475264; Thu, 05
 May 2022 09:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
 <YnKnLyyXPJl5Llc0@FVFF77S0Q05N> <CABCJKudT9r=r0an4BwNp0-E1wC94wLWiHvUX4_vA8tDkQ=uHKQ@mail.gmail.com>
 <CABCJKuc-6daZd8N6hQV6i_TtCtVpfzxJ2UW6xwxC2vxTmJ2deg@mail.gmail.com> <YnPEzeab/R270gAZ@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <YnPEzeab/R270gAZ@FVFF77S0Q05N.cambridge.arm.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 May 2022 09:00:39 -0700
Message-ID: <CABCJKuced3-MoZoBdpL+=h1PC32C-5C12HZH96+dfEp43dJwaQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/21] KCFI support
To: Mark Rutland <mark.rutland@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Joao Moreira <joao@overdrivepizza.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, May 5, 2022 at 5:36 AM Mark Rutland <mark.rutland@arm.com> wrote:
> FWIW, a `-DLLVM_ENABLE_ASSERTIONS=ON` build also seems to work for me when
> building a kernel with CONFIG_CFI_CLANG=y. It's much slower than a regular
> Release build, so I'm still waiting for that to finish building a kernel, but
> it has gotten much further through the build without issues.

Thanks for confirming. This issue should be fixed here if you want to
give it another try:

https://github.com/samitolvanen/llvm-project/commits/kcfi

Sami
