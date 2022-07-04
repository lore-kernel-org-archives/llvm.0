Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A1728E1
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656946289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFvVKJ1fGrkThPrJCts+OirM91DHRLcTY7JYj4rk62U=;
	b=NQm5TmGP+3ADPRQ9sx4ypfKRVfl8ORsMPcL8gk2c6AasNKB/RiiPVyIotSWxV/BUoVFI+3
	thKVxjXutUY8wv2BcIEiclnqlcQ5CQzKplYAyqFKURfupLW5IdtV3d1bGEspBt/TxXEiC2
	LgLMx381xEKS1E0OyFzzuQjN0ES4Bo0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-zgfpBMu5NXa9ze7mr99ITQ-1; Mon, 04 Jul 2022 10:51:28 -0400
X-MC-Unique: zgfpBMu5NXa9ze7mr99ITQ-1
Received: by mail-qt1-f200.google.com with SMTP id bc7-20020a05622a1cc700b0031e7e46e660so977184qtb.10
        for <llvm@lists.linux.dev>; Mon, 04 Jul 2022 07:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zFvVKJ1fGrkThPrJCts+OirM91DHRLcTY7JYj4rk62U=;
        b=pcU0OSwDgX4oegINrLJ7vmUbMiUNOIbc8jDEuHrdjjirQHjutodtV/yMAhvu51wPBe
         50kRuVbnMo9MRyBEXkhYJxgOTnD8W+HEUuiLm736Esz2fyMvFSGbBQLO3WwZ+MBFuFJR
         ZDtpAMG/izqP6IVK8kcWvlA9V2B/u58OM/2lBkZsp3kejIyIeTAvSGT21wUhzaOQ1R0d
         SaCzBgPUtTDhNx2U0wUygKgaVEFcBgbJREfWY5pq734Xd+vf11izmsKOoWYYOl5IOYgB
         XgBHoJRWlBT+uTgAmjA7PRoakGFspm23or6o/xY0ZTq85Y3t/VZV+PIDp77elN/1Mgc8
         mPyw==
X-Gm-Message-State: AJIora/kVHHqv4uSzpWaNOJpTYXGv48pnJVWrqeTe7vFDHDdELhZg5WW
	l7V6PhRjOneT4RPtaW/mzL0q4sgVuMhrS6t/iH3aM4RVwI92P19Tm7FTXG2b8IwRL7Ku84wmPZI
	9L5310pglG+MdcQ==
X-Received: by 2002:a05:622a:391:b0:31d:2a07:4f41 with SMTP id j17-20020a05622a039100b0031d2a074f41mr21046654qtx.294.1656946288098;
        Mon, 04 Jul 2022 07:51:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOvptI4Bharw1kjiR6aB6/HEu3IoshyNYmsXxZb0mtL2gdO0jVvSB0WNMIX3QGj42rlK2jFA==
X-Received: by 2002:a05:622a:391:b0:31d:2a07:4f41 with SMTP id j17-20020a05622a039100b0031d2a074f41mr21046638qtx.294.1656946287912;
        Mon, 04 Jul 2022 07:51:27 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g84-20020a379d57000000b0069c72b41b59sm24603917qke.2.2022.07.04.07.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 07:51:27 -0700 (PDT)
Subject: Re: [PATCH] secretmem: drop unneeded initialization in
 secretmem_file_create()
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220704092605.19604-1-lukas.bulwahn@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <3aff433c-f503-791d-77df-21a962185c54@redhat.com>
Date: Mon, 4 Jul 2022 07:51:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220704092605.19604-1-lukas.bulwahn@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/4/22 2:26 AM, Lukas Bulwahn wrote:
> Drop the unneeded initialization of the local variable file in function
> secretmem_file_create().
>
> No functional change and no change in the resulting object code.
>
> This unneeded initialization was already introduced with the introduction
> of secretmem in commit 1507f51255c9 ("mm: introduce memfd_secret system
> call to create "secret" memory areas").

You may need to be more specific about this commit, the whole function, 
including this initialization was introduced at this time.

Otherwise, change looks fine.

Reviewed-by: Tom Rix <trix@redhat.com>

>   This minor code-stylistic issue
> was discovered as a dead store with clang-analyzer.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Mike, please ack.
>
> Andrew, please pick this minor stylistic clean-up patch. Thanks.
>
>   mm/secretmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 7584aab54d20..46b431d62761 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -171,7 +171,7 @@ static struct vfsmount *secretmem_mnt;
>   
>   static struct file *secretmem_file_create(unsigned long flags)
>   {
> -	struct file *file = ERR_PTR(-ENOMEM);
> +	struct file *file;
>   	struct inode *inode;
>   	const char *anon_name = "[secretmem]";
>   	const struct qstr qname = QSTR_INIT(anon_name, strlen(anon_name));

