Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793764146;
	b=zvN0jXpO6ohH7TSang4ZPjNe33lDRxHnJzlV3T5jf8aIL7kCFLpb6n5ka8d8qNP0dibZ
	 xZe/KYwGoEiEP8UGgrbvt2eh8IEduR6vXVHo7JAxu64U885Ip4VhvhV4949V6WK2p5wXE
	 u03uHxSr7Tq+QMKQKpve/M4/rsqEcLfnkxrWz95QbeOXuMrDATk7nP5Qj4TLBo3ubHkN1
	 2LJxe2xwxuy+7tJs2ka2Z2ZjgmOF06196pUilZWUvf8Q8W7IQxX5LqW0klXVtR9+jUH6M
	 ALGhRBTjcZCgVTxtiXr4NpnkhCwn7yzsRy5nCC4Val4BwbEa+l/sCIlyHNX9qKSangA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
	b=wbYpbyVDU6wk4CwMHeSymY9MxUNZ+XWI+xfNIvn2pUGAtqaQQgBX6A5qlcfln4OmhPXy
	 X7+nBQi6nLKvae3KELC9h5oi8asB1lf4u66dhn5Wj4nrc3xmrhFvEOomuoA1f0m8hqXdP
	 cBQKfq0lncD14lZK4jz5PyE7Ez0pfJpBuaw2Y/+srR1uLhAOn/houkVYzt4DdFQ5ODke4
	 UurrXaNydxorLXU8hkP4jCXCfO+Tqu5r+BBvKflYcYrX9edmFfwYb3xY+4f07BCWRmoDd
	 fE+5pHwqeZF0KRuJjqVJKRIF8bXm9EKf8yHe3MONmIiwzTTN/zl0jeBhZ8SorovPqrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MJwftO3C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C08E606A31B
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 03:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C08E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MJwftO3C
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-535f598d126so98171cf.1
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 19:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793764145; cv=none;
        d=google.com; s=arc-20260327;
        b=Od9vA7+R2s/X+7r+BUQTJse3x5WpJWedwZyj3SJH7Pmjv50PEUL4+GDW+PnSpU+OXJ
         V2RM5RX/QyYeOYFw6R89CP6QsXlLMWNvTe2Xl/s/8qKUqFVR1F0xjb7qRBljhTWXtDN5
         zTnBePpMWRLuGpUpO2Oi1GfPVOMac7P8XhOppthDaq0+kcjT8xZ3Y2sPgwxGe+w1Q2i6
         UpsQI9nZXmfhFDJzJQQWqo2Jc5LjS5Juak9pinHzLwQUbDjB8R0phxG4r6VHdpBC9OoZ
         49xtey4sGLwYz3zkhyhjjL6+MzUDQ3dGtUE2MMqJVnSGmCiP2x9PnImFKXcam5CaJdRF
         s5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        fh=YL5mrqsri4gGYxUnb3jdCZWNGQjeDd4Uy0LH6F685CE=;
        b=Zr+0O6sI1ic8LbL2TK7Btn1XX0u82OqhyKlJLIsCVituQ0BxON7kTAgH6/FAsY2cZ7
         tRVH5ycasxOzQ4SU7+EZexPYpINBP3tnG3wHxINcGJUGAQZVb53msKt8mGZOgdCKcQ7j
         A71pzeS1mDegNvuKG9/6HijQPfzs+RIaiQ/k/olw0nUv7PVWTAmp8/M1VCj+ysU714WD
         alDdNX5v7Ne9fr59xSgDULPVpicPiVGTcFunu+q9yWB90swQdpv5vTV+61uVF+r/4Fzc
         OP7NQ3JV6KwkkNplPvvre85ErlovXl02Km8M1U6hIVP2CzdcHASBcMLBJlGOkFtqonca
         FocA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793764145; x=1794368945; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        b=MJwftO3CLwkHpEhj0R76UQ/A3aYKXTG1z7gdXuHoKJ9uOmKAbzpDS9sGwUe30P+Ows
         968B9gVacZTFiFrn2PKYt/s6FZEpohx9Az8ur1smELJxwI/nA3uH++GwDuTQXJyoA3gO
         eu7FQmkx7zRL1S0gcEms0DuE8MlhxREHXxQBlvPaMQB3+AAat2mZv1AxvZOcvwfzCPkG
         ul4MVdwzQcXK9XdOfla6e+GmHd+a4iAtjJHo9itT7T4cIqeHfU00xGpNneGF2lGOSOQx
         s+AdEwF0/rHVArN6zKeFlTNMuFXHDPqMyQ6gyp4NfHvS4z4aFA1OV5POOMj5nrhbLsYl
         6crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764145; x=1794368945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        b=eA75gad+66XGlCs1fIIo/c866arupQ8UKUaoFDLVl4fvYkpDmbHu2dxLi0mf7ih3tY
         yOsM/TzQ1cZeNsrVud6Ie5gd1CH7p0KRr0FNvi5/TVX1wSV2H68LlVbAZooSyNL/f50q
         rDUe7k5Y0ht1mL4GdaByUkfsiAwy6aZUIc9A9TEeAusTemJv59Frn4NOBo+dG0FiZKCf
         QTATOMQ1kMdeGycip+Y/wmScTWZ1/mopeRnLbPdKBzii7nFirObYid3aAS2nRAZq/Xmv
         qLN25rb/PDBNKVjGbv3jk4bhLPoLnU5W/WEKPHBUUDzHNakuIfpfrKvM/3dtGOL6L3Lh
         BwgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTE+MLS/HmvrkmLsP4TmHYSn/zGIlEERafLgsUE1a7Z5WMemYDrvrV4iWN/yStMbwzOKt6@lists.linux.dev
X-Gm-Message-State: APuU4Z98x3zzrsP5Jpv52msyfH6hEMS8LdEKDVa3Ef3QbKsFtpBaaoT2
	k0HFurUhPF43uiiI6FDJzfNusgJBn2z6tAE6WmdSzOYmx0OrdHiJmfhomd4hzoElIopFpx1k5Wx
	UVH112wbUgMZ7SdCsT1V0iYNk8be25smV7G5DVkru
X-Gm-Gg: AYBFou3A64ekV04tclICy97sOq8u2W6x8oLaK7rStp69Oq3xkMzROA69YUE3k/3g+aj
	LwJFL/yITnAuWmigin3FatDqGYduhqabkwkzXkHbyFYcaPrQ1OgJk8bMYGUyWyUCRHPPCvNKsR2
	uajFabLbkPrIpZazPDPxVhGlAY+o1ZBLmWJiIlFcNqOT9mGiZMeq+vbCJ2PkbLKs8AHQuHwl08R
	26ezEgzSv1t3EjDb3ln+L/fwUH6gESFvunGy3hbUprLvEZ+764Z4dtb9c4mcPYqoslD8bAb4sU1
	80+aEkS/ma9srZYfNiTwivFxORJm6u7kNAeuyco8VVlngO0VLcEjXYKkTchIUOWIlmX+uaa39gM
	TrGgCwoHE1Zy0VFYNtYe50HHDsgZuBXSbLII7qA==
X-Received: by 2002:a05:622a:2298:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-54b61e27b15mr3087041cf.6.1793764144251; Tue, 03 Nov 2026
 19:49:04 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030202710.3863806-1-irogers@google.com> <20261030202710.3863806-4-irogers@google.com>
 <25216bda-7e36-4bad-ba7c-1984dbb9dfda@kernel.org>
In-Reply-To: <25216bda-7e36-4bad-ba7c-1984dbb9dfda@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Nov 2026 19:48:52 -0800
X-Gm-Features: AclHuK8jUTP0fZRLAUdhb4V7KjnS7XAslg-dpWxyxMmrVUFMhhemkzjXApXA5fA
Message-ID: <CAP-5=fXKeqy75_1p9TgrqOgw_Eh8h=U5FB40PQbZhwxczV-CrQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] bpftool: Prefer zlib-rs over zlib when available
To: Quentin Monnet <qmo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:20=E2=80=AFAM Quentin Monnet <qmo@kernel.org> wrot=
e:
>
> Hi Ian, thanks for the v2,
>
>
> 2026-10-30 13:27 UTC-0700 ~ Ian Rogers <irogers@google.com>
> > Add zlib-rs and zlib to FEATURE_TESTS and FEATURE_DISPLAY in
> > tools/bpf/bpftool/Makefile and use feature_rust_lib to configure
> > ZLIB_CFLAGS and ZLIB_LIBS when zlib-rs is detected (unless disabled wit=
h
> > NO_ZLIB_RS=3D1), falling back to -lz.
> >
> > Decompression of kernel configuration (/proc/config.gz) and compressed
> > ELF/BTF sections (via libbpf, libelf, and libbfd) processes data that
>
>
> Is there any mechanism in place that prevents libbpf, libelf, and libbfd
> to link to different versions of zlib (zlib vs zlib-rs, I mean)? I
> imagine you could have bpftool linking against zlib-rs, but the libs
> installed on the system linking against zlib? Also I think the static
> build with the LLVM disassembler [0] passes -lz -lzstd in LIBS and I'm
> not sure how it would combine with the change, I need to take a closer lo=
ok.

Thanks for raising both of these!

1. On preventing libbpf, libelf, and libbfd from using different zlib
   implementations: in libelf.so, libdw.so, and libbfd.so, the zlib symbol
   references (inflate, inflateInit_, inflateReset, inflateEnd, etc.) are
   unversioned. If we link libz_rs.a with:

     -Wl,--whole-archive $(LIBZ_RS_OUTPUT)libz_rs.a
-Wl,--no-whole-archive -Wl,--export-dynamic

   in Makefile.rust (perf already passes -export-dynamic via python-config,
   so adding --whole-archive is actually important for perf too so it
   exports the full zlib ABI rather than only the objects referenced at
   static link time), then ELF symbol interposition binds all zlib calls
   from libelf.so and libbfd.so directly to zlib-rs in the executable:

     $ LD_BIND_NOW=3D1 LD_DEBUG=3Dbindings ./bpftool version 2>&1 | grep in=
flate
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflate'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateEnd'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateInit_'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateReset'

   That ensures libbpf, libelf, and libbfd all use the same zlib-rs
   implementation at runtime, and means all compressed ELF/BTF/debug
   section decompression in libelf and libbfd also gets the memory-safety
   and performance benefits of zlib-rs even when linking against distro
   shared libraries.

2. On the static build with LLVM disassembler: `llvm-config --system-libs`
   emits `-lz`. Since `LIBS` in bpftool (and `EXTLIBS` in perf) already
   includes `$(ZLIB_LIBS)`, we should wrap `--system-libs` with
   `$(filter-out -lz,$(shell $(LLVM_CONFIG) --system-libs ...))` so static
   LLVM builds don't pull in `-lz` alongside `$(ZLIB_LIBS)`.

> > benefits from a memory-safe implementation. Preferring zlib-rs over C
> > zlib provides memory safety and improved decompression performance whil=
e
> > keeping bpftool aligned with tools/perf (including sharing libz_rs.a
> > when building bootstrap bpftool for perf BPF skeletons).
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Recalling our discussion from v1:
>
> >> Hi Ian, bpftool doesn't make an intensive use of zlib (mostly, it's a
> >> requirement from other dependencies; we may also use it to unzip the
> >> kernel config on the host if necessary for probing BPF features on the
> >> system, but only on some distributions). So I'm struggling to understa=
nd
> >> the motivation for your proposal, what do we gain by switching to
> >> zlib-rs when available? I understand this implementation is in Rust, b=
ut
> >> I'm not sure the added complexity and feature probing in the build
> >> system is worth it.
> >
> > Hi Quentin,
> >
> > At my workplace, we are transitioning from zlib to zlib-rs for both
> > security and performance reasons. I'd like to keep upstream tools
> > aligned but they don't have to be, it just seems nice. I agree zlib is
> > of a lower priority to users than, say, zstd. For attackers, like with
> > brotli, it is probably an area of interest. Knowing the implementation
> > is memory safe is at least something in favor of zlib-rs. I sent this
> > series out as an RFC because I obviously have no way to mandate what
> > upstream should or shouldn't be doing. There are things that can make
> > life a little nicer and easier, and this patch series, for me, is one
> > of them.
> I understand you're transitioning to zlib-rs, but the current patch is
> not a full transition, in the sense that it doesn't replace zlib with
> zlib-rs but allows any of the two options; and I don't see support for
> the standard zlib being removed from bpftool anytime soon, which means
> that in practice, we've got to maintain compatibility with the two
> versions going forward. Others may want to chime in, but I'm still not
> convinced this is worth the burden.

Because zlib-rs (via libz-rs-sys) implements the exact C zlib ABI and
headers, there is no C code difference to maintain between the two=E2=80=94=
only
the Makefile selection of ZLIB_CFLAGS and ZLIB_LIBS via feature_rust_lib.
With the symbol interposition above, bpftool (and perf) get memory-safe
zlib decompression across libbpf, libelf, libbfd, and libLLVM whenever
zlib-rs is installed at build time, while still building everywhere else
with C zlib.

> You also mention zstd, do you plan to add support for a zstd alternative
> as well in perf and bpftool in the future?

No current plans for zstd. Unlike zlib-rs (where libz-rs-sys provides a
complete, drop-in C ABI for both compression and decompression and is
already packaged in Debian/Ubuntu/Fedora), I don't think there is an
equivalent drop-in Rust replacement for the full libzstd C ABI yet
(ruzstd is currently focused on decoding, and the zstd crate wraps C
libzstd).

> (By the way, if you allow me a short digression, you had a patch related
> to the zstd probing for perf and bpftool [0] and I don't see in the
> tree, do you know if it was ever merged?)

Thanks for the reminder! That series wasn't merged yet=E2=80=94both you (on
patch 3/4) and Peter Zijlstra (on patch 4/4) gave Acked-by on v2, and I
think it fell through the cracks waiting to be picked up into
perf-tools-next. I'll send out a rebased v3 with your and Peter's Acks
collected.

Thanks,
Ian

> Best regards,
> Quentin
>
>
> [0]
> https://github.com/libbpf/bpftool/blob/main/.github/workflows/static-buil=
d.yaml
> [1] https://lore.kernel.org/all/20260909204122.1993010-4-irogers@google.c=
om/
