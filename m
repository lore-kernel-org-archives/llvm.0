Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A742D36D
	for <llvm@lists.linux.dev>; Thu,  9 Mar 2023 00:01:48 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id x34so555039pjj.0
        for <llvm@lists.linux.dev>; Wed, 08 Mar 2023 16:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678320108;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nTISrXpO300lpFWqqY1St1bGS5UZ70h7TsS28CdZuhA=;
        b=OSHH/be/3Um8HQAHWPBTdCCQkmWHtcATgC8xhii7OXWNi7XnAxDWlso2vnezj1oCRR
         5suxGvWvoS/Q68mCSQJ3vvc93sSz0jPiiYonwvsevz4GN0DlS4rpvw4AHXClpVG5f5RS
         YspWn/WIXzmuMTSuJ5mnrymiR8ukn/CimiMBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678320108;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTISrXpO300lpFWqqY1St1bGS5UZ70h7TsS28CdZuhA=;
        b=CaCbrKobxxtOAK+eYuXtydT+u7R2yN4YbhVBtS16KQ5ZYcRYVxxYpUUmgjGkC2Ylrc
         SFZ7y1XfCh7xVC21B5O6qOrmw2V5qOv8jV20d1X+S+s2G0JcJVZbVdnB+cY+OgLYOik2
         FWESDr2jUlDyz/4k+EgNxpxsnHAJX6tNz1SCEEVm71V1FSjZABJOpy1ZFEuxKU2KR7ZX
         8bS4HPP91XRq5/mJyu16qBxQMGqGPvwJ8Xxkmq4fGIhahByNS+qNuTlu+nlumMP5IW32
         6eycQhSco0ivsRdRuj0jHjojjCwT0Yd5TYcKhOTcvPrmciiczyhcKyyIC9a4UpJDxVoQ
         skbw==
X-Gm-Message-State: AO0yUKXtl34EFKgMQqY/gLTwrU50NpT7dkUZDA060AZYmxCVB7B7UIDb
	cOuDRFf2AuEtc5FUhkfid7xB7w==
X-Google-Smtp-Source: AK7set8ApWx6kr+SfAyfzkE3zoJmXnq6ygcwKo6GPYa61JZgMWxU/LDFmiGNI9zIm/KYlrc1vCUDPA==
X-Received: by 2002:a17:903:18d:b0:19a:eb93:6165 with SMTP id z13-20020a170903018d00b0019aeb936165mr27011036plg.22.1678320108014;
        Wed, 08 Mar 2023 16:01:48 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b00185402cfedesm10299288ply.246.2023.03.08.16.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 16:01:47 -0800 (PST)
Message-ID: <640921eb.170a0220.28e72.38c8@mx.google.com>
X-Google-Original-Message-ID: <202303081601.@keescook>
Date: Wed, 8 Mar 2023 16:01:46 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>,
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkft-triage@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	Len Brown <len.brown@intel.com>, Borislav Petkov <bp@suse.de>,
	Stas Sergeev <stsp@list.ru>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] selftests: sigaltstack: fix -Wuninitialized
References: <20230308195933.806917-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308195933.806917-1-ndesaulniers@google.com>

On Wed, Mar 08, 2023 at 11:59:33AM -0800, Nick Desaulniers wrote:
> Building sigaltstack with clang via:
> $ ARCH=x86 make LLVM=1 -C tools/testing/selftests/sigaltstack/
> 
> produces the following warning:
>   warning: variable 'sp' is uninitialized when used here [-Wuninitialized]
>   if (sp < (unsigned long)sstack ||
>       ^~
> 
> Clang expects these to be declared at global scope; we've fixed this in
> the kernel proper by using the macro `current_stack_pointer`. This is
> defined in different headers for different target architectures, so just
> create a new header that defines the arch-specific register names for
> the stack pointer register, and define it for more targets (at least the
> ones that support current_stack_pointer/ARCH_HAS_CURRENT_STACK_POINTER).
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Link: https://lore.kernel.org/lkml/CA+G9fYsi3OOu7yCsMutpzKDnBMAzJBCPimBp86LhGBa0eCnEpA@mail.gmail.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Looks good!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
