Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD535B14B
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151727; cv=none; b=otXhOo0qXeb9ByqqGC7yMKfV6IUbJVjA8rQmEprIA5jqHSBBe7SOC4ZqZQyCeql+30Ci4s4Ro+i3jqPxtGKAjH6JpE6Zccb2MAQtUEozM9BCkXhuzs5TqvkAPhQ5Hq8Y8PE+LrDWbEt+Bx3vAQ+Bibndku7GTu5F2rq6SYz4Dqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151727; c=relaxed/simple;
	bh=3HUrOy3HliEzxynSTd2AGPEdNfQmqeEcuJoORxQB0DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAjRAbUPAbYxVeqiW0r8mMOdqhBcrNP4FXY2+JukoXLtUg4V7vGnVeHlBEyJyMLzf6ddY+RaSy+usP62APKv3fx+lZjzYO48md3/ht3cCTjVokoqrsOVzRKapBkWvNASHhPOoJKo4laQTkkpFpugdUp4LnJuZ25tD3X5EBQOd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT4m6Y+I; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT4m6Y+I"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ece1102998so5807754f8f.2
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761151723; x=1761756523; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkGmrtBUxnIumAL8xu9/6QKpgwGH5LjIxRJ/PIq9w9k=;
        b=JT4m6Y+I8Smyna2Hrq05UKSGcFL2cZls0rpqz98Zv5oP/ge6REWIII6NenGVOviRUB
         zbo7RbEClCWO9iwRtHGIUdQVC2rZPyZXX5K+iZHbNIlLOxg6HJlqYdHHytP5pqlAld4r
         qPW1h++gBP4I4M93zBoUvn3Fjm587EUSpPN2J9X9FjHAdzUhQNNMHlX/dNKvWw8Telgv
         7LzfZZKcnE0fnA7PeCsHAn1b/slNLI+5GaCeyEGfJChSNINdjOtx8VtyU0xManZ/oQ8w
         CYY6EquY5FUDGZCPrTN5ik7wZhRSzBE5uzpDCnbc8ZoFj6moN0YmPGCDnFbaXpiw3DKl
         TotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151723; x=1761756523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkGmrtBUxnIumAL8xu9/6QKpgwGH5LjIxRJ/PIq9w9k=;
        b=aEji0vDAQL+GDBuoE9h9lymz4Cswvkt4ftDxQD936dsI9xPFHUu6AcxJW+eufxNrmz
         4QPRccTR+P9iMWZ6hgtQyMryYmn3YR11qbax/nbvREyrrxARjMfxJfzDTcDc416Spq1c
         ZrNcQUQiso2XE9L42iO4oVwwP/rkGM8yjpykiNNrFUB/t4PYBEqlvAnGp7HiZI7sxrdN
         1gO9/TuqOCIzoGbq1Q05degiVErq+BQ8omIoLX507gh+5GexlmE38tu0Fq0iirOg4oAD
         K/KzrEMyZriYITxkBxV9UIq/xacZI1OEGFHo967TYhU+XyXfVErG2vcvxd0nCRgp5Q89
         4qKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfqId0noV0tJ1k8dg30ghFJpfcEBcrkYDokAfEd5m5w91xoSgRwPMpbFLFwNyxpWWJhgEE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7XS2+qERFKx/ITC9ZgVS+K6k1G91ExMwKrYHfMQ9H17G81y5s
	AV9WYtbXQyYZ1mrbBttrFKhqV5vsPMrbI9tNxfW/Bxlrw7RXdqzcPx5HOYmK50t1mpup1KFWlFB
	ryH4DlEStqj6CnBxbpBU7wzk/Iqpmelo=
X-Gm-Gg: ASbGnctRnKRZEUrQoDCcHmsh58pgmg1f3RpnJNkzRrhUBOyePCsTHLjHz//rBakMCgB
	7T0T0EVvGFwCJVp+Wk7a5BwTVD/CTFGIwSZ7WD3Dbm2RhJ3SISrB5YF0lj/+YWLbwpITqLq8W0D
	94Eg/Ie3kCDCAI8XQNrOVVwO+GEJL4itmoU5w0fd3B2lwVEbWelc7sY+yGc9fip5vnUkX81Vbu2
	ua3JB2QAFgmjHbhI5oIEslNHZbYsUKkGjRpw30HpjdaOlrelLlgij5ZQ4pW7iw4w+dNxCjoCA5D
	ybZ6dIlrlJST9k7Rlpd7GKaydscI
X-Google-Smtp-Source: AGHT+IHGQIWEFvzltLOJQOUIBl0GmO2xOGuzPoNl+eqhJzTaJN/V9bP/9n1hi/0plGJ1ExPlMoQ5BrW5WAhxCBHLYSg=
X-Received: by 2002:a5d:5f82:0:b0:425:8bc2:9c4b with SMTP id
 ffacd0b85a97d-42704d83537mr12406127f8f.6.1761151722349; Wed, 22 Oct 2025
 09:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022071825.238909-1-jiayuan.chen@linux.dev> <6aa7fafd-30b1-4605-8b80-4a158934218d@linux.dev>
In-Reply-To: <6aa7fafd-30b1-4605-8b80-4a158934218d@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Oct 2025 09:48:29 -0700
X-Gm-Features: AS18NWDmayCCUbz8NqfwUZbauZk3a75e37wRBA-4fyqo7UIquVdyDsJAWiI6ZH4
Message-ID: <CAADnVQL7RtTFsr36hbT331X6XQHat4XKRcun=0e5jPohX+TF0Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1] selftests/bpf: Guard addr_space_cast code
 with __BPF_FEATURE_ADDR_SPACE_CAST
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:33=E2=80=AFAM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 10/22/25 12:18 AM, Jiayuan Chen wrote:
> > When compiling the BPF selftests with Clang versions that do not suppor=
t
> > the addr_space_cast builtin, the build fails with assembly errors in
> > "verifier_ldsx.c" [1].
> >
> > The root cause is that the inline assembly using addr_space_cast is
> > being processed by a compiler that lacks this feature. To resolve this,
> > wrap the affected code sections (specifically the arena_ldsx_* test
> > functions) with #if defined(__BPF_FEATURE_ADDR_SPACE_CAST). This
> > ensures the code is only compiled when the Clang supports the necessary
> > feature, preventing build failures on older or incompatible compiler
> > versions.
> >
> > This change maintains test coverage for systems with support while
> > allowing the tests to build successfully in all environments.
> >
> > [1]:
> > root:tools/testing/selftests/bpf$ make
> >
> >    CLNG-BPF [test_progs] verifier_ldsx.bpf.o
> > progs/verifier_ldsx.c:322:2: error: invalid operand for instruction
> >    322 |         "r1 =3D %[arena] ll;"
> >        |         ^
> > <inline asm>:1:52: note: instantiated into assembly here
> >      1 |         r1 =3D arena ll;r0 =3D 0xdeadbeef;r0 =3D addr_space_ca=
st(r0,...
> >        |                                                           ^
>
> I think you are using llvm18 and earlier. Why can you upgrade to llvm19 a=
nd later
> which should solve the problem?
>
> > Fixes: f61654912404 ("selftests: bpf: Add tests for signed loads from a=
rena")
>
> We do not need to have Fixes. compiler is also moving forward, we cannot =
support
> really old compiler and it is no point to have __BPF_FEATURE_ADDR_SPACE_C=
AST
> for really old compilers. So at some point, __BPF_FEATURE_ADDR_SPACE_CAST=
 will
> become default.

+1
and this is not the first time we're seeing this type of patches.
Upgrade your compiler. That's the only way.

pw-bot: cr
