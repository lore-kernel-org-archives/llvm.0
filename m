Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A51632E5
	for <llvm@lists.linux.dev>; Wed, 13 Nov 2024 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731516220; cv=none; b=IeAPPvEb5uY23rFHiT49HGkvanWmAyBM0waPKMImEubgR/rNj+HuSXnqnBVUX/i6imYDyXPn38twOW7vP5tKJfhna2oGkcy6tAInSqV7b/Mha+CbIa/mLx3kCfUIG5K6FueYfHt6QUgj/1HB25RbrwTfJevmRg/7ANIttFTGV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731516220; c=relaxed/simple;
	bh=IX6nwl8S1cSqdlF7c2ZuCCsJWl3Tq/Vv9oqWWKwj2sE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuVwrDPXGKYBrmkl+1I6GlICwh/u8qySImUDuQ+dlTLCLXg6cUJO5Yb7NFgl3KP3yz/9DIIu0E7EVh335CNzeGvvDLZA/5GZbfkl5yPA48uwNDUAuiMDCc5CvrY+8tv88myT3wiUKlfRh/+zUizSQeNubJy7ayttJGHP+y20450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=buk0BbLO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="buk0BbLO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cf6eea3c0so68744515ad.0
        for <llvm@lists.linux.dev>; Wed, 13 Nov 2024 08:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731516218; x=1732121018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgPHRZzhn/BgFJQ3GQ6/XKSU53FzjUunIQ5VJWFDlTQ=;
        b=buk0BbLOTAKrimS4dJtLvCAPEHAmqvCgMhgwgcjgA4rL72yXZaimuF1kL1PXUD/1ry
         q2+teB29tXSCggVWTSHi6/PP76e+maZmr6vHgH8uh48m7nQKGWG1yTRvqtd0hE9RLcPP
         oezib7nn0aMBkXHdU2SeJlssMkGLb1dc7AV6lmnOza0rxco8Kzq5elkPqG4Y7qWO6WUS
         esVJR/svgZV/d3LH3pmcfkSroTSi1Mx8RNMXuTIlln/3lZaDSyM8GEFeZsF10w7Uw4pn
         6Il6Wv1dxTHg4+GO/WfWiRDeFBS6oE/ZK81AeCtAXjM01yHYlKu3UG3tO3/CdkWLkmzO
         N7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731516218; x=1732121018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgPHRZzhn/BgFJQ3GQ6/XKSU53FzjUunIQ5VJWFDlTQ=;
        b=nktehA1QwQADmH8o2m3VMiOw5KP+5xhyfxPQoptUduJtSdBa0GpWG6JuEweNS//mXW
         jQdmdpCoJ6TlwAdpv4XvrVkOP0OpktJX5BTPQQjEWGi14hZHgTwCPA8CsJ2AMkSlV09C
         7O7otfPydRz3VMIRiV29StbSrqsE94kISGn20Lmt5RiVVTzXVNaqopgycsOvjFPiO5Q+
         J0yiuz1ZjY6OM7QzSZVKUa8dRvA0vheofnGexQuR76TUTFbGTdWH2gVp+xuK/y6LHGHh
         tFBg4cUO29kuaihMDQRNiSVYAcKVhrrMCxfpzj7KSXUNSAmqkFc+DkCF80rkPbebhJpo
         hhAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJiOvNlgswbHqEV4WXwtV3HXjMtSEjhhnsUrPetiYSj8XbPt8YW+gYcRHjOt5yUjUzSWGl@lists.linux.dev
X-Gm-Message-State: AOJu0YzNPYFIthuyQfOGThK95wTCdIgZWo7suiNrbWpHqxVs4cxhf1/m
	1tDtFlVRxaoF8HLdO4g6h5CTvFg/tXRALqoPftDQMJaXKjkzROc5msZQnjhMktYy1FL1B6c9+Ol
	78yAxJ5Krv7zVabWStHhDqJstD97Tbf6JZkFc
X-Google-Smtp-Source: AGHT+IE5R5UwXWzDg5H/9eKx/xgIt+u3w4Tu1ahz06jOHoM94pkRh28Cbaqfknle8kqnX49/ySumHHSYecZw5UFsvwU=
X-Received: by 2002:a17:902:f70a:b0:20c:7509:d948 with SMTP id
 d9443c01a7336-21183517852mr278644275ad.17.1731516218253; Wed, 13 Nov 2024
 08:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241113041319.GA158543@thelio-3990X> <DS0PR02MB1025072B87B225A4A8F0953F5B85A2@DS0PR02MB10250.namprd02.prod.outlook.com>
In-Reply-To: <DS0PR02MB1025072B87B225A4A8F0953F5B85A2@DS0PR02MB10250.namprd02.prod.outlook.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Nov 2024 08:43:25 -0800
Message-ID: <CAKwvOdnWZZ9We85caDM7zQsrUeKhJ2v2xL8tJbjeVUEgv_vL9g@mail.gmail.com>
Subject: Re: allmodconfig link failure on -next (relocation R_HEX_B22_PCREL
 out of range)
To: Brian Cain <bcain@quicinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Alexey Karyakin <akaryaki@quicinc.com>, 
	Sid Manning <sidneym@quicinc.com>, Sundeep Kushwaha <sundeepk@quicinc.com>, 
	Shankar Kalpathi Easwaran <seaswara@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 6:18=E2=80=AFAM Brian Cain <bcain@quicinc.com> wrot=
e:
>
> > -----Original Message-----
> > From: Nathan Chancellor <nathan@kernel.org>
> > Sent: Tuesday, November 12, 2024 10:13 PM
> > To: Brian Cain <bcain@quicinc.com>
> > Cc: linux-hexagon@vger.kernel.org; llvm@lists.linux.dev
> > Subject: allmodconfig link failure on -next (relocation R_HEX_B22_PCREL=
 out of
> > range)
> >
> > As an aside, do you folks working on Hexagon do any sort of validation
> > of the kernel and toolchain? I feel like I have run into a decent numbe=
r
> > of Hexagon-specific issues this year and I am curious if any of these
> > things have been caught by any testing that you might be doing.
>
> We don't do enough testing of the toolchain changes with regard to the ke=
rnel.  I think we have room to improve there.  I'd like to incorporate more=
 testing into our workflow for landing changes in upstream LLVM.
>

Build testing a few "blessed configs" would be a good place to start.
We spoke briefly a few weeks ago about upstreaming qemu system
support; that would allow us to start boot testing (though, we're
using buildroot to create small userspace images; we'd probably need
to look into hexagon support in buildroot then, too).  We're happy to
hop on a call to discuss some of these topics if you or the team have
questions.

Also, thanks Alexey for the quick fix to LLD!
--=20
Thanks,
~Nick Desaulniers
