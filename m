Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE011A31
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 07:22:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o30so518175wms.2
        for <llvm@lists.linux.dev>; Thu, 03 Nov 2022 00:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUgKQvDo/cr0JssVgCdSKS0tCR2RGSnXUbgVX1YNA8g=;
        b=j2vdAu4dy+kbafyGeQcbaIkBR5JqbBIS96JDz8vk4iHzN6q+Y/jLPyGfJAjIuJChxy
         hBk/nWpETmjzjgrDZ/YMiMR36hXA3tJj1RLYYq6noQRG2Qh33L8ixwLGw2qBiQW+hP2N
         UqZ/xgtqeP6W+jgsoaTSVoc4jnup7VxTYWtmV1pOCV8XmO+6SavE/a1DXwA7TREkZF/d
         nhn2zqp5SJOtSXqRffCNaSkwHAghNeU54vTWEaAteKiLKBnZGRRVR+F1DDohdBiXo8HT
         lPsTKKQUY7OxWYmrZdp9aEHeSdNwGt1yPE0OTEPTOkUSRumfP4ua4wUFMfdLXvUADUFP
         lDhg==
X-Gm-Message-State: ACrzQf1hSldq7WrM+EWHUPYnTrsHLmpt20mdVUxYtkaws2agV+qMGNeu
	9+FFT/0NFZwHRy179WtVxpI=
X-Google-Smtp-Source: AMsMyM5KpoixiXYk+OO4iEz6xP0PiqodhVQ/BEXsefqM+9sHYmcUZ6YyMlmBlFylFm3cR15HEYrGZQ==
X-Received: by 2002:a05:600c:33a5:b0:3cf:6fd1:d94b with SMTP id o37-20020a05600c33a500b003cf6fd1d94bmr14454272wmp.52.1667460166921;
        Thu, 03 Nov 2022 00:22:46 -0700 (PDT)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d4e0e000000b0022cc6b8df5esm73466wrt.7.2022.11.03.00.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:22:46 -0700 (PDT)
Message-ID: <9fe8615c-fe31-ebf7-09bd-453fae189666@kernel.org>
Date: Thu, 3 Nov 2022 08:22:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH] kbuild: pass objects instead of archives to linker
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Michael Matz <matz@suse.de>,
 Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>,
 Fangrui Song <maskray@google.com>, Michal Marek <michal.lkml@markovi.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20221102091308.11568-1-masahiroy@kernel.org>
 <CAMj1kXGzFEnUGkoD_JV6=mrKQ+eXLo=SYU8823mPezHZfY_FRQ@mail.gmail.com>
 <CAK7LNASjBm=WWpkSaL1+QuLokhnepUucvhYyP3CCeZYx6nOTHA@mail.gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CAK7LNASjBm=WWpkSaL1+QuLokhnepUucvhYyP3CCeZYx6nOTHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02. 11. 22, 10:44, Masahiro Yamada wrote:
> Jiri Slaby reported that the (not-upstreamed) GCC-LTO tree got broken
> due to 321648455061 ("kbuild: use obj-y instead extra-y for objects
> placed at the head")
> 
> https://lore.kernel.org/linux-kbuild/ea468b86-abb7-bb2b-1e0a-4c8959d23f1c@kernel.org/
> 
> 
> I am not pretty sure because I did not check the downstream code.
> 
> 
> If I understood his report correctly, the reason for the breakage is
> because I put all objects into the thin archive, expecting
> the linker would preserve the object order in the archive.
> 
> By specifying the object order directly in the command line,
> GCC-LTO should get back working again.

...

> I think my patch is unneeded (hence RFC), but I just wanted to know
> if linkers (gnu ld and lld) see any difference.

Yes, including your patch (instead of vmlinux.S and /compressed/* 
changes) also fixes the issue. So the linker (gcc-ld) indeed respects 
command line, but not order of objects in .a.

thanks,
-- 
js
suse labs

