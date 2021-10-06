Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D02C86
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 16:18:50 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id h2so6579491ybi.13
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0xSr56/FvBezCYYGx3+o4d+Zu6KknfVugxQiabr0PAg=;
        b=ROWUzPTJH5eoyrWzGpzD7/tmiI6BjNNDx+jUOWos5LDC0tL8up07naBJtCsz5ivk0X
         F8L/uHQwWrQuDaHUiSDKs/bwW8f8ZQm5K/ZNN40lum6ukHkm7KrgCijjRJEP4BLRvwqW
         aMbTXrFtVzgqAlRBpb0RDUfsVFPBbs1LsAKU3nbnnSX+3qp+eE+svWeq0pGbjbu/Opxd
         F57y7R1W/xzLvElYGKLUSG2v6MvaJvmsHN/qcWfRi/0oirWSiWe+AMqMe2HsyB8+myh2
         5Ru4r4fKWVyhq1YT+uaJVAjrbfvJbkMfILqXuywBdk/I1rmUEFHauNLPCzFBpCgNPWRJ
         TGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0xSr56/FvBezCYYGx3+o4d+Zu6KknfVugxQiabr0PAg=;
        b=k8XuY8eWcFjpv62R5IEuGU8SurmIavLB87R6kt1JgYRFH0Sl3P9MkpBw49BC6nVCYK
         2QRfssaCpE8QJn+wCeV2KTcs3xIOj32xCWKgI4FID5R9Wp5aVSc0BNpPlnJZ0PFbRuPZ
         8GtMIuVlISdCGCAPJXJFrfenuYZZPxZNWiencuoemuTAoNbqjKcP/AyJ8rAbK9omMOiv
         JnTJKG9dTwhVcrA9U7r3GS0ms9SYrJXmKmVKnHwTKdpBSjr7eBU2XpTfYqmYTgH0KtkW
         riQR7JUbqFxc36Cc8cbaGzqFJHfbmk0dD4wXC3Aiqfse2c092BHtT3lb/DxOKsmKGAn1
         /4lQ==
X-Gm-Message-State: AOAM531vnNxkdjQG0DsY6mRR7tXLtFvhyff0CAz0CsxFpfZRMq43eGrs
	GWDTb+IOE9l+CHwbrFkYDeKN/4RhcBrhVom+FCyB6g==
X-Google-Smtp-Source: ABdhPJwemM49g4lurr2EVbGRS4V8hk9Z0Hc4uossGIWkyIbYn2O+YuiWfVtEhLR9ekPnQWZPIVa+q1GjhT3duHORo6s=
X-Received: by 2002:a25:1c45:: with SMTP id c66mr31679935ybc.133.1633537129410;
 Wed, 06 Oct 2021 09:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-2-samitolvanen@google.com> <20211006033626.hfjke5jrvvzxhc67@treble>
In-Reply-To: <20211006033626.hfjke5jrvvzxhc67@treble>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 6 Oct 2021 09:18:38 -0700
Message-ID: <CABCJKufSX7yoZ5qcDjQcsg4P=soP+q9Yrf2Qiaa2JHdsn=s8_w@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] objtool: Add CONFIG_CFI_CLANG support
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 8:36 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Sep 30, 2021 at 11:05:17AM -0700, Sami Tolvanen wrote:
> > With CONFIG_CFI_CLANG, the compiler replaces function references with
> > references to the CFI jump table, which confuses objtool. This change,
> > based on Josh's initial patch [1], goes through the list of relocations
> > and replaces jump table symbols with the actual function symbols.
> >
> > [1] https://lore.kernel.org/r/d743f4b36e120c06506567a9f87a062ae03da47f.1611263462.git.jpoimboe@redhat.com/
>
> I found the original patch description to be much more useful than this
> one ;-)

Sure, I'll just copy that for the next version.

Sami
