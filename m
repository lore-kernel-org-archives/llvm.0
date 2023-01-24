Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2CE63BF
	for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 14:11:16 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so14124709pjb.4
        for <llvm@lists.linux.dev>; Tue, 24 Jan 2023 06:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYhmQqrSkgyrF9GZ22+7sL9SN/b0wagx8GLXitDyd2U=;
        b=Jy5bfsLrbfPFQFniNs4LlQVJdkisvdUlHC6udaMPxF3KSHiPU+biXPZeUyAxrJsiP5
         kJWLT+JcZB3pPDTh9Phye/g8l5WCQbJGlV/7zESwmslLDe1+K3urwdiJpYnrnLgtpT6f
         StH63sfAEdSmqQAxc/wmM9KgwvktWsnpFfk9Uznm+bQh3l3vI1cxToX7Ncqp64j4Fyn0
         Q4c4cRgl1YlRYjFgF1YebSVF7ApWtydEvJPk7Jfnq+HQubaIzaWJMVoZDr8b3pDZWIMV
         vIZydMe0WHii/x+0f877Yfbecx/EleJAqM1Au89StBsHFKntYMNcSbVxk/NjuhymcI+w
         MM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYhmQqrSkgyrF9GZ22+7sL9SN/b0wagx8GLXitDyd2U=;
        b=LNvBzFvlHRlfDy+vRzbqnfNlHMNVSFoxNOgJtpSkb3/PW7mB3boeXwekpyFa6R85xg
         77tvfkeopxjusrcxpYMGfg7qYCBQdBYOJe2pKotPnFQr78jAURXCI0bCrPJsi6bYb/EP
         WrN6NfIs5ZrUBNV3zWBX15aV6PGiWrKk1PLwSvG9R5KhYqAKuj48HmefJKcSONgQrreO
         WDtfWnf7s4eIZD4tGY4FyzZlJ+VA0wf9tJbbOgMeUHeJ8LCgCNZX9ZqXm2Wh+VGYEkUm
         BwA+lbabiSOigVPrODkG89wFLRV637zoyFW5dMJC7fzWRXFE9NxSjW12oEAsomOXeVXU
         dLiw==
X-Gm-Message-State: AFqh2kqM6fWj1B6WDF+gdlTfmg9QT3i6zdiTlYf56kPJN0+d45/4bARx
	vnQEm6lQopQKf54mcCwicLj5WA==
X-Google-Smtp-Source: AMrXdXv+MzXrbpWVCUWz6D+hs/wVmEIUHvt1K0VvdnqXqJ0KpBn514vswhg65FyUlI8kwtX5tUs8VQ==
X-Received: by 2002:a17:902:8209:b0:194:a374:31f3 with SMTP id x9-20020a170902820900b00194a37431f3mr7014867pln.3.1674569475625;
        Tue, 24 Jan 2023 06:11:15 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b001960735c652sm1714100plb.169.2023.01.24.06.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:11:15 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
 Tom Rix <trix@redhat.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20230124125805.630359-1-trix@redhat.com>
References: <20230124125805.630359-1-trix@redhat.com>
Subject: Re: [PATCH] io_uring: initialize count variable to 0
Message-Id: <167456947444.222255.5448115416387284017.b4-ty@kernel.dk>
Date: Tue, 24 Jan 2023 07:11:14 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0


On Tue, 24 Jan 2023 04:58:05 -0800, Tom Rix wrote:
> The clang build fails with
> io_uring/io_uring.c:1240:3: error: variable 'count' is uninitialized
>   when used here [-Werror,-Wuninitialized]
>   count += handle_tw_list(node, &ctx, &uring_locked, &fake);
>   ^~~~~
> 
> The commit listed in the fixes: removed the initialization of count.
> 
> [...]

Applied, thanks!

[1/1] io_uring: initialize count variable to 0
      commit: 7a9e93db01f44a8d084c93648981cbc1535a734d

Best regards,
-- 
Jens Axboe



