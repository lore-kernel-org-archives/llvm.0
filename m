Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6AE2C8F
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 17:49:07 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id k3so23010349ilu.2
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HjdW/J41CTP6p7TduzFh9+zmoUvsISMf0iYtuNEONWQ=;
        b=fSJDCwnxeFIxZrnJ3pIimYU8vOVErPsMkXvZdtKzrc3sh9Q2L5XuIVSSjBJqTM+DMR
         3Wpw9/Wwb4zCkMhxxLpgDiriFDH8iiY5wuk5p7Zz9W7Iq3gSHSLiWHZ2a886Ul5nY9jI
         skPbHCjjS0JH6nk85+feQb0JRRVQS7ES6Ty4TDr8JdMaoN2ST8cM7xPBQ98aG+7AStQJ
         geocgiHecYGpjXyXF394vGOHScN7e7juEY+MndYbJXCk/yYpniBEWsE+zm33HmFRCJ70
         L5ANsq4ciODRNCT4YJviYXYnMR/uWdLfvJWVBK3ssk+7rnqEWFpXhT7qGTjspJSK3yrj
         TGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HjdW/J41CTP6p7TduzFh9+zmoUvsISMf0iYtuNEONWQ=;
        b=2teVMNJQhMGpTu/yILuFuBt+V/2iOzAGoNcODF7THNX23HV7pbUagpSYfZinGz2NnJ
         Cpx9zbLigfkjQhz5aCqmPLMjHMUyzS3BTHO00upFb91DTbAGUU2lFSzG6FSl93sxegRO
         ZYy0AjPvJyCp2HjGuV9CU2e1Z8ujkIRfK2EFzM0YPGuuJwPmXO9ckxlHzVI3jCIcTsdw
         S4f6hqmu2H3pwy858r5u5KsePMkrq0Ua3S4eImG1bRSycOMzvIj86AApiEV8ZzTXqIzI
         IhEQtyn/xgMy60lUZui8hod3G9sqKxAvR5Ixy5GfdzZFcn0J7ECrMS5QVwCAIGnDFRf9
         yW/Q==
X-Gm-Message-State: AOAM533H7oesWEmFf+rCW7KnGv5iIyO5uk9cnHDzuqOFrsXeH3pnImah
	fIXrsbWd18xINXoI5tyiL+HhKZwzGWZ4RPL8fKg=
X-Google-Smtp-Source: ABdhPJwqc4x1oIQbpSHkR5LIDn4xq+/w7aGOGNe/RpeEeJU5EAfsWRl0yDYwgmO9nDxDvIqwfZl6hH2VWM7OHSICK2s=
X-Received: by 2002:a05:6e02:2141:: with SMTP id d1mr342997ilv.5.1634752146703;
 Wed, 20 Oct 2021 10:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org> <20211020173554.38122-3-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-3-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 20 Oct 2021 19:48:55 +0200
Message-ID: <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gcc-plugins: Remove cyc_complexity
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Dan Li <ashimida@linux.alibaba.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-security-module <linux-security-module@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
>
> - * Copyright 2011-2016 by Emese Revfy <re.emese@gmail.com>

Perhaps we should Cc this address to give them notice.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
