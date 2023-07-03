Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5C7F9
	for <llvm@lists.linux.dev>; Mon,  3 Jul 2023 05:41:05 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666fb8b1bc8so3390342b3a.1
        for <llvm@lists.linux.dev>; Sun, 02 Jul 2023 22:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688362864; x=1690954864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5YO6Ck0avaxlgoQTzwmS6APCgybwM/8bSmxK2BRsU8=;
        b=hbyHmCwQyB89pon+WWxjj/vT+r/R3zUpG/L7IhF+lUSaC1UG9rTVqCJ4incBlo/z6/
         422GpQ4BS0HYv30T5khhnGR8vIQIlpCbobRwvU2CWHsv2VTUe6MzlVcfCMCBH1UfsxWu
         sbuVlffG8yucQksQHcjuSDgVqdwj/IhHv4F40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688362864; x=1690954864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5YO6Ck0avaxlgoQTzwmS6APCgybwM/8bSmxK2BRsU8=;
        b=Ph4mG73bi1TjBPq6TXo6G1ZHPDUVYm5sNs95vf7HcYJASQPE9gKuwz4i0td/MPJPTz
         I7sEuE1rhfR96kyFrUi/q9QYEUPMIG5lL63AZlq9NqvEZfZPNRJw0J9zL3RbVgu8x7j6
         /8De7kyMyk9C78mQb78xPMTipkzIzc+rnP7wD5hK5YVn9feFkJA/Ge1UZRAjsvABe17N
         bgKaC69Tc7Hn9iHZ0S9+VZyhLog8fcIYRWe+CdtbwhbewiWSPgCPted7sCnQHpzsm3B/
         86/V+4syYhyP0zsQmtXr+vZnv5S24RqulneohPyFuTW67ilqvSADsWAf6Nrn19MfMmqH
         GtLA==
X-Gm-Message-State: ABy/qLZZZZz7gUw9i6Ai7Cr6R6Ik61Uh2n0epFpEIkvNz33YaU6sckFI
	5JxIWLvWTpDNfL8AXuy285yTEQ==
X-Google-Smtp-Source: APBJJlGsAfma8O5fhZ3rSb77hZAwgd6bujawZfFtLy1rOCe8BrJOqcJXw8ve3ZDAglKI5V1NURktQw==
X-Received: by 2002:a05:6a00:1352:b0:668:83b6:bfe8 with SMTP id k18-20020a056a00135200b0066883b6bfe8mr12601574pfu.9.1688362864652;
        Sun, 02 Jul 2023 22:41:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78691000000b0066a4e561beesm2983232pfo.173.2023.07.02.22.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 22:41:03 -0700 (PDT)
Date: Sun, 2 Jul 2023 22:41:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux LLVM <llvm@lists.linux.dev>, linux-kbuild@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Message-ID: <202307022230.6121D6896@keescook>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me>
 <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
 <4fa56264-f188-46f9-cc77-117b469b3328@roeck-us.net>
 <2b1a4f49-ba18-0246-af09-4e4133814411@alu.unizg.hr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b1a4f49-ba18-0246-af09-4e4133814411@alu.unizg.hr>

On Mon, Jul 03, 2023 at 07:18:57AM +0200, Mirsad Goran Todorovac wrote:
> I apologise for confusion. In fact, I have cloned the Torvalds tree after
> 6.4.1 was released, but I actually cloned the Torvalds tree, not the 6.4.1
> from the stable branch as the Subject line might have misled.

Thanks, no worries! I got myself confused too. :)

The config you sent looks like I'd expect now too. Questions for you, if
you have time to diagnose further:

- Are you able to catch the very beginning of the crash, where the Oops
  starts?

- Does pstore work for you to catch the crash?

- Can you try booting with this patch applied?
  https://lore.kernel.org/lkml/20230629190900.never.787-kees@kernel.org/

I'll try to see if I can figure out anything more from the images you
posted.

-Kees

-- 
Kees Cook
