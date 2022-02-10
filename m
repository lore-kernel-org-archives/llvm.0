Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA72F28
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 02:44:45 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id p5so11330617ybd.13
        for <llvm@lists.linux.dev>; Wed, 09 Feb 2022 18:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yae8xh6+/RqAjaPxfOanlLu1lpjK4lOMpxS+ykxZ6Ck=;
        b=PkZFlJba0ASmUM09LH0Aj6AVWyyqxqQFoEAO7Q2GzWCXVd+iWGwZmQbY9EZr4ovvYE
         hNjB3CoZahIBB+jznu8m24SjeXDCLHE5VmBPTK6Mj/DdTya4KVYwfndgQf7qvEcuYxMj
         zOGE6SzY/rScVftDHv/U1Ww9nD4W2EK5TNHpW8/o+9syMV4AK7yrgCgmBMFo1LpdPn1D
         qIuVk5HMeMg17jqAJ91r7zAF61IYaYCmCwQp1mjyCOuuybzwaW6jKC0YuzvhFqNHrCdS
         3F363h003Bp7r2hI9TCQSfnhTq2T03ioUoPqFZtbFH42OR0mY+I6mNPrFTS4Q7O7KrwU
         +6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yae8xh6+/RqAjaPxfOanlLu1lpjK4lOMpxS+ykxZ6Ck=;
        b=OMMTW5auVR9Bd0PEmNhXHo6CWP4HdsJZ6TBxlxIPSfjem4F+c1xQ6UqlGrrByBXyLg
         XSmlAol+00qy7npqWtUzTNohWQ8MRQEyo1/6OBY+4gwxn8REZPUB32IT/GhRrv3ibHd0
         8ejhcJPAHMDshw7OfGgJCviGTGC49mf+hd+snlXTd23Yhq3OyQAnR/ukqCsAl7L7Xir9
         nEHk+dLEe5aA7pa4OpcZ9uiR11KcrcExvqd4807BCHPy2QyblbvFxGfETIGJsieg8AxH
         3FbaR6Qc4+VaYEMVmTYTiIFRi1ZewBJzGwHQpNEywc8NOMARYPu8gE39qcuJbxKw+6vi
         L/+Q==
X-Gm-Message-State: AOAM530IcUoerxkCX6TCB32Z/Ed1qpZ5g4j0ZAZWqxBSckPsNhafocmO
	dHLmtLjkV282S53PaRznFtdWyik87Cigz3OW+Xo=
X-Google-Smtp-Source: ABdhPJxJo9spdHYdv+eWs5mpin2D3XWhlrqvPJszbnGJ90dCoz+MsjNLGtdXa9zo3Qe6xNc5xeHQNVZlcm3halUMO2s=
X-Received: by 2002:a05:6902:114b:: with SMTP id p11mr5153810ybu.2.1644461084954;
 Wed, 09 Feb 2022 18:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209163029.2299009-1-trix@redhat.com> <YgPs8U85ZFbDWYlx@sirena.org.uk>
 <61a545d5-224d-86fb-2fe3-406c3ffd78fb@redhat.com> <YgP0JOilWpKU4704@sirena.org.uk>
 <CAGcXWkyCQ4JExvHv3cEL7vLMOcq_iPu0vOyOmnfzbQmMxHEp=Q@mail.gmail.com> <27a1822d798641f5bba33d7529ec02c0@sphcmbx02.sunplus.com.tw>
In-Reply-To: <27a1822d798641f5bba33d7529ec02c0@sphcmbx02.sunplus.com.tw>
From: =?UTF-8?B?6YOt5Yqb6LGq?= <lhjeff911@gmail.com>
Date: Thu, 10 Feb 2022 10:45:46 +0800
Message-ID: <CAGcXWkyF8FdRNP7=pcLQw339QpVX82op+zEMS7KrXXZJ8SLMQw@mail.gmail.com>
Subject: Re: [PATCH] spi: initialize ret variable
To: =?UTF-8?B?TGggS3VvIOmDreWKm+ixqg==?= <lh.Kuo@sunplus.com>
Cc: Tom Rix <trix@redhat.com>, "nathan@kernel.org" <nathan@kernel.org>, 
	"ndesaulniers@google.com" <ndesaulniers@google.com>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

>Yes, that's what I'm asking.



>The original setting was ret=0; I just wanted to remove it when defining

>the ret, but it looks like it's required.

>Yes, it should return error at default



>I will submit new patch for this.




> The old behavior returned 0 and I am treating this as a regression.

The goal here isn't just to shut up warnings, it's to fix any problems
that they identify.  Unconditionally initialising return values is a
common way of fixing warnings while leaving real problems in place.


The original setting was ret=0; I just wanted to remove it when defining

the ret, but it looks like it's required.

Yes, it should return error at default



I will submit new patch for this.
