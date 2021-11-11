Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A426D2C81
	for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 15:46:06 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 188so5491096pgb.7
        for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 07:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=BHccbKUYFihxrvL4LkODdfxX5LJ5XuM0tHtYW03wVts=;
        b=mzYW1NQQpxn7t+qrDxy1Zhk/2kyidt8NLxAeTcZw3x5YwXgtyasREch7tTXCAwgIln
         eNJdt58BaovTp2e5BZEJdAQv8GYnNs3p6f/fdLbM4qAQEBlfzap0VBQ2Xz+Q/dTAdH94
         uY7ID1d5VougpBnnpgR33obR+1DPiWjo2aF85aqaVHpbJAvlrPo/8RrqfjznsNbTj4hd
         aXEmgSKtDUKwKBwyilJTYqTodtuJYbvKTgh+1fL3xDKEl0/1MGOtWXG2f//DrO4QCs8K
         9h8d4ywu1vXrFrEzgguHRPZi9vcRyu5o3AMcjxAXAFO0wvvu+QvE2lpGjk9C8GIoR8/O
         VUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=BHccbKUYFihxrvL4LkODdfxX5LJ5XuM0tHtYW03wVts=;
        b=C2Xi8duXod4UuxP9RHY3SFriGvsqQlGEmzsXUAl3Va8t9VT7bMKZfYl2rROVh5WwwT
         +db4PU6RhuL3/xrjwazUg4uL4IAACjVphI0fPWSCmw2DfLs5WJUAbiZKh/e+6RiA/ySE
         PLs9mACO2dxYHxmGreIPQqadeBQm3qZn805mlMoLKZZ7AagvnSMrc/MOmXtA1UrpzzKI
         TRK58AC086PwxbxQPFdEmvDq1ldk9KqXFfL9IkYmiGNFV9ufzX7aPRaZj9vi4JemBhf0
         JoJ7/hg2F2rW6VgSCMmU5+irf7PuA3fNg5Ho6XunkWhKvYgCfIJrUkMoo1gxPkQBOOGN
         N5XQ==
X-Gm-Message-State: AOAM530thEZsayoUX/MUa47TLH2G+6LTJ0WvocWkIc1eJshLKxokxCdH
	fFeKcI+GNjIj4t6bzV58pWWvXQ==
X-Google-Smtp-Source: ABdhPJxvj/ffqLCEnuG9spEMFlTL9xC6GI5bKoFJZ/QBOSSIo4t8lut3c28hhWT9q9gZLR94wBlrsQ==
X-Received: by 2002:a62:1b86:0:b0:47b:d112:96d4 with SMTP id b128-20020a621b86000000b0047bd11296d4mr7606654pfb.52.1636645565990;
        Thu, 11 Nov 2021 07:46:05 -0800 (PST)
Received: from [192.168.254.17] ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id w20sm3978276pfu.146.2021.11.11.07.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 07:46:05 -0800 (PST)
Message-ID: <c410f4a0-cc06-8ef8-3765-d99e29012acb@linaro.org>
Date: Thu, 11 Nov 2021 07:46:04 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Marco Elver <elver@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexander Lobakin <alobakin@pm.me>, Willem de Bruijn <willemb@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Cong Wang <cong.wang@bytedance.com>,
 Kevin Hao <haokexin@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Kees Cook <keescook@chromium.org>, Eric Dumazet <edumazet@google.com>
References: <20211111003519.1050494-1-tadeusz.struk@linaro.org>
 <CANpmjNNcVFmnBV-1Daauqk5ww8YRUVRtVs_SXVAPWG5CrFBVPg@mail.gmail.com>
From: Tadeusz Struk <tadeusz.struk@linaro.org>
Subject: Re: [PATCH] skbuff: suppress clang object-size-mismatch error
In-Reply-To: <CANpmjNNcVFmnBV-1Daauqk5ww8YRUVRtVs_SXVAPWG5CrFBVPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,
On 11/11/21 01:51, Marco Elver wrote:
> On Thu, 11 Nov 2021 at 01:36, Tadeusz Struk<tadeusz.struk@linaro.org>  wrote:
>> Kernel throws a runtime object-size-mismatch error in skbuff queue
>> helpers like in [1]. This happens every time there is a pattern
>> like the below:
>>
>> int skbuf_xmit(struct sk_buff *skb)
>> {
>>          struct sk_buff_head list;
>>
>>          __skb_queue_head_init(&list);
>>          __skb_queue_tail(&list, skb); <-- offending call
>>
>>          return do_xmit(net, &list);
>> }
>>
>> and the kernel is build with clang and -fsanitize=undefined flag set.
>> The reason is that the functions __skb_queue_[tail|head]() access the
>> struct sk_buff_head object via a pointer to struct sk_buff, which is
>> much bigger in size than the sk_buff_head. This could cause undefined
>> behavior and clang is complaining:
>>
>> UBSAN: object-size-mismatch in ./include/linux/skbuff.h:2023:28
>> member access within address ffffc90000cb71c0 with insufficient space
>> for an object of type 'struct sk_buff'
> The config includes CONFIG_UBSAN_OBJECT_SIZE, right? Normally that's
> disabled by default, probably why nobody has noticed these much.

Right, in all the defconfigs CONFIG_UBSAN_OBJECT_SIZE is not set.

> 
>> Suppress the error with __attribute__((no_sanitize("undefined")))
>> in the skb helpers.
> Isn't there a better way, because doing this might also suppress other
> issues wholesale. __no_sanitize_undefined should be the last resort.
> 

The other way to fix it would be to make the struct sk_buff_head
equal in size with struct sk_buff:

  struct sk_buff_head {
-       /* These two members must be first. */
-       struct sk_buff  *next;
-       struct sk_buff  *prev;
+       union {
+               struct {
+                       /* These two members must be first. */
+                       struct sk_buff  *next;
+                       struct sk_buff  *prev;

-       __u32           qlen;
-       spinlock_t      lock;
+                       __u32           qlen;
+                       spinlock_t      lock;
+               };
+               struct sk_buff  __prv;
+       };
  };

but that's much more invasive, and I don't even have means to
quantify this in terms of final binary size and performance
impact. I think that would be a flat out no go.

 From the other hand if you look at the __skb_queue functions
they don't do much and at all so there is no much room for
other issues really. I followed the suggestion in [1]:

"if your function deliberately contains possible ..., you can
  use __attribute__((no_sanitize... "

[1] https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html

-- 
Thanks,
Tadeusz
