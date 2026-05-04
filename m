Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4EE3AA4F8
	for <llvm@lists.linux.dev>; Mon,  4 May 2026 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777903554; cv=none; b=WSpXt+ADqfv8qElNcOv7ZDYyokATAH9jwp86NeBwZ+DZZHhOfWhF7/EqWvlYIdnUW7kYH0Ibbx34J5stcPhIkVgtjSPyzoZA77EjtxIXOlSUw1Haxu8nlF27rVjldk1ynqp8bnXnc/g0hkRXIZZm/KGwsWSg4ynZiwjzGDMLIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777903554; c=relaxed/simple;
	bh=puUQpxpOOMqnVd2eFLdmJ7ba/xPE6klpnVs5liK0em8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=tMH0y5QgXhiOwBXHm3VUzKm7j1vaHMLfbzvzj/LGDoQjNMwYA8bjVLBfHekQ7NmDcYjCfhMP4jHXVJpsKrl8X3eUFpogsamtKrbjSNO8cYACEnEVLngELwkU7etq0vDIzWY1BppOPkr754LbuLgMxl3WvkzPDZD4umbXE6Btjco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f2rfhhy5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f2rfhhy5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so659031666b.1
        for <llvm@lists.linux.dev>; Mon, 04 May 2026 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777903552; x=1778508352; darn=lists.linux.dev;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxH/n2fmjxOiVX9boi8Uf5ZeGO40PmkXCnUi1eKqyXY=;
        b=f2rfhhy57/GyAfm5aMJWRrU8RtthzRQGGZJvxxwFGL45PWqwWsl5RO6pu07XIITzum
         gqs+4Xlxo1IjNcu4CA/pavt8yr8QeCKn0w+YCcu1E/V5rzXf0VifwdQj1ikVtBr0KnS5
         pbk0cDouHCFx2AuK2yBqbrGf835NAvAOMrVR1fdWmNHCCw8eyyNOPR1GFkedX5S4gG9y
         /uVHJA7/qO3a3RTSYT694/m9Or59N4zAU0nxgAY8TW2yjS5X1e67liRQBSauH7nEHfpc
         CAOItXTAPG85rdn5arZMoyN/IKHPsdHaEprfcEISMvvpetLjUHggkZ+/zFdlk1jS6Y6E
         4lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777903552; x=1778508352;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxH/n2fmjxOiVX9boi8Uf5ZeGO40PmkXCnUi1eKqyXY=;
        b=UH3ukX9RqU8GtqS1UxrU2nlswWtZ37RX4HN2eORFywfZ+GC++QZjBoz9m5gwLQL3W0
         HYpIJ5RFEcVaxPA70qJl70mOftj7rBhQeJsrlTD+klkC96P9GtG6N5gLJU/eaeY2XCFF
         SeDsmCc+2hRI7XSftZPUXB7LIGBL650PWURzv2FgsChKdkmQaWXkDae533MDly59V9Zq
         e9TBi0cK4rUPcTQaIAq/LRaidtmLksozZZVsp0KLXqefNpC2XDeU63iuRyoWVKie+wES
         M60CksD7aVVE2ciPNcnqKUeK2efA4StsEmxQYnG6+S88R0Fs9yvwM37ou6WuLeiTQ3tT
         elIA==
X-Forwarded-Encrypted: i=1; AFNElJ/H6fWR0CrP1MLDDyTfzU67fTEztyfhF0R/bez3BmHOVmstpu+0N+RmflEXmgoEZAkHSXKY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/ICEc9pw1VJWVu18YnWQoGgjO9f8bqFyuAkD+aldl6EPisoAq
	EKx04Y7lsixEP7ILXlme0fcyeKUF1+Q7oKfQj35tFD0WQoZvFl4LFuGORMQRE0MjsWo=
X-Gm-Gg: AeBDieuSmYK56CsyjVLHjG39/Sjm/zhleiOc7XWRV46X62A19EVIKlM6FDSXj7X5eWe
	JNo6RXX2RYNWgcYD51vqi2aJt+MQ/FXibpDt2pIVDKlqUt3BwbpZ9G9THeJRc9NlYfcHYF6khXR
	jxG2/wjf/ELUUWfEXkGpcW4dalPzrNFz52BdjCGXSXebv5p3+TTPgvTBwpoyCwgUG4+3CiEwLEk
	3us8ovDoIzsmXn2oPNKVqqjR3UGLltHNFMqIr8BWZtDccX7ZyBiuQgXr7GW6wVsRD6U6ztFP858
	dob0TqRopbMDZ4p/56HAf23u7vaAsd4lGWmIzpJIUWftn+me61c+0RMoUqs1lCgCnah47oq4zdp
	u//TF18komDCllANbRYdpnNyDCevqPHJ22BeB410hsZivhFS/58g2dUDmFyaF9QXO2Jfvzu2rbY
	/d9BeRXKNVxmeGAJWdL1Yf0Q==
X-Received: by 2002:a17:907:3cd4:b0:bad:d530:dbf7 with SMTP id a640c23a62f3a-bbffd6c43bbmr534556066b.32.1777903551577;
        Mon, 04 May 2026 07:05:51 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:1294:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ee0b24sm6221372e0c.16.2026.05.04.07.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 11:05:49 -0300
Message-Id: <DI9Y7J0BSMZQ.1JG02IF9PP4QX@suse.com>
To: <bot+bpf-ci@kernel.org>, <rbm@suse.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next v11 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <alan.maguire@oracle.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260430-selftests-bpf_misconfig-v11-1-e11f7a8c4fdc@suse.com>
 <62fa35211e90c3961079550e6b826dd1bee301e86838a03ab15cb0b4a631aa8d@mail.kernel.org>
In-Reply-To: <62fa35211e90c3961079550e6b826dd1bee301e86838a03ab15cb0b4a631aa8d@mail.kernel.org>

On Thu Apr 30, 2026 at 1:41 PM -03, bot+bpf-ci wrote:
>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selfte=
sts/bpf/Makefile
>> --- a/tools/testing/selftests/bpf/Makefile
>> +++ b/tools/testing/selftests/bpf/Makefile
>> @@ -44,6 +44,12 @@
>>  SKIP_LIBBFD	?=3D
>>  SKIP_CRYPTO	?=3D
>>
>> +# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
>> +# benchmark compilation failure is fatal. Set to 0 to tolerate failures
>> +# and continue building the remaining tests.
>> +BPF_STRICT_BUILD ?=3D 1
>> +PERMISSIVE :=3D $(filter 0,$(BPF_STRICT_BUILD))
>                      ^^^^
>
> The PERMISSIVE variable is defined here but never used anywhere in the
> Makefile. The commit message claims "subsequent Makefile rules use to
> make individual build steps non-fatal," but a search through the file
> shows PERMISSIVE only appears at this definition line.
>
> This makes the BPF_STRICT_BUILD=3D0 option documented in the commit messa=
ge
> non-functional. Users following the provided example will expect permissi=
ve
> mode to work, but it has no actual effect.
>
> Should this commit include the Makefile rules that actually use PERMISSIV=
E,
> or is this feature incomplete?

Users of this come later in the series. Kept as standalone commit for
improving readability a bit.

>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/251764=
31268

