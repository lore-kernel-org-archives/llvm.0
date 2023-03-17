Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A79979C5
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 19:04:09 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id t14so6128917ljd.5
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679079847;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxWwhYtYMhTKLT+t03kqT9HvUsxnKyYicVxmtWlKd/U=;
        b=VaLCQLvTCM70AHROG4xz4tfrBF639waWz4KoWP8AzwXYthDGomNGp1T7jkmLSYG6ZL
         sQFvXnCJrqBICSwPvMM6a5OUdp9euuNEyXtvS6swIWpNLZtX+94mUEIdzi0vOzHTeDjh
         3JTXIbCJnfWdIZvosOOvSj9i6QeMcdMqZQro0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679079847;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxWwhYtYMhTKLT+t03kqT9HvUsxnKyYicVxmtWlKd/U=;
        b=BvL7SapyE0Q//SajbWi3ShF+Yqa7jroAtDFEFbevlTjwnwMITVT8svIT6/0dB7wJJC
         5WVuwbkLAnGbvGm/pEpoaW7X2haFEH+BsVJ8bysB8F6JzjwE5fhwMDLGDWCY1t416AsC
         TLhBTKravGjcKPAce/JyFuJYOrn5yBkIrfVzZgNRIuB0iWRq5bpSxQOmhQl9W1MNQ6gi
         2h8J4kN154YmXstfRJEPE+CvgBbP6snVd8A+6DRhMignasNXaqx+C4AgP7vPqJit1iN6
         J7G7EAGNE0ArlouikLsxln7wuaH8Uh1DjgKZWb8uhRqE38uH9zWf6PtOitD8lgEK3lZ+
         8VgQ==
X-Gm-Message-State: AO0yUKVcXtHbRux4+IUgF2lSJH+OGkIKmv5qwK3taRRJuiu+jRIuh9Tq
	drrxPlQLGIPXlPtNIAPkSkmdEN+fRbraUOGGXXL1qA==
X-Google-Smtp-Source: AK7set9HiEa6enkw+O8v0nH+vyluNOZUiaCR0NVYDozZkTby7pa60VguxOSXhQJyn+UdyYOLblrB7egT3k0I/PkyvWw=
X-Received: by 2002:a05:651c:48e:b0:295:95a8:c6a3 with SMTP id
 s14-20020a05651c048e00b0029595a8c6a3mr3635392ljc.10.1679079847107; Fri, 17
 Mar 2023 12:04:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Mar 2023 12:04:06 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230315125256.22772-1-fmdefrancesco@gmail.com>
References: <20230315125256.22772-1-fmdefrancesco@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Mar 2023 12:04:06 -0700
Message-ID: <CAE-0n50=j=GPQA=wQa5wE=P2T0ipOoOn6ekhPVAJhr5nMkiVnw@mail.gmail.com>
Subject: Re: [PATCH] module/decompress: Never use kunmap() for local un-mappings
To: Chris Down <chris@chrisdown.name>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	Jason Wessel <jason.wessel@windriver.com>, Jiri Kosina <jikos@kernel.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miroslav Benes <mbenes@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nick Terrell <terrelln@fb.com>, Petr Mladek <pmladek@suse.com>, Tom Rix <trix@redhat.com>, 
	bpf@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	live-patching@vger.kernel.org, llvm@lists.linux.dev
Cc: Piotr Gorski <piotrgorski@cachyos.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Fabio M. De Francesco (2023-03-15 05:52:56)
> Use kunmap_local() to unmap pages locally mapped with kmap_local_page().
>
> kunmap_local() must be called on the kernel virtual address returned by
> kmap_local_page(), differently from how we use kunmap() which instead
> expects the mapped page as its argument.
>
> In module_zstd_decompress() we currently map with kmap_local_page() and
> unmap with kunmap(). This breaks the code and so it should be fixed.
>
> Cc: Piotr Gorski <piotrgorski@cachyos.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Fixes: 169a58ad824d ("module/decompress: Support zstd in-kernel decompression")
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
