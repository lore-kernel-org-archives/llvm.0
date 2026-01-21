Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588463D3D05
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020554; cv=pass; b=AgNpolQ8w1jRdPZjQ5Zjm9iS0KYiRtCDH+BcWScjAaU8nfEGEACLrH0ATaNq+dNxR9ahm99SJbv8Nmd3FwpLFbNdIvtXtBwiuu5dtXJQII/qg5bLi+8rNUIMX48o9tY8GTLGlxtOqxFQrlT4F9i2BxWVjckSzKLvAq5EKxEiFNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020554; c=relaxed/simple;
	bh=0nXA4ri0OIvOYsq6lK4pBTH4Q51YBbNJfKW0VyIfIQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYUELDRtNoaBjHup3m/jRbUKceAMYqjePKdFMjnyWk20MTZqPb2pU++IhU4+hTqzLTL/SA3brWd1LGRUDk9kVaj+yC8HH1PUFdHpTLz3wVF0E6YaLDLfDlY7nSVJ+A2pu6tWjowLGpLTLAtSkPrjjY/wpDBrnA+mvQ/wphCsHbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eKIZJI/y; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eKIZJI/y"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-121a0bcd376so434100c88.0
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 10:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769020551; cv=none;
        d=google.com; s=arc-20240605;
        b=WiyCyMAvVqIajizhmPSBP3tIjhVi03TRihoVAQHX9fY4ig0ZzISu65zE0fk6bSBAWL
         peQQ6/zw9aGaCsN94PLJgxztIephtgBjZ4S5rPCkefljTsOKvFsZdIIASifSuBqsxD+2
         quSqZxWWqotNHIzn5ZuCjEBNqwugdIuxrfhs1DrlrvaIjNcbPOAaWclSRUNN27LuW8Ld
         8Ajx9sFYjnsCnYzCF+3gpGd2PKK4eCPTCPulpRDWG8S1L+biwkDsg8+e6GQ9VbaC8G6o
         zXEtmWT1s706p52lK9/fN+uHOwGuGJD3YR6cWuJ5d2h3vwLKnfah7JC10MiVk53F3hxE
         Xf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0nXA4ri0OIvOYsq6lK4pBTH4Q51YBbNJfKW0VyIfIQo=;
        fh=XyKaI5S9eF5mJb2DnOCF9U36PI3ghMS4/RWBZbmlRjc=;
        b=U4eKwxa/xzULbeJbJqpPjStorXo+Hn2d5EETnrqq0iVgcAnWqO6rtUc7ADHWVNvuXg
         MRMycJ8Xp76YvYqw3cJzXVz4BqbgkInKPE4XFehtvSPJOl/b0NsvAg6tThXvbwIrIyCX
         /7weYJ6DWNnjJhmhxDzzuYSng4m1s7Ndi75HrV6w71pMHkvlvA8CCtDr9sgSaZfWMUKu
         2TE9wHVRqeSMh3enAna6XhU353czGK8lAyk6BPx08zlZU6nFeS8wuv3xYTcD0OM8SaWR
         os4LxFooi5hjRSGw64iwVk02bQITWs6xpXQIOJyHseqopEroDgdHiXuiLii/ssNHS0le
         s1jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769020551; x=1769625351; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0nXA4ri0OIvOYsq6lK4pBTH4Q51YBbNJfKW0VyIfIQo=;
        b=eKIZJI/yNyazwoRs9PXZxbd0nKi17Je+ILMpEuhktFcm8a9LJ8p1ngkCr1iMTitTlN
         ihpFen/LXrPFGVpwze18sqmd1/aPMOBElgW9k28MfAdgw4MrBzhznTGx/zWkmDXrsvw4
         8tNYwE+5XBWMB3wEqGiFwT06HDCMecIUIvjXVKXXfvIpCf6pt4ERsErglDmGzFYoOnX7
         UZJ0TbnPrG24tonROEO3WqpCgIIutFYUy/pKQVGaXyeusOIcL1FwxIdtMW3+hN5d/Lo2
         8QpU+jH63FFVSHnSNolHQxJIKgyFEYXMaMDuROBkM6fldhzVoxGOHzBLHt3Ly2gSPPJS
         epMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769020551; x=1769625351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nXA4ri0OIvOYsq6lK4pBTH4Q51YBbNJfKW0VyIfIQo=;
        b=jEEd7QogmnJu1jLhXCuxp5bXfDKHqpfp4J82zxozTpX/MVLwfzk8ORHMpPkTKB1GZS
         U4OqzIiocyKSwnAA3VsBc8SQqJuOQHeHaRgC3Lq84nK48C1nd5PyzSG9Y1o1h8ZKdXj9
         F9tjBEpvEhUQLKpH53HX3ELFksSkxxUQlix2OX/1s5qJNo5dImSAzDYSFxcuxhNQ1rtp
         NG3HNYA5JEzItrb4trGJYDJOWBtaoYb8gtmHYAyD7Bdjdj1aH1SBnHmZk7ONtx9OmTlz
         +XDm4KPdEkAZ4zmsJOrQWwKaLz/r8eNJGJd6cJa4MGqrpZl5EhRZ6RYihOyZYQ5pA4Hg
         6Sdw==
X-Forwarded-Encrypted: i=1; AJvYcCWmEC6bPC4s3ir0lwyDM2zpacECUzE8bZmoJoukpnkC/OrbnyoECTqYIU1ZpvWOw2whGIXM@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt0QdDxcomkuxQaRR/oD7G0h0u+02/ZwAGkAzyPfYWgGl98+e/
	1QnYYIYKjV1/TY6r6XRTpCXTJHwMbeTtd3iTRo+PQrTcJtIr2H5JiWrsWPGcvs6QiljdBxoXM2P
	fJnygxqbhz5f049W/2nYRA23FdRRHgMcIj/IAODS7
X-Gm-Gg: AZuq6aJgoo7RkkaB4NgR+PgBOMEuSphMf2Tsk/G0ZVvHc6XajEd3ICo2B1Zxi/YOBrs
	zislpkiIWHZDYVuQV+RVHR47CuviFr60sEyPj+PM0M0h3/DoqTxOMOLZgXwCLnZ/YYbXCS+PKqC
	ryDKIY2fSKuj/d3FfyoqxYucSY6jpZ1qosnWS9utf+r6PG6ZrwQH7g+1o+VaTij/gj65DQ96gnk
	Fwxx+NfD5K3Y5EfD9SprN4BJ+sx4Zmze7YJLAEJjSZSxU2jhwyFWN7JhSzJSJiZFH8GSOutvLze
	LNYozKRxbMhAxFjXF3xyTpNg
X-Received: by 2002:a05:7022:438b:b0:122:2f4:b24b with SMTP id
 a92af1059eb24-1246aad16a8mr4119829c88.25.1769020550835; Wed, 21 Jan 2026
 10:35:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121110704.221498346@infradead.org> <20260121111213.634625032@infradead.org>
 <88eb6e92-446a-496b-a27b-a50e4ceb57eb@acm.org>
In-Reply-To: <88eb6e92-446a-496b-a27b-a50e4ceb57eb@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 21 Jan 2026 19:35:14 +0100
X-Gm-Features: AZwV_QiW84u6-p7bloLEAv5Djb9NnnVbIPMzn59-IAW45NlL0vNWVVCuDFUsOzM
Message-ID: <CANpmjNOBJ12xUY9+tXx5ezFoFqo4BU4SLK7xofMGexvGNQR7tA@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/4] compiler-context-analysys: Add __cond_releases()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	bigeasy@linutronix.de, mingo@kernel.org, tglx@linutronix.de, will@kernel.org, 
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de, rostedt@goodmis.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jan 2026 at 18:55, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 1/21/26 3:07 AM, Peter Zijlstra wrote:
> > +#define __cond_releases(ret, x) __releases(x) __cond_acquires_impl_not_##ret(x)
>
> Since we have __cond_acquires() and __cond_acquires_shared(), how about
> also adding a __cond_releases_shared() macro?

Since I'm a fan of less code, another option is to introduce it when
needed. It's unlikely to be needed, and until then I'd prefer fewer
lines of code to be included and maintained. Up to you.
