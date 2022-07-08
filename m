Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E577A
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657274932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R31VwcSPJiQ7JIw87RxF+TN0+eL/CdtqRF2EIROnvwo=;
	b=A8RuLRs2WeW+xuloAq0M+wdqbbic0CP1VXOHD06JWcQjkcyq0yABos+S4i/ZJ8nc4nY9rq
	iMrRIonCJBnYJotWSCnWeYsLwmet1nkmltBMoZ4n6C8otkFf2eGpnXu+phyjufGXWsMy0M
	8WHaP+dp2TjS/poZvzY9wcuTv+0rWIE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-nqkLro3zMXWfohlbglub1w-1; Fri, 08 Jul 2022 06:08:50 -0400
X-MC-Unique: nqkLro3zMXWfohlbglub1w-1
Received: by mail-wr1-f72.google.com with SMTP id j16-20020adfa550000000b0021d63d200a8so3067363wrb.5
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 03:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R31VwcSPJiQ7JIw87RxF+TN0+eL/CdtqRF2EIROnvwo=;
        b=wimHuvJdt9sNKI/NRUNl1g/AESHrH86hBtCcxxMtnGcfGdsPEEl9gq9m81r5HH7/Q6
         4ZmTfX3ELLjPqGV3AddRl7cAtTtVrjwizyqfmVZvD1UKAiNHw4RU5jamdVScE7qgw2X1
         DkWg2zN6sowjNwpI7LJQt4cVlK8DxNyw7HhCUJAfDJT1Q0kt1I795+o7yv3+U8f6tkVd
         RSXX9JOiWrhkSPVMZu0QkhRYCWwzCR7D7DmzqCLxYrGm8AKwDPAE/KeMEKFQqGdPwi3d
         HsaC2KaCsnssa+oZ6OqNOaVuWPASbFtzgUG4+bKITaYLZJWO5KleNvVOV83GNJ2JFSEM
         eKQQ==
X-Gm-Message-State: AJIora8GsfAGIbQtcN4YK9yMLHtJCBh8hwuIRu3BI64GMIh0g557g2AQ
	sXIr9XGBeIak8g2vy4or+tC7R1kkzMUmBbZF8UZk5LHkqSrgyG0CRqDprBPQAa+gsbccX6sbu6Y
	mO8FbyHATny2hLA==
X-Received: by 2002:a05:600c:4e8b:b0:3a0:5826:3321 with SMTP id f11-20020a05600c4e8b00b003a058263321mr2822305wmq.108.1657274929750;
        Fri, 08 Jul 2022 03:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1syukJVbZC5Q5vHTRyn7SXZAqXHIKjGpeSBXFwl4fsGgBLNx7VcuUla/SxRd4bJfBA7oD8ULA==
X-Received: by 2002:a05:600c:4e8b:b0:3a0:5826:3321 with SMTP id f11-20020a05600c4e8b00b003a058263321mr2822281wmq.108.1657274929580;
        Fri, 08 Jul 2022 03:08:49 -0700 (PDT)
Received: from debian.home (2a01cb058d1194004161f17a6a9ad508.ipv6.abo.wanadoo.fr. [2a01:cb05:8d11:9400:4161:f17a:6a9a:d508])
        by smtp.gmail.com with ESMTPSA id z10-20020a1cf40a000000b003a2c7bf0497sm1654705wma.16.2022.07.08.03.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 03:08:49 -0700 (PDT)
Date: Fri, 8 Jul 2022 12:08:47 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Justin Stitt <justinstitt@google.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Tom Parkin <tparkin@katalix.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] l2tp: l2tp_debugfs: fix Clang -Wformat warnings
Message-ID: <20220708100847.GA26192@debian.home>
References: <20220707221456.1782048-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220707221456.1782048-1-justinstitt@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gnault@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2022 at 03:14:56PM -0700, Justin Stitt wrote:
> When building with Clang we encounter the following warnings:
> | net/l2tp/l2tp_debugfs.c:187:40: error: format specifies type 'unsigned
> | short' but the argument has type 'u32' (aka 'unsigned int')
> | [-Werror,-Wformat] seq_printf(m, "   nr %hu, ns %hu\n", session->nr,
> | session->ns);
> -
> | net/l2tp/l2tp_debugfs.c:196:32: error: format specifies type 'unsigned
> | short' but the argument has type 'int' [-Werror,-Wformat]
> | session->l2specific_type, l2tp_get_l2specific_len(session));
> -
> | net/l2tp/l2tp_debugfs.c:219:6: error: format specifies type 'unsigned
> | short' but the argument has type 'u32' (aka 'unsigned int')
> | [-Werror,-Wformat] session->nr, session->ns,
> 
> Both session->nr and ->nc are of type `u32`. The currently used format
> specifier is `%hu` which describes a `u16`. My proposed fix is to listen
> to Clang and use the correct format specifier `%u`.
> 
> For the warning at line 196, l2tp_get_l2specific_len() returns an int
> and should therefore be using the `%d` format specifier.

Acked-by: Guillaume Nault <gnault@redhat.com>

