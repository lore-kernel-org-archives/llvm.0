Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64820E9
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 00:47:37 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id v5-20020a17090ac90500b001bc40b548f9so3389228pjt.0
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 16:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x9QK2yVKnHXX9jQ390KTQ2jtnuQQLQpf+Jo2tSG+1rU=;
        b=K0w3rmENKCFKu/kVw1y4oxTkcApN/P/9sr5+yrue16Serc2l/M80n7D1Ab67znYt03
         evBC76oc18NVyOSdwcqBLbwG8MIcA49FhAkY1cr5vkoyIc/7/XaVuMu3KzGBBEoYUeb+
         ujGaHlK3mH3whXfpwJK0gpohpnNNHsZi0afT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x9QK2yVKnHXX9jQ390KTQ2jtnuQQLQpf+Jo2tSG+1rU=;
        b=5aPqkj/QnXsz5n/hNBDKbT++Qt0Aehwn7dCxQ5qohB9megc6UpGlcBzrwunl18dEIw
         IeZ037WxJ+QswemjMaC+qpSjUxY5BkRRYZAB6bJETwvAbNib8FdtDNc43eUEaMFnFDwc
         c/5hB2xDXu1JlbgA0CV+lcEMgyEc4tBM9k6ZfGibjzDM8syVGoAKTUpBiEYgmoijgkm0
         yOdoTJo2MRlw6dSo5cs4iCmDyT4V29IJ89oAngwY3xlNHKmGMfFdx98Q0n3h80TjvT/A
         UJh0+b21i+1mWPpznmq5bO9Ro91XpT3A7WQh0jUT0qEJnkEJ68PnzwBewHbKNYqgZXcl
         /uZA==
X-Gm-Message-State: AOAM530B9nBSA9za1Bc5UEArHcRxv6o/7pRPDP6K2ml/ADxqWlzJOIay
	pO1ZvmRTU2GZE7DpLHGF92Qwag==
X-Google-Smtp-Source: ABdhPJxN9OybXwbR6J2xnYQbzU8Z7LLJ9f6kivzrXjabM59c+Pu/2v40Zu70D1kM9yKuB6f+pyWVPQ==
X-Received: by 2002:a17:903:1c1:b0:14f:dad3:e7dd with SMTP id e1-20020a17090301c100b0014fdad3e7ddmr27754507plh.130.1646182057252;
        Tue, 01 Mar 2022 16:47:37 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h12-20020a056a00218c00b004c3a2450acasm19634414pfi.147.2022.03.01.16.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:47:36 -0800 (PST)
Date: Tue, 1 Mar 2022 16:47:36 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	joao@overdrivepizza.com, hjl.tools@gmail.com, jpoimboe@redhat.com,
	andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org,
	samitolvanen@google.com, mark.rutland@arm.com,
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org,
	mhiramat@kernel.org, alexei.starovoitov@gmail.com,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
Message-ID: <202203011636.40D2F83@keescook>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.072632223@infradead.org>
 <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com>

On Tue, Mar 01, 2022 at 01:16:04PM -0800, Nick Desaulniers wrote:
> Also, Kees mentions this is an issue for testing multiple different
> versions of gcc, too.  There perhaps is a way to simplify the builds
> for BOTH toolchains; i.e. a yet-to-be-created shared variable denoting
> the suffix for binaries?  The primary pain point seems to be Debian's
> suffixing scheme; it will suffix GCC, clang, and lld, but not GNU
> binutils IIUC.

Right. Though I think auto-detection still makes sense.

If I do:

	make CC=clang-12 LLVM=1

it'd be nice if it also used ld.lld-12.

> [...]
> Just curious, what prefixes have you observed in the wild?

For me, where ever I built clang, and "/usr/bin"

-- 
Kees Cook
