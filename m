Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F3A56
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 21:52:27 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id u5-20020a17090a6a8500b001d0b95031ebso485097pjj.3
        for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5EloPRaMAEvo1BFocPUg4BfBZ1iEVJmMWJsQxi5bcMM=;
        b=YVmlcx5sXVXgzhOvtNXNtNAkcmWX3wxfxu84QX8EIpr8heLKB5rxNy/PHU4gQiNksP
         Nl05EfDdHLQO6X+ieo8hsfYFPduWzcKaHEXh44GBVkDSCnxZhkapPOLpfjvmZMUZIvZh
         /Jx0z/vO6S4i685sTPpbOfzj63SA8nGReAIY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5EloPRaMAEvo1BFocPUg4BfBZ1iEVJmMWJsQxi5bcMM=;
        b=3XUeLWgManxil5HZd0dHUa/WFUorNDlVCoYyPYOZboMfyVkxnVSCxmzfzd3t+P3mjH
         S0a9Cpiai1nKyz01Kz64S/dtVHj7PPWPaAWqS5jlj3wks52EJPVNUDf4T1f6A+UarlAE
         eEt0XaU2z6JTkYcEzD3iAtlsFNJbKWs0O7ebyGpGCiN/2YKt2zWhF09qJm7huhVeVBRy
         xaWxjti6K8AfeHzX5kujfH3JVbBp0nlvH/DYr+syNtjN1L9myMSyDnq0D9Fot3K+Rhek
         avZXkQjWtc2o04QUnEQTFgN4Am6ikRDA1CuxwEdcQWLxKdGKj0DC0bApQ31MiD/URNwk
         svNQ==
X-Gm-Message-State: AOAM533dOp1/gMlrhJFyF/tBsdw8NlwTwlB++JFIvrtc9gGnMUqLVXn/
	5ko9GRN/8EfGt8SY7hfVIgn4Gw==
X-Google-Smtp-Source: ABdhPJyIIy7Mu/4/cYuLkLDArRZG98DXBS95aUkzsSxNZ1kkHNh/R2HFtJ2oWipnr/f65XUDX5MU2A==
X-Received: by 2002:a17:902:e743:b0:159:40a:a156 with SMTP id p3-20020a170902e74300b00159040aa156mr5598299plf.89.1650318746580;
        Mon, 18 Apr 2022 14:52:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r8-20020a17090a0ac800b001c9e35d3a3asm13984922pje.24.2022.04.18.14.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 14:52:26 -0700 (PDT)
Date: Mon, 18 Apr 2022 14:52:25 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [kees:for-next/randstruct 5/5] include/linux/cred.h:254:17:
 error: no member named 'non_rcu' in 'struct cred'
Message-ID: <202204181451.006918DB0F@keescook>
References: <202204180214.X2Y1kbZ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204180214.X2Y1kbZ6-lkp@intel.com>

On Mon, Apr 18, 2022 at 02:31:31AM +0800, kernel test robot wrote:
> >> include/linux/cred.h:254:17: error: no member named 'non_rcu' in 'struct cred'
>            nonconst_cred->non_rcu = 0;
>            ~~~~~~~~~~~~~  ^

Thanks! This is being worked on:
https://github.com/KSPP/linux/issues/185

-- 
Kees Cook
