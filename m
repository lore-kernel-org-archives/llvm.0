Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF322C80
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 17:58:18 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id z14-20020a17090ab10e00b001b6175d4040so5828782pjq.0
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qMBeUtTGoBAaUmn8ulylEeU3TILxfDlpE26BBKiNnGY=;
        b=J7fuSAhEvpVepqu4bHtpGok7OuYMF9RjkZNrGHmNgrE3z94rFzSezvXY1VOwIJRPne
         HDraILoeB+OqGPXAMfYrq42DJ1VEKRhNZ5KbKSdVW71X/qYEYlKw9piEK2FL2LkgD438
         fhLhq8AjSchO7gxQu78V/tqZ3W0KAYttERvW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qMBeUtTGoBAaUmn8ulylEeU3TILxfDlpE26BBKiNnGY=;
        b=bJQIkuMjCYdy7m5XQoGNs5j1scFth5TuDZM/JMIyvYSfvDvESKBiNgOneBC/FWQ/Qa
         Nuw23o2P7eeB+QaKOR9nXNUMxSyPUFduph9RZGAvkoD8A9D+5HOkpRuSuiAPkLF2z3sS
         EUS2aEU7FIAPIaSER6MH0xyIQRX7ZVPDQYQU5rcfX4f2bgDWgbTR9L9nvztB2BE6q4qK
         n4mcROkZ5eDjy8AZICDOJnebwNBLBYsq8G8m1PD0L5Mt1px4Sv4w3CTLKxJQtwXBsPlZ
         SzKeTTsDHjQud/HT6NzxAYlFKCoo0sPIKxvBXe7E3BEks6X7HmeESH5IrMMjboIDxzE/
         6/oA==
X-Gm-Message-State: AOAM532YJSc77KxE9RYugqx4EgY1HK/PFBbKZpS+xHJOuGSFeBBOznbz
	2sSE9OszK6ql/4jT/yuOsufhBQ==
X-Google-Smtp-Source: ABdhPJx5tvndvTY7lS7GUegKk//TLoB/LnrEz7voqsYYRocSw26tJo+R5gzx4F/9MEcP+wqMwA5t9w==
X-Received: by 2002:a17:902:bf0a:: with SMTP id bi10mr9948941plb.164.1643392698276;
        Fri, 28 Jan 2022 09:58:18 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p17sm5893755pfo.11.2022.01.28.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 09:58:18 -0800 (PST)
Date: Fri, 28 Jan 2022 09:58:17 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Revert "ubsan, kcsan: Don't combine sanitizer with kcov
 on clang"
Message-ID: <202201280957.562D6AC@keescook>
References: <20220128105631.509772-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128105631.509772-1-elver@google.com>

On Fri, Jan 28, 2022 at 11:56:31AM +0100, Marco Elver wrote:
> This reverts commit ea91a1d45d19469001a4955583187b0d75915759.
> 
> Since df05c0e9496c ("Documentation: Raise the minimum supported version
> of LLVM to 11.0.0") the minimum Clang version is now 11.0, which fixed
> the UBSAN/KCSAN vs. KCOV incompatibilities.
> 
> Link: https://bugs.llvm.org/show_bug.cgi?id=45831
> Link: https://lkml.kernel.org/r/YaodyZzu0MTCJcvO@elver.google.com
> Signed-off-by: Marco Elver <elver@google.com>

Yup, good to get rid of it.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
