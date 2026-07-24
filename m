Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3174756CB
	for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 23:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784936098; cv=none; b=rrVdEzxRIWO1EbOcB5Bjhuh8VMhxHCSRoGeRcn0HR9W6GRixizMytqiftgER8QMJifAZ0VILskJMEM8KjHcsQq3T/1z1uZ9fU4OOmhXhAD0sT064Ygcm9FH+iue7+t648Sxhgjj0xz7/4OZznzZIhSG1nbE52i1IYeJfuLyHzsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784936098; c=relaxed/simple;
	bh=CHOFKpN4PQ499iQVlSuJFWWe52WI91gJWBi9MYe+/Qc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Po4/pn0SwPk2g4fl9ABT7zO07nACUcn6DmpMpTNljWU5r86hjBg7GqVc06ayUA7IrKZG0Nb7MmwLWJQk/AIhwRacDyhY8QBAgvSP1unhvhb/E/IhSqGLtQc4m1t4VuU3qFaZcVDqa5SZv+fddGYCTM30PwXqBNZEDpT853vslrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyYvo/5E; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyYvo/5E"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-473913157edso401052f8f.1
        for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 16:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784936095; x=1785540895; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hD1qzOwblf2DhkJIDvNTeZ3M9SYqPvy616a9XPVmkaE=;
        b=KyYvo/5EFEjJjnbFSRGp0H0vmmqEY7xshAgB5eHUaMQh//SKGUd/UJEN0/e9l+bpkk
         vkGOHV0Wa051DKzAr1LVgZAzRG5eDJDfd2SE87YmUmyC5q/MuvamQe+KfH8Cifdo7gs7
         FPsCKV/Hp2EqpohxmSOymkTAAfFHidUMBjY22VTjl4NdsBCbgYwgpDrcHYjbJbX52478
         sYI82VqruxsuDXiMn62vlRT57919kdI+XD0iw8t/4D1StKbn5GHYYJUhAGf/fhl2aY1E
         SCJd3zcf2n18DwQDwwXelKY5KAwABf2gUBQ8GfQR9CEnn0Gk1w6Wse2AtWCkUzRZ3vC4
         O7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784936095; x=1785540895;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hD1qzOwblf2DhkJIDvNTeZ3M9SYqPvy616a9XPVmkaE=;
        b=RXSeF8JwgnQsWza0pH9IqAKN6F/wTpFen5KI56l2Q6VXIQAK74nUPAzEDDApJSGVmw
         x+zu/snRdqalLUCBoC4/bgj/I60SvhH4BtlNkGxIxxn2c2zfpAhDBvvaobwq86ylQ4yG
         PVtBNoAc+6+8Bkkt23/NzH8OOndJALO/HFMhkmYzBvLKiBgAw9AlnyKhhuEStVEJvX56
         scQ5+0eURQZb/12yj+udD69cWiPFYOPg73JWQql8nimFXh32kKA0h+Ny5OQPlow87qV9
         5pUjW42jjfQIoWRvuJ+dRMGerwOBrlzYe/CLXOHPi79yf6oLH3ruNXrINWh6kADt7LbX
         PJKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUH/t7Ekt2nNdhfr4Msz6bqxbRL+zSLyOU3LkNBjc/CNrLZcO2M7DGsqQiuZIEnb5o2QJv@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu3zp33fqWK3A0/4zX64wWqi3PRW4AXI6baPvAWR8ps0fjC8Oe
	gFBY6HbKUKXDR0paBXoJnmn/Is+VTfSHNWp4SacEDA547LRNltLQ0pev
X-Gm-Gg: AR+sD12PWrNNuJgs6QmtsHqe5GQP16mulBzNVgtl0EWMZfMfNmQF3/UFfP81tcwQi39
	hZ0OqWkplj8i4msQd/wjUtT2Cp5bj7N8hv3+SdJhT3o8OQIG39X6GgBTnmjlpLfIM3f3KxINdhw
	KJJhdEg0fPJ8ivKm7YLYOi3fP7Sh88qFflVxUkqlE1vXgZtlZ1dzlmNgq5is9Px6STWFzLGSpPd
	jv1aZ671Pe1OdJ1nUBnt1THfvgGmAVde+Lf+9nuisO0XNpazoZTHvlnxQbo5oi88yEGo8MLCBoG
	TWUMcJOcrhcwrE9TDRRuPOZ7qNcZEMEabUupX4WCN3og94FZOumQvX1OSbb3FKohOjGpmY55zXg
	SkoguHEjvuWlVtVefjkwN1p/UUtZYhasNoymPt0T3+GJXr+XfwHiboawWz9O9E6ZBWTI5v5dFc8
	VzgNdcNlHTfrPAhnnuY5HYpERUMYNav4Rsqu6/SCy4yCyou7POKa8GvXydSIK6dopd1CS77/xhc
	w7v6mClogjrk1UkoTpLCFr9v9fKMdDmeWkIwxFinkqF
X-Received: by 2002:a05:600c:1c12:b0:496:b3a0:1cfe with SMTP id 5b1f17b1804b1-496b56f3994mr3482295e9.12.1784936094864;
        Fri, 24 Jul 2026 16:34:54 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfe07e1sm75012115e9.3.2026.07.24.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 01:34:54 +0200
Message-Id: <DK771DKIJ0TO.1978GTUX7YMYC@gmail.com>
Cc: "James Clark" <james.clark@linaro.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Arnaldo
 Carvalho de Melo" <acme@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Mark Rutland"
 <mark.rutland@arm.com>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Ian Rogers" <irogers@google.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <bpf@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] tools/build: Allow versioning of all LLVM tools
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Namhyung Kim" <namhyung@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
 <algbxQAAmurxms8X@google.com> <DK6Z25AV02BM.3KXO0EMCMP2W9@gmail.com>
 <amP16I_cn58hhupT@google.com>
In-Reply-To: <amP16I_cn58hhupT@google.com>

On Sat Jul 25, 2026 at 1:31 AM CEST, Namhyung Kim wrote:
> On Fri, Jul 24, 2026 at 07:19:45PM +0200, Kumar Kartikeya Dwivedi wrote:
>> On Thu Jul 16, 2026 at 1:46 AM CEST, Namhyung Kim wrote:
>> > Hello BPF folks,
>> >
>> > On Wed, Jul 15, 2026 at 03:53:47PM +0100, James Clark wrote:
>> >> I ran into the build issue mentioned in the first commit, because usi=
ng
>> >> an option like LLVM=3D-15 is a documented way to build [1], but only
>> >> some of the LLVM tools defined in tools/ support this.
>> >>
>> >> After fixing that, a lot of other tidyups fell out. I didn't go too f=
ar,
>> >> for example some selftests include tools/testing/selftests/lib.mk whi=
ch
>> >> reimplements some of the LLVM_SUFFIX stuff, but other selftests inclu=
de
>> >> tools/scripts/Makefile.include and I stopped before touching the form=
er.
>> >> Some other non build scripts hard code toolchains and I didn't touch
>> >> those either, this change is only focused on things that already
>> >> include Makefile.include.
>> >>
>> >> [1]: Documentation/kbuild/llvm.rst
>> >>
>> >> Signed-off-by: James Clark <james.clark@linaro.org>
>> >> ---
>> >> Changes in v4:
>> >> - Drop "tools/build: selftests: Allow versioning LLVM lld", clang
>> >>   already picks the correct sibling lld version. (Sashiko)
>> >> - Link to v3: https://lore.kernel.org/r/20260715-james-perf-llvm-vers=
ion-v3-0-8854bfe5af7e@linaro.org
>> >>
>> >> Changes in v3:
>> >> - Add warning for empty $USE_LD
>> >> - Use $HOSTREADELF in bpf Makefile
>> >> - Rebase on v7.2-rc3
>> >> - Link to v2: https://lore.kernel.org/r/20260518-james-perf-llvm-vers=
ion-v2-0-f12cc4f031d8@linaro.org
>> >>
>> >> Changes in v2:
>> >> - Fix selftests/bpf build. LLD needs to take the full path to be used
>> >>   with -fuse-ld=3D
>> >> - Link to v1: https://lore.kernel.org/r/20260514-james-perf-llvm-vers=
ion-v1-0-6cac1a9a4c8d@linaro.org
>> >>
>> >> ---
>> >> James Clark (4):
>> >>       tools/build: Allow versioning of all LLVM tools defined in Make=
file.include
>> >>       tools/build: Indent if else blocks
>> >>       tools/build: Allow versioning LLVM readelf
>> >>       tools/build: selftests: Remove some duplicate toolchain definit=
ions
>> >>
>> >>  tools/bpf/resolve_btfids/Makefile    |  3 --
>> >>  tools/lib/api/Makefile               |  4 --
>> >>  tools/lib/bpf/Makefile               |  8 ++--
>> >>  tools/lib/subcmd/Makefile            |  4 --
>> >>  tools/lib/symbol/Makefile            |  4 --
>> >>  tools/perf/Makefile.perf             |  7 ----
>> >>  tools/scripts/Makefile.include       | 77 ++++++++++++++++++++------=
----------
>> >>  tools/testing/selftests/bpf/Makefile |  1 -
>> >>  8 files changed, 46 insertions(+), 62 deletions(-)
>> >
>> > Are you ok with this change and going through perf tree?
>> >
>>
>> Sorry for the delay, yes, feel free to take it through your tree.
>
> Thanks, can I take it as your Acked-by?
>

Sure.

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

> Namhyung

