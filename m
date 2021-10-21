Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978252C80
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 19:21:50 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id o184so2385045iof.6
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding;
        bh=OoSkpRzjLKQ5u06P/45xU7uH8Rb3tyeHtxdYA2h0eYw=;
        b=K3wabqXzcWjDQp7bq+BpwGmAYhIOz7Sci+y4S2U/vZr9WhLOwBxZ9I7g27AHdarb2P
         o2n4ELPoz1kE/x2E2MeJKtv99XHxIWHmOsScnrtGHKj9qBeb8nGzP1WmdVuX8xWpzEgb
         ZtgyCGWpQG9vEkoQUeda6gZk7F9GzXyJjXX4bDNUNAXwOiYs8HUan7yuPuehorh3p3cO
         v/yA5ondJx75vr2tDbvuD/EvzwvxajA0ev5jn8n9XbdoHnSeaWWm5WAyY2SuYlLNcyrk
         +s3sK7TV1MV+0h4aFbmiKsyGy/TjdUOWOYcrGwXQX3lDJZJn1wPCXFoiWIAzYf+wO9sD
         EIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding;
        bh=OoSkpRzjLKQ5u06P/45xU7uH8Rb3tyeHtxdYA2h0eYw=;
        b=I0/mXYSueHtinrSG44FHeSIhwftnifNWx/dSRszVTu5qYi5Nj5CtmuTaoxG+A1BIf6
         jdkDIblaW71Uv6n0WGYmeZQj7qoNH7VwP4PJ1gIPjyvkVWTXXcMWmMvkqZCJ/c294qUo
         l3UEUNNMbkKXEGFitrn/G36xYeE8obiE+3S46mCs3AL2o+QeuInZpF3LveADelXOrvjN
         4/x6nDrjNPmB+c47zIXH0crd2HiqYyWhvwwhJ6yfaAou6ZkTcQfF30Vb+sIfPWxcRRMZ
         vbUemiQlW/76oSI8fDCPT1Qm7JWzuv3RHLnPx9GW9zLT8TrKBE9ZmsEv+OXulKjwccZu
         Jozg==
X-Gm-Message-State: AOAM530d7OscseEfTpsUY5yeUkyaJpidD4I5GTdRwCDh3Q5o8gHGEbry
	HRXTvjZx1Y9LYhbLNiH7yAk=
X-Google-Smtp-Source: ABdhPJxFm3mFAM30OQBPDX49zx9fL7ZfUKt9sUSsIbaRmbUd2W4ZStXhNAzNzqfbTSUNLPpdYUxpvg==
X-Received: by 2002:a02:2a04:: with SMTP id w4mr5123085jaw.107.1634844109711;
        Thu, 21 Oct 2021 12:21:49 -0700 (PDT)
Received: from localhost ([172.243.157.240])
        by smtp.gmail.com with ESMTPSA id s17sm2927857ioc.28.2021.10.21.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 12:21:49 -0700 (PDT)
Date: Thu, 21 Oct 2021 12:21:41 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Pu Lehui <pulehui@huawei.com>, 
 ast@kernel.org, 
 daniel@iogearbox.net, 
 andrii@kernel.org, 
 kafai@fb.com, 
 songliubraving@fb.com, 
 yhs@fb.com, 
 john.fastabend@gmail.com, 
 kpsingh@kernel.org, 
 nathan@kernel.org, 
 ndesaulniers@google.com
Cc: netdev@vger.kernel.org, 
 bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 pulehui@huawei.com
Message-ID: <6171bdc513e4e_663a7208a5@john-XPS-13-9370.notmuch>
In-Reply-To: <20211021123913.48833-1-pulehui@huawei.com>
References: <20211021123913.48833-1-pulehui@huawei.com>
Subject: RE: [PATCH bpf-next] samples: bpf: Suppress readelf stderr when
 probing for BTF support
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Pu Lehui wrote:
> When compiling bpf samples, the following warning appears:
> 
> readelf: Error: Missing knowledge of 32-bit reloc types used in DWARF
> sections of machine number 247
> readelf: Warning: unable to apply unsupported reloc type 10 to section
> .debug_info
> readelf: Warning: unable to apply unsupported reloc type 1 to section
> .debug_info
> readelf: Warning: unable to apply unsupported reloc type 10 to section
> .debug_info
> 
> Same problem was mentioned in commit 2f0921262ba9 ("selftests/bpf:
> suppress readelf stderr when probing for BTF support"), let's use
> readelf that supports btf.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---

Thanks.

Acked-by: John Fastabend <john.fastabend@gmail.com>
