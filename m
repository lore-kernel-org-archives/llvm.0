Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A394221264
	for <llvm@lists.linux.dev>; Mon,  8 Sep 2025 04:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757307388; cv=none; b=JS6g28Xg5zsMDxi4Pmt6yihEbkoQalp9J3+kZL9nTgX13M00Ql02E+WIguSDl5SC35Z7ZsyRr9ERXFw6swJQkPIGYyt4Y2p5nuTz3sRNZfM2+TYOlZe5jHBr1c7WaX1suHgW3MtAiFnIGwGKtIXK6QH1pvixUhwUeftCQtBXvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757307388; c=relaxed/simple;
	bh=nmJGrpsFfjUmBS9R7+BX0Dcuub2rPayVOJerbTUc82M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fR8MUTITb/9p4jcySVgwFMlwJyS79BJzBBIpCipm8KAWzHAFinUAzWlPjiBExscofX5zyUS9YPuwz12P2br9+p+vZGt2IQPOi383T/trQ34DiWwySoO6aHnETO65KVhz3+hu1BOkSNbZ7oFaAngo+7FHcOKPF/L/z200lPcY3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eEsEcbEI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eEsEcbEI"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6aef1a7dso4146699e87.0
        for <llvm@lists.linux.dev>; Sun, 07 Sep 2025 21:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757307384; x=1757912184; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqAocCOY1yppSeB6hQiiLEHs4CzSJgmGLy5GgW8EMYI=;
        b=eEsEcbEIQMRpRuagQtFcfD42533sGgCfCIdEUoczxbK4NA4HhF+mAv5B1SPi5lTC2U
         wqDiXulowtrBI8OyPy9ylL7MBRgZ1oGPkvxZX2Vh5dX6efbVYy2++G2UaErZOm9YoKij
         kDbr+FRJrtSccimqLlc56m8mfmqNOHdeXLp3FdyUHhDK9c1Fg11E5zoyiqpV95u0q8SV
         7QROok6crzuv0KDno0ze/0zKu0Y7T87CyRFJ/COWMtrLc+gkLY/5Kuu+7U+h7+nVCFtE
         E5aWpBiZGMPHBrhUtA1tN8x6nrKjOIZjqgE3LXq/vXl4trMGcqxJbzrhYAoFJrOyzFmS
         YWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757307384; x=1757912184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqAocCOY1yppSeB6hQiiLEHs4CzSJgmGLy5GgW8EMYI=;
        b=gOmCNfy0i32w6lkvkhqa2G8MO4vIASnfjGp4AYIEv90SKPltNlqAOpbadgbWHXzlmg
         4B6z2HpEUs85mYmEFmx7I9MMO6btw7j49dgCEZBlbjUABl+v5cN8wYz/dt39x0ANk6IV
         4DlgLlc/Zuo52a3ElsclzC+PFeSEk7lORQIy9BUUSQXh+G6xl03hSncr2bIdXC+vqR7+
         EcUGkda9BNZHVGRNNoVwo8bX4+zbY12YhiNlPcbdqj89cvz6lolWcHytNUwKh8FR9gPZ
         GzqBr5RwaRotKkfpxqqbPNq8eDAj3U5Od6U1PZ0X+pv8zyAaWv6bdv8x2HUrZDduZjDy
         UXkA==
X-Forwarded-Encrypted: i=1; AJvYcCUACw1eME9qKPFxWEPTquLr93K8HQ0rjZQnpW5IfyYQYw4tD4KG4qPwirsQ6iO3IxKHGoLO@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+G5cRbLggoHM9gm/U5LGPVmE3KKZmMhHpsdyzP3q1xtXVegzO
	kJJ8jhZAPqekQeMG8/bOPdX9WrAwLyDjWNatuCakkFgn89joyE3+hQGH5taAv5myNP/SmRpJn2X
	xgoNbsg2g9XB9+tne/bw4a/Dczo/UwkrAM0OPFUosiA==
X-Gm-Gg: ASbGncs/182lArVoqZyTrvUTWIkernBs3qZqFAAqWxdQU+b6IyyogMXwPGPjrcvcQ2o
	U7EE+nF1/lZXmOGasMGDJLD8MSBL7Tn+Strsjwy2v6cs4he4KdCnBR68sNTg8/k/WyW0OfBWEmM
	cy0KFXJMcXhVZPRkzssnSuEHU2gRzeHgbAYGoDPsHamZ4Vvl3fHvAshT1HTuDu9Yjynp4UUMZ+U
	9wp0cjgyMZdNsUg9QYU
X-Google-Smtp-Source: AGHT+IEt+cLcCjEJ73PaZoZMn1SEdp50vHQ9D6RvYjXuFsmgAHrUIvazlHgUgKr4khjLizzh1GnJEM2PpTC9XWuWSqo=
X-Received: by 2002:a05:6512:61b3:b0:55f:4c1d:47f3 with SMTP id
 2adb3069b0e04-56261219bc1mr1861809e87.28.1757307384347; Sun, 07 Sep 2025
 21:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905051814.291254-1-hoyeon.lee@suse.com> <3pevfugpcd2j44b2wkrjhspn2a2ta627nhnqxc6ty7dxy3nt3v@qhytbn7lmqum>
 <CAEf4BzbsLP-_GkWaW5t4vM61m=qXEBOeOEJKShmB8_T5Ab8puw@mail.gmail.com>
In-Reply-To: <CAEf4BzbsLP-_GkWaW5t4vM61m=qXEBOeOEJKShmB8_T5Ab8puw@mail.gmail.com>
From: Hoyeon Lee <hoyeon.lee@suse.com>
Date: Mon, 8 Sep 2025 13:56:07 +0900
X-Gm-Features: AS18NWD51T7-IUPAZ5Oxyky9cDiUDtt7hwVi4UUu9hMYZmzwHN1XXhmlpyGxSug
Message-ID: <CAK7-dKZc8JOyjwiAG0rj=F+gfe_M1rsH0AqaB6Nq5iGz==vmAg@mail.gmail.com>
Subject: Re: [RFC bpf-next v2 0/1] libbpf: add compile-time OOB warning to bpf_tail_call_static
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 3:57=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Sep 5, 2025 at 1:42=E2=80=AFAM Shung-Hsi Yu <shung-hsi.yu@suse.co=
m> wrote:
> >
> > Adding some context that I think was miss per off-list discussion with
> > Hoyeon.
> >
> > On Fri, Sep 05, 2025 at 02:18:11PM +0900, Hoyeon Lee wrote:
> > > This RFC adds a compile-time check to bpf_tail_call_static() to warn
> > > when a constant slot(index) is >=3D map->max_entries. This uses a sma=
ll
> > > BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.
> >
> > This is an attempt to see if it is possible to warn user of out-of-boun=
d
> > tail calls, with the assumption being that with bpf_tail_call_static()
> > users would not be intentionally calling with an index that is superior
> > to the number of entries.
> >
> > However, there concerns with the current implementation, so this is
> > being sent as RFC to gather feedback, and to see if it can be better
> > done. Currently the concerns are:
> > - use macro to override bpf_tail_call_static()
> > - only works for Clang and not GCC
> > - uncertain whether this fit into libbpf conventions
>
> - map definition's max_entries can be set from user space at runtime
> making this check actively wrong
>
>
> This diagnose_if attribute seems very useful, but I'm not sure we
> should do this for anything map-related because statically provided
> map attributes are all overridable from user space when loading BPF
> object.
>

Thanks for pointing this out.

I hadn=E2=80=99t thought about map->max_entries being changed from user
space. That does make a compile-time check misleading, so I don=E2=80=99t
plan to take this RFC further. I=E2=80=99ve left some of the build workarou=
nds
in the other thread in case they are useful.

Thanks to everyone for the time and thoughtful feedback, always
much appreciated.

> >
> > > Clang front-end keeps the map type with a '(*max_entries)[N]' field,
> > > so the expression
> > >
> > >     sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)
> > >
> > > is resolved to N entirely at compile time. This allows diagnose_if()
> > > to emit a warning when a constant slot index is out of range.
> > >
> > > Example:
> > >
> > >     struct { /* BPF_MAP_TYPE_PROG_ARRAY =3D 3 */
> > >         __uint(type, 3);             // int (*type)[3];
> > >         __uint(max_entries, 100);    // int (*max_entries)[100];
> > >         __type(key, __u32);          // typeof(__u32) *key;
> > >         __type(value, __u32);        // typeof(__u32) *value;
> > >     } progs SEC(".maps");
> > >
> > >     bpf_tail_call_static(ctx, &progs, 111);
> > >
> > > produces:
> > >
> > >     bound.bpf.c:26:9: warning: bpf_tail_call: slot >=3D max_entries [=
-Wuser-defined-warnings]
> > >        26 |         bpf_tail_call_static(ctx, &progs, 111);
> > >           |         ^
> > >     /usr/local/include/bpf/bpf_helpers.h:190:54: note: expanded from =
macro 'bpf_tail_call_static'
> > >       190 |          __bpf_tail_call_warn(__slot >=3D BPF_MAP_ENTRIES=
(map));                  \
> > >           |                                                          =
   ^
> > >     /usr/local/include/bpf/bpf_helpers.h:183:20: note: from 'diagnose=
_if' attribute on '__bpf_tail_call_warn':
> > >       183 |     __attribute__((diagnose_if(oob, "bpf_tail_call: slot =
>=3D max_entries", "warning")));
> > >           |                    ^           ~~~
> > >
> > > Out-of-bounds tail call checkup is no-ops at runtime. Emitting a
> > > compile-time warning can help developers detect mistakes earlier. The
> > > check is currently limited to Clang (due to diagnose_if) and constant
> > > indices, but should catch common errors.
> > ...
