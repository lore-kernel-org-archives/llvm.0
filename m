Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C517DFE7
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 01:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115320; cv=pass; b=CAE3OnNoUL0q3OU5MzAE2yYMXzUulW+h7+hmitlnUnvNptZGUPWFpYz50rjiXigu2P/9tinK4gGSsJ552ExurTyDpmDM/ZkPgRY+s62rWJnAjfsrw7txbt0ePaH14Uu5qen1xZEtrudKCgOVCZK7LX+EcEgQR+vQn5fkFQ1QWjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115320; c=relaxed/simple;
	bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozFjGFHNaIvlAzlBZkxVYX9vToNcY511ZF7O6Mkc1GJePcgzte07rtIc9xDV97Qi7KhLA2FSLpFDlISbKHakxJg+XxhSx6jZ9LHBfk2ehulJHxRNNVivKHPxb81Vzd3qlezXOCn1rFMAHW/KwES5qSqN7iZtm4J2fOMsQPSAuDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=lE4qBV+0; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="lE4qBV+0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845c92bc464so1594658b3a.2
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 18:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785115318; cv=none;
        d=google.com; s=arc-20260327;
        b=mrhd/kef74QVFkaVCY3zeaPgwu2CM0GDTqaI1qqVYn4Y0rjKOGHaOgb61OFsKs9ksq
         b7RPfwJgXZBH7khwjOf5HrwDffS4EGtoxiTB985X7j1l4DHRUhAG+auMzboOEy39xvFq
         8L12+atzWS22GcWUkcpeC2875orGEqUe0AIgHjO23GLDPnXzSdxUpikjYTMhscxfDrcY
         y5b/oap8Nh72EcY2oiWqWlVzLnIrFl54Z8HijvUNuGjgHNkbfMNeAM/fZqMbGBDMN+Le
         OG/phg43kd7dkaWc3vByeMxX2cR5Nz/wzBpp3R7xX7Fs8cKLD8ZDsey9JR7vHEeaqG9+
         1BNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
        fh=4zzPNHlowLexQJwH+WY6ReaEwQLpsJ1+oqTMrrV655w=;
        b=A/5LtT+gJQo3wJzO8jKOhVJlau783vhMAMaUQdlnOTLob3cNx4oej/0uNCjVrkqi5E
         AdRQnPDokW4KKL0UZe23bkmlR1UVPtH+A7+zC3J4g+0I1YJQmgh0Lfhzip3I49pmnVtD
         p9gcr64SSPIw3WGgNMt6kCsvAL04cRFHb49BiX5Qz7ZEXMUnnHupAHbO39MDiclRtI4I
         lKzp4OCTMM+f5kym1pb9j8f5e2zolpBwWsfK1ViwtAby+NPQ0bWsk4oLawqvhDSlbrDA
         R5B/2Wr1fFDk9XUIxv+CulGS9sti9Y3yS8vWrEAgBByvhdADqQ2tk/CwPgB/Th31vlQm
         nnXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785115318; x=1785720118; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
        b=lE4qBV+0NMn6oYrio5Qx2a90/IQhRvFYC4hfsYvz8opisc0mjz+YlIPXtv+xTmWpUJ
         2WboiNoMvL9FrvD9UaVRxua74iyJLyBTO2ufAurL0KT02jkFok2fvfFL1u78O6O/RJG0
         j/bskuOVcrRtp4lUiDyKLRDraBYaNcEUzrslrqUk61Ozp21HgYWbHnlV9GC1aMf392vT
         ZQDCka/u/YCNiX+pYQUqY3DtJ9hfA8f9NBIt5ELWtulEEQCSYJhwvOQeIjBiyg4lXp0y
         98qvASScC0ge58g26lg/U4fmYy2tYmdtZgZwkQoz48vEU+CSgXMUXGkO4ODFAHAOPamr
         6ETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785115318; x=1785720118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
        b=ksmig3BxhpD272vkXNqksrOhcxnCHoO7DDFjoAfhDqFzs+7G2BSNZL02p6/+rOqcb1
         AmN4cmx/I6waebIqca5+yVVsqJNVJvxjWYw1iTd99nC2gCYLhes2AEBNavdU2lpffsit
         8nwPd5lBFeVaSpMqThK+eey/hiFfwcQRrM4+ZW11eNkHNoyHgVi7KOj8j3HfYWoWrJ+w
         Qc/swmwWvvCG+WMP/UebSgPYKvssKVUAd3qsvxUE2g35lfzKHZERVuC53Kmq6wfRIDjt
         eqEDfo7gmaU8sOjWUxcpY9yC5IjdKsrH+jvAJ6xSBShBarqefO/jo0AWbuqrXmEnClJA
         SIdw==
X-Forwarded-Encrypted: i=1; AHgh+RoqrjqE197a2WsOUuEOK5zN7KvDpCNiiYHLKN6SkfMgcQQdVhcf/Yf/c8j7DuGj4zj9RAn0@lists.linux.dev
X-Gm-Message-State: AOJu0YwetK/V/8spH9WN32OQTDFkXQFqUv5mfickF7IWJIebVufkEhTL
	af1HxC1tPueJ+UWVoeVkT9tX4tUOh3CtMUA2+5MDYyyyE/ktPBZ/R44v9MJyIXmbVuMEnbgPq7K
	6CP6q+4wsTk4fIzCoqtgDNzD/Lzrc+Y3Tn1ps8b6SZA==
X-Gm-Gg: AR+sD10cF7wZZugglhWbkxl0FEwJSDqZC33R89UN3N7GUCSU8BMl7YExeDFHw+r+QWm
	v/SNw2kkAP0iORDcG/gCkXZGBmtOaAn4Nd5ja/xukBI1bQEhHUHl4zrhPFHfd76rBO7wCMMK8kD
	XR/u7Fd0CHycNF2+CtYc0/VW9luFhed0riGabHpM+QFFKtixKPMLqB+3hZg2WkJDY+f/ahBYQSo
	iLjY9I/WIZtlzUn2AZ6YTbV6u0Vs0ZFOZZlHu1aHgbNtFk0jV8QHFRTbJV5I5YF1jkP9adGXtRf
	TKep5wG3OATWeZmAQwwO+IaBwqgxg9A=
X-Received: by 2002:a05:6a00:1d95:b0:848:7f8a:8d0e with SMTP id
 d2e1a72fcca58-84e595a7496mr4718407b3a.55.1785115318121; Sun, 26 Jul 2026
 18:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com> <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
In-Reply-To: <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Mon, 27 Jul 2026 08:21:45 +0700
X-Gm-Features: AUfX_myUzCZmK-8Zv44YuE1wIuIVGakPvkXtDYtj6PnztbYhLf6rbdX9Uwoz990
Message-ID: <CA+KFgX76tbg_LTh6-PO-zrmhWtrjP4y3u47s1wximVFUQKq=uA@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before the
 arch macros
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 3:16=E2=80=AFAM Thomas Wei=C3=9Fschuh wrote:
> __auto_type is only supported from GCC 4.9. I think this is old enough,
> but it should be mentioned at least.
> We really should have a documented policy for that.

I suggest using the Linux kernel's minimal requirements. It's GCC 8.1
or Clang 17.0.1. Ref: https://docs.kernel.org/process/changes.html

What do you think?

Should this be documented in nolibc.h as a comment?

> I'd like to apply the same thing to the __nolibc_syscallN()
> usage within nolibc itself. While today we seem not to have any
> problematic cases, at least I was not aware of the issue and breakage
> might creep in accidentally. We can problably rename the
> architecture-specific macros to __nolibc_syscall_archN()
> and make __nolibc_syscall() the properly evaluating wrapper.

My current approach aims to make the changes less invasive (that is, I
don't touch arch-specific code for this one problem). But if the
introduction of __nolibc_syscall_archN() is preferred, let's go with
that.

For now, I will wait for more discussion on this before sending a
revised version.

--=20
Ammar Faizi
