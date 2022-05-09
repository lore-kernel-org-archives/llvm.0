Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4707B
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 19:50:16 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y32so25663839lfa.6
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 12:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUw4VaKIzxrbYNwvojWVRe8W2wHxEMMJeCH5HQ+Oo5w=;
        b=RjU5sRMW3dnGEQjLoVoh4aJgCLuyLKWdPccKJsojGEtVqmZdIWkuXQWc9cF7Ej/2zB
         HHBnEjo99v2jfWA+f/P7jQnzyexM6xakAs3aIrOnzRgfKtuGeHzQS3SbhFzdm7S50A3n
         CCt1j4XXaSI71WLPsEoU+4V1qUNuSDxf0GOQG3PMYwyljAmf5EHaLuATgVBaCvoKesTp
         oKSRvrU6Cu287E6FaG2f6Z4zpZnAJM+BixQ0Ttko8R8KvNTVwvRnaH9bPHU3fbH0HU95
         guFNGhyt9baLgCmsZ781fRIugm3e8RB6RjXGultZMfiuIG3cf/X8T+7P/8p+jI6gfCNF
         GTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUw4VaKIzxrbYNwvojWVRe8W2wHxEMMJeCH5HQ+Oo5w=;
        b=HFe3foe6VKtB7LShxKeAWYJqdSjwl1/rTyi4qXpiO6oWVHBJxtSfiB8pmxJkDUR6g0
         C5v7/kj3EkKy7wfPVYBAX4rd6RcB3LLJNnGAb3exTFdFTeKc92GzUUllPSegfKYTS4sm
         OLWL7rPNgjpKulxI2kbH5di6pup5J6eeZHJMwzzEYwLnaKi6U9oU2PGAL0QBEjeEplNO
         zuhLjzB+7WwZpFFVjaIMxB7z91zUczQbYeFBECAIoMFjR4MZNWCyRTsso+MHlnLgfUkX
         IoaPm8Vkf4o97FIZVfEGoM+ZEV0GXhPvX2LIKoDHJXhgWUAVOdWe0lcE4+iShzh4La9H
         3YEA==
X-Gm-Message-State: AOAM533E7kPhojN4syHPBwxXrzqX1zFtb9bgt19uu5n/ilGuatj4oPCE
	ZrZjQHqO4h1yodpZjzjFSMmGqKDdmckufg8xCp6dYw==
X-Google-Smtp-Source: ABdhPJywhFfJnbeomWArH6XEZjkjyPnKkE+73BynU3wttwwSJWub8YJXqwbxg5a4RUAhdOQKKz5bS9lQAR0Di7Rvhzg=
X-Received: by 2002:a05:6512:48f:b0:472:3c47:94a0 with SMTP id
 v15-20020a056512048f00b004723c4794a0mr13708380lfq.579.1652125814206; Mon, 09
 May 2022 12:50:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220306171009.1973074-1-mailhol.vincent@wanadoo.fr>
 <20220508100907.61231-1-mailhol.vincent@wanadoo.fr> <CAK8P3a3Fw2T0WSkxv4DiTG2wGkKcs24StPx-BG_vi=ffa9OLVA@mail.gmail.com>
 <CAMZ6RqK9d0hFwYebaArKjod4LJVGQgfDygpbGdBu-4BCDUR_SA@mail.gmail.com>
 <YnhXgzhghfi17vMX@dev-arch.thelio-3990X> <CAMZ6RqL7543LFU7ywbr-FV9A3n+m7zNy-J00j=ZrNMkDonq2aw@mail.gmail.com>
In-Reply-To: <CAMZ6RqL7543LFU7ywbr-FV9A3n+m7zNy-J00j=ZrNMkDonq2aw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 12:50:01 -0700
Message-ID: <CAKwvOdniSVMOwkBke2EcgONn_Vmv88M+B2FTYL_BKtWawCSLAw@mail.gmail.com>
Subject: Re: [RESEND PATCH v1] x86/build: add -fno-builtin flag to prevent shadowing
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Tom Rix <trix@redhat.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 8:01 AM Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
>
> Instead, I am thinking of just using -fno-builtin-ffs to remove
> the annoying -Wshadow warning. Would that make more sense?

Perhaps a pragma would be the best tool to silence this instance of
-Wshadow?  I understand what GCC is trying to express, but the kernel
does straddle a weird place between -ffreestanding and a "hosted" env.
-- 
Thanks,
~Nick Desaulniers
