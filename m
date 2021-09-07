Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAA72
	for <llvm@lists.linux.dev>; Tue,  7 Sep 2021 17:10:29 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id k4so4116508lfj.7
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H+GlpUmGC3s0m862BFnaEghUBDcmr0hsoDqEpHfudes=;
        b=ZrpTD11YcoTzlnxV9wbY07amfLrzROABaXwapPT/EEW1bkKcXuC/n8hMUS1To0EImi
         DPnKnhPDFJMiXLp6aEjyyVpW8E7s3FPi0evoO0M+tFEFfJy19SP9BS7fxujNluGVqvaR
         KofKwxkpnp3XGnzZgyHrIyRK5eh2/qXYrkUjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H+GlpUmGC3s0m862BFnaEghUBDcmr0hsoDqEpHfudes=;
        b=GVmZJyCXXcQRSWzZAZPdd+akvopAT2Vi/b3d+ByLbmb0s5jnZg6d0GXf8DZ2w7HWBX
         JxhvOntFy+iD+MVmQdsXugUSzf8hrSIq3WwnCOlzKNpkhWYopTH/YQ/jrqPceU6HBadk
         8aXXQdzNUF0Gq2JrpUL0bFy97IoRJBkpgE72K7wGUEnmrPDcO+plbq+sj3xlQEH4hk9+
         xIBX2LwKjpKp7TwKf+tKxMDTZGLV+I6i8IcfNGzUOY5vo8QMZhNCTg8hTjSSx9HD6diM
         6/WCPKtdnkQMU+zj0qHGmhE6WqP3VcvJ+UNBRnt8Ex/6YEvE3S90/CcyHfQ+6CZ09aU8
         +p/A==
X-Gm-Message-State: AOAM533+Qr6Xudadw/3ku3ftp7shHIHj8wEUCjRLQrpEM9kCtrah6P52
	DEbxqvxVhXJgHgNX5KqSejMrqXHCKlv06A88dko=
X-Google-Smtp-Source: ABdhPJx8CoH/bj84TFJQ6YNyexPWJG0iaGSRATRn4ibGy3Y5nbfQ7wMrfz5tb4uPMfVJM/57Jmk6cg==
X-Received: by 2002:a05:6512:139c:: with SMTP id p28mr12983074lfa.523.1631034627584;
        Tue, 07 Sep 2021 10:10:27 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id b7sm1053106lfv.275.2021.09.07.10.10.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 10:10:26 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id i28so17683296ljm.7
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 10:10:26 -0700 (PDT)
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr15231271ljp.494.1631034626531;
 Tue, 07 Sep 2021 10:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net> <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain> <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
In-Reply-To: <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Sep 2021 10:10:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgZkQ+eZ02TaCpAWo_ffiLMwA2tYNHyL+B1dQ4YB0qfmA@mail.gmail.com>
Message-ID: <CAHk-=wgZkQ+eZ02TaCpAWo_ffiLMwA2tYNHyL+B1dQ4YB0qfmA@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 2:11 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: error: stack frame size (1800) exceeds limit (1280) in function 'dcn_bw_calc_rq_dlg_ttu' [-Werror,-Wframe-larger-than]
> > x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1657:6: error: stack frame size (1336) exceeds limit (1280) in function 'dml21_rq_dlg_get_dlg_reg' [-Werror,-Wframe-larger-than]
> > x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1831:6: error: stack frame size (1352) exceeds limit (1280) in function 'dml30_rq_dlg_get_dlg_reg' [-Werror,-Wframe-larger-than]
> > x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1676:6: error: stack frame size (1336) exceeds limit (1280) in function 'dml31_rq_dlg_get_dlg_reg' [-Werror,-Wframe-larger-than]
> > x86_64-alpine.log:drivers/vhost/scsi.c:1831:12: error: stack frame size (1320) exceeds limit (1280) in function 'vhost_scsi_release' [-Werror,-Wframe-larger-than]
> >
> > Another instance where distros lower CONFIG_FRAME_WARN below the 2048
> > default. Again, none look particularly scary but should still probably
> > be dealt with.
>
> I would argue that they are still scary and should be addressed in the
> code, it's just that we don't see them on build bots that use the 2048 byte default.

No, they are scary for another reason entirely: clang is clearly doing
a *HORRIBLE* job with stack usage.

To take that dml30_rq_dlg_get_dlg_reg() function as an example: yes,
it has a few structures on the stack, but gcc allocates 512-720 bytes
of stack space depending on my config.

Not 1280 bytes.

So it's not even *close* to the 1024 byte limit with gcc, much less the 2kB one.

I don't know why clang basically decides to use almost double the
stack space. Maybe it's some other config option that does it, I tried
a fairly normal one and a "almost everythign enabled" one, and
couldn't get close to the reported stack frame size with gcc.

Just to try to make things as close as possible, I tried with the
exact same normal non-debug config (apart from obvious
compiler-dependent things), and picked that dml30_rq_dlg_get_dlg_reg()
function to look at (for no real reason other than that the stack
frame was biggest above.

Gcc did a 720-byte stack frame for that case. Not great, but whatever.

clang did a 1136-byte stack frame for the same thing.

Do I know why? No. I do note that that code is disgusting.

It's passing one of those structs around by value, for example. That's
a 72-byte structure that is copied on the stack due to stupid calling
conventions. Maybe clang generates a few extra temporaries for it as
part of the function call stack setup? Who knows..

                 Linus
