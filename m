Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9114E73BE
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977351; cv=pass; b=nefVDS5GBJO6IXKn9UGI/y03rBE61bq/PoGdZ3/NLRnAbzyy5zeyFDf3t/NRI5ezBEWly6hPFj7xegF8vY4jWG8qzBf95DJPI46YnwHy1DwLx6iRVnF/37Np7OHnatC05puk2X5gG8zG/apecTcKoXB+DhpDl7iVAcKA0jz1y8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977351; c=relaxed/simple;
	bh=Bm8IXeZCCjjHRHqufoiH0uSm7tIaA4fZ4x02DGLBDgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVqB/6xHHNjf60I7D//KsjbOpZQMAidfRy69frq+P1Vt2GnPVhecm7l2GEqJA/WKfpMCgb4lNg5a37CtJIS0VUVoIeMrQTZ5T1Q/QjJZ4HtztPdcRomuZIQjN8ziRJ5sobc/muY+ECoPnUyoODPG5I+dBKQslKOKL6R7rbGj5mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLbPmIoL; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLbPmIoL"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35159e0092aso446343eec.2
        for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 04:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977348; cv=none;
        d=google.com; s=arc-20260327;
        b=nEDbnV6FZE6acm19g24khNnFQ0/Mu6bpjsuVyPMm4ez8mn6r3qkcPDjttKPj7mQPFY
         KgPK6dRzuKpISXyGyJt2NtshB5EiQjHKfcWRnydpUOy07I+kNF6lw7NtexqBhgP+6i8G
         kZUhRZpRfGJLubXnsyp3GFo592TPYCMqF5LyUuB0QrqzAm/O5Jp8JoK8kMF+YuXa1MrB
         igvq1US9ykB8eeUjGf3IVzQRZ9EjitVJ4YHEXXdFzcmovbc56CbNpHrazUMA7HhKnc6M
         +FyWXrZZv5xwo/YDWrZjrlz0swOBLnHL68QxOZMAeYiViRlS7uUuur+OCJCt1XysagFm
         NEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        fh=lmleHaFoI179xnYQjjagTOcMCnV1pNTCQuPBp8hwxoI=;
        b=boCQOLDd331VUn788Dcx5LfEEo2PlXNhUpbtWALXMa8dlYdEkvupqI/GZKjTV7oj0T
         sZxzrNig64P3qUfbRlv2OGdR0WXO2N1pCUT8A+w9WB+XMnzeY5CukzeurY5GyT67Qa2Y
         Yygb5CADK5erw3BzHAtTC4OLzG3/Z1qJmHKaiaW2rmPz33B3s47ynKRh2P9yvQkeScER
         KPTjOOT1dqxFqCgpllUPcUKw5W1fTCfZ802DKgbzccTkpY4olYkeaxsr5rzF+nixIaJb
         pmVr8bsEeSiig8UdJ5MTrHqZOoL9yBrB1FGhIetwou1+6x+KjjvxHJdDsMsZN8W/gQp/
         usOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977348; x=1792582148; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=SLbPmIoLauM1g8rEXO7a+x+nNVHrDaZgKcHl6ue405vowb/MnJ5zaXEmtCizeCPpbq
         2vMzWDo3Gg+bIVKxZQr9u+O4X9oxi7JIr3iJlGG0RH6OQDmN/zKQweSXoR2fqVgDgABO
         CVo0sZO0YQdXbzKYy566UQXdcOL5EnU2eL6bxGJl5t9xeZ7vH2Bu40IOu9wBorkOVVnl
         reur63f9XcBgwUABd4IS2VqgaWIig9qTPdx+AQZ3/N/rrAJn0X8PvFJrY83CYTO9xVxX
         wY3MyJX90m4WBvId2WpRBNFCFCQ1xEC4EBxrfDoN56t170MYuo01X3TJ59B3Nw8SSH3h
         WB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977348; x=1792582148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=g+dYZRlhZOYSzCjeFjgpklqJg0bSfFYVs3b0HkpNEkq60DryPaDFfEnLDVzKYS4t60
         yhCSBaPasXl++0/9iVjzShyEc/UlIzjnyrBqi08e/cAnlMr47E6Sf1SYpBOlCdi6uuiW
         NeyMkN3mgS+yhsTL8arNoPg4HT9FwTCvQ99aJco5vwTLRsq4mHyOE9rBSGVharYRFCHl
         pQ//r6tWbpeA+yLmvWvv9pYY30ZTTBvnxsexEUx++dDE02B9huW5rTT38PXLV6jawuWv
         8vPKpqRkSrJS72e+ING/kMQmyyohtkwPdiHE+7SXR+8tPiQ7ritT6/p4gDT8nijNRyGa
         0Pjg==
X-Forwarded-Encrypted: i=1; AKwUvBz3LTvjUkpiJo9JZx66mhiDoEDch66mjmCAzt5uClpb8eoKY1PAcANRmEy2gKbdHa+oMgJ9@lists.linux.dev
X-Gm-Message-State: AFq9FYJrLRPM/I9yEAJxlJsdzm+Ay5klfKriAsSRPsnw4HXXno+dQi+n
	vL3BsJr5oX/7LcMxrN1445SWlYcE1rAMjGV9bNgZCta223xyzJZuH+UTRBatPvaOseBMbrE8IQ/
	DLlq4yGpJuRVXIBLGHTFCsm9sBLRfFD4=
X-Gm-Gg: AYBFou1AT4qGP6OGMuo4FrPM79D6ZSpZv4ZkxzzGuGmpWBUMsxj9pJP2nBfLci/AiA+
	m27wPj9CgQxbkqx7tNLP25acumu2ujdBj9zY9DjZtfbhCye4n2z/ytrvN3Adi3uQFWDj3aJQv8b
	YhIm+9nb6Yx6tgamJRDLtIDXB7DAK5K1BeN7zgQy9zFSILs2nSewQcLTKV0gq6+2JMl1RcU6FkK
	ItS9JKEDFiDNDTvFLqyyNMkrjNv5ArEXj/Xwj8hlIjPew5Jnr8koQhWxCcCmSXuixBOS5z7fSeQ
	6e5SaSQyg3+KQN4GbsRhXR5lB9ACVb9lKeZrVixCqfReK9P/boIlpIqAAdoSbVqdi7GCtU7jZyB
	XRw1OopIfXrt9RIDAI6DWtQ7l3fAVo2ABeX8DxEmXi034369iYDM8Z6D70GVDiD/a6K08yelisF
	49A1L0PIh/2f8R3fex4a+Z0priIT1WlLCgM4iEkN4sm7NlwxAieYc=
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr14326600eec.1.1791977347656; Wed, 14 Oct 2026
 04:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
In-Reply-To: <20261013223946.1836757-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:28:55 +0200
X-Gm-Features: AclHuK8qVHO7HVQy6LgzcUgjYcQf3EimC6SJcN58PVqcWVdOf6T45eXZNeTLsEY
Message-ID: <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> +/*
> + * Optional: not supported by gcc
> + *
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#require-ex=
plicit-initialization
> + */
> +#if __has_attribute(__require_explicit_initialization__)
> +# define __require_explicit_initialization __attribute__((__require_expl=
icit_initialization__))
> +#else
> +# define __require_explicit_initialization
> +#endif

The LPC slides mention Clang 14+, but from a quick test in Compiler
Explorer and a `git log --grep` on the LLVM repository to confirm, it
seems the attribute was introduced in Clang 20+, no?

If that is correct, then it is not available in all LLVM versions we
support (LLVM 17+), so we should add:

     * Optional: only supported since clang >=3D 20.0

With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
