Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A7F7E
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 23:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71826C433CC
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 23:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692918590;
	bh=fmdvjJo51ptpcFBW0qo/P9qKamomf3sUs1QBCoMgQAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qF0VbNUbGKNWcb52cUIHL05J55URdvkSIVLhSLA5HrPF2x6f/Qi3PJgcP7sQxkr+Z
	 Hi7N2gIjDw6c9mgTNnLdvD4/4M4iRqVUylx07t8j9mKztzyF/eBHdk2EWqDm3Fo8nk
	 10xFu6C3TRjlC40l62bZze9QWoTKKnqHJ91vJiT4KjzeX37NzfLNkWzDakf0muq/Sq
	 efkANKbcheYsJHYTbsL21exhqnq5Gcf/CnZPsICC12RqPPz3gaWIytLPAJoSu3w/xi
	 84zKXA8/wofgMu26Zq9/8VkjXPtp/84NgdeaE4UXc8JJZcMItJDAW3iMG1ITSTe4Cv
	 WAOlvq43kGYwQ==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bd77864e05so276737a34.3
        for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 16:09:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YxAoMcS5iU0jthXEiOMNz1WAThk1aZIFAjIHgvpFQn7HgZ3Fb7Q
	q3xco5MN578UdV7nQsBAfqutrc69KulSPfoMGbo=
X-Google-Smtp-Source: AGHT+IF01rsk/k0kGF+JPH8O4cteVdEzL0/ml/32H03hmCml3/1c77g7ObqtPF/Tz7USy+W17f7aFHa0DXpJBKCMsBE=
X-Received: by 2002:a05:6870:1695:b0:1bb:c50d:7451 with SMTP id
 j21-20020a056870169500b001bbc50d7451mr1349740oae.46.1692918589601; Thu, 24
 Aug 2023 16:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230822174835.253469-1-denik@chromium.org>
 <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com>
 <CAK7LNASstNj2HEfJHcRzqt7hay65T-yEgzaAuXbEQPuCS+yC6w@mail.gmail.com>
 <CADDJ8CWdm+cWt4UBTae0sCQ8ZDWhbMuozqqq59R+EtvMHere0g@mail.gmail.com> <CAFP8O3+3++awDi9uZueFC_xi+KAud0Ds3k3vdd_ruVngOEOKiw@mail.gmail.com>
In-Reply-To: <CAFP8O3+3++awDi9uZueFC_xi+KAud0Ds3k3vdd_ruVngOEOKiw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 25 Aug 2023 08:09:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQcUkr8Phtj_cv6vD-QUvjO+7LEsQ5Tx+AuPAB1rbTU9w@mail.gmail.com>
Message-ID: <CAK7LNAQcUkr8Phtj_cv6vD-QUvjO+7LEsQ5Tx+AuPAB1rbTU9w@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
To: Fangrui Song <maskray@google.com>
Cc: Denis Nikitin <denik@chromium.org>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 2:30=E2=80=AFAM Fangrui Song <maskray@google.com> w=
rote:
>
> On Wed, Aug 23, 2023 at 4:13=E2=80=AFPM Denis Nikitin <denik@chromium.org=
> wrote:
> >
> > On Wed, Aug 23, 2023 at 4:02=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Wed, Aug 23, 2023 at 3:00=E2=80=AFAM Fangrui Song <maskray@google.=
com> wrote:
> > > >
> > > > On Tue, Aug 22, 2023 at 10:49=E2=80=AFAM Denis Nikitin <denik@chrom=
ium.org> wrote:
> > > > >
> > > > > .llvm.call-graph-profile section is added by clang when the kerne=
l is
> > > > > built with profiles (e.g. -fprofile-sample-use=3D or -fprofile-us=
e=3D).
> > > > >
> > > > > The section contains edge information derived from text sections,
> > > > > so .llvm.call-graph-profile itself doesn't need more analysis as
> > > > > the text sections have been analyzed.
> > > > >
> > > > > This change fixes the kernel build with clang and a sample profil=
e
> > > > > which currently fails with:
> > > > >
> > > > > "FATAL: modpost: Please add code to calculate addend for this arc=
hitecture"
> > >
> > >
> > > Curious.
> > >
> > > This message is only displayed for REL.
> > >
> > > (Please not it is located in section_rel() function)
> > >
> > >
> > > I think modern architectures use RELA instead of REL.
> > > Which architecture are we talking about?
> >
> > Aarch64. There was also a report on x86-64 but the error message could =
be
> > different there.
>
> Regarding REL:
>
> The original format of .llvm.call-graph-profile
> (SHT_LLVM_CALL_GRAPH_PROFILE=3D0x6fff4c02) used symbol indices without
> relocations and could be corrupted by symbol table change.
> https://github.com/llvm/llvm-project/commit/a224c5199b327ed0efcdcd87b6dbf=
950cf4d9ee1
> (2021) changed the format to represent call edge information with
> R_*_NONE and changed SHT_LLVM_CALL_GRAPH_PROFILE to 0x6fff4c09.
>
> We don't use the addend field of R_*_NONE relocations, so I proposed
> that we use REL for all targets.
> My https://github.com/llvm/llvm-project/commit/ca3bdb57fa1ac98b711a735de0=
48c12b5fdd8086
> selected REL for .llvm.call-graph-profile
>
> aaelf64 says:
>
> > A binary file may use ``REL`` or ``RELA`` relocations or a mixture of t=
he two (but multiple relocations of the same place must use only one type).
>
> Other psABI documents may be more vague on how REL is used, but as
> long as the tool that needs to process it (currently just lld and
> readelf like tools) supports it, it's fine.
> binutils seems to support REL for all ELF targets, even if its
> objcopy/strip may unintentionally convert REL to RELA. lld can consume
> RELA SHT_LLVM_CALL_GRAPH_PROFILE.
>
> > >
> > >
> > > What does the output of this command look like?
> > >
> > > $ llvm-readelf -S vmlinux.o | grep  .llvm.call-graph-profile
> > >
> > >
> > > Is it REL?
> > >
> >
> >   [119] .llvm.call-graph-profile LLVM_CALL_GRAPH_PROFILE 00000000000000=
00
> > 1c74a458 0104c8 08   E  0   0  1
> >   [120] .rel.llvm.call-graph-profile REL 0000000000000000 1c75a920 0413=
20 10
> > I 26090 119  8
> >
> > Thanks,
> > Denis



Thanks, Fangrui.


I'd like the commit log to record the use of REL for
.llvm.call-graph-profile is intentional.


Denis, could you add some more comments?



--=20
Best Regards
Masahiro Yamada
