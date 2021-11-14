Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674592C82
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 12:24:29 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id j28so13680263ila.1
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2foVtlY4JMb7p5UYllUA0RG/zDd/VJZrDKdnkPrk5Wc=;
        b=Gtsz4+x7b5vxEUGE/t0u7IVbMzDpsWdR6dB8QvWsQemvYmA3KQ1McISUBSrRkLRk7T
         B/aAlXG3edT+/edJs5dERRv7xZKWr1CRUfFFlU6b0CqJET6YhHq66otZjKhFxjeABf1g
         rwuzTcB+b5KD4GTDNzY1f/H1KPx1CFdpcnFix3GcJ0nr7eOBognGDsB6le2iaKVqe4Yr
         3D8ujpfJbaFwoRJcjwo3uoWyhWFi69upDFQYYnRVrUCqyOc9nKkJbz2NU7gcHbn22zFp
         APO/6q+ffZ2xjkndd3UtAqNFoXR6B3heGf3uLW1rYbaE+l/8wEx/8b1WjgDSU5ArbU0Q
         PkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2foVtlY4JMb7p5UYllUA0RG/zDd/VJZrDKdnkPrk5Wc=;
        b=UxFwcCx556AbHHaVnGNULeRVj/TpmDovrSW9JsFVZ0/F7XMqpL/BJV9KyFOIJLIf9i
         1ffBmkZkJAjo8aCOc/iifFqEG0SPMcvO234AQwjwzfXzfM69ng6WgBCaHPMR4lFQvbsc
         QuZGh16F9lB4BxYsh47V+DTQOnpQJrBGzsKDu+l+YGLU/ZkzO4renodNL4ZZqv1FeBRC
         XTO/mPDnPgRCc7WIfPG6FE4r5SbKSbjpRdz6KUEwX864kwJtk0vLr2EN3Paivu5u9VzB
         dN7XdMza7C2gMsIxKHfaDokpJ+2P0hAEFyXXkVkSgX6o8GNQjBX2fQLnLMw0QfQxqCka
         IPsg==
X-Gm-Message-State: AOAM531bWy1odik9L6Cxo04KKdWhfw2fh5hmIaJm4SCg1+PQlivtpnzQ
	/efmOoWltRWTLwPRH7XCHeobnG0tX5RZF34Z4ms=
X-Google-Smtp-Source: ABdhPJxVC2QL7rRsbIxkuMcmg3RzBPIEUAmu7IlaXfQyEceWkV3jeMKwIedMqVOgC2LFq3piYAeoxkzSxeNt5KUtNPM=
X-Received: by 2002:a05:6e02:19cb:: with SMTP id r11mr17777732ill.151.1636892667793;
 Sun, 14 Nov 2021 04:24:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202111141650.o5b2LSZU-lkp@intel.com> <0b7463e699956abb0f8b0da7a9254500@kernel.org>
 <CAMj1kXE5T4pWVBUPiZRqw1S122DHVQkZn9GwNHx2cr4=MfndeQ@mail.gmail.com>
In-Reply-To: <CAMj1kXE5T4pWVBUPiZRqw1S122DHVQkZn9GwNHx2cr4=MfndeQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 14 Nov 2021 13:24:16 +0100
Message-ID: <CANiq72nhQuRPgVMqDkr9OZqSLpT_2VVwkBaY97PbuqhbuNJnJg@mail.gmail.com>
Subject: Re: [arm-platforms:hack/m1-pmu 8/8] drivers/perf/apple_m1_cpu_pmu.c:100:32:
 warning: initializer overrides prior initialization of this subobject
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 14, 2021 at 12:07 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> +KBUILD_CFLAGS += $(call cc-option, -Wno-initializer-overrides)

I don't think we would need `cc-option`.

Cheers,
Miguel
