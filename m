Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C8C38D
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 16:38:50 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 129so15700621pgc.5
        for <llvm@lists.linux.dev>; Wed, 05 Oct 2022 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oQbM0nVWmaDXyk82cl6r367zDWVYGaPQODZVcdO+QZM=;
        b=Hvcb5sHqdru0SR4QpRIz/cd5ZjallOVpwA/Xe1rPLCdPvyRIAk3u2ZzmOM+RCSI4jO
         xwGVJxU60hIgDlibk/ghL6C0nR+WwOg3rwgU9dZ+xS3HmhEdtDucFiWz6Jh47/7Yarn8
         mYpnPD5igo+2paasd/TO+B/9xkXR9uEHlwTrhKvIrvCTAOf2BXnATMSDQHxI7lKESOQd
         77fdwtyclHf4iHYpXv1jqvj5lFtaIlvlg6qZrtUyopdTpppjkDJCMdC/xBgcTgbkQwFb
         /4mq3kG7xMSbvqgwG7o5F4vcnrLKamlu5jbzAh2W1lzrlQTZJ1Kwn8XUra5gHp91EhHi
         SSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oQbM0nVWmaDXyk82cl6r367zDWVYGaPQODZVcdO+QZM=;
        b=cYlVIhG38uAthQOhfUrnNxyI5O6Xd6zbF992k8c+ShlvCT5U9jFMDlQIJ+Fk3v0Jux
         +L3d7MkoGQHIo3iXq+fw2mr6w8iPJN1nmmhE5gpb6rlQ62T/XK36lSQn1Cu3M2nNKQr2
         aRipP+t/6NogD87NqRC3xvdTjJoWVMf/+cNaOF5hFlCBj9vSmwAKrcTGDRjbUiFYQ9fj
         kTffZp5IRXDc1m3N406o/skzAa6v+Dm7TJp8Uw9Ke0fJ7PuD8qZuX6ZrgFCl/YKpCx9M
         b12k0bNP+TEqjyXO2xIXdVRe1M74v6S/Lq91gtSsw6dDtMQchhKucsPo1pwzROLQhDeq
         AHTQ==
X-Gm-Message-State: ACrzQf1rIAMiSLWR4+vzKMbcRM4sb3p9Na/YLF7M5trljAKNgXjo6HeU
	gto2pAKYAQMc5j+H//fyvsPElfCN7u8QMT9OjAnzjw==
X-Google-Smtp-Source: AMsMyM71N9pjV+owSSTwxxr2FguNkvc47wBKX2/glG8mXnLd5jbKpLUAq5gPGDnyOa8pNUB/CiA5HYCdi64kN1H1Gmw=
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr555835pgi.403.1664987930207; Wed, 05 Oct
 2022 09:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yz1oTvzDpCkOE+fr@debian>
In-Reply-To: <Yz1oTvzDpCkOE+fr@debian>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 5 Oct 2022 09:38:38 -0700
Message-ID: <CAKwvOdkRQk+x7CP6p_TsZvoM0pnL1mjEBgyKp+NC-K_cVnDUGA@mail.gmail.com>
Subject: Re: build failure of next-20221005 due to a3a956c78efa ("fs/ntfs3:
 Add option "nocase"")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 5, 2022 at 4:19 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The builds of x86_84 allmodconfig with clang have failed to build
> next-20221005 with the error:
>
> fs/ntfs3/namei.c:445:7: error: variable 'uni1' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>                 if (toupper(c1) != toupper(c2)) {
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/ctype.h:64:20: note: expanded from macro 'toupper'
> #define toupper(c) __toupper(c)
>                    ^
> fs/ntfs3/namei.c:487:12: note: uninitialized use occurs here
>         __putname(uni1);
>                   ^~~~
> ./include/linux/fs.h:2803:65: note: expanded from macro '__putname'
> #define __putname(name)         kmem_cache_free(names_cachep, (void *)(name))
>                                                                        ^~~~
> fs/ntfs3/namei.c:445:3: note: remove the 'if' if its condition is always false
>                 if (toupper(c1) != toupper(c2)) {
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> fs/ntfs3/namei.c:434:7: error: variable 'uni1' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>                 if (!lm--) {
>                     ^~~~~
> fs/ntfs3/namei.c:487:12: note: uninitialized use occurs here
>         __putname(uni1);
>                   ^~~~
> ./include/linux/fs.h:2803:65: note: expanded from macro '__putname'
> #define __putname(name)         kmem_cache_free(names_cachep, (void *)(name))
>                                                                        ^~~~
> fs/ntfs3/namei.c:434:3: note: remove the 'if' if its condition is always false
>                 if (!lm--) {
>                 ^~~~~~~~~~~~
> fs/ntfs3/namei.c:430:22: note: initialize the variable 'uni1' to silence this warning
>         struct cpu_str *uni1, *uni2;
>                             ^
>                              = NULL
> 2 errors generated.
>
> git bisect pointed to a3a956c78efa ("fs/ntfs3: Add option "nocase"").
>
> I will be happy to test any patch or provide any extra log if needed.

Hi Sudip,
Thanks for the report.  Please help review+test:
https://lore.kernel.org/llvm/20221004232359.285685-1-nathan@kernel.org/.

For future reports, please take the time to review:
1. Our issue tracker. Nathan had a bug filed about this yesterday.
https://github.com/ClangBuiltLinux/linux/issues/1729
2. The mailing list archives on lore: https://lore.kernel.org/llvm/ If
you search for -Wsometimes-uninitialized you'll see Nathan's
report/patch as well as reports from KernelCI.

I'll take more reports over no reports, but if we already have an open
report, please take the time to participate in the existing threads
rather than create new ones.  That way, if an issue needs a discussion
to resolve, it happens in one thread and not across multiple.
-- 
Thanks,
~Nick Desaulniers
