Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46972
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 22:48:45 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id n77so2936648iod.13
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 15:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vq4rv0bfOp4Mbz0vcICElRxaucBKkyl5l9ANfNhh4nM=;
        b=iXF8clc3KDTdWuNG9VRHRHjfiXo0uQ+meIC9VdUXKeSh0xoLUE8k5pUqFfoDd9mCZ7
         6wAu+igXTtOzIHFb9lyENr6cryoVMrHNb6x+ebk5GKmxN/WK57wegbe4JMAN8FeiW5nI
         CKXpPFuakUFQtjMvO5Gi4n60XBCaFEWFvyzpRC3wp3IGqYfYORvWPnO3Uo/8iSzirci8
         tgOh1xF6l4gXGgX74wlaIFLsYxnRIIo4Ji4QC8XZefxH/hDFOXNNVejPtLZvQ7k0RAVa
         TClLD60MUwaDKGd9HXEVZLgjqh3fLb3K34464TvY30xg1ojcU28AdWOShrMNGN1HLEzo
         RcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vq4rv0bfOp4Mbz0vcICElRxaucBKkyl5l9ANfNhh4nM=;
        b=sNzNyCYGbUCyhL6UgOBAiqUVhTP1nZaCzJ0kACPrd2yrc1Q54iO4LzopJy8SELeeAl
         gy9SrUliEtyoQYjQr3M7D0reVPLhfOVBq8LwQDxoVHLlM7bQcOGu+HuNZdauXteWBi63
         /FpWx6KAJ6mlu88/SfkatYD0Tl4MfL99NSGZ448BNum1eR3htjCxQX23w1e5wpzoziwV
         NczgClEfOFm4lDJZfOvQhtKP4iHohFDA7S7/cRnNZVkXCW4fiapJearf/TTGFB8EvRGC
         BBVMtQ5ofY9/qdNLS6zsSHjF8L2kr1oKtYDpyHx5WRALLzgdJ8VfKMYLY9DhbYQ7Jfhc
         od9g==
X-Gm-Message-State: AOAM533Xp+Gbn79g5lc72hDdnWMBz7wEbyeSOJ+2CxGVuyQehOmgnTOl
	XpsqvB0Vs8zo+b7055e8z8SVnLAkN2HhXwLj0kE=
X-Google-Smtp-Source: ABdhPJx8r7HjGQMYo+y0dlDjHb5Viagc9unNFdG3YpNQJOz8BqBN32PhELMI6RPyMl224IsyCmnW9y4nYNGLghFzQBM=
X-Received: by 2002:a05:6638:45e:: with SMTP id r30mr5856110jap.133.1634856524728;
 Thu, 21 Oct 2021 15:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014150610.GA22151@kernel.org>
In-Reply-To: <20211014150610.GA22151@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 22 Oct 2021 00:48:33 +0200
Message-ID: <CANiq72=702uKFJiW6KVxMfSxU4TR+DmsjKywMrs=_CV0CTkH3A@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: remove GCC 5.1 mention
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 5:06 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> GCC 5.1 is now the minimum version.

Applying this.

Cheers,
Miguel
