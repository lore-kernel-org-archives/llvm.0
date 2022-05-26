Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C510E9
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 09:00:57 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id y13so1829645eje.2
        for <llvm@lists.linux.dev>; Thu, 26 May 2022 02:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sjBm94r+SZCpqMEtFTlHZhDX0lygeSCfuwzmdT2Wqlk=;
        b=wm9PX8MZU/5of2t0gDHyZsbae+9V0cMwaT8bbF5ykjunJDZg5puAFZAcxTz25sTCYK
         AJsSx3vdwtrKH2ut9/a0FA338lspzVORoXgkvCu+lpkmQx+UP9cXPeatat03z8MC/ceM
         DbWOiyzgFcYvzkZMw7MvN1rV8rXjyDjl8mmE+uWs4UZuqsTdXV/DPU/k95Q25y8Czb6a
         dHq5LySC29HffEKZS54iXrQqM0gc0s9K+eeAQGFQ7t+bfLpvU63ZVO3sRJmf4c2g0yFm
         W4RdeYEC7aikkyEFwpKT/5VqtlI9u6P7A49EUx814rtwN/M/79wWWqLu1i8GO+6J7Wkn
         zYAA==
X-Gm-Message-State: AOAM532och4q4dCyQY+xGQbSOBmSS1xnH7GS+uZCbOCne20tKLX7U+in
	n6n0mRJ6d4004CV/OJSJ6SM=
X-Google-Smtp-Source: ABdhPJxqjGaQdiFgCf1SGM3twv9W4CPY5SZ9hMzvvBpbF/H5q4uJ7jgeabbmL+dxHb8NZ/SKb9eVbQ==
X-Received: by 2002:a17:906:49c6:b0:6fe:95bb:93cc with SMTP id w6-20020a17090649c600b006fe95bb93ccmr32272454ejv.30.1653555656059;
        Thu, 26 May 2022 02:00:56 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id a24-20020a056402237800b0042ae4dea360sm511221eda.63.2022.05.26.02.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 02:00:55 -0700 (PDT)
Message-ID: <ef79f546-0d10-f603-ccbe-789ed021943c@kernel.org>
Date: Thu, 26 May 2022 11:00:54 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Revert "linux/types.h: remove unnecessary __bitwise__"
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, llvm@lists.linux.dev,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220525144638.293934-1-helgaas@kernel.org>
 <CAHk-=whk=ygWsxt=1HhndCwjtXdga9sPmkxFGby5PJWRk5yx9Q@mail.gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CAHk-=whk=ygWsxt=1HhndCwjtXdga9sPmkxFGby5PJWRk5yx9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25. 05. 22, 18:02, Linus Torvalds wrote:
> On Wed, May 25, 2022 at 7:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>>
>> This reverts commit c724c866bb70cb8c607081a26823a1f0ebde4387.
>>
>> Jiri Slaby reported that c724c866bb70 ("linux/types.h: remove unnecessary
>> __bitwise__") broke userspace, including open-iscsi, because it uses
>> __bitwise__.
>>
>> Restore the __bitwise__ definition.
> 
> Hmm.
> 
> Presumably it's only the uapi case that actually wants to re-instate it.
> 
> And I'd rather make that "__bitwise__" case explicitly special, with a
> comment about why it exists when the kernel itself doesn't use it.
> 
> IOW, rather than the revert, maybe something like the below
> (whitespace-damaged) instead?
> 
> Jiri, does something like this work for you?

Yes, thanks.

> ---
>   include/uapi/linux/types.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
> index c4dc597f3dcf..308433be33c2 100644
> --- a/include/uapi/linux/types.h
> +++ b/include/uapi/linux/types.h
> @@ -26,6 +26,9 @@
>   #define __bitwise
>   #endif
> 
> +/* The kernel doesn't use this legacy form, but user space does */
> +#define __bitwise__ __bitwise
> +
>   typedef __u16 __bitwise __le16;
>   typedef __u16 __bitwise __be16;
>   typedef __u32 __bitwise __le32;


-- 
js
suse labs
