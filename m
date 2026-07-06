Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CBB436BEE
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361223; cv=pass; b=SA6nNpBWQdVW3GtK4LIknYfceBWgxX1LdeixWuFEypX44PBV6ucXK2mGsGNiAZtibkE92yhQu6jcUBFvUvI8Bm5/dgcuSCoE8tAmxwBomTzdQ2BEwibnqjkbJE6+KHLF9PW57hosyGpIZyDGSyW/kfOH3YPQHZuDWOizKKcPep0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361223; c=relaxed/simple;
	bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMk10Yadzm1mQyT5trSziV7TEeAo6UUVKP+hyn61GwfXk3TlwgEuc3vlyDuP/rarmAqs5VI8VPfQ9TOTTQ2w2BGFAcWOfYN2BfYjZD0iPue1GAmxexLzkjDkFZ6CwS+paJ2sbcmz0Nl+IVeOh7q4CcI2ZZ6qzX3wxXU0kkfgbrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O2lYT+mR; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2lYT+mR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso18640175ad.2
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 11:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783361220; cv=none;
        d=google.com; s=arc-20260327;
        b=gRbqjtR3xFyHf8JoEtnHAw/ibJRfkRanoKHKQ7pInjMwZ+dQngrEY0N+qQMfRDMuzB
         XCHFsSUz4ARsR+piJpegpj/kyaMTLSQT/uM6dhUnTbyRiirznHR0zMgTeNFCbEcDEQhH
         0/rhrk5MwAIQnFYgSJZ3br1RMBEpJ5+tkZjxmakEg9shqI+lAhUE5aiCe7gOCNDnRdi2
         oBiJ4NAPN2WHPYCNH5K/0KzwEbW4d5a+McL60XIm49ef16lKGB4AXvME5YFk0pgx2ooR
         5XNMYncFrAhqJLvVZx4Ve2Y4MlNxm4QYOfmQO1RR53Lasb+jc8eOBbWWFm71XSCkVoBF
         S6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
        fh=IPxdbsgyoTiE26aiD5xEoLmr3eAvvMvut791qeW+g+I=;
        b=eTCQxrE926Xet8eikFIQzxSO72gb5klJM62txcX5yMMZejCKIIRGZL7wRHK/837w4o
         vjDVTOKs9Wo5QK1ErQmRBbeWAtot3ELaXgM5D4kzjW0xl/gI7G1UUgruC0h2k3bwRYwL
         mprXMIDjasdXMnjBKZC1JenODz232CfZKgJDu0rMyxg+6TgruWIavXiP+j4H1G2BAyPU
         gOqzklb5bpLTYwpyedyYWGoazhy0+/alhjAsI+S+W+Aj39Rum4hGIctfoV6GfDRb3M4a
         5bYNLuUqZTjh2hvaapXmKrrr4fSU0EO50GqkdRrIPuyNrnI6dZdwRHlYFOLuBakn2SdW
         Zj8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783361220; x=1783966020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
        b=O2lYT+mR6z3QEVWWMG+dhsiBNXyzmY8V6eDTfOdHZSdAKVf3Sg7A5bEcMrUTd/I53z
         PGgQXxo5uQLWxkdf9/mlQRkksMW9dPM/saNkc2qR+pl+e6LI4AmZCoW7L3jOUZkUgQB9
         IvV5jd9IBglfryPTC7kbWVyTdhpG//Y+j7S1NqndguSNA35NwNjRMr3YgpDoaNeQkMxp
         A2vofE9bSH5AlCRy2UBJjWU/OJJ0bzL1bTao4cG5iA7CwtxFn4bmjNzGHwCP8bR5lCjI
         VlEMGEpRbXemn8xKSx8wY+FH7LG6j7vuOq6nTiOWeas9VnceOHqPbViNcrZUQl+hwYyK
         a/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361220; x=1783966020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMrMUI4UiH1bTD08Nrh+4d7dEyXFH++5+rlUyuRsk6c=;
        b=ScgBr+dQDAuellvgKVw3ci6gQwst6KZ8Zjr+P9S0d7kajyh65xyVHdWcP7u58o2SVx
         7BJONbEZRxzOFHGAHwTL1jZmWYF/0igNT7IwytEWm7h+7xAfRR9usICaMY7L7e6BhIPA
         tGTpMvia/y9Me/z0v68w6lI4E6THp5dI0Ou9WYX0A5Jh7E8YzvEcLXhaEom2OgBzEyWK
         2MhXGwU3S9ihodCjIUlVuzVqfVPds+Suc05g0c8Gq84gQIdd1VuRi/cU8xCtS7pwb/yA
         MJ9DBBqpDks+ofVKyX3XmdrB+p1/F7h8VnApjmb9sLvj44WrSYIXC7CJRbZ5AnwaVm7+
         qYDw==
X-Forwarded-Encrypted: i=1; AHgh+RrQxBKP9ohI0tr6Jyi9cVtGpCe+n57wNu8MsZYUbUBOB7cKXLC7/5+HW5jMxa/kr5wI89A9@lists.linux.dev
X-Gm-Message-State: AOJu0YzF5taC9LibC89xRnPSpruTI4w/gHadIPLiu5jBR4YI2ItcUKzi
	0zTrCMjQW94zJ4cu7k+0KRDfj5LDON2caBTr+XmHX8GOdMF7x/BBUEGvxZraQbJWeZ0jLOgmNJj
	7mru8x1jrol9dzh3M4MBPEkNNfu1CJlp2Dn8m32B0
X-Gm-Gg: AfdE7clkasDEJlCDLSaY0R1FUXEVql7qRxPFWS6Pa4YI/Ilh9DP3ui1JFARcEWWKWhk
	mxZth6PceFc9zmKj2GzAiVAt+dytw1IQffPvKQ83NPnhPjPKXABF4gb55sDtpK20iyGpTQ5/cwV
	ei6j0+VxfvAT3Xo9p5b+8oxuM3rI5n4mM2a0trebd+sC0OLRKOBb525BWRCiz4Y/R//fht/Sl2e
	AXtzES5GBVWvGcO4ILkl9opgBtDAHiMUxGlVIi2MklQAvolC6TfkoHL6IeMRm4YZj7mGQ+VN/RZ
	C5smcYhCG8dYuw7YvdjgdKuq+5CPZNj0/CyQAYrMwN3RoIP4rkUSqUKeEnlXh2SdhbOjeMGjjY+
	M0xisidSTKvaPDG+OgLIFG0e3vbOQj3lvRcciXqA=
X-Received: by 2002:a17:903:244e:b0:2ca:cb8a:f26b with SMTP id
 d9443c01a7336-2ccbe3f7890mr19740575ad.10.1783361219085; Mon, 06 Jul 2026
 11:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706175228.2468730-1-dmatlack@google.com>
In-Reply-To: <20260706175228.2468730-1-dmatlack@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 6 Jul 2026 11:06:46 -0700
X-Gm-Features: AVVi8CcBQh81dXbjkWyXxADhbwcVGrpYq-P2xONh21cgosHQiIwPIcGgha-co4Q
Message-ID: <CAAVpQUAgt9TmpGMkWC-sA8tOPyCwM=T+07Dt5FazHk1PfWmGGQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: harness: Mark test fixture objects __maybe_unused
To: David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Will Drewry <wad@chromium.org>, Aaron Lewis <aaronlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:52=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> Mark global test fixture object pointers __maybe_unused since they may
> not ever be read (e.g. if fixture variants are used instead).

Not very accurate; using fixtures w/ XFAIL_ADD() does not trigger
the warning.

>
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that causes this warning to be
> emitted for various selftests and can be upgraded to an error in
> selftest that set -Werror.
>
> VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> selftests: Add -Wall and -Werror to the Makefile"), and the net
> selftests builds have been noisy due to -Wall.
>
> Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked p=
rocesses")
> Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Not sure why Shuah didn't pick my patch though :/
https://lore.kernel.org/all/20260530054722.271157-1-kuniyu@google.com/
