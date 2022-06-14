Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20527A
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 15:01:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id u37so381970pfg.3
        for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n3Z3Q/k7HSG6exH8gc+Mbf33wGJcooVYy9Jt7VeZHcI=;
        b=QHWQ4B9PyQb/+O8khCkKGr0oaWjZhpgcKi1DRpexHRDSvXnceHXOlYk/XFqoJp3mEn
         l/ofBKuQ91JYiOobjbnwRv4fVFc8e6M8FDiYzKwauqOHw0Fw/pFZUoL7rI8uLOtaivNX
         I8GG+1tkUHT3+nT61vTT8A0vOo/1CSclt1ZFZ5V9uR/WmkFC/tjZMRYh5T/pzn9rbcBj
         efZQQBs2qNq4t1oUVLuoS45krzaKbwF72JOXvG82Pn8a99pxNi9aYbEUT4OaPiWBSt7Z
         rIXHB0ZbPLjshKbe8NrqvHY685MKtIgJUe41q9WaKMa0taz1EJ09+Tmm8vb/1X6rkSNp
         xl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n3Z3Q/k7HSG6exH8gc+Mbf33wGJcooVYy9Jt7VeZHcI=;
        b=MqiALlVwY3p3aFB3qnApK1/wsb0SlZGf+e/kGpv746MMw0JDchBDDQNGUUpOtYHcGx
         3+VChS5vtz0/4JVh/DGdPWXcyAvuAxLX5QTtt2OW2SBkyheFpQPcNdZof9nxl/VxRiDH
         eqRiFZU2ZNW9SIBfJuJFef1ubkM7HlJj0xfDz0fxv8W+REpELYuOB3LpYGA/rE5/r8o+
         lmSTnxYyfgUl4D38nAlPUBquJsPz2L03KkamtrQkpIPhydvH9C+SpB28NmtwgxmQ9clN
         7IwlfHz6TMVyhUOVywlfK+B3KdUghMsUknB2gPeADLJPcg/0+TjQW4KjhmNWARA7jU7B
         GErg==
X-Gm-Message-State: AOAM530mQEOz8uunSQo2IVM48OAadvXxa+6qbB2vuonpawpeaiwN2yHm
	/v/Zp2yguPBlYB7M1ZeAZbwtIQ==
X-Google-Smtp-Source: ABdhPJwqbY/FIuqnPZS/XB2QtEVx9V2a5opDXcVaLC9AisFWbCe7pmTcXRBhGD+BGFO+bm3wdv1pyw==
X-Received: by 2002:a65:4809:0:b0:3fc:878:49df with SMTP id h9-20020a654809000000b003fc087849dfmr4882582pgs.557.1655218916110;
        Tue, 14 Jun 2022 08:01:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0015eb200cc00sm7328151plg.138.2022.06.14.08.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:01:55 -0700 (PDT)
Date: Tue, 14 Jun 2022 15:01:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kernel test robot <lkp@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>
Subject: Re: [kvm:queue 5/184] arch/x86/kvm/svm/avic.c:913:6: warning: shift
 count >= width of type
Message-ID: <Yqii3+EN1SnQYnMJ@google.com>
References: <202206132237.17DFkdFl-lkp@intel.com>
 <7a5d48d0-d1b5-91aa-8966-54d9ac986126@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a5d48d0-d1b5-91aa-8966-54d9ac986126@redhat.com>

On Tue, Jun 14, 2022, Paolo Bonzini wrote:
> On 6/13/22 16:49, kernel test robot wrote:
> >     902	
> >     903	bool avic_check_apicv_inhibit_reasons(enum kvm_apicv_inhibit reason)
> >     904	{
> >     905		ulong supported = BIT(APICV_INHIBIT_REASON_DISABLE) |
> >     906				  BIT(APICV_INHIBIT_REASON_ABSENT) |
> >     907				  BIT(APICV_INHIBIT_REASON_HYPERV) |
> >     908				  BIT(APICV_INHIBIT_REASON_NESTED) |
> >     909				  BIT(APICV_INHIBIT_REASON_IRQWIN) |
> >     910				  BIT(APICV_INHIBIT_REASON_PIT_REINJ) |
> >     911				  BIT(APICV_INHIBIT_REASON_X2APIC) |
> >     912				  BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |
> >   > 913				  BIT(APICV_INHIBIT_REASON_SEV      |
> >     914				  BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED) |
> >     915				  BIT(APICV_INHIBIT_REASON_APIC_BASE_MODIFIED));
> 
> Ouch, saw this right after sending a pull request. :(

KVM_WERROR=y is your friend.  Or in my case, my enemy for the last few days :-D
