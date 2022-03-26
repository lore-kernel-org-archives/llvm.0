Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114523D61
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 19:30:17 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id g24so14245440lja.7
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FfLtMPKWOgtbixf5r664NcyfUg09ely2U/JmDYjA8BY=;
        b=F+3ZVjB7BCSCLcZtwiPvR46BWAJVWdiaN3i439/aLf4lD0vcChmXZbsSzeMY76YnAP
         RENdKWXQ/ux4mV+RSnrCv9PyYnLL2iFG+BKvgFzACMUl6/c2Z2wMhjk96WLCFrW6tOyb
         ViEQgfC6S4WqObuYEM6u9bBkGdgNiFF6lCkqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FfLtMPKWOgtbixf5r664NcyfUg09ely2U/JmDYjA8BY=;
        b=w6d/V4A5T03hahR7EOnAUSkJSQuANdjKEnzcvGt/WVHVCCp8YNzFxOpI4BGSj+jt6x
         eRRet1K3Qr01xFdkkpxQveW4r53qwKywdUnnugTXCq+uMHvIPgy8NAllI/FeprsCqE6A
         MZZLZwSVycakF5KihnFmv3g9ZDJjhoWvPZpSLPEyzRbSQwit3IiMIg5m86hCetJd0w7w
         m41mXI3MR7HcQwanQnZy7H3gadD1UXQzu2kvT8Z4uTXgFojNYi0RAlhtWTYSY9KzlZxo
         fgr429kli9iojg++L+axcDno8CLMjBeRNRbYa5V8DZ1WoNe6/RRG18iDVHjB8D0pSUe8
         YQOA==
X-Gm-Message-State: AOAM53246CnwR6YgP54EkFLHGkjSdEJRIbVCFyUMzzgZTRK8DHz+1tE8
	aQOQFY78d7jgIY8RKKJB+CJ6FiAra+viGwzcFew=
X-Google-Smtp-Source: ABdhPJyXApofqetjx1pX52GwNA0KwB25mptZUDBVl8K5R6CpaDde56Sxb59XatDQU9yhJVXZGm5vWg==
X-Received: by 2002:a2e:2f06:0:b0:249:8f0e:cbcd with SMTP id v6-20020a2e2f06000000b002498f0ecbcdmr13230942ljv.145.1648323015635;
        Sat, 26 Mar 2022 12:30:15 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id d25-20020a194f19000000b0044a2ad98dcasm1145973lfb.167.2022.03.26.12.30.14
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Mar 2022 12:30:14 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id h7so18571296lfl.2
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:30:14 -0700 (PDT)
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr12850936lfh.687.1648323013613; Sat, 26
 Mar 2022 12:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203251443.9BBADFD98@keescook>
In-Reply-To: <202203251443.9BBADFD98@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Mar 2022 12:29:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeGc-BjkDWTYkXzyQu-vf9EEujuT-6=U7Od0DvCUfb8w@mail.gmail.com>
Message-ID: <CAHk-=wjeGc-BjkDWTYkXzyQu-vf9EEujuT-6=U7Od0DvCUfb8w@mail.gmail.com>
Subject: Re: [GIT PULL] FORTIFY_SOURCE updates for v5.18-rc1
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, George Burgess IV <gbiv@google.com>, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 25, 2022 at 3:03 PM Kees Cook <keescook@chromium.org> wrote:
>
> It looks like all the dependent trees with related buffer fixes have been
> merged (I was waiting for the scsi tree to get pulled). This has been
> in -next for almost 2 development cycles, and I did overnight build
> testing merged against your tree under the following combinations,
> with no new warnings (there is one Clang 14+ specific issue in
> drivers/net/ethernet/huawei/hinic that we're still tracking down as a
> likely compiler regression[1]):

So how much of this is _completely_ compile-time?

Right now it looks to me like FORTIFY_SOURCE ends up doing two things

 - added runtime checking based on compile-time sizes

 - compile-time errors

How hard would it be to separate the two issues out?

Because if all the compiler issues and warnings have been sorted out,
it sounds to me like the compile-time side could/should be done
unconditionally if there are no runtime downsides.

Hmm?

                Linus
