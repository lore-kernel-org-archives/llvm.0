Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ECD809
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649504826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kANSNeeGkYUwvJRcfY0adJcFfGrYgDXHkzIykiPCPSc=;
	b=OpCPNb6Cj+m4Kud3K/b8sMYMj/7AFECdfPqSZobEHB18zbRsVkMu98scayhr4bIUx0R4WJ
	BKXbWpjr+PfIFho2tX5x51LWL6+KWffYmMtHkdwx+zJtAmiMN2i1UISynZnaxUXXGvdMh1
	/yV/gJmjRsSww3MsJbOiza30XoZ0/ew=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-1fvcSr11MCKf7ZcDz5CaAQ-1; Sat, 09 Apr 2022 07:47:05 -0400
X-MC-Unique: 1fvcSr11MCKf7ZcDz5CaAQ-1
Received: by mail-qv1-f70.google.com with SMTP id kj4-20020a056214528400b0044399a9bb4cso11582402qvb.15
        for <llvm@lists.linux.dev>; Sat, 09 Apr 2022 04:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kANSNeeGkYUwvJRcfY0adJcFfGrYgDXHkzIykiPCPSc=;
        b=dGuzvYbtLdcoPWdRDIqJmNpidjT2F1jKFrFfhgD6GlwrKZd/rrFzb6HgmsbaDw60b+
         GBCN+hrRmUNdZem0+XReJtLVb/GDxM09xjBxyXeTCI98wiap3QBeA9EDHRYQFQBP6Kh/
         Xm2atOPApPMikeqYfgJDJx7rcApXmWS5kwOUJd68sTkE8Kd7yVYuB7s9PBYKQ4vYY5Ii
         agvOtQ5hsPXyz/hr2YoYlNFC8T5hv7kjN8lW2ySNlNZAkkrruBokf3heQJVrd1IPnK5Y
         V0oHetiMLRjnV92hDl/rek86arHfi9qvHuRXVtk73YnNtPNHvviMWYGEyhIujnjjI/Ei
         LVYQ==
X-Gm-Message-State: AOAM531mtJSV27obFNc0WdWYW1iYNwu+1BnHdL1rwaTEA7Bob0DY/kfD
	1s+HH52XL/XkPOD+yvQlLj6HB3bjfi5VY3c8Zp/3DQO69fQL/Q1a8gAmKLYKy5WeP62UK/5G85e
	fVjVsCN5HEiWgNyruq68v4kD+DGMpNa+FlzMGCI7F/GDIqk1RNdSbPXge7c4i
X-Received: by 2002:a05:620a:2585:b0:680:f1f5:23ac with SMTP id x5-20020a05620a258500b00680f1f523acmr15620538qko.656.1649504824365;
        Sat, 09 Apr 2022 04:47:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb4G+hNqZXEQrbF8SrxSFNhUARjC+5OVfwD5R6TULFJCq0gmkP0FgRnHG3hCOb+grIDHV9kQ==
X-Received: by 2002:a05:620a:2585:b0:680:f1f5:23ac with SMTP id x5-20020a05620a258500b00680f1f523acmr15620523qko.656.1649504824066;
        Sat, 09 Apr 2022 04:47:04 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a0b0100b0067d3ac00982sm14470312qkg.57.2022.04.09.04.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:47:03 -0700 (PDT)
Subject: Re: [PATCH] ipc/sem: Remove redundant assignments
To: Michal Orzel <michalorzel.eng@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220409101933.207157-1-michalorzel.eng@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <30aa1413-de9c-ffb9-223f-b091b7990a85@redhat.com>
Date: Sat, 9 Apr 2022 04:47:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220409101933.207157-1-michalorzel.eng@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/9/22 3:19 AM, Michal Orzel wrote:
> Get rid of redundant assignments which end up in values not being
> read either because they are overwritten or the function ends.
>
> Reported by clang-tidy [deadcode.DeadStores]
>
> Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
Reviewed-by: Tom Rix <trix@redhat.com>
> ---
>   ipc/sem.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/ipc/sem.c b/ipc/sem.c
> index 0dbdb98fdf2d..38ef91a63edd 100644
> --- a/ipc/sem.c
> +++ b/ipc/sem.c
> @@ -766,7 +766,6 @@ static int perform_atomic_semop(struct sem_array *sma, struct sem_queue *q)
>   	for (sop = sops; sop < sops + nsops; sop++) {
>   		curr = &sma->sems[sop->sem_num];
>   		sem_op = sop->sem_op;
> -		result = curr->semval;
>   
>   		if (sop->sem_flg & SEM_UNDO) {
>   			int undo = un->semadj[sop->sem_num] - sem_op;
> @@ -1430,7 +1429,6 @@ static int semctl_main(struct ipc_namespace *ns, int semid, int semnum,
>   	if (err)
>   		goto out_rcu_wakeup;
>   
> -	err = -EACCES;
>   	switch (cmd) {
>   	case GETALL:
>   	{

