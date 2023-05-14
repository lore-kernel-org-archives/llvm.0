Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506EB5CBE;
	Sun, 14 May 2023 14:28:58 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3f507edcaaaso17965011cf.2;
        Sun, 14 May 2023 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684074537; x=1686666537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7eRSNNpt/fDq4FH4lTfo5u7cKYedoFAIvQAZfZNZ28=;
        b=QqzFwuT8nPEosz8AeHi0ji5DrB6ReDjtS5N/JRHvUNBbCHSad38EJc6WqQ18XNE5c8
         Y6EuRC6wv0eAMdgAgQDYr1Lzx4PZk94nF1Lu/USHFPyLjbJV4+NXDthWzFswyyS7jqfi
         GQF4R0UG9HYZEQ8RWmD65fcH4xacvOPENPdwZjE1+38/8J23LIcJRYFTEoptPbmdYE/I
         P9cTLfClfFl+ltVxzyVT589IfqzN2nJ0uZ84I+5LwyYbQt/LZKSLgwiYgAOlGngr0S6r
         8zkJjBqO2GTYKZAa0q72JNQK9q7d7GRACBPD8cimRwSsXWUqfb+RFHmFytmB+jQhqRbD
         cgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684074537; x=1686666537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7eRSNNpt/fDq4FH4lTfo5u7cKYedoFAIvQAZfZNZ28=;
        b=IG2aHR2RYd0R4hpv48hoNgV5cT/tAoduwkQFUkfD9s4CZ8FhcHbSswAS5hed4+oR1C
         ZnWmXEJoQVtWu4agkXW4MUPezLLcmnazmuyWWFavV6b5E2yoJqcIXzSFKO9IsuRWWWnN
         l7m31mFlgVpLdBWJb5uPbevosu4kspub3mMLC8+lKxrXRUo9E3j4SCLdox3K4jrLq673
         nP6h4Xcu4vewIyVYTjUV7bZ5uf0tPskOzYhZ7rdUY1WWyII5kWnw3ukWQWAuyPjL8wea
         1A9BOu2Olc/m9REpfx308dG+5cU282qpK24fI2cKA2XUzTXdQsV8ACDF4ycnKMWwqtVx
         pHPQ==
X-Gm-Message-State: AC+VfDw4nZnuVVr2ykEUp2eD64PjHbr+GsprXSOnyeDYqYAfY+jt9Ya1
	6r/BhNUZ1UyOGjkktZ7mRm8=
X-Google-Smtp-Source: ACHHUZ6YBrMWIsmnApfA9PyC0TcI4RjLTg4VSdwp4P1zoLkGZqvX+hfQYMcHEIeQuRlh/ScUNOojzQ==
X-Received: by 2002:a05:622a:45:b0:3f3:91bd:a459 with SMTP id y5-20020a05622a004500b003f391bda459mr34477137qtw.34.1684074537133;
        Sun, 14 May 2023 07:28:57 -0700 (PDT)
Received: from tian-Alienware-15-R4.fios-router.home (pool-173-77-254-84.nycmny.fios.verizon.net. [173.77.254.84])
        by smtp.gmail.com with ESMTPSA id o20-20020a05620a111400b0075904321c87sm2655958qkk.13.2023.05.14.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 07:28:56 -0700 (PDT)
From: Tian Lan <tilan7663@gmail.com>
To: ming.lei@redhat.com
Cc: axboe@kernel.dk,
	horms@kernel.org,
	linux-block@vger.kernel.org,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	tian.lan@twosigma.com,
	tilan7663@gmail.com
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Date: Sun, 14 May 2023 10:28:55 -0400
Message-Id: <20230514142855.595298-1-tilan7663@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZGDur5+koRgNh5Ih@ovpn-8-17.pek2.redhat.com>
References: <ZGDur5+koRgNh5Ih@ovpn-8-17.pek2.redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Ming, will make the requested changes.

Tian
