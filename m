Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538721019C
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041444; cv=none; b=ocY4ZI/016ymScluvO+5i58zjng8rad0LxtfBY2lYlOeGMjIKB4bmcliQTDjvKimMcO2Mzy4hZI5g7prJqLkxf06tgJqvIZO8UQXcvwRR9x0xW0cyAIBKel84A/x3GfKYFlRELJpWPXWQ8qNwVQxwXuOcE71/RzwYhT9hGfVwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041444; c=relaxed/simple;
	bh=NG3Flv7V1JNWQucAPiMPvjdrPT7SVnIc+oED17nZscU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEu2Us3AMa3nNEu2XTSjvM1U+eHTfJqjH9rdpiN5e10UZKJHEWCIYWe49lHDWFztXf7/NVmonNt97yx24310owyIxHos4kxXM7Lf2+srMIjvE0lRiv8JWVmPHA1r6FfkUoWehgfmQw4Yc52CskaD/c9PBamRjFIPvkj74KZhzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCpMvrFy; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCpMvrFy"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b95f87d64so1793981fa.2
        for <llvm@lists.linux.dev>; Wed, 17 Dec 2025 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766041440; x=1766646240; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NG3Flv7V1JNWQucAPiMPvjdrPT7SVnIc+oED17nZscU=;
        b=FCpMvrFyPQUtECWs9M+ve5vN9NQJ8x/+s6ujY7EVggUxg4gnzyeuxemTeGrur+HxF4
         mNwtFuh7sWZ1F7rTl8EXIwA9XWJn3qNJz2KlUTkVp/1aypRxV9fjAweUfJ73J/AHtyzQ
         AIX3v6dOzwgSJKks872FVRz4//oovnjCMgueUKskm+QnbPpkp8UKEG0oB36TbtG84qll
         1jht08y7wQolMfiFZ68OGhtHBBJkr91RnqkzMeAjqMTyih5pZAgqohAOe315fACkTeak
         OHG8QCNB7x3UdjhQ3Rl+C/ZRYoCtWaxQ/AdrZ6CReEtgCezFSXGqjjFZ3KwOjL2mM9Om
         8vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041440; x=1766646240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG3Flv7V1JNWQucAPiMPvjdrPT7SVnIc+oED17nZscU=;
        b=kZ5ti1VlwXOYV6L9L2OXA2pAR1cwC+1DBSnJQABvDSF71vpiUcSQ/PusPN6opgZEJ6
         dATcG4K+g2+5rRI6FMfVVCvUQmqKq7/QYihMY2R1BxOJ9399RJkm/gGQ8ZAuoeuq76kU
         +LvEla6Lzavr1YgOZ+Aa7b6d9QwpRtVOe9ScEJOVWKyPfYhU12MVWfYfcg9R8cNTeG5h
         kfKgQM9JBhfx2qUXw4vKwnKFsGm8hKQOousB2fpMhIqOiwvJ5tVAOL4bZpfKfT/s9YiY
         q9VQxKJbLwjLT13XKEnHVa6a74zEiI5nfWs2owtPWeuSXw9gjx4e7o+BmaEMMzFhkgO4
         +Hww==
X-Forwarded-Encrypted: i=1; AJvYcCW7w4pM+M9lOIeRPqQy9VsOoQhj2AtGjwImasyinoWmgzPtteUOBojZpPPf8erdaG2bGiE4@lists.linux.dev
X-Gm-Message-State: AOJu0YxXxUx35Q7vXbwK+qx/5VxwxWHMkiwBcIDW2NLX25rScuDjh34t
	j3RHZJRWi0U8SgB+M7Jnj7Rv36bMFmjJz0GokTbFw0EJyn/3AiheHKzwTMfdLy7tmRs11vU/UdK
	rZ1IeQqcvuLnwkokoYk4Kg3WiA3AK0NPm/9H8bI33
X-Gm-Gg: AY/fxX7R66OtRseHhrLJO2elBLCM3KcCv73NrFohydToWMpoLufvf7s3fqa8WU00R0c
	qkVMk1dffaddVESzc6rQdDU6EUMSc6I4C65TVdoulw9VbQPitbkGcahXLs97XICNQxETAZhpbol
	86ddmYkC/wcPNyQc/EkqIda4+gzVLiiH+h0pzQ1MNwTA94MDva+0yih1DbnbgrZs6lqN4wL1FV+
	KY5Ba/AL037/nwGqDMO9jwgxONJCV9WoiEzxekCkzJgUJmHuD6fInLVCTHt7yGWG/LuieEPuPbu
	ksl9MrzZjociYOpqnbAta5P+DzKQ
X-Google-Smtp-Source: AGHT+IGa6ehysAt1ztbTbddQktMKfUrCu3vaE0KFaPi7hrb5bZr+Y8vH8de83qrbg/8SFAqqSQSjSGQ4/4o9cSJ/80I=
X-Received: by 2002:a05:651c:e17:b0:37a:2e32:3200 with SMTP id
 38308e7fff4ca-37fd08a242amr68378951fa.33.1766041439731; Wed, 17 Dec 2025
 23:03:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251217-revert-scripts-clang-rools-handle-included-c-files-v1-1-def5651446da@kernel.org>
 <20251218001336.GA2451437@ax162>
In-Reply-To: <20251218001336.GA2451437@ax162>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 18 Dec 2025 08:03:47 +0100
X-Gm-Features: AQt7F2qsoLJMYrCrAExz1xhd2YRJehR5Pg82DcCwzCkvH_0u7lE9uhe7avhFjOQ
Message-ID: <CACT4Y+Z5Mtax6BMtpY6Zj9Zd_1XjphfkMDp_3Wrzo94Pw9=VhA@mail.gmail.com>
Subject: Re: [PATCH] Revert "scripts/clang-tools: Handle included .c files in gen_compile_commands"
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Dec 2025 at 01:13, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Dec 17, 2025 at 08:13:43PM +0100, Nicolas Schier wrote:
> > This reverts commit 9362d34acf91a706c543d919ade3e651b9bd2d6f.
> >
> > Dmitry Vyukov reported that commit 9362d34acf91 ("scripts/clang-tools:
> > Handle included .c files in gen_compile_commands") generates false
> > entries in some cases for C files that are included in other C files but
> > not meant for standalone compilation.
> >
> > For properly forking clangd, including .c files is discouraged.
> >
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Closes: https://lore.kernel.org/r/CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com
> > Signed-off-by: Nicolas Schier <nsc@kernel.org>
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Dmitry Vyukov <dvyukov@google.com>

Thanks!
