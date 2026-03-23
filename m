Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C039C009
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272378; cv=pass; b=Ojqer57HuuLPX47hxpOf54VcQkTJWQ7xfna/gvpCCfqwkLfeIwY9WSxuF7qf+cZ2drx+l+5F4F65SSnXkrL+frcVeAsUXre+TLxtEQcwutEoRmxt6WE8AHxC0h14FNcMXXm230/yFNaEn5S8cDMjz3BYcWeI2V5v4Fd+p96vpok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272378; c=relaxed/simple;
	bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9ePNe27jI630fQRfuJdwhpfczCshw+fzKKAhbcVg+CaEaZkEUqL2l5m7R3QFsDAbJPo2UOE9FSJs5CI2wZLIFLVLRz1GDJ1HM/hAbkF7cwraIgnxSniM0sS3hg9QyEFmbX9a2kyetetiovqc4JdlVfyawPgRSNjOd6pF27yPEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kk/KIlKx; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kk/KIlKx"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128bae6a35aso264134c88.1
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 06:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272376; cv=none;
        d=google.com; s=arc-20240605;
        b=WrjtTyR+sptUnDZYibbBch991pKvWlrUa4lixozoVZKYFgznkAH/Oa3fa8WPi9DzVF
         BeezcawrVhuUx09wTGc1zroPkUmDcWl+s9A2DzWNJJsKCEu7c17/NnS2DCGop3EU3sqq
         OWkKg+rv9GKUDdEprnJ78shzZ92gPkUtUyA+fw0KfjRQcVw+tGmDD+O5rHNoNWMwhqqK
         sWoOwTraTTe8qbHx1B3t9PfvIPWZpnp4IKGv/kQ+TD4qjr6fNkOxs2r7V8F9L3vad0Dy
         KCbBaP6qmFeqmfYPEfUnZSJ7YBEJcsKCAwmEEL2spNQ5V8t+M+jhbG1h6p+VgxyWrCmt
         HDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        fh=gOy2a7R96D148sE06bCgNCJSbP3bO0zt9bseEnP7+wI=;
        b=TDDk1KkcG7tFj6KSpM4K5qHabBv3EXa3kbhtJsYhLAuqlnt0GFY2glOAYMVlzS8GkX
         nof7sI564fhO0O71VQsuk8WeyGKFQKUaAvEvTo2Eqijfhku/Rm36aVwsWlgIA1W5sSza
         lMObTDiorA7tCBfmTQdhYNaThQEmSwg3yY3BV9+sinbt/lD4fOiMqTzUbQAsDZegqM89
         S0o8rYC616OXtdeMjZoWhdAaYV1DnPrx0VWzwJMwezl9LJbCq60pFNLXhJwXhe/AiCNX
         vuPMi721KmACiVLaIEoIejYQwzhMeJBQ7o4dDZ6k40nEwmqDJZQixJWNqSCymStZ0KYw
         1TOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272376; x=1774877176; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=kk/KIlKxmRXOkUZ0zGy64UTdiIY542bA3sT0NkMNsUB5ar3hG1FHeWDoraXcLQhdwd
         UftKn4GQFUVscARQepKKBdw5+JbXwx+LdBzgXIfg7Y7y9KqTeCmRansgVpNPr1TzFedc
         xsb3+lN5GkUBRGUM/et7uBmPJbj0cibtL6iwMNWOzwDeJcWjOtVhTezvENhfCm+rfOf0
         KtssZzbTFZ7JaKLMK/wCF5JDPhtjQeeqrmtCY6Z04J3W9mGPITFJZqSw2iHt2y4SVQPc
         +qvdyypbfTUA2gbbyMLIea15W8nGPBDJPLW8KaM3HhvKnOWcajEji2ZwGL8s1fSefCBn
         02Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272376; x=1774877176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=J4xes2lk9y0NjECpsgGV7Cg3Mm+rllJcybafJzjK0BnIC0OxhUJgF6dT7n2EsVHSqt
         FL8Fs4Kk7svacx4RgOB5fuhsQGECHEb9TZ/qe0UkBIek9QTeBHEQtkOSUfS/x4hz1Y9q
         e7xR0zsG6SykEj/TzZ6YGpUbHIdDKHCtx3Eus8CMQzBl1jGp9gx6SL9sY4sJqeeOKarY
         4fEjjngXcYxCtpWXHP56pCt2debxT8xNCrhyH0RqBgENvgg8d8xz1M6tlHdVNZ9JWk5h
         UcvnqOx4itMe8Ui/7Y05EIIkddUvFPsICZtWgRMPbaaL4WgrTaCRb47Tnu6sytZbO0WE
         CObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLSgK6hxysbASrl/n7tYsUzuoLaxIKNJANZndoyR9fYkJZ+xblgLlsHlqh5Er8ODxfzwl1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1oaAC9kYGiEgZiQDDGSD7psU21/lYLfY4J/0UMCtLH38ILMBO
	wkTKGV9zXSJwoTWhXayNepGBVWrNYd4m5PVnxP06lyU7FvHEm+/jyhbul8fohAsktVaC592kWAU
	CXrKL6rLQi963Zk6KvHwj/9S6ZXINuek=
X-Gm-Gg: ATEYQzzBO9chm1mrI9BTkkguR5g2RHV5vDytsoscZjwywLqVZhVMT2AqC4e9aV1B7Gz
	JRs3dfF5AS6+c6NUt4EkE30oYe8INtEUnz6hzJo1ZaUTZ8du2+DdP8399h/Ok/RI/S1MsFpEoVS
	WBiTmNS4Rrj1WYGNIL9/q7uhJWcJ3gmaMOxNH7W5D5Q1tipuaR7qYPPGzWNj8GBKF50P6cJd2XD
	o2Zg7X/thnvt+uu/AyZno+W39yzwzGVHFyVg0e1EJf7GGQiayFCyQSLnJLQQaGPluuEpGQYIU6M
	jZL0N2rI294dzM5aHgrCP+F5hmsR7P1CeAwlXhXsHwN6yCwPCH9zWuWhuDqRbq6hxNEzbQ5ipeh
	x+juSwXdehB35YrS+s+HmX+uCueG+oj4MQQ==
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2298180eec.8.1774272376046; Mon, 23 Mar 2026
 06:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
In-Reply-To: <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:26:02 +0100
X-Gm-Features: AQROBzD3BkPQaIE4qxn0GaZ9qpo8tZ7H6ULFyxikznbiRv24VDJjkNXoA95umyo
Message-ID: <CANiq72=dh=jTORtmHfv3Z56qJoK4K-0Bpzew7CTYn1qO+sR9_w@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:03=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Why is Rust generating code for userspace thread accessors for kernel
> space, where userspace threads are meaningless. This is totally wrong.
> The kernel must not reference __aeabi_read_tp().
>
> Note: I know nothing about Rust, but I know enough to say the above is
> pointing to a fundamental issue in Rust for 32-bit ARM.

If it happens outside this patch series (i.e. the new opt-in mode),
then yeah, something is broken.

That is why I proposed to gate this new mode to the
architectures/configs where it is known to be OK (and where
maintainers may be OK with it etc.).

Cheers,
Miguel
