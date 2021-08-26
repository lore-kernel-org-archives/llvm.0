Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13A3FC2
	for <llvm@lists.linux.dev>; Thu, 26 Aug 2021 19:53:54 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q21so7200783ljj.6
        for <llvm@lists.linux.dev>; Thu, 26 Aug 2021 12:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K5GLqlGQxMU4ggVzRoxzJDIkcNSQNXTpS8EPAZVdN40=;
        b=Ug1SvVJKsbTQhJdnIIXJAjckjT/u9cmd9R/4CJJqZ9n47KjUCN6tFiehaMlSy1MX1Z
         qp9hAWGoWknTEA6Z6sD6jxz5qW/5Vr/wzNRDNP1fJuEnhcuhqPhc3QAB0GeQFA6E/zR/
         eHZBeiSbZxY4mcj6oY98zLxWbDMu96FgTNmFHH1hKR1VHdX+lychRW2zEkQAdURDcvkj
         j3grfNs2zobKO3LJDxokGQRHtTMFLYG9CcpS8Fuw15jzotkaNlVmrHa6MRC/81S51sp1
         UTkh7JAYnTDbvNSn0mq1C7Xtpb7ff8YXF3wZ9wuuTUmOGO/OaJroHzXJFjEvs/ZWTwSZ
         IvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K5GLqlGQxMU4ggVzRoxzJDIkcNSQNXTpS8EPAZVdN40=;
        b=gfiVkZ+vQp/brMxLrtB4WVTRMBL9QaXcz4/oQRBuk+9OuHmEfKInA8IDQeFFc9u4gg
         E+XfTERZbartLFaVls3NybcBajwEEw+ORGRUSEQ9XBW1jj2TpQPOsyHj5MIcTRkNcMc0
         mCztOGkjlB4cJHHiqd4Fudv+8cyfwEgF7dCwIDDzaxRFrnjbAgz31vogt0kbuQC9lgQC
         g8rwNrO5adaABeaYGL43ejjmMGKobhSLqzyzeCkvOsF86L8qf9+M//leQLD5bhFV3Mrp
         FlF9Us9+ZoYQUcEe91bTJgIXTgMA92eqw1EdgZstJyrOzpTrb7MlwcvuLKAZ8771pWUx
         RNXA==
X-Gm-Message-State: AOAM533skWyXsWKxgX5E7CAwDyYvK4U2J+Ydu6fg4i0W2r5gVq04r9zn
	6RW8rn+l16+2fJ2CBQ+TLaZCI0XNSm49SkswsuJu0ytVx05l4w==
X-Google-Smtp-Source: ABdhPJynfYEoH2yuMp2W/+euKS9+U3WEvRXIxgfR4Cs/0yCilQAHqdpXM3JPOoOhIThLF2AGNh+sv7NbNYeRpsVZXng=
X-Received: by 2002:a05:651c:83:: with SMTP id 3mr4557771ljq.341.1630007632601;
 Thu, 26 Aug 2021 12:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEx4G+ok+gcQCk4EWxAy2opjEcNM-4b7=9jSOcueXgtHCA@mail.gmail.com>
In-Reply-To: <CAHRSSEx4G+ok+gcQCk4EWxAy2opjEcNM-4b7=9jSOcueXgtHCA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 26 Aug 2021 12:53:41 -0700
Message-ID: <CAKwvOd=sZzkvvOj7AkYcgTG=Q7FkmWGkbuCA7PGso8vZuS5euQ@mail.gmail.com>
Subject: Fwd: [android-kernel] Register for Linux Plumbers Conference
To: clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev
Cc: "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"

As a heads up registration is now open. If you need help covering the
cost, ping me privately and we'll make sure no one gets left behind.

---------- Forwarded message ---------
From: Todd Kjos <tkjos@google.com>
Date: Wed, Aug 18, 2021 at 4:24 PM
Subject: [android-kernel] Register for Linux Plumbers Conference
To:


Even though Linux Plumbers is virtual, you still need to register to
join the live sessions. The registration fee is $50. Register here:
https://linuxplumbersconf.org/event/11/page/112-attend

--



-- 
Thanks,
~Nick Desaulniers
