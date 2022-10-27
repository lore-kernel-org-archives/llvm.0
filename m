Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59431C13
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 19:03:29 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so2378331pji.0
        for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 12:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9re30L3Qf1nWwfY1dsIhAySAPn0ZrFVWEIZ6hesyg0=;
        b=fnIImG0iDucSTCyvxGTxY3d9lDdBvL7ROo88gDYrVx3xsPfdBvt1S2y+w/INuTYEWz
         FtNj8P0QY4I+xSWJssWO3K96FRG7Xcdw9VF/dwMA7x7XsCoenHjoq94xVVxrfqn1cvwG
         VA5mWwTUi7/N9k0hUuttlg+nynQ7Fixhdd/to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9re30L3Qf1nWwfY1dsIhAySAPn0ZrFVWEIZ6hesyg0=;
        b=UrhYymT5pqYwMTP8ln8pJ32k6DGH22rkjVdK2/MrwhirYfjvsQAs1sISzBRtDvwIb1
         cLbYBqFRdZRaI/Q8FZJ8T3334gohS16OANfXnmGlRihn7fL4UZ7AE5MVPJLGNT3ef62u
         nS/K3Hg1/qHQBO+VzJ9YkozruEs3l/pkiF9vh8KBrmcPVX5oZ8BfSJhgg4A2Q0I7w6xK
         Ezjzc3tP3LCBou+S7OgTXbKiYsz4Ld8F0iNKYSnAtyYL5/LR+iTyCQSMOb/LquJbze3g
         MluqQ4nXcuHsMthWXVmWlT4sBYXrO7ncRHAoO4ciy/pt8DA/LJHC6zcHvt7yVu9gMiMZ
         JzBg==
X-Gm-Message-State: ACrzQf2j2S2Tkf5IvoQBLlBo4LvF5zzUxFBxfUb/yAQg90kruNC152TS
	UOfyvskBFX1R7+rsNNGjsJ9+Qg==
X-Google-Smtp-Source: AMsMyM6uuk3qiJ1+V1Zd5xs1pexoyzJGJiyIkrfAYgcsIlVtEeXMZwR4mhWPlpFWNxoVtEGbOx9Oew==
X-Received: by 2002:a17:902:f683:b0:184:d45b:a096 with SMTP id l3-20020a170902f68300b00184d45ba096mr49382092plg.23.1666897409281;
        Thu, 27 Oct 2022 12:03:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x15-20020a17090a46cf00b0020a0571b354sm1276584pjg.57.2022.10.27.12.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 12:03:28 -0700 (PDT)
Date: Thu, 27 Oct 2022 12:03:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
	Daniel Latypov <dlatypov@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: [GIT PULL] hardening fixes for v6.1-rc3
Message-ID: <202210271203.1CABE4152@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these hardening fixes for v6.1-rc3.

Thanks!

-Kees

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.1-rc3

for you to fetch changes up to 72c3ebea375c39413d02113758319b74ecd790bd:

  overflow: Refactor test skips for Clang-specific issues (2022-10-25 14:57:42 -0700)

----------------------------------------------------------------
hardening fixes for v6.1-rc3

- Fix older Clang vs recent overflow KUnit test additions. (Nick
  Desaulniers, Kees Cook)

- Fix kern-doc visibility for overflow helpers. (Kees Cook)

----------------------------------------------------------------
Kees Cook (2):
      overflow: Fix kern-doc markup for functions
      overflow: Refactor test skips for Clang-specific issues

Nick Desaulniers (1):
      overflow: disable failing tests for older clang versions

 Documentation/core-api/kernel-api.rst |  6 +++++
 Documentation/driver-api/basics.rst   |  3 ---
 include/linux/overflow.h              | 38 ++++++++++++----------------
 lib/overflow_kunit.c                  | 47 +++++++++++++++++++++++++++--------
 4 files changed, 58 insertions(+), 36 deletions(-)

-- 
Kees Cook
