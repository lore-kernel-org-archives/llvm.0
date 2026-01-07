Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045934D4EF
	for <llvm@lists.linux.dev>; Wed,  7 Jan 2026 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810353; cv=none; b=A7E+rflglMMidUMw2GtDcsGUyu8QQDRabGTntgNALqDoHfja095Z/gVUEghLqJkm1QpgD2KgoOUfbVMgwQluAHHO85e/R/i/dCmpCpIYXSljYaw31yldxy1fDkR/xHeGpy7Zeca713YeEO0M4okwCyodwzF+OZ3zuBFVD3lH98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810353; c=relaxed/simple;
	bh=ybEPjNiCcRdCpRYzCY5DgOBnbB6QnavjJa8i03eIIHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXR4i2BCj71/cDsK//8Cm7I6RXe/73bRIH29KmsSpsGXVDpp9lZvr4cpeP3GjGQcILsPWJSBoXyYtET4LhEMFX12QPVTH2TmdtcovE/OedSrfKN1uD9Jyl80TPxKrpct/b8SMDEm4RXBJCJOmvMQiSOuxro3OuO9SAL1AOrlVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYIyHpT6; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYIyHpT6"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-121b14d00a5so164529c88.0
        for <llvm@lists.linux.dev>; Wed, 07 Jan 2026 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767810349; x=1768415149; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmfEsx13S+5kgIulBTXHS49So/qNF3mV7k/YhgXr2wY=;
        b=gYIyHpT6GUKcQiBajHiA2uGX92irY87nfBaj5w7z/dNAaAAlqTUk7NS5DJRcqgMZ5/
         T5/dZES0g6U1q1v5bLTWDUO1h1rEPDSdKgxxkgY/UJYTnMNbVeUYmwLViore3MhX0ltJ
         QzMxyZUoF4WR/Y3RxAfM0jstcarG1fP1b1y1vj6W3SYwCNACKxtufB9BUBYYzFzJX/Wz
         k1Q3m0e/eKASnfG0cTakkedey10yRv2tBHyA5IxtjW1Bi9QlUtZ35aWuWK66St6F7NZZ
         SOO2xHdW5Sfl/Ym5fGVTrDKqC8lX1yrhyMfz6bLMhUjC34Gf6Q8BeeBB8IT+tuJ0lig3
         gyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810349; x=1768415149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmfEsx13S+5kgIulBTXHS49So/qNF3mV7k/YhgXr2wY=;
        b=Y+KC4NitfO2MRNIGOHfmMHbpTscBgJ1tMAvIG8l/1dJ4SLLBFiw2uSbXF/7nOwcZh0
         bSCwKrQHo0DM3LZLJSzQgEJ5r/+dgi10zZJrtOr5YwSmngQCLD6+w4wkPsshVVGCvntU
         fXhwz1sZ1anKzISsktNMYpZEnzvGKyDZLqN0DldO9chK22qQreq5J+vDxgIXXgJCs+83
         Ys7racuUonJpmK1NTZ6/FsE9lbrbVGjLfwyB2VgDK/rxbHyagbxk78q9BwEozoJiRhNP
         SvO/lWUFjPL7+keyDNW98hEH1YmdnHVEb+xslWRej2zJk0t0GFD9C9Pnx0reO17UnwJ/
         lLKA==
X-Forwarded-Encrypted: i=1; AJvYcCWJdHLJuPBM501KTH/lZnLR0/50uwifuBivtIpne3ud6UogLPo5elZDuFJwXZsuamSGhmb/@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr6B9YohgbZhpKm4AYIp0yWe8rZCF+QeUFK617VGs6pykuIbIo
	1eHP+UjvTOk/VyDNPntTonXDbh4My2F46QyO/Zrub0S/pcg5I5qlEOjxZtCnTc0Xiygs802FmER
	Jqk5JAGxir2CcD0lKldXmwLr/bdvlhZU=
X-Gm-Gg: AY/fxX4LdkbPh213ib4mAvzezGwTZtpu1Ahd248YYORwxEVVUiGo426jRnqR1Mi5nos
	mpfMI3uDMQaY8A+SyCLBK0Xd5CMrmZAcJEKdB6SDNZxGce2OvtRH9clGG4HkRIXS4A1XUi6NIA2
	BSqOVmZPGpCvu1X1UoqSBcsIl0S+Gk4UjtiX4hnZbwY+P9llyx+cWv/qIWfk7M7K6xV+J4wJcOL
	5VNAkOC+20qk2sw7HWX6oCIovkgxg1N67hK1yCwSSuYojFuErcEM6XTxfAF4Gh1qN5VRI2MRrsy
	ZyN56bANwP1hvlf/8Vqjmlv6LN8Avf03hbNGygYaVcYBJvQ/iQK9vGjxpOsfgOqEWMRV+NULHHV
	KSGN0BjPFdDr6
X-Google-Smtp-Source: AGHT+IGUDU/qL1SPLoEQWykHXJpeBGHaPkJcYB9RKlfTVR1z+y/ggYx5S8IleeGfmdBq1UwTKzePqZHdAag6kIsA54Y=
X-Received: by 2002:a05:7301:100f:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b17d30df86mr1335115eec.4.1767810348898; Wed, 07 Jan 2026
 10:25:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105150106.567830-1-gary@kernel.org> <aVvdt90YmhJz3i5i@x1>
 <aV4TkNE_hAyByISq@google.com> <CANiq72kUVvMznfFtcjks=0iJ7HE2uvCSyD-Xu5NV=_9ZykVXhg@mail.gmail.com>
 <aV6kcMzcwF0tLpgt@google.com>
In-Reply-To: <aV6kcMzcwF0tLpgt@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 19:25:35 +0100
X-Gm-Features: AQt7F2oz7iCeRNKU58YjiBKyOfwUd4yNEZcp12hZyyVHQKijn8HMEt2KMzBLias
Message-ID: <CANiq72kgcv4PBBD4hiA5Z0a4J9g3uSeeM=n0cu5efsCjuaxyvw@mail.gmail.com>
Subject: Re: [PATCH v2] perf symbol: remove Rust symbol workarounds
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 7:22=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> Yep, perf userspace can be released separate with the kernel and it's
> recommended to run the latest version regardless of kernel versions.
> So from the tools perspective, it should support any kernels.
>
> Thanks for your work!  I think it should be fine once the backports land
> to distro kernels.

Got it, thanks!

Cheers,
Miguel
