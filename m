Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A0C28E6
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650627399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfEjtIKSL4He+pHPZ91gOLL5Y9n9DhaWPlm2XzzRFok=;
	b=ZzUM+QKTJ5WomG47FuJ7beAw/qy4JTyQqsPHlU7RvRfmDWLaogVn0fZ3E3JNXm9VJFgA/4
	/m8/Jt2x9y93KThjOdUsiXeTeb20C+B/FCqxHd8CPdOKbWfYY0VUrIVOJGNqS5eaZlSnQJ
	I+wwboVI1RdBf+c6Xr5c56ddE8OfUIY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-52KP2XRmOHCDP8TAHtqviw-1; Fri, 22 Apr 2022 07:36:38 -0400
X-MC-Unique: 52KP2XRmOHCDP8TAHtqviw-1
Received: by mail-qt1-f199.google.com with SMTP id r16-20020ac87950000000b002f34f162c75so2500256qtt.9
        for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 04:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rfEjtIKSL4He+pHPZ91gOLL5Y9n9DhaWPlm2XzzRFok=;
        b=1R5Gy9gSsAZ/ys0uNPEUI7wNaS5i95MAjzR01aMX9Ae8aEeQGmxLCH+4OfFEJ+P0m5
         VjbOXLgTglt/VSyEjjtSwNy3VszF/ojPbls6GVAk2wR4LXJswdPL21yQ2iSZYvFb0E+u
         Bv8aCO2/jwFbhsRbl5uSfuoLqUjTJTIP3Lf7ShiDKnQIohmGKAW+LjsDUxlpncHiYDtU
         VJFkvf57EgdywfoM2aGwoq2fxLVtC9c5MJstB8mqtfg4KVOqfGeQa6M4tvRAyTU4SMmo
         XJI2h52IA/i0A8Mfay8+m77kZfd0u/jcQXYFVyiHsL8kKQj1UpSWCoouxuQ5aERJAjCg
         ydFw==
X-Gm-Message-State: AOAM532BHVlip/PwCgkXByrE+71TjyKUzti6C2DLtbDowDVPKPFL/3t6
	2s1hPb0B2LIMl2B3oAY0pzWDSissz8cQK2kYi4QzLsdM3xYDFZZmLNV/a6HB8f+NYu2MT0zoNov
	QsNMYTh86quQz0hG4qBF/TUAjCMeaFEhEJ7o83McicjCrkswKVZl7he0hAevu
X-Received: by 2002:a05:620a:1654:b0:69c:7035:b31f with SMTP id c20-20020a05620a165400b0069c7035b31fmr2297905qko.546.1650627397869;
        Fri, 22 Apr 2022 04:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGQvyIHXFTiMJN4w9uTECim1QktNe4yTDbMmuBGoP1GUhkjlyryqtd5m7Ebl2PkbUXwitfjA==
X-Received: by 2002:a05:620a:1654:b0:69c:7035:b31f with SMTP id c20-20020a05620a165400b0069c7035b31fmr2297886qko.546.1650627397596;
        Fri, 22 Apr 2022 04:36:37 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h75-20020a379e4e000000b0069db8210ffbsm791750qke.12.2022.04.22.04.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 04:36:37 -0700 (PDT)
Subject: Re: [PATCH] kernel/irq/matrix.c: remove redundant assignment to
 variable 'end'
To: Colin Ian King <colin.i.king@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220422110418.1264778-1-colin.i.king@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <8016b196-6a39-8808-b1ff-286aacb2c8ca@redhat.com>
Date: Fri, 22 Apr 2022 04:36:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220422110418.1264778-1-colin.i.king@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/22/22 4:04 AM, Colin Ian King wrote:
> Variable end is being initialized with a value that is never read, it
> is being re-assigned later with the same value. The initialization is
> redundant and can be removed.
>
> Cleans up clang scan build warning:
> kernel/irq/matrix.c:289:25: warning: Value stored to 'end' during its
> initialization is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   kernel/irq/matrix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/irq/matrix.c b/kernel/irq/matrix.c
> index bbfb26489aa1..1698e77645ac 100644
> --- a/kernel/irq/matrix.c
> +++ b/kernel/irq/matrix.c
> @@ -286,7 +286,7 @@ void irq_matrix_remove_managed(struct irq_matrix *m, const struct cpumask *msk)
>   int irq_matrix_alloc_managed(struct irq_matrix *m, const struct cpumask *msk,
>   			     unsigned int *mapped_cpu)
>   {
> -	unsigned int bit, cpu, end = m->alloc_end;
> +	unsigned int bit, cpu, end;
Reviewed-by: Tom Rix <trix@redhat.com>
>   	struct cpumap *cm;
>   
>   	if (cpumask_empty(msk))

