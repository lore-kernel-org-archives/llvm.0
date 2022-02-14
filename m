Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223C7A35
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 19:14:16 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y5so30910165pfe.4
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7CzXZHBrjrvvHPuFEDIUoa2XYSCdiIOC+ZXymIl1Gq0=;
        b=DLytup8/nMFdOQpyOX32iLWswu2Lulci0Fe3QMhFaiTB94l2eFbralSxvQAHWw0Abi
         eMBgf9GgT+3emlXnMtYFbLB8+fCbzYJCtn5FPEK0aM6ahcRxN/pBwtNPTnwicu4pOuMN
         h1eKmzTSyxcEdz8Xf9DJQZvl62kNNYWtiHsrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7CzXZHBrjrvvHPuFEDIUoa2XYSCdiIOC+ZXymIl1Gq0=;
        b=G3KJc3RtR963aS+HqkJJYNrpkIhAPYPSPMJo1BkuH9O2by9bDThN2W4gFwytjvs49J
         06exJT9L8Ox+W2YsTPlpRXdWzQG1+NYJivsuCx+C5jtdPiYdz8IRH+Jv11LgarM0xPTx
         zQvcjwlk6pm/EuzblRl9H8z2mCpuasL3ClE5Xf2Hx7QPQjvXMBI831hmb9C/cK7TDD6p
         D96XvTdN5bPzjVOLPTr0UUKGAkuamDWL9eds3d70sp9XGMaEBgmMP/iDdKSMc5+Z5qL/
         MFnESkFlWddor7Zi4aoeDh7A9lLnJZtpHWKVlKQ0kwDecdd/A8BLvBOVdxdQRfic4+DE
         ySmg==
X-Gm-Message-State: AOAM530dobaNQ276z0g1jtUY9ThGLIUIFj9mvAw3IImZEZmRMUhlrlW+
	KdQtpI7Hu/4mqu2FunI7VfZXNg==
X-Google-Smtp-Source: ABdhPJwEa/+o++xM1jvGn6J4uA1jnNEs+L6LOssFo6u6kFTNXF/whFKH0nAMuVk0P4sIE7mk5RwzkA==
X-Received: by 2002:a65:584d:: with SMTP id s13mr389414pgr.369.1644866055556;
        Mon, 14 Feb 2022 11:14:15 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id oa10sm12985799pjb.54.2022.02.14.11.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 11:14:15 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Kees Cook <keescook@chromium.org>,
	Alexander Potapenko <glider@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	kasan-dev@googlegroups.com,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Elena Reshetova <elena.reshetova@intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] stack: Introduce CONFIG_RANDOMIZE_KSTACK_OFFSET
Date: Mon, 14 Feb 2022 11:14:03 -0800
Message-Id: <164486603894.3748820.17377347049312013591.b4-ty@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220131090521.1947110-1-elver@google.com>
References: <20220131090521.1947110-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 31 Jan 2022 10:05:20 +0100, Marco Elver wrote:
> The randomize_kstack_offset feature is unconditionally compiled in when
> the architecture supports it.
> 
> To add constraints on compiler versions, we require a dedicated Kconfig
> variable. Therefore, introduce RANDOMIZE_KSTACK_OFFSET.
> 
> Furthermore, this option is now also configurable by EXPERT kernels:
> while the feature is supposed to have zero performance overhead when
> disabled, due to its use of static branches, there are few cases where
> giving a distribution the option to disable the feature entirely makes
> sense. For example, in very resource constrained environments, which
> would never enable the feature to begin with, in which case the
> additional kernel code size increase would be redundant.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/2] stack: Introduce CONFIG_RANDOMIZE_KSTACK_OFFSET
      https://git.kernel.org/kees/c/8cb37a5974a4
[2/2] stack: Constrain and fix stack offset randomization with Clang builds
      https://git.kernel.org/kees/c/efa90c11f62e

-- 
Kees Cook

