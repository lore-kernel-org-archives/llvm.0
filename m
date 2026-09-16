Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF63D9DC8
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583431; cv=pass; b=lOUE7n6+6PJvE1WS3qdDpDy7tr4Twxh1Nefg5LHu8rOOE/tzrsM+QtRw1Vm3BuuoJZs9Png/sicwT7ubnGomxDzLhfq6lj6xvb0uKDg6+8g7grS7Ii9E89t8ljBoGjEyJjiqd9f0HcincPyc4c6GewfP2ASoOzsrA/ja4dTlMU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583431; c=relaxed/simple;
	bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjh+wWQc33dXtesBoExu59Nfcq+VBMc3Fu6b6G98OyRuYRv/bDK/1FYY7Q73lcpr5trEZhmFX1KRNODh0LQClTczOxwnGZvzwSK2npVJh1oaXyqIt9mpaqfToI0Kdc1ONCJZU6Rf+eieNSQrqnKYiT8q+PDHzMSLAZLJjJUcpUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiwiWW5t; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiwiWW5t"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3dedf3so4910b6e.3
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 11:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789583418; cv=none;
        d=google.com; s=arc-20260327;
        b=D8Gib0LQ5VYY6FkOcHo+BBPm7lqGMP/71ShS4/hY3SLdMAYpPAPUkKv7hzQAQ6o6E9
         AumWeXaaUwst+TJSZHrsCM1IxDH0GASjNSMFw2+dJHSOFrZB2cAA/EIc1l/GeUAAwHa/
         R0U9aKTgoYeziIk/75F3onI18SpMuoKzwkUl5K0/1MQ1O/rIew4ii8L8qgoYStzXQRRC
         GT8aWTssU4bZ+VHyq5ihfuUE7nrvxwlpV2/Dmlfq6OVPX6sXPkxkxeS8/8xU3YlLpxO7
         H9eCxzKOAJ8UwusiZUE/RvRquCeAHN3TXI0Q0HZ0kDawHe3zDO0OjtdD329pZ/nbpJkR
         gViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
        fh=bRVsYmHT4iD8+vulg2+mAcHoLALoci95zsFkRLh2M6E=;
        b=MOKkkSTzpsHVucLGWzkuMBNCZmsRaEBT0yVqg1d6vYiRg16sDy5aVI76Ad3Fq7FGal
         j3JLqmlFxbSR8QvLyFq9Q75sKbJR4ZCZE83qYQ1D3H7QiblkRyX5Wu5jo7/Pxpdtcqdx
         B8z/H9RGQcmu7AVtc0KqrqfnzxgFBGhFZmw7sZ+zU/KqA9khYwnhvWcjjX/Yw68vYPnm
         kkFrgUpk0L7WdwzOSYU9JZXgw/pHwnheMam11OkvB3ISPm+vEmYmX+grnvfxoZhx+TXQ
         1bswKYLtslLusGJhTkNBi9/8PczWUdR2oGlHob6DHpMd1629wTGo5Sa5PV+FddvNgr/i
         +7Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789583418; x=1790188218; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
        b=SiwiWW5tcUExGPyrA7nQt5fuNQvNmw3lT9qsgPoW+9tbcEErKZKpoZ+xj8scUkD+rf
         fQtfhhBDZSaaI0PsHJSiAYna0iYcDQUqiR7GojLuk+muPLCxAl/jsCofO+hMp8UQcSp0
         uy7xxGz6IFA4WgSt0dEEWtJEmaJHXdr33/nNjc5nrJE8KIczkRJRKassmeWBt0/A1KqK
         62z7gzef0lg4Ki1L/yN9u0dIGpnOa8SS2RYoyi+H7vhPnqQtEI6BJ41+7te8mFCxLfFJ
         SkTq9q5WoBJK00O/jVgBfVAz7DW7FeTB+3JGCrGKKTxjE0fmF8OXvjUCdeN7XJKX3a+U
         40aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583418; x=1790188218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
        b=ZMXQBrMfMUbph5Q/cayB4GxCU+I2yhIz2zOH0xApUzdu2Zs5IMATYi/cntfJ4G7Lsc
         Ya1it9y28y4jODVTCi17VghcUyin7+OrEVL6ieSPXJJWYGJCLWEK05mpkKvvyGPVcQtv
         ureDXiW72QxDh8D+wZRqeBupLcjv+8TyjB0YU8bnGhteo08sOWL67P8oPb2H/ORWDFim
         YaLC2zF9SQEuYq7XP8xnc3z0pZZVLWF0LoPoHxgy+tEdhqAb5graYDMYLKqLz1Zd8VIz
         QfjC6K1VE02981yJylQ5LxNV+Hv8fs6EFCDi+CCw2h+8gjuOrZYZCngRoP/eKFVorsRz
         b7TA==
X-Forwarded-Encrypted: i=1; AKwUvBzhPtnJ44swlLP14iVMGuNbZio85kQQBOh6UJuYmtTtVM8a6pMAO1s7UdAeyM9/11Ze32vH@lists.linux.dev
X-Gm-Message-State: AFuF++lh9w1JEPxlx+8sTi00UHCMiZkihYBrLzSkOwRGlq/JtEEx+lqS
	Rna3KvwCYIT8mPzjgOHY8PP83kZ8LdAhHKqna6GGcp6D9wTDhPXJ/xF0G39LPBRIySzPqGUsIvi
	wlg23dAmPgizxFhbysBjbUBDBPQJsmgU=
X-Gm-Gg: AYBFou3i51roHrepaGAKRt7gR7ao0k20mkgUDsdYzRhgu0qvteH4rd/DitjHThpAWHb
	gn5kYsFmOp10ex4/4R9dpvhJlPePd1eRxyP6kJAT/o6BOBd9pqN591Vb0qUtJVFug/QUfxiZhue
	wa6E1e5ERoFUJ0nAeLqBblxsZLxMn1QeNsjw5JYZpgIoU0IOIAB1ulrhXJgrY4652o2WuCmV2e9
	shgndWzzMapMMZkt2fDa6xWm6oV5HfrFz7dbQuI/ubsAalXze0z3/NKDm3da6bO/0elMC+tkZyp
	79aEF2sCE1GHuVcwexsppqHhmTVTkIwlLSCJ5Oq1wZFkTWM2Add7Auw=
X-Received: by 2002:a05:6808:6412:b0:4c5:7d0d:7a5f with SMTP id
 5614622812f47-4ca499cc905mr4023538b6e.6.1789583418230; Wed, 16 Sep 2026
 11:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916181001.201787-1-usama.arif@linux.dev> <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
In-Reply-To: <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 16 Sep 2026 11:30:07 -0700
X-Gm-Features: AcwNN1UGPx7lnVvt3z2iap40dwD-R4LLwB6dyuaIBNTPY2xkFaNousEY7ARosjA
Message-ID: <CAMB2axOVd3jx+Gznb4mrNTBN=5oXqeDx-WfHPx5d1E7tbwoejg@mail.gmail.com>
Subject: Re: [PATCH] bpf: local_storage: avoid redundant IRQ save on bucket locks
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Usama Arif <usama.arif@linux.dev>, ast@kernel.org, andrii@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, song@kernel.org, yonghong.song@linux.dev, 
	yatsenko@meta.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:22=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> +Cc Amery
>
> On Wed Sep 16, 2026 at 8:10 PM CEST, Usama Arif wrote:
> > bpf_local_storage_update() takes the map bucket lock while holding
> > local_storage->lock. bpf_selem_unlink_map() does the same; its only
> > caller holds local_storage->lock. The outer lock is acquired with
> > raw_res_spin_lock_irqsave(), so interrupts are already disabled at both
> > sites.
> >
> > Using raw_res_spin_lock_irqsave() for the nested lock saves the already
> > disabled IRQ state and issues another IRQ disable. The matching unlock
> > tests that saved state before leaving interrupts disabled. On x86-64,
> > this adds a pushfq/popq/cli sequence and a test/branch around an
> > unreachable sti to each acquisition.
> >
> > Use raw_res_spin_lock() and raw_res_spin_unlock() instead. They retain
> > preemption nesting, memory ordering and resilient-lock bookkeeping. The
> > outer unlock remains responsible for restoring the caller's IRQ state.
> >
> > In the tested clang x86-64 build, this removes five executed instructio=
ns
> > from each uncontended nested acquisition. It also shrinks
> > bpf_local_storage_update() from 1732 to 1702 bytes and bpf_selem_unlink=
()
> > from 1030 to 992 bytes. The affected paths are updates that add or repl=
ace
> > an element in existing owner storage and successful unlinks.
> >
> > Document the owner-lock requirement of bpf_selem_unlink_map() and asser=
t
> > that interrupts are disabled.
> >
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
>
> Makes sense. But did you observe any measurable improvement with this cha=
nge?
>

Same question, but the change looks right to me.

> > [...]
