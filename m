Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D43FC7
	for <llvm@lists.linux.dev>; Wed, 22 Sep 2021 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632325984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QNIWP0d0RzgTdX2p+hapRwTwiak0Hv/aQlwyrA7gHog=;
	b=B/4q1ePPo60cXN6IBL0AjIcMOPJeMjaxXt+ANMXdS8N5rWsS72lzdbrEru1OSHcbtzKrh7
	VwRH0Z+d3debuOS/6Qv6jysisc+O8I0+USgC7E8aVRhnLvslRhNld8bIbQfy69ySfXASk7
	oKlcSQWelCQI+SJKZII8tqXjppaXpNw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-ntEAjVb3MnO6UHvesB9qYw-1; Wed, 22 Sep 2021 11:53:00 -0400
X-MC-Unique: ntEAjVb3MnO6UHvesB9qYw-1
Received: by mail-qv1-f69.google.com with SMTP id l18-20020a056214039200b0037e4da8b408so12911874qvy.6
        for <llvm@lists.linux.dev>; Wed, 22 Sep 2021 08:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QNIWP0d0RzgTdX2p+hapRwTwiak0Hv/aQlwyrA7gHog=;
        b=1LYOQcsBkH4FjxDn/nS+iboA1/J0v9UWNFbZDx1IsYxsqcUg5BujeCghiZPy0MS7ra
         Uyv7+yX23xotTyioB3V+esZBlc8HB/qy/WKVaJTb/JCMx8WBRWYlpir4Qwflv6oPeS7Q
         r6a8kJF9Dkohc8itzvHVmHLe3krUkitSTVdJ5obadf8+51ddHmPF3FlW7Y52tED0r0is
         eAUTIFsSn+est4dboaJ9vXC/XDngVJehyTSXaKJJIS3ZqHmhR1PAi/n3lenXV9IvDb03
         AoGZsU/Iia3DDwZPpyADA1Z2BZClXQ9j0ujCI831sWHMwCBwtfbFa/JjjaY6cWB59fl9
         hj+g==
X-Gm-Message-State: AOAM533s3Z7JfE+7h4YVhYxQAfL7LHe/dNR2mSyG2Hiuv6htGY4vZOe8
	SLg8leW0ADEYIIFFwQoYfvQGgBgdGnBffYy6zuRqG2paIbmVEM0h08eTxMw0v3HjCrh2SU7esZb
	mlLf9iyT6uEH5CQ==
X-Received: by 2002:a05:6214:12ec:: with SMTP id w12mr553003qvv.48.1632325980017;
        Wed, 22 Sep 2021 08:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlAIybjuGUN4ANXueEhN4IL/DlV0u82GnLUemzbSu3zv0XuFRCyPP4TmZELnmsssaTJlYZWA==
X-Received: by 2002:a05:6214:12ec:: with SMTP id w12mr552984qvv.48.1632325979726;
        Wed, 22 Sep 2021 08:52:59 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id v24sm2034776qkv.11.2021.09.22.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 08:52:59 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] locking/ww-mutex: Fix uninitialized use of ret in
 test_aa()
To: Nathan Chancellor <nathan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "kernelci.org bot" <bot@kernelci.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210922145822.3935141-1-nathan@kernel.org>
Message-ID: <27e08098-83b6-2238-59c1-3b38cd042a31@redhat.com>
Date: Wed, 22 Sep 2021 11:52:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210922145822.3935141-1-nathan@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=llong@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/22/21 10:58 AM, Nathan Chancellor wrote:
> Clang warns:
>
> kernel/locking/test-ww_mutex.c:138:7: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>                  if (!ww_mutex_trylock(&mutex, &ctx)) {
>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/test-ww_mutex.c:172:9: note: uninitialized use occurs here
>          return ret;
>                 ^~~
> kernel/locking/test-ww_mutex.c:138:3: note: remove the 'if' if its condition is always false
>                  if (!ww_mutex_trylock(&mutex, &ctx)) {
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/test-ww_mutex.c:125:9: note: initialize the variable 'ret' to silence this warning
>          int ret;
>                 ^
>                  = 0
> 1 error generated.
>
> Assign !ww_mutex_trylock(...) to ret so that it is always initialized.
>
> Fixes: 12235da8c80a ("kernel/locking: Add context to ww_mutex_trylock()")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1463
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   kernel/locking/test-ww_mutex.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
> index d63ac411f367..353004155d65 100644
> --- a/kernel/locking/test-ww_mutex.c
> +++ b/kernel/locking/test-ww_mutex.c
> @@ -135,7 +135,8 @@ static int test_aa(bool trylock)
>   			goto out;
>   		}
>   	} else {
> -		if (!ww_mutex_trylock(&mutex, &ctx)) {
> +		ret = !ww_mutex_trylock(&mutex, &ctx);
> +		if (ret) {
>   			pr_err("%s: initial trylock failed!\n", __func__);
>   			goto out;
>   		}
>
> base-commit: 12235da8c80a1f9909008e4ca6036d5772b81192

I was a bit confused by this patch at the beginning and then realized 
that it was supposed to be applied on top of the tip true, not the 
current mainline kernel.

Anyway, it looks good to me

Acked-by: Waiman Long <longman@redhat.com>

