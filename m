Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEAE1164
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 02:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644891409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OES9eo0if6aMt90j7pDi9qQJl5u1pvSze5SYytpvGsE=;
	b=RjmdJg0WqS5v5ARJjcj1g/JXd/p+bT+Bj8tQ7G6wZT08KDkCef7o1vSbkutdN7Yiu0imDq
	lsUuK4YOxIFjjB6Ggg6DQmRCdHn6CFxUHl1Y0a8qW7KDODmGwuCt0FL+k5ZmyjMkeGRM7q
	DMZ0yw4he8d73Pm2/p5fmF2TAyQHB8o=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-SKufk6JVOP-98AR2Qc9Uxw-1; Mon, 14 Feb 2022 21:16:48 -0500
X-MC-Unique: SKufk6JVOP-98AR2Qc9Uxw-1
Received: by mail-ot1-f69.google.com with SMTP id w25-20020a9d70d9000000b0059fa6c78406so11344458otj.22
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OES9eo0if6aMt90j7pDi9qQJl5u1pvSze5SYytpvGsE=;
        b=GQD2wBdvScrNZ1txHQQ2T/bBXMbUBhkQejujdbNE2BEpAgabcKriCtRz02Jz4ptZy+
         JzVqO6htnP3fZnAU3eWf8jQyKQ17j/ZWdUyQtDleb5vNDH/RbU3r+wd/MnfDimmZSlcI
         brqLDNw1XWmTx0wjx8l3035FHhjhgPYZfQ+PxiuQDnRFCoadDd+tfaRM+2IvHoeRW6f+
         72T7vfyFpKtMDU3ubHsx9YZkXLQL9G9JGnksrCJEBjR1/84LirQ1MWCQaQThbXJj8xcT
         1uhqa2P7fR25cNeXwu7q9L8ft7u0ZFIoBP0Bd4pt7KitVU19zcWHKk1pEvVFmRSZckiH
         gFOg==
X-Gm-Message-State: AOAM532ZOK/wl6yz6sL8TR04XVSF1LCpwValX+69nszhn6JJXSN5Mtip
	3h67iZs+cUU+NiTivv1N2xArYpuJRO1+CvHvQwqRPDecLveYcOf57iDhqHI1ppnfoi2pBabQWOA
	0e3Ov78yeYcHWJWQ77kZiYQQ0Kxen1rJ7LrWKbg2dVhhQgMjUWlUE+aephUhJ
X-Received: by 2002:a9d:2006:: with SMTP id n6mr624200ota.280.1644891407342;
        Mon, 14 Feb 2022 18:16:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNReslkyHcan04SVrO66oIRVvUmrz6T/DGJgUso3HMcO0lO54yqkB9k5GXi2Cs08NXfNdIqw==
X-Received: by 2002:a9d:2006:: with SMTP id n6mr624189ota.280.1644891407067;
        Mon, 14 Feb 2022 18:16:47 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q4sm13092321otk.39.2022.02.14.18.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 18:16:46 -0800 (PST)
Subject: Re: [PATCH] mctp: fix use after free
To: Jeremy Kerr <jk@codeconstruct.com.au>, matt@codeconstruct.com.au,
 davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220214175138.2902947-1-trix@redhat.com>
 <daabe69d3863caa62f7874a472edbf2bc892d99e.camel@codeconstruct.com.au>
From: Tom Rix <trix@redhat.com>
Message-ID: <6590666e-524d-51c3-0859-f8bf0c43c5ca@redhat.com>
Date: Mon, 14 Feb 2022 18:16:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <daabe69d3863caa62f7874a472edbf2bc892d99e.camel@codeconstruct.com.au>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/14/22 4:44 PM, Jeremy Kerr wrote:
> Hi Tom,
>
>> Clang static analysis reports this problem
>> route.c:425:4: warning: Use of memory after it is freed
>>    trace_mctp_key_acquire(key);
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> When mctp_key_add() fails, key is freed but then is later
>> used in trace_mctp_key_acquire().  Add an else statement
>> to use the key only when mctp_key_add() is successful.
> Looks good to me, thanks for the fix.
>
> However, the Fixes tag will need an update; at the point of
> 4a992bbd3650 ("mctp: Implement message fragmentation"), there was no
> use of 'key' after the kfree() there.
>
> Instead, this is the hunk that introduced the trace event:
>
>    @@ -365,12 +368,16 @@
>                            if (rc)
>                                    kfree(key);
>     
>    +                       trace_mctp_key_acquire(key);
>    +
>                            /* we don't need to release key->lock on exit */
>                            key = NULL;
>   
> - which is from 4f9e1ba6de45. The unref() comes in later, but the
> initial uaf is caused by this change.
>
> So, I'd suggest this instead:
>
> Fixes: 4f9e1ba6de45 ("mctp: Add tracepoints for tag/key handling")
ok - see v2
>
> (this just means we need the fix for 5.16+, rather than 5.15+).
>
> Also, can you share how you're doing the clang static analysis there?
> I'll get that included in my checks too.

build clang, then use it

scan-build \
     --use-cc=clang \
     make CC=clang

There are a couple of configs that aren't happy with clang, these you 
can sed away with

sed -e 's/CONFIG_FRAME_WARN=2048/CONFIG_FRAME_WARN=0/; 
s/CONFIG_RETPOLINE=y/CONFIG_RETPOLINE=n/; 
s/CONFIG_READABLE_ASM=y/CONFIG_READABLE_ASM=n/; 
s/CONFIG_FORTIFY_SOURCE=y/CONFIG_FORTIFY_SOURCE=n/'

I am using clang 14

Tom

>
> Cheers,
>
>
> Jeremy
>

