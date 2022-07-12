Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEF23A9
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 04:40:47 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id oy13so7373325ejb.1
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 21:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9bwM//cvZFymb4WUWDusQzRbwBn9nlsjCD79TISVsJ0=;
        b=BlHWfQPRFKfJ61g8T/P6TuGTmb0P9ffpqao3TOROw798XwkY9vxuZfu0lO+CKXaQiG
         d6+RYqD2XsbD4tuL0uSsjRjGTsOVyb8nctHQiTWhwqUBX423OELfHfILQR636DVDHBKI
         FnLOAeWO5pIZNRHRThYFWUrrbPXMzoxkPIKKo1eHYfV+tgBTTwSEDPyVtCRUmO/q+Yh2
         ae8PBjZEYvVwZ9GfqiKXfkkLvW4cNtsfm2kpb8tZvLXouY+zrZJKd7VQCSjs3BC36kQi
         atzjqc5CJBJpoiiK0II/s1WhGlID11Na/5QluR1+87qFM+BE/6cwmlpFJrQ9yaAvvRJe
         QYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9bwM//cvZFymb4WUWDusQzRbwBn9nlsjCD79TISVsJ0=;
        b=nP1qyeF2vAAbfHC6f69O0H75CqHpshHFxxBUotyc+ImyIkqDAn4/EodMpQCWTvm/af
         Bw+I9ROkZ8qatwxS1EPpTzS/ZHhybMCVICE5ThLj0BUWx6p9FNASXFj6c9r1zqx0pKD5
         Pv62yjKc0HBQN4rrmyzExQmsf8yVifHC3Mrc5AGPYuzWvmfCfL42VzJbkTbF3jLIWrRA
         NeZ/0kxCjJPl6oYAsMg9FAQsYyAXrPImyPU2W4i+k9l/+2qu8xavTXXZl6Q21m5pMwrC
         yKRxOdrFz2z+YjQtnoJauUmHN/5Q8emSHaYSgBqYp4N19orfx0oD5BSadCwLjpESgXz2
         7UyA==
X-Gm-Message-State: AJIora9mA0elQqQixR8n2LG/OwQJN3eSbh1udVYiYXoxayjqhKTVHG4N
	FQDlXrEKKBuo6yeK9mGP5O+ZedPAT73zGopQHpg=
X-Google-Smtp-Source: AGRyM1tPTIVzj650H/XE+ZZ8SPlMtwf7jTnRkEAvIGcGsDc4hAd7svZcAbESE0UtOfkT6dlwP4W6Oncm4IQIYJ2P9bw=
X-Received: by 2002:a17:906:5a6c:b0:72b:561a:3458 with SMTP id
 my44-20020a1709065a6c00b0072b561a3458mr8361763ejc.114.1657600845829; Mon, 11
 Jul 2022 21:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706172814.169274-1-james.hilliard1@gmail.com>
 <a0bddf0b-e8c4-46ce-b7c6-a22809af1677@fb.com> <CADvTj4ovwExtM-bWUpJELy-OqsT=J9stmqbAXto8ds2n+G8mfw@mail.gmail.com>
In-Reply-To: <CADvTj4ovwExtM-bWUpJELy-OqsT=J9stmqbAXto8ds2n+G8mfw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 11 Jul 2022 21:40:34 -0700
Message-ID: <CAEf4BzYwRyXG1zE5BK1ZXmxLh+ZPU0=yQhNhpqr0JmfNA30tdQ@mail.gmail.com>
Subject: Re: [PATCH v2] bpf/scripts: Generate GCC compatible helpers
To: James Hilliard <james.hilliard1@gmail.com>, Quentin Monnet <quentin@isovalent.com>
Cc: Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

CC Quentin as well

On Mon, Jul 11, 2022 at 5:11 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Mon, Jul 11, 2022 at 5:36 PM Yonghong Song <yhs@fb.com> wrote:
> >
> >
> >
> > On 7/6/22 10:28 AM, James Hilliard wrote:
> > > The current bpf_helper_defs.h helpers are llvm specific and don't work
> > > correctly with gcc.
> > >
> > > GCC appears to required kernel helper funcs to have the following
> > > attribute set: __attribute__((kernel_helper(NUM)))
> > >
> > > Generate gcc compatible headers based on the format in bpf-helpers.h.
> > >
> > > This adds conditional blocks for GCC while leaving clang codepaths
> > > unchanged, for example:
> > >       #if __GNUC__ && !__clang__
> > >       void *bpf_map_lookup_elem(void *map, const void *key) __attribute__((kernel_helper(1)));
> > >       #else
> > >       static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
> > >       #endif
> >
> > It does look like that gcc kernel_helper attribute is better than
> > '(void *) 1' style. The original clang uses '(void *) 1' style is
> > just for simplicity.
>
> Isn't the original style going to be needed for backwards compatibility with
> older clang versions for a while?

I'm curious, is there any added benefit to having this special
kernel_helper attribute vs what we did in Clang for a long time? Did
GCC do it just to be different and require workarounds like this or
there was some technical benefit to this?

This duplication of definitions with #if for each one looks really
awful, IMO. I'd rather have a macro invocation like below (or
something along those lines) for each helper:

BPF_HELPER_DEF(2, void *, bpf_map_update_elem, void *map, const void
*key, const void *value, __u64 flags);

And then define BPF_HELPER_DEF() once based on whether it's Clang or GCC.

>
> >
> > Do you mind to help implement similar attribute in clang so we
> > don't need "#if" here?
>
> That's well outside my area of expertise unfortunately.
>
> >
> > >
> > >       #if __GNUC__ && !__clang__
> > >       long bpf_map_update_elem(void *map, const void *key, const void *value, __u64 flags) __attribute__((kernel_helper(2)));
> > >       #else
> > >       static long (*bpf_map_update_elem)(void *map, const void *key, const void *value, __u64 flags) = (void *) 2;
> > >       #endif
> > >
> > > See:
> > > https://github.com/gcc-mirror/gcc/blob/releases/gcc-12.1.0/gcc/config/bpf/bpf-helpers.h#L24-L27
> > >
> > > This fixes the following build error:
> > > error: indirect call in function, which are not supported by eBPF
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > > Changes v1 -> v2:
> > >    - more details in commit log
> > > ---
> > >   scripts/bpf_doc.py | 43 ++++++++++++++++++++++++++-----------------
> > >   1 file changed, 26 insertions(+), 17 deletions(-)
> > >
> > [...]
