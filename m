Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16917D7
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 11:57:29 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id s23so8435202iog.13
        for <llvm@lists.linux.dev>; Fri, 20 May 2022 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xSDHFbgdsSPbf0MQcrePk45f2WGTqnruAEuBaXBpzKA=;
        b=B2W0j5tIxiAxooxUdifLAH3iuLu/2+GTfJhhWSoj+xtGW+KT9lF3br3LVTsKGfOCCR
         4fHcH/10CIn9T1xSM9QY/XZFZGXTDrzWnMG0DCMzK8xO1wSiicnqMlY01wsU6k9Fok2J
         9nQtNdnh+p2VBSmRLTl61vWsRIAuk0WqP4Idx01vGXIZRLITduJGc3gYuOV6FFZROXGG
         WGl6HU+Emv5W9epNdu/2KBQpMsmmQtAGv22bQg5es1Sym9rzC74DqZbyVnYJPpV1piJP
         /qt4gMice+2SXrPZ9TtMt6mQbLVRln1jxn6YIV/KpWP/OOTjvhEWE7/Pcy0nXieBdCKo
         7jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xSDHFbgdsSPbf0MQcrePk45f2WGTqnruAEuBaXBpzKA=;
        b=m1fQ2LvLdaU6Fg6mv2Jm6876qZTo2BCPeG9SXusiinWFg610aXXjIyTNV2E6sxSZTw
         gikL72QZu0l6NYYW2cYkQ+7lF74cNaIEc+JFVooLe1Vk5Vu/vGavtazTQptG9v4EiGTb
         MRzT/HXrqhmJsZcpltQ1E/NXVha/RutHuUN9wMA2uTmw4hhvBJQXuiyVgOZkPgOH7TGK
         bIL1cUwRLEUDH5ptXv0yLj3fqpMWshXj8PxOGvVqPcAVc5+GeDwcztSuIeDJSKekxwip
         fqZzl5okEq6xYilKtuYHdjokJBGv/oAPmdLIDyWAZaCGtsmTenwsBzYeTX/8HY8e94Nn
         Pi9Q==
X-Gm-Message-State: AOAM533Xzs/GHgsLEeHSAaSsQSJD1qjz06dyDpZmPRKVernG1no/akim
	04OIO8PJL3eGzYkkfBgY3FCr9AtzpwBIJErukGE=
X-Google-Smtp-Source: ABdhPJzlM3XOaQTokHXRBQYrE3tYxTLdfXrA1F77E84cCyB66NzP84IycHtapU+ti/oH6PPe2Ic3sqht7R64Tgj/H9Q=
X-Received: by 2002:a05:6638:16cf:b0:32b:6ee7:8d7d with SMTP id
 g15-20020a05663816cf00b0032b6ee78d7dmr5118144jat.256.1653047848596; Fri, 20
 May 2022 04:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net> <20220506160106.522341-2-mic@digikod.net>
In-Reply-To: <20220506160106.522341-2-mic@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 May 2022 13:57:17 +0200
Message-ID: <CANiq72=7=ZpAObWRmposOmnyZ8XR_eNHCBtA3bu3fusmcPUwDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clang-format: Update and extend the for_each list
 with tools/
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Brian Norris <briannorris@chromium.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2022 at 6:00 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> w=
rote:
>
> +  - '__ata_qc_for_each'
> -  - '__ata_qc_for_each'

This change is likely there due to a locale difference between our
setups -- I will fix this by forcing the POSIX locale and then I will
adjust your commit.

Cheers,
Miguel
