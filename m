Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793329875;
	b=uulQ2t3u06tLFWn/Y5SgaUaZ8my4rDfDRfeLM+Iv9528g4kR8apg3hbhbUYgWKhZHj5M
	 5BxDapl4R+s5L9Ns+1hymvix/dQXpRHNIA7Hduc7ngqjyFtwoBAXINYgkElBRD3LMln5s
	 lVdDMNgEvVoB5AoFwvGln0RxIlbDscXXzpKZ6lmQi04TIhW/v8uv/29JDoFDbRwmjJRHG
	 Ud3ImYCZbd9uo3z5Wl682BszowzWxzz8BMTULHlrRqBzWlzPE8bzfpqVaq7eDr3CxPvSX
	 ZyRPH2Jr37fxNgRi16dBh5CKTA8x3hV3GMnOdZe6PAAOVgOkObUY/SwiWYKx/+/XoIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
	b=DDKh5CQqkpT6BafyPVf2MsrUll8Z8IqVSynGoM7/luzsBtVaadbDvhVnAQKhhhls3pao
	 2nKv+q3QU6L4GR3htRml0gzNv1eGvgJlwB5NICZmrfP5fQriKzqanVLQfhqd5m0NUx5ip
	 jZdkAGNVBUm9kqkYqyUQ/kTo5fujgCWuTAjqgYixwxfWEeCFVTv3n/bcPiRAuIdBUGYAC
	 sxoqEHEJu97d1fKsOugRriZboT2Zsnf0vJBNIL8Z/cn/OCb5QC0dC17ATFbUF9MJU7cxd
	 /rRE5W5eOraokumUV7M5wrk2ZN6hfMKVQC+aJV7ZaXwJpZQkpVnukjqgyB/YebAwYCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i2bb2lWA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1E606A31F
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 03:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A1E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i2bb2lWA
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5337c7b9937so163951cf.0
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 20:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793329873; cv=none;
        d=google.com; s=arc-20260327;
        b=MwZ1eQ8OsCUySo9AU0EaVd9fBMUI3AllOxCGYeEkmOv2k0IA4SpSbH6aZAX9Y5iFj9
         7CV26DmRW6BgJ1UE9dJsa2xQmCMADzWsPHmrOMU8bGXrx3eDuxvVyMmfJHo8rReqx2G3
         vMt0JSDdxv+Zo4gxfR6ILWQV3t4ZJcpCXrz+E6i5iR8PLwdhE9/AtLp4lQPtwQNS+lQe
         rvEN2ZuQ5/sONycNDubeeoEwafLHjAyCwtD5RjhQOkfjlx2CluPWF12L7E8OtgUydum+
         bAf3yPuOAd6jam1ybLskCEtwSC9Ly8qL+e5V0Q3qRl5f7ZQbqRqLS8jCV1/+R43Ac+9A
         AK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
        fh=3P/fvMlBYViz7H9VS2sIeU3/+wuRKuFP+MjQqbpE5Us=;
        b=fAkld2//1UuvuNKVnTgRl4TJLEv3SgSy9kldhFReCoHHc25mRSAxx98EPS+k6/EwVI
         UWFyHRLDsoMtBiE1a5zHFC6KiskyxjHoi0OMl5TImLXXRYMTxqzHl1L1PjB9Fb9JD2L9
         lWgt2UwbGOHDaouXc+0cE7f3zvodl73MWqYypPQ4O/YzsnXrmaCyEEfZFJVfSIK7IrV2
         c2/AmSdhkIzETfoLGBgMb/OAKS9YltnaUsZyrgA34IwHp3tP4B/9s0j2/aLeUfr9t518
         WbTzpBR4/983xPI5q4SEXRg78KbLcAegpIlNqONvHONWK469LSB6FyTZX86qF4WaAqcy
         QLHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793329873; x=1793934673; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
        b=i2bb2lWAYOk9Uo3Lv+yYEMBpeSBreidbCZZSGQ3o7/lc2nRQXU6pfsSA8NsjCGqvPH
         B4EAy6CeozDBX0CIAQsVkCpEEVcHns5c3xKygFQ5+Lksp4hpo/dluXvE00op3+rzzuTw
         u/02rDupfT2leUfejD1wfbCjjDy+uzMx9HVeO9KMOWxtbCrBHmTymJCmVL7UXWtBSkLC
         DkWShDVrkn+yN13ZHoAgSLWniXmBmdI70BHwl8SbwOZyzXk67Z7nCdK6m4GfsKXavvO2
         R0Y7EFnXUXDXcZD9dvEC3EIEpG/dwoXQVFcLUlhmc8eziQ5iBhytDt3zYKe+7cOjo0tC
         q5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329873; x=1793934673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
        b=SOsxYJIbyVJi2yYEsgfdoFfVky66mhHeLim/y1CnToFeVAntynZGJclZi2HsUZq51M
         fTsomjavbye6Z3P+6DRxEx+Qp97i+16Uu15j1JqsltMkcMUTWPHGjFnkknTVhcEgKhUa
         YBEikxL7MoAO3wHXZwX999w4UQB3eMr2wYfUifNWxQ+smByD8xiJ2FXxwxmrQVXKoEn9
         ETZc0I1ngnYFp56Nw3M2keNfj/RbbgL0fDrqpH60AW0w6ceGXaWfAXZ5AjBjLYzb39mY
         Z2YJtBH4T3vzwjyZj1adD+M3N7tnlv0A9pm6cpJOSGM7Q67YErE7ZxoBzw9pC/gaUCkC
         P+Lw==
X-Forwarded-Encrypted: i=1; AKwUvByH1mb7iZctK88Rn7oM/nzkk6ZqqZxsS5S8loNzlwxqYAY7zqV+p7hfLJPw5UZKaGzBBiJX@lists.linux.dev
X-Gm-Message-State: AFq9FYILY3O9TuWGLBY+JdCJI5zCEHU1Y/XWYtlPXmbSRffRIWOyg0ns
	0X8/8X8FFL1K+BDP44EtpLghoh/LYQYk1qdPoIubU559bo4htX2u4OaHf3KkSeFQ9lubzWfqH50
	vXZk1vzcTi8wQFV2XvCHBZ44LjzZPtRRwG9un5lr5
X-Gm-Gg: AYBFou0zoqhDtPFHqR3vpwdyNvaWN/OfNSkx4GujhElY7aEAgRnXsWw6LGJTlWBN3Mc
	deipRrNG78nSoRWdB42S+a28HFhW8MSqjgIM8uTMCLhC9oLr3sLSmmmaU1eBUcWhPfJg1kr+IQT
	B8btJ4p3JyY9S/eSH9tOMgsYX8rokLJ+p+qL0R1QlnbgQVyX9l4Fbk7eRIkaBiPjLsxMkEi9kb1
	LsoRr5cVNHijByX06vaH84wyv2HZ/3D9qmYCfGvLhioxjlbEw0kx3HhcmAcaKOly4KZcGeuQMFJ
	t+DL8mX0W22ky1ALq5qeKn/wrdGJqXrOnFCGosExnIRjpzO5qLHokQscqN8Io7xctmNNJh8oIus
	MZw5usiz9Db2bwpLMYn3R92mPBkkxBIlqKdSJ4A==
X-Received: by 2002:a05:622a:1b0e:b0:536:6d88:600a with SMTP id
 d75a77b69052e-5414de1cf2dmr34323151cf.9.1793329872551; Thu, 29 Oct 2026
 20:11:12 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com> <20261029162958.3224280-4-irogers@google.com>
 <d1267d81-0ed8-4b3f-a535-88ddba51af88@kernel.org>
In-Reply-To: <d1267d81-0ed8-4b3f-a535-88ddba51af88@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 Oct 2026 20:11:01 -0700
X-Gm-Features: AclHuK9rCNoYtTV6H1GziiI59-c1QFU3f9f-3J74Fr_QKbxS-WGNb4D7UrtMMqU
Message-ID: <CAP-5=fWaLj-ToYvAowp-_dk5tL-_Ju+i=U90GRK_obFNqn5axg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/3] bpftool: Prefer zlib-rs over zlib when available
To: Quentin Monnet <qmo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:15=E2=80=AFPM Quentin Monnet <qmo@kernel.org> wro=
te:
>
> 2026-10-29 09:29 UTC-0700 ~ Ian Rogers <irogers@google.com>
> > Add zlib-rs and zlib to FEATURE_TESTS and FEATURE_DISPLAY in
> > tools/bpf/bpftool/Makefile and use feature_rust_lib to configure
> > ZLIB_CFLAGS and ZLIB_LIBS when zlib-rs is detected, falling back to -lz=
.
>
>
> Hi Ian, bpftool doesn't make an intensive use of zlib (mostly, it's a
> requirement from other dependencies; we may also use it to unzip the
> kernel config on the host if necessary for probing BPF features on the
> system, but only on some distributions). So I'm struggling to understand
> the motivation for your proposal, what do we gain by switching to
> zlib-rs when available? I understand this implementation is in Rust, but
> I'm not sure the added complexity and feature probing in the build
> system is worth it.

Hi Quentin,

At my workplace, we are transitioning from zlib to zlib-rs for both
security and performance reasons. I'd like to keep upstream tools
aligned but they don't have to be, it just seems nice. I agree zlib is
of a lower priority to users than, say, zstd. For attackers, like with
brotli, it is probably an area of interest. Knowing the implementation
is memory safe is at least something in favor of zlib-rs. I sent this
series out as an RFC because I obviously have no way to mandate what
upstream should or shouldn't be doing. There are things that can make
life a little nicer and easier, and this patch series, for me, is one
of them.

> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/bpf/bpftool/.gitignore |  1 +
> >  tools/bpf/bpftool/Makefile   | 56 ++++++++++++++++++++++++++++++++----
> >  2 files changed, 51 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/bpf/bpftool/.gitignore b/tools/bpf/bpftool/.gitignor=
e
> > index a736f64dc5dc..ea2222373634 100644
> > --- a/tools/bpf/bpftool/.gitignore
> > +++ b/tools/bpf/bpftool/.gitignore
> > @@ -6,5 +6,6 @@ bpftool*.8
> >  FEATURE-DUMP.bpftool
> >  feature
> >  libbpf
> > +libz_rs
> >  /*.skel.h
> >  /vmlinux.h
> > diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> > index b0f7168e7943..a193cf89a034 100644
> > --- a/tools/bpf/bpftool/Makefile
> > +++ b/tools/bpf/bpftool/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  include ../../scripts/Makefile.include
> > +include ../../scripts/Makefile.arch
>
>
> Looking at the GitHub mirror repository for bpftool, I'd avoid including
> this additional Makefile if I could.

Ack. I also acknowledge that the CI failed because the patches were
against perf-tools-next.

Thanks,
Ian

> Thanks,
> Quentin
