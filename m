Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0A1336882
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478619; cv=none; b=N8bzacd3W68U5omXR3ePLNJI/qv8rd0TYNMLIvB7c3lv+0AD/ogFAaVm/aGleYfjGJhZsvn1sMg6N/O345+vLqqx72VPgHDH9f6bnb4U4e+y9i4UduL/tmbodZWZxAZn2V06jPjOwwkBPq79LnP2BgrJYyJn6HLdSBvS5iF55hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478619; c=relaxed/simple;
	bh=4otVRaVKmDVV4/O4BE0KFa2jpoEw58ZmDu7MeQsTvB4=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=bvUStasJJEJB3TJYdabCRMRiMJwhBv/Tkpr+mLz7YtcEyLRWhpz6E2pBIBaz8u9wI8Rxv78W2daV2glb/becZkVfD6wZuOuj42oUCLqOX70j/8ZdTcE8Tsh8Bg+ubnJk8gqg8ysFKRfNd95iwfTsimSTTpzyQvwnqQo/WPdkb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZHKZjSjR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZHKZjSjR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bba0dde4f43so79338766b.3
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777478616; x=1778083416; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :to:cc:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQoksUSIcSzVndlrAhch8qM9tnBx+HVtwROp5qwoxAY=;
        b=ZHKZjSjRiTCG1GzgnrWyNqUAzN3CyfXU0XuX7yDY3U3Msv2ZEC6UOcpHPW+IfQjXtp
         tMCrE7ENxOt5z3AidPOR07Z+/E1tqf566y4F7+jscDqH/4A4QJxEX95Y3xBFPAvxxCeE
         1JUuCxvpHrfs+1hg+8mV/wa7jK1xGY/RkpqdAC3hTAmpUTwunMYO+Y8B5aLAdXyG7cpI
         sDtHUZQJIAmshZM2HYukk2UirtEeTiRY2s4djnHdS0YHFDE/YK38AVXvcJYoDEaZ+mm3
         Fq9n3m6wzWPN6kX9yrQ2OCFfH/KnULE7su8Chd+/YQ6oHYUI4avPQLbcO8vlMsaaJt+T
         oBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777478616; x=1778083416;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :to:cc:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQoksUSIcSzVndlrAhch8qM9tnBx+HVtwROp5qwoxAY=;
        b=gscrQcbH4VJtHJsm5WTeqhwzI5UFm7tRDSGOvLOH63Od5Gk7mlacJabZ711kglgvOz
         rJUPGw3lRvlfpbjEDo9QEftjopoimqDkwvl6q5W5KTh6lJmIBGoAZ5V3ajDhSU6WMyqK
         ZSN2ZzeK8EZ/9H0l/udzfH26aTI1Hm2RJ6g3Izh/ZBUBAKYsKw8B+IijeLd/Yd9nFl6U
         KMN0aGvRp1lWE/fToKLPMK8CPQ4raVrX/PuP2/XwtX3xIaQ5lQiQyqPU7+i0q99dn6M/
         zPGo8ZzICHQSFiFbKzET1361Sk+R2025Tz5qH8tX7NRlOtwPuDpnMRLpBlK42uXoEQut
         AxIg==
X-Forwarded-Encrypted: i=1; AFNElJ+nD2E4Mn6uAT8bUd1cPPkBuLhr+sf3YPyN4j+sJN4RBioIUxpdUQkYwJqUuSX4U9KSBhoc@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7Wvd7lsa4Qx204wUDVamRx89u78CsMNYoiTkMy3ESFXCs3ImQ
	kdr4rcfmfe18hhhuD184Xw6Qq7qbqq5lOnD5SJPkWuNaYK71qSjyIg0dYBBuI20f0jY=
X-Gm-Gg: AeBDiev6rxgqxs6O3L6dPOFsQrSTAzlaUtQkLUcAoZtBGkgJxuWGFhJnBd6Zpc4mt9B
	JMiWgaYSN+OUlkPEGPCY+cnwHbm6QvbKxlqzuq9VOmTreOlVhlr+e4oZGSlnh8awvSy9bWhrT4L
	qQYPJ1bDQVonbdcD+2AJCrp4AP7YvsYqzjfBXQeYiiqNbk/T+2YdG+X7Tqi7PKD57/M9fzeRRiN
	E4FK8aYlCYmN+muxp6o+FZneoRi7ngM4qLEjKKPpysUZLg+qBKU3+smZEz/D1GfCuOD0AgACJLx
	lViFUon34LGqIdAm8vpDdjwA/5rjwZEGEBHb5nhfkN/vpoeCTIHio8dxSZYVBEHZA9NhdosaDFO
	S/kUOKn3VY11Ast8YMSzg0D20U9SihETJTjD4Ql4QNrjooRnRDa1G9gKih+4s+8tGJgU7QsEib9
	GhOjITkyXngXVXzhqAVJuiVg4=
X-Received: by 2002:a17:907:2da0:b0:bb9:374e:f96b with SMTP id a640c23a62f3a-bb9374efc9dmr285870866b.12.1777478616083;
        Wed, 29 Apr 2026 09:03:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6298433531bsm1276228137.9.2026.04.29.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:03:35 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 13:03:33 -0300
Message-Id: <DI5RKYBPGRCQ.1O50VPXB7QXQX@suse.com>
Subject: Re: [PATCH bpf-next v9 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <alan.maguire@oracle.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
To: <bot+bpf-ci@kernel.org>, <rbm@suse.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260429-selftests-bpf_misconfig-v9-1-c311f06b4791@suse.com>
 <e020f5f82d86e5da292d0ba7b1d707d5ce47f741fd77019d209853b8b7582816@mail.kernel.org>
In-Reply-To: <e020f5f82d86e5da292d0ba7b1d707d5ce47f741fd77019d209853b8b7582816@mail.kernel.org>

On Wed Apr 29, 2026 at 12:13 PM -03, bot+bpf-ci wrote:
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> index 97ee61f2ade5..6094fe99b5f6 100644
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -44,6 +44,12 @@ SKIP_LLVM	?=3D
>>  SKIP_LIBBFD	?=3D
>>  SKIP_CRYPTO	?=3D
>>
>> +# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
>> +# benchmark compilation failure is fatal. Set to 0 to tolerate failures
>> +# and continue building the remaining tests.
>> +BPF_STRICT_BUILD ?=3D 1
>> +PERMISSIVE :=3D $(filter 0,$(BPF_STRICT_BUILD))
>> +
>>  ifeq ($(srctree),)
>>  srctree :=3D $(patsubst %/,%,$(dir $(CURDIR)))
>>  srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>
> Multiple reviewers (Sashiko AI and bot+bpf-ci@kernel.org) raised a concer=
n
> in v5 that when permissive mode skips building .ko files, the
> $(TRUNNER_BINARY)-extras rsync target will fail fatally during out-of-tre=
e
> builds (when O=3D is set) because TEST_KMOD_TARGETS are included in
> TRUNNER_EXTRA_FILES but the .ko files were never created.
>
> The rsync command lacks --ignore-missing-args flag to handle missing file=
s:
>
> tools/testing/selftests/bpf/Makefile:$(TRUNNER_BINARY)-extras {
>     $(call msg,EXT-COPY,$(TRUNNER_BINARY),$(TRUNNER_EXTRA_FILES))
>     $(Q)rsync -aq $$^ $(TRUNNER_OUTPUT)/
> }
>
> According to the v6 changelog, this was addressed by adding
> --ignore-missing-args to the -extras rsync, but this fix does not appear
> in the current commit. Does the rsync command need --ignore-missing-args
> to prevent 'No such file or directory' errors when .ko files are missing
> in permissive mode during out-of-tree builds?

This patch only adds BPF_STRICT_BUILD/PERMISSIVE variables. The rsync
fix comes next in "[PATCH bpf-next v9 02/11] selftests/bpf: Fix
test_kmods KDIR to honor O=3D and distro kernels".

>
> Reference:
> https://lore.kernel.org/bpf/20260415211828.BFAFFC19424@smtp.kernel.org/
> Reviewer: Sashiko AI
> Date: Wed, 15 Apr 2026 21:18:28 +0000
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/251156=
89001

