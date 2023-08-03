Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD54EA0
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 22:43:00 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bb9e6c2a90so12795645ad.1
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691102580; x=1691707380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INe5iUN8OqFkxldA5UUSZCvoiHbOkh93tbzwvbZM2yg=;
        b=AdrcoKcYKsDTC2sk5II1JfGBSGWxn+Mf/Sxnutk3q1l506vOr49iIj/50hD798HN7F
         b0OZc7JKWeDh12FhSjL1Xl4BHhP+B9RobN0klmBuKMhnefOK9+UFoMYitJo0B22Um2dY
         eJvU1iwgwiD/b9pJcn2WLq9Pd4MHq6mJciEdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691102580; x=1691707380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INe5iUN8OqFkxldA5UUSZCvoiHbOkh93tbzwvbZM2yg=;
        b=NHx+aIqf551ezvoEC9aAHQ5/DL7Vvcy6JNJXQHsgcVZc4tHE1FXEJm5JLCU1YtZ2bm
         4wnA997Q9wCf2hjZKi45sqkrBwGfkb28Ib+Nrn68lW0XTAA8Fu8b6RYqpdDbF2eVuxs9
         CUhoGRk0wtZ8y/ALPf49eq0LfXl6Gu71i7Bi4y0O9Lph9mX3GDmNfgJl4fjG0creLjkC
         A02N45WMKsIyj6Yy+PPTSCSv7fyhzMJ8PyTYxqLULjtr+Gnz00g/yDGkZ7do/Oha9QMx
         Rv+yFqZCXClR//pEx+L3C6ZEbdTElbbzMUUX8644uqDtUn17ADhMj9fH51oA8Bi8oMZX
         4Exw==
X-Gm-Message-State: AOJu0YxTgHEj0Nn1bLpsEztSlmmLcGfqMNBJJPR8dyPDq06uTa8++LKX
	lfN5TTIWzF5nhpovREvXBnRRJg==
X-Google-Smtp-Source: AGHT+IFvgcDqbfRdpydPq4ink9vQ3N7ScSsxcZoM/8xiqyVFgUTfakh0jjBFWkrGAUhq6+xeRCxMNQ==
X-Received: by 2002:a17:903:2351:b0:1bb:a85c:23cc with SMTP id c17-20020a170903235100b001bba85c23ccmr141262plh.15.1691102579859;
        Thu, 03 Aug 2023 15:42:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902bd0700b001bc2831e1a8sm355952pls.80.2023.08.03.15.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 15:42:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Juergen Gross <jgross@suse.com>,
	Kees Cook <keescook@chromium.org>
Cc: kernel test robot <lkp@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ajay Kaher <akaher@vmware.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] x86/paravirt: Fix tlb_remove_table function callback prototype warning
Date: Thu,  3 Aug 2023 15:42:49 -0700
Message-Id: <169110256709.2294259.13111562642254330671.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726231139.never.601-kees@kernel.org>
References: <20230726231139.never.601-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 26 Jul 2023 16:11:43 -0700, Kees Cook wrote:
> Under W=1, this warning is visible in Clang 16 and newer:
> 
> arch/x86/kernel/paravirt.c:337:4: warning: cast from 'void (*)(struct mmu_gather *, struct page *)' to 'void (*)(struct mmu_gather *, void *)' converts to incompatible function type [-Wcast-function-type-strict]
>                            (void (*)(struct mmu_gather *, void *))tlb_remove_page,
>                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add a direct wrapper instead, which will make this warning (and
> potential KCFI failures) go away.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] x86/paravirt: Fix tlb_remove_table function callback prototype warning
      https://git.kernel.org/kees/c/fcce1c6cb156

Take care,

-- 
Kees Cook

