Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288F533E35C
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736600; cv=pass; b=dn+m5rc+97rSTkbnmqfnMUQ63wh8trcHHYXGba6DSJILQRKpycnc1RIKLv5FShjlsNAQkNS3bl1IolKBE6tLZapCLA7DixMYBhyQ7VKm3lz5EqvL0V20uNzMrXtk+vpzX9kcavVENk1QPLoMJWj7nmfibLsrWl1B9U3mURQzJS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736600; c=relaxed/simple;
	bh=jkE+1jyuVEWWG3uziMqtpVHI1kicFJj8ciCjBQ73Ldw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJSJTdeTnq/g4rE6MrflOEiV4NskZyeXHiqWaW8OBg4oATwFTr6VHvWx7ihS/0PBARI2gOOK044MQ0XJxg+nCKJIJS+TbK61AyAaH3hk29P9ONCG4zf9/xvJOITU9bv9YCikZAwoSvbC4CZW1ITBe+0Ng9O6DopRexj5ycVMgrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KnCxxeOi; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KnCxxeOi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69565156c06so4637a12.0
        for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 15:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781736596; cv=none;
        d=google.com; s=arc-20260327;
        b=pjppisYdW9QxrIxh3/l0mXToe2aM4S2pYAZv8iIZ0cghITDmLpnI5wGUjB/7ypwGC5
         T0iZjR0ztHkXuN80ke62PtwVjvqhFCUNSrSkxpggjjVYueN26pR8JqbW+mG6MyZAphER
         DDiiLeOH5+kucR746IdPSKFuHipHSXMgGYRA3w7ZzWMLHjCnpavH9sDdBzWaeW4LILyY
         bxIQbrZQgcbXtOBQmC7sooZjYT5jUZ3embll2VfH9R9b5lDGB4Da20Aeyih7Pvh6Mn1s
         Qrv7tp3ey+kREWfNKkFWNvTdIkpwK+2hAEtoRUixwqrCizO+uEbFAdG1dL/QgEeDHa1k
         dgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dgajz30m4A09ucwSttYdMUWYSA+eEfPz7ch+rd0GLbU=;
        fh=P8+VjfGYcXGZ1/HNNfVCQJOtzu5qtezDmzKLJIUP1OQ=;
        b=Gw+PZ7rx84EwnCaMD5S2nEDMd1LxGPagL/g99T7qlaK84pMFQDh9N51aGBymwA3cZK
         /Am5o2/EMcL+i/2yrDG6aZuPJc98S2/d293NBOehMsRYR4NxtatX7OYERL2HWkT1Alb/
         7Q+vnC+Y5mo53Abn96JRZHtGrFvEwz4zR5oMu3GG9pCUj8cywsELq51N0Q/f+5wLm3FJ
         g5W2aSJBzanxlTYdpHVuuQ5OLbmFl31+JICLANHA8X6e6RLYSpZoTc7NQL0zm464gAcj
         m28cPhWpTzpsaJisivi3nTKucBlQtXnZcDeUSruze81TF9ASIZaJwZ5Wyyq8CLcrDPm9
         a6bA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781736596; x=1782341396; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dgajz30m4A09ucwSttYdMUWYSA+eEfPz7ch+rd0GLbU=;
        b=KnCxxeOiJcqB7lzucr00Y+WiWDFIWfLw/+M+rGxRnrn43tRF0WnQqY4ZeQxcZMGAMh
         otVmFT0G/4P1jfLHO4SyqYQMayrJSbnDelvSW+x+fVNPAUfDCeeNP6UeOpdUAcj1+m4C
         rth17jUL8BHhuBw2VVYCe/ozPFxgzxLPpEFFGtcOsvd+RTek9GXOtWK6+I/vJNZX+Zmf
         dRj9ZrdF0g1rAH+ml+9KU7LlPAy3tTDd+ZPs7EEHiUvliHlxKL1Wz5O5jzO+KXXD8jTo
         NrxwEOuSjUpU1P+MtVbpAnUaTj3NofkBxnvgDCneBtKHvbQJSMUxvgCDr3LnhGe1y56x
         cahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781736596; x=1782341396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgajz30m4A09ucwSttYdMUWYSA+eEfPz7ch+rd0GLbU=;
        b=KpCphOko+1xSgKc5Af/o1/jid99puXFTWVOtlSV8APsanNCMPk9AfX0vABVJYCjaX5
         RJcPZkKN59sGEOLxHPFYuDWIbjB+IvuAiw2NI/hg3jA3OUNkdlitZYvwXpbAugFjubWq
         k6TaE/D3pu6NApijry5wt48ZSpENEUsvSFqa88yIu2BGSSbrIBYYB9Yf5m0ysgsDbH7Y
         jX7DV/5k7+Byb95exdkTXDIiTy82Srk/4rFU7QE9bgYSy4WQSwFA0cKp3zYria2hRopr
         31zpQBB21FQbBHEQWfhWi9OiDwQ3zpQ5PW4Ugu7N1HQ5VSYHKFmiYQ6tvysz7qWPEnCw
         M+eA==
X-Forwarded-Encrypted: i=1; AFNElJ8rwK5l5zcppqgMAq8NEnCH8HYU4rXx6c+RJ4kNGbioZqguzW+RBtYEdUKcPyqv9weqJUiI@lists.linux.dev
X-Gm-Message-State: AOJu0YwXy2+uXqVmCqD5WY248uRJd82Hdmt5wdS1x6vQzxd7fmEUB6LY
	tTod0F6OEU/3UPduK+Lcy+96V9OccpY277pS2wjNSQxCLU3vlcPW2sCDSRsPp/itOnM3tQ0wxFO
	kKVqrIbwLzpFdl/RmYnTlNogKzu6iioR0sV3nJ1JA
X-Gm-Gg: AfdE7cn/U+1zGJr5OU5qaGJmCQZj5NyrMcHKo421Bf6YXY1sIxes94+xX446jZxFkAW
	h2v10ZalYN3bJk1ILNAmjAEEo21/FbpOMUN2B+x3BeBL16BRituPVXC3HQi3mozC7xrKZHWoGRQ
	fCt99W7gM9Kib08h03vqFimtegpqXsVSwkb78Vxhf2cWamdZhLAUt2z2A3ffvBhVPCb/VdBZ7c/
	skNWwOxN9H5UViQNIJ9YuFvGvA7ddl02jsW/IhR1LicbbM3yOYXm/iIpGl4M9h5mdJxNMzP9ytE
	e+0PVrWU++mESXWJhIyTL8kKQBQeDg/2SEC9Yw==
X-Received: by 2002:a05:6402:4558:b0:68f:d41d:ca5d with SMTP id
 4fb4d7f45d1cf-695d057dc1dmr7336a12.11.1781736595968; Wed, 17 Jun 2026
 15:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617224623.1346309-1-xur@google.com>
In-Reply-To: <20260617224623.1346309-1-xur@google.com>
From: Rong Xu <xur@google.com>
Date: Wed, 17 Jun 2026 15:49:43 -0700
X-Gm-Features: AVVi8Cff13Kb8cdK24_Huf0t2IOMIfHEURXo335nb1vCgemTKsX2Lh00cazJs2o
Message-ID: <CAF1bQ=RjCH8PSimVRE1RdR91TptadYigp=RcUOVc-rJWvu2K6w@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Ignore Clang LTO suffixes in symbol matching
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	=?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, 
	Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Changelog:  This V2 integrated reviews from  Petr Pavlu
<petr.pavlu@suse.com> and  Nathan Chancellor <nathan@kernel.org> to
use a more direct fix.

Thanks,

Rong

On Wed, Jun 17, 2026 at 3:46=E2=80=AFPM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> When building the kernel with Clang ThinLTO enabled, the compiler
> can mangle static variable names by appending suffixes such as
> ".llvm.<hash>" to prevent naming collisions across translation units.
>
> This name mangling breaks the section mismatch whitelisting in modpost.
> modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
> safe references between permanent data and initialization code. Because
> the LTO suffix modifies the end of the symbol name, legitimately
> whitelisted structures fail the match, resulting in false positive
> warnings.
>
> For example, a static pernet_operations struct triggers the following:
>
>   WARNING: modpost: vmlinux: section mismatch in reference: \
>   ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
>   ping_v4_proc_init_net (section: .init.text)
>
> Fix this by ignoring "*_ops.llvm.*" in "from" symbol names (the same
> as "*_ops").
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@i=
ntel.com/
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d592548cbd60..a7b72a81d248 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -969,7 +969,7 @@ static int secref_whitelist(const char *fromsec, cons=
t char *fromsym,
>         /* symbols in data sections that may refer to any init/exit secti=
ons */
>         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
>             match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) =
&&
> -           match(fromsym, PATTERNS("*_ops", "*_console")))
> +           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")=
))
>                 return 0;
>
>         /* Check for pattern 3 */
>
> base-commit: e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
