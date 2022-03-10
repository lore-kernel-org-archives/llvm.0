Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7B18D
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 18:21:05 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q5so8922349ljb.11
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 10:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sD9b5dOEVi4YerwZzZEJrDOPFq1VY6jiSE0PCEyxRgg=;
        b=r7hummoukWQUHQwRHPveXhGWj5cTSwRVSJfVXewO0gZHzkDj9Y6MhYYGGcXvbqBAOW
         lM4E+5uFkjvbOkqFpb3xDmpYiosRUMQS8SoWt5IlgnIjJEWuQ2FueW6QpYPf1LEhh1yr
         1prCveLoZQchUSKibr8zHJHrIKKTppYmXOvyGy2g2gEoE/TQWvNa7Hp0VGFXIyApeSKN
         n16R5dEwFRbW/VFLG9N346VJTL0D9NCGtX0nuglXTJW8kN7A063SOx1YzP7uW0YXZ9mx
         DRn5tZnkIpNVmwb0F5D3lpC9UYOWRhlBtrPQk8hwE3DQFbPZrLlXn7xGATYWxjbXhIr7
         b5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sD9b5dOEVi4YerwZzZEJrDOPFq1VY6jiSE0PCEyxRgg=;
        b=JN9br60YjjrG6jqVIJ2IACv/XkyZSdq9JfBjgy7GAuCHnvPEUehgGhMiIX6ZbL2pG2
         JYJPwq3Mvm/wJZhWEbTNytngpsRthPSuos6MEikOFnedrEXUBbr1/dMmZ1gZGe5UE6GH
         iwQFPhJQcwMv54IwI0sL0Vu0O3zuW2rwIMgyhf4dCRzncP1EQ6eLQzKjwkcjTKDzr9df
         dtNqAP3Z7/rOXd9CrAP/FDOAoMlcd5kV3VQyCaGGGkQTrL7Or7ohpIl3R0iraWofWu+H
         9OFNzY++21gGguG/2cbdZtlP73M97kcwykYEczhyODWu2CaJ5Q/MApZrDueLgivHGNdO
         f2nA==
X-Gm-Message-State: AOAM530jTL8fsMaSs4bJ2vfsNaZy23istPvbRKNP8V7ZyXKk7X7LwqrK
	BsLIZj1Ea40BQHuGBf17049OPc6oopqHnR9LmrBAjA==
X-Google-Smtp-Source: ABdhPJyK+q8Dvy2o6fMAN7Y1PY4bwm6vcpQjlBaQAUeqmZ+J3aXZO1oD1PTsVbeZ1Aq60b8cZszt8uLh8uySv1qOcRU=
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id
 bn17-20020a05651c179100b0024394bdd94cmr3729199ljb.468.1646936463000; Thu, 10
 Mar 2022 10:21:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220309220939.392227-1-keescook@chromium.org> <3bb36a2d506a4b73aefec200d1edd40a@AcuMS.aculab.com>
In-Reply-To: <3bb36a2d506a4b73aefec200d1edd40a@AcuMS.aculab.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Mar 2022 10:20:51 -0800
Message-ID: <CAKwvOdkjsNhR8DNRCjEVLibHf0j1WS54m-CSEQpm070h3J7_4g@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Only use current_stack_pointer on GCC
To: David Laight <David.Laight@aculab.com>, Kees Cook <keescook@chromium.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nathan Chancellor <nathan@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Yanteng Si <siyanteng01@gmail.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 2:44 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Kees Cook
> > Sent: 09 March 2022 22:10
> >
> > Unfortunately, Clang did not have support for "sp" as a global register
> > definition, and was crashing after the addition of current_stack_pointer.
> > This has been fixed in Clang 15, but earlier Clang versions need to
>                                ^^ 14

Yeah, with that fixed:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Once clang-14 is the minimally supported version, we can go back to
removing the inline asm for everyone.


> > avoid this code, so add a versioned test and revert back to the
> > open-coded asm instances. Fixes Clang build error:
> >
> > fatal error: error in backend: Invalid register name global variable
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Thanks,
~Nick Desaulniers
