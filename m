Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB411FB35
	for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 23:13:12 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31ae6bf91a9so4914996f8f.2
        for <llvm@lists.linux.dev>; Wed, 23 Aug 2023 16:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692832390; x=1693437190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4pUSrxjDT+8MgP/8jIoWX3HytxOHfJ1GFCQYUkvAzc=;
        b=VgslsiAMKgWP55NZSP4T/bngxxbJZlk1iVLMNDCMhJZ5FhRKsMaDu7v4kdG/ytRahd
         DuH2Eeo/yNQc0ElHyXohIM76sqPQ054j84QcQ+7TOCsbXPW+80bPxu/hx9R2zvkNzNjG
         zQ1KIVbg7YU2AHDIr7B/90ZmUC8HEkjj7CADM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692832390; x=1693437190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4pUSrxjDT+8MgP/8jIoWX3HytxOHfJ1GFCQYUkvAzc=;
        b=P0MyBlfsvxGsivlq0N8HpDKRBNUETlMMC4x5juYA3fs2Aq+u2r6qBJwQgGKlnUPmoL
         JbWCJ70oSr/5GZGzOH7w61LDKq1PIm/Mk2JPpBBcqfTmalVS/wDeOulUypmdX3idMsSn
         XaqdbHeCoGO+W/EeAHo6dVBUG8Vqs3T0YG7dadCyBwfbW62RLVJbeYXzR86CkyV6wNkx
         kcdZTMBWelXxpgfeIcg6urBQGvhfIi+CKAh87pJxLzfxa0Bc0Ubiw84Wkr+Ww9bKxKCb
         52RZoKpaW0hTW9DCRE21BzzsrMqkGwIpDUvyoVWIXoysiwRt4nDvtlYl/Wj62Kx9pnaL
         VXrQ==
X-Gm-Message-State: AOJu0YzZEqHwuNi+TMJW+PCUk/79Bkb8xsLCWxi6aAMQBvAHj0cOQJ9r
	WEWZTeBmj2t6ujHz24IfEwtcSiBYlgZ1/491GFf2DA==
X-Google-Smtp-Source: AGHT+IFuDyFnHtP04kErHpgiACqv8D2N1u66DseGgw5ypbv7JmAQMrIEEv7UfapZTIe8/QAaDEOlZcunKdox/foqNkM=
X-Received: by 2002:a5d:6282:0:b0:31a:c6ef:5edc with SMTP id
 k2-20020a5d6282000000b0031ac6ef5edcmr9233956wru.12.1692832390226; Wed, 23 Aug
 2023 16:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822065256.163660-1-denik@chromium.org> <20230822174835.253469-1-denik@chromium.org>
 <CAFP8O3KunP9CzT_U2cj1_oysojTxCNJRWX_kvvu_wOx4tbYHug@mail.gmail.com> <CAK7LNASstNj2HEfJHcRzqt7hay65T-yEgzaAuXbEQPuCS+yC6w@mail.gmail.com>
In-Reply-To: <CAK7LNASstNj2HEfJHcRzqt7hay65T-yEgzaAuXbEQPuCS+yC6w@mail.gmail.com>
From: Denis Nikitin <denik@chromium.org>
Date: Wed, 23 Aug 2023 16:12:57 -0700
Message-ID: <CADDJ8CWdm+cWt4UBTae0sCQ8ZDWhbMuozqqq59R+EtvMHere0g@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Skip .llvm.call-graph-profile section check
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Fangrui Song <maskray@google.com>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 4:02=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Aug 23, 2023 at 3:00=E2=80=AFAM Fangrui Song <maskray@google.com>=
 wrote:
> >
> > On Tue, Aug 22, 2023 at 10:49=E2=80=AFAM Denis Nikitin <denik@chromium.=
org> wrote:
> > >
> > > .llvm.call-graph-profile section is added by clang when the kernel is
> > > built with profiles (e.g. -fprofile-sample-use=3D or -fprofile-use=3D=
).
> > >
> > > The section contains edge information derived from text sections,
> > > so .llvm.call-graph-profile itself doesn't need more analysis as
> > > the text sections have been analyzed.
> > >
> > > This change fixes the kernel build with clang and a sample profile
> > > which currently fails with:
> > >
> > > "FATAL: modpost: Please add code to calculate addend for this archite=
cture"
>
>
> Curious.
>
> This message is only displayed for REL.
>
> (Please not it is located in section_rel() function)
>
>
> I think modern architectures use RELA instead of REL.
> Which architecture are we talking about?

Aarch64. There was also a report on x86-64 but the error message could be
different there.

>
>
> What does the output of this command look like?
>
> $ llvm-readelf -S vmlinux.o | grep  .llvm.call-graph-profile
>
>
> Is it REL?
>

  [119] .llvm.call-graph-profile LLVM_CALL_GRAPH_PROFILE 0000000000000000
1c74a458 0104c8 08   E  0   0  1
  [120] .rel.llvm.call-graph-profile REL 0000000000000000 1c75a920 041320 1=
0
I 26090 119  8

Thanks,
Denis
