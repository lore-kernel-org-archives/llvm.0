Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4004C74
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 22:28:31 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id uj29so36004765ejc.0
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PAb2yvZK0Azo5fYoLsSkJfhNFnrLBlWmRLOEh1fEo6U=;
        b=Esms5UFKrq+sy3bMqEsnXEBAzrb1Z4PlxF4f1306MBOPocD9GZhkWOMGTMMWtP1ZKl
         yW5NJw9YfyBE/2nA7zZSAx3T6C/+J7LJdx+oGUQhIKFZXTIWU5yVxfIVwy01zjl2HbLM
         8urB3rWUKKGEL7AHHfqV/YUUOm3BcXCVKghgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PAb2yvZK0Azo5fYoLsSkJfhNFnrLBlWmRLOEh1fEo6U=;
        b=eiy004wz3CEHBnDHCTYBb0vIFUcIyrU+LMizQ7JBF1gsjYzY8zRYt6E8JbTE4Py0I6
         fLFSM3cfuanTYiw83aaoUnOy6jU0HWex0fRKQJGBbSVeqZ9uDmTEmwyPBRKeySFFuWy6
         wNgq09/C/hETfKyzAMJmXqIw2gVP9Tvgk+p/jxEdE0KvXsIqJmCBaHlONG9twm+JFi4a
         eOkT7kR8EKpf0x8QLpw2THCnFhNZDD5JhI5x0cvsd90PFLkz2PM68eIukUP1PZmRp0zM
         bAICzkFt5sqqxlHc+lpHM/F2cjdXrAbMvko3dIdLO6N1bvgSx4/vVse/+yaID2px075T
         Ps8w==
X-Gm-Message-State: ACgBeo3rAFNu6FTW5fCI3lemzKIL8K9UKZFwYtWr+TdH9g6K+HZeZD5N
	5gKew0N2fxqHm8/ODnWY9Ni+AXAhbVR2d9bT
X-Google-Smtp-Source: AA6agR5LKjs6QlAknsb/8eiU78rg0DG45jxW4pgOyBhb/0oQehKUrhPKT/tyOYw6yuE6vLnLh6vhtg==
X-Received: by 2002:a17:907:1688:b0:730:b3ae:347 with SMTP id hc8-20020a170907168800b00730b3ae0347mr779694ejc.756.1660256910072;
        Thu, 11 Aug 2022 15:28:30 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id z7-20020a170906d00700b00726c0e63b94sm144024ejy.27.2022.08.11.15.28.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 15:28:28 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id z12so22804658wrs.9
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 15:28:28 -0700 (PDT)
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id
 m8-20020a5d6248000000b00222cd3b94c8mr500346wrv.97.1660256907686; Thu, 11 Aug
 2022 15:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvSxeDkmwxcJL+Z0@debian> <YvUZ+9kJ/AvUMxzO@dev-arch.thelio-3990X>
 <CAHk-=wivP4zipYnwNWCLF5cd24GLs3m8=Sp7M-CmmPva_UC+3Q@mail.gmail.com>
 <CAKwvOdnQjgtwqFXLv+QtWPfpHosM5fxE5oqbX0VUD53F8L6bRg@mail.gmail.com>
 <CAHk-=wgJA=e-CLcvU5LRKu0bMLeAewXtOM6as1hFVeQAVkMPbg@mail.gmail.com> <CAKwvOdkUc=8DD938in5PMeGYAn3PEWp4E_W8qEHq_y7Smy8+mQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkUc=8DD938in5PMeGYAn3PEWp4E_W8qEHq_y7Smy8+mQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 Aug 2022 15:28:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiW_LjFRE9wFMj-j2gp9=u8jqrMVZtT3n4-oJWtQ6E0iQ@mail.gmail.com>
Message-ID: <CAHk-=wiW_LjFRE9wFMj-j2gp9=u8jqrMVZtT3n4-oJWtQ6E0iQ@mail.gmail.com>
Subject: Re: mainline build failure for arm64 allmodconfig with clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Joe Perches <joe@perches.com>, Nathan Chancellor <nathan@kernel.org>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 3:04 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Yeah, I guess adding a truncate to the caller is kind of unnecessary
> if you're still going to use %hhd anyways.  What are your thoughts on
> this bug I've filed?
> https://github.com/llvm/llvm-project/issues/57102

I really wish that bug report was about how *wrong* it is to warn
about that thing.

Sure, a cast adds pointless code to the caller, and is overhead, but
that isn't really the argument here.

The argument really is that "if you force the value to always be a
char, then %hhd is pointless"

Basically, %hhu and %hhd simply do not make sense if you always
require the value to be cast to the right range, because for those
cases the much simpler and more straightforward %d and %u already
work.

So a warning that says "you didn't cast it to the rigth range" is
truly fundamentally broken.

So it's not about "a cast generates worse code". It's really about
"that warning is WRONG".

          Linus
