Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7072F7C
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9NJS7vTeV+3f52O3a1sXabKwOSd+YPOK4Fgue9n4dN8=;
	b=ZNdkPki2fQuEujwbm5KgJteuvOCzjI8lD+67wrVk3RmsaIrkRjtCyhgsx+RvX8Xx3pxrxc
	+Ml11wVkiz3pdmIDj9TXX+iKdWdd2/8oeLykxMd7LZCKC2XiyjgLlssDgbJuRrg/BxJRt1
	CxK+E/qsOklCYlGWcanNR33lZcsJxN0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-Rf46MZ5INrC32gpARx2sRQ-1; Tue, 14 Jun 2022 08:12:46 -0400
X-MC-Unique: Rf46MZ5INrC32gpARx2sRQ-1
Received: by mail-wr1-f70.google.com with SMTP id m24-20020adfa3d8000000b00219ea0ecfbaso1248009wrb.16
        for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 05:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9NJS7vTeV+3f52O3a1sXabKwOSd+YPOK4Fgue9n4dN8=;
        b=Bgee1MhdH7CEBF7ps7qe8XSZuX6AN3ItKey8gWyO94PW2iCyfTftvqfDT80fvy4DlM
         4g8rMYSuTMuSggt3nm03S14VP/RljlwpQz8Hlg15h1qJNHQiSj/KodIIPeavftCAu7OM
         cgkPM38wyldWRjsg1DuXM74fHRxQKHIQe46nKkNP/bubj/fkhYrKJAsT9dlMWl7SgkVD
         a+xCNt9dXAxPhNvZE0qTL61C5/x8E2T0L26XJL7igUi0PeiXbszFq5tK/xOx5z2Y0No1
         /zesR7eXfCBx3kXJrhWDs/QYavkcaDzbgphagQrt4fE3alaRxfcQQ5p1suEr3yPzNs4F
         tnhA==
X-Gm-Message-State: AOAM530hjKYunf9w/4p5X0fLY4phOugnpwMuWMoiKH8MEMo0ItssdK7C
	nj9CBClib8FJvZE+uppF1Kz3Bw5aUX7rGDY3eAPugvfBDy9Ww2XZRGEmQvCobvCOLNp6ajG1Ql8
	7Ts+fNrS/1pAZRA==
X-Received: by 2002:a05:600c:3551:b0:39c:8a93:869 with SMTP id i17-20020a05600c355100b0039c8a930869mr3733103wmq.107.1655208765108;
        Tue, 14 Jun 2022 05:12:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEXTquH8/sxyWSRyBCfv+emQNXo3WD5eknmqSPFC9vd0yNZB55lljxFkUFtPUVzYuR4l3yEw==
X-Received: by 2002:a05:600c:3551:b0:39c:8a93:869 with SMTP id i17-20020a05600c355100b0039c8a930869mr3733075wmq.107.1655208764777;
        Tue, 14 Jun 2022 05:12:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id 63-20020a1c1942000000b0039c84c05d88sm12472762wmz.23.2022.06.14.05.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 05:12:43 -0700 (PDT)
Message-ID: <7a5d48d0-d1b5-91aa-8966-54d9ac986126@redhat.com>
Date: Tue, 14 Jun 2022 14:12:42 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [kvm:queue 5/184] arch/x86/kvm/svm/avic.c:913:6: warning: shift
 count >= width of type
To: kernel test robot <lkp@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
 Robert Hu <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>,
 Danmei Wei <danmei.wei@intel.com>
References: <202206132237.17DFkdFl-lkp@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <202206132237.17DFkdFl-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/22 16:49, kernel test robot wrote:
>     902	
>     903	bool avic_check_apicv_inhibit_reasons(enum kvm_apicv_inhibit reason)
>     904	{
>     905		ulong supported = BIT(APICV_INHIBIT_REASON_DISABLE) |
>     906				  BIT(APICV_INHIBIT_REASON_ABSENT) |
>     907				  BIT(APICV_INHIBIT_REASON_HYPERV) |
>     908				  BIT(APICV_INHIBIT_REASON_NESTED) |
>     909				  BIT(APICV_INHIBIT_REASON_IRQWIN) |
>     910				  BIT(APICV_INHIBIT_REASON_PIT_REINJ) |
>     911				  BIT(APICV_INHIBIT_REASON_X2APIC) |
>     912				  BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |
>   > 913				  BIT(APICV_INHIBIT_REASON_SEV      |
>     914				  BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED) |
>     915				  BIT(APICV_INHIBIT_REASON_APIC_BASE_MODIFIED));

Ouch, saw this right after sending a pull request. :(

I'll do the fixup.

Paolo

