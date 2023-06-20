Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC818AE9
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:32:45 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6237faa8677so34624866d6.1
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687293164; x=1689885164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sOBwXFmC0K7NYb6lxaOI7FbE7H576FmqzhPnZbh/RQ=;
        b=tOqRhJiJuYS/iM7yaX5kRR0RI5J4yS1E5ocSFLwJFozah6ojYGDYEC3KMjqrchEHWN
         V5olyJeF5sdAVGmyxtKzlPJwixv1c+gFrSleYLPVdQZtnWtBnPtfTroLHA1oHlfq6NDf
         W6illmXhd6rNa/PIUTfFh2BSrLJMD/dE4ysNwbZpOroJXz0BTpxFlvGYRjt3C+Cs4d8e
         h/9Qo+g/BCkG3gfjk50kDZi3H1Z6DIl++Vte2DrrQ80+9d2PI1Ka0jRiR54Gv/wlxsKr
         xoljDYaj9RSg+l5SiIJnchoyU6QRqVoFXyi9s7wEvojivfMFhjAf3kYVjlrLEwk3TUR0
         mmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293164; x=1689885164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sOBwXFmC0K7NYb6lxaOI7FbE7H576FmqzhPnZbh/RQ=;
        b=J4iMbobt4AxUdPjHNGEjOI6qZVeqwPTI40SjebW7YPD+Ayx7TTZXUXS628BCHk/4Sn
         quaIdBCSEn0+ST+UMAehd025OcCSxHY1k53vnkTb11c4yUEylfqmouc2KJchaNt3gVin
         /P3bUR+WVN7P5LMyB6wPr+/o755PnyzhNFt0/FZGZ1GTok9ZIE9b1ieCcl43AI4+n98l
         F9xHYcUf0bDyGqhkfDEgsxX4ITxRePjlgYC00Z2NLIuI91CfhplXpb6OOjr0NqBID5qI
         ISy4UjhTzVI6qA4YVF7RZfeEVF5tJ5LNWKFGlStH1fp7b9xLjwhi+23n1nyVFFdWGKlu
         s07Q==
X-Gm-Message-State: AC+VfDzBQMzAaYDtAy+fGUeIlqtgiVXc6BFA7mF0pvJOdFmciiH8pGDh
	LlcYy0q11IqML9HzL5xYEd35S1ciovEAV/jDDs1YZw==
X-Google-Smtp-Source: ACHHUZ6EhOw5QjdhJDMDyaak9jtIy0YjhsLT4zH/jrMO4dPXvi62mXQ76XWruSIP2mh7WnNIEl42KmnbfYo3WvG4pQQ=
X-Received: by 2002:a05:6214:e4f:b0:62d:fd45:4d6a with SMTP id
 o15-20020a0562140e4f00b0062dfd454d6amr16222761qvc.16.1687293164010; Tue, 20
 Jun 2023 13:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mhng-41a06775-95dc-4747-aaab-2c5c83fd6422@palmer-ri-x1c9>
 <mhng-57559277-afaa-4a85-a3ad-b9be6dba737f@palmer-ri-x1c9>
 <CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com> <20230620-gibberish-unblended-f4b50c7fe369@spud>
In-Reply-To: <20230620-gibberish-unblended-f4b50c7fe369@spud>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Jun 2023 16:32:32 -0400
Message-ID: <CAKwvOdn_U+yjFBn6pq5XwP1rTEKA1MWBkd0f2N8wB_nuS1_sWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org, llvm@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Fangrui Song <maskray@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 4:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jun 20, 2023 at 04:05:55PM -0400, Nick Desaulniers wrote:
> > On Mon, Jun 19, 2023 at 6:06=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.=
com> wrote:
> > > On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
> > > > On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
> > > >> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
> > > >>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrot=
e:
>
> > > >> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
> > > >> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
> > > >> series is based on 6.4-rc2.
> > > >
> > > > Thanks.
> > >
> > > Sorry to be so slow here, but I think this is causing LLD to hang on
> > > allmodconfig.  I'm still getting to the bottom of it, there's a few
> > > other things I have in flight still.
> >
> > Confirmed with v3 on mainline (linux-next is pretty red at the moment).
> > https://lore.kernel.org/linux-riscv/20230517082936.37563-1-falcon@tinyl=
ab.org/
>
> Just FYI Nick, there's been some concurrent work here from different
> people working on the same thing & the v3 you linked (from Zhangjin) was
> superseded by this v2 (from Jisheng).

Ah! I've been testing the deprecated patch set, sorry I just looked on
lore for "dead code" on riscv-linux and grabbed the first thread,
without noticing the difference in authors or new version numbers for
distinct series. ok, nevermind my noise.  I'll follow up with the
correct patch set, sorry!

>
> Cheers,
> Conor.



--=20
Thanks,
~Nick Desaulniers
