Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A017D2
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 01:35:23 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id a89so21246377edf.5
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 18:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=7AXow+QOisFMgzkGzUsU2b4xZ97chTqjQ2G4q81Qm1A=;
        b=YZmiCzheKgtbe31ojEIZRAQvzN7H0JMtocEUUEp7GsbaO6reOoFP+mxgzFDrbmBujg
         uIZrpf/w/auuzr/XFATJ305pt4IDx7blT4oXAqZo/ti31fGZG1xY+349bfkEEFFsSdzc
         nL7VznmKNEWnwYY5fPZTJ06phMH5V1puUgFFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7AXow+QOisFMgzkGzUsU2b4xZ97chTqjQ2G4q81Qm1A=;
        b=cMxmMuHYHm8XBkUOMhofH4vf83hYv5IWyw03ZGXs0UUquXX8knVsdLBcsM+QzYVh5W
         h68YUe/gthxVSt7KgJJN5BcBrcyCEw/eg/iuHoDh9+llCcY08XtMa3mwCnz7A9jPEZg6
         e5GYTVs/ZN8gUQz2grLumPP22ePyJSlQaDBloTJRKyYqSet1yzEjIQuqgf+b6duIA/Ev
         RVoPn3MUCq8/VoDWK6J3V9tkQVuHOGH9tb9hx2tIELhRgOEBZiJ2+cAQSUX1VFWLvXZF
         aTQHDNhkEkAqcZbfocNBhW8htwdexq9iEB8Go25oiW7AnWRYQfBJRctsEkh7xse9QAmI
         pWgg==
X-Gm-Message-State: ACgBeo0kGZkh67AMK5niRuRM8Fc2twpQK0nAOM8235igd1BqHz98GtBL
	6iLzYo4+Wcpuiox5X1p4KEfvG39k2QELtoMy
X-Google-Smtp-Source: AA6agR4aGlT75rSNBI4FZSqupdoH7QKpxn1AVxNM+aq+ZZCLuaqy3IOnrQBmUAIQLgZQe1FiZVRtew==
X-Received: by 2002:a17:907:da0:b0:730:d0ba:7b13 with SMTP id go32-20020a1709070da000b00730d0ba7b13mr23134158ejc.332.1660181710661;
        Wed, 10 Aug 2022 18:35:10 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0072f0a9a8e6dsm2864774ejc.194.2022.08.10.18.35.08
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 18:35:09 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso196383wmc.0
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 18:35:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:3a3:3ef3:c8d1 with SMTP id
 g16-20020a05600c4ed000b003a33ef3c8d1mr4001467wmq.154.1660181708418; Wed, 10
 Aug 2022 18:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809013653.xtmeekefwkbo46vk@google.com> <20220810222442.2296651-1-ndesaulniers@google.com>
 <20220810222442.2296651-3-ndesaulniers@google.com>
In-Reply-To: <20220810222442.2296651-3-ndesaulniers@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Aug 2022 18:34:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhCF2ivkqAWwY3v7bHd2cT6fiJf1xnRDKzdfUqHbdhuQ@mail.gmail.com>
Message-ID: <CAHk-=wjhCF2ivkqAWwY3v7bHd2cT6fiJf1xnRDKzdfUqHbdhuQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] link with -z noexecstack --no-warn-rwx-segments
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Fangrui Song <maskray@google.com>, 
	Nick Clifton <nickc@redhat.com>, axboe@kernel.dk, brijesh.singh@amd.com, hpa@zytor.com, 
	kirill.shutemov@linux.intel.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, michael.roth@amd.com, n.schier@avm.de, 
	nathan@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com, 
	trix@redhat.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 3:25 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Broken up into 2 patches; one for the top level vmlinux, one x86
> specific since a few places in the x86 build reset KBUILD_LDFLAGS.

I've applied these to my tree directly, since I was doing the "fix up
the i386 crypto build error with gcc-12.1" work anyway, and this was
kind of in the same vein.

I want to put the "random tool versions cause build problems" issues
behind us before doing the rc1 thing this weekend.

Those were the two issues on my radar - I'm assuming there are others,
but I can't think of any right now.

                Linus
