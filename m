Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782B2C9C
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 18:07:08 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id m11so28412148edi.13
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3ngbIhCdogOcBSU1e6pp7yjPEGqtjsYnsxL5Y/3BpBs=;
        b=MWuX920xhwonGe/Eb70HBXGdjtu5RWpImkn9WM5pAZLILk/by+T+gAKQz/5ki2lADw
         ahNGvnc4HO9cFwyKxVCsJVfkrcrG7gniiWGieXnlzfe/2y+gBJm8alG9ty1aFzqpcBxZ
         uhsIC39YV0NmuPj2wAfQThdYZ5J29CbkiQZm6ux11SRxNh2wz3GyJ9cW+ziYHgSfFZRG
         f6gf0+csG0COT81NSw2TlP0ORR6mF7X1jao/BWb4X/Q+hzIykX0brdlNiRx8Nmuz0+Dd
         DOjAOzM8e8xnWD27OTh5Wm6zdca6CDEHBb3ZJxsj1Lzxpm79u43XqAPsQNA7zEsvubwN
         zVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3ngbIhCdogOcBSU1e6pp7yjPEGqtjsYnsxL5Y/3BpBs=;
        b=ZuxVLHTqrg2U5aLbWqJvlRrdxvuS8BKrXS+Qg33KCZMK+o2UU/pjlr+84dL68PP4Ra
         L1yZX6xoG19zVmMFcREmLWIbHEXtqAz704GntK4gSnWD+rbm+I0T1eGZz9gd68PRG8RP
         UxyUb6FV0G3eZWOvrcSY7/uddEONCFsKBVSxzIZhHaHT679AuKAOFXifu7GPXBt6N2RN
         mPnUVkWnbGDsANf3aj1ljSjHqFPskvK+DalcCiUhTK6lMAN7WGrujUYieZ0IKvZ+72Gl
         0y5YSs9iDV19pacOyH+xJqu+7paMj2DcwHH/TNwOrIisuH4RppQDGj0rIvkECSPEX/yO
         miXg==
X-Gm-Message-State: AOAM5318bsc2btUaNwrs+/E6N9VBpBHPO/CMs0T8VHbsy2eCttvNlA8Y
	+4+zBWH8/mmnuoJ7T08+d++8vT70vcDhD+tgO0B2VQ==
X-Google-Smtp-Source: ABdhPJxEX+n+D2eQlJRrREPiJ7wffLrZ03BnYNKye/ZjKAndcysFBqZMj1aZaz1ZTaqJGUM4F6BF+1mZFxobl19IeCI=
X-Received: by 2002:a05:6402:2707:: with SMTP id y7mr22007921edd.294.1643652426755;
 Mon, 31 Jan 2022 10:07:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YfgivbCgwKjJu9ec@fedora> <Yfgjhq6LIzhKNaTU@casper.infradead.org>
In-Reply-To: <Yfgjhq6LIzhKNaTU@casper.infradead.org>
From: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date: Mon, 31 Jan 2022 15:06:55 -0300
Message-ID: <CAH7FV3kL=6-aKjrYNS7LkbN3Z2MzKufCCrWP5xHSicytAGTPkQ@mail.gmail.com>
Subject: Re: [PATCH v2] seq_file: fix NULL pointer arithmetic warning
To: Matthew Wilcox <willy@infradead.org>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, viro@zeniv.linux.org.uk, 
	nathan@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 31 de jan. de 2022 =C3=A0s 14:59, Matthew Wilcox
<willy@infradead.org> escreveu:
>
> On Mon, Jan 31, 2022 at 02:56:13PM -0300, Ma=C3=ADra Canal wrote:
> > +EXPORT_SYMBOL(single_start);
>
> kernfs is a 'bool', which means it can't be a module, so there's
> no need to EXPORT this symbol.

Thank you for the feedback! Still learning...
