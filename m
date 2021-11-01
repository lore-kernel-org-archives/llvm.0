Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD768
	for <llvm@lists.linux.dev>; Mon,  1 Nov 2021 16:20:54 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id gn3so12478417pjb.0
        for <llvm@lists.linux.dev>; Mon, 01 Nov 2021 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nOeoZHECPKNnAQytROjQG/8KfDcG2slvfmEJKCwImrQ=;
        b=OHjfuxxdfClfMEvZDiRQncM/tj04Oc4zKUcJsre2fgbrUibg0OrOYtxJvVFbiYWF/V
         QV1/1BkSOuYAiHB/7n6GnABT8PtXMjdF0q/3kN7tXSbbW0ibOXOrXBZIBg62Du0E12fR
         r2TOG2W15LOqdfoteLKwfqdg6gxPX1atPhYAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nOeoZHECPKNnAQytROjQG/8KfDcG2slvfmEJKCwImrQ=;
        b=2Eg3Gls8zeM5HOcjKwntNBt6u+GZvd9+I5EbR0vvNBTQ7wsoJRfypStHenPfCcD6Qu
         L3Z7+Nm0G4GLsrqqF7JXD7qJ8RG+Ccqwbsp3r4GYtOg4Ml7B2ULhREcyk1zLp41tSV2P
         JV5SkzXKU9mjqfM21GcyKEdUme8/OiWma45HIaxhS5ELWBdxrftWx/iIEp16biHBfQ5S
         1tDswJHq8B1bemZWwSSDZ0TvjgryoJnZKGCQ8jKCApsivbz6KmYX7u2DVsX9dnkCvPNy
         IydxjwWfNS2x7CMFXd1S+5w7nCTpWPTV3bYloDGaQJgMqxRUi6xXRb7vqnbWRVFKmgax
         Rchg==
X-Gm-Message-State: AOAM532OTUPPnn5Dd5gqrVy4pAq+bkBljujvCzXrFrbl9Au+1x0GPrqT
	05Ve9RXRMCA8GGjNZKI3uxceLw==
X-Google-Smtp-Source: ABdhPJx8302mlq2+2oG33p1FJwabY8ZQ+cEyzVsGqRt9mxOuWC/f5cg60TkG3G0h376S22Pc08/BlA==
X-Received: by 2002:a17:902:70c5:b0:13f:f941:9ad6 with SMTP id l5-20020a17090270c500b0013ff9419ad6mr26059732plt.28.1635783653857;
        Mon, 01 Nov 2021 09:20:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p23sm18296772pjg.55.2021.11.01.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:20:53 -0700 (PDT)
Date: Mon, 1 Nov 2021 09:20:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Fangrui Song <maskray@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	James Morris <jmorris@namei.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <keescook@chromium.org>, "KE.LI" <like1@oppo.com>,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org,
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Serge E. Hallyn" <serge@hallyn.com>, Will Deacon <will@kernel.org>,
	Ye Guojin <ye.guojin@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [GIT PULL] hardening updates for v5.16-rc1
Message-ID: <202111010917.75B96F4E@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these hardening updates for v5.16-rc1. These are various
compiler-related hardening feature updates. Notable is the addition of an
explicit limited rationale for, and deprecation schedule of, gcc-plugins.
More details in the tag below.

Thanks!

-Kees

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v5.16-rc1

for you to fetch changes up to 6425392acf24b6d469932dd1b217dc7b20d6447f:

  gcc-plugins: remove duplicate include in gcc-common.h (2021-10-21 08:41:51 -0700)

----------------------------------------------------------------
compiler hardening updates for v5.16-rc1

This collects various compiler hardening feature related updates:

- gcc-plugins:
  - remove support for GCC 4.9 and older (Ard Biesheuvel)
  - remove duplicate include in gcc-common.h (Ye Guojin)
  - Explicitly document purpose and deprecation schedule (Kees Cook)
  - Remove cyc_complexity (Kees Cook)

- instrumentation:
  - Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO (Kees Cook)

- Clang LTO:
  - kallsyms: strip LTO suffixes from static functions (Nick Desaulniers)

----------------------------------------------------------------
Ard Biesheuvel (1):
      gcc-plugins: remove support for GCC 4.9 and older

Kees Cook (3):
      hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO
      gcc-plugins: Explicitly document purpose and deprecation schedule
      gcc-plugins: Remove cyc_complexity

Nick Desaulniers (1):
      kallsyms: strip LTO suffixes from static functions

Ye Guojin (1):
      gcc-plugins: remove duplicate include in gcc-common.h

 Documentation/kbuild/gcc-plugins.rst               |  28 ++++-
 Makefile                                           |   6 +-
 kernel/kallsyms.c                                  |  46 +++++--
 scripts/Makefile.gcc-plugins                       |   2 -
 scripts/gcc-plugins/Kconfig                        |  20 +---
 scripts/gcc-plugins/cyc_complexity_plugin.c        |  69 -----------
 scripts/gcc-plugins/gcc-common.h                   | 132 +--------------------
 scripts/gcc-plugins/gcc-generate-gimple-pass.h     |  19 ---
 scripts/gcc-plugins/gcc-generate-ipa-pass.h        |  19 ---
 scripts/gcc-plugins/gcc-generate-rtl-pass.h        |  19 ---
 scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h |  19 ---
 scripts/gcc-plugins/structleak_plugin.c            |   2 -
 security/Kconfig.hardening                         |  14 ++-
 13 files changed, 75 insertions(+), 320 deletions(-)
 delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c

-- 
Kees Cook
