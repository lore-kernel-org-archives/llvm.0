Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C21C693
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 15:58:46 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4526f0bdf72so7359935137.1
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696262325; x=1696867125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/uBY1GHK5wM8Sw0r1xr8kkIVh7PpQ9+l557Rxtbl80=;
        b=hB3DymkiO9UG4FzKhSg/SRV0ie73XXUCDQRjBvPkgUBI7AHW4xYpSRABrB4O68EuLt
         n/83RNTYfS8kLcxfPdztip4+rbpKIHwUISxzqVw0js2oMOpOtuyPv/hoObp5/ZNsKeVW
         chd3b8scPhPOKk0oEvbT2rfcSmeeMc46Cm8gdp/BsP8Wi0LtrDgxWm7HdyaXqg5Nkn+y
         HrLSvkdaPuYp7iwCSIdpDEx6nmPx5Kp0FzUPj5A1ce4DNN2R1iMzG2904P1I+PX7opCM
         HRIoLTEQJrUYaPYfwNVkH8PJ4VdmXl7M2Sx9GNWCiFuodaDrQcPO4mYbCqI8VTmEJRyx
         wKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262325; x=1696867125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/uBY1GHK5wM8Sw0r1xr8kkIVh7PpQ9+l557Rxtbl80=;
        b=IEcWV6oPTe84PIdod4mRwzarVvJ+6ZJ5rsb/zk+eS1cFnegirzaucRizbDb6NA6mxt
         rMYPpBeWArZSDG66f9ZDjOy/fu/Ax0P5aIz+ozunYd5T9YKjzMkIBAi35Rs//tw5KUSr
         Gr996qSTV6iLZ1ICkMp/Hjo9+KccsJp7PO48TVGIpYjq/74MblFAMHonwKzuTiyWBc7i
         ua9GU8LPQgo41Nh9zdYu5JX70TBOJ5qsISkrfJtyxzzDCyWAvoNMCQ3fGJl/cxE/+XlC
         1aq7WBf/K5V+EWoAru6/uKkquNm/oXAEbpFTdm1GlPgeQfsH4EKHWWMUsjUIGl66fdzK
         y3lw==
X-Gm-Message-State: AOJu0Ywx0WWEMWTHSZyWQBaQnIdtToS44xvFRtY3AHNfTpHJky9car0p
	ttn3/cjMn3CqwLowtPtOvQETktVUDcB2+cTSfBFlPg==
X-Google-Smtp-Source: AGHT+IFW1CmNUWYkc6jWoQN9D8Ez4GQmg0IhD/dCqR+ig8ardwLgD7Q08r9vAe22Az/mJ0aZENlZbqM+iJIDMe5iWf8=
X-Received: by 2002:a05:6102:2db:b0:452:cfeb:160d with SMTP id
 h27-20020a05610202db00b00452cfeb160dmr10233920vsh.26.1696262325473; Mon, 02
 Oct 2023 08:58:45 -0700 (PDT)
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
 <CAKbZUD08W9_HB9F7tQqwreYvVapgVMOkS3QokzwHPcBnFnVMig@mail.gmail.com> <8d305ae1-4235-6ae8-7dfb-9f432fdfcd41@ghiti.fr>
In-Reply-To: <8d305ae1-4235-6ae8-7dfb-9f432fdfcd41@ghiti.fr>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 2 Oct 2023 08:58:07 -0700
Message-ID: <CABCJKucscLdmyD8zJ=aOJDT9zbChW3=ZMXPgudPqykfOemR+fA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Pedro Falcato <pedro.falcato@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2023 at 12:02=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> On 01/10/2023 17:19, Pedro Falcato wrote:
> > On Sun, Oct 1, 2023 at 2:51=E2=80=AFAM Kees Cook <keescook@chromium.org=
> wrote:
> >> On Sat, Sep 30, 2023 at 10:02:35AM +0100, Conor Dooley wrote:
> >>> On Fri, Sep 29, 2023 at 03:52:22PM -0700, Sami Tolvanen wrote:
> >>>> On Fri, Sep 29, 2023 at 2:54=E2=80=AFPM Kees Cook <keescook@chromium=
.org> wrote:
> >>>>> On Fri, Sep 29, 2023 at 09:11:58PM +0000, Sami Tolvanen wrote:
> >>>>>> ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
> >>>>>> potential bits of mmap randomness on the table if we end up enabli=
ng
> >>>>>> 4/5-level paging. Update mmap_rnd_bits_max to take the final addre=
ss
> >>>>>> space size into account. This increases mmap_rnd_bits_max from 24 =
to
> >>>>>> 33 with Sv48/57.
> >>>>>>
> >>>>>> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> >>>>> I like this. Is RISCV the only arch where the paging level can be c=
hosen
> >>>>> at boot time?
> >>>> I haven't seen this elsewhere, but I also haven't looked at all the
> >>>> other architectures that closely. arm64 does something interesting
> >>>> with ARM64_VA_BITS_52, but I think we can still handle that in
> >>>> Kconfig.
> >>> AFAIU, x86-64 can do this also:
> >>>
> >>>        no4lvl          [RISCV] Disable 4-level and 5-level paging mod=
es. Forces
> >>>                        kernel to use 3-level paging instead.
> >>>
> >>>        no5lvl          [X86-64,RISCV] Disable 5-level paging mode. Fo=
rces
> >>>                        kernel to use 4-level paging instead.
> >> Ah-ha! Okay, well, then let's track this idea:
> >> https://github.com/KSPP/linux/issues/346
> > (Replying here for visibility, tell me if you want to move this
> > discussion to github)
> >
> > AIUI, x86 cannot do this for compat reasons. Even if you enable LA57,
> > mmap only gives you < 48-bit addresses, for compatibility with things
> > like JITs, etc that stash information in the upper 16 bits. You need
> > to pass a > 48-bit mmap hint to get 57-bit addresses.
> >
> > I imagine riscv does not have this issue yet, due to little
> > accumulated cruft, but it may be wise to check against popular JITters
> > for these problems on riscv code.
> >
>
> We already encountered those issues and the same solution was recently
> merged (restrict to sv48 unless otherwise specified):
> https://lore.kernel.org/all/20230809232218.849726-1-charlie@rivosinc.com/

We recently ran into this issue when bringing up Android as well
because qemu defaults to Sv57 and some userspace bits weren't happy
with >48-bit mmap addresses.

Note that this patch uses MMAP_VA_BITS, which is 48 for both Sv48 and
Sv57, which is why mmap_rnd_bits_max will be 33 even with Sv57.

Sami
