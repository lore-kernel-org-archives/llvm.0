Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A8C2E6
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680164374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6jCDp5R5UTDCRaJgvAusDHOREnAzeh37U4DgZVNJuM=;
	b=cAIrlPIG5njsVVlW0HKNysgG0csXoyGqeyhzugJ65zhvFwlFLwMV8RytU6XrFnu+riB10c
	ZWV8qf4mdCHh9bWSWXMn7q2iByjRzJ71eXe1JrgpmKG9rP5vkFIKtCjsrbmgGJaV3oV+Bn
	IWQbzLhKUCetZDwOJrsNX6lyfcaqTy4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-Iqkq3GFZOae57tZUQLERXQ-1; Thu, 30 Mar 2023 04:19:32 -0400
X-MC-Unique: Iqkq3GFZOae57tZUQLERXQ-1
Received: by mail-ed1-f69.google.com with SMTP id h11-20020a0564020e8b00b004e59d4722a3so25925807eda.6
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 01:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680164371;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6jCDp5R5UTDCRaJgvAusDHOREnAzeh37U4DgZVNJuM=;
        b=Oh/rDOtOU9AOssD8kMvSfoGXfVT1zXwUjRh+LAaZXNHFrP4e9LYmrHamIigU8cIQHs
         PyWjSmHjWEeMzuNnb1vB7w76AOWt/1SUF2+YijjvDH7yHH/6Ijo0Swf253Qg3LpiHPpJ
         HOGnqzsgPhsmPXG6D6wJbLe4H9vLzcrTUQBF0duRpTEGb6CPK5bsrL7GYHvc5VChjjIl
         3K+/2D7p89sXeTT00G+fB/MjclRLl4Q621yPYuIateOp2I+ECnoDqG75ghNe/xFFRt7s
         ZYb0GekKp15KvM/26Hn3d8juyRBOLoikUd4Y1lpfRIu6YGOm5m+ds9ppXiY+XE93usxJ
         WYiw==
X-Gm-Message-State: AAQBX9d6l4vaOON+CYW5z86aruEALao98YDA4lAnqvYzIr/Im9y4NAoq
	JcIqr5BX8K4GHdZknGGfS5RvAJlVOKyywJyhyFPG0SjmD7U94h7Q41o9SJOQpqXfWIufFEv9vu+
	v5MCgnKo+Uh5nAVQUD1N84g==
X-Received: by 2002:aa7:ccc7:0:b0:4ac:b614:dd00 with SMTP id y7-20020aa7ccc7000000b004acb614dd00mr20695728edt.30.1680164371221;
        Thu, 30 Mar 2023 01:19:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350apSQp5MBlS/cA/cdZpOW4RsJ11da4ieQjuIibFRO7HEAy3t2ntlH34TjEdg6AUTexNtD9DcA==
X-Received: by 2002:aa7:ccc7:0:b0:4ac:b614:dd00 with SMTP id y7-20020aa7ccc7000000b004acb614dd00mr20695718edt.30.1680164370986;
        Thu, 30 Mar 2023 01:19:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v15-20020a50c40f000000b004d8d2735251sm18024701edf.43.2023.03.30.01.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 01:19:30 -0700 (PDT)
Message-ID: <1e6460f9-5dbe-57a4-2986-ff3cbf5a39ad@redhat.com>
Date: Thu, 30 Mar 2023 10:19:29 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] fs: vboxsf: remove unused out_len variable
To: Tom Rix <trix@redhat.com>, nathan@kernel.org, ndesaulniers@google.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230329230310.1816101-1-trix@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230329230310.1816101-1-trix@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/30/23 01:03, Tom Rix wrote:
> clang with W=1 reports
> fs/vboxsf/utils.c:442:9: error: variable
>   'out_len' set but not used [-Werror,-Wunused-but-set-variable]
>         size_t out_len;
>                ^
> This variable is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  fs/vboxsf/utils.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/fs/vboxsf/utils.c b/fs/vboxsf/utils.c
> index dd0ae1188e87..ab0c9b01a0c2 100644
> --- a/fs/vboxsf/utils.c
> +++ b/fs/vboxsf/utils.c
> @@ -439,7 +439,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  {
>  	const char *in;
>  	char *out;
> -	size_t out_len;
>  	size_t out_bound_len;
>  	size_t in_bound_len;
>  
> @@ -447,7 +446,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  	in_bound_len = utf8_len;
>  
>  	out = name;
> -	out_len = 0;
>  	/* Reserve space for terminating 0 */
>  	out_bound_len = name_bound_len - 1;
>  
> @@ -468,7 +466,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  
>  		out += nb;
>  		out_bound_len -= nb;
> -		out_len += nb;
>  	}
>  
>  	*out = 0;

