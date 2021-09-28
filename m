Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F007D3FCC
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 09:56:15 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id z24so91150710lfu.13
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 02:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sU/LhEZ8q3BeQ6P/PiHIYla/ZdlSW3YiCmnYV8PIXuI=;
        b=VZb+3cpQfdzvddM3ZSwyo95tO1IwqURM2VUyschymPHl9RVL+g8ruFk5g23boV7dhD
         nI0uXn9W2EmbAY9wgbbOZoGKTUdapoQYzHW5BdSyxvA7ygd+xNKNK5TilO2yE8708XAo
         7IWDjKg5fWb3I6i4p631kDaURnh4cIsZuiaHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sU/LhEZ8q3BeQ6P/PiHIYla/ZdlSW3YiCmnYV8PIXuI=;
        b=mSLpkwcMqlQXbwK9kZ8Lp9BAngtShWSnAc3tszAscf06ItVadW/gExumh5Ih5rRf4g
         qcHvY3SEfRz9h082Z+IWU996aUQTmZmqDtcky56K8nLx7CmwJ3v7F2MlQJwkj5z79dfJ
         xCUgKFkEai1pU5fGxURm1EeL9YOxCHJA2ur6ZQLApAy69Ro5oLXgZLnGJIYJ3Q3aCnvN
         3TrJH8kH1VVrl+grw9KdS9UFUcomqfpbj2gTivAOn6AoDbZMviV1d2Q+U5Wd608H1YWJ
         Sf0FV9D8T5UM5D1OGe/dn2UQkyyzU6jZ4o/Nk0JFHf0NRtDgGGuXXcdNup7g6kV1rVGr
         /Nig==
X-Gm-Message-State: AOAM5306fad2hzqRys//LAD05vtLKk6aw2yWV0RSpM64tAoYzOuwW5E5
	5tHLNh/jZXDA+SygQxkEdBOxQb/ktICuWUQi
X-Google-Smtp-Source: ABdhPJxjuKx366aHmjXKCPqMcpTQrMD3DfYUL7mY6FrOib4BAVfQ6jz5zRT6TMz0E0yCtzNZ314LdA==
X-Received: by 2002:a2e:974b:: with SMTP id f11mr4842574ljj.385.1632822973596;
        Tue, 28 Sep 2021 02:56:13 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id y20sm2304960ljn.88.2021.09.28.02.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 02:56:13 -0700 (PDT)
Subject: Re: [PATCH] vboxsf: fix old signature detection
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 linux-sparse@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20210927094123.576521-1-arnd@kernel.org>
 <40217483-1b8d-28ec-bbfc-8f979773b166@redhat.com>
 <20210927130253.GH2083@kadam>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <78f6d6cc-2be5-c69b-bd17-7da135448438@rasmusvillemoes.dk>
Date: Tue, 28 Sep 2021 11:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210927130253.GH2083@kadam>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27/09/2021 15.02, Dan Carpenter wrote:
> GCC handles it the same way as Clang.  '\377' is -1 but in Sparse it's
> 255.  I've added the Sparse mailing list to the CC.

FTR, while examples are not normative, this:

EXAMPLE 2 Consider implementations that use two's complement
representation for integers and eight bits for objects that have type
char. In an implementation in which type char has the same range of
values as signed char, the integer character constant '\xFF' has the
value -1; if type char has the same range of values as unsigned char,
the character constant '\xFF' has the value +255.

doesn't leave any ambiguity or (implementation|un)-definednes, and
sparse interpreting '\377' as 255 independent of its
target->unsigned_char is a plain bug in sparse.

Rasmus
