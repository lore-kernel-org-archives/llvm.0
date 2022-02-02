Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E272F28
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 21:27:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bu18so1718668lfb.5
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 13:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vk5wYy3sT4I5WW+WUYmWyAImSgUa3X6inu5KcZCXPKY=;
        b=aENyZMxtUMXciI8o8/Vm8rLMVTMwkMTUfjJ/Gv61rnrp1fCHNR+qb4Ih6z3KIWHXhw
         s373VCw9AWxxeLrFacSEm4Gnpw0b+qTknppxCbYyULRkOKgD6E9pz34SgGO8qj+IPsdi
         YnqpBtc56ZqzQQjKXV9BQmLDHQNKnEu6G4Bg9LYVdTi7cllMQ0ThOesYqVblF5tRNKe7
         xOIQyekXcQTHn5EzdoIeKu6Iv3dQ6jyhNYlzRhFnEcI94cKlrmCoUSI1tYWV1F2FuP2K
         vmZkR7+CzSYMh0k0GdSower3/61Aazzj6k2MEh5MgsBbBZCStEbc/DRnHefWMmmTQ2Ha
         4sYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vk5wYy3sT4I5WW+WUYmWyAImSgUa3X6inu5KcZCXPKY=;
        b=z5PZ2vDvWuzPdW4vhEww/xKxmysQqa7k//AG/lk8qkaf63qiNMtsjqGxvJQIxvqB7L
         uDWDL3NziZNaD8EQUFxF8hy4nlJHCUYkCH5EdnPSXMIuHpNuhVTrJH+clz4YuCAOQp6l
         oaqegA4XxMepZYUhVfpK4ShRVSa8NOr6Zi6/KIdHhNoIgLhxhhSoLKQe/evyBSH9BXOM
         LaxdF1mC6LGlTLfMGuf7wW5CGuanqKWfhPF14MwG6wXkV3FzPPkWfnTjUKFpOqYdYZbR
         jtnGWU0WqjK3puX772JGSVJ2ushSsnJRYTSEJ/C//6KhdV+VuhfovcSbnOPtyBe/5gHd
         8+DA==
X-Gm-Message-State: AOAM533HfeQ8AGjHZVJ89zFncfCf3nttfyE9vX/8W1GJS9TwvMX+XgMF
	YoiuJazlW23nv+RVm74nY/3tSH3Quk7O4Z4ImBg9Yw==
X-Google-Smtp-Source: ABdhPJyVqcYu3VpsE+xUOxSO999oM0orrVsNe7CURCcH7MfcCvDqjXznVMXZdNpW6flzSa772wPoyzvt1jlwncMP0EQ=
X-Received: by 2002:a05:6512:3ba5:: with SMTP id g37mr24568699lfv.651.1643837243564;
 Wed, 02 Feb 2022 13:27:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202003033.704951-1-keescook@chromium.org> <20220202003033.704951-5-keescook@chromium.org>
In-Reply-To: <20220202003033.704951-5-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Feb 2022 13:27:11 -0800
Message-ID: <CAKwvOd=icTwyFb39U3OO5i_2YNJMiCMteeNTrVe-Q0tcmmnBJQ@mail.gmail.com>
Subject: Re: [PATCH 4/4 v5] fortify: Add Clang support
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	George Burgess IV <gbiv@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 4:30 PM Kees Cook <keescook@chromium.org> wrote:
>
> +#define BOS    const __pass_object_size(1)
> +#define BOS0   const __pass_object_size(0)

A dumb bikeshed, but would you mind naming these BOS1 and BOS0, and
perhaps consider adding a comment or pointer or link to something that
describes why we use the two different modes?  I recognize that the
code already uses the two different modes already without comments,
but this might be a nice place to point folks like myself to so that
in a month or so when I forget what the difference is between modes
(again), we have a shorter trail of breadcrumbs.
-- 
Thanks,
~Nick Desaulniers
