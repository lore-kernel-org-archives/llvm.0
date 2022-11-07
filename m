Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0272D23AA
	for <llvm@lists.linux.dev>; Mon,  7 Nov 2022 06:12:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id y14so27291811ejd.9
        for <llvm@lists.linux.dev>; Sun, 06 Nov 2022 22:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPuU0hi8uE8q7bgFrAs5k/BnugkiDikdtVxUAcn1Rec=;
        b=PPAVj3y5VZuxqiOkV/w3OYYTQNlcngt5SlS0lCBEJhWr5XPlrTjWOOoAvGu87Lg+Z4
         Zz+1JsA2KygFZyNlTmkwIcYvk/0AJ8AiWZozRClbIHcYV2Xc6kkGyx+81jk8M4fE4ohZ
         MKV3FwUbGpFcldY3RnJqJmnjj7U1eCwbAUAXDQ1lEueUJ+dIvFINjljJCaI6pO/sTQnd
         NPbqqgiPzGOuyKcsTa6vtpd3B835RqzUhbq44SCJcVEYd0KbWn0PhGM59QPCnDwHI14j
         gtn8xI8LHLHyX6CgRsNDyxw2RLaoQFuD3lFt1ce4Ef4J810mvzOyf1tB6PFnXlOufKpT
         JhVw==
X-Gm-Message-State: ANoB5pkYiFFMNuARIaM5+Fe0NTSFFy+5uVOujREL/gw4WQO1jLAoPUN0
	0dLJw87JNbSogGHaNqq2cY4=
X-Google-Smtp-Source: AA0mqf4HIkH6+Ky8ihONOy9Q4MDe/SmrvynSJdaUXpiXx/xwU7NwiWqqece33B4bhf7VlgJDk3aQVw==
X-Received: by 2002:a17:906:4996:b0:7ae:6cb9:6c5c with SMTP id p22-20020a170906499600b007ae6cb96c5cmr1883918eju.695.1667801526085;
        Sun, 06 Nov 2022 22:12:06 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906310500b007add28659b0sm2941437ejx.140.2022.11.06.22.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 22:12:05 -0800 (PST)
Message-ID: <34906659-94df-9de5-dcf7-0e787b7caf17@kernel.org>
Date: Mon, 7 Nov 2022 07:12:04 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH] kbuild: pass objects instead of archives to linker
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
 Michael Matz <matz@suse.de>, Kees Cook <keescook@chromium.org>,
 Sami Tolvanen <samitolvanen@google.com>, Fangrui Song <maskray@google.com>,
 Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20221102091308.11568-1-masahiroy@kernel.org>
 <CAMj1kXGzFEnUGkoD_JV6=mrKQ+eXLo=SYU8823mPezHZfY_FRQ@mail.gmail.com>
 <CAK7LNASjBm=WWpkSaL1+QuLokhnepUucvhYyP3CCeZYx6nOTHA@mail.gmail.com>
 <9fe8615c-fe31-ebf7-09bd-453fae189666@kernel.org>
 <CAK7LNATBuERrR4QvLzDNOw1TVmMP+2J=sJviihBdy8gF=CfA=w@mail.gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CAK7LNATBuERrR4QvLzDNOw1TVmMP+2J=sJviihBdy8gF=CfA=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03. 11. 22, 15:47, Masahiro Yamada wrote:
> Can I see your LTO implementation somewhere in public?

Sure:
https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?h=lto

FWIW, I plan to send a v1 for comments soon as I finished the patch 
order, CCs and commit logs finally.

thanks,
-- 
js
suse labs

