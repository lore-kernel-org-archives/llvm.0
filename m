Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1918AEE
	for <llvm@lists.linux.dev>; Tue, 11 Jul 2023 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689076151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ox1ybSLl45XwKkwvaJMisJ5/+NEAsrD7J+jcJG30/JQ=;
	b=AQaBdNI6PnPj0Gb0TGw5XmSsQZ4M/ID3LOZVmDGa12hvKpyfgSIs51McaD71LQB05edois
	Of8nzbn9QgP7pB8bXXJ6kv8QIJomxtatR4/o2YjoW0JMZ9uIkOWsPTFwfd+MFW1wW9ttzS
	d0i9u8Kk4DRtM4Wi4pkTBeR2tZWtlzc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-tgzGnS-4MDCrc9o5ZWR5ig-1; Tue, 11 Jul 2023 07:49:09 -0400
X-MC-Unique: tgzGnS-4MDCrc9o5ZWR5ig-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fbdf341934so41048425e9.3
        for <llvm@lists.linux.dev>; Tue, 11 Jul 2023 04:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689076148; x=1691668148;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ox1ybSLl45XwKkwvaJMisJ5/+NEAsrD7J+jcJG30/JQ=;
        b=GQgcfCdap5Bw9784u3ngn0LaBxqleVrg1vImZMz4rPzzxRsudtFho7f8tOxQ5Px7bo
         VGPEeCAcYDB7fb87W7YTxQqTLk8bTn3Wjb/oDakA5gePTwGx86Z/OsXfN+kQTnNwrPm5
         iulhk6utbjQ8Hno6cUu3tiSAaJzYm4Jeg18xGV12i104xP7ofvuOaMii0YyoyOZiGTfk
         x6l7qwU0AUfpO6M2a8bltH8+FqHmL4BIb8QbFOeNfCCytnEf/AyBJtFRn1VBSzoVb+m5
         UFu5pZVk91dpSaR9mWSn/BfSE+4OTuihKlHBI0YtW9nLV5W8m2Y2nVlkGVLBx2YnQT4y
         VKPw==
X-Gm-Message-State: ABy/qLZhMOl0UYui3QEblrtTh9sSzeSPo1ptfJW7jNgBqv4c8aA+OncD
	A78bIKUIwdPI5yPUVOmAbkhmG9cPPG6lm4XcAoQiNFjW/3+fC6iperJYF2xhZnSQfUTtB0IRUdY
	wGePMz1Ek5M/sCw==
X-Received: by 2002:adf:f9c9:0:b0:314:2132:a277 with SMTP id w9-20020adff9c9000000b003142132a277mr17501673wrr.9.1689076148758;
        Tue, 11 Jul 2023 04:49:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFZd89iKuySO+cfoLjyf2v2YUsX/u5t8p1LFxTJwVXW3pD745O+xFed6Np91H3kYcR2bhyjDw==
X-Received: by 2002:adf:f9c9:0:b0:314:2132:a277 with SMTP id w9-20020adff9c9000000b003142132a277mr17501654wrr.9.1689076148389;
        Tue, 11 Jul 2023 04:49:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id b7-20020a05600c11c700b003fc015ae1e1sm2386296wmi.3.2023.07.11.04.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 04:49:07 -0700 (PDT)
Message-ID: <65f4c60a-9534-56dc-099f-ee7a96e0ccaf@redhat.com>
Date: Tue, 11 Jul 2023 13:49:06 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] hugetlbfs: Fix integer overflow check in
 hugetlbfs_file_mmap()
To: Linke Li <lilinke99@foxmail.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, trix@redhat.com,
 ndesaulniers@google.com, nathan@kernel.org, muchun.song@linux.dev,
 mike.kravetz@oracle.com, Linke Li <lilinke99@gmail.com>
References: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.07.23 10:32, Linke Li wrote:
> From: Linke Li <lilinke99@gmail.com>
> 
> 	vma_len = (loff_t)(vma->vm_end - vma->vm_start);
> 	len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> 	/* check for overflow */
> 	if (len < vma_len)
> 		return -EINVAL;
> 
> The existing code includes an integer overflow check, which indicates
> that the variable len has the potential to overflow, leading to undefined
>   behavior according to the C standard. However, both GCC and Clang
> compilers may eliminate this overflow check based on the assumption
> that there will be no undefined behavior. Although the Linux kernel
> disables these optimizations by using the -fno-strict-overflow option,
> there is still a risk if the compilers make mistakes in the future.

So we're adding code to handle eventual future compiler bugs? That 
sounds wrong, but maybe I misunderstood the problem you are trying to solve?

-- 
Cheers,

David / dhildenb

