Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CE23A9B0
	for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 23:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830079; cv=none; b=Ux0aYdreHFSHTh9GNJtbxo7+nW2+UWk5pSX7stWd/E06jTwRiTjm+uowBXmemSZTSvpiI7MddjCFjuTuKPiAiPQxBh7HPIKNsYoFLOMQADYZkQitL+knxiN8vtJoelMhQtwQk+AnxK4zB30MvsosE0onCKf0r7JKG/gIQ58un7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830079; c=relaxed/simple;
	bh=6jCng/YTFDTeRQn8f5lOGqcgmpk9+VAP8yf8TUEi2dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6PFo8bpYXka/3JtQLEl0qKOxnBbyjGTQgfekRFkQOhNU8oHsob7dhXo0/uSp1TyzjQh7fQ77+0zRT4tobEx9/q96aoWpyWLn177Y44SPc+MezhwbvdrYE03/Ruw2mTwWRFdZEWvfjaV/FGl/volFsek0FpxRjvEki1BG+tyEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ebZ0C0pt; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ebZ0C0pt"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31effad130bso2165924a91.3
        for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 16:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753830076; x=1754434876; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z+3hpEC/XWKCoJPxAX/7UW8fvRo82H1QQsUoMkegBlc=;
        b=ebZ0C0ptqSDakl6dR8hIyU3cFTMOeDzeWq5LnCH1BE4XTo3X9aOQY08mdEQXArFUvB
         4AYZ3Tk1BTFnTI/NAZcA9Sz1nUj+PPnFy/kqD2QuUksojcgZXrQpULQONmcFSeibiImo
         E+/ppjJ0DuH5Rl0FAsdrfZmItjhPuKi2Szq5Lrhe3K6Pr73xT3lElIJ2l+UJjgweu2LB
         BwDT9XEkGBcH3/2NDlhamBiYPm1px1y1S3c0fzA3rjTtZrhDumuFuQjbaMV19x+bAuF1
         e7wqfv7qYBDK7cS5xCCe8Mi7VjPCSd6BIYOa67T5j+RNsaNNwtCpeUMtxWZY/u1LO5T6
         P/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753830076; x=1754434876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+3hpEC/XWKCoJPxAX/7UW8fvRo82H1QQsUoMkegBlc=;
        b=i//fIkTLEkJgx1LCXsHRPLMjCGYQ3JUxWfnkClbBcq0leKSvZUYE18WvkZxcDtI/ZP
         wJP5h+8acV4UouHCp99PX4PKoDba5MRVegAcW6SWAbfUm1TXCrm8OccZ4thXl/SyVNz9
         xTGHddX8CTGlgCOHaeZY8nLJRBlqh2MLdlzEU6KKUCpFhaOEeUJrZtQBd2lw/Y93iq8a
         wO6yAh6wr3AYHQyI+Fo0pop4w25cMM6o4gNqEJy2RyrZAeaV+ofnyPUMHIn3CqqiwUUz
         j/jw6ZoDifmcxr5kPEExA9X6tDYp9MtewLKspq+jjd0GDPpQAUrh1j8TUh+gLgYkG5VR
         Txbw==
X-Forwarded-Encrypted: i=1; AJvYcCVSoNPA00ceILn0mGe/2Wf3qNz/cyaRMGYtlETqGLRhxrIx+H1QIWHpcfDk2HPZsXOXWnN6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh0VnS+Nk71UxFqLYCKWpj8wMVeO1pZhLrZ3WpQuHiI6OdozhA
	rqBk3b/lcJAj42vOEZOb6O1hRqQeZhLhhdRESvc7CxNHUMnk531voT4s3LdxJbLU9E6Ey9OtSTv
	bcxe5eCW6fJ1WZaJMZ1N3lSqif/srm19dSW4ubFOf
X-Gm-Gg: ASbGncsUR2txUHmEVihs7JM+dLwSFiC870gEGOCqgjZsEJMdCVOXzweer3SddEj4nTH
	owPCopysK/o8GUEBlsfl9eCQcUnoW0AHNsV7EFssxloRug1R6OOxhM2q123cXaSfeB1viMovk/6
	5IVrIMGQ2LBblH1ATAKP/hm3AygH3B/GvctM3NMZK8udVV5TJkHsNLVw+dSjquzV8wuP7H32Kiw
	SFrfZB5bTzJNy2Szdq6FYqde7gBTuyLfcidgho=
X-Google-Smtp-Source: AGHT+IEN+u/12HjQVSX1/UUPQZ6DEc6cODR2xLZMwTUPE7uUQpZPyiemKu7LkzWBOqN0Bu8mzVperrPAwON/FhFOFr4=
X-Received: by 2002:a17:90b:1fcf:b0:312:f0d0:bc4 with SMTP id
 98e67ed59e1d1-31f5dd9ccc8mr1419937a91.5.1753830075828; Tue, 29 Jul 2025
 16:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729224325.work.019-kees@kernel.org>
In-Reply-To: <20250729224325.work.019-kees@kernel.org>
From: Marco Elver <elver@google.com>
Date: Wed, 30 Jul 2025 01:00:39 +0200
X-Gm-Features: Ac12FXyfCCLmSEsE8JlzE9w-_XpBxlAkYo0upai9b0-ZK8VVBgqqOiOpyuUYP2g
Message-ID: <CANpmjNNkYE9dvyR-YH3U18+g4bG4tpgD1pv99xG6xhdRuQYUQA@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: Provide __no_kstack_erase to disable
 coverage only on Clang
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, kernel test robot <lkp@intel.com>, 
	syzbot+5245cb609175fb6e8122@syzkaller.appspotmail.com, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, "Kirill A . Shutemov" <kas@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Michael Kelley <mhklinux@outlook.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Jan Hendrik Farr <kernel@jfarr.cc>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 00:43, Kees Cook <kees@kernel.org> wrote:
>
> In order to support Clang's stack depth tracking (for Linux's kstack_erase
> feature), the coverage sanitizer needed to be disabled for __init (and
> __head) section code. Doing this universally (i.e. for GCC too), created
> a number of unexpected problems, ranging from changes to inlining logic
> to failures to DCE code on earlier GCC versions.
>
> Since this change is only needed for Clang, specialize it so that GCC
> doesn't see the change as it isn't needed there (the GCC implementation
> of kstack_erase uses a GCC plugin that removes stack depth tracking
> instrumentation from __init sections during a late pass in the IR).
>
> Successful build and boot tested with GCC 12 and Clang 22.
>
> Fixes: 381a38ea53d2 ("init.h: Disable sanitizer coverage for __init and __head")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507270258.neWuiXLd-lkp@intel.com/
> Reported-by: syzbot+5245cb609175fb6e8122@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6888d004.a00a0220.26d0e1.0004.GAE@google.com/
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Linus Torvalds <torvalds@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: <x86@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>
> Cc: Kirill A. Shutemov <kas@kernel.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/x86/include/asm/init.h    | 2 +-
>  include/linux/compiler_types.h | 7 +++++++
>  include/linux/init.h           | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
> index 6bfdaeddbae8..5a68e9db6518 100644
> --- a/arch/x86/include/asm/init.h
> +++ b/arch/x86/include/asm/init.h
> @@ -5,7 +5,7 @@
>  #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
>  #define __head __section(".head.text") __no_sanitize_undefined __no_stack_protector
>  #else
> -#define __head __section(".head.text") __no_sanitize_undefined __no_sanitize_coverage
> +#define __head __section(".head.text") __no_sanitize_undefined __no_kstack_erase
>  #endif
>
>  struct x86_mapping_info {
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 2b77d12e07b2..89e2c01fc8b1 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -378,6 +378,13 @@ struct ftrace_likely_data {
>  # define __signed_wrap
>  #endif
>
> +/* GCC does not like splitting sanitizer coverage across section inlines */
> +#ifdef CC_IS_CLANG
> +#define __no_kstack_erase      __no_sanitize_coverage
> +#else
> +#define __no_kstack_erase
> +#endif

I think this belongs into compiler-clang.h, we've typically refrained
from ifdef CC_IS_CLANG/GCC in the generic headers.
See __nocfi for an example, where compiler_types.h provides a default
empty definition, and compiler-clang.h provides a non-empty
definition.
