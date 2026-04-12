Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E9F346AF1
	for <llvm@lists.linux.dev>; Sun, 12 Apr 2026 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028191; cv=pass; b=dOiwXUH1PIKs+mL6OmKEXJ2bBQnCQW3+X0J8x4KHl+kcUHpi5Dngwz4+DLZ57sBHeuXgEWuTKHJT78bFOK0TDnRhtYAxtpgXZGAy6RA/1IlFph9XHr0HdNnGS7AKrG3VpXdkHr9x/Cw/JuL4wDqp7DZeHlzHmJmA8PK3HCdAnAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028191; c=relaxed/simple;
	bh=oEQ85Gl3lH6+Cv9RN6chqPqZuCmnNGFRnwc1Zh/B7zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSAukvLUV45B3dE6IrGUOWM9ULMuVNwII/0w2NSPX8OvcJ0iSpZ9hi0v1jBYZNCp8/2zapmQ6xCmYC99ZRmyvBIo9DNzpNaUr4D3rA1a+dB381NsOx8yywQkAb1IOWzDA3GJZ32QkrsSQa4BA36mjfSnQYztYT7XExrscmFZg8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TK9lcdRo; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TK9lcdRo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d43e09de5so2075215f8f.1
        for <llvm@lists.linux.dev>; Sun, 12 Apr 2026 14:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776028189; cv=none;
        d=google.com; s=arc-20240605;
        b=RJzSFcyjtn1vD4M67l5GRGEFSI+EvNnYBYdUWOzBD5eaWKuJXleFE4LXN/G04rTS3g
         LrB0gr7XmNDqCWiwpPq+qKBZuyPhLy+xe4WdRjvz0q5v+NiCSDjxkgFgJpezkk6QzDwq
         FuN10gAH055XBVM32nnXeAuaRb/bUxHUYuqW9BERMzarK2oeSQdm3vBQzfLSp5JnIsir
         kSi9v5eYjEUCd5biKuvhhYzA3jbA9LxD7qAXrOe5oKBsXNrPTPie41M6Qxj6VMmrDRWz
         qcObxi4fhwquNeA8zwAuxs2nc3kDF/9lkTMn4VG4DvlSIOzu9VIqdjztY6ZnpifO+IQM
         X+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfWPCmksGjAz4lAKfxlGJt2rkOmogat4M8a0nj0icMw=;
        fh=RF9WNobD/kI00VQE/R2W/xhzByFmAbfj8VnLaqLR//A=;
        b=Bqf54Jv+2Gjkn19uyhBQImKLmsYfJK26XTfL0knlRYFTvyGHNB6loHER6iaRTDENnR
         zedJsq+lucxIEsAl5hEgeLgSbQPCJlEYbjy84a1B/TYTxkun/zFMJXxJY6R6LasM26+Z
         5K6Rgu+7t8P07iHUyhjAzrXKtPvSr74GmdQBIvF5wsmIOeIqjRP1mZ13PBNROWr9oQ6K
         xsgQ81adIhaB8NCMpY1WagVS1vjf86Piz9VJQWaLnzziZSiTl24fINxMGXx1tHsFQ1WC
         7B5Sgu2ihbc+E6SB7IEidT03Sw7yA84/scdQtFdc4uH8k8Cnt/eGaYk6WLfogxFvMAFt
         DwWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028189; x=1776632989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfWPCmksGjAz4lAKfxlGJt2rkOmogat4M8a0nj0icMw=;
        b=TK9lcdRofwUwyiLeA8EFVBTfUPHB+1Jf99iteG4rkUS422ttlU2RrbVUs86nk55vvf
         9CM10LpfK31n+CZZE8D0rkga6GaE+PFTHheURUF+7xq2vi/b1xaLhJd11Llzlc2Hx9Ul
         dzDLZrNSRnJ4fDlfBK9BrVPHMLjE85yP56agT5vuqpgBicaibhDSvcrz1Ges0gb/qBFV
         CnQLOIAaGGbwV5XMhmZ8i8oxzJNGhjB9jmwdLCrKp8cOzAiEkQXvXyLwC73wjiKzuvoN
         he4sN2NSDG6eXjU6bnlDja27D2ZfLIVfGBVeFhoL2sjzFgMAVxT3XqzxiMPsAJwHExuE
         nUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028189; x=1776632989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfWPCmksGjAz4lAKfxlGJt2rkOmogat4M8a0nj0icMw=;
        b=tY65wZ0ArsVl9JGqJU/NFQoJ3Y6hgaR2+e+ODUWQGhXILSx+eycqNrCDp/6x9ognev
         TptXmw3tb8i+1tRxFYPvbw4uvtyk4yBCLxM71Js80KdWo3wdc5EXsnak2jMmNF7vw+pt
         HU0d+NpdrmCz+kfuAdxpDfgBCjsu4+eGy+QKFwxgJD3SRos8L9Oq8pBh/6fOY9oFcmen
         jQSC30IfMrsJzMW8X62khQohK+2mjfSiKifjAFUrE4JFTMdZriJI2FEPBMqtJQRxNp7N
         d0BpwtCUWcStnW6oOKDc5oEDVnoTTyk2AoHUtsNR3POfMj5NlFCAOYT2c9Q/LCn1AXHR
         x9tw==
X-Forwarded-Encrypted: i=1; AFNElJ/jbR2kGt0hBHKyDhhd3ZBuLIcdWRMignB6FEaKSkJViKLGnix4Gkv/pwGfx3eyandraSn5@lists.linux.dev
X-Gm-Message-State: AOJu0YzPsiSj757a+yFG690IKRqGu917sy2ISEh+5kgOj9Imdz10WQnn
	NyNkVzOEyaVdrPJRuuDGx/ntIvjUqmj8oyZBg3AEYWwvnNWJxesrYLk3VlU/O3d12+s+5F2Okq4
	D7OLiSBkAUZFBX/DnA8HMejLqgvUhmh8=
X-Gm-Gg: AeBDieuVCp8zrQKPU3xLdbM4L1WNFu0fH4MW60W6pIEdGSFLIy7vNzDl8izieIKiTcl
	PKCB5O96bslP1jzpNJzoEMxmpSSIpwZVRQdJNHllHfnL5WcOSTnoEWNlGIIXE5q/FpdgVhFQ9vQ
	kK2JmclaQLhqV3oFAZfDBT7oC2BYCrtf2DhHKZscqcfI/Ckp+01nw4hgco4ZkITRdTQFqFfyu2a
	PoifRq7VnpTVVByizLXsk1nYWpYGo2D0hZ6ANc4xkiBuEZ2ebesPn0kqe9zUOifhw+kiMhl8LDi
	xj0fyeMqmgbVEbe/ROW6Wp1MO8QJQIDSbj8R4EbOtB5LdHW4iPJlxcz/qtXFVyB0dOV3ZEZGMcf
	hoVqHjsnRoZTWU3n86IiWD8nwBQ==
X-Received: by 2002:a5d:6087:0:b0:43d:708f:a63e with SMTP id
 ffacd0b85a97d-43d708fa6f6mr3675840f8f.10.1776028188629; Sun, 12 Apr 2026
 14:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
 <00e95867-edbc-4e74-8696-16a8f61223b7@oracle.com> <DHPIZX3045PN.2QCSGKPP43W3I@suse.com>
In-Reply-To: <DHPIZX3045PN.2QCSGKPP43W3I@suse.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 12 Apr 2026 14:09:36 -0700
X-Gm-Features: AQROBzDEoHs8AN70ZQU6rFFqi96tGMTpydxF-q75n3f12Cuk-TEdUaK2x-jPrm8
Message-ID: <CAADnVQL1uXfPr1WuM1B8YeJHC8y+roE+b0OT1F5saM=_aeOjBQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] selftests/bpf: Tolerate partial builds across
 kernel configs
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 6:57=E2=80=AFAM Ricardo B. Marli=C3=A8re <rbm@suse.=
com> wrote:
>
> Hi Alan,
>
> On Fri Apr 10, 2026 at 7:06 AM -03, Alan Maguire wrote:
> > On 06/04/2026 19:22, Ricardo B. Marli=C3=A8re wrote:
> >> Currently the BPF selftests can only be built by using the minimum ker=
nel
> >> configuration defined in tools/testing/selftests/bpf/config*. This pos=
es a
> >> problem in distribution kernels that may have some of the flags disabl=
ed or
> >> set as module. For example, we have been running the tests regularly i=
n
> >> openSUSE Tumbleweed [1] [2] but to work around this fact we created a
> >> special package [3] that build the tests against an auxiliary vmlinux =
with
> >> the BPF Kconfig. We keep a list of known issues that may happen due to=
,
> >> amongst other things, configuration mismatches [4] [5].
> >>
> >> The maintenance of this package is far from ideal, especially for
> >> enterprise kernels. The goal of this series is to enable the common us=
ecase
> >> of running the following in any system:
> >>
> >> ```sh
> >> make -C tools/testing/selftests install \
> >>         SKIP_TARGETS=3D \
> >>         TARGETS=3Dbpf \
> >>         O=3D/lib/modules/$(uname -r)/build
> >> ```
> >>
> >> As an example, the following script targeting a minimal config can be =
used
> >> for testing:
> >>
> >> ```sh
> >> make defconfig
> >> scripts/config --file .config \
> >>                --enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> >>                --enable DEBUG_INFO_BTF \
> >>                --enable BPF_SYSCALL \
> >>                --enable BPF_JIT
> >> make olddefconfig
> >> make -j$(nproc)
> >> make -j$(nproc) -C tools/testing/selftests SKIP_TARGETS=3D TARGETS=3Db=
pf install
> >> ```
> >>
> >> This produces a test_progs binary with 579 subtests, against the total=
 of
> >> 708. Many of them will still fail or be skipped at runtime due to lack=
 of
> >> symbols, but at least there will be a clear way of building the tests.
> >>
> >
> > hi Ricardo, I've been looking at this series and one concern I had was =
if
> > tolerating failures to build with incomplete config would create proble=
ms
> > in detecting failures when the config is complete, i.e. in BPF CI. So f=
or
> > example if say a BPF skeleton didn't compile when it really should due =
to
> > an introduced bug, we wouldn't want to drive on in all cases.
>
> Agreed.
>
> >
> > However, from what I can see, CI held up well with these changes in pla=
ce [1].
> >
> > That said it might be nice to preserve a "strict" mode which fails when
> > we hit compilation issues etc, failing as we do today; I couldn't find =
any existing
> > general kselftest concept that fits with that but it would be valuable =
I think
> > if possible. Perhaps we could default to non-strict mode when a make -C=
 is initiated
> > or something like that, and continue to operate strictly when building =
directly
> > in tools/testing/selftests/bpf?
> >
> > I ran the changes through the usual workflow I use - build bpf selftest=
s at
> > tools/testing/selftests/bpf level and run ./test_progs ; no regressions=
 were
> > observed, so feel free to add for the series
> >
> > Tested-by: Alan Maguire <alan.maguire@oracle.com>
>
> Thanks for testing!
>
> >
> > There are some comments on sashiko.dev [2] that would be worth looking =
through
> > too, in particular the concern about O=3D and M=3D mentioned for patch =
1.
>
> I will send v5 with those addressed and possibly a strict-mode switch.

and strict should be the default.

Even sashiko doesn't like this "ignore all errors" mode:

https://sashiko.dev/#/patchset/20260406-selftests-bpf_misconfig-v4-0-9914f5=
0efdf7%40suse.com
