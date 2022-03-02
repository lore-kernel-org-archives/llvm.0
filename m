Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48B2104
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 18:40:45 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id g7-20020a17090a708700b001bb78857ccdso5585560pjk.1
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 10:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sFxoRgrz8KohI1fJKR74aYbi9fTI6OzJ5gZS0IdaClo=;
        b=FqtKhM2WF7Jc6NpSCyY6TObLSgAalvebQmDZ7Cmnj3Q6/HPOsS2yrpPnaqq4PCyRlc
         rPuOQ3zSY6orsEbVMmCw8vqQmgu17OkywHjW/ut7YGDpCj2Z3eRmyVvHObByzeUYI1BI
         f9ykpZhAyXvTC2hGuLC7ICDLhWy3TMlg65fHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sFxoRgrz8KohI1fJKR74aYbi9fTI6OzJ5gZS0IdaClo=;
        b=5fp0nn1LJqv3+tx6f5IWKGODCGgErD0yfEFb334Fhb9wf4pXvpzJ7CQYoHcKpBHoL3
         +G3pq5Tv3/gupJGyB3WUlTgC4NKVbuIv90O15K8y4zShVTwW54EytOrGfUkT3788/30W
         HGfJ6AW0gHfoqe2DegolwlPTduO6ccBKn6TqQfyYlCpYRqseF4YbbHDereqsRcgbwy3F
         Fut2LwxUukk3DENv9r0FgmeBQ4EYLZ4SSgCl5Vc4dH9eBk1/3RAQX3e8YsuIHS5KDIHG
         /tj6ubF+sWAzhpa38AhMuU8+/4XOJGAhIzs9OHp/ntMkzTYZ18WTiv6Ml0qG7OYXZqrS
         /sDw==
X-Gm-Message-State: AOAM531hZLfHpGsGtwwaY31KVurYLP3dqVJpHq4ve9QCEJ7siXT9EsMh
	4UfUExuaaWAL/tfdI8zpHpApxw==
X-Google-Smtp-Source: ABdhPJyklsyONHI38lOVI0R5wsUnGsW6kq05jCjs2DiOqIxIjANGoPXFxwEDemY6YKQCv1gPZ1G1Qg==
X-Received: by 2002:a17:90b:1645:b0:1bf:11:66ae with SMTP id il5-20020a17090b164500b001bf001166aemr1164990pjb.198.1646246444742;
        Wed, 02 Mar 2022 10:40:44 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b3-20020a056a00114300b004cc39630bfcsm21702579pfm.207.2022.03.02.10.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:40:44 -0800 (PST)
Date: Wed, 2 Mar 2022 10:40:43 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	joao@overdrivepizza.com, hjl.tools@gmail.com, jpoimboe@redhat.com,
	andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org,
	samitolvanen@google.com, mark.rutland@arm.com,
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org,
	mhiramat@kernel.org, alexei.starovoitov@gmail.com,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
Message-ID: <202203021039.0DF89D3F2C@keescook>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.072632223@infradead.org>
 <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>
 <Yh+dMJsH+ZMPfqwD@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh+dMJsH+ZMPfqwD@thelio-3990X>

On Wed, Mar 02, 2022 at 09:37:04AM -0700, Nathan Chancellor wrote:
> However, I think we could still address Peter's complaint of "there
> should be an easier way for me to use the tools that are already in my
> PATH" with his first iteration of this patch [1], which I feel is
> totally reasonable:
> 
> $ make LLVM=-14
> 
> It is still easy to use (in fact, it is shorter than 'CC=clang-14') and
> it does not change anything else about how we build with LLVM. We would
> just have to add something along the lines of
> 
> "If your LLVM tools have a suffix like Debian's (clang-14, ld.lld-14,
> etc.), use LLVM=<suffix>.
> 
> $ make LLVM=-14"
> 
> to Documentation/kbuild/llvm.rst.
> 
> I might change the patch not to be so clever though:
> 
> ifneq ($(LLVM),)
> ifneq ($(LLVM),1)
> LLVM_SFX := $(LLVM)
> endif
> endif

I like this idea! I think it's much easier to control than PATH (though
I see the rationale there too).

-- 
Kees Cook
