Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715601842
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 16:26:15 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id h1so5489987plf.11
        for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J1RWi167fIKnMNjaR08zesQVT30i6h2kbyWDzKMWE+4=;
        b=ehDqdc1siKQKeniiqCQs4IItLbHYD47+/BZiGU/Zb0uftr9ePdeUHFrYDj2XTq9XCP
         1Kh61Ls/0kMl9beuCjp7fd9H84EOIUDX57h4+F/Y1gegbMXXPY2BFD8BQ9f0gSTFL5U+
         liiYTQW1PmpItIc8cC2nAgYkakZalTQD/JRgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J1RWi167fIKnMNjaR08zesQVT30i6h2kbyWDzKMWE+4=;
        b=oKCVhuzhAHYnYzU9nHTX37yRGym6pedZ7c4FrBo0Gjj8sOi0bQEMx1BHDmhfajqzIJ
         +0EvsYnt7M7zlaXFUOe23vZkmARmBuPKAP6T5tjqDHp/GA2TW01VcAUV9vLXMWc+AlZl
         Epi0EvbQ6laS2he9UXMmNvwZRT9MQs9v9WAZG8y5tPj6W/cBk2pwgwwNZ28qn+cjSyk9
         lpa+zAQl1oLdBnHxwoCPnDjcurbs/4kS49WKlSepreXFXnKt3mqXWsQo+Z3+KA4J12Ws
         0bROsYlrz2T9ewRteIj7BaJusD4Wl9tj9mbxbGfjefeIWh7gttlViplltXuPmWC+PzPi
         1yKA==
X-Gm-Message-State: AOAM531JQDIbo10kVZksZc37Y35M+Crn+mRzl2owxUUbVl2+RFGcxGvJ
	3NVEJlhr99vD5SmJfnMFwIpsiw==
X-Google-Smtp-Source: ABdhPJxSn/zEAGXFFALT3BQJdt0yv827pjR4PNAAROwuNxZWh+wV+7HZ0h+SSHcbzzyihGdIecqB2w==
X-Received: by 2002:a17:90b:4ac8:b0:1e3:4f6a:2d04 with SMTP id mh8-20020a17090b4ac800b001e34f6a2d04mr16793660pjb.233.1655137574841;
        Mon, 13 Jun 2022 09:26:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s13-20020aa78d4d000000b0051c70fd5263sm5587153pfe.169.2022.06.13.09.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 09:26:14 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: samitolvanen@google.com
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	ndesaulniers@google.com,
	nathan@kernel.org,
	paulmck@kernel.org
Subject: Re: [PATCH] cfi: Fix __cfi_slowpath_diag RCU usage with cpuidle
Date: Mon, 13 Jun 2022 09:26:10 -0700
Message-Id: <165513756775.2849041.2389986534725002694.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531175910.890307-1-samitolvanen@google.com>
References: <20220531175910.890307-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 31 May 2022 10:59:10 -0700, Sami Tolvanen wrote:
> RCU_NONIDLE usage during __cfi_slowpath_diag can result in an invalid
> RCU state in the cpuidle code path:
> 
>   WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613 rcu_eqs_enter+0xe4/0x138
>   ...
>   Call trace:
>     rcu_eqs_enter+0xe4/0x138
>     rcu_idle_enter+0xa8/0x100
>     cpuidle_enter_state+0x154/0x3a8
>     cpuidle_enter+0x3c/0x58
>     do_idle.llvm.6590768638138871020+0x1f4/0x2ec
>     cpu_startup_entry+0x28/0x2c
>     secondary_start_kernel+0x1b8/0x220
>     __secondary_switched+0x94/0x98
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] cfi: Fix __cfi_slowpath_diag RCU usage with cpuidle
      https://git.kernel.org/kees/c/57cd6d157eb4

-- 
Kees Cook

