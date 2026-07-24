Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE5744C4F7
	for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913593; cv=none; b=Y4vyjS/a94oUDq1Gw6DA+iEgN+HM8aigmhZm5dRpf909U4PqCrdHRHo6DC+KmlgYlr8W0yHKIfZCtDXuxwLg5IGpUXeiKa9sp24h1DXJqevv9+jCDGFqmuaaMbtZb4j3zoX2EBD7mZF8l8RQYwiwKUbWYrPGPZgXdVr1UFtpo8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913593; c=relaxed/simple;
	bh=h43OVubBFOUqhHHcp0LrQGUoL7yyuyHZKEUxyYWHBUE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MFkrrqa5WI4lV8Up9XTfKpRkRTARN6Ah65MbDCvgG1TpHDubKYjQAgpHUP0+TrAG7RhsecxXOkeoKh8mU4d59XzOsn/b1y3t75zgJkkk215wZebZHtzfLgoFxcFTZw1qbx9h3FboquW8KpY0XpbScYNUtE21qySneXZ+5W1JRbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzGYqGqE; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzGYqGqE"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-495459712d2so1878435e9.1
        for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 10:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784913587; x=1785518387; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KowxSJVmc3vRiPdHyROrkjM4WewCaL2j1J/8LxUkYtk=;
        b=EzGYqGqEuwHACHQQl19PyD5lbfoFHnOHrIT/zjd7UjR3gbjmQJMzN0z3JS8Dz4TfFC
         4GKZij5DlfPpQRuOXL/8lSmpHxoXYNgzF6fYFb9+wVj7bTu3d3PhAcXYiNrUCD1CQuoW
         ccpUNZqjvOglfTwxVNEJRpoxXd9wNH7NSWUK0idSyVJqP3SsAuUDlo0h5KgAl4Wkfuro
         XMAGudm96A0TbKJ7c8O2DslVlfnDIHW6iubYpy1GH17jTpaqwq9mfWFqXziZOSpMqAtG
         nP0alup1iD1ztKe/Hko85TMDl2rLRvp8462d3FHtQ0zsvKITocVxCXY5eY2YTljSPwmw
         SSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913587; x=1785518387;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KowxSJVmc3vRiPdHyROrkjM4WewCaL2j1J/8LxUkYtk=;
        b=G6hFW6pTo1XOvMdb9etD2M8/f12N02KG83NVOZ54+FbeUy5HB1RucA5t6GYl+pQ1o4
         78lbdBeg6d/kc+ohR/X2/yu8wCRK/hZYuyJEHQwpffQoExRG0Q1IvyY8pczkhY5OFLRU
         qFoNP8kjeTUM64WqgGAPb4nHJWSDOKOcbI16/18n4Kxm7lO3Zh0H7zAH+ggeser8eTko
         NFrUqi/Mef96bnSHb75PgF+H3LTz1C/msbN3X0Yh46JySCE+JRNimNPO5WWBaJ58vnW6
         1cNXAVrsrvRTjkScfqi0jXbCYBwPicqYm42LgiZtZnzVXV9Ickz+MWMCsw63llSpMUr8
         Uwfw==
X-Forwarded-Encrypted: i=1; AHgh+RrUTn5spwsjKv457esjQilZ6lER48k0xe2TFB5tzIw8U0ayYYxYZMI8V1d9qXo5nhUs4vHj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmze5XExLaqBDtYTZp6IxjQkWaQoZl4AZCO/yPIGZqVD3XZ9sF
	orkeMgY0oQrdV1kZRKMgV9/WKvfbgj+/bMynlceaklr/tdKAiWjEfBUK
X-Gm-Gg: AR+sD12TLirSk72wD60tzr2CI7H0N2sNgcwdnSPjfW0nZTUR7TkCJY0G0rcF3xYfxtt
	nTsLn5ZNGVEttRkZcTzFi3c2F3F8lA3/c+yVR4+y3aVTQchCrh8lQJEEWpD8fzmSlCWx0e208JB
	juxSHPReg6E1aZxE6MxL72bXu70ySyRZ/6robOgAt4xR7CBWXadcf/yDTjX4Rn9UMSbt3+gUjan
	vxyBBIGSRxJy1BcGvGypGqkQxlAUzlFePYdLK4JjdKYtzyLDXyeM0kRiGYX45VtaeHsFR6P7AbC
	ONjzgWoJCgnVsn8PCIj05EwsCd5PVe5OwYu0Hl6YhPssUjwRBhDZGjwhY2Fe03LC8q+YnYpzZf+
	sfoDUxLBPyh67orix4KtklGFasvLMSeqF7aRUtEIrctKrpPqfx50S4wcvZSU7dOMh+GEi+YJNOf
	FlXjcwX3ulToerlGWUf/fjvZTQ1HjABO29mhj/lsR1oTxkaH5kcy/GcMRDS3Mm9f3waKh+6pBnO
	/o+tXayeuTsG0PArqnOJY0AFr1lTzNpE+Lk4WwAZIZB
X-Received: by 2002:a05:600c:5942:b0:495:6397:14b1 with SMTP id 5b1f17b1804b1-49573cf0ec2mr67839245e9.34.1784913586592;
        Fri, 24 Jul 2026 10:19:46 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f5665f0sm49342725e9.0.2026.07.24.10.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 19:19:45 +0200
Message-Id: <DK6Z25AV02BM.3KXO0EMCMP2W9@gmail.com>
Cc: "Arnaldo Carvalho de Melo" <acme@kernel.org>, "Ihor Solodrai"
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
To: "Namhyung Kim" <namhyung@kernel.org>, "James Clark"
 <james.clark@linaro.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
 <algbxQAAmurxms8X@google.com>
In-Reply-To: <algbxQAAmurxms8X@google.com>

On Thu Jul 16, 2026 at 1:46 AM CEST, Namhyung Kim wrote:
> Hello BPF folks,
>
> On Wed, Jul 15, 2026 at 03:53:47PM +0100, James Clark wrote:
>> I ran into the build issue mentioned in the first commit, because using
>> an option like LLVM=3D-15 is a documented way to build [1], but only
>> some of the LLVM tools defined in tools/ support this.
>>
>> After fixing that, a lot of other tidyups fell out. I didn't go too far,
>> for example some selftests include tools/testing/selftests/lib.mk which
>> reimplements some of the LLVM_SUFFIX stuff, but other selftests include
>> tools/scripts/Makefile.include and I stopped before touching the former.
>> Some other non build scripts hard code toolchains and I didn't touch
>> those either, this change is only focused on things that already
>> include Makefile.include.
>>
>> [1]: Documentation/kbuild/llvm.rst
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>> Changes in v4:
>> - Drop "tools/build: selftests: Allow versioning LLVM lld", clang
>>   already picks the correct sibling lld version. (Sashiko)
>> - Link to v3: https://lore.kernel.org/r/20260715-james-perf-llvm-version=
-v3-0-8854bfe5af7e@linaro.org
>>
>> Changes in v3:
>> - Add warning for empty $USE_LD
>> - Use $HOSTREADELF in bpf Makefile
>> - Rebase on v7.2-rc3
>> - Link to v2: https://lore.kernel.org/r/20260518-james-perf-llvm-version=
-v2-0-f12cc4f031d8@linaro.org
>>
>> Changes in v2:
>> - Fix selftests/bpf build. LLD needs to take the full path to be used
>>   with -fuse-ld=3D
>> - Link to v1: https://lore.kernel.org/r/20260514-james-perf-llvm-version=
-v1-0-6cac1a9a4c8d@linaro.org
>>
>> ---
>> James Clark (4):
>>       tools/build: Allow versioning of all LLVM tools defined in Makefil=
e.include
>>       tools/build: Indent if else blocks
>>       tools/build: Allow versioning LLVM readelf
>>       tools/build: selftests: Remove some duplicate toolchain definition=
s
>>
>>  tools/bpf/resolve_btfids/Makefile    |  3 --
>>  tools/lib/api/Makefile               |  4 --
>>  tools/lib/bpf/Makefile               |  8 ++--
>>  tools/lib/subcmd/Makefile            |  4 --
>>  tools/lib/symbol/Makefile            |  4 --
>>  tools/perf/Makefile.perf             |  7 ----
>>  tools/scripts/Makefile.include       | 77 ++++++++++++++++++++---------=
-------
>>  tools/testing/selftests/bpf/Makefile |  1 -
>>  8 files changed, 46 insertions(+), 62 deletions(-)
>
> Are you ok with this change and going through perf tree?
>

Sorry for the delay, yes, feel free to take it through your tree.

> Thanks,
> Namhyung
>
>> ---
>> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
>> change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d
>>
>> Best regards,
>> --
>> James Clark <james.clark@linaro.org>
>>

