Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7402564
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665479592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VThX7WbifVT6BXrss5grux5JWHQo9lFU0LPJWiFOeu0=;
	b=cQNTw/7yPgY9WnPQyybuLZ/c8xq6kXt1AFvfPoGCjkJi/rOP3kqpmwmzJxlbMDzO4iZH2s
	u+X8A6IqZTg49ElDXW14y1DxQc5WtQUAIvmrsU9DmIM78s5woNCLJFPUFQTdYydd3yBnbY
	/E/Dqvj7yqmzXv4rPEMhovgU9Ni37Bs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-x4WGEGnNMM-a4CNAlxxC6A-1; Tue, 11 Oct 2022 05:13:11 -0400
X-MC-Unique: x4WGEGnNMM-a4CNAlxxC6A-1
Received: by mail-ej1-f70.google.com with SMTP id ga20-20020a1709070c1400b0078db506c555so1852154ejc.6
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 02:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VThX7WbifVT6BXrss5grux5JWHQo9lFU0LPJWiFOeu0=;
        b=KpL+HKT74m9PbOIYzbOagQbf4fABbILI2hxPG9tV8j591UdihHvD+ViFq7cA1KJ9GU
         OjKc6npn5kItlYWWOBz0+ANu97YfyW9wZXiEVkAxTEs/dMWUQkWvpg0GXEQyKXEDshSV
         ms6v8tGTWLQGs3adUw/Rff64XRTsUprVL6xWgTf7F5u+zUK5azZWdBxgwpsf1htUovkr
         4T/bcNvSEGimY9uzenH0lAMPrvXHLgQngSyZt8KhJpcpvAE2trXHkmeIJ6sQ1p6nEtcM
         sKqRhG5lwzz4KFFHqBRB4dhz5A50r7f3BZF/oQF30Twtt5BN9bEtRVpd5zKZKs4zt3dr
         UI2g==
X-Gm-Message-State: ACrzQf1/2M3e2KUILgDNXecgLPxqLIZlJcqP2e1ZNeTnVKlQ2cw27UsZ
	5A1BjuFJ/fMu+W6dE6Fs6vRvzHA0pr8T8xvPgTa+LtNXknV6QD1D2c+i3A7qssfCITCbViEiGsB
	L7+v5I8B73hz9sQ==
X-Received: by 2002:a05:6402:42c3:b0:459:cebb:8d3a with SMTP id i3-20020a05640242c300b00459cebb8d3amr22291459edc.421.1665479589935;
        Tue, 11 Oct 2022 02:13:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7rwXi31GTGapUa9CJLiOZ/I3OJKRFG0ol4xHLIaRP/F+ZlHvFBopeGF9Nqar2zmSmyZrZuLw==
X-Received: by 2002:a05:6402:42c3:b0:459:cebb:8d3a with SMTP id i3-20020a05640242c300b00459cebb8d3amr22291444edc.421.1665479589769;
        Tue, 11 Oct 2022 02:13:09 -0700 (PDT)
Received: from ovpn-194-196.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b0078bfff89de4sm6573881ejc.58.2022.10.11.02.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 02:13:08 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Paolo Bonzini <pbonzini@redhat.com>, Sean
 Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Subject: Re: [linux-stable-rc:linux-5.15.y 4542/9999]
 arch/x86/kvm/hyperv.c:2185:5: warning: stack frame size (1036) exceeds
 limit (1024) in 'kvm_hv_hypercall'
In-Reply-To: <202210110411.z2fNZUCa-lkp@intel.com>
References: <202210110411.z2fNZUCa-lkp@intel.com>
Date: Tue, 11 Oct 2022 11:13:07 +0200
Message-ID: <875ygq910c.fsf@ovpn-194-196.brq.redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> Hi Vitaly,
>
> FYI, the error/warning still remains.
>
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> linux-5.15.y

...

>
> All warnings (new ones prefixed by >>):
>
>>> arch/x86/kvm/hyperv.c:2185:5: warning: stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall' [-Wframe-larger-than]
>    int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>        ^
>    1 warning generated.

For the reference, previous discussion of the problem:
https://lore.kernel.org/kvm/87zgg6sza8.fsf@redhat.com/

The patch to fix this:
https://lore.kernel.org/kvm/20221004123956.188909-19-vkuznets@redhat.com/

is part of "KVM: x86: hyper-v: Fine-grained TLB flush + L2 TLB flush
features" series (v11:
https://lore.kernel.org/kvm/20221004123956.188909-1-vkuznets@redhat.com/) 
which I hope to see in 6.2 (fingers crossed!), however, it is unlikely
to go to stable@ unless we know that there's a real problem to fix. I'll
backport it then.

-- 
Vitaly

