Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1683C2C80
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 14:10:21 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id e128so7272174iof.1
        for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 06:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=gMMkG6ShZ8Fp8sfGbq2eA4arzE/ALNfZG3xl3bXJNac=;
        b=zJGqbUATsUbBv6aa3sXgvVdq8FU+nNsnuNULbWOe0Aq65kN627RrJBdYAnXPEOU573
         57oO5OnVaYU37dWODlrEEKJxu79VLTm7VDq8++2Xf4HnqRqI/dI13K6+B5bgFE7GJPmr
         guGqNeGmHAXcM3tB1dRoG1i9eNhAlm9LzYfYlwaepBgd8HNjB4Vnc2MJQmADlG63OqK7
         zJUuK9teis2aL3R6Lj5EJCYhMV3NVEXzXlnp83F1fJ1DyziTsvU5mxOopnk24a5kG6nL
         teLIYhVOw9/0RNEza/SfcUotZISuE2BFRFDUUCcLXTtod4BfdYdRqQ6FkopKNaEyoQxd
         8aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=gMMkG6ShZ8Fp8sfGbq2eA4arzE/ALNfZG3xl3bXJNac=;
        b=HZYgEchEYmC8euqnW9KLZHXznme4ZSDtyJFArvQPj1EXnS59mf31RNNlwg9hvqz7PD
         9xVivPfrEDsUc/TToGnKq7+aM6Mc8X2WkXq9OOiy342X63R1pwslvxNyJeMLP/qfzsXI
         KJ6r5eUx0zkNXV2/MvK4GfrxjWjUsxj+cA9fXr1U2U7O55CSD/JaE+/aSh9djxQx9DhU
         v4nt2j4gEDwLm3MFM4EFg1zdz4+0X6OYrgxAJJWeMr3qPlYYtIXZUh3vjdmEAdN7sJCr
         MnfPl7fvktJHzQ95WseT0WnIDSZsirtzANzp62bJnB7Np2gBr/NGGGpQhjPWK6cuxwDH
         JGEA==
X-Gm-Message-State: AOAM531Y+FDKHG9i1ck/Kq0T3vVpNaCWkYncAFltpuU5f1UZi/B7GJND
	ayIRkJTunGgKtxtaxmgAMP58yw==
X-Google-Smtp-Source: ABdhPJwe/yp49IOX3sR4spMvhOeNOgkGUATD0XvuuA62Fz9OMMcM+zMLkz/p2WC4YR3YMJG1IZdJkA==
X-Received: by 2002:a05:6638:2495:: with SMTP id x21mr104131jat.258.1640268620593;
        Thu, 23 Dec 2021 06:10:20 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id k1sm1549005ilu.80.2021.12.23.06.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 06:10:20 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, kernel-janitors@vger.kernel.org
In-Reply-To: <20211223125300.20691-1-lukas.bulwahn@gmail.com>
References: <20211223125300.20691-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v2] block: drop needless assignment in set_task_ioprio()
Message-Id: <164026861975.771757.2667766405282712502.b4-ty@kernel.dk>
Date: Thu, 23 Dec 2021 07:10:19 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 23 Dec 2021 13:53:00 +0100, Lukas Bulwahn wrote:
> Commit 5fc11eebb4a9 ("block: open code create_task_io_context in
> set_task_ioprio") introduces a needless assignment
> 'ioc = task->io_context', as the local variable ioc is not further
> used before returning.
> 
> Even after the further fix, commit a957b61254a7 ("block: fix error in
> handling dead task for ioprio setting"), the assignment still remains
> needless.
> 
> [...]

Applied, thanks!

[1/1] block: drop needless assignment in set_task_ioprio()
      commit: 669a064625fa3a06ddf8a4ac1f35b7436b99f133

Best regards,
-- 
Jens Axboe


