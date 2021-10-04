Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9E3FE6
	for <llvm@lists.linux.dev>; Mon,  4 Oct 2021 18:38:09 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c20so16823048qtb.2
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LY3XIgAipiKQ5KOBfmir+6O81dFl8bwFaRJNVWIJEOQ=;
        b=WswXKoAQ5C7dw5sMYuGmP4LURhz4dqg1ae/EZlIMAXM7NlNuxb5Y2q+UxF4eLf2fpz
         Rg7X+SnBw+hg+GSpbPv0qhJKh2a7jrp5lLV1co9uteJ06nnevhs8ZDCVn9rSkgaie2/4
         Qqgbz1ix7KDs8MKB9RG1XQf/01v8wXsEv9J/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LY3XIgAipiKQ5KOBfmir+6O81dFl8bwFaRJNVWIJEOQ=;
        b=sTr/6yLU6EX8Novvzk3YjRbAwr8l7y7B0DPDTry3cVsw5MwRTNXdVT8tv6wArHdqW/
         A+Gf/IoJ1CY+f9uM8P9dxMsCoZwDrpYLgz6ZfTs5btvOW4OiRjETrbWAMgUcI3OgzjgV
         Y9kcqa9HqwfsAuzGD6KBw1xvZWixnjCqvqEaEDB0RPlNv1U3C2+LVfMEornX1cfaLuhZ
         gXc5IkD8loLN14OHSeH+byJeLaDqxnlXRhB5GfOPi+BC+dqvovGy2098IVun1w00H/IQ
         wwhASBfRDDpr1/LfwuLTx6vPTfzdfrqXuubtqBv3Kfy9AW71Vv4+owcQxxJZ9XbgZY57
         jjng==
X-Gm-Message-State: AOAM530EageinGU9jpMrGQXSH/4/NOgr3j0Za6KUqV7Ci4cMO/EwgoE6
	uccAHQisyij4zFd9vLSh2c0bXg==
X-Google-Smtp-Source: ABdhPJy5qVo8YAG+9IfB7eA2QUTEyLjVNo1J041cwh/+k3Es6uTMBlFZh52NqBmQYegfPH+0wdpiUA==
X-Received: by 2002:ac8:7769:: with SMTP id h9mr15238642qtu.156.1633372688728;
        Mon, 04 Oct 2021 11:38:08 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id g4sm1259206qtp.43.2021.10.04.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:38:08 -0700 (PDT)
Date: Mon, 4 Oct 2021 14:38:06 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	"KE . LI" <like1@oppo.com>, Stephen Boyd <swboyd@chromium.org>,
	Fangrui Song <maskray@google.com>, Miroslav Benes <mbenes@suse.cz>,
	Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Joe Perches <joe@perches.com>, Jessica Yu <jeyu@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v6] kallsyms: strip LTO suffixes from static functions
Message-ID: <20211004183806.5weyuk554ppe5olb@meerkat.local>
References: <202110020501.RKX4zca7-lkp@intel.com>
 <20211004162936.21961-1-ndesaulniers@google.com>
 <163337043811.3396838.458236649388694225.b4-ty@chromium.org>
 <CAKwvOdm5bBUE0df8jbXq+bSCf9U0AM3Wm4NsZeHu=Nuhi0yd-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdm5bBUE0df8jbXq+bSCf9U0AM3Wm4NsZeHu=Nuhi0yd-A@mail.gmail.com>

On Mon, Oct 04, 2021 at 11:32:43AM -0700, Nick Desaulniers wrote:
> $ git format-patch HEAD~
> 0001-ARM-mm-proc-macros-ensure-_tlb_fns-are-4B-aligned.patch
> $ git send-email --suppress-cc=body --to keescook@chromium.org
> 0001-ARM-mm-proc-macros-ensure-_tlb_fns-are-4B-aligned.patch
> patatt: E: -: Not a valid RFC2822 message
> fatal: 0001-ARM-mm-proc-macros-ensure-_tlb_fns-are-4B-aligned.patch:
> rejected by sendemail-validate hook
> fatal: command 'git hook run sendemail-validate -- <patch>' died with
> exit code 1
> warning: no patches were sent

Woah. What git version is this?

-K
