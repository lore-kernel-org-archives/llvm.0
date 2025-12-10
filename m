Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853072EB5C4
	for <llvm@lists.linux.dev>; Wed, 10 Dec 2025 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765396313; cv=none; b=gL2Jks8Zw6Q6AENasXJ3WDgmVLfoLRYH0Kiy2ijhTU6AjtMgAXYoBAH0hKGFpesHI0s3sDby7IdanJUN5sUIMb2Joe1QnyilsI8QyWSGg2JbUb4oGB01fjJ8wRTkxEckEIM03zUnH+1n73pomaaTPRc9NLRpeFNhYj9EG2EW7nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765396313; c=relaxed/simple;
	bh=bVuknIZ9II+t7Y3vHavpbYMhqsjqBVWHocKRkXQCVXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UxVZpQ/mmDRtkBBXbfSQzTYeCKE7UznKsavuLI5gp0KMBtNY1TbG9gkKStfGLkonZLBOOvYb66r/IJBFCw1jJKr9uCce4xD3EsrIjqkDcn7GJ9Y9nVqh4GFhz256z5B4gK3X9RMdMdo/EZXUxN72Jt3FCg0cHFpOy8t0x63vjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h16+2q/a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h16+2q/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765396310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AgTacFvON8EG6QFjOtITInXZzOpTjY+dV5wDUO7hRQw=;
	b=h16+2q/axxfiaSH9cAj6FVOs9WU1hvhs9e8PdAsWgNq2wIWQziyMEqqUTTVCKYdpz4iNzw
	RmaXRxVaMN0CA/gSqHmghfwHeuG/cuNkwWN2Es8h//05YWk3j7ALqSENE/ibVMmMdc/mbI
	eDB/u/VGTwTiqH4EJbtnJhbi9TIEZVA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-DUrl4OUxPVKrPgln_yIMkQ-1; Wed, 10 Dec 2025 14:51:49 -0500
X-MC-Unique: DUrl4OUxPVKrPgln_yIMkQ-1
X-Mimecast-MFC-AGG-ID: DUrl4OUxPVKrPgln_yIMkQ_1765396309
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b6963d163eso50011485a.3
        for <llvm@lists.linux.dev>; Wed, 10 Dec 2025 11:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765396309; x=1766001109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgTacFvON8EG6QFjOtITInXZzOpTjY+dV5wDUO7hRQw=;
        b=n53trCnw1xUNpx/OlVwdRmDT/ZKeTYcuYfb1LVHekpMI8v1Zv7lntGEOC7hn31BPae
         irVekqfnO59PoKH/JW1AyscYrGJVbwaXO5oyu8kqQitOdmWaSaebgYZ2FbPfoVUy9Lmd
         ErLA8ODb7PSMqhn/kk2UxxWOA4Pou8rLTlhICy1GyNxZJHP8nGPyEfa8VMFBk9l0aDTV
         pLlXXV+hmvllZRx+HD8LMheGrkpUFG8pRdQaTDwn3tx4+RHh0JVgrEud3H8Tu5IT6Xi9
         LJvOXGE5xYpQ/rF7wQdk7WK9QZdIgC9/eAwdyyB+kkm+QmD3RAATjrOg1rIWDS9bUh8x
         G/7g==
X-Forwarded-Encrypted: i=1; AJvYcCVg61BOjnNZfag1leTqCOIr8REjQdH628ks6bHcIBHolYNWrOqC7eX4AvVeHtF5tdIPTtJC@lists.linux.dev
X-Gm-Message-State: AOJu0YzoDnNGCqSro8wI4Bh2b5Ljx6SdjdZXouh97p1QWNvZnL2qJRSw
	C3YtsUFzWhOKi0zNm01aRwlG6qVA7WZUFOigv6a+y2Eo2UPi+p2RvpKClxmBsQghXDXSjy0AnJ4
	GaGRcFe9psrZTkKbn140weo6wTbSMTEpdYBYSEQ4jVMLJtKErF8cqb1Q=
X-Gm-Gg: ASbGncvveF74BwJ3wzmdYpW0ELHWzcVGykuxUWathoqqg2Os8CweOXLfnMCpd8YEq2X
	afLoNKZQEoQiF4xBzm+jM36qNuYOYPsSFus99Ag+ktgRRnuYMxMdg72JewscoCYjfkaUvYboysb
	ANXUOUU6UFp6dqo/EDITr2ZhBSPWUYKOVmUAwevRWPOvSJyRAMaWY0wCPFVpMJRvJvm2e/gf8ik
	9B6eHcHO9dxWp49K3e/TvlcuGSFKM6dMgqNekEc7TvvCZ7QcVtfY7Z2dRj/S/NpiXnOA/39cwy8
	bLnksXfgvXJOO6GlMfHMlpjWusJOYM0eI/UkEEp6MQz7+zUpE7WqBe5ra0ifCL9gcFd30pqDUcS
	t+C8=
X-Received: by 2002:a05:620a:298e:b0:8b2:faa3:4c77 with SMTP id af79cd13be357-8ba38319803mr555740185a.0.1765396308663;
        Wed, 10 Dec 2025 11:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8yx8A+CBHx6Z8LCFOIAJuCthOtds6H4ec7oH3JAGsNI6sRNuSA+X8f8s93mX3FffFUDJBGw==
X-Received: by 2002:a05:620a:298e:b0:8b2:faa3:4c77 with SMTP id af79cd13be357-8ba38319803mr555734385a.0.1765396308095;
        Wed, 10 Dec 2025 11:51:48 -0800 (PST)
Received: from x1.local ([142.188.210.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ef16adcsm4356536d6.46.2025.12.10.11.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:51:47 -0800 (PST)
Date: Wed, 10 Dec 2025 14:51:46 -0500
From: Peter Xu <peterx@redhat.com>
To: Wake Liu <wakel@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] selftests/mm: Fix thread state check in uffd-unit-tests
Message-ID: <aTnPUmEMwymsWHyV@x1.local>
References: <20251210091408.3781445-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251210091408.3781445-1-wakel@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2NtwA9PRoMV6rO6iSPPruVQ3mVlebXw3rYt3Bdh3pN8_1765396309
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Dec 10, 2025 at 05:14:08PM +0800, Wake Liu wrote:
> In the thread_state_get() function, the logic to find the thread's state
> character was using `sizeof(header) - 1` to calculate the offset from
> the "State:\t" string.
> 
> The `header` variable is a `const char *` pointer. `sizeof()` on a
> pointer returns the size of the pointer itself, not the length of the
> string literal it points to. This makes the code's behavior dependent
> on the architecture's pointer size.
> 
> This bug was identified on a 32-bit ARM build (`gsi_tv_arm`) for
> Android, running on an ARMv8-based device, compiled with Clang 19.0.1.
> 
> On this 32-bit architecture, `sizeof(char *)` is 4. The expression
> `sizeof(header) - 1` resulted in an incorrect offset of 3, causing the
> test to read the wrong character from `/proc/[tid]/status` and fail.
> 
> On 64-bit architectures, `sizeof(char *)` is 8, so the expression
> coincidentally evaluates to 7, which matches the length of "State:\t".
> This is why the bug likely remained hidden on 64-bit builds.
> 
> To fix this and make the code portable and correct across all
> architectures, this patch replaces `sizeof(header) - 1` with
> `strlen(header)`. The `strlen()` function correctly calculates the
> string's length, ensuring the correct offset is always used.
> 
> Signed-off-by: Wake Liu <wakel@google.com>

Oops, thanks for spotting it.  It was an accident the size of array is 8
here.. What I should have meant was:

	const char header[] = "State:\t";

That should also work with sizeof().  But your fix works, so it's all fine.

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index f4807242c5b2..6f5e404a446c 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -1317,7 +1317,7 @@ static thread_state thread_state_get(pid_t tid)
>  		p = strstr(tmp, header);
>  		if (p) {
>  			/* For example, "State:\tD (disk sleep)" */
> -			c = *(p + sizeof(header) - 1);
> +			c = *(p + strlen(header));
>  			return c == 'D' ?
>  			    THR_STATE_UNINTERRUPTIBLE : THR_STATE_UNKNOWN;
>  		}
> -- 
> 2.52.0.223.gf5cc29aaa4-goog
> 

-- 
Peter Xu

