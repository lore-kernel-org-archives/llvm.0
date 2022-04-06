Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF233C7
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649266399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsflgPsqFmMeboA+E+ObIhwzjD0l7tM2YPcfbgODEK4=;
	b=Wa+bVKOC/Ik5yHxsGnMLpWs687dsiHBW/heQwTeUjksykHx+RhJBMUk9KLlN+kVcgzS1P+
	i47aEG84Ulcw+Ov7GmNcRv5ZcglF1eSvZTLZoyCDXbVTdx04GlzQA5v2K1jVLpafK5+9gv
	Sjwb2zg09lsr24B4sCZqOXV3v9oOOKI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-_Wb-hyM0O_GCtwMmTqE5nQ-1; Wed, 06 Apr 2022 13:33:18 -0400
X-MC-Unique: _Wb-hyM0O_GCtwMmTqE5nQ-1
Received: by mail-ed1-f72.google.com with SMTP id p14-20020a05640243ce00b0041cbccbe008so1584849edc.16
        for <llvm@lists.linux.dev>; Wed, 06 Apr 2022 10:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JsflgPsqFmMeboA+E+ObIhwzjD0l7tM2YPcfbgODEK4=;
        b=StUJ4xGq92A+0M/a79aY2agB09P626qvvDXrDm2lKfMAJu32n5GpBXwSAwOvWVg0cy
         I78hVQMGZe/xyDKcuonzT/NV/nbddlSDD4VuH4xJlovjekQhhLH7KBf2H+8CiIIq9ZMx
         1EWGxJ8df7nY7voGo9nYsSlQ8b+n6zmMBYD9SHsAqYAGTx9CijManQHi3rcFpfrhtJUk
         8IzOQ3RjV9qQYNRNG+BduPHxYdd/6ZeYkpgt3j3KC8vYztiSgRCVcwTqDFsDGULuRLQG
         igh8hzdDkTInXJPzosVMlGrAppbu9r7Pex3N8Vp4DgnUufZBgH+uAW89q4xA/2BqHZVG
         2SWg==
X-Gm-Message-State: AOAM53147OwbM7W3hg3xPkEvQHucOBdV36xs8ac0A5SvFfZoV7aVx/u5
	kaY3baL1/Iipj+RCKUrnaJBNbYhOR2mWOk+OBR5scUzbWF1KzylCdtKzmysxhBFq5VGqLy/HShY
	nyduEzqkdKR+GYA==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id x17-20020a170906299100b006cdac19ce34mr9458068eje.746.1649266397442;
        Wed, 06 Apr 2022 10:33:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymsJF1UHVP+8vuPjco6L6obKdcfN6lM3rJUdqFr1Q2lEaGhsfxKtM9Tn7BrlIx1igdunVYIw==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id x17-20020a170906299100b006cdac19ce34mr9458047eje.746.1649266397198;
        Wed, 06 Apr 2022 10:33:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id k14-20020a170906128e00b006e4b67514a1sm6871372ejb.179.2022.04.06.10.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 10:33:16 -0700 (PDT)
Message-ID: <7108f263-5cda-d91d-792b-d3f18b63c6d7@redhat.com>
Date: Wed, 6 Apr 2022 19:33:15 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [syzbot] upstream build error (17)
To: syzbot <syzbot+6b36bab98e240873fd5a@syzkaller.appspotmail.com>,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 jmattson@google.com, joro@8bytes.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com,
 seanjc@google.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
 vkuznets@redhat.com, wanpengli@tencent.com, x86@kernel.org
References: <000000000000008dae05dbfebd85@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <000000000000008dae05dbfebd85@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/22 18:20, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    3e732ebf7316 Merge tag 'for_linus' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10ca0687700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=eba855fbe3373b4f
> dashboard link: https://syzkaller.appspot.com/bug?extid=6b36bab98e240873fd5a
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+6b36bab98e240873fd5a@syzkaller.appspotmail.com
> 
> arch/x86/kvm/emulate.c:3332:5: error: stack frame size (2552) exceeds limit (2048) in function 'emulator_task_switch' [-Werror,-Wframe-larger-than]
> drivers/block/loop.c:1524:12: error: stack frame size (2648) exceeds limit (2048) in function 'lo_ioctl' [-Werror,-Wframe-larger-than]

I spot-checked these two and the stack frame is just 144 and 320 bytes 
respectively on a normal compile.  This is probably just the effect of 
some of the sanitizer options.

Paolo

