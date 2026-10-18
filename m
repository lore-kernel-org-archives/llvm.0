Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E6230BDB
	for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284055; cv=none; b=o8Cw+7XNIef65dDC3i1QAulOSD0928GIl0B8y1XPPrfCoVEIdMCt0KNUDrl6CaSUdM9G3bSCFbwCiRgqpkxLpyR/i6aSXdFZWtskOw53zuu0QxYXLA2XYHAX4TDSXOWEPtUPfh2F4CHsS29AK7/ZPiXlMoOdoNFbacBPBSBisKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284055; c=relaxed/simple;
	bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Rtfk0O/UaqwCUpisvJjziw6L5oETcCHKVFGXRqq7PxJA2dkw+GZhiVMMg0V/ZRuRJ2/yovOEl1CpDp+RWueSCO/cLbgijkIrl7etKEp/MuFEA02366T9XW8WL6DkleU9e8zX00YC7XNDYR5hd5q6pOFyDFpcOb1qwrHdRrdpzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/Q3Ao23; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/Q3Ao23"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so736083a91.0
        for <llvm@lists.linux.dev>; Sat, 17 Oct 2026 17:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284053; x=1792888853; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
        b=o/Q3Ao23XTTcDyNnBmG8L04jwPE383qXZluKS3K0W2VTikjqHaOjcrCV1bxcrSLdSx
         Dc7YdmR9r+lk9mhGB+9HKVGf5kJcoBF6LmkBAYzUu/9Qbhz/IbZhjd3uE98X9DEzI4eZ
         yb6hmEQpdtH6VHzvvYlox66zrgAZNnHKfy/RZCiShAXTy9IzehDFrcDliUBGFXNF3WMD
         oc/A8DN1gxY7yrUc89Jz+g9lQcHwehJZuW7G/bDNEwCP3ySaagaUQ1h0WC35Kx4XuQpf
         UDcujM/tJTizJDMwd7/KsRYRx5hltoqTHwWVyOHDzXCsrZc2tDbnSiFrUpykC7Eq/KaV
         ZXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284053; x=1792888853;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0QsVwqgiedVjJDg5PsW4oqHFzwpZoU7HJKzN5DEMq4=;
        b=JiSoAQMhs784ysexpEuTI1nSRbL8a1fP4tk+57ivyHt//72Rx2CRKtW7bYU5iBTWIK
         /ooGAfVQKdN2i7F1ECdydQcDHIe95qL3YYNC4Lsf47iNe7Rf+HKRxJVoKH02nHNd92f4
         p1Gj+MLLdjmhj/5MJOduDPszGFPwzDDXxyakZ1G7GGr7on9JubD6qvpRvlROk/GE5T/5
         sBMZAhSmqkyaDyAuV4QUKXZfzNkiQCASR0eS+RrB9S7pXWiGwmu5mI/2Umjuw3aicmLu
         ku1rUio7ssRD61/Hf0NzXDQXvl4MLelBTU/EvMvIYvzY8X12Fj2AnhAZi93vhx0HgzEX
         4v5g==
X-Forwarded-Encrypted: i=1; AKwUvBzRNF4k2juH7iT8K9lbzRzLQIIxjJX5YXmmafo5dlMfsg1BB6ydbmJDGmpodFWAelrRd98l@lists.linux.dev
X-Gm-Message-State: AFq9FYLojLYbimxU5z4DPl/mcyxX9YmbQxklBSK2yjJDTLrCscvTMyUK
	gEeUdCRIcKc2rhkQIoPp3Y5LFRXCCkThzo4mT785JuVz0ngyI//lqHOv
X-Gm-Gg: AYBFou1C4+Noyd/mUw6emm6wz5do2Qcs22jhUwV9pAhVcgcngedLAwAK9KnEY22SvPS
	KZVMjMzvayXaXIxPohZX0saqpaypj0Ye1QCcQ6N9jsGbivB81tafa2OQnw0SV8H8scttY1j+ink
	AfSxjW8H+6TO9ayPopdNhAGnt1w0488yxqlvVER8qSgUYcqZJjOweQQFidcdJtjaJjBr3EKfp1D
	F42jrNfxoL1NWwOG9yx8aZIfxk5TFWqqWBSfmrJU27wKPueRPVKw26je+ZjGvO0SGN/NXZr7DLR
	HhCwjR7rOPjVmVnA8vGijkkSx6viHp0OiAirJTIgl46GsBLJ5Xa9B3zN8O1s2osep1KhiLTc38C
	9o15cyjJw6OZ+amnTzz1Rul9wkq5KJQoRGUzX4VAkVoZqA4auD9bg26J1jYHayHlxndzMiJdP7H
	o2f8j10+ZSSxMNnc7xJ1yD3voaibiqVFQR3LFugwYfSjteJUPkJC0CQSg4IuHBLXtGqguzPZerY
	ozknsaZPFk2kUsnye2cx+yM20cuOwivqpNhocuCrGCDYtL65yAwUUzp5DiWGqqquavmo/8D91kF
	4QU=
X-Received: by 2002:a17:90b:48c5:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3acef4e131cmr2448674a91.30.1792284053166;
        Sat, 17 Oct 2026 17:40:53 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947cf9a5sm14830794a91.15.2026.10.17.17.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 17:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 00:40:51 +0000
Message-Id: <DM7JO6OZIF73.153P5K24I3ZWU@gmail.com>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <john.fastabend@gmail.com>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <shuah@kernel.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
 <morbo@google.com>, <justinstitt@google.com>,
 <donggeunyoo.kernel@gmail.com>, <leon.hwang@linux.dev>,
 <menglong8.dong@gmail.com>, <yatsenko@meta.com>, <jiangfeng@kylinos.cn>,
 <bjorn@kernel.org>, <puranjay@kernel.org>, <vineet.gupta@linux.dev>,
 <mykolal@fb.com>, <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v2 0/7] selftests/bpf: Fix selftests failures
 with LLVM 23
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "KaFai Wan" <kafai.wan@linux.dev>, <patchwork-bot+netdevbpf@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261014113043.640435-1-kafai.wan@linux.dev>
 <179211120751.4176565.4973025143783418812.git-patchwork-notify@kernel.org>
 <f77fd2b8bce1a029ac295b4482402a8c2203db57.camel@linux.dev>
In-Reply-To: <f77fd2b8bce1a029ac295b4482402a8c2203db57.camel@linux.dev>

On Sat Oct 17, 2026 at 12:57 AM UTC, KaFai Wan wrote:
> On Fri, 2026-10-16 at 00:40 +0000, patchwork-bot+netdevbpf@kernel.org wro=
te:
>> Hello:
>>=20
>> This series was applied to bpf/bpf-next.git (master)
>> by Alexei Starovoitov <ast@kernel.org>:
>>=20
>> On Wed, 14 Oct 2026 19:30:36 +0800 you wrote:
>> > Building with clang/LLVM 23 breaks several selftests. Patches #1 to #4=
 fix
>> > those failures.
>> >=20
>> > The following self-tests also fail under specific invocations of
>> > test_progs:
>> >=20
>> > - ./test_progs -t prog_tests_framework/test_fail -v
>> > =C2=A0test_prog_tests_framework:FAIL:skip_cnt_check
>> > =C2=A0unexpected skip_cnt_check: actual 0 !=3D expected 2
>> >=20
>> > [...]
>>=20
>> Here is the summary with links:
>> =C2=A0 - [bpf-next,v2,1/7] bpf: Determine freplace staticness from BTF l=
inkage
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,2/7] selftests/bpf: Fix stack_arg precision backtr=
acking log expectation
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,3/7] selftests/bpf: Fix stack arg pruning test JOI=
N log expectation
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,4/7] selftests/bpf: Use _exit() in uprobe_multi_te=
st clone-ed child
>> =C2=A0=C2=A0=C2=A0 (no matching commit)
>> =C2=A0 - [bpf-next,v2,5/7] selftests/bpf: Fix prog_tests framework subte=
st count checks
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/c87652656a55
>> =C2=A0 - [bpf-next,v2,6/7] selftests/bpf: Skip expected_msgs subtests wh=
en stdout is not saved
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/cc4b1c161d92
>> =C2=A0 - [bpf-next,v2,7/7] selftests/bpf: Skip compare_text subtest when=
 stdout is not saved
>> =C2=A0=C2=A0=C2=A0 https://git.kernel.org/bpf/bpf-next/c/7ebf808caa76
>>=20
>> You are awesome, thank you!
>
> Hi Alexei,
>
> I resent the last 3 patches in v2 and changed the subject, expecting v2 t=
o be reviewed first so we
> could skip v1. Sorry, it didn=E2=80=99t work. The bot closed this thread =
while applying the 3 patches from
> v1. Should I resend the first 4 patches?
>
> Sorry for the inconvenience.

Sorry. My fault.
Pls resend. It will be easier on bots.


