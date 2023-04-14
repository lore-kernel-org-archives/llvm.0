Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA87C
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 04:56:14 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id j17so33039018ejs.5
        for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 21:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681448172; x=1684040172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOahN4QlawcFehI7bLkgrg/iclvzg8ErEBM3r/6qSpk=;
        b=CrORqfpgEv8CcZlXgF/ZZDgOnffuc+L7LYhC7/5nNBokxAsYwWGd2SiMnIDh06t/yn
         G0ISeD9fIQso5ekz4J1JfFRORTNa6aEcTAl2cgvewdhKtfiONANh7mAFaNXOFwi8mZCM
         Mjz4Rz/lbBn3jW1jecVUvMmuvet8mZChBaqe8tfA8p9geD0b2y61pVpH5dXgoVggy3q7
         ecqW2ZO20JUowb8SaK5Et45JXOFKvaHBy760qPV7syOJzTiYT4T6SWFy6XRiThAV0vmD
         XyUy2cc1Z/uaKnivvTjK6cl5plFMrhqrGsoJXhZjOjIewP5xIjppd50z0w2IlgCIqiv0
         8N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681448172; x=1684040172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOahN4QlawcFehI7bLkgrg/iclvzg8ErEBM3r/6qSpk=;
        b=NuBnc9PpBX1AHpRshJrff7aZ0sN6SNXBM8DsOrkLpnJsZWvRSbMevzktv96WqOcpdF
         f39oRlXB0xtdpk17a9MNG4v8kMpBNZ4mNL9jXBvI/duPYYM5/Ha0XEelAygvOhab0Oij
         pBCCgDY0q4AEUvuza+e5vezmBrUpfRPavt8adHiuFU5QxvYjgAqqAPujKokhyH4CtKFF
         EznCNuPauVXhr+uis/Qg9PCeG0uzztjhb0b+/uBrOGJ/f7fucp/+bt8xNZQ05UC3bDnx
         6WqMZvXkXFj47Uxn4mZ2HX3+tdbv/rxI1pwMpLErGnZKAcN4zG7Dq3rNl4MmgKYt/LgQ
         CT9w==
X-Gm-Message-State: AAQBX9d5IjHn5GW49QGR9nwYiOuV5ruOXo4NnnI63GxQOG4QyrsS+qtE
	MnmG3tFuK/f0IO8vfHlepwJ6rfRosssnfk7UbF4=
X-Google-Smtp-Source: AKy350YveSCh9e1itePQiC1fiBDMPTPosSx9uzFJv5U8GqasjFL8eDOOPHlNN4hQfkj2UU2eQ6eYskxDGzTh/tVAEsU=
X-Received: by 2002:a17:907:968c:b0:94a:87d6:d39a with SMTP id
 hd12-20020a170907968c00b0094a87d6d39amr2519987ejc.3.1681448171913; Thu, 13
 Apr 2023 21:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230412095912.188453-1-andrea.righi@canonical.com>
In-Reply-To: <20230412095912.188453-1-andrea.righi@canonical.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 13 Apr 2023 21:56:00 -0700
Message-ID: <CAADnVQJ00Npkp=+XYaTybzaPnrcfK0nKrePAktVNBt2-YqWdEg@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: ignore pointer types check with clang
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Paolo Pisati <paolo.pisati@canonical.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 2:59=E2=80=AFAM Andrea Righi <andrea.righi@canonica=
l.com> wrote:
>
> Building bpf selftests with clang can trigger errors like the following:
>
>   CLNG-BPF [test_maps] bpf_iter_netlink.bpf.o
> progs/bpf_iter_netlink.c:32:4: error: incompatible pointer types assignin=
g to 'struct sock *' from 'struct sock___17 *' [-Werror,-Wincompatible-poin=
ter-types]
>         s =3D &nlk->sk;
>           ^ ~~~~~~~~
> 1 error generated.

I cannot reproduce this and BPF CI doesn't complain about it either.
What kind of clang do you use?
Some special version and build flags?
