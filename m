Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57565A31
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 20:25:31 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id 10so9313046qtz.11
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 13:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xp+N5oR8cNMK62aRPk8kZIBvTheB6GVjqMQFtxgItNY=;
        b=uzmT8YBjDg8iBBrhhgj68yxCu3JyzhzgSZoDpmmr6bS9EX9M3mtqy/eS2CyVE7CMu2
         Uk+ntJGBzBwLKV+0maVn3pPN7uYD5kxde4IHrZTIyUZywq3B8+UgDKLDVXkerVNNklVQ
         Zu/Y0VHjs03lI4jixz32+qvbEoHfx82oIM8Gaw/ZyV4scP5e+BkyVRmcahFm8aBSVSVd
         LRAzeO/qQWg7oMKxYomev2f9GNS3d2tLDkCUYxvWXnZU0ODmrW4BuB8s9tweA6crM3Th
         a644A+ujV9/I9llRFFzMO5JRaeyW7UGacKledqgasiWyJl6OfPvNp//4zcRE7AsQP80o
         mHaQ==
X-Gm-Message-State: AOAM5320Bt9Ec4b6Ykbat75/yIOtZu07FvyEJwPfV441piLS0FPjvFmN
	TyjWcFlWGt0usaHq9j+n4j4=
X-Google-Smtp-Source: ABdhPJy22V69G2sn5CzTCipKqSCrMoDq1IayC54TiCihJO7Kv2zFonrvTzWuha3ql3MkiigxvK9adQ==
X-Received: by 2002:a05:622a:1a1d:b0:2e1:be1f:a4e8 with SMTP id f29-20020a05622a1a1d00b002e1be1fa4e8mr11352194qtb.371.1647721530594;
        Sat, 19 Mar 2022 13:25:30 -0700 (PDT)
Received: from dev0025.ash9.facebook.com (fwdproxy-ash-023.fbsv.net. [2a03:2880:20ff:17::face:b00c])
        by smtp.gmail.com with ESMTPSA id d26-20020a05620a159a00b0067d4f5637d7sm5549434qkk.14.2022.03.19.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 13:25:30 -0700 (PDT)
Date: Sat, 19 Mar 2022 13:25:26 -0700
From: David Vernet <void@manifault.com>
To: trix@redhat.com
Cc: jpoimboe@redhat.com, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
	joe.lawrence@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] livepatch: Reorder to use before freeing a pointer
Message-ID: <20220319202526.hlkrfxdod5mmkvp4@dev0025.ash9.facebook.com>
References: <20220319165159.2170650-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319165159.2170650-1-trix@redhat.com>
User-Agent: NeoMutt/20211029

On Sat, Mar 19, 2022 at 09:51:59AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> livepatch-shadow-fix1.c:113:2: warning: Use of
>   memory after it is freed
>   pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The pointer is freed in the previous statement.
> Reorder the pr_info to report before the free.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  samples/livepatch/livepatch-shadow-fix1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
> index 918ce17b43fda..6701641bf12d4 100644
> --- a/samples/livepatch/livepatch-shadow-fix1.c
> +++ b/samples/livepatch/livepatch-shadow-fix1.c
> @@ -109,9 +109,9 @@ static void livepatch_fix1_dummy_leak_dtor(void *obj, void *shadow_data)
>  	void *d = obj;
>  	int **shadow_leak = shadow_data;
>  
> -	kfree(*shadow_leak);
>  	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>  			 __func__, d, *shadow_leak);
> +	kfree(*shadow_leak);
>  }
>  
>  static void livepatch_fix1_dummy_free(struct dummy *d)
> -- 
> 2.26.3
> 

The fix looks good, though it looks like there is also a similar
use-after-free in livepatch_fix2_dummy_leak_dtor() in
livepatch-shadow-fix2.c. Could you please also fix that as part of this
patch?

Thanks,
David
