Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54F64908CD
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 00:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111057; cv=none; b=UamYnAS/WV+l/X/0nAEd0vx4qE4osap0poHbh75oTtIzP8mr42BM+fvzgphu3ltztTpmPVfK1tdnP9zWmFh3qu7mtV5a44+kyR9oZHyVwPwKsgWCbzdcA7gL09he9FBheggCBy1IgrdJGZOupyqdXGxU/rYQe4Mn1BpbdDMNKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111057; c=relaxed/simple;
	bh=RM71rEpMshNU/1M43+xs6op/v06TdqK/Y4+1CcbduMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYVY+kK2Uu4cOSiiIauarabr9LImhZN2d1q2FN248rQHOirrYcBYjw6Gte9tqyI/Dc6ZYBmvEZJ28sLnRqLAT9uzsvdEik/YklG/LAUBG5pVMIkfA2QkYAJDr1kjd/zBXwqkecGW2dWJbkp901iaGlgDwqUsGNNVe9J9cn9sMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIod66n1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIod66n1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955de8797cso12563825e9.3
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111054; x=1785715854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=01dl0IIZWjJRbfIXfFu72Txfn4OJSXE2utImaot0HF4=;
        b=hIod66n1iAZr8xtK+aH7L+1NG01Tcv/n0mMM839bzavF+xfICtfEkpGNQjq9OjK6El
         ySUNT0cDIOe75b3qR0NqzraBHpk9rmiGghdP5P2rU008pS9ZRKnNp52L6v4RB0iTK2ml
         3r7jt4L13pfZ+jAYVZtPom/6vFBDbQKG44rtNLZVyOc6PX6O8JqZGIVwiggU8/qCKHWI
         QpF+zB4i3RtF0sfBG2SpNcUnIxNaodVNSIja1tTTqFWcrX6h74+DAiSN9Lgs4Fto55Si
         cpUM77+GqzYkZVJeTQ4QhlznPRLyt87nQoeRanyp7DqrOB+1PXcnID0+3XecMPKITHRb
         D+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111054; x=1785715854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01dl0IIZWjJRbfIXfFu72Txfn4OJSXE2utImaot0HF4=;
        b=NHmIZRNes1VCs93Q0U0oLLOit39Y0YsRkCM6acr9K84yUJq7W9e0+0PdrUQebj5rtQ
         qyS7KzuyAw/JssCQrhNwFWyIBo8LWr2+pV7r7K+iUiuvOLC9t0ylHo1NAV896ZuChxuw
         6s6XgZtsonhLqAxFQoFSb3NTPmay7b39NN8kaGNYLAAZTPkzhWaeOVMMDZnI9utDd+wW
         g4gPbY557dPH6xIvoV6ukDD7DPk3lnjwelLm7v2Jbkxm92liMcUO6wPgBbY7aGezQN71
         WJoOOH+Fyomxgn+RkI/aF1/xnLLCKP739Bc4mpLNlgSJ1GUQOqQuUPR2MUchI68Y8pc6
         dxWg==
X-Forwarded-Encrypted: i=1; AHgh+RoziLy/Ic+sTd3A/pWKS2g0P30edeveMokiRvqJuyildXRbU8YTPdtHd2C5o2ikm3sX1RIo@lists.linux.dev
X-Gm-Message-State: AOJu0YzNSfXw3n8mfWJ27Ndccrb0EIAxiAc7W23nCB7tJxLCVD16mfFa
	6iEzunGhur2z+yJ4oCMvM7BLe+0IvDhvkPGqZ8aoeW9rKfftTXexs0T+
X-Gm-Gg: AR+sD13i+mJWTVc/J67b551/IqJgUPdEuChxkH2JouHCXEaxHGs52uIi4mmn8vZycK6
	bS3a1Mqpmombch9pHMbdzDXW6toNfnOHihavNgThcAZFoJMUQus4Sl2TmrAdQlTC1VGawwEVPnp
	kOp7eDkc2bfb/lm5llSbvtut7JMIaezjZ6ds0aLj1hrxpYiCxCSjx3t4FPy/X4EoV8oaEAuS2Wp
	TQq8+fidKg8zICM1nckPUohgMUhjHcY3cEYq7Kibc9b/euKZcukD/WPhXAoj4gGXgcGvNtmFJ7T
	ANLwNYj7caykz1E+twxmFpjt1tMT/DFU6Q2qzC48JuHFTjydfDPqTMEt7T8raa18GAGO1nHhdC5
	JnCKqCP7Ub2Fv9z3ux4Z7tXIo4NPkno37gjES/Vps8o1UJsbzX4Y1nIkyUtP4rPeHkab7p1rfNS
	Zg4KLN8QkdMKjNarBU85bNld7QeStR1ODUb3DLunBSFsLHg3NIY+F7XxYMb9gjWB5EswSU0ZzDe
	l/iJMzhCIBVT5xuWGs3SNuFWYd8Sri2tMfdL+ycl14=
X-Received: by 2002:a05:600c:5492:b0:495:7eab:3abd with SMTP id 5b1f17b1804b1-496b5736f4fmr90983825e9.33.1785111053770;
        Sun, 26 Jul 2026 17:10:53 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm201357975e9.0.2026.07.26.17.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:10:52 -0700 (PDT)
Date: Mon, 27 Jul 2026 02:10:19 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3] ARM: traps: Implement KCFI trap handler for ARM32
Message-ID: <amafzynVg0_hlOZN@gmail.com>
References: <20260715175223.make.153-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715175223.make.153-kees@kernel.org>

On Wed, Jul 15, 2026 at 10:52:27AM +0100, Kees Cook wrote:
> +bool arm_cfi_handle_failure(struct pt_regs *regs, enum bug_trap_type type)
> +{
> +	switch (type) {
> +	case BUG_TRAP_TYPE_BUG:
> +		die("Oops - CFI", regs, 0);
> +		break;
> +	case BUG_TRAP_TYPE_WARN:
> +		/* Permissive mode: skip the trapping instruction and continue. */
> +		instruction_pointer(regs) += 4;
> +		break;

On Thumb-2, Clang emits a 16-bit BKPT for CFI checks.
This skips the following Thumb instruction.

Thanks,
Karl
