Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21987E3
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 13:20:34 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id s13so14679796ljd.5
        for <llvm@lists.linux.dev>; Sat, 09 Apr 2022 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2IYDe10dmsGy8DJcaB3vGWy7J8LhPKTO6Cy2zoRK/ho=;
        b=mt++UCES/exeXjRVb7JPbS3ZpWcOYQXe3eKjgYEAFS5DUVNUDSulsQ5FgaDVplCXiC
         KZcGfJH8V52LSkVPb7LCbOF+vWcVODy6iXS4T1iRTkcVs8DvdHD2pDqDBBweVW9W3MZ/
         cdJYn+WovG1sDY+XNVYyhIAuXjzpP+9bc4k5fggvVY20NxVdZiQ2/9iolFmCx7rZiMtH
         b5MNtWORQFQuM/yFkRa6cgthe7iCHumWCc6XUDX5wG9D4pAW6K6W20NH2NnIkfLIN3sW
         2b4GZgPyjT+lZKGB4giCgOnBv5rBp4QHkSaf4y0AAP0lHffRiFg/ofy1R5BBq5Ys7cC0
         wNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2IYDe10dmsGy8DJcaB3vGWy7J8LhPKTO6Cy2zoRK/ho=;
        b=evNa8oBx9ffHLp/NSZoxHBKw2aPl07M5s6R90GfklV3Ix1OT58FPn8UDib1JMiJZ/p
         mHGU51IwSXYAMSR48pc7w8j56xxeI7f609E5lD/4eHTiAVfVYKV2oEQZPK6Ls0n2/cIG
         2R2gOY/OL8r6nejZ7nBg06KLw1YmPtGbwEpjRK9icJwzKxIBZesEXvXT9KZUGtP42xmd
         f7unneY09qMr15jTVcOwHGb38Q+ZLR49Pp1EmxNHl03CpmEdh2oArEa1AEZuilFbmTNO
         5c5Q2w6WX0Y/2yWj7KAs/29mxDQn/3BQsjw8CdHcNvIlDhKG6BFvp6C6Ow3cmw3HU0xh
         w1NQ==
X-Gm-Message-State: AOAM533xP9dYKFtmP4wcQpAR6jZGJPBeqkyjledb2V7HVG9UFtoJsLbl
	c/QiuwX2nCkm44O5cA/T/LY=
X-Google-Smtp-Source: ABdhPJyJy8HuDMh8C0fCMF8KqYpun+F3VqSjI45xB1lID679uOi5hdADtkguk2UcWKQritzJA7ggGA==
X-Received: by 2002:a2e:81da:0:b0:24b:4e65:e3e0 with SMTP id s26-20020a2e81da000000b0024b4e65e3e0mr4934755ljg.483.1649510432658;
        Sat, 09 Apr 2022 06:20:32 -0700 (PDT)
Received: from [192.168.31.104] (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id s11-20020a2e9c0b000000b0024ace83744asm2527195lji.116.2022.04.09.06.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 06:20:32 -0700 (PDT)
Message-ID: <446a3e88-4c14-300d-862a-1279274c3760@gmail.com>
Date: Sat, 9 Apr 2022 15:20:29 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] block: Remove redundant assignments
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "Richard Russon (FlatCap)" <ldm@flatcap.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, llvm@lists.linux.dev
References: <20220409101933.207157-1-michalorzel.eng@gmail.com>
 <20220409101933.207157-2-michalorzel.eng@gmail.com>
 <a56d1184-d399-d5f8-765f-5a4f35dacd5e@redhat.com>
From: Michal Orzel <michalorzel.eng@gmail.com>
In-Reply-To: <a56d1184-d399-d5f8-765f-5a4f35dacd5e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tom,

> 
> On 4/9/22 3:19 AM, Michal Orzel wrote:
>> Get rid of redundant assignments which end up in values not being
>> read either because they are overwritten or the function ends.
> 
> This log is the same as your last patch.
> 
> Instead of a general statement on deadstores, a more specific
> 
> analysis of the setting being removed would be helpful.
> 
> This will mean splitting the patch to match the analysis.
> 
> Tom
> 

I think that this explanation in a commit is enough for such a trivial patch.
It informs that we are fixing clang-tidy findings related to deadstores
in a block subsystem. What analysis would you want to see?
Something like "Remove deadstore assignment ret = -EINVAL  in a function bio_map_user_iov" ?
I think that it will create too much of not needed overhead.

Cheers,
Michal
