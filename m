Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9BC2F34
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 18:57:19 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id o16so6125515ilq.8
        for <llvm@lists.linux.dev>; Fri, 20 May 2022 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=csQj3ib6KpNkN5bv9vkVD9s25tn2ay6dwGnp7G2PxZk=;
        b=McQ/3Ewl8k9H0HObINKOQBGKSdu2PuQDhmS/+DgjFXksHKDOD+EF7/hWFtAYEYGwjE
         o6p8Ju2y0k60bVIn2+lifX7h6Ppf1OHbTOL8l6Pp2CQxB1ZOCe0fnZkZNNmb+Rnegbl7
         /iSTpUNLNL2K+daGEmsME45/aMYXzmR0++y+fb/zoiu8Js8HAUwJvWWwNzrZuCIckdya
         VgfUE/1oMmePNPlcBMiMVXi2G8IFzJg3+LStawYcIICU+PjFJhYg8Iv7evbfJxxZuPk4
         s8dV3e+O27lz305dCxL0gIN5pzxVefmXtVlIkrPTO/s0IC1fLxMIRJooZlL/VEYY62mU
         TU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=csQj3ib6KpNkN5bv9vkVD9s25tn2ay6dwGnp7G2PxZk=;
        b=Rpx9PGAJEdR7CSVtU6WlN2h+FpnyZKZDe1HrkCEgWPb5pFdu4GdHIAu1Bpvx03f7Bi
         6ZCxMt3+SAYqOq/QrxrZPS9ocIAjYiMhyK3/IPZ4scf4Q6RgSB759ghE1C4dZPaWtdzZ
         mCINlNjluzndwcZsWzoROIPGIeo4gBWe14PE2ApJolwiQupn04kLJoSj6AO2wXO9s4f8
         1toVsVSS2J0csn/7cUTGQRck1QzTB/zBDSdZRTAOFTiZqNvNPQmxQ6lDHpAsaxx1A+dt
         zx683l3QzK6jEqSLhWSA55k/Z5rQpz7dHbsQiPhS+XNWvJ/8uERJaZ0iCiM8CJE7kRfM
         Tjrw==
X-Gm-Message-State: AOAM533TBX9EtoyiRK5qh9P/LWeKMrfvV0WYpAvYHERKvbhi9DXJl+zq
	5e1IxVF6X0StZXTZMjKn93DMwgEKRHnT79schl4=
X-Google-Smtp-Source: ABdhPJwdbucanBr6WHmHcempnoRguCOcI2wNpVRGvdYArTFBsypERitXgjSCUIowggIQNBVIuEVd+rVgBPUDdiAxipg=
X-Received: by 2002:a05:6e02:1c81:b0:2d1:3971:9343 with SMTP id
 w1-20020a056e021c8100b002d139719343mr6207735ill.237.1653073038368; Fri, 20
 May 2022 11:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net> <20220506160106.522341-5-mic@digikod.net>
 <CANiq72kbp3xTpj-L2BfLQ1Ecx-2Ki0W3e5YLERx8-T9bjb96=g@mail.gmail.com>
 <5be32ddf7688db38408466315a80e03e9af7ac40.camel@perches.com>
 <CANiq72=e9LMujmsk-mh8YHcGoKuLAnBttNz7JbiXH_2-hpvUvw@mail.gmail.com> <b49d037c38715c3fd82c07309e32aad70c97890b.camel@perches.com>
In-Reply-To: <b49d037c38715c3fd82c07309e32aad70c97890b.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 May 2022 20:57:05 +0200
Message-ID: <CANiq72=SLoKSUzbWV4r3jt31trEV2ooHH7r_pSDF_dkU4bc7fQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clang-format: Fix empty curly braces
To: Joe Perches <joe@perches.com>
Cc: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Brian Norris <briannorris@chromium.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, May 20, 2022 at 8:00 PM Joe Perches <joe@perches.com> wrote:
>
> As you wish.
>
> I think it's more that there's no "one true style" issue than anything.

Indeed, there are many instances of both. Not sure which one we should pick.

Maybe everything in a line is less annoying in more cases for people
that want to automate formatting (and `clang-format` will wrap it if
it goes over the column limit anyway, and then it will split it in
several lines, so it is OK).

Cheers,
Miguel
