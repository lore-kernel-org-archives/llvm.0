Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564FA3FC9
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 18:05:20 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id s55so14147796pfw.4
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 11:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0iPpm+LltGiRi7xAAdW5SmPgdzwJsCyUCqWs1KUg+Po=;
        b=ZNVZ75C0oqeFlmwh9JI4f3TV7YRZKMcBK0WKFScjCS9y7lzeMm/KRZZA4H8TiRZp/h
         FbeT+hca6B6B3IldhdMlCvhP2uJ8ah4zZ2IovLFbjSjmwxrbSYTfZEpohWkWeQoQIk2L
         DXx1lszBqNHa/ED6pzChbiB5CXg9exmrLBngI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0iPpm+LltGiRi7xAAdW5SmPgdzwJsCyUCqWs1KUg+Po=;
        b=b4rZA2iQAn2WdpWpqDsZOwXLsZbTynmPLtk3tN746Yt9kKwMXEBe2sB/z4Ysj8iZ94
         rZ/Qf6V8hf8qNvPSYaDzf/kRoaAhfMjKwWx/HiCJay6ZVkAu62uW8ilnF+BFEZ8vJchP
         5ansEtgS2kO79sJCyUSPOi7/FDbXxLeaSAnMUXj0n01EVcucNUvRo8iW5HWt7WhQ0Hob
         h3LDugqcj3v1fyzbP5enGF1pJrQ9uXWo3ejLh0nk8cudfb6mKqyg0KTaLqEsqkfuBPeY
         /pf3iu5v/AHkDHOuuxF7Gex41z6u62LXM7oYjs9zJ5h6lZRIO5nHEsP+4vYW6kNWtJ4f
         OeAQ==
X-Gm-Message-State: AOAM532Iyos+uMiDJAq6xhdou2y3f5UkAqIY5Garl8Dmgfm9NyU+9QUT
	droU3Hs6cSKcnIBFD8/3eimGAw==
X-Google-Smtp-Source: ABdhPJxO0QaWv8cAURIP5bfSsg6/37MkK4znRztUplixEjKkMW63xfr1uJrJIiRkSENOFYw+Nx7SjQ==
X-Received: by 2002:aa7:81c7:0:b0:44c:517f:a759 with SMTP id c7-20020aa781c7000000b0044c517fa759mr9730318pfn.3.1633370719844;
        Mon, 04 Oct 2021 11:05:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y23sm7934721pje.34.2021.10.04.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:05:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	"KE . LI" <like1@oppo.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Fangrui Song <maskray@google.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Joe Perches <joe@perches.com>,
	Jessica Yu <jeyu@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6] kallsyms: strip LTO suffixes from static functions
Date: Mon,  4 Oct 2021 11:00:55 -0700
Message-Id: <163337043811.3396838.458236649388694225.b4-ty@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004162936.21961-1-ndesaulniers@google.com>
References: <202110020501.RKX4zca7-lkp@intel.com> <20211004162936.21961-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 4 Oct 2021 09:29:33 -0700, Nick Desaulniers wrote:
> Similar to:
> commit 8b8e6b5d3b01 ("kallsyms: strip ThinLTO hashes from static
> functions")
> 
> It's very common for compilers to modify the symbol name for static
> functions as part of optimizing transformations. That makes hooking
> static functions (that weren't inlined or DCE'd) with kprobes difficult.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] kallsyms: strip LTO suffixes from static functions
      https://git.kernel.org/kees/c/6eb4bd92c1ce

Also,if you get a moment, can you set up patatt (or b4) to sign your
outgoing patches? DKIM is nice, but I'd like to see more folks signing
their emailed patches: https://github.com/mricon/patatt

tl;dr:

add to ~/.gitconfig:
[patatt]
    signingkey = openpgp:FINGERPRINT-HERE

# install git sendemail hook (assuming you send with git)
$ patatt install-hook

# or do it manually before sending:
$ patatt sign $file-with-email

Thanks!

-- 
Kees Cook

