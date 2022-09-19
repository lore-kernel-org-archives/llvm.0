Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F1256F
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663593657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pJzkF9UKJ0JT/guvrtnnYyhgP8leVpTS5h5H8IUyZjs=;
	b=gj1H4nqkDcxH1Hyfkxo2LOMjrmTbm7k8Vd67pteVttXR0i1KXORXlABMqK5SgI6b2qg+nq
	NIy7Ag3m5Gjyelk35paKG6mNu7mF0Xuvtn9Zxiw6LJXqum50eS++L/EVFtuCuQsPMNEnvj
	tyon3OrXkXA+HQOjj5x6/0ENEiBO68k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-Ingp2PB0OZ6SrvpAMZKGzw-1; Mon, 19 Sep 2022 09:20:56 -0400
X-MC-Unique: Ingp2PB0OZ6SrvpAMZKGzw-1
Received: by mail-ed1-f72.google.com with SMTP id dz21-20020a0564021d5500b0045217702048so14788602edb.5
        for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 06:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=pJzkF9UKJ0JT/guvrtnnYyhgP8leVpTS5h5H8IUyZjs=;
        b=iZnaSFcQ06IhQYNNLtdBhaX2HXuFa0dKya5lp/j9l2PLIBahPKM8j3kgI5gw42L1PY
         wTxgW1OLXXPUNqYh82ouc/QZuRJxbwK0oV9rJsNNF02JLD5tkACgxMrIcyakW5uc+YlL
         +HPkxvEm+/XxGCOCEHPYkqsoyCKhRS+Ji7TVSAHgIoOFZcZgiszSNE3B6rB/lxSoCYmK
         isJEbUxNxh1IjujpI8FQNuEcEa1D36q4HCMmBE3ZYVmqWcOHDwweyx0ZvOCjcrwtb8p8
         e6iCqALMnkyKg4SE6EVkGcRH//yqAiVZRSK9NsK7Yp0rPjGtXLw+pY0T4QCwFMzdVL5+
         SMZw==
X-Gm-Message-State: ACrzQf1Nn6uDfr+JQ9KLKxYF/U4GtZGGVySowWfLo24Dn8eUi0suV6pJ
	CYMK3j7hZsK6jbcDuX7PyR6DzUd/vXiHS/VNjDaKkBMltLlHj0Sx1vk0PjdMcRBKECbwa6ID+jc
	X04tGYL3dWTUrOg==
X-Received: by 2002:a05:6402:379:b0:450:dc5c:f536 with SMTP id s25-20020a056402037900b00450dc5cf536mr15713191edw.298.1663593655495;
        Mon, 19 Sep 2022 06:20:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM769VhH9Ku3KP+FHMxt8AEvuX3TK5FYd3+2H7UhJ2/p7rIGwNNqM0Ah27nVjjauTwJTTEotvQ==
X-Received: by 2002:a05:6402:379:b0:450:dc5c:f536 with SMTP id s25-20020a056402037900b00450dc5cf536mr15713162edw.298.1663593655264;
        Mon, 19 Sep 2022 06:20:55 -0700 (PDT)
Received: from [10.39.192.161] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id s25-20020aa7cb19000000b004531b137e4bsm9551948edt.67.2022.09.19.06.20.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Sep 2022 06:20:54 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
 Pravin B Shelar <pshelar@ovn.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] openvswitch: Change the return type for vport_ops.send
 function hook to int
Date: Mon, 19 Sep 2022 15:20:53 +0200
X-Mailer: MailMate (1.14r5915)
Message-ID: <1A1ECEC1-5CCE-4D86-A116-D291C88743C0@redhat.com>
In-Reply-To: <20220913230739.228313-1-nhuck@google.com>
References: <20220913230739.228313-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain



On 14 Sep 2022, at 1:07, Nathan Huckleberry wrote:

> All usages of the vport_ops struct have the .send field set to
> dev_queue_xmit or internal_dev_recv.  Since most usages are set to
> dev_queue_xmit, the function hook should match the signature of
> dev_queue_xmit.
>
> The only call to vport_ops->send() is in net/openvswitch/vport.c and it
> throws away the return value.
>
> This mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

The changes look good to me.

Acked-by: Eelco Chaudron <echaudro@redhat.com>

