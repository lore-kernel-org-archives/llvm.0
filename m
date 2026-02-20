Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709DA3659FF
	for <llvm@lists.linux.dev>; Fri, 20 Feb 2026 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608757; cv=none; b=do8TdGjgc96QRtrR7yCY1whQlSpHcMiEY6zT8DIDRLAWd3DhiZZJKCJMLE7tG63y0gy6Ah6xa+CrQi1AE2c9sg/AyUrKcwoahrziPDJKv0+PtXQN9zBDFp3Jjj5+7sAH4L7lKcN8POK7NOCJa3pnrEWo9P3w3DVCbQ8DZwd0f7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608757; c=relaxed/simple;
	bh=W1JRdh80NWjdF11Um7td9iykQID8FxM/VZmtOgW1UoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jMVJ9/GYfDjfAmmhEk8cOwHXuWBQPc4CCqEaTgOqZfh9E3fXOG1b48p3ymP1mtaaM45RRwTsSESa5xYLBmstjZrq6lqJUr8c8sHlPTPp6wsPTDQ6SOOHKnEPFh1vZXezkQyGpkmjlDs0tn5Wo8UHLE3uKiPa5sXSb0M8RkDBFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZ+9ytPi; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZ+9ytPi"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a76f2d7744so25471595ad.3
        for <llvm@lists.linux.dev>; Fri, 20 Feb 2026 09:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771608756; x=1772213556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onVkE6V+AcjuNo4zB3rjSlYJ7NJfRJxk0ClpAWsnPUQ=;
        b=eZ+9ytPiVx3hvUos7XHu69ny9juRL9YWgstsvzKSrAn1GRMwwduXcJOM3w1btfoVxw
         14uKFzkSrEt5zmRskLd8zSz6a+q2jhCsI+4hUIJaL/g9yQAnhvI8odEicCLdUT6UtHX+
         vEW6vf89HRWU57341SNqP3/OHXrZ5lOqe5iU6f9UcbzqgZ+cooV5iJpIBmE5ittmK/jt
         q5+PFcgLUpwcIO4eJd9KiZpNMQTk/D7XFDUMx81fKZMk5G+5Vv7rb7V2nkP+C7ctes0Q
         WeLyapdlugoSNYPzhJdhFZSrnZuYTnwlAIF6lXYfI7pePRq5mL0x0dq9QK/Zus4LhLNM
         7eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771608756; x=1772213556;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=onVkE6V+AcjuNo4zB3rjSlYJ7NJfRJxk0ClpAWsnPUQ=;
        b=pU9zL9GHA16ncSSE5tIXOCuBEB2f7eNqyXuSUKGs4fw4FW+t1c7vjqmmijcl+wjLDK
         BGN2Jd8EtiXlo8m4d8eiJfDeGh0Xps5s+5fVO+K43aIAzNStrNnqRb64/l/5PDdOx4ge
         ZuEsRages+l88vh216N61WxXvInx0KCT2qlinoSQf95q3BgDIh1YHADk34AC9vKM2ios
         5LCa+/56t523W2hm7Kl7XlcrjBxPx1ZzITbnYOH1/OkhTgYTbHU50YzK8umi7SzNjOym
         XUweEAZ+DvSp5+6Lb/scsWw+VDUfl/9gqlolUjH777K302+WFl4ScBvp6ebN5lEsG68A
         DGUg==
X-Forwarded-Encrypted: i=1; AJvYcCVeyYGCsCxXj9uA3AvaUlXzKUjeGAZhJujO0QoNXwxhu1cIhIYD+55VukRkSJXFAICV5WCX@lists.linux.dev
X-Gm-Message-State: AOJu0YyBolQ80SeqQmQ3UUiOjb9geWqviBiZntzN02QRYGM5AMmuaJaI
	qdYrdwUW3o8rhlyb5/n1oMGsOuz2e9H5D86SW9JbjtMOfalZNlXchq2kZyqrDnq8VSLKRiZM/RC
	wYbO6iQ==
X-Received: from plhz1.prod.google.com ([2002:a17:902:d9c1:b0:2a9:1508:533a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a03:b0:2a9:104:795f
 with SMTP id d9443c01a7336-2ad74531fd5mr2612385ad.46.1771608755709; Fri, 20
 Feb 2026 09:32:35 -0800 (PST)
Date: Fri, 20 Feb 2026 09:32:34 -0800
In-Reply-To: <437EC937-24B7-4E69-B369-F9FAFC46F1B1@zytor.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260218082133.400602-1-jgross@suse.com> <20260218082133.400602-10-jgross@suse.com>
 <aZYoUE7CmrLg3SVe@google.com> <e05a65a7-bf8e-420b-8a36-2d76e56b43b0@intel.com>
 <d622a318-f7f8-4cff-b540-38d159ca87f4@suse.com> <437EC937-24B7-4E69-B369-F9FAFC46F1B1@zytor.com>
Message-ID: <aZiasvKpOHSaNuQ5@google.com>
Subject: Re: [PATCH v3 09/16] x86/msr: Use the alternatives mechanism for WRMSR
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: "=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=" <jgross@suse.com>, Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026, Xin Li wrote:
>=20
> > On Feb 18, 2026, at 10:44=E2=80=AFPM, J=C3=BCrgen Gro=C3=9F <jgross@sus=
e.com> wrote:
> >=20
> > On 18.02.26 22:37, Dave Hansen wrote:
> >> On 2/18/26 13:00, Sean Christopherson wrote:
> >>> On Wed, Feb 18, 2026, Juergen Gross wrote:
> >>>> When available use one of the non-serializing WRMSR variants (WRMSRN=
S
> >>>> with or without an immediate operand specifying the MSR register) in
> >>>> __wrmsrq().
> >>> Silently using a non-serializing version (or not) seems dangerous (no=
t for KVM,
> >>> but for the kernel at-large), unless the rule is going to be that MSR=
 writes need
> >>> to be treated as non-serializing by default.
> >> Yeah, there's no way we can do this in general. It'll work for 99% of
> >> the MSRs on 99% of the systems for a long time. Then the one new syste=
m
> >> with WRMSRNS is going to have one hell of a heisenbug that'll take yea=
rs
> >> off some poor schmuck's life.
> >=20
> > I _really_ thought this was discussed upfront by Xin before he sent out=
 his
> > first version of the series.
>=20
> I actually reached out to the Intel architects about this before I starte=
d
> coding. Turns out, if the CPU supports WRMSRNS, you can use it across the
> board.  The hardware is smart enough to perform a serialized write whenev=
er
> a non-serialized one isn't proper, so there=E2=80=99s no risk.

How can hardware possibly know what's "proper"?  E.g. I don't see how hardw=
are
can reason about safety if there's a software sequence that is subtly relyi=
ng on
the serialization of WRMSR to provide some form of ordering.

And if that's the _architectural_ behavior, then what's the point of WRMSRN=
S?
If it's not architectural, then I don't see how the kernel can rely on it.=
=20
