Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B11FB0
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655225567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejIvCfAyutrqkd8eFlaqGZsxkXobIHdQcu+odJQsnAs=;
	b=MQE9t/f/je5+i+oJ4fTfdLFK5+nYUSMP56Ldy6G/wNfsGm+x0Ic4Y86rLYrHDTX8CR95E8
	1P5kT4spkuoyYCCnik90Z5NAF1BUSz2pcqAYBDGgatYwlcqMpQs/wTQQ4/mZK/O0tuhuqq
	G3LTodG5q0AuVKzAQnMrFGG1h8YKcak=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-SzeR8DuQPouAet8roWOJwA-1; Tue, 14 Jun 2022 12:52:46 -0400
X-MC-Unique: SzeR8DuQPouAet8roWOJwA-1
Received: by mail-wr1-f70.google.com with SMTP id n5-20020adf8b05000000b00219ece7272bso1416154wra.8
        for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 09:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=ejIvCfAyutrqkd8eFlaqGZsxkXobIHdQcu+odJQsnAs=;
        b=2AHhW498O6nfobCruh0JvRZopUaHbvNRK6ltU3z90itrKWS2lsPapatz93azPUNSP5
         kRqM9IR07ZToZeqLF3IMoVfCKzURSj1ZGeDu/SFfSFMY7zfjl0stLwfvfMDTKNCoaBVN
         HLlcOazD35B91+JCK+iIxJqwuFdpgp97MAo0PKpu4H5NeN6NXDFaDO5cXGgJIzxfVem/
         B7BkwADXCueOMaZJ6GruKIDxHW6aBWNRt1+etZkoH4z/ZUOI8uZuUtpVxLAyf7NzuOnQ
         Lrzmanz+QXbE8cTL5RY0f/VsbxIdOlCIfrx6xyykRauGkHIyGzAHgJ6O02Pna10yoFZw
         oY8g==
X-Gm-Message-State: AOAM5300giwCtMus0PLVggPbEmeT7hSNf1q1nvrQwEWwSnhukpIdPFCR
	K51THw0g7tR0EING5b0BCTX/KM4001V8x2q01wZXiCIIM+fpJPmzdzptV6LRe4sZA+3w5yvXV7i
	d8c9SfT3BQ/3akg==
X-Received: by 2002:a05:600c:2307:b0:39c:6ce3:2a06 with SMTP id 7-20020a05600c230700b0039c6ce32a06mr5166111wmo.113.1655225565159;
        Tue, 14 Jun 2022 09:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5BunCVsosucWoavBDPY6lzWcSo1OiPr/mn9lfLPq4bBSKJwytnaiIeTx4+dHmxx6DFSJVrQ==
X-Received: by 2002:a05:600c:2307:b0:39c:6ce3:2a06 with SMTP id 7-20020a05600c230700b0039c6ce32a06mr5166096wmo.113.1655225564904;
        Tue, 14 Jun 2022 09:52:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id i9-20020adfb649000000b0020fe35aec4bsm11994850wre.70.2022.06.14.09.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 09:52:44 -0700 (PDT)
Message-ID: <0265ad15-32c8-5932-9966-e4727577dd57@redhat.com>
Date: Tue, 14 Jun 2022 18:52:42 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <lkp@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
 Robert Hu <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>,
 Danmei Wei <danmei.wei@intel.com>
References: <202206132237.17DFkdFl-lkp@intel.com>
 <7a5d48d0-d1b5-91aa-8966-54d9ac986126@redhat.com>
 <Yqii3+EN1SnQYnMJ@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [kvm:queue 5/184] arch/x86/kvm/svm/avic.c:913:6: warning: shift
 count >= width of type
In-Reply-To: <Yqii3+EN1SnQYnMJ@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/22 17:01, Sean Christopherson wrote:
>> Ouch, saw this right after sending a pull request.:(
> KVM_WERROR=y is your friend.  Or in my case, my enemy for the last few days:-D
> 

I have it of course, but this one didn't reproduce on 64-bit systems as 
far as I can see.

Paolo

