Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E632F25
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 01:14:10 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id e79so23475358iof.13
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 17:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SuoLk/eB2LyIrK2WAJXGapA14pYbHY6NEIo8Ima2GSM=;
        b=X+Pob0+LvdGmN/GRaPCbi9J6/KBqHLvgbrEnAP4POO6efQUxRgvyfxDVeUjDSJk00/
         U5WNDqbIgqcWUkeNcKYDn6CKYfCS1NOTnPqEdz+socs5sKHZTSao2LydOwYfqXpdVe5q
         7w8Jz2XFzyYKnuHdmwZnIKkiLL094dHrqYklGpjiWnZxoQNlqRtHHIwTqeUt8dYkNkW5
         +8MzGjKVqvkeaABefP6V1ViIzowswND3fJJy3iq8ebvVePyiuUWfqqvZPtAfE70Q4sdI
         NBztqSgHqcGkd6tBihMOLqOgAyDi9HTxMz3AO7CD//0bC5rd09iFRUjzVOxAJnZHvGP1
         Gkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SuoLk/eB2LyIrK2WAJXGapA14pYbHY6NEIo8Ima2GSM=;
        b=ECFIrNnCGFnH0J3JXi00KHut81IKju2YGGm4IYee+ZmU/3cHiOyIXrswd6r1hMdHnW
         f5vIyuhlL1S0+t9sdiT+YUqq4aW5i9x5cyZue6OXQRN+B1njrLfdNiOAqUn7KDThakYS
         5ykZgVgUevx/yz3Uqu+0lqLHt+yZneLHhBX4WXbTWS/BEqirNhV3frpZjZd6KB8otrD1
         PTP6SbIh58ADbGorvrJIlQwDz2r+0FsqOhC6akFDpnYxGcNI7YJwY+Yyy5Q+GBkKrIW1
         BLgkhKfGY+PS+tZmygsGRU0yZsHtAYWLRv5YkLgpd6U3+69bLc4Gz1QmN/x0KrUuzWh9
         rJZw==
X-Gm-Message-State: AOAM531+vLFcbunIwl3YxWvhwT/2hxwCz24cYhexuoQgZe4LFWb904ro
	xKhj5pCPQoqE5b3wQsRskxGKOW8JzjgAonU51wA=
X-Google-Smtp-Source: ABdhPJzQOP2XQDSSMDsr4TM971ls6AQSgLTjolNI1RoC42eUw8X2ye05F4aKMvVYkQUavql4xy01L/RDlcI4bzaTAHQ=
X-Received: by 2002:a05:6638:382a:: with SMTP id i42mr13265444jav.256.1643764449909;
 Tue, 01 Feb 2022 17:14:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202003033.704951-1-keescook@chromium.org>
 <20220202003033.704951-2-keescook@chromium.org> <CANiq72n1d7ouKNi+pbsy7chsg0DfCXxez27qqtS9XE1n3m5=8Q@mail.gmail.com>
In-Reply-To: <CANiq72n1d7ouKNi+pbsy7chsg0DfCXxez27qqtS9XE1n3m5=8Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Feb 2022 02:13:58 +0100
Message-ID: <CANiq72=aDRzxV0DZ6PNFXL-Z=NBAmyaMwL=MNxaOEWVSo8PZ1Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] Compiler Attributes: Add Clang's __pass_object_size
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	George Burgess IV <gbiv@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-hardening@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 2, 2022 at 2:11 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> For `__diagnose_as_builtin__`, I only see it on Clang trunk, so I
> assume >= 14, thus could you please add:
>
>     * Optional: only supported since clang >= 14.

...and the other two too:

>     * Optional: not supported by gcc.
>     * Optional: not supported by icc.

Cheers,
Miguel
