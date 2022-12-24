Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A05A210A
	for <llvm@lists.linux.dev>; Sat, 24 Dec 2022 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671873521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxublDXwR8D5DtOHl7/e/B0PH3ei1t0qPkoztnwEfr0=;
	b=DuV0HZwKUHRG0ecRZdF+V4AQE09gK3vQlY41Q5ZDYRYkhI7L2Ko0smA8qOfVSzYVXNvNq3
	Akq6frxjHaKWgWcBb5w6lr8lzHV2hji2CNTOLA7YbAg6LYgSql/ynJWMdZ+FRKOkgE8iqJ
	1gk4senF3TSWTX7AkJxhs9XHdVIklQ0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-fTbhNuy0OReRxe6m6gkUfg-1; Sat, 24 Dec 2022 04:18:38 -0500
X-MC-Unique: fTbhNuy0OReRxe6m6gkUfg-1
Received: by mail-ed1-f69.google.com with SMTP id g14-20020a056402090e00b0046790cd9082so4993121edz.21
        for <llvm@lists.linux.dev>; Sat, 24 Dec 2022 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxublDXwR8D5DtOHl7/e/B0PH3ei1t0qPkoztnwEfr0=;
        b=jzEjFNCDaJPkufxZ3RiKMa39GbQaRK3TvC6XBUL+hU9ruBKy3Q//dbEzV19PICJRa5
         e6w9N1uqkmZyZU4rru7uy0L/MDqm9yxISfEmi+cqmesyC3pxqoqnIMaKzSNUFAwgPRVd
         YLfhnkxw+ZO2U02XoERa3ssI7OdZL3+QvVxz7jFjwoInXpT8+8zWHToiyYmfYynGKqqV
         twSeHDV43JCQViTABmYFQhAyTS86abD/mEPeu+B+LP/v2bX+Q1J8HO7mYMcimypZMjVE
         tM50UpcXJHK9uZZgZvh479XKzLMfih95EFrsET0AVpumyHDJg8EJai+YfcSldnJVC0wB
         zEGg==
X-Gm-Message-State: AFqh2kpEBGPBhaQeM40rLcRJEBiMt67CCvzs9Iva2ihKT49Cf3jquXlh
	0mO35yw+iBVzsOXup2T53CD+oXOPqmGoE8PfXcmB+wKHWqV1i2tGADEwbiLpye6xdQRJRUZM2WO
	WAHlAmP0nQf8IDg==
X-Received: by 2002:a17:907:20b0:b0:7d3:8159:f361 with SMTP id pw16-20020a17090720b000b007d38159f361mr10353244ejb.36.1671873517897;
        Sat, 24 Dec 2022 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzaX4Vch7tXx6y3KWiTjg6uUOEDxqKJ4lnD0J2K3STImlt9Y+l7L7jqIYGtkrdkVnkKuq68w==
X-Received: by 2002:a17:907:20b0:b0:7d3:8159:f361 with SMTP id pw16-20020a17090720b000b007d38159f361mr10353228ejb.36.1671873517691;
        Sat, 24 Dec 2022 01:18:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id kx20-20020a170907775400b0078d3f96d293sm2338931ejc.30.2022.12.24.01.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Dec 2022 01:18:37 -0800 (PST)
Message-ID: <4f789996-28aa-1d9c-f918-03de663d28b8@redhat.com>
Date: Sat, 24 Dec 2022 10:18:35 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 10/14] KVM: selftests: Include lib.mk before consuming
 $(CC)
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
 Aaron Lewis <aaronlewis@google.com>,
 Raghavendra Rao Ananta <rananta@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-11-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221213001653.3852042-11-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/22 01:16, Sean Christopherson wrote:
> Include lib.mk before consuming $(CC) and document that lib.mk overwrites
> $(CC) unless make was invoked with -e or $(CC) was specified after make
> (which apparently makes the environment override the Makefile?!?!).

Yes, it does.  In projects that don't use configure or similar, you 
might have seen

CFLAGS = -O2 -g

to be overridden with "make CFLAGS=-g" if optimization is undesirable.

Paolo

> Including lib.mk after using it for probing, e.g. for -no-pie, can lead
> to weirdness.

