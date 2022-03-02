Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC120E9
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 00:53:37 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p17so179677plo.9
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 16:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dEue/nkyyWORuSLNgZoXP119Ov1Eck1EH3kEX5AnUiQ=;
        b=e/dx026Cg0MiSh1JiBi7JH1dij6bXr0QLUeRt/f9pRTDL/WU92xojPJYEtMGzU3X2c
         l/sBdeLNdgDNP/9m/US1Z85emD+zb4VuhQQpzemiMYE4KaX5ZUjSASZp4PZItCrbsCfm
         fG07nhuS4Fd2+nlAmoCR/QWkBxGQqRKwcvUtkeW/Wy/t7guG5QDr5QxZ0uflQzKnU2eJ
         R65DqlAXbo1UOfrCjKDTOx5RUbKXW1oAEPP87jW8sC1K0+RjpKwKsIMfp3MW2D81URZH
         Kx0UFb95ZlNg4ZJ7MPw6AEMOpqi8Zn6Mq4g/9DjZ4xwss2pOQwR4dLwI/n+ql12/jRTi
         EV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dEue/nkyyWORuSLNgZoXP119Ov1Eck1EH3kEX5AnUiQ=;
        b=IZrgXv66LkVaiPbRKx6P1jnHeix4pwkcu9jAFc19FvHuH7G15psRlN97ZC0LPohzST
         E+yHqNSHBRt6YIIsSjeKTfUr4IkP5ZyLCBRVUXr5XzK4Ju48zKyy7Ov8gZMnwh0+zZkg
         wTvcnyVpeu7CvxO5L0oWPgZqj3NUnyAizmpKNUij2vDKvZHsIyPRZKRJM5vR3JJz8ZNW
         cHb3HEA1+zVFfBfgphCN2wfwcQLZ1Yh/GM8JLNYLIMezGtfyQNus88/FqeVwEbI6Lke/
         5jCNaO9on2WwbON+3HVZVGTyKjmw75zrt/xAok3Yy/vfaoK3sL/Jasqkl444RBb7pof+
         dK8w==
X-Gm-Message-State: AOAM533qKJBbLQN4Sw6hLxzMfOKvg4Jf9KRR0orcYadH2oEkIEvzCpXX
	mnwXCoBWpUsJNy9eoGW7iP5T7w==
X-Google-Smtp-Source: ABdhPJws29wDvpjDSbr4HlPV5i3v65S9IX3guYbxnFEHwMBD0tegnlMOTSliyk6S1UMDbdumOJR0Sw==
X-Received: by 2002:a17:90a:8689:b0:1bd:4c83:4c5c with SMTP id p9-20020a17090a868900b001bd4c834c5cmr13402382pjn.142.1646182417336;
        Tue, 01 Mar 2022 16:53:37 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:88f6:4b70:bdc0:5a68])
        by smtp.gmail.com with ESMTPSA id np11-20020a17090b4c4b00b001bd4aa67bafsm3538870pjb.3.2022.03.01.16.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:53:36 -0800 (PST)
Date: Tue, 1 Mar 2022 16:53:32 -0800
From: Fangrui Song <maskray@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	joao@overdrivepizza.com, hjl.tools@gmail.com, jpoimboe@redhat.com,
	andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org,
	samitolvanen@google.com, mark.rutland@arm.com,
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org,
	mhiramat@kernel.org, alexei.starovoitov@gmail.com,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
Message-ID: <20220302005332.shcvokuyt4zz544d@google.com>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.072632223@infradead.org>
 <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>
 <202203011636.40D2F83@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202203011636.40D2F83@keescook>

On 2022-03-01, Kees Cook wrote:
>On Tue, Mar 01, 2022 at 01:16:04PM -0800, Nick Desaulniers wrote:
>> Also, Kees mentions this is an issue for testing multiple different
>> versions of gcc, too.  There perhaps is a way to simplify the builds
>> for BOTH toolchains; i.e. a yet-to-be-created shared variable denoting
>> the suffix for binaries?  The primary pain point seems to be Debian's
>> suffixing scheme; it will suffix GCC, clang, and lld, but not GNU
>> binutils IIUC.
>
>Right. Though I think auto-detection still makes sense.
>
>If I do:
>
>	make CC=clang-12 LLVM=1
>
>it'd be nice if it also used ld.lld-12.

This transformation may be a bit magical.

On Debian, /usr/bin/clang-13 is a symlink to /usr/lib/llvm-13/bin/clang .
Will it be fine for the user to provide correct feasible PATH?

>> [...]
>> Just curious, what prefixes have you observed in the wild?
>
>For me, where ever I built clang, and "/usr/bin"
>
>-- 
>Kees Cook
>
