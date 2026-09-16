Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08804248DC
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586979; cv=pass; b=dchZD7lUTAoTNwCgbQWfJZ0BGYSjay9gVT7asUIEo5Eg2xUZcuYnf3+jb1FryaUbeDYBXgCFv0xnjZEA6IczyXY6KTJnulQQuBdLQgVfE4yAUPLao9qlgteyzWy4wsy4ZLQFOmy2C1iClK+kPIvqr59XGesHqrts0BiY4yNpWLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586979; c=relaxed/simple;
	bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etCQrZftHuv/nvG8GdmsYXYGtAHf9OPDNoZkt8LKuZsK28hZmHYK2OzDGiPC4p1E4USV2gA8KNvSacR/mJX4sM1TyJqZVXSWwnFlsTZMl5yKq/TGqSdrfenyxsOny22Vh6R/h3kHbSHknzP+enV+1TUaZb2sDSUSWciL/BvEBDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZbmpaXF; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZbmpaXF"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37dcfe9b2so35598b6e.2
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 12:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789586958; cv=none;
        d=google.com; s=arc-20260327;
        b=S+hvpOmFi2G0H4CTmFwkVyBp/lynW24Aq2skBYkeZSopyx3Xais7PamSI30J2KWCB8
         peeKS+2ZpSoV28Pfkh4kD1pBujeULejJVhyn5RjUKchndOtSbhe9yR02DTGSQrDQIiqq
         Jn8DVehzvBpL7LiHtj3KYNgaHmbV9SmPiXVE7vEOntA3+pMe9t9VwYPqjS0yoPNbRfbF
         MXAP7S9ltV5luIsx+8qzF+etibS4jJu8tdOD2y6EA8sU2SPTjuBPQXhl3Mj0zHILIirN
         5iDabBHCLCYkmbYnjdHP41kSlKL9zB5Oyh69FVAHWa2GxTVJDCX3IGfi231/JyCa1Z4V
         0iPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
        fh=V/VlYhyi8xaX0ma+w0tkvxlzY9YGeuSmwRB6tMlY2GE=;
        b=gr9n1VIsevVyA746rOEfhk71E3xt6BQjrw1hve6P0kpOzuV1CxuoFm7/p/bxn4Y5xe
         0nwvLlTKXBmO5W8lgO8rcGeRknO9tsvFvR0HpYmq52MLrJ7lxQ78FB4ouULa4OD9ZNFE
         DUsfU79UGzZeXRY1j7JU1BJBAwsRzcnea+eryEQN2nzpHc5TQIbj0GNyBu2Hw9t8H9I0
         mAuvuG39dA31cdXjJUoJrVMnvS6Q0a/E+xVdMK0G2D15ITD6xj+yHh/0r/TuUPt3+9Ic
         m/J5kD/kjxzfeeEOeWhq/TjDJAXJCk2dXaqaYqPV0t0ANPm0KWdqPCO/bflvJncQcOE4
         yG9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789586958; x=1790191758; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
        b=VZbmpaXFpbO/84U+FvtxSXC2pM0uq5F0fB0Fg16c3TEw9eCGijQlZrN/AudsfW3ZzT
         UUZoEG26/q3BPAwwMid2NZeNDsG4VVPLFpogR7bhKyyIvh1zrvAyXkNSn9t7ZPczvbOY
         yyQusogYbWkylp9zNHJZeV8XeApSlcDkjmruMUFtbQMzAx5RiLiDx3O9LbQZOhf35KDo
         al/O9SMG773oYOGLFPpdbJ653e2CfUHvM3BGW0FtrT9GhvTaGUmDKRKXrlyjxMc3VFy5
         5M6h5rQyk11kUKRnjcYNkCrJk7WbmxlvfEXnLRTM8wIt9+6t2xb1LWTUZ5sU6gWCm0Do
         AuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789586958; x=1790191758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0bKO65h4md/AUwTLuBudve8hzWfGFXRoDF7mDTv/C4=;
        b=Bbbj4xHhMsWd+OvyXDRqsIZc7eIrt/CFESdp/AfgTLlTLxBRRVFy6b1Uuc9BIjMBz3
         MULDxzBRF0oGrJ003Om/PQ1WOrLP+dH2fgeENNRCwK0wi5zwLbNwX5eAWAj71Ckukj8Z
         wfQJ0QYiVLEpwiy2xEQE6pDUyYhQ/MUeAs4x41PR3byD4TBTxELweDCGGHTgiyoFirZa
         Wa81IEbaqtK0rd4LdYqtRbkn/u4rpa2eHfN3uXfKochdXqRVetLljUSeNTJj8+6UCBaL
         shnCKja1qWwFRNLevrRaJpKEPFfBH3b2e/XQ35/8eBRrZQSKXvgskfgMOjgdJtYqEaAA
         AXlg==
X-Forwarded-Encrypted: i=1; AKwUvBwzXFA++uIkDwEwQoAPYQzB2DquRKvrF36IJmMd62C3AbV1EtKdpBzJKCV6CByq/8ecEp9O@lists.linux.dev
X-Gm-Message-State: AFuF++n9J6Pv87e3RazmcAaalbUGUHJJYAZAB/1EAnyeAIP8NyCOxhQ5
	zHTWbBPWhcMU57Rdo5wrc2sNqSUuPmzM2xSeO2SSHbkM+Ob3dRfEbVFEarQPEl1TPKsSFKLCmeI
	twwRqoSox1nKRdSitSxOt4PDnxpCpDLs=
X-Gm-Gg: AYBFou1qcmt5TC9QlO5cUIjrEIfXuiLivAld7FkanCbb/ZnwMzFNmnCPJh2VxgdDKpE
	2FYP5IBbM1fG9i4AwbKeAUGf9awcwUCKzzomBkEvAQpzhfOQFFJPKlwLWy7kMKxE53PcwUQ7XG8
	8Sjnq2/OPqzASGWV/0YmeMbNGpQFJJ+yXGRXAgPdCdFPrDaj9dG2NEdrVeKbnV/4wZ6Lpc01pl8
	bNPqg82qQcbGkcIo+9TVS1Qj9Ya9pQFYEkhbONrF1xK4oCl6kdNf9hkisXLPjlcVRR16r8kfs/N
	h433PYEP4HdNq8DDM/dDV4ZiB8VXiavjUEPA9gqay1KIR463y3Aaxok=
X-Received: by 2002:a05:6808:c412:b0:4b2:8d9e:de11 with SMTP id
 5614622812f47-4ca4dc219f6mr5873685b6e.19.1789586958406; Wed, 16 Sep 2026
 12:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916181001.201787-1-usama.arif@linux.dev> <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
 <874fc50f-4764-433f-8a87-595bc70c4559@linux.dev>
In-Reply-To: <874fc50f-4764-433f-8a87-595bc70c4559@linux.dev>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 16 Sep 2026 12:29:07 -0700
X-Gm-Features: AcwNN1WDst1cmT6BJveQWlz_V4KXaqctpiRs6Ar3jIL3hsk1lUSOIapHrHv5P-0
Message-ID: <CAMB2axNZVQr=bEQXGErSEOFrMfjn11K_ZvYErLwXQ3tUW9qPiA@mail.gmail.com>
Subject: Re: [PATCH] bpf: local_storage: avoid redundant IRQ save on bucket locks
To: Usama Arif <usama.arif@linux.dev>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, ast@kernel.org, andrii@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, song@kernel.org, yonghong.song@linux.dev, 
	yatsenko@meta.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:22=E2=80=AFPM Usama Arif <usama.arif@linux.dev> =
wrote:
>
>
>
> On 16/09/2026 19:22, Kumar Kartikeya Dwivedi wrote:
> > +Cc Amery
> >
> > On Wed Sep 16, 2026 at 8:10 PM CEST, Usama Arif wrote:
> >> bpf_local_storage_update() takes the map bucket lock while holding
> >> local_storage->lock. bpf_selem_unlink_map() does the same; its only
> >> caller holds local_storage->lock. The outer lock is acquired with
> >> raw_res_spin_lock_irqsave(), so interrupts are already disabled at bot=
h
> >> sites.
> >>
> >> Using raw_res_spin_lock_irqsave() for the nested lock saves the alread=
y
> >> disabled IRQ state and issues another IRQ disable. The matching unlock
> >> tests that saved state before leaving interrupts disabled. On x86-64,
> >> this adds a pushfq/popq/cli sequence and a test/branch around an
> >> unreachable sti to each acquisition.
> >>
> >> Use raw_res_spin_lock() and raw_res_spin_unlock() instead. They retain
> >> preemption nesting, memory ordering and resilient-lock bookkeeping. Th=
e
> >> outer unlock remains responsible for restoring the caller's IRQ state.
> >>
> >> In the tested clang x86-64 build, this removes five executed instructi=
ons
> >> from each uncontended nested acquisition. It also shrinks
> >> bpf_local_storage_update() from 1732 to 1702 bytes and bpf_selem_unlin=
k()
> >> from 1030 to 992 bytes. The affected paths are updates that add or rep=
lace
> >> an element in existing owner storage and successful unlinks.
> >>
> >> Document the owner-lock requirement of bpf_selem_unlink_map() and asse=
rt
> >> that interrupts are disabled.
> >>
> >> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >> ---
> >
> > Makes sense. But did you observe any measurable improvement with this c=
hange?
>
> Meta fleet wide profile shows bpf_local_storage_update() as one of the mo=
re expensive
> bpf functions in the fleet. I saw it in production when profiling a hhvm =
workload as
> well.
>
> The main argument for the patch was reduced number of instructions execut=
ed in
> this expensive path that I see in disassembly (which is mentioned in the =
2nd paragraph)
> and better code hygiene as it doesnt make sense to to save irq again. I w=
ould imagine
> this patch alone wont move the needle in application metrics, but would m=
ake this function
> cheaper (hopefully :)) fleetwide.
>

Reviewed-by: Amery Hung <ameryhung@gmail.com>

>
> >
> >> [...]
>
