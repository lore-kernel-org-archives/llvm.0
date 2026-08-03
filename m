Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58D38E8A6
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791767; cv=pass; b=GxYUDZa8kW0WZmzYt+motP9zbeE5uB+00Ry5IgN37TrPC9EWN/ulagSKocbsWbjyEU/pgQCDHrW6wPxiL9DFCrB7Z3nsYSVqTlizz2tm6gzKAa+EJmBYwGbG0XF69tJ6EzTrhoddAAHBXKHXvEVbjzmG+4ZpBIcdyJ8Qjf/3qJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791767; c=relaxed/simple;
	bh=y5qiPvD/on6DO4GW0krQNBl6dSDpG8n+mCfX4z92gGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZmhyy9xPwsfFIO5Ka+79UIgEUALXhOMZ4J3n4FYz+F+pCFDOW00HIc/Kitw5vXqWwUVnTzbG2NzGKg/v7uKkdMFz8wcaECExXp6vXBKYPnqD4C1mgyb6YCUVtkS6o/RSeKdFrqtK0mT9vaCMIwSGFVGMSdZeLtVBaaqAt2xLyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrsUhKA/; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrsUhKA/"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso4604467a12.1
        for <llvm@lists.linux.dev>; Mon, 03 Aug 2026 14:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785791763; cv=none;
        d=google.com; s=arc-20260327;
        b=cuzyhzNlnlj3UQGhjJnYaj8ctK2MMV88Isykz0oLYjhn8/u3cdDhkdQWIPSQ7srhxS
         Wc23id2J72WBM2+bmRYAx1jLC6dV8u31hhoOkPSwhBg62PmZfq8IQ5LtlPdD3otR+QEo
         lTDtTcJS1vNWBj+Q/RLNJfK3cqH1VyTJma57cwv4/yArpZBnwvUU6FBXY/bqpgiq+oIH
         tNFuWDbIK8UUwvV7rE9Lg5C2nYNQIy5sLb1r3s5O720qd+y3jlam09jy9IYnnuAttyCa
         hbCUNSEE1jyNQX2bdWHazLEXloNROg3mAIVbBWiGfCv89KG73am3fS0NFM1nanZQrbkm
         ZOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        fh=qxXGtliCdDo27JEwVITOuqVLDD9+VNteWVic7M3om5o=;
        b=pxtFSE1tq33RBeOs781P6JrfIL+UJAuJMiFd1BtsaCbZpc7Jnp98zWxmu6fvyiDUCy
         rXcu7Q+dxtF88EEFmAf2Jp5RQYi2qTTloe6jYAuce2ia/RYSc2XKR7ek2FKygAVWybOq
         l4ozXg9mYbcjE28dX8xNiCh2vBbNMjV5Qxs+MJ9h3+CfABcLu1VgNNMUkWcCInF/tGQw
         hfFLm3VJg4yPPbTkA8+2OAGZUh/H5s7R7ofBWHzpFcBMJkGjpiTE2gnq+f3XrcOGOZ96
         pgXUSyFUs0d7jtjelRgIl9Uf35FaOIi7GRoDNg1W025kLYTYnaQ0n5oHoyhK1tdQtAnH
         YK/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785791763; x=1786396563; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        b=KrsUhKA/stzXo6miyRqEZPSruSsQyrIuyZoKwxGpy4RKVR0DdImie8KFeR4HoFkdsl
         tqrb4AAdS43ANuC7T0YevYkdpJ1gzgl846jyLnxL68X7VlOLzd67h8VdzxunZ/pCGMP0
         BEtpzBbtq9EvM9AvVNqSPwo6VRQZA3KxRpLCnTz7rupFCcOIYmYhdvDyTyO/K5Un79Z1
         kW+YLEg9abnB7aR3VWeTNZXs9xoP7NTtYxX30ijbSWx6gcH/VO78HUGUR/+bdcboHsNZ
         QissYCb9M+nnhN25PtnnRsm97wURB4pWwI8yPJGdMB9dqGNyEOoPlJEToALrT9ut6ITj
         AJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791763; x=1786396563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        b=cArm9TXnUwx6SkL8j+wE7ikRRCRf7JdCgSSvxI/U9A4fAgzeCnVKYDTaRwsadqidIK
         NRYwn/b6eBMECvPKfndzA2s0B4uN8gAbNKxxFxcsoy3QkYobfNvCaCP0LYMMcW6qRThX
         Ow74ojz5NKnADT2I03aWgOPsZrkfE3OWa7+JP8La/EPYtXtvCt+6edeXVQf7qXVhQEzz
         jbAS+G9Oe/D0H9kIFZm5hxzAr4HhqZpVVVY0UymgQzuZUrAreeE7ttVJLV4HFWpu5OCZ
         CUgME41i3tvC3sLfKBamAOEjhexFRJLHeCDWsX4J7NYSfnUMcLQcuZgVUT5QM6wjnUWs
         S+mA==
X-Forwarded-Encrypted: i=1; AHgh+RoHp//E3HMtTKiA2C8em/RMKPrOEZIgqr3pXcipOFpkqWr2erbr7zrhKj8AX8xXmKkbkdpK@lists.linux.dev
X-Gm-Message-State: AOJu0YwyqFACQId42GVu9eUSvbTLgUCOpMONA4nLWD75T1lhLw7JnjPr
	s766bfZxvCCgEK1xZQ4qiHVLzGzTHhEetrHsBcMERmgWuxedNKGyDraxWiVoL+iFTh01IYT/P+B
	zYDXY8EqHWGOhnQpVSoJYgSo3V9v58w4=
X-Gm-Gg: AR+sD13vscu5IbPJL5NNUEDGKAp0TTvCehk8aE6kOnV5jDr8susTict6S4qHolYrkjr
	/y5FTLPiDggfgicbfGmwBL0tYLBbDfjqhZANcfvr1+SCTd+/YU6qHYPJVtdlGcXp8AJdN+HyC/L
	ahFrJr4ogn2Ub7fRe7eu7myy2BHaIiO/qvTs55kmURSZsVtvnm1zVK8RSIkh2FVZMEJijCK3izT
	mofutKCgDQwrDqDp1YNwHCzpkTCnEvV/C36gjTiNU++wSDIuaKbU+dhs8Cr5C5zHVe4djAF5ZDH
	Cvu1Ka5uZKPvsVC+95y7Wc7QYxtgOsqxHbgl1z3fuOzPt/liVbSe2a/BF12i5K82Q9Bck46P/WF
	LmXuMSiZ9yIOjM2V59RqbfwV+yrsY9EI=
X-Received: by 2002:a05:6402:3241:b0:6a0:8885:e6ea with SMTP id
 4fb4d7f45d1cf-6a0a7c60fafmr7359384a12.6.1785791763033; Mon, 03 Aug 2026
 14:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 3 Aug 2026 23:15:51 +0200
X-Gm-Features: AUfX_mynwyTXbGl2r5A9Ln_10BtSjIBSkDIfhjkE2mzRhJnUG3o0f9IhUJu7p4s
Message-ID: <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Mon, Aug 3, 2026 at 7:08=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> clang honors a local `register unsigned long x __asm__("$N")` variable
> only where it appears as an inline-asm operand; merely reading it does
> not produce the contents of that register.  So trap_init() passed an
> undefined global pointer to PAL_wrkgp, and load_PCB() stored an undefined
> stack pointer into the PCB that swpctx then loaded.  Either one wedges an
> early boot.
>
> Read the registers explicitly instead: an inline mov for $gp in
> trap_init(), and the file-scope current_stack_pointer for $sp in
> load_PCB().  A file-scope register-asm variable is the form clang does
> support.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/traps.c | 4 +++-
>  arch/alpha/mm/init.c      | 3 +--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 7631129ac914..5b4f1ae2b74b 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -925,7 +925,9 @@ void
>  trap_init(void)
>  {
>         /* Tell PAL-code what global pointer we want in the kernel.  */
> -       register unsigned long gptr __asm__("$29");
> +       unsigned long gptr;
> +
> +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
>         wrkgp(gptr);
>
>         wrent(entArith, 1);
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index 9531cbc761c0..f4d65a60c869 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -63,8 +63,7 @@ pgd_alloc(struct mm_struct *mm)
>  static inline unsigned long
>  load_PCB(struct pcb_struct *pcb)
>  {
> -       register unsigned long sp __asm__("$30");
> -       pcb->ksp =3D sp;
> +       pcb->ksp =3D (unsigned long)current_stack_pointer;
>         return __reload_thread(pcb);
>  }
>
>
> --
> 2.54.0
>

This looks good to me. The explicit $gp read and use of
current_stack_pointer avoid relying on the unsupported local
register-asm behavior.

I also built and booted the patched kernel successfully with GCC on an
AlphaStation DS10.

Reviewed-by: Magnus Lindholm linmag7@gmail.com
Tested-by: Magnus Lindholm linmag7@gmail.com

I am happy to take this through the Alpha tree.

Thanks,
Magnus
