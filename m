Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49894623
	for <llvm@lists.linux.dev>; Sun, 15 May 2022 03:41:40 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso11291443pjg.0
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 20:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yTJ/JqBThBUULFI/eq0KMUagYlEy+U8Gm8DCXUOLqI4=;
        b=Nj4rFH2iGcDCRWm7En8MMB9PlgCsyGVxQAPs7BMHVclQ27z31PBw6Dxdm3IvfWzPAV
         L7mSdonC/7b1wN1otPDwe1wD51BlBkiLnb6TRuJ8hkgKwbPpocmSPsCRB/70parsHMgc
         4ME6hu5g6TfCBsYNyr2rW8AOj4lsDpFe7p17c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yTJ/JqBThBUULFI/eq0KMUagYlEy+U8Gm8DCXUOLqI4=;
        b=txFR/lVxTjKZZ2ZdDXK7NvFIh4AKJs6odCepOOe3Hj6oT7V8Kv9aYuh++pXyHH6GH/
         Aq1Vt1ogTga+BMTMV4P0DCan1lQHnGMdSi2JkDh5ZUDK9i6tQCFm8iM6Benj6Ju8+b0I
         rom1FV/CitNfATRI9/IflCi+vQdYojxCyyPWrbcly52U7IdGBOifSwUpTqmefM4LKJTf
         7HsOjp5XFlpAcC3OAhAP4ecYC/NTqKisE8sD5SASq1SKNxwAPg1rsqu6mHMOdMtDvZ6z
         fr2An+vFbIA2nVUJkPX0w5ih6B0aSVmvtoIUx9NebQcguBcpVkcZkv7l0jPe/jDiDP3h
         /AMQ==
X-Gm-Message-State: AOAM531BKP5l5JOlyHenrxLCAjXpYfE2sa6w8uLhj8ru4IoKjCZKDu5F
	MyK9KGpb6xp2n2FEG9o+dK6tOQ==
X-Google-Smtp-Source: ABdhPJzZ7tgR5pXn1XQv2q/TxKce2IqTRDTreHqkACR4UFVQZMe4HvU+Dngyrw5oYGEcUo13rmdg5w==
X-Received: by 2002:a17:90b:1251:b0:1d7:f7ae:9f1 with SMTP id gx17-20020a17090b125100b001d7f7ae09f1mr24122359pjb.65.1652586099705;
        Sat, 14 May 2022 20:41:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id cu8-20020a056a00448800b0050dc76281b3sm4375942pfb.141.2022.05.14.20.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 20:41:39 -0700 (PDT)
Date: Sat, 14 May 2022 20:41:35 -0700
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
Message-ID: <202205142031.A3322C75@keescook>
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

Looks good on arm64 with LKDTM, too:

[   96.904483] lkdtm: Performing direct entry CFI_FORWARD_PROTO
[   96.904718] lkdtm: Calling matched prototype ...
[   96.904829] lkdtm: Calling mismatched prototype ...
[   96.905250] CFI failure at lkdtm_CFI_FORWARD_PROTO+0x54/0x94 [lkdtm] (target: lkdtm_increment_int+0x0/0x20 [lkdtm]; expected type: 0x7e0c52a5)

Tested-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
