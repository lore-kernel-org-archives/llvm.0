Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A372626
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660290553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9aXlR/Mplh04GQrDWgRazGoxB/j8ggsCOd7dQOiifk=;
	b=N9SGhwdL/F97Ndjir5hSfC2kftqzFY879YzdXgyezATiS1JhCaypaczBhOGUkF3Sk5Ie3X
	ArKM9bMwgkUgVs3NWosUkN9V4SJtbdarbPDQA6H1oyHajus+QwoWoN8QLdZwUosQzU+S55
	2JVGkkGiRE83xDQyaeSMGuEMgpPUCk8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-qv7mCe5oOEm3FAZsWxyctw-1; Fri, 12 Aug 2022 03:49:11 -0400
X-MC-Unique: qv7mCe5oOEm3FAZsWxyctw-1
Received: by mail-ed1-f69.google.com with SMTP id z6-20020a05640240c600b0043e1d52fd98so166043edb.22
        for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 00:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=P9aXlR/Mplh04GQrDWgRazGoxB/j8ggsCOd7dQOiifk=;
        b=zRCx9GNN0emXlsVPzMHCMZksZIe7QcJ4BYPis7sJJ+MOqyzOV5aTSJVEzO+nnwnOyG
         w9TAqZFtBiFbbSRGiWNYwlwGhw9oHWwDpnDE100JJNBokOVcc09dUZZsMbEsig30bjEc
         kpb1KKEak7/2OiFIISQN5NsVfcYdrjN2/R1OkLaLJM9sO7facHzCmXFu8EAc+u/hHH+x
         cgJKq4WI+DY6QSlxkScwX51mniVxejJOJf1p/hOuF5Mt5wx+NeIr55EJ9hGZ2guIZNf7
         xeeGtITJb1m2vrS/xH3Jw+um0lSw6Mk4R5Hw7tlw2hpvDnBUealUqwcj0UB+V+24OCLB
         BqWA==
X-Gm-Message-State: ACgBeo1PrwYO/hE7je4fkEOEK2rvCAriKFEgkI/exCy2quyDWfZEk3ih
	U5+fRQg2JDsqW6G35bzXUQlRGjrnn+U0nHNIwYyfkG7w2J7mN4XltZDVxUDS4k48g9vQd5QoMiZ
	yRmDsXKX/lM2Z6g==
X-Received: by 2002:a17:906:7309:b0:731:5c2:a9a6 with SMTP id di9-20020a170906730900b0073105c2a9a6mr1927018ejc.486.1660290550930;
        Fri, 12 Aug 2022 00:49:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73en81mvQ3rlFGU0JoyKHAlXz7aryxpJTcMdrGUL8WTRn6f+/V2wLGkqFs5NiqLB0R0djPNw==
X-Received: by 2002:a17:906:7309:b0:731:5c2:a9a6 with SMTP id di9-20020a170906730900b0073105c2a9a6mr1927001ejc.486.1660290550764;
        Fri, 12 Aug 2022 00:49:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id f7-20020a056402068700b0043ce97fe4f7sm937094edy.44.2022.08.12.00.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:49:10 -0700 (PDT)
Message-ID: <a9035e7c-4587-6df7-c16c-e656d1734145@redhat.com>
Date: Fri, 12 Aug 2022 09:49:07 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/2] KVM: selftests: Fix Clang build issues in
 KVM_ASM_SAFE()
To: David Matlack <dmatlack@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>,
 Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@google.com>,
 "open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>,
 kvm list <kvm@vger.kernel.org>
References: <20220722234838.2160385-1-dmatlack@google.com>
 <CALzav=frNna1fZYTxwz+Lo=1=zsOLAKoAd3pntXfUiDNdJ_PoA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CALzav=frNna1fZYTxwz+Lo=1=zsOLAKoAd3pntXfUiDNdJ_PoA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/22 00:53, David Matlack wrote:
> On Fri, Jul 22, 2022 at 4:48 PM David Matlack <dmatlack@google.com> wrote:
>>
>> The LLVM integrated assembler has some differences from the GNU
>> assembler, and recent commit 3b23054cd3f5 ("KVM: selftests: Add x86-64
>> support for exception fixup") seems to be tripping over a few of those
>> differences.
> 
> Paolo, what do you think about these changes? I'm still hitting the
> mentioned Clang build issues on kvm/master, commit 93472b797153
> ("Merge tag 'kvmarm-5.20' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into
> HEAD").

I had missed them, so thanks for pinging.

Paolo

