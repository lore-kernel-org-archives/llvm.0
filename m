Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EA037B02C
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405159; cv=pass; b=ZtLiRdmeGPY764FMayPszHXfk4KP099WFq6qg2nupAalY7il8+65V05jBIbL/BqAlY9XNo7tDVndnuKXqcX0Df8N6zDfGGktHDGx7l6nNOTguaUt/c6mcag3a9+RSvOMoe7/raqfXh6cobGpo0nd3bpS+98Jz/sTQWQRQm8F6FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405159; c=relaxed/simple;
	bh=XcWV/jwv+DaFRFEPs3UtR5auo6Za+XnTz8JF7SS1gE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMGPQm5sE/Ikk9fT0NlobERte2Y7ZJKlNla5VQyHQzbbrB4g2MyWoSij9ukJiTkril3fLIlHSNSfBHhRVm9RhoVAbtlhGDD8gjqdylDdma34CWdMOihy2yK0NJ3Za2KI1E0LOYrEdDVUjdfAt93gpBoyINr2J8I2GFzvlUaQAbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rdTaGInj; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rdTaGInj"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6628cc1bd69so7197a12.1
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 05:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773405157; cv=none;
        d=google.com; s=arc-20240605;
        b=OS8aOunPs9geeBAzGfFbptncTw5/91mzRa/1VvFgPubd43n0TfW9K6wvUiC6KAhR8Q
         f4nbnBQ2nHFOKJBCYHS5J3VDIAChP6iE0uGrN25UYpH41fsu4J3m0oy3SA0BwVljweI2
         5tX8fLY3/cLqdHXV6WLLPL+UqUATc5FHi2QbWkdxeBvkfhLCkCyAbH3NzR+IatNNnL0C
         XXUD4wV5b8qrd0Y3wmwQe0rfw7MSeyTEnurJxVg0oa61t/P9huGvCB+V8be4hDG2eyVm
         XclnIovBudehnbunJwkYBvNMJSIcUJjC/AKFbXHphztEIXc8BF/+0Ja4f84CxECS09OF
         okug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9epzK3C05Aqic050HU4sGv3sK4NyLKb/ZPKh0TB3haA=;
        fh=W1FecyhMhI4nu7iCDrGl9E7O5MzTUAXxEUa4EeE8nKI=;
        b=hny3W/3vXBqR2y6XwnjuT5t/my14qwirlX2+hkpbJS85RGzBKMOLBcqRkzar4oPjf5
         TRP4nr4D/FSinXqxYMJpEowjd1F06hTJEIWcPguEa/obzr9uIFhUZPeK+T8rCZIylRC0
         v8oKrtbiK0Yk9RNyrFNkg3+jEPy5nj32ccq9IoSepA1mirhvFJj+fLHO97NLc2L5rp7V
         Y4o+GxFJAT2lBpD5cLPwjR+/YLiykULtJTg6fYXinBe6AUbPGrBsxlanoY/mMiQUxDCE
         jPpvMjpmw8SIpmYfCS+++2PIgYB9JO+22gAy+CkNn1rlwFq/RIpnIsI2Xo1Fwpt41556
         vBhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773405157; x=1774009957; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9epzK3C05Aqic050HU4sGv3sK4NyLKb/ZPKh0TB3haA=;
        b=rdTaGInj/fZbxnbvRpb6A1pfmpkGj1qN8kyh47pJdTQ5Ep8O6fEsdRPOkHZpEHWR8g
         b/xEnE7HRhZ6L5vCab0YpHtddfAGPVlmTO0Q/vk9kxprSuR0Pow5jvB30ADXHoH9hD+6
         FDxxvNvKgTeTYkiOaxJPoNppi0bxUYTnHNfM4m0P77hNzNn0UI1+DXy4qF48Td3AXb+B
         OL/GdNw4ZBAcR/QRsXq11nhjo+64/gC1GKggiMcloN7O13lVPsaYHls7703jnIGOGqxL
         P1aOpgfhtsuYjR5Hs3tAEdAJpe4oZ/XItvZh4uUeKjojjEQcFHy4K+6h5tiWqE+3xhVq
         18FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405157; x=1774009957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9epzK3C05Aqic050HU4sGv3sK4NyLKb/ZPKh0TB3haA=;
        b=pqWUnnqk3ypX2F9nbQfSv9KPqj6YzXkg9TXcmIES04MgYJmIvNsI2yMEntFm4LVMix
         3hGR0rEZJJPCCCskdupYublviqh/+TvAlb4lcAq7Ce76XiVywKQEW645D2NriTG6Roos
         wItHdVcV+s5w/wz6FbyOuH/JycOb8GHGDZLbIst4VjAW2o8/0p7S8XzUcrRS9Y5zj8nQ
         gikkFbRAOeizwjJrBgZcuLf9hWFt33qaKBx8+Ehd0QqMUXj25a8zPV4l0FEtmdZ3sDXp
         3p6LpxYsq4JwlXVhijep+WRne9rrmCom4fSBg0UOjRpRoGeDtwJ6EPrhCYtqDiPrzZ5E
         NmMg==
X-Forwarded-Encrypted: i=1; AJvYcCV2g3yqSXidBFZC6ww8i4TilQcCl8cBp246/Qg8/MKnnRwyDML/meP0hlnsmoGSzDeKYGO6@lists.linux.dev
X-Gm-Message-State: AOJu0YxSc9tmp+LiZO4kSNjFDNzLVhjGbD6Z8f3eNrDR2LmsyE5WyC4h
	nXZ6DMiTZWrQT1YSPQTnhyGUlKeSzxoK7kfYkoc7K86p3rjSUaAnm3PbYnbrwQU5rY4VhBvhCQc
	/hkQ70mZQXaBARQnn2vqlMan/VWWu6bnJz/0PAE+l
X-Gm-Gg: ATEYQzyKJnIL3zHpUSyZeeOGyMlQLm+S7mVontp2b0700xiCD2WZc3cMwnOFss5PGAJ
	sxY3tERfSzjX+nMQdDaLjttQxq8eS6lN1mlVUfBUq0dwffCWJsnM9CfzYdu5VZIV39+RqBC2OhQ
	2vHcj690EenfiCFSvwlq5Qw2pLbhxvK1FjKkKz4+2RpNPu5zmZuZB6EWIcHy+TsXYryoG0zGBV1
	frA3+7z9DhJ5UGI54kL219CqCfqSlgCWgN5qyYef4I9oyX/Q0dHHW+DtiBpdibJZm9gZfkO5SMI
	rxhrqiJShHUImk5UP4RFOVCJJsE7qUI0tQmy
X-Received: by 2002:aa7:c497:0:b0:664:2c92:536b with SMTP id
 4fb4d7f45d1cf-6642c9254fdmr13109a12.1.1773405156207; Fri, 13 Mar 2026
 05:32:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
 <20260311-kcov-extrecord-v1-3-68f03c4a05ad@google.com> <CACT4Y+bRTjPG7pw-k9okGZ=Gv81b+_AgdQcCxWxpF25guYpo=w@mail.gmail.com>
In-Reply-To: <CACT4Y+bRTjPG7pw-k9okGZ=Gv81b+_AgdQcCxWxpF25guYpo=w@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Mar 2026 13:31:59 +0100
X-Gm-Features: AaiRm51AsQr-GnfrmT-s2mK0Siar6QSBwzDlciobq2qYdJRCAb9h-hiOndoW4mU
Message-ID: <CAG48ez1STjb-QCbZzwJRYGfysnUs=xLSFUObN1FkWjn4PYhDfA@mail.gmail.com>
Subject: Re: [PATCH 3/3] kcov: introduce extended PC coverage collection mode
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 8:58=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com> =
wrote:
> On Wed, 11 Mar 2026 at 22:06, Jann Horn <jannh@google.com> wrote:
> > This is the second half of CONFIG_KCOV_EXT_RECORDS.
> >
> > Introduce a new KCOV mode KCOV_TRACE_PC_EXT which replaces the upper 8 =
bits
> > of recorded instruction pointers with metadata. For now, userspace can =
use
> > this metadata to distinguish three types of records:
[...]
> > @@ -1519,8 +1519,10 @@ struct task_struct {
> >         int                             kcov_sequence;
> >
> >         /* Collect coverage from softirq context: */
> > -       unsigned int                    kcov_softirq;
> > -#endif
> > +       unsigned int                    kcov_softirq : 1;
> > +       /* Emit KCOV records in extended format: */
> > +       unsigned int                    kcov_ext_format : 1;
>
> Setting/saving/restoring this flag is fragile. I afraid some of future
> patches can break it in some corner cases.
> Can we have a new kcov_mode and use some mask check on tracing fast
> path, so that it's as cheap as the current =3D=3D kcov_mode comparison?

Yeah, I also thought that what I'm doing here didn't look particularly
pretty... I'll try to implement something like what you suggested for
v2.

> >  void notrace __sanitizer_cov_trace_pc_exit(void)
> >  {
> > +       unsigned long record;
> > +
> > +       /*
> > +        * Unlike __sanitizer_cov_trace_pc_entry(), this PC should only=
 be
> > +        * reported in extended mode.
>
> It would help to explain _why_. The fact that it's not traced is
> already in the code.

Right, I'll change the comment to explain that this callback isn't at
the start of a basic block, and that the basic block is already
covered by a preceding hook call.
