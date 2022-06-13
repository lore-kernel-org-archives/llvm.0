Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575BD1119
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655115498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y6LBLP8vGdThcd/wDGDotPfVgo/e++F7Hh97I/WkOw=;
	b=hay5NHcjti05dU3gu3PK5BdahxMykIPgKRyrfKD6uR27ahOCylTHxLyRjONz7fPRYCfaV5
	+78NK4YMWa5p+3EfE0pWZvaR350n6Q7M3FyMIGBCzQQHb/5lphNJ1rGPySo9NHMaB1xTm1
	fX8XMZx+I4+D9KhB2J+U83Np2ASm7y0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-Ps5AtYCnPky7lGst6KUmPA-1; Mon, 13 Jun 2022 06:18:17 -0400
X-MC-Unique: Ps5AtYCnPky7lGst6KUmPA-1
Received: by mail-pj1-f69.google.com with SMTP id w36-20020a17090a6ba700b001e876698a01so6110530pjj.5
        for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 03:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6Y6LBLP8vGdThcd/wDGDotPfVgo/e++F7Hh97I/WkOw=;
        b=TznIKRK+H7dEd793zrCsYfZrh4YAjBdojovBWWEi9msEtIxiOisMpWzq50RBUbsnU9
         xmP2a4SzKdK612GGnnwEjap8Ee536wpsRfqLxkuC8hI9drKgrrdvAjTX9nbhUgxsEIBp
         pvB70z5DqYvP/ejWmSWXxlbi7o5jrK37y8PItNT5JB+y4MDeBt3MUdguZMsg+FNp9RUC
         zC3mt+6doj1RV5c90yN3U99qBtrW8ccZWsnnG25o5qrxGSG95Nz74ZjKM/lFskAj+x9D
         LQ1E5OWoDjVezvI0MM5atVmQ2egYmVpEM4mMNOq11rmFUR81ELtFKrGDcywx6haMS6eS
         2bhw==
X-Gm-Message-State: AOAM532PJ8LpHFC7fjI+s4xYFsTiQ57KAWNmTqBczRV8v4sTOZ+hNCVe
	Rp4f1FLtxr8gUb6/p+bWF3eGiWXJ+Fb5rS1kTKuzZYaeZ5pxxte/ujbmjqDDH6e+Niltrgrqrcs
	unh4pnHn4h4IXWQ==
X-Received: by 2002:a63:2d82:0:b0:3fd:fb59:d086 with SMTP id t124-20020a632d82000000b003fdfb59d086mr28986655pgt.334.1655115493839;
        Mon, 13 Jun 2022 03:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7a684auUil9oReuJ0aODWZ3lLKHHtKayRBZJltuNdJQInz3zbXqBZHYoTxCnZuhJVJwYFYg==
X-Received: by 2002:a63:2d82:0:b0:3fd:fb59:d086 with SMTP id t124-20020a632d82000000b003fdfb59d086mr28986627pgt.334.1655115493476;
        Mon, 13 Jun 2022 03:18:13 -0700 (PDT)
Received: from [10.72.12.41] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902820400b00163fbb1eec5sm4681348pln.229.2022.06.13.03.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 03:18:12 -0700 (PDT)
Subject: Re: [ceph-client:testing 7/9] lib/iov_iter.c:1464:9: warning:
 comparison of distinct pointer types ('typeof (nr * ((1UL) << (12)) - offset)
 *' (aka 'unsigned long *') and 'typeof (maxsize) *' (aka 'unsigned int *'))
To: David Howells <dhowells@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, ceph-devel@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>
References: <a1a3edde-7b44-eb09-6695-e7c57356b96e@redhat.com>
 <202206112305.4DdsErK8-lkp@intel.com>
 <1069138.1655106723@warthog.procyon.org.uk>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <0453285b-cf3e-9b98-3327-a835619619ca@redhat.com>
Date: Mon, 13 Jun 2022 18:18:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1069138.1655106723@warthog.procyon.org.uk>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xiubli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/13/22 3:52 PM, David Howells wrote:
> Xiubo Li <xiubli@redhat.com> wrote:
>
>> Thanks for the warning report.
>>
>> These was introduced by one DO NOT MEGE patch, which should go into mainline
>> via David Howells's tree IMO.
> That appears to have been fixed upstream.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1c27f1fc1549f0e470429f5497a76ad28a37f21a

Yeah, this will fix it.

Thanks David.

-- Xiubo


>
> David
>

