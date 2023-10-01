Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B9182B5
	for <llvm@lists.linux.dev>; Sun,  1 Oct 2023 15:19:59 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-499e2dd41ccso5564104e0c.1
        for <llvm@lists.linux.dev>; Sun, 01 Oct 2023 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696173599; x=1696778399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlqqAdUK9+XiZ3vr9zfHOEKY61BQKj01sr184YRw5U0=;
        b=B9rD6aMubpPCbxIHulcql8uXvYQmSyg1uLtprC67aVQZgWoLqU32fBPCA3Qjt/EKpf
         NkV6gNlM8E27a1NSOFaV4u4yKQEzoyZ+E+LhSugf8t8nqyFUbgPS9Bg1i8yT2NbUzTxH
         AH34HgNFKGzYbxpw3+5/m4SDtDYfLu3GUuMFza4yNttd3DsRs6NQWxhk5zr3QwOoFv0u
         SbSITlgpdAoXw3p74HQNqNbez5oL9U4RGMwpXwE0Fd7PORW3nUV+arpQft9hApcR8WQA
         zdTDbmTPK7AIK3/tIR6N35pd9FnPDshCq7JnuhC87pyOV+qPrQSnMWTFImoqTxA6xyfu
         qfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696173599; x=1696778399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlqqAdUK9+XiZ3vr9zfHOEKY61BQKj01sr184YRw5U0=;
        b=rgYfDloW6nQJWbZnJSspO09PaK/PmF3uMK8seBw9kFZeK1WmKyDP4E4s/HDlW6Z/xl
         ZClwg6VRubA/1ulEfpY34yho1egrFxaFodHKgltZUaxLp34VYYEfYjdLenNUynE9R0Gm
         sz4zm24vODIfEdT2fe33d2aJ1qB3HVb/XMj60bp/AvmI04ZgWSTwpHZu0mqoMM6jo5rk
         U9lFgErDRsBgpMhg8UXA9vDW6OX7s/DtxbvJ49vnCStD4kfqrq643/5S2lpNzmz8ANs1
         XsfwHU9ejf5GRPq1xvRchxtqoeaPCAQdbakJ50bBpIxCHhtFU2x+HtHfuNQQs3pJjsFq
         nEDQ==
X-Gm-Message-State: AOJu0YzHVKZZ3w27ZEqw4Ay0tJe+1F52l6bDzDymZ6ccT9edvzi5Q9mv
	iKzNv81c3Jc8uUP5W5/A+0Ol3Whz8XlqdAb/xh4=
X-Google-Smtp-Source: AGHT+IE4j3gWxMSOq6OvgLxoyzhdOUwDwvHxGddLU/JkAl6FbHrfp+/DN0/951hZIUWzbtcBLYlLKbL/bWmW7iCfKG8=
X-Received: by 2002:a1f:c5c7:0:b0:49a:6dc0:5a89 with SMTP id
 v190-20020a1fc5c7000000b0049a6dc05a89mr6121125vkf.5.1696173598711; Sun, 01
 Oct 2023 08:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com> <202309291452.66ED9B4D83@keescook>
 <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
 <20230930-emporium-share-2bbdf7074e54@spud> <202309301400.4E1AD87@keescook>
In-Reply-To: <202309301400.4E1AD87@keescook>
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Sun, 1 Oct 2023 16:19:47 +0100
Message-ID: <CAKbZUD08W9_HB9F7tQqwreYvVapgVMOkS3QokzwHPcBnFnVMig@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
To: Kees Cook <keescook@chromium.org>
Cc: Conor Dooley <conor@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 1, 2023 at 2:51=E2=80=AFAM Kees Cook <keescook@chromium.org> wr=
ote:
>
> On Sat, Sep 30, 2023 at 10:02:35AM +0100, Conor Dooley wrote:
> > On Fri, Sep 29, 2023 at 03:52:22PM -0700, Sami Tolvanen wrote:
> > > On Fri, Sep 29, 2023 at 2:54=E2=80=AFPM Kees Cook <keescook@chromium.=
org> wrote:
> > > >
> > > > On Fri, Sep 29, 2023 at 09:11:58PM +0000, Sami Tolvanen wrote:
> > > > > ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
> > > > > potential bits of mmap randomness on the table if we end up enabl=
ing
> > > > > 4/5-level paging. Update mmap_rnd_bits_max to take the final addr=
ess
> > > > > space size into account. This increases mmap_rnd_bits_max from 24=
 to
> > > > > 33 with Sv48/57.
> > > > >
> > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > >
> > > > I like this. Is RISCV the only arch where the paging level can be c=
hosen
> > > > at boot time?
> > >
> > > I haven't seen this elsewhere, but I also haven't looked at all the
> > > other architectures that closely. arm64 does something interesting
> > > with ARM64_VA_BITS_52, but I think we can still handle that in
> > > Kconfig.
> >
> > AFAIU, x86-64 can do this also:
> >
> >       no4lvl          [RISCV] Disable 4-level and 5-level paging modes.=
 Forces
> >                       kernel to use 3-level paging instead.
> >
> >       no5lvl          [X86-64,RISCV] Disable 5-level paging mode. Force=
s
> >                       kernel to use 4-level paging instead.
>
> Ah-ha! Okay, well, then let's track this idea:
> https://github.com/KSPP/linux/issues/346

(Replying here for visibility, tell me if you want to move this
discussion to github)

AIUI, x86 cannot do this for compat reasons. Even if you enable LA57,
mmap only gives you < 48-bit addresses, for compatibility with things
like JITs, etc that stash information in the upper 16 bits. You need
to pass a > 48-bit mmap hint to get 57-bit addresses.

I imagine riscv does not have this issue yet, due to little
accumulated cruft, but it may be wise to check against popular JITters
for these problems on riscv code.

--=20
Pedro
