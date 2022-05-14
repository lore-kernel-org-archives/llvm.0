Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67F02F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:46:51 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id m12so11112019plb.4
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e29OYJF0Cr34NWXtjSnWsGpG9iO/e7RRuuLzidaM53E=;
        b=iLL3cfRMy+bNRF6yJMjDw3XvgwGT5nul36IUUc3BfjbVqT/89mvtX0Y9OzZeN0R4Gu
         W178b+kjzr8Lf53lXiq7GHB/hfPD1hgiN4QTbUs3bRLflRujC0OJjNTHm2LZ3xS18mLX
         NRFhidoGxgqGZWfBgeQ3q0MvXRxhcwrfDkb+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e29OYJF0Cr34NWXtjSnWsGpG9iO/e7RRuuLzidaM53E=;
        b=b35zi4nD+foagK+zg0KwkzM2JOLGBzUWF3Wm/QmUggMGwOFswhCIZEEva/VeK3Bm4J
         YmtWd9B+JEtgAoqdstHVu0vRFjLba2P4K2CICEkaaB3yjIp4jkH8Ag0h9kY5vURXE1jL
         s+HITHvg3w/2bLJHXHSBCgp4E7DgrKWvnHqEzYckAj5PaHRaKpJ4ZzmgIyUwICAc39Tw
         zfX+w7V8t09qjf9byKbUMlTdayo7lYUeSLy3NS8LMh217c01VTXzF7/uRdzbZLXd4TQ0
         zSq8xn2w/jWd/Ae/8Atnh2zmBCl7E1sSUDCpOwYpnNDWEEKWd8M6zu1/u/ZPYRE4Dzm7
         r4aQ==
X-Gm-Message-State: AOAM531N3v63UenJC4AtE8MAo8zo1Xz2wsS4oG+eVmjMLutdPMGvnhfs
	TVU9v3PIU89hNuxWX7lN7ns2gw==
X-Google-Smtp-Source: ABdhPJwsCXmSC41w6NBmUyzu0g9wSnZn8nG1i4Pdwc6BWgonq72IR1wz8hyIaB0bEBdZVZ1mnem53A==
X-Received: by 2002:a17:903:189:b0:15e:9584:fbe7 with SMTP id z9-20020a170903018900b0015e9584fbe7mr10635100plg.65.1652564811104;
        Sat, 14 May 2022 14:46:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j11-20020a056a00174b00b0050dc76281bfsm4049680pfc.153.2022.05.14.14.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:46:50 -0700 (PDT)
Date: Sat, 14 May 2022 14:46:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v2 06/21] cfi: Switch to -fsanitize=kcfi
Message-ID: <202205141444.9F32C94D9@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-7-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:44PM -0700, Sami Tolvanen wrote:
> Switch from Clang's original forward-edge control-flow integrity
> implementation to -fsanitize=kcfi, which is better suited for the
> kernel, as it doesn't require LTO, doesn't use a jump table that
> requires altering function references, and won't break cross-module
> function address equality.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Yes please. And just to note it somewhere: landing the KCFI
implementation on Clang depends on this series being accepted (i.e. if
the arm64 and x86 maintainers are happy with this series, then that'll
unblock landing it in Clang (no reason to land something that won't get
used.)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
