Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421754F83
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710185078; cv=none; b=ITOwknhiJOji57yty9TIod++gq5UKKE5qOgEqgMrdB/58HXt7viRc8C9d1klyFQBEXpst4gH/fDRw+M7QnqJJHM/ywYBZFmg/YukWhVGf1Z6E1gSAFO0J5/7QML0w7Uva72SQaVZowNe9XCnKqdOPb2LeznMkERwLPmmsKH4FkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710185078; c=relaxed/simple;
	bh=DgLWHcwduAxqjCigbUNUqTye02EDECmbNSNBeiAjWj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoMh343jWjCFNF7jJfLdGkNS+ipgI2fN0lDe/FfDxwIVCopFhE2QRffBxxI1BqXbMVny49nCTdwZ+ZBc76Dje9RxhcPRwBxooTmRHW3n/x/Qrm5VJRreikTOl1ZvRmuN2ilW03IfKQ2BQ5F30I3foNufDBGsVJtM28zKQ1MouNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sP443cpI; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sP443cpI"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-366248b78d9so17635ab.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 12:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710185075; x=1710789875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPemlJM4Xz0k98wRrCIdoRJ/9LZG6WhrdONiHPBnMmw=;
        b=sP443cpIWgttBHixa8nX8Z0VRd360HOurB/WPOi72sY6w+Ar+9T8iw/JE65rYP2MFA
         rREaSEMxuzAW5OTZh+WiOJFCaCeNTu02Dawnygi9Jd7nrgqxFxXteRBPqKVeSNIcFZEz
         GkCikQiNF4seDMe58XoMGNtppBvf3B8vjMJfRilj3FPaoeI3Eg/FRc0yDBwKKQhslpeV
         SNJpXlEq7CZ6+MYK7SoH/6bN/7qhjHshl5v5TJCzCwLeel5ayCBDYc/gW9wo4gbbMZVI
         GNvql8QwbjQr9rgSUFevxmbVTtQekU8gK1ONWOL/Rz0KLBEIZsbzrIPPKy4itzUmsDg6
         BGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710185075; x=1710789875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPemlJM4Xz0k98wRrCIdoRJ/9LZG6WhrdONiHPBnMmw=;
        b=dhWW3U7vmwHHvsOybfkCVV7j/TOwjrP3H3hm9mTnVsDEMKQ21e5tQHZrOKuYes754M
         4D3L4mAHAYWwY5GQLysIUXvhUgT9CFvFN0b7p/PT1Gdhtq5DIkNJUs9E1+tWlEmdn0bW
         /Nuc70pfhf1w4u8MM6juzR1vLk1ZcMFIFTpQuPD/IbcugDq9MoGtPiz5gQXpeefvFH9L
         4QmgMi676mjedus8IP110kVPU1Mcmo2+nv6v7AL0r0/XuUFehz9eoaV/ysdJx8rgC2nJ
         MXIejVFZZrHjAC8OKKo2YCWqG1ZZ7zUDf2To5hu+9L7sBxWb5ieNhdtf2PE/lUgkuRGI
         qqJg==
X-Forwarded-Encrypted: i=1; AJvYcCWfk3rLYgOGoK9KOeJmdpFx9wURQBYl1TZj/e5xhjk53OwF2rbVHPHwZ6CtihYj+8ahyljORwZQTU+KV/EUZSNDzLRb1g==
X-Gm-Message-State: AOJu0YyUeZk9GWIlmRaKeE/u+k0asA/8JQ0OHvx8JDysWpFt8sjljO9N
	arTYMriZWNOcjB8rlTqMbk9Fg8nC4vfCQAefvPRWRg30mXhqacRKhzFFHF7Wod4+ViQ+dbaWdS3
	UjyevOsb1tG7Y2+oqV8QnOBHn7cFbH52oWJ5X
X-Google-Smtp-Source: AGHT+IHK6kjYuN+av2sRfyJ8pA7jWQvyzS6EkNDyOpNIDK07iRRVV0vswER0vA5L4Tl9BTd3XE1V8lLoEXKubRDEp18=
X-Received: by 2002:a05:6e02:1a43:b0:366:27e0:3425 with SMTP id
 u3-20020a056e021a4300b0036627e03425mr10947ilv.19.1710185075344; Mon, 11 Mar
 2024 12:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com> <20240310020509.647319-13-irogers@google.com>
 <1ab20914-b6d2-fe39-7b14-c1ccebaa34f6@arm.com>
In-Reply-To: <1ab20914-b6d2-fe39-7b14-c1ccebaa34f6@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 11 Mar 2024 12:24:24 -0700
Message-ID: <CAP-5=fWZVrpRufO4w-S4EcSi9STXcTAN2ERLwTSN7yrSSA-otQ@mail.gmail.com>
Subject: Re: [PATCH v1 12/13] tools headers: Sync compiler.h headers
To: James Clark <james.clark@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@aculab.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>, 
	Nick Forrington <nick.forrington@arm.com>, Leo Yan <leo.yan@linux.dev>, 
	German Gomez <german.gomez@arm.com>, Rob Herring <robh@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Fuad Tabba <tabba@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Peter Xu <peterx@redhat.com>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 9:34=E2=80=AFAM James Clark <james.clark@arm.com> w=
rote:
>
>
>
> On 10/03/2024 02:05, Ian Rogers wrote:
> > compiler.h - synced from include/linux/compiler.h, guards were
> >  added to definitions to avoid redefinition of macros
> >  in libc. ftrace, CONFIG_OBJTOOL and kentry logic was removed as
> >  redundant.
> >
>
> Hi Ian,
>
> This commit breaks the Arm build (and cross compilation for Arm on x86):
>
>   $ make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-
>
> Something like this, but I won't paste the whole output because it's huge=
:
>
> tools/include/linux/ring_buffer.h: In function =E2=80=98ring_buffer_read_=
head=E2=80=99:
>
> tools/include/asm/../../arch/arm64/include/asm/barrier.h:72:35: error:
> =E2=80=98__u8_alias_t=E2=80=99 undeclared (first use in this function)
>    72 |                         : "=3Dr" (*(__u8_alias_t *)__u.__c)
>        \
>       |                                   ^~~~~~~~~~~~
> tools/include/linux/ring_buffer.h:59:16: note: in expansion of macro
> =E2=80=98smp_load_acquire=E2=80=99
>    59 |         return smp_load_acquire(&base->data_head);
>       |                ^~~~~~~~~~~~~~~~

Sorry for this James, I was rushing. I'll address the issues in v2 but
the one you highlight above doesn't look like a fun/simple issue to
resolve :-( Tbh, I'm not sure how much value tools/include has in its
current set up. It is weird the include order in perf prefers
tools/include/linux over tools/include/uapi. Current tools/include
seems to be trying to do a few different things:

1) provide headers like list.h so programs in tools can have linux
style lists, etc.
2) stuff that (1) drags in .. do we really want the asm barrier code
from arm? A sane user space program would be better using stdatomic.h,
plus that'd give the user space program an ability to get compiled on
to weirder targets like wasm. Plus we end up with weird type conflicts
like bool coming from linux/types.h rather than stdbool.h.
3) copies of kernel uapi headers that may be more up-to-date that
those in your system, thereby exposing constants that things like
libbpf depend upon.
4) headers with the same name as and that resemble kernel headers but
are really a reimplementation, like tools/include/linux/string.h
5) headers we have just so we can use shell scripts to scrape
constants for beautifying things in perf trace

For (1) and (2) it seems a separate library would be cleaner than
having the code in tools/include.
(3) feels like a legit use-case, so we should hold onto
tools/include/uapi, but do we want the asm directories?
(4) sounds like it should be in a library, perhaps with (1) and (2).
(5) feels like the headers should be alongside the shell scripts to
avoid polluting tools/include.
Not that I propose fixing any of this here.

Thanks,
Ian

> Thanks
> James
