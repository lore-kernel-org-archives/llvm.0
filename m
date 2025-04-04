Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313D74059
	for <llvm@lists.linux.dev>; Fri,  4 Apr 2025 11:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766328; cv=none; b=PMJleJqgSXko96JDXwfgkgWbHawF+tx2/CQwyvm6x2qujSKhnia9rPTrsShDOoIo0iq51yE1TKzLE07OI9Lu6vrrTUzSjosTc36xZURnN79NaR/e1G965XobUVr8v1yli3JqVXcEYtKGp0YTZjVIzo9ooLEveI5rcC/EwLAq1kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766328; c=relaxed/simple;
	bh=iV79T4TIS7cOv4/u7k4BmVbPmDbodUmpjPt2TauwF2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boaQZ4j46j20xe+UdsP+wHDVV0Q1fT2jhe83lb3ZYFpMYMpelUsZYqnLz+AUX9Ei4szP1GeaRc5kmlBZCbedyatiudCsSdZ5wq6NhUIJUEZ4DXzRR+UxAfI0ALeG03O+EMG1u8+XIlS23dz9IF4yXTsRCokdW+weD/fFt2hfviw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ULqQRFLX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ULqQRFLX"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2263428c8baso130905ad.1
        for <llvm@lists.linux.dev>; Fri, 04 Apr 2025 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743766326; x=1744371126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RijjZDsaeeNTq2WmlBYu7uyZvjnvz4x85cSTWjzFszM=;
        b=ULqQRFLXtA9xSNRVPIhu43PfmHOsEYZFNix0tXypvm8HIxIvJwH95bElvhU2hEoNxy
         7wJG6vMTEYUDc3ROZtE3XJr/Zo2rsx5p1P2yDwL3vuf41vkM4iqbuvo0EMq0KqRXRZFp
         lq59rKBVfkwu9fq5Ke2/uksusLsS+k3m5bHscTYupsxpyETTpzkL9kV+6A7+AvrEcq8J
         fQnpOsmTM0HBcY+uy603FLukAXdeRGaDH0US/lByhICigNDmOonuE9OKfG6b4NvO62zM
         3lj0el54BK7qXONfA8ZjiP8eWXNH+4HoL2cNGORYM01D7Mt22WWqucGonQEMjq6WAnkh
         0PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743766326; x=1744371126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RijjZDsaeeNTq2WmlBYu7uyZvjnvz4x85cSTWjzFszM=;
        b=iK2UZNnrjVl+SJqRjfFAwiVA4fikn7OlVUripMgB+fAHnu52LS6945ThXJBQVFgTnZ
         fn2S+wew209Uj/LgvExbXH1C4jkqwh6gj1m4zMzEhlzIr8Ya1z6v+DJiKwEdejtuh3Bv
         X04bjlNFRNLqqVEqF6EpTaQjyQmimXgkw9Cg6bVRQyrpG1YFdo4oaw9t/YOt381fAcI8
         cSgYpzqQ1Ecb2/j2GgUWl2V2Y12CFwawcWmIFuF6Y0dLqgvQSckyjm+sNTO0dtbaew5L
         nuG2+lKvqDpmHUnm7y/ZQQgJX23PCXp06Q0CQ7N18/VIRB/iXIoHQloDkESqnu5wqAzE
         bE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnzWITOX4K+5ggbXZkw6tvx2Rtwbp86wcJ5RQ7X5p7cnebhtGPtXvrOSuya1a27cIDKGqe@lists.linux.dev
X-Gm-Message-State: AOJu0YzOFSh9a1rgijRhpFNl32EXZmrcg7bWAucLvB3fUNi7x0o37T6Y
	csOvfo32Z1kTrbhGftYYV4kZIBddlGK/PgzFoqo6hh2YM+dROgx+qdKCSphO7kBRDqs7HvwPsLY
	gx3917L8RQLpDO0aZsa8WjZOaaqxQ98cFi6ru
X-Gm-Gg: ASbGncvG9gaECN6t7MpuVIAQwRCmsyhSIHDp+BM7tfarIGtvA2Olx2DIuOWBcRjISbd
	pM0JcM89mt3fGJKiJgf9Vz1tQvc4ACsyspqEwP+ygIDH3ZfHO7cl0usAPMzPdnfA19AkvHdNQM5
	D/rEZJv5CtcOYbIALT6gcShNWi0mI=
X-Google-Smtp-Source: AGHT+IGtSJ5SCCsYoTUAusjQhkTtvCXxx/icdtTSnyDn15jZiHl4dIt2xptyi2fH7qclCUKpPalNWXHp8B5uMQxIc1Q=
X-Received: by 2002:a17:903:41cf:b0:215:f0c6:4dbf with SMTP id
 d9443c01a7336-22a89ec5649mr2603845ad.14.1743766325853; Fri, 04 Apr 2025
 04:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com> <20250403165702.396388-3-irogers@google.com>
 <dbba94f1-27ee-4344-b4b2-d8dffe6b7d33@app.fastmail.com>
In-Reply-To: <dbba94f1-27ee-4344-b4b2-d8dffe6b7d33@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 4 Apr 2025 04:31:54 -0700
X-Gm-Features: AQ5f1JqEV-6ruf3kqDyuUQ7sb3lFX7gx5YYcyalfhzJL9r3U6Z0Ij2NtKCDx8-c
Message-ID: <CAP-5=fWAiLe8=zXvh2vtyhSAh+R-E89fYkdsVbb6PDALurW97A@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:49=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Apr 3, 2025, at 18:56, Ian Rogers wrote:
> > The clang warning -Wshorten-64-to-32 can be useful to catch
> > inadvertent truncation. In some instances this truncation can lead to
> > changing the sign of a result, for example, truncation to return an
> > int to fit a sort routine. Silence the warning by making the implicit
> > truncation explicit.
>
>
> >  unsigned int bitmap_weight(const unsigned long *src, unsigned int nbit=
s)
> >  {
> >       if (small_const_nbits(nbits))
> > -             return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
> > +             return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK(nbi=
ts));
> >       return __bitmap_weight(src, nbits);
> >  }
>
> I don't understand this one. hweight_long() and bitmap_weight()
> both return unsigned value, so why do you need to cast this to
> a signed value to avoid a signedness problem?
>
> hweight_long() should never return anything larger than 64ul
> anyway, which is way outside of the range where it would get
> sign-extended.
>
> A more logical change to me would be to make hweight_long()
> and bitmap_weight() have the same return type, either
> 'unsigned long' or 'unsigned int'.

I don't disagree but the scope of that change would be much larger.
Yury has expressed concern over needing to update printf modifiers. I
was aiming for the minimal change that silences clang's
-Wshorten-64-to-32 warning.

Thanks,
Ian

>       Arnd
