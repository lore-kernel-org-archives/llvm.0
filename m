Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55901B72
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648052261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMilvWqrMPZjKPNSjn2quNpLYv1XEy4/3uEFo9XhgfY=;
	b=iImOCK1DsV8u4JB+hZOQFX0P+avcIJwUKWIspr0KYdJuql5oKn4+wnKvmSVtVy9cRKGTGs
	UerOeZRjcQlE7p3dPcM42b+rQLqTKW0IZzR+AjYOyA+zjVrAMZ+TxZvzHTpY0eaDv5U2Rk
	KzuSZDkiEC3sY/nZKTBYAmdwy5xl+NI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-dpXcfVbROa6uvaBvqDNpRw-1; Wed, 23 Mar 2022 12:17:40 -0400
X-MC-Unique: dpXcfVbROa6uvaBvqDNpRw-1
Received: by mail-qt1-f197.google.com with SMTP id h11-20020ac87d4b000000b002e1c9a3ae51so1578450qtb.0
        for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 09:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LMilvWqrMPZjKPNSjn2quNpLYv1XEy4/3uEFo9XhgfY=;
        b=xwcDyLZP0tZJZsTYcwDmBOMNZdqTkJP+uE/zG8JubcQLCGbgtCb4y52nE+13SbUNaL
         vgCK88qh1aXM7dYW7fRTAXnA9wlNd2I+TcHaoQFSs8DtLILYy2AoScpp02BbzvlVerOE
         tT08B+lLfXKTWrWAnZV1OJx9XaNynuWhJfEw8RQmwbxJ4GOCsg1YzNwyQ//GO2dBYBQG
         rCQZHrxNMSO+WuZYVGtTUL0Sis8APZwbEA/koIDDHKfnpG2Cr3Q9TB5lsQK3SzgBnqmB
         Lbd78J0QVeh9bK8j+hLdit0zqoTok9rXseP6TN5orVPrcXYpOygb3Q34JDEoVVZJRD6H
         vNmA==
X-Gm-Message-State: AOAM531d2fq26+W7zcqQHd+8i3MkuC/a/Lu+vCxEwbWNTqdK/A4IWI40
	K8kLaHlCpINIkQJ7ddr5WJcviP5FrRIsWvJCM2jxyB7lMKXHvzyGc39/9K6c/kvx5+n3j9yymIe
	8GjoU+dj30caWD15M0KtOMqBn3+TeaMMLPxgXZZ75pZKx+zUdQ+tVg5Vdq70m
X-Received: by 2002:ac8:7d0f:0:b0:2e1:cd79:6c3f with SMTP id g15-20020ac87d0f000000b002e1cd796c3fmr456914qtb.551.1648052259773;
        Wed, 23 Mar 2022 09:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI+ts2Y1HOmiplnzOuO6XQHoN928vcCV0rvB/x+YY/nDDPpeIZrag/6oSq8+QdpPyfB2jmMQ==
X-Received: by 2002:ac8:7d0f:0:b0:2e1:cd79:6c3f with SMTP id g15-20020ac87d0f000000b002e1cd796c3fmr456865qtb.551.1648052259384;
        Wed, 23 Mar 2022 09:17:39 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id u20-20020a05620a455400b0067ec0628661sm261739qkp.110.2022.03.23.09.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 09:17:38 -0700 (PDT)
Subject: Re: [PATCH v2] livepatch: Reorder to use before freeing a pointer
To: Petr Mladek <pmladek@suse.com>
Cc: jpoimboe@redhat.com, jikos@kernel.org, mbenes@suse.cz,
 joe.lawrence@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
 live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220320015143.2208591-1-trix@redhat.com>
 <YjtCY1QaA6GI3b+7@alley>
From: Tom Rix <trix@redhat.com>
Message-ID: <be3ac729-8d1d-0c2e-6d63-aeb23ca04bbd@redhat.com>
Date: Wed, 23 Mar 2022 09:17:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YjtCY1QaA6GI3b+7@alley>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/23/22 8:53 AM, Petr Mladek wrote:
> On Sat 2022-03-19 18:51:43, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this issue
>> livepatch-shadow-fix1.c:113:2: warning: Use of
>>    memory after it is freed
>>    pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> The pointer is freed in the previous statement.
>> Reorder the pr_info to report before the free.
>>
>> Similar issue in livepatch-shadow-fix2.c
> I have added the following paragraph:
>
> <snip>
> Note that it is a false positive. pr_info() just prints the address.
> The freed memory is not accessed. Well, the static analyzer could not
> know this easily.
> </snip>
>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> and pushed the patch into livepatching/livepatching.git,
> branch for-5.18/selftests-fixes.
>
> IMHO, the patch is so trivial and can be added even in this merge
> window. There is no need to create more dances around it ;-)
>
> Let me know if you disagree. I am going to send the pull request
> on Friday or Monday.

Do whatever is easier for you.  The addition to the commit log is fine.

Thanks

Tom

>
> Best Regards,
> Petr
>

