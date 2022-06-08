Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15419320A
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 17:53:53 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3135519f95fso47127857b3.6
        for <llvm@lists.linux.dev>; Wed, 08 Jun 2022 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZYP+ah1U7+mN31aQTFJq4MgSsX2goe2sE/NP4qdAU5U=;
        b=BSUl7JxGmnB729HAQjXimmjj8f9Tkw3EIFXgI1WL45S/MqvidYnh+pEtUIVi8lyYMp
         3FOd7Vft2hoB98KFadhSg8bE0bzYSCe4+jH79YukI+AoeAJsd0lJqIqRUO++n39ZG1Zf
         tOnjGxYk1ARMynx5cMnk8v+Z2OU+1I6HTrogCEIvZkBlmnMLQiRfxtrSvkSJwb30eLSc
         oxN+cJcv7FH6nko/NroiAOhIPZS9zxv4kRsCUYYnnUVD55BxhQTKb5tvcns+MCHE6z/1
         HyHj7USGIQpfG4O06Yaqc07KQDwyHEvP+16o0raoX8UKLr+o6DUKTe/otHCk2E2P7Xu1
         ie9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZYP+ah1U7+mN31aQTFJq4MgSsX2goe2sE/NP4qdAU5U=;
        b=saJ9xeIiAT/h3CMDpo2Oto780BMzhOcxllC6WLUffC5/iMCCRPWB7tSLGau89xnmBX
         OZaSlWlVdqdqcHc7/rhnHezZJRRiS156LcSrmmSVeWjwoCrv8Z93R/AJ+pbEadpyvnOd
         gMHh6ZJ2AWemBZ0ZphwPD0PevSZlXyFqmVxVkh0SqYPQS/UmFFEeQur9im9iS5uJXR4p
         N3IXsN5Zt/BmymBaFh7U+F2zCbCvtSmb906Dh6s3DuJgQ1LTAk9AUN4JHUAJuPLur7UM
         qufzN3+Sj7S+97SKRmVgHA8ef7u5yJPQU54LL/NH7fPOVMpwdpec9qNqv3M4BNqieVfZ
         EU3A==
X-Gm-Message-State: AOAM530v1HsndFv+BSUEC2q02bWFcZk/tLoK7M0lUcvk9a+OVpgosPd6
	fpgPpYUk4W2mtDMzyZoZkNewsaKbrtdhJpfW6Zuz1Q==
X-Google-Smtp-Source: ABdhPJyIp/kr/93Oc0dPwDHSBySwZnVz9Ba5VqpHQ/Mfh6VClr44aHdb03JA8owDUdvQtcPKFqrgVqUz+R3T/zalvrs=
X-Received: by 2002:a0d:eb08:0:b0:30c:2f46:f7aa with SMTP id
 u8-20020a0deb08000000b0030c2f46f7aamr38450413ywe.299.1654710832805; Wed, 08
 Jun 2022 10:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122170301.764232470@infradead.org> <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com> <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com> <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com> <20220211133803.GV23216@worktop.programming.kicks-ass.net>
 <Yh7fLRYl8KgMcOe5@google.com>
In-Reply-To: <Yh7fLRYl8KgMcOe5@google.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Wed, 8 Jun 2022 10:53:41 -0700
Message-ID: <CAFP8O3JdYoMeF75XHCWue3fYG02W_95VGCU6AN+DYPj9F75kqw@mail.gmail.com>
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
To: Peter Collingbourne <pcc@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Kees Cook <keescook@chromium.org>, x86@kernel.org, hjl.tools@gmail.com, 
	jpoimboe@redhat.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, 
	ndesaulniers@google.com, samitolvanen@google.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Tue, Mar 1, 2022 at 7:06 PM Peter Collingbourne <pcc@google.com> wrote:
>
> Hi Peter,
> One issue with this call sequence is that:
>
> On Fri, Feb 11, 2022 at 02:38:03PM +0100, Peter Zijlstra wrote:
> > caller:
> >       cmpl    $0xdeadbeef, -0x4(%rax)         # 7 bytes
>
> Because this instruction ends in the constant 0xdeadbeef, it may
> be used as a "gadget" that would effectively allow branching to an
> arbitrary address in %rax if the attacker can arrange to set ZF=3D1.

Do you mind elaborating how this instruction can be used as a gadget?
How does it look like?

The information will be useful to the summary of Sami's KCFI LLVM
patch: https://reviews.llvm.org/D119296

> >       je      1f                              # 2 bytes
> >       ud2                                     # 2 bytes
> > 1:    call    __x86_indirect_thunk_rax        # 5 bytes
> >
> >
> >       .align 16
> >       .byte 0xef, 0xbe, 0xad, 0xde            # 4 bytes
> > func:
> >       endbr                                   # 4 bytes
> >       ...
> >       ret
>
> I think we can avoid this problem with a slight tweak to your
> instruction sequence, at the cost of 2 bytes per function prologue.
> First, change the call sequence like so:
>
>         cmpl    $0xdeadbeef, -0x6(%rax)         # 6 bytes
>         je      1f                              # 2 bytes
>         ud2                                     # 2 bytes
> 1:      call    __x86_indirect_thunk_rax        # 5 bytes
>
> The key difference is that we've changed 0x4 to 0x6.
>
> Then change the function prologue to this:
>
>         .align 16
>         .byte 0xef, 0xbe, 0xad, 0xde            # 4 bytes
>         .zero 2                                 # 2 bytes
> func:
>
> The end result of the above is that the constant embedded in the cmpl
> instruction may only be used to reach the following ud2 instruction,
> which will "harmlessly" terminate execution in the same way as if
> the prologue signature did not match.
>
> Peter
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
