Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DF441DEC9
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 17:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360558; cv=pass; b=AUcrSa0oXrW0xaPmJ1zbPkiBzSDCXEYG8EC6aUoKu9DGnTzWO0NhxUduEJqbWK8bz/NENUGOxO3oMlOLOBH2oCiKmEygtWgol/9iQnwOD0HZqN53xxqmpR6lUbrSz0KwhYLEXsTCvgK8LerN2494WCJNQu7wqHIa9HVCXz5ABaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360558; c=relaxed/simple;
	bh=s21emSiFBXRhIG4adzOt8PS21mYSI/BQjSGzMfPEb60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT6Oy1DEFh7/tWA3KM2jroY3cbezLEI0ZVYCglvb9TLtWueLBmvyIUYu96AlyrwCmJOLunQ29CTtRuTJCwAO4OzUChKddohV0IZPFjJAyrpNk26EZRwUrUfmA89rdvoVlWa3RMuMfLFaOUzLJniJYsr14zPHNfibmWjCHrCeBiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SMeuVQss; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SMeuVQss"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3330610b3a.2
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 10:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783360556; cv=none;
        d=google.com; s=arc-20260327;
        b=cY/cpot01yhX0AQVn15+fqkwkoxRNuX3LP60VoFcdaYx0N5Az6auEFzIBCFU6SB3ys
         MUDAJVXIDzrZwmqNQpDFGzwV/tIh0PwXYUi/ooKwHnyAZlgASE90PUcXpRQj43sz+8Kn
         4JsQrAXxx91OwQ4nYlRlHrvGTX5vGBLF7WcnxqlFFNShPRZiEd0Ff90BHtLm3rjz4xml
         Xfz6Ee98wdPyMLPmYka1Rw2xxmjHNIgvGEaxUH5LtWOa4tXfe7At0l5bV29JzTWTuKb7
         D64+TWKzgV3JnNmErhl1KbbVDK35m3eE+myPSwkyCmJbx13waAHW7oZiCxuLAsxqj7ID
         aSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9xYvgWpSIsvxmmbSKcwuxv2TlolNkK+hPjDZbbXCRg=;
        fh=rs8LPe380aiF7ZS82/WpV2UusKq0Q894lmIrbw7/qC8=;
        b=YsRb1E8bcr1VoBb0v7tvSS9IuHRU3i69k904tc3J6umLPToEgpxV0j2sSAM0InS+bA
         tvEqo17hktekcwBEwmfFmmhfRJFrqyjjLyXzEEnjHTVOtUyswWrJIndVj2IC+P+hm1Ky
         9RqsAZl7DEtTMraKarziq/x1SWyF5mcDpeYuXmVvx13tBBaFv59DPMkrcrDfPe9GG2Vu
         4s3gumok/6pbqzSZJqh3boPQRxPZwDDbOeFvN4MKLh7dg8mRDERsEpWHXfaeN3Yq8qG7
         CAx7XK5kakTvnrq4AoxJnj78mH2UFWXEsxL8uAulPT7//P9NvIeUiBkGvWrXIPduNtZV
         YIow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360556; x=1783965356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9xYvgWpSIsvxmmbSKcwuxv2TlolNkK+hPjDZbbXCRg=;
        b=SMeuVQssiarnVo8f9icsw6orqEMNQ/UEdIpAvfsrsTdUPwSrMqSxt36GwpL2s9LplN
         ouWie9REP6iloW+AT/A0ljWbV/mKZqaUQLR1FzSYs11a7VVV+t7q+0e+rxu+roeHS96p
         JUGxKzKwGes6XR5yhpvox6yDSb5qd928X0Ja8DEMcSkdZikl++LIax768bz2wdILtvLp
         uSb9JaWU4K5UuogldKwKUKseTm2uMKHbdZ83CLK5maL+B1CDYl7Xw2JZLj9ZKuYxSI+X
         UsFjQEDCDp8yxDg062QP/XJ4DNDlYrRgDiuMtn8atf1FO6sPpSL6dO0nqy6WDLjoULa3
         EYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360556; x=1783965356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9xYvgWpSIsvxmmbSKcwuxv2TlolNkK+hPjDZbbXCRg=;
        b=YeVjZL7/g/gLUVo4r0LbH8HEqbkENc8F34yywGSJNxjjDzpSmAO3TtdQuzdyDTZf67
         6Icktx5LHDsifHkjzCIQUydHm8/KucZ9Z/CXh5fKBpuLm4m7QJ+h38qDzxZUNhymLFuJ
         mqO1w4+X3jxwlzQSRluXXJBEMha5lQYAi0A7Xd7Us/LEmTy5sWoxjhevlBbbx+WuNGeM
         5krbfMjoouzj4Kdc0nuORfVxXFZ6FuK64TnxCVEbJrVMdQU7PMZg6OBDlQ0tI9EGgqsZ
         f/w+sG/zL9LMHdvb2Kw8KvheyOPuzQTADZS8Gs1/CuGihTwK+qIgsIy36m6D9Sg89fjY
         wWrg==
X-Forwarded-Encrypted: i=1; AHgh+RprDWeomU7+BZwmtPl2PYS85EvSpeXdA4DbxhYJCMyP83w6CkU7P/1GJcYZqtqFriKqXPdP@lists.linux.dev
X-Gm-Message-State: AOJu0YzgbR1ZChJYOSdgKVBiLUVLt4DClL9c6VCigtqJP2AXnwHYSbK7
	q7H7XN9VnECDqjblpcDGHyGRMdth47oOtsP4oVA0/986Hk0ZS58Ta9jJGaKIeq+Tg6TUZuWj5Uw
	YwktP8/8XmGL1ptSkeYvLFHybc6Iy/L09azyDVdyc
X-Gm-Gg: AfdE7clp43o3nmFFybuxCwM0o3Z3CH8IqbgeWblGlUngHk5Mqmn2VdfCk8U0bZiKKDp
	D5xmHoHpj0SIYNkGu62WpSLpk7D6tNVplqvzyfbCm4w+zdpRa2UnAL24ecv52anQYPU1kEpcE9G
	qD2kwx77XAg/uh7Uzn5pfqCOXDvo8BF0uOU+cth6m4b1W5/VnFn5gU7tfWMP1cbZGKXDpi210JS
	OywX5w3cQdY6GaG0fmwywxbyKjQeDUMFCvJo/Px447IDjwwqgKK5BlB9cZ7YR2+INiW8axp
X-Received: by 2002:a05:6a21:3988:b0:3bf:6c08:fb8e with SMTP id
 adf61e73a8af0-3c08eecc5f1mr1926858637.48.1783360555946; Mon, 06 Jul 2026
 10:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706175228.2468730-1-dmatlack@google.com>
In-Reply-To: <20260706175228.2468730-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 6 Jul 2026 10:55:28 -0700
X-Gm-Features: AVVi8Ce5nbB5dQBx-YTPg7rJMXNHy2ZTmt6qPpfE6nxI2-mw0XhdUMdNTXLndXI
Message-ID: <CALzav=f4-mCCvu1fL4DUQ3saetcqCumvfEmQuDFmH5X2SHXqEA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: harness: Mark test fixture objects __maybe_unused
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Andy Lutomirski <luto@amacapital.net>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:52=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> Mark global test fixture object pointers __maybe_unused since they may
> not ever be read (e.g. if fixture variants are used instead).
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

Sorry I forgot to apply Alex's Reviewed-by tag from v1:

   https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@shazbot.=
org/
