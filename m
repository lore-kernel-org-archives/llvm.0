Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551012904
	for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 11:36:34 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id l4so2290891ilq.3
        for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xWL9H7Cbc4v2FgRfmr8f53bQANuU95GmvHgWHVu51kI=;
        b=nuGAnz718hTIDG8x472iASsuCuAR1frKWhu53XAd1i9txp0dG29y/aoRGt5VKod55V
         vZz/RqrH9CCdn319zMhWhnv8/BNHvfsvHOhNNpcaNtlBneQMJLqSKcxNp/TdZDmWy9Qg
         qE8jBWmjyTpZbC/qRsMV5QdCKG8KCJzFAWSALEe33rhemjKgxmyyzGz44++IZ1ryiwD2
         RW0FnRvlr/KZP7bE4gnDFLhIxwIUdqxWs7kX8+3TKpG+3x7WDlJippRa8w0+reTpA/+3
         2msHr29RdRvRSq5S6j0mGLZSEZWCq1tcfRUfvObSsIJfv/F6MNpQWl4KOs8UbUtb8Zuh
         fL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xWL9H7Cbc4v2FgRfmr8f53bQANuU95GmvHgWHVu51kI=;
        b=12p1mId6NQIWXoN9TlhLSuIC1hf7L/grpS36Rb9Ozcpl43ot37WMro6q4OZN0xbihh
         Wv2sPTCTpmS6F28fQhPslOPLJ9b5PYSqabFGNlOWuGbWxE4yIbi4W7dFRAcAnrtIqeui
         FQ32NHqLexnjkbnelu+aBmKx9tbOUSkM1tSAO6KSLCXAApJez2WQ+GptF4idL+AwMGb3
         /hTHlD/k+L8CkluNFRiImMWQnVq5qNtcAtvXdCjQnFIWQmhvKZXSvpyVXwn+V2cKSP3R
         3uaEWBDe/KU4oByusBTUn/lSdtao76N5pLGfAx+KVpSIgFK4I+w4rLYIQk2JdMrpIxno
         AMCA==
X-Gm-Message-State: ACrzQf3tun0DsB3tCOlG0aPKgDRSW2XvpBPIyV0lX9FCVKv27UK2TAyQ
	c5OiUwEF8cdraYdw/gS3e2OtnXe6uIs7XiptYRs=
X-Google-Smtp-Source: AMsMyM4vRE6qPYMJjiHtzUWaCajCHFCkHMbT9IoMTG3Rgnkno8rn4gbQDbOuIROT4NaBUTn27/6ZKLFBRK+0f4o5+OE=
X-Received: by 2002:a05:6e02:152a:b0:2f6:58ae:ff0c with SMTP id
 i10-20020a056e02152a00b002f658aeff0cmr8531069ilu.237.1664105793350; Sun, 25
 Sep 2022 04:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220924150715.247417-1-keescook@chromium.org> <Yy/dLihBWSFzZdyq@dev-arch.thelio-3990X>
In-Reply-To: <Yy/dLihBWSFzZdyq@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Sep 2022 13:36:22 +0200
Message-ID: <CANiq72nb8s0odCEfCEeWDKjJ7=aj_JxO9iaR8Jmn6LB1aSGifQ@mail.gmail.com>
Subject: Re: [PATCH v2] Compiler Attributes: Introduce __access_*() function attribute
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 25, 2022 at 6:46 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> The GCC docs say it is 'access', instead of '__access__'. I assume it is
> probably okay so:

Yeah, attributes can be used either with or without double
underscores, see
https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html#Attribute-Syntax.

In this file, we always use the underscore ones to minimize the chance
of collisions, since the idea is that the rest of the kernel uses the
shorthands provided here.

Cheers,
Miguel
