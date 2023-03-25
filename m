Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A40379
	for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 01:20:27 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d13so2976107pjh.0
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 18:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679707227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRU59Fp1LPCf2L9u79Fxev0jeYDDSl0nAnmtEcwYt0k=;
        b=Gblh5P6wOi+3Vk7yht26IljnWQaGUVcIHVDJfTW5QQIE2S7Jc+welPvGIGUK3Arv7o
         lRY6zU6X6eS/dJDuSm83CcsKMEXtCK+DpamswOkkiZ+SUhF2+F2vknhjXPThDKb3WovF
         EP1sjpoYg2ry6q03v/LrZy3x3hnv+tNZ03CkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679707227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRU59Fp1LPCf2L9u79Fxev0jeYDDSl0nAnmtEcwYt0k=;
        b=2P4T0REUClWumz7UZ6lpDoPzaJk/ljYVIbgwS5+FIzDMclL4gYZp02MOyh9SGvqwlY
         wDRONfPi3KHd0AZ7pXf+Fd3ctw2FS+lEpWL9wwa2ravN0ee3Z790uybuQDWTbfl2KrZi
         QqasP15haLrQxhUROh4p89b1wCafEcdZOi86PSeYXOH4pnHTSvYQJOyfskgM0mDvSR/a
         4x9IxylemJ9yHGbSSpSQ7JuGLw/o5u/PRwn4+YtHE6Ibt3KYetuXabvFDWdBAJcLp/w0
         rEtt40qCZvZPe10VpvPtDN0yP4nKkM6t5TuvtZPUrMNTiaumXLKPKHoZpUlai0bHqE+r
         LjeQ==
X-Gm-Message-State: AAQBX9fsR+Fop96bK7xH4uKlbCVlAbArzvNJptnmWH2SZh5Nw9SOv5XI
	lYZbvoLlPr8VORC5rFkpRsYBbw==
X-Google-Smtp-Source: AKy350ZzS7Y6pc1qWAFsV1Kr4heRJSNrsm+/JeoaH9QVVJn4GXIZCCUZPXrtKpXfaSfy+Z6kX9PdTQ==
X-Received: by 2002:a17:90b:38cd:b0:234:67ef:304b with SMTP id nn13-20020a17090b38cd00b0023467ef304bmr5082656pjb.37.1679707227397;
        Fri, 24 Mar 2023 18:20:27 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id n3-20020a654503000000b004fb997a0bd8sm13917727pgq.30.2023.03.24.18.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 18:20:26 -0700 (PDT)
Date: Sat, 25 Mar 2023 10:20:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Tom Rix <trix@redhat.com>
Cc: linkinjeon@kernel.org, sfrench@samba.org, senozhatsky@chromium.org,
	tom@talpey.com, nathan@kernel.org, ndesaulniers@google.com,
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ksmbd: remove unused is_char_allowed function
Message-ID: <20230325012022.GH3271889@google.com>
References: <20230324173056.2652725-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324173056.2652725-1-trix@redhat.com>

On (23/03/24 13:30), Tom Rix wrote:
> 
> clang with W=1 reports
> fs/ksmbd/unicode.c:122:19: error: unused function
>   'is_char_allowed' [-Werror,-Wunused-function]
> static inline int is_char_allowed(char *ch)
>                   ^
> This function is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

We have a copy of that function in fs/ksmbd/misc.c.
