Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668211707
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 16:03:21 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d4db57d2982so2297174276.3
        for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 09:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691769800; x=1692374600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QicQJOjgKiKxRkWAIMkdNTxOHsl5Eu2cMoQS7IuOwSg=;
        b=vryuFQCyes4h26kYwko7fb7ZPaHOi9ZTZZmdOlBsPUU5YTqwe8xp6L4IWHJY0E/WbR
         IBExdw6x3z0OltjlQ9M6j6An/MhX6XMATLPZK+RKbbtO2WOidd+LCXQlQ1R0PBvCyFKT
         tE6uOig5U94yBGQrNy8+vRdsvmWnXHUYcdUtzhG75sOtA5hPtiAfMFBAG4CO92BInMLq
         3shoLMyip80G9w4crpPnW8U2SFeeEgTJIaBcdVxj1Qj0jvWZKcP832P8PQQCHg+J0sI+
         DV2nbpn+r1seM3WbR6yrQq2TwRa16toZfi1xTDIEkict4f/NO/7YymUrnE0x4tPTo0L+
         3M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691769800; x=1692374600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QicQJOjgKiKxRkWAIMkdNTxOHsl5Eu2cMoQS7IuOwSg=;
        b=WrvvTlWMXCMWW58xMMdrSOSwsSWG+ECFcBRwOw8GzQ2fvaBgu5jkP5WsKxxoAUZfgd
         DirJwgDE2rex+E0Izyz48Ox19Cr4wM9LN3vP+YV8OGTmKaTKRbXG0xcvxISK5FkZ+LQi
         unrryCf8J0781NLXZYEMiVUmU+m2nCNBQziNFG8y3HSunTJjDo1nGYsEdsxxfxG5cmul
         nM5aOcfujNHz7VyiYlT8eZtuOJtcQSzfGLwwnU4jCCz77BgPOyilMU7stKdc95NUAMVd
         b30ASbQ0f2rBOwVvXX9FeWKJsyNrCEu7bOrAVeduThOnLfdd9dHTWvigFEBv97G/Yn8n
         nGEw==
X-Gm-Message-State: AOJu0YyXdHtKC1YxkgqUBbtZaEvjvAlPqxfPuxL5LawTSxvkTlKwmDAi
	VrCmMERQ7S/HVdB3vxYBj5LDej0jP3M=
X-Google-Smtp-Source: AGHT+IH/0S0tZVg7nutYPISR/350fmANEZNBDNDpLeLf48SQ6mV0KbhkYUQOH6L1xSH30hdOAKnWDqRIXyM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b097:0:b0:cb1:918b:d19b with SMTP id
 f23-20020a25b097000000b00cb1918bd19bmr41895ybj.0.1691769800394; Fri, 11 Aug
 2023 09:03:20 -0700 (PDT)
Date: Fri, 11 Aug 2023 09:03:18 -0700
In-Reply-To: <20230811140941.GB193223@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230810132706.GA3805855@dev-arch.thelio-3990X>
 <20230810133216.GKZNTm4KpohRR4gVsT@fat_crate.local> <20230810134056.GA130730@dev-arch.thelio-3990X>
 <20230810144344.GLZNT3oM6MLVdzGlyd@fat_crate.local> <20230810150706.GA42856@dev-arch.thelio-3990X>
 <20230810151410.GNZNT+wn/cLBWiU6dO@fat_crate.local> <20230810154831.GA38495@dev-arch.thelio-3990X>
 <20230810161414.GA4000@dev-arch.thelio-3990X> <20230811101456.GDZNYKIHs1k7ri8hrI@fat_crate.local>
 <20230811140941.GB193223@dev-arch.thelio-3990X>
Message-ID: <ZNZbxhL5ZJD1Sd9P@google.com>
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO mitigations
From: Sean Christopherson <seanjc@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 11, 2023, Nathan Chancellor wrote:
> On Fri, Aug 11, 2023 at 12:14:56PM +0200, Borislav Petkov wrote:
> > On Thu, Aug 10, 2023 at 09:14:14AM -0700, Nathan Chancellor wrote:
> > > Not sure how helpful that will be...
> > 
> > Yeah, not really. More wild guesses: if you uncomment the UNTRAIN_RET in
> > __svm_vcpu_run() on the host, does that have any effect? Diff below.
> 
> Unfortunately, that seems to make no difference...
> 
> I did have to switch to the Ryzen 3 box for testing, as I am not at home
> for a couple of days and I did not want to lose access to my workstation
> if I took a bad update since it has no remote management capabilities.
> Something I noticed in doing so is that the VM boot on that machine
> appears to get farther along than on my Threadripper 3990X, but I still
> see a hang with a stack trace similar to the one that I reported in the
> initial post with '-smp 2', so I think it is the same problem but
> perhaps the more cores the VM has, the more likely it is to appear
> totally hung? Might be a red herring but I figured I would mention it in
> case it is relevant.

Might be the flags bug that borks KVM's fastop() emulation.  If that fixes things,
my guess is that bringing APs out of WFS somehow triggers emulation.

https://lore.kernel.org/all/20230811155255.250835-1-seanjc@google.com
