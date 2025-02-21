Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA072066F1
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740134655; cv=none; b=LMgrh9tOvo1V4xbKASn5G5qqQz5136U5CeeKIHsUT0X6G163+vzf/oRg0bY7/HodVHohMWUY7jrs3V3xaoD6WoewLZFtZfAV6pjcUu0IjbbFvSHuTLid4tH2WhJjpmKKxh/4rjHWbeZYl4Ts5IkGHDu35J86B5VvMN8Gp45V+/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740134655; c=relaxed/simple;
	bh=w4iLK+g32pYcKCVfw3LkK60bPTa0FipcgGGc4wz+8Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLjupF7Fb+QHQkMDaVQ/gcre5iSPZ1EGj9qoI/+rBhWXyOHpUFPTjRoJ6yEKkrg+ZPmmRwQGCCHa5VN3cCdLGY+wIMJ0r6/1u1de8kz4GXZvcTAtdvTMb2+SNVaeh0HtaaotJOKwk+nS3K58ibZ4KEqYWQ5E0WrELj/E1AWJtFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=en96N8L0; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="en96N8L0"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5452ca02bdbso1849181e87.1
        for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 02:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740134652; x=1740739452; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BS7onsO7kSNNzuYKYGVRsld0leREL2Z2/ajH0o0tVY=;
        b=en96N8L0i6ohxoNShULk15k9KE5W8ZBRq8KhXOUB3HbHhZr9sahRLpghAlsUKLY9+c
         UD+vEEX/wspQ0Zd3k9t9c7RtQkMAOEtQknVmDa647+m4YYdQqAcc1QnPV6sqcRcpgahA
         TpuPWvUsDL+NLvqZ+kI8+uq/gCUG+EiVZj6DbvRHkl+m2Nd5vHhbZLn693tJoCnXpI/9
         e6xaBl3asOmk7oMsG4rOsxujcH6XKZdC34FTV7fgsJo5AyEQGBspXIOMpGN4Z8HhleaF
         1h41yMvAnarBAGHT+ixZ3ie955QgQkgU1tZwkchFTsdR9yBYyn+Yev8A1HFP8W9SX1nu
         iI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740134652; x=1740739452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BS7onsO7kSNNzuYKYGVRsld0leREL2Z2/ajH0o0tVY=;
        b=Ovr/EI9A3Kd9lo+VvhUFFYiGYtMpzRgBofxsazECS7YL69KhuUHBcIu2ewtAGLUi4w
         c4D0a1/NyDAv2yeqB2NssmpyUjZC0KT4WNWgzxhUW12g8Xz9dinaxMA3leF7K88atizI
         XP/NsFmCr0Wr5gb3v0ql/7b3/K7NUR42zgcE+UQqogrcfb2Xcg4HgCFY+uRhDxt36mb0
         byXF9DBVopSiovaeu4RMG+PupZl8uLUSEi8tNog4qnCQFWbJYMBtozhqzOmE8P+To3eU
         UoKfbs9M4MfYgzHBEytj7PFChFkFT2vwlO6vCRWOg6uP8rjAi6WEOoC2/pkB6Ox8ufVG
         2B/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnakjTQ95OqPCb3Km4pgGH19MQ9nJN6fi5fBymkBmDpuwv7rb6/9Tu8YkDV6F60AKaRkq/@lists.linux.dev
X-Gm-Message-State: AOJu0YydGZrt8P1DmqGD+JAs0A+4s/dVAB2ic1DCF4QBhd4LQl7QDgJN
	ikMT+gXjle2aKNEQ3acmbTSMZsH4hOT3q9FNq+wsnh6TYzT9L6+th3DcrgFRmDRv6ffUV9gGzYW
	D4fE/kHxWSLSBmNeAo8DikHNYjw==
X-Gm-Gg: ASbGncv/eNsUuU+ifo+V7DM/zfx+Gr3W5pDL1CADTmaCcjcxvthvEMp5Y/VDSCZVfOU
	rWdEi1uzhcklDXgg0iVQ11Dkn1HIUzCy0sAQ60KWeuR8mCK4AUyxUazLhgnCCtlMyxfkVO6PbLH
	qAYRP9KYWp9mS/B0Acn8qY6A==
X-Google-Smtp-Source: AGHT+IElCXBChLLYNgT3p7IAhBhrNRWrZbxrVdqMPOi0NDp4FvMkm5xxiFTVXcqO2gCKD38y+f39UV4RWiXcugOPpao=
X-Received: by 2002:a05:6512:239b:b0:545:d27:e375 with SMTP id
 2adb3069b0e04-54838f590b3mr911776e87.42.1740134651883; Fri, 21 Feb 2025
 02:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250220-x86-bump-min-llvm-for-stackp-v1-1-ecb3c906e790@kernel.org>
In-Reply-To: <20250220-x86-bump-min-llvm-for-stackp-v1-1-ecb3c906e790@kernel.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Fri, 21 Feb 2025 05:43:59 -0500
X-Gm-Features: AWEUYZnqF_mUlVHI0riQC8xZE_YKMujs3DI5u4ZvdQ3_RWZkKEy9QhhZ85SbJ4E
Message-ID: <CAMzpN2gnYM8VhmHafBmh5+6+WWH+caWoMTssud_+H2_GvGbGzw@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Raise the minimum LLVM version to 15.0.0
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, x86@kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Uros Bizjak <ubizjak@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 3:08=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> In a similar vein as commit a3e8fe814ad1 ("x86/build: Raise the minimum
> GCC version to 8.1"), bump the minimum supported version of LLVM for
> building x86 kernels to 15.0.0, as that is the first version that has
> support for '-mstack-protector-guard-symbol', which is used
> unconditionally after commit 80d47defddc0 ("x86/stackprotector/64:
> Convert to normal per-CPU variable"):
>
>   clang-14: error: unknown argument: '-mstack-protector-guard-symbol=3D__=
ref_stack_chk_guard'
>
> Fixes: 80d47defddc0 ("x86/stackprotector/64: Convert to normal per-CPU va=
riable")
> Link: https://github.com/llvm/llvm-project/commit/efbaad1c4a526e91b034e56=
386e98a9268cd87b2
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/min-tool-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Brian Gerst <brgerst@gmail.com>
