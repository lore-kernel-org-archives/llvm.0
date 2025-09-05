Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971EE315D24
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098657; cv=none; b=TUT9KxfOA5hTF+mSRCXgVD1BQGAgjpQpJVHiSLZ9R8zU31pr6MRSKCPwuVr9Hr7m23NsQ4r9vIWO70B8YfHFSjxcqwNCI/EqVWXLWUj/ZR+lmGwNIUXnf97oeai0kBqnJY7LmCYBj3qgj33NL+cFodCDlX8qApdy9YhoEshqkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098657; c=relaxed/simple;
	bh=Sh2W9S33o9oHSqjqqDPu97sA2vKA/BObXcqy8rxc/KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDhUmatjo3QJyo3O6KVvODd/ZKcWuaFcPRei2sm+w9FOWOKHBmQ6fe00u70QTnX1HZ/7ofyowVThVNS+mMc+b+uvIXMns9aKu8IRZEqpbnJ3Ra2mXv5P8jRKGsiS5oCj3uQJrMgJyxrATxa3Ff27fy3i6lPD6jSDjo6kIX3l7kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpIcIup7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpIcIup7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4dc35711d9so1688265a12.0
        for <llvm@lists.linux.dev>; Fri, 05 Sep 2025 11:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757098655; x=1757703455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Phcp6Y13YTj5On7joWI7rno+f1V1BMv8Ow6mbXVUb6w=;
        b=gpIcIup7FACEGSjOhP2LJ0buQ8y0+2HU6FPgpSXApXpBUZkGg60m4gBYILjxtTHGEz
         /pk6zAMAUC4Vkx4FVd+DhLeST4yl538BFn6LzYT6MQ4dSEQYww/xmG0dIDvu+HSblrIF
         64vrFeA7nDBqcQ5yq8XP3QgnBPu+c1YpYlWDx8A+9mPg3ruEY1PYHdQ/uV8fGIFv4I5/
         ZCd77UhpZAqx9ZRaNFkmIHY3+zbIFcWH3jW7YRxPnxbF2zs9f0JozC7dJZoiXiEbOKER
         UM9fukgnA5N6GxfQXscAi1+u9s9kMIjoEsF32mMLbHHYs3O8VO6hHsNoMX3QPG2VUxJi
         YOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757098655; x=1757703455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Phcp6Y13YTj5On7joWI7rno+f1V1BMv8Ow6mbXVUb6w=;
        b=eD01Dg9HRmb8+LZuMsxxyTd/EhFUSytx1nERtTb8FwvGzZ5DvTm4gj8HgLYFKF4A9v
         oQL3kDag9kKgXmfJ1qN0ZovyrL35LF32iroMfjoggJ3ehifBfhYx2rUtsU0xEQgyEQ/0
         a55/rmZR7OdgQ4wzrqiR92wO/lT0KtHcigYGKc+rnaqFYjqmQDqxBmxeO/POcbZrLZIZ
         UlNxyme+gxP86ZULwv9M6e7mWtf0nV0gI8SX2g3PsK3QInjHsv0VNTt7mtJxeJwoprcj
         b4n6fg2zMVZKX1QurnAJxvf7IWPbE8rL+6g5chTjz3+yNXXfoNznT63RRdm7T1H0luLr
         hPow==
X-Forwarded-Encrypted: i=1; AJvYcCV3u6TpQ2yNqEYOcA5DGOk/LH5SkSt7A+PCLwsyqmqgROov5EACKIr9v9Jxbtabne8PFyU7@lists.linux.dev
X-Gm-Message-State: AOJu0YzzikOJD2YXcIzOCJUCr+C+aCh8JuzgNjEhPhXb5mVIHBIlEsyr
	H38OmQjZ3JDf5E8RKm1H1uNBo5KrIw95SO780NgNKbz/FxxO7MTjQQIMMnOJKLZs2MEEB2tbaVP
	UZCj/jkwfLcbkb9U9631r26nOVHP/TPCr3A==
X-Gm-Gg: ASbGnct+mQ4QgGSFGz6OrjW11GyMD/vUEK55IAI/5skvuvPto8cYwOSbfv8H1YOG767
	/yghZZEmf4Yi377dsgppwKzOVKrQhmOZh9xVqJ/dhakqtJ8YefmlfAR7O4gjove8JdCxy2Cg/yV
	Re7lKg25Hd3DEn7e5hsl4pU69X3JVd5Ms7we2RBHJqdIYYiuqvURm3nXSCj96fpUUkcXOio2Ggy
	CtwkGDIBadGL+8=
X-Google-Smtp-Source: AGHT+IEWUVD5cYlMBi/1ejQQ5/n7xicywFu4Y7kfT/oTopx6krdGSLXXSCmtKhpytMvanDAdT1YNmnjzFXeyQbM4J2g=
X-Received: by 2002:a17:902:e80d:b0:249:308:353 with SMTP id
 d9443c01a7336-24944ad2e89mr321812025ad.41.1757098654855; Fri, 05 Sep 2025
 11:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905051814.291254-1-hoyeon.lee@suse.com> <3pevfugpcd2j44b2wkrjhspn2a2ta627nhnqxc6ty7dxy3nt3v@qhytbn7lmqum>
In-Reply-To: <3pevfugpcd2j44b2wkrjhspn2a2ta627nhnqxc6ty7dxy3nt3v@qhytbn7lmqum>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 5 Sep 2025 11:57:22 -0700
X-Gm-Features: Ac12FXxq2WqmGReWjLpExvK8MuV1pV6f8MehGAHjrpq7LQVwRkY2LEyn3ySnMWg
Message-ID: <CAEf4BzbsLP-_GkWaW5t4vM61m=qXEBOeOEJKShmB8_T5Ab8puw@mail.gmail.com>
Subject: Re: [RFC bpf-next v2 0/1] libbpf: add compile-time OOB warning to bpf_tail_call_static
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: bpf@vger.kernel.org, Hoyeon Lee <hoyeon.lee@suse.com>, netdev@vger.kernel.org, 
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

On Fri, Sep 5, 2025 at 1:42=E2=80=AFAM Shung-Hsi Yu <shung-hsi.yu@suse.com>=
 wrote:
>
> Adding some context that I think was miss per off-list discussion with
> Hoyeon.
>
> On Fri, Sep 05, 2025 at 02:18:11PM +0900, Hoyeon Lee wrote:
> > This RFC adds a compile-time check to bpf_tail_call_static() to warn
> > when a constant slot(index) is >=3D map->max_entries. This uses a small
> > BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.
>
> This is an attempt to see if it is possible to warn user of out-of-bound
> tail calls, with the assumption being that with bpf_tail_call_static()
> users would not be intentionally calling with an index that is superior
> to the number of entries.
>
> However, there concerns with the current implementation, so this is
> being sent as RFC to gather feedback, and to see if it can be better
> done. Currently the concerns are:
> - use macro to override bpf_tail_call_static()
> - only works for Clang and not GCC
> - uncertain whether this fit into libbpf conventions

- map definition's max_entries can be set from user space at runtime
making this check actively wrong


This diagnose_if attribute seems very useful, but I'm not sure we
should do this for anything map-related because statically provided
map attributes are all overridable from user space when loading BPF
object.

>
> > Clang front-end keeps the map type with a '(*max_entries)[N]' field,
> > so the expression
> >
> >     sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)
> >
> > is resolved to N entirely at compile time. This allows diagnose_if()
> > to emit a warning when a constant slot index is out of range.
> >
> > Example:
> >
> >     struct { /* BPF_MAP_TYPE_PROG_ARRAY =3D 3 */
> >         __uint(type, 3);             // int (*type)[3];
> >         __uint(max_entries, 100);    // int (*max_entries)[100];
> >         __type(key, __u32);          // typeof(__u32) *key;
> >         __type(value, __u32);        // typeof(__u32) *value;
> >     } progs SEC(".maps");
> >
> >     bpf_tail_call_static(ctx, &progs, 111);
> >
> > produces:
> >
> >     bound.bpf.c:26:9: warning: bpf_tail_call: slot >=3D max_entries [-W=
user-defined-warnings]
> >        26 |         bpf_tail_call_static(ctx, &progs, 111);
> >           |         ^
> >     /usr/local/include/bpf/bpf_helpers.h:190:54: note: expanded from ma=
cro 'bpf_tail_call_static'
> >       190 |          __bpf_tail_call_warn(__slot >=3D BPF_MAP_ENTRIES(m=
ap));                  \
> >           |                                                            =
 ^
> >     /usr/local/include/bpf/bpf_helpers.h:183:20: note: from 'diagnose_i=
f' attribute on '__bpf_tail_call_warn':
> >       183 |     __attribute__((diagnose_if(oob, "bpf_tail_call: slot >=
=3D max_entries", "warning")));
> >           |                    ^           ~~~
> >
> > Out-of-bounds tail call checkup is no-ops at runtime. Emitting a
> > compile-time warning can help developers detect mistakes earlier. The
> > check is currently limited to Clang (due to diagnose_if) and constant
> > indices, but should catch common errors.
> ...
