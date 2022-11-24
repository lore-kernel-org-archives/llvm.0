Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E421FB5
	for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 12:31:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so1150291wmg.2
        for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 04:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JU48m0AZrUyT2++X8e6FIEgULoXPLA3Dizh2n0L4e4=;
        b=nJ6yamWSxD9zSs4XqTzdk3DVALEFwHbQ3n1O5P4YrQfjn7uW1WBF2+YyK6k3jZK4MZ
         etuI3RTbnbLC0iU9XyYt8yClLsJlp9Viq8LoTQyTUtNJbeB4JDj9yjLFGfdox3Pc5Typ
         l4XQ/1dSAgwU3MOnNfO2Pn8vl5jEQ5CzWgWliSG2++AriiPRCYvAeU4swi6mAZ1559/3
         1X0yRZSjGVAfN8SvohzUT6MS7YY0GUnjSUdvknH4RNjKimLWcf+Y8pOFxbuHwV08CGdW
         zBccIBYo8UHXCrf3rXKWno1qTO9YJ7Qh/KNDKAM16F+uB4vNag3UrdygWjjUaQ6fMCtw
         QIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JU48m0AZrUyT2++X8e6FIEgULoXPLA3Dizh2n0L4e4=;
        b=mQQofwuw8mm+tQgrxhuV9yEBKOCGUDM29W5rnL+YS+VZLqK2YMa5rAEIyR8u1XHxED
         W1Vvy9cvh6w09YpxGR+LAFGXLcmcMIq82YErvwyHy9ypi2lkSa1CXVEpNIgK6n0dmOAV
         QAZix57RhoYBS7iay2Hz6AEJh9sSX0uVn+vsTEI/A6VhPM0U3PcFc8wjmfRw1Mq5YeEC
         XHHQAQII5HB9qD1yTL0O+vyOWIzQBf1J9+08pMRf0V9oRX7Jy2UE6Z6E449Wvt0HB3Kg
         jUgMoFQnDLxaxw9CCmZaVroiAwQc4zbAf8fzRH9fuxZvroxqnOMk1MI4FnloCKruYPTB
         /XKw==
X-Gm-Message-State: ANoB5pnEAylzRuqzrE248ZtCvdprGMUSX1XwR36vQLEEYl5bpN1/0HSL
	JyaHCtKbnG56FK9z8H2cyrwMAHHkm5UbSA==
X-Google-Smtp-Source: AA0mqf4ONt6wFJvL1KocMtvj2hyw+ebBrslVU+JVZ/egvfjZFFv6tWRwHRPExuFK5D7UQ6tFo8BDWQ==
X-Received: by 2002:a05:600c:3d0c:b0:3cf:f66c:9246 with SMTP id bh12-20020a05600c3d0c00b003cff66c9246mr11340007wmb.27.1669293096142;
        Thu, 24 Nov 2022 04:31:36 -0800 (PST)
Received: from google.com (65.0.187.35.bc.googleusercontent.com. [35.187.0.65])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4243000000b00241e4bff85asm1180970wrr.100.2022.11.24.04.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 04:31:35 -0800 (PST)
Date: Thu, 24 Nov 2022 12:31:31 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: samitolvanen@google.com, nhuck@google.com, ndesaulniers@google.com,
	kernel-team@android.com
Subject: Bug: MODPOST mismatch ignored due to LTO
Message-ID: <Y39kI3MOtVI5BAnV@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

It seems that enabling LTO breaks the check for section mismatch in modpost.

If I create on purpose a mismatch here's the output without LTO

check_section_mismatch()
  fromsec=.text
  tosec=.init.text
  sym=kvm_arch_vcpu_create

=> section mismatch in reference: kvm_vm_ioctl_create_vcpu (section: .text) -> kvm_arch_vcpu_create (section: .init.text)

While with LTO:

check_section_mismatch()
  fromsec=.text.kvm_vm_ioctl_create_vcpu 
  tosec=.init.text
  sym=kvm_arch_vcpu_create

=> mismatch ignored, the section ".text.kvm_vm_ioctl_create_vcpu" is
unsurprisingly unknown

LTO seems to append the symbol name to the section which is a problem for
modpost.

Is that a known issue?

Thanks,
Vincent
