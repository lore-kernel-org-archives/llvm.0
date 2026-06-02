Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A93939BF
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407265; cv=none; b=ORqiag4YVMqjiTm6+msdzKd/NQZ6Ftqs6bF4lnVOP3tWx+iR3v9VyFVcBBNfiCxDHQn0s/h2ab812ASPNPWiN6GaN+fT9quYQKgMLwEG3tpBamhnTFVSBH4miH9AIWyqpN2kLhrTfVQIW8MGW2b1GBIZq9p4ZzBy+OmtG+nZM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407265; c=relaxed/simple;
	bh=kBnX/+0c7ITyMO0P3knR00sfYCRT+0BHh1YQn7jrn64=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=JzgMbyOU8udSZxOZmAIte6q30NlOYxj6hhXlKP5gqx/7bbRJKPfZyllsoM/mszNSkzd3loheoDjNpgS+j9dhS6ibutbq0O0snUdBIe4WQil0ZgqP63bV44e21+a24hMr/DoBtNHtsHdExl4dR2CfcktA88KYAU1rVmfP7TFi/5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EDN5Tr91; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EDN5Tr91"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b3637b90so4842585e9.3
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780407262; x=1781012062; darn=lists.linux.dev;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM9eMUk/jCkJgL/kA3ALW8afdDw3W85juVsOkTKRsaM=;
        b=EDN5Tr91A3+rfaAUymTpR93ZOwDRvqWCVeZme+yxNS3nG8CJOXvVJhwS/x5SoeYz+w
         PA/xUkma96HsV3p37WXz3TQhsxyB9tFUIWq8L8QuQkECj3yDex+rf/ByxfrLJrhnvA88
         Tmx5Et8oa+5YxAz7a0OmBERFqM60IG7f8ix1fabZC0QtD03L5dRCFV6mu7AlXW3EJEXE
         4IAzyj61E+YaxlNT9WPfXpCzY2GJf5uslP29OYUfu8JxlCEwOnfbuicvtb9am0oLZ4k6
         iP8TC/Z3uxnbNwW8zuKhdu4pdsVRS8Cfp/d6mjDC+wSkUdFBHemNzcXJp7BjxYeRg4yr
         fi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407262; x=1781012062;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lM9eMUk/jCkJgL/kA3ALW8afdDw3W85juVsOkTKRsaM=;
        b=KsEK+0PEU4dwNagidKeMyjNSX7Xn8LGHutAEaupoFFx7V31WWVExvyiKl8YCTbdTUv
         SMTKkLUVaC3xKsjx+T/Y11htAiye61fKcHuK/qlfMTV/82OoVqYSFGiu0wXbtcs/L8br
         rPfXBY37gOXWDmW3rMhoir0H2LltzzpXBdB6JGTMroICSptTNXxxxn0XlzsJcgpYEUc4
         DvAQGYH/NCgZhjchEtUdhPtNCNukbLPhuMDG7+gtC9UvO5YNuGqfEjroatjoruPzC9F3
         P2FO/MnXsCmXZXn7TFKjCxvJHx8CSejjD2Gx77q/f9k678fHqMERFwryX/Em9RxmoAaV
         zx0g==
X-Forwarded-Encrypted: i=1; AFNElJ/mR5YjLRZpjBdKYWwxXMtoTNu+sOInEqoqjxSvBnO0fC7Gv+1LK+dkyglQvkRXx3+KtDdg@lists.linux.dev
X-Gm-Message-State: AOJu0YwRciDRrkUJc5xzccjWx9jR2kl/wE8H0WIQoCtK5OY29rE+4MOz
	taQr2B+lcK7krguf4CeBVoIwxSu4HCPtanYpPP9exvEmxBaIceUs4jdZo+RrnyN8Pb8=
X-Gm-Gg: Acq92OFNVfS/bCtq6X2GHr213PjaMn5D7UHO96JHPNHGtvH7DNNOWQO4/iQ0hTdW+GT
	r7Suf6bBONdm5BOK4FoAoz8hR5BC9AAs2HiAwtl7cH3tGTze/4f922JKsi+4EjYv2q4+IgAdKbJ
	i4kYaTNTGcEwBnZKN4cqMEpGla9K4WWglo5QCrijtmb28c7r/FF1KaF/bZJMkwJnN7NF0J7Wdkt
	b73ktYWcguHE/eK9R6Mh6ZwUvaXRjIwubKH/mkzYlHwTQlmQNWP8LRvUqDEyHBnFHRLatktPlKK
	90hSlq9jpR44XP7wYT1Pf+rhuhAqfjNmn9f36Z2iRXk8JRAmKDNrQeZAnyrdogk4rfxYd0YK2yi
	CXQTLJ9pSP0lB00BxlvNWGk3O4dJX67GqWqaGpi33lRRdhmZMbfBTcItVGDZjR/+gvs615XXx/K
	oZJNZyAKCCPqDptzagJ+Zq
X-Received: by 2002:a05:600d:640f:10b0:48f:f7cc:f6f5 with SMTP id 5b1f17b1804b1-490a2945b99mr208508155e9.31.1780407262005;
        Tue, 02 Jun 2026 06:34:22 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:2ecf:67ff:fe81:9da0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5a9d27sm11444232eec.25.2026.06.02.06.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 10:34:18 -0300
Message-Id: <DIYLP74JLI7O.11GW15J2LC01Q@suse.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH bpf-next RESEND v12 00/11] selftests/bpf: Tolerate
 partial builds across kernel configs
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Alan Maguire"
 <alan.maguire@oracle.com>
X-Mailer: aerc 0.21.0-146-g87073a0460e3
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>

On Tue Jun 2, 2026 at 10:02 AM -03, Ricardo B. Marli=C3=A8re wrote:
> Changes in v12:
> - Rebase from 11 to 8 commits: split the test_kmods KDIR patch into a
>   pure KDIR fix (no PERMISSIVE) and a separate tolerance patch; squash
>   the BPF_STRICT_BUILD toggle with its first PERMISSIVE user; squash
>   the four test_progs partial-build patches into one; move the install
>   fix to immediately follow the first PERMISSIVE user

And of course just as I sent I realized this was left behind by mistake.
This was scrapped and the series is still v11 :(

