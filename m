Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1033E3FE0
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 22:49:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u6so14597028lfm.10
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 14:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ga12vASgQepzopTf7itk5qo6jciiWvEYo54yaueBv/k=;
        b=ocuHiLSMSPTflZxrNNESvCIQ9i+7KDA5CgbR62QaQKXXDLgjYsHYlv8V7w7m89YSBv
         uqDFU8pu0wkTuGojbwMOm4xC4j81ouCZqMQUv4ylul1TzqWYa5Ej6sz/dpO4Xx6Tk5av
         UXItrbB9Ml1gsjXRDAWJ85uAnmftgLgl+I/3ZPdhD7ISL1Rx/oofWx6I5gZvy0O+ebnd
         CCtov4e6Wjt3VZbONDqtD2zgyJK7ekvkOfRukUUMmiEIf1WPwG/vQtQg51YleVk2+yru
         vtbMsL+rLA3DMH7e2gqooF1lNdWj9PV5SMlT604dQ55IYytTAWSziScWu9bvSVp9McF6
         OPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ga12vASgQepzopTf7itk5qo6jciiWvEYo54yaueBv/k=;
        b=hC/ln/WHi+PD2m61qR5JWpBnuWn7OGwcw5AR6S2ZGdxGo8tpjtaY+p/2wGk6sJheVV
         GhReRjmk5lUy7uKzpoVZJOxYj/3dPQz0zGYj3L8PLos7rwJBj6Kvr052aLDPs47zXscm
         xulRArwVlPC5MdLyaeTfF4OJUq/vSsMikzkeDJkPCD5Awu+5g343/hyY1v1510KqG045
         ckThG/hzvcY+fm73LooPTZ4XdE0zRkW5s5oZ0tgw1cCjS6w4YFe81oRl6oe+NZP2Vsl0
         xVXjH7B21orU44hsESpxWt0QIBUGMqNHKqNIeQK/bBHkre5JuHAQ1iJgF6VzVTCO6EKl
         4vLw==
X-Gm-Message-State: AOAM530Vr01q4b3wZAx5+9Isgqycvaf5BAxQcDeCb3KbjZAsdSjLyshi
	6NyRYA9lqwEn0t2c6dmXN2Sv2rcNRV0XDTGj5zManw==
X-Google-Smtp-Source: ABdhPJzaJFI+R0ILoPy/Efjd+HHvfSdGQyGuwezXUpAsCFmnl8paU8d50L8ZlP2AF/lXoKPXGH4nExxQp3vxfXwFFHg=
X-Received: by 2002:a05:6512:3ba5:: with SMTP id g37mr7601124lfv.651.1643410166929;
 Fri, 28 Jan 2022 14:49:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220112224342.958358-1-quic_eberman@quicinc.com>
 <20220128220841.3222637-1-quic_eberman@quicinc.com> <20220128224528.f7ejzw55t6kfefmm@google.com>
In-Reply-To: <20220128224528.f7ejzw55t6kfefmm@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Jan 2022 14:49:15 -0800
Message-ID: <CAKwvOd=Ab+GWNzSC6eaDWTVDF6gJQ9fDDMT3hep-DzhrEA6DpQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add environment variables for userprogs flags
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nathan Chancellor <nathan@kernel.org>, Matthias Maennich <maennich@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"

 On Fri, Jan 28, 2022 at 2:45 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2022-01-28, Elliot Berman wrote:
> >Allow additional arguments be passed to userprogs compilation.
> >Reproducible clang builds need to provide a sysroot and gcc path to
> >ensure same toolchain is used across hosts. KCFLAGS is not currently
> >used for any user programs compilation, so add new USERCFLAGS and
> >USERLDFLAGS which serves similar purpose as HOSTCFLAGS/HOSTLDFLAGS.
> >
> >Specifically, I'm trying to force CC_CAN_LINK to consistently fail in
> >an environment where a user sysroot is not specifically available.
> >Currently, Clang might automatically detect GCC installation on hosts
> >which have it installed to a default location in /. With addition of
> >these environment variables, you can specify flags such as:
> >
> >$ make USERCFLAGS=--sysroot=/dev/null USERLDFLAGS=-Wl,--sysroot=/dev/null
> >
> >to force sysroot detection to fail.
>
> -Wl,--sysroot=/dev/null => --sysroot
>
> As I mentioned in
> https://lore.kernel.org/all/20220128031549.w5a4bilxbkppagfu@google.com/
> -Wl,--sysroot=/dev/null does not suppress search paths like -L/lib .

In that case, Elliot, can you please test whether USERLDFLAGS is
necessary to be specified AT ALL? Maybe we can drop that addition from
this patch if so?
-- 
Thanks,
~Nick Desaulniers
