Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A22F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 21:13:08 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id y84so5019044iof.0
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 13:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EAWfemoiqt84lCy0CQhK2iRzzP1lWnWiJOlRJH5DZgA=;
        b=WYszGr9/9vMCZjMAMMWpwyOI0b8ae4edwyKf7kW/L0XP2dJ17AwmdNEY5WZsqp46VE
         2auGlnnWLqq1tcFf8xB9PjXkBdzkR1DCVzo+FlH3RonUnQG37cKSpLHHhKLRAeQ9u82x
         KDvoj3P2RnEmL5cBB91xGGaZrxQGl26u8O5Z0FvAU0zZmNJ9f1lgxZyJZxPG70/M9R/b
         ZJB33zZByxUV7wFEaqLYgd+ex02n6v5Sin73zmgz1phF7SzYYXJbOCMs59DKN89l7R9o
         +chzwqlWS6j1F58bNrzGZ2ob7HrdIQfuBWHLmCaIFNOrRvUB+BOcGjoJeBolVVl6dluW
         Wyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EAWfemoiqt84lCy0CQhK2iRzzP1lWnWiJOlRJH5DZgA=;
        b=odVfg0Ta9hQf8k/ayfkNaoO21zBlUauI/8MfPVUDJUbWwf6GE69MmHaOQsbnObnPwT
         EIdaIAgzDkMbdemy/ofFVLbBuCCD0dWKCsRkYKz3eTX74jKpV1oaiShe7zk24VGmvfDz
         FkEHVRKLiuyYfPeVq75LT3qMTrM02Ba06XFK4PELEAGt1OcBkh5cCvJM2lwqscnn7yOb
         4L4L/wCmRV6Ixs7Djo4YD1ExYNi+2cysfyQ1dkDt1ctpGrj0WMQ/Aths5g8BZK7djmOz
         3/dQd8zzfJ58LfaE/BLyjk5APileDVpBgn7xg+aOEu6N1jGlzdwgaxQxRcOh/Gc/9ewS
         H4eg==
X-Gm-Message-State: AOAM531wEmTGes+3836W9rcCXTcdOhEkGjGxDXzbGmJ5btfuIzntpMEk
	ZiEAeH4TGWQF/UOywjWzpWngXbvsxSdMk10XPM0=
X-Google-Smtp-Source: ABdhPJwjzT9x6XYF9AVrKVnK4BdNmajWV1Dh6FA+YNP9fOCDXz2KjrJZigMbMtsj+hSp1in1/oF741KFxCePyDUQSJk=
X-Received: by 2002:a05:6638:4105:: with SMTP id ay5mr19025118jab.186.1643922787187;
 Thu, 03 Feb 2022 13:13:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203173307.1033257-1-keescook@chromium.org>
 <CANiq72mnF5qxfHGoDmvueMY7n2us9ZtA-u3igCJ+QjcbfKMP=g@mail.gmail.com> <202202031157.E18FA7BAC@keescook>
In-Reply-To: <202202031157.E18FA7BAC@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Feb 2022 22:12:56 +0100
Message-ID: <CANiq72==yx_VnA_b2NMNMbw19V2bzuDTddgRHGO94Vj0hXfiVw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] fortify: Add Clang support
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, George Burgess IV <gbiv@google.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 8:57 PM Kees Cook <keescook@chromium.org> wrote:
>
> Thanks! Does this tag apply to the fortify-string.h patch as well?

No, I would have to take a better look at the new attributes. If you
need it, I can try to find a bit of time.

Cheers,
Miguel
