Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA363FF5
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 00:57:42 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id l19so21775740vst.7
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=3DZPJUSQwIIwcPnyAkR1NQv0eMMiHcXMtz6SXNb7OxE=;
        b=3WOFksZy8ZZOIybnQMCGjrluGv5EQ4Ygdb6XCkoY8gV7RjahThEVHApn5Jjp7VnAza
         TVt+KiyxjgcbhbuiQh3QMNGjSeI6SDKnBWrYsScLXWa7WV1YkZguNq83rcOzasY7lDIF
         /tdT/vbJUS3WqDmgUIeh7SuCp78FA/65OSGOYwBvBxq2Crvyye6Bf4ZHX0iKcJVC+YjW
         kql5Yr2axPjMehM48whKIh2Qn0rldDk1O43L/lfrtANCWP1rEZ/CRXp1zL5KxJ1+mRjs
         PxGme7xJqw81yAoF8gIDofh5BFycCFl5zfFJkcyvJNzzgxMnWfpyaOXy3ME2y55uUjFI
         8e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=3DZPJUSQwIIwcPnyAkR1NQv0eMMiHcXMtz6SXNb7OxE=;
        b=I9NX8uKRV6roInpGAK4abQzVS5UQkHg/b1I1jR1JhPz42ZDZeIdWfJg6vi+l4TPesD
         CJ4HpRi5uM+YWDIoK05ovD0AhP6zf8ZC335uCe0w8hZtpsNIgh1QAlyunt0bMtWOhq8s
         TvFoGxF3z2llHc3BfBBFzuHRYxYRsS6VZQbAvkDUAqXCcWpV080UpLJHBzREPuTYmKU1
         guDWuUF+6NUFjDGWxpiVQBIZTaT4pNgTDghuWISwiNPQQLsOcT9+GJCBwLzV8k60wmaL
         JzhWOmb/s381ChR7GWHXmMIsrBVGHMiCNwu87ZrUx6wUijYxsPVlOvbgf0ERy+5Vvv+9
         QEpA==
X-Gm-Message-State: AOAM531Qf5hlfMtP7oVAUsp4l281kdD6B+HW4xBJV7mLP5Vv7cDzuOds
	dluMVlZ5GZNGvZ7uccpQfmzQrQ==
X-Google-Smtp-Source: ABdhPJzGUd4ZAFoZqSktNsK2dhWzWX17bSWZQSxjM2h80ka1/OxjD/4MCvt9MJ5Exlxj2RsdsdBj5g==
X-Received: by 2002:a67:d78c:: with SMTP id q12mr3535268vsj.28.1633395461689;
        Mon, 04 Oct 2021 17:57:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id b3sm7872360vkl.6.2021.10.04.17.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:57:41 -0700 (PDT)
Date: Mon, 04 Oct 2021 17:57:41 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 17:57:31 PDT (-0700)
Subject:     Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for ARCH_RV64I
In-Reply-To: <202110041750.C90595D1@keescook>
CC: ndesaulniers@google.com, akpm@linux-foundation.org,
  Linus Torvalds <torvalds@linux-foundation.org>, linux@rasmusvillemoes.dk, nathan@kernel.org, masahiroy@kernel.org,
  joe@perches.com, arnd@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keescook@chromium.org
Message-ID: <mhng-f7c38c89-4c50-49cc-9b9e-7089cb83a307@palmerdabbelt-glaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 04 Oct 2021 17:50:46 PDT (-0700), keescook@chromium.org wrote:
> On Mon, Oct 04, 2021 at 05:40:42PM -0700, Palmer Dabbelt wrote:
>> On Mon, 13 Sep 2021 09:23:45 PDT (-0700), keescook@chromium.org wrote:
>> > On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
>> > > The minimum supported version of GCC is now 5.1. The check wasn't
>> > > correct as written anyways since GCC_VERSION is 0 when CC=clang.
>> > >
>> > > Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> > > Cc: Albert Ou <aou@eecs.berkeley.edu>
>> > > Cc: linux-riscv@lists.infradead.org
>> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> >
>> > Yeah, good catch for Clang too.
>> >
>> > Reviewed-by: Kees Cook <keescook@chromium.org>
>>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> Only this patch ended up in my inbox.  Where you guys planning on keeping
>> this whole series together, or did you want me to pick this for the RISC-V
>> tree?
>
> Linus already merged this series (see d20758951f8f28c0ee1b2a8a6bb8189858083895)

Thanks.
