Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3B18F44
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 17:17:00 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id l5so2682204ybe.7
        for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682011019; x=1684603019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iR3MrYbDMYps02FpM6CgXLeP0ow7vP9dNqGf0sKZVkU=;
        b=feAhS6Gn5OV5Nz56PvCNsQQbwHKpP2XUJx+Rxk3BWh2G0DJ8XgpcrpkMYqNtu2PlxG
         Ymcju82iy+Ky3oowVt6Dl5q7FfQinxh53sBwmmWDmuaiZ19/HY9hBEySYF/fWeAsVCk1
         EGEwfyfTG/+QXWyaq5pjQsqEZszr4a4D6vces80Bgj02hvwL1RGiLaJpwswAQO2lzym3
         gJOaK96xyucW0NKY5tFxOvX9YoUQJRZGHqdlQo6AyCyFaHeyCDMrx7uIkIdm9ffC9OhA
         nl+P+DestXdIoa40lCbxAwcBW61PIpAu7bnP1blZU9hqih5lTYKIcu3teBJTP8FmgHUo
         cprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011019; x=1684603019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR3MrYbDMYps02FpM6CgXLeP0ow7vP9dNqGf0sKZVkU=;
        b=SUBmkoiX4KxaxWISABAbF/cMhjjxbwvlHfDR7cXXabQNpkMb0IpetMmDA+BgpGlWJk
         rBRWOpl124e0eqWYLn9E6OgNaBnX59zhMcZiOeUYsRjj2mKowV4Ix39+nbgr1YH/Jcw1
         AVZuAb8MPhfopFAgs61C/P/4m/acKMs9sYmEj4wvPR5C/wH669ZD99/uZtqYFicHyOy6
         za44OkFsEMGUbEnSM1hTFN2WwpkcLxQBmSIRY5xwljsCD4kOZ1Kf4TfxCTP/6a88VGGE
         sIGsS+xrrA0CCW+QZR81hb/suSKxpV47+Rjnmu4zDgBszN5lpY6cc+M75hBQogNaT00m
         pgcQ==
X-Gm-Message-State: AAQBX9cmp5Y0pdkO9R7nPMPYvr9csVlM+a0vbcF+KWK67Ay/W/xpiOz9
	uVkZrLqhGXKCQh8dQ5j+1Zj6hrEFn8UHEWprWFM=
X-Google-Smtp-Source: AKy350b+9jyLFlcvFZTFwaDafV4O6IuCCJNUZWmUt4dda8BcGy2rSeuJ9k+2jdOPTM1SqvEljb+qQWNrtFbjMzzfWxA=
X-Received: by 2002:a25:183:0:b0:b8f:545f:aa0a with SMTP id
 125-20020a250183000000b00b8f545faa0amr1973346ybb.31.1682011019151; Thu, 20
 Apr 2023 10:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_CB1A298D31FD221496FF657CD7EF406E6605@qq.com>
 <87sfcuu0fm.fsf@meer.lwn.net> <87o7nitvd4.fsf@meer.lwn.net>
In-Reply-To: <87o7nitvd4.fsf@meer.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Apr 2023 19:16:48 +0200
Message-ID: <CANiq72k7gVJ1gjN-qbkUM_hh=1QEb8ezKb8FnaD9hnF2kka8Ng@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process/changes: Escape --options to fix
 Sphinx output
To: Jonathan Corbet <corbet@lwn.net>
Cc: Zipeng Zhang <zhangzipeng0@foxmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, masahiroy@kernel.org, codeagain@codeagain.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 5:40=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> We have long disabled the "html_use_smartypants" option to prevent Sphinx
> from mangling "--" sequences (among others).  Unfortunately, Sphinx chang=
ed
> that option to "smartquotes" in the 1.6.6 release, and seemingly didn't s=
ee
> fit to warn about the use of the obsolete option, resulting in the
> aforementioned mangling returning.  Disable this behavior again and hope
> that the option name stays stable for a while.

I think it was deprecated in v1.6, and removed in v1.7. There seems to
be code for printing a deprecation warning during v1.6, though.

> +# If true, Docutils "smart quotes will be used to convert quotes and das=
hes

Missing quote in "smart quotes"? Or maybe Saxon genitive?

Other than that, sounds good to me!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
