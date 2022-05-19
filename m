Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCBB2C80
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 20:42:19 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id p139so10979264ybc.11
        for <llvm@lists.linux.dev>; Thu, 19 May 2022 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z2okLhz72KUTvla4YyoDTB8A/W8JoxXBQasuMUph8C0=;
        b=d2ACSNJz5Z8ThxTfbHc462MoLXTn6k5pKJ9S8YoDulcbrtuD12Q7GHSdwteiu3ukqF
         8jm8K7ARf6N8ex53iZDSVuRkhCCKuPM3siwOeFnm++0kLE32geBnd9BfvESLJGAOjiEx
         OR4ibZwwOngZDxrb6FIj4vWGc7cVl6ea2yFnW1Y+XnEbhVrwHFuayzfHQ21OYZV8TcVg
         1/dne1LxTfdLS2mn6T/t8oofcir+h2ipDqF2MJyXJVi6J/c3Zyowqds2/KZpXKnG55qo
         DWbEU2HpavtgJ7G69pKePU2mXV+TgVs3Xn5a81GpLuMBsCElSG1yF1jX7cnhwb+TYZ5J
         KL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z2okLhz72KUTvla4YyoDTB8A/W8JoxXBQasuMUph8C0=;
        b=k0fAA8SJhXR1Rr1Kilug7kPPLyPZWAZkXaB3TGZakngfaqY6Po2FbNMSkmW8+eUHJM
         AgL7TWjJhUNfEw1vmOhcMnR377Ee8K9JNdDFQ3GUEo2wpasiI2AOUMnkfBydHFZWVovS
         TQRysqa9WkZhtIxfXFJjDxP2OMHv+i7HTso40GRbqjcpr+JAmk12tmwTn+SGr7W3unyq
         YBXrkwowRP6+2MGLNx/CUd6mpevW9f3Pu/NngnpfE16dZ+tGjUjwXw+gmltOUQ07ccGn
         zpjumizKf2v1KipIMV2tolMwVxAI90qarA8xJmHeIBbkIjLinE3bJmXoPuqh0J6VLnVl
         I1lQ==
X-Gm-Message-State: AOAM532P2SOvCfDCXgvpuI4FeTFHetBKJMECJuQVbCzXmn5n0IiWe34b
	lcu3lwdwExIte5VKF8lLJTR4YZGTWJgFftVNW2iL1Q==
X-Google-Smtp-Source: ABdhPJxJ/yh/6kwjFetK+yKNj03Si68VL6xzAYIFBlugdZlKFzZHju2VwSEDLPIqRhvMZjc2UyCWKc4FGr1HAakdJJs=
X-Received: by 2002:a05:6902:18a:b0:64b:30ae:da2a with SMTP id
 t10-20020a056902018a00b0064b30aeda2amr5956500ybh.314.1652992938667; Thu, 19
 May 2022 13:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <CA+icZUWr+-HjMvY1VZf+nqjTadxSTDciux0Y5Y-+p_j4o7CmXg@mail.gmail.com>
 <CABCJKueVcwYishxSoEyn9b1vaGTXdoYWF7VyANPm7V=H+yyfhQ@mail.gmail.com>
 <CA+icZUUBqz1zTcj61nK=sbkWcSncKYZgR2Qg0FSCWi9un84yLw@mail.gmail.com>
 <YoPuMhc03hUJxmPs@dev-arch.thelio-3990X> <CA+icZUU0k8UHRiFvV45nr1xY0p3SgaG+MLjJoEnmUCQ8T+WGdg@mail.gmail.com>
 <Yoan3dgL988r0Mv/@dev-arch.thelio-3990X>
In-Reply-To: <Yoan3dgL988r0Mv/@dev-arch.thelio-3990X>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 19 May 2022 13:41:42 -0700
Message-ID: <CABCJKueRFbzmJaZVj=oSP9mg+93mQrYo-eiX+ZZh0EP34VdE-g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/21] KCFI support
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sedat Dilek <sedat.dilek@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Joao Moreira <joao@overdrivepizza.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, May 19, 2022 at 1:26 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, May 19, 2022 at 11:01:40AM +0200, Sedat Dilek wrote:
> > On Tue, May 17, 2022 at 8:49 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > I have run kCFI (v1, I haven't had time to test v2) on x86_64 hardware,
> > > both AMD and Intel. I have only found two failures so far: the i915
> > > issue that I mention below and a failure in the KVM subsystem, which I
> > > can see by just running QEMU:
> > >
> >
> > Is there a fix around this issue?
>
> No, I mentioned it offhand to Sami in IRC but I never followed up. This
> failure appears to be introduced by commit f922bd9bf33b ("KVM: Move MMU
> notifier's mmu_lock acquisition into common helper").
>
> Sami, do you want an issue opened around this somewhere?

Yes, please file a bug. The ClangBuiltLinux Github is probably the best place.

Sami
