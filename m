Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C26137F
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 17:07:43 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id h23-20020a17090a051700b001c9c1dd3acbso3096227pjh.3
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jtEot92E1tB29snoZI4bxj37j8h8fzOPgNXWBl3sd1o=;
        b=srp5aSyzBqCFGgsTM9653BR8R/cCjRg5uEvYnKYG1U7R4R7CU4DF9T8VZdSsZH7PVH
         oVaiOLEH44dHGuCt7omnSC9gHFk6Hy+mBkb0nIMxm09/0s73kgJwoW1jU9NRFZygN69Q
         8gbc8DaMZzWirihOqTRxO5JXFzs/3A4sSsxWVcAYOBLAFLIAmmCSOccC2lEp9uVM2W5A
         oyiisH+Gufp0gkmwvzlEr+bdseazfCbJferl5JoAcqBmWbiCZv+/hQjtlJpQUtdgkdKR
         NGeN5lZgvutPsjRxkO9SBUO8zP09eZtUXaqqKwA15tBb2lZtvUbKQwhcqRKwtx61wxY4
         rRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jtEot92E1tB29snoZI4bxj37j8h8fzOPgNXWBl3sd1o=;
        b=BZXQMrevAXTy5gvmPwFBtXyzmt1fnE7QZHNgVqybBphachVswNG7o8RZXWq4p7YSFJ
         jve5wR9dTLoNaMonpkerTGeX5MMoSGSuSjiSCwtvxCF1fuuXtWNYx0ybK5nuds8VQQU1
         3oVqCNA7xkcNxlkoxsKuEjmA2ocT+9N/WcUdDSZddPCGUDftq2unUucoVG5ZKRhplco9
         T6Ely2HiILoG67j8oUh7g1AEOnmzozWIQnJDiArCa5iUwV5hhC4EVwajb+zlyqvaHBdP
         k9sZp6hL/sg7fdo1FZGEQ3dyD+bYXxSrbzRKemr+SLUE1Ru5ig4OxBFxWiB3gtVBCPAO
         I+aA==
X-Gm-Message-State: AOAM530Ym3JL6OJe+1BwooPpkmYVe4PEBW6/G+58765UEb7oF5X8V8nW
	p0yJkwNVaivz4AR6y3HOqII4jg==
X-Google-Smtp-Source: ABdhPJzZ+hsGY9FdceFKLN1LfHliorxPb2CTKJTjB/Qs06ibri0zwUxPCfJGWYORWkUYy1HpipvhCw==
X-Received: by 2002:a17:902:9043:b0:14f:aa08:8497 with SMTP id w3-20020a170902904300b0014faa088497mr11396034plz.109.1648832862452;
        Fri, 01 Apr 2022 10:07:42 -0700 (PDT)
Received: from [192.168.254.17] ([50.39.160.154])
        by smtp.gmail.com with ESMTPSA id w4-20020a056a0014c400b004fb0c7b3813sm3775518pfu.134.2022.04.01.10.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 10:07:42 -0700 (PDT)
Message-ID: <73ef2cba-706a-0b75-4b72-65fda595d1aa@linaro.org>
Date: Fri, 1 Apr 2022 10:07:41 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/5] x86: uaccess CMPXCHG + KVM bug fixes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
References: <20220401075311.707166-1-pbonzini@redhat.com>
From: Tadeusz Struk <tadeusz.struk@linaro.org>
In-Reply-To: <20220401075311.707166-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/22 00:53, Paolo Bonzini wrote:
> Queued, thanks.
> 
Hi Paolo,
Where is that queued on? https://git.kernel.org/pub/scm/virt/kvm/kvm.git/ ?
I don't see it there.

-- 
Thanks,
Tadeusz
