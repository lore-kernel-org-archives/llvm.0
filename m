Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92C3876B0
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518240; cv=none; b=rvI7qaCTrfksqG9mRj2bcKCKJ2FJPhRZNHHGDQSxM78eYPBhF2hTliPrulRWvkidvdLfqalXWGfYgMqjL9p9jAvelB1qFIT7zgYhejEKPvjthOYBOTYFenLnBiOoTTWBE5GbmuO57qyVkpEx5lZOnukbRtv37PpXNFh3oQxcfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518240; c=relaxed/simple;
	bh=GCkBXddSbeHCDvY1GzromperE2nmzYP3jL1SLw1+JJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwqCi03mN49bfxgWAGleInTAmsQ9fUEvQUjjRHnHf3Gt80j2bL+HItb1O1S3b6dw5jkWCqmFr88V6wpg56YR7tFMHTIQkItw+cupmWu1PcXsv7cEjRPO+7PX+rkungxnng5lhLGXoDgx5xjvUu0dyrK5ic0lI7Jtusb2BOQioLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WnaiYBCq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WnaiYBCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786518238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMSQFwJ3Pn8MGM6lOdOzrV1KHdix97IWR2KeUG/GEeU=;
	b=WnaiYBCqWswdwd+LZVI7TIFAtZ7ATaM3x/Irb4PylwG7xEdqJC/x4a7D4RUYx9ys/cDg42
	g5sq7fQ7FV74fMAJBDNcKYTrDrrWTX+qyVSCLvwtl9i6G+gVNDo8MkSLc32kJ4eqSOwBtf
	/tPJ4VQcOG6ro33pVvlhWSHnwhLaeDY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-cxgo8GhENMOnFrsKsxFphQ-1; Wed, 12 Aug 2026 03:03:51 -0400
X-MC-Unique: cxgo8GhENMOnFrsKsxFphQ-1
X-Mimecast-MFC-AGG-ID: cxgo8GhENMOnFrsKsxFphQ_1786518230
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-496c06ba017so4626495e9.0
        for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 00:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786518230; x=1787123030;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMSQFwJ3Pn8MGM6lOdOzrV1KHdix97IWR2KeUG/GEeU=;
        b=odvYTaO85Y++wz6VkOT4Da7AJdrDI899TyUhsmqiZY5wDA/Wl+iUjLNBtlzLaehVTn
         53MzhPH0Ty8BxaX36axg0ZvJdU3tqgUeAL2MQPGfCk/asUFNZZgfWjDeMqdblqBKR82y
         xTgEE17KV8LQ/BEWtZ2fXAizdzBcJxNFjQqd49moijSqKfeJY3EDe79RsU6jLjKhfxH9
         IIf3lzU08ZMi1FtHPI8XqZDxOXs2ojRy7RcELFE4tCZQUd7V1YeZGJkXpW4P21gFJfL2
         uOQXu/VjDu4lr2UHImS1Hs6LJzh2/krv8mpcge5ftwUBtegGsNLfrR14AQ7CDdSPvZfC
         Vlgg==
X-Forwarded-Encrypted: i=1; AHgh+RrK4Oy/+O3+/TQzpqDxfEMQVxLe546YFlzokDuacRfFL3JH7T5sBQfzhiTLyCiUwfnAZ4bs@lists.linux.dev
X-Gm-Message-State: AOJu0YwLMiuWwOHYn0oCNlHC5kklwafVoFdLrufsZBpmau6jbEJJfFJn
	B/TUExAI0Si89ZdmWhIQDCxHHqE2LdRFmewxqGMfM6KUx0UPCPZ0BNO9uOex/BSJEECBwk04A6t
	b/1t4ERF6vZFW9OpRHrMxXMauSyn0R6YZRZ/XeuEhrkKSuLmrfF3KCQ==
X-Gm-Gg: AR+sD12c8izRLfmtKAFPsi1ASl0xLq/DSlbyB1Qb2092Q7cLt4lH/GOfW1qFtY4dnQM
	gykK2S8rdsolEqmP/LwFcNjTiE+uspF+nfZ2ECtK7OhNs5gkbPwUeJaZNza/HUjgyTz4CpRDxMc
	XtZ3r4e8HJ4W+x19MpbOPv9CAmyjux8l9Pg4EQw8l2536yRgE39iNUkcY7uYDXpvihmTpyXjAcy
	Y/3S1C3vYil+AhD4t/Zb1+OI9o17omNKAJekwG7ihczUVUKLTkOaHxFOdLLkuXP3qbBUQLDcfgq
	DUEH2TD+AhJuaEZAuI5fsH35mgi9zgpiRIkIXB26YetRw6BQWwYCHSp5Ad18r4FC9uwvIvlw9Vr
	Ml6xA1/JOrULno20sPFoyaeqQ01ieK8wWKVU=
X-Received: by 2002:a05:600c:138b:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-4997c30b80fmr29456885e9.0.1786518229789;
        Wed, 12 Aug 2026 00:03:49 -0700 (PDT)
X-Received: by 2002:a05:600c:138b:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-4997c30b80fmr29455945e9.0.1786518229435;
        Wed, 12 Aug 2026 00:03:49 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ada79a3sm46337885e9.1.2026.08.12.00.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:03:48 -0700 (PDT)
Message-ID: <02ce6b65-7670-4dac-ac9c-8875867d6ad3@redhat.com>
Date: Wed, 12 Aug 2026 09:03:47 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] selftests: add shared lib.bpf.mk to build BPF
 progs and skeletons
To: Ziyang Men <ziyang.meme@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, David Vernet <void@manifault.com>,
 Eduard Zingerman <eddyz87@gmail.com>, Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, JP Kobryn
 <inwardvessel@gmail.com>, Mykola Lysenko <mykolal@meta.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-kselftest@vger.kernel.org,
 cgroups@vger.kernel.org, linux-input@vger.kernel.org,
 sched-ext@lists.linux.dev, linux-mm@kvack.org, kernel-team@meta.com,
 bpf@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260721174833.1232771-1-ziyang.meme@gmail.com>
 <20260721174833.1232771-2-ziyang.meme@gmail.com>
 <f2a0db3b-ac66-4b29-9dff-a691d9464123@redhat.com>
 <anTlFSsr5FqQt+o8@devvm16600.scu0.facebook.com>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <anTlFSsr5FqQt+o8@devvm16600.scu0.facebook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Iwmze9NdX3RwO_qXS9Z_aaZnlkkldG1tvMzsFKs-88w_1786518230
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/6/26 21:48, Ziyang Men wrote:
> On Wed, Jul 22, 2026 at 08:50:06AM +0200, Viktor Malik wrote:

[...]

> Hi Viktor, 
> 
> Thanks for your suggestions!
>>
>> Looking at the same line in tools/testing/selftests/bpf/Makefile:
>>
>>            EXTRA_CFLAGS='-g $(OPT_FLAGS) $(SAN_CFLAGS) $(EXTRA_CFLAGS)' \
>>
>> is there a reason why this is not respected and -O0 and -fPIC are
>> hard-coded?
> Yes it is true that there is no good reason. I will fix it in the next version.
> 
>> What if someone wants to build selftests (including libbpf)
>> with -O2 and some additional flags?
> I will add a flag such as OPT_FLAGS ?= $(if $(RELEASE),-O2,O0), which follows
> the pattern in the bpf/Makefile:37. So if we run 
> $ make -> -g -O0 -fPIC (taget libbpf) and -g -O0 (host bpftool)
> $ make RELEASE=1 -> -g -O2 -fPIC (taget libbpf) and -g -O2 (host bpftool)
> 
>> Is that possible with the new
>> lib.bpf.mk? It would be nice if it used at least EXTRA_CFLAGS or
>> USERCFLAGS defined in lib.mk.
> Good idea. I will add the EXTRA_CFLAGS for target libbpf, host libbpf and host
> bpgtool. Such that: 
> $ make OPT_FLAGS=-O2 EXTRA_CFLAGS=-DFOO -> -g -O2 -fPIC -DFOO (for target
> libbpf) and -g -O2 -DFOO (for host bpftool)

I'm wondering if we could use USERCFLAGS (and USERLDFLAGS) instead.
These seem to be the preferred way for all selftests, per
tools/testing/selftests/lib.mk:

    # Enables to extend CFLAGS and LDFLAGS from command line, e.g.
    # make USERCFLAGS=-Werror USERLDFLAGS=-static
    CFLAGS += $(USERCFLAGS)
    LDFLAGS += $(USERLDFLAGS)

At the time I was adding the extra flags to libbpf/bpftool sub-makes, I
wasn't aware of USER*FLAGS so I used EXTRA_*FLAGS instead. But now, when
someone wants to build multiple selftest collections with extra flags,
they need to define both. For instance, building with PIE requires:

    make -C tools/testing/selftests TARGETS="bpf ..." \
        USERCFLAGS=-fpie EXTRA_CFLAGS=-fpie \
        USERLDFLAGS=-pie EXTRA_LDFLAGS=-pie \

Switching to USER*FLAGS for bpf selftests would simplify things a bit.

Viktor

> 
>>
>> Same questions would apply to other rules for libbpf and bpftool below.
> I would check it them as as well in next version.
> 
>> Thanks!
>> Viktor
>>
>>
> Thanks for your time and reviewing. Please let me know your concerns. Thanks!
> 
> Best,
> Ziyang

