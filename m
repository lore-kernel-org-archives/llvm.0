Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D47F
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 22:58:56 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id f193so3170838pgc.0
        for <llvm@lists.linux.dev>; Thu, 06 Oct 2022 15:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=T+CEJtAZnc2GDDwSotfE8CfL0V8jiLrzM2Svg4iqZbA=;
        b=lzW3h+esCqFARjrEX15yJhjZ4dUujUjSo63SEh+Gd9Hw06dXzzxu/mRMzhqPUKF/1R
         jOhJIK5SvJABZ8mDY3j2KzEew/lYbq6FPmlK8+tblrLGJSyYuMxxic6041/VOaENWN/1
         U62zUdkEYscO06AFI2cEx3KHvI4IRt22TiLIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=T+CEJtAZnc2GDDwSotfE8CfL0V8jiLrzM2Svg4iqZbA=;
        b=enNN7yPLTJQUFSSyahRpBN97NA0276MDFWyAJYB7A/gdnKA99J76SNY6o9mAG70tSv
         Mcf+OzXIUg7GKKxEfX4/1qQMo1fO+TCUDm+cqm1EXGVCGd4SGI5y2QPxxEhwTd81o75Z
         ekcRj8BHNm3aG/MruQk5YygJnAlfhNiVwH4D2sIDKaSLf0eOcGz758mzyNj0rwc8J/xl
         fJR7u4H3DxhrWA3hYZ4YSs6UCeSKMDg+w+tVBg2Q400yqTJx6HWH0nE9OpTKzQurQ2ie
         eQDPcHwH3OUJfsar916RF/LKURLNqokBdscTd8dAqJk4q+SA4+X5OcuFwZj7pNEo07O9
         yfnQ==
X-Gm-Message-State: ACrzQf1yfcSPZfJiT8ku5z3iU/9/li5BGKRnGRqVhYncR7ixMHbXtRZU
	eQ+4Ma6lzJGWvCXtZayqod9oIg==
X-Google-Smtp-Source: AMsMyM48onVK3sX9oSAQFX+6F3BL4lSX22t+n/J4JFWx2rOMFeagXp1MqeBXwVCqeM+rdUEMBqb9tg==
X-Received: by 2002:a62:4e8e:0:b0:54a:ee65:cde6 with SMTP id c136-20020a624e8e000000b0054aee65cde6mr1979233pfb.42.1665097135729;
        Thu, 06 Oct 2022 15:58:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i8-20020a170902c94800b0017f5c7d3931sm118936pla.282.2022.10.06.15.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 15:58:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	gustavoars@kernel.org,
	dlatypov@google.com,
	gwan-gyeong.mun@intel.com,
	nathan@kernel.org,
	trix@redhat.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] overflow: disable failing tests for older clang versions
Date: Thu,  6 Oct 2022 15:58:49 -0700
Message-Id: <166509712398.1833114.15283539764161050044.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006171751.3444575-1-ndesaulniers@google.com>
References: <202210061321.xSA91B7C-lkp@intel.com> <20221006171751.3444575-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 6 Oct 2022 10:17:51 -0700, Nick Desaulniers wrote:
> Building the overflow kunit tests with clang-11 fails with:
> 
> $ ./tools/testing/kunit/kunit.py run --arch=arm --make_options LLVM=1 \
> overflow
> ...
> ld.lld: error: undefined symbol: __mulodi4
> ...
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] overflow: disable failing tests for older clang versions
      https://git.kernel.org/kees/c/2d4df670c64c

-- 
Kees Cook

