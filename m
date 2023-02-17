Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA4746A
	for <llvm@lists.linux.dev>; Fri, 17 Feb 2023 15:27:48 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id o97-20020a17090a0a6a00b0023058bbd7b2so1590002pjo.0
        for <llvm@lists.linux.dev>; Fri, 17 Feb 2023 07:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FjhxRmxnq7g/s7HTg3+kkGL/XHuH+Vbf1L6uY1gtdZo=;
        b=FI/KCZOninl4pna7XqfUzhnxFpGIrbQeTbMujiTucgT+kYUmTkqKvpqrY0BBWfyGHl
         kGVHGRvlZzrxQgBr1yfxol8SKtKTNnefzdaSMXohxCDU/zWuaKWZDs+j15osVIse5Jbs
         pPrmNP9mEpEy35h4of6Aq3SVWil9eh91QVjrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjhxRmxnq7g/s7HTg3+kkGL/XHuH+Vbf1L6uY1gtdZo=;
        b=zA3nQ5xvvQ3uw+1cPnI+IRmpySCogAZkjjx5PDRLpSqdNOqFza7s4hcP5VUSSCQ3Ha
         CRbM//3fbHbzLL63F66CjUoRTMB6IqwTbTnZAevwbXhw7bsnmTf1PlJL51PbRurzTmom
         WQvvv80YnXE/kcllV/rlNgivyM8WFpaV7xpTkFLVyMKXsXAJfUVKYntL5hcgYuSXpuxe
         3q2yyNUYwSO7jEzJEpqlkmFzv2jLKaKwIUYk5MGzTy8lYqYckrXJ7N/5RJXGG3VyOi23
         vt/nAL8HTx0XwUrirmDGd/TsPjNYVlaAHy1Ev3DTN3vBXwxRdR3UbnUu0ZLNRmm2MJEt
         EsMg==
X-Gm-Message-State: AO0yUKWXI6JilwkdkAXS2DvUQn/G1tn+aK7mnuriVb5BuOFsW3q1rWvj
	O0th+0BAUpzwRloDnzGLcpDlIGcXszNEV4mv9RYIIA==
X-Google-Smtp-Source: AK7set+MhY2O08saH1T5RViqTcHgqAmXt9TEW6+Qid0bDYcQBDwu1dbJU5pEbkggOuOqzWdO29LJIwiJ55IFIJYYaW8=
X-Received: by 2002:a17:90b:3a8f:b0:234:117c:970f with SMTP id
 om15-20020a17090b3a8f00b00234117c970fmr1596590pjb.28.1676647667935; Fri, 17
 Feb 2023 07:27:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230217151832.27784-1-revest@chromium.org>
In-Reply-To: <20230217151832.27784-1-revest@chromium.org>
From: Florent Revest <revest@chromium.org>
Date: Fri, 17 Feb 2023 16:27:36 +0100
Message-ID: <CABRcYmLpAt3R5_2r6AgpnYrSx+1GZ9=827EK0xByFJf=eROd1g@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix cross compilation with CLANG_CROSS_FLAGS
To: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Cc: andrii@kernel.org, mykolal@fb.com, ast@kernel.org, daniel@iogearbox.net, 
	kpsingh@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 17, 2023 at 4:18 PM Florent Revest <revest@chromium.org> wrote:
>
> I cross-compile my BPF selftests with the following command:
>
> CLANG_CROSS_FLAGS="--target=aarch64-linux-gnu --sysroot=/sysroot/" \
>   make LLVM=1 CC=clang CROSS_COMPILE=aarch64-linux-gnu- SRCARCH=arm64
>
> (Note the use of CLANG_CROSS_FLAGS to specify a custom sysroot instead
> of letting clang use gcc's default sysroot)
>
> However, CLANG_CROSS_FLAGS gets propagated to host tools builds (libbpf
> and bpftool) and because they reference it directly in their Makefiles,
> they end up cross-compiling host objects which results in linking
> errors.
>
> This patch ensures that CLANG_CROSS_FLAGS is reset if CROSS_COMPILE
> isn't set (for example when reaching a BPF host tool build).

Note: I'm not entirely sure which tree should take that patch. I
tagged this patch as "bpf-next" because 1- that's the tree I know best
2- as far as I can tell, only BPF tools Makefiles reference
CLANG_CROSS_FLAGS directly and are currently broken in this way 3- I
figured this would be a simple enough patch that it's not too hard for
another tree to take it.

Anyway, I tried to CC other relevant folks, I figured there could be
different opinions on how this should get solved, for example the bpf
Makefiles using CLANG_CROSS_FLAGS could check whether CROSS_COMPILE is
set first. I'd be happy to adapt a v2 to any suggestion.
