Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EAF2C9C
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 12:31:55 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id k6so5424077plg.12
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=puzh/4zgw5qsrOsU7JEwzpl2qiVxo2BGWuYm1B1pvJc=;
        b=FOkQE8b15ofFRmlKdr6pjDgjDhJz4PC38Py9SSNAu0nnkM47LTPU8wiIAj/jZ4OKM7
         qh7E0Sn2BbEx2zoZw1/Ji/fpAJnOrxQqKX5aIm6XHCLFBWzF/Ld2G7WhPE6AV2au0Hpz
         GwCCUqr1xUsUnyWm/q2STFAefL61fCIptPeQNbVYXE3Z/7dAzjxe04cqvgDuAQzMSp1S
         opIRB4V2nroDDj+fogAtRn52dnJM56gyezVmeghr8U8l4eTFZdnL5UyQBeT1cXufm+FY
         oW0/NpLBpkEUpVc3ZKScnspxuMz+twZ9ZV/HvGJZmJ837fe7JhZm63EJEDtcIFNL1oql
         Hoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=puzh/4zgw5qsrOsU7JEwzpl2qiVxo2BGWuYm1B1pvJc=;
        b=SCLLW8izrl5Ab6MblJWexoz7M/M9vLUuHcwnSNwHHfoYuDt69Qjl84OkyiAJsW/MoU
         GFpY3qE8qDULoaM+8eRAP2QErqXydBh03K/Fw+3OF6LjDA3ELOUzRlLbdEWapB7sEoxh
         6cRseAy5pt7KkOIO7QCSlTB96woXJOjcppYgMEm5YurFPIPGon+tLqm2nkDuLOkverQq
         +LoS5J7exei9dNFtrQNFM1ErTO/0gytuijPpS+Zt59HE80unhvVPy8EXM6xbKFeCk+9N
         RRVbaa34oE8KWvHdVpgBoIWN5tMzLCSTvqXkMGMC/9gNHMLYS14vhJXk5X+dnxbgfV9B
         MC1A==
X-Gm-Message-State: AOAM531NzMw+6+SF3WAtrMNIwdxLvgCXsBd07GpPyNQCUibP3CO9zmSC
	BsBTJKwUx5MOsTpoaLhF4hEJDg==
X-Google-Smtp-Source: ABdhPJwf6l5qKXE4WAgPzo68qMtDZFuJ6rGv+5jCaoBU8zk9mNef60xf59zruIe/sIvbJXO9IoxxSg==
X-Received: by 2002:a17:902:f209:b0:154:3b94:e2f6 with SMTP id m9-20020a170902f20900b001543b94e2f6mr9225257plc.93.1647865914885;
        Mon, 21 Mar 2022 05:31:54 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id mu1-20020a17090b388100b001bf861ef154sm21485472pjb.55.2022.03.21.05.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 05:31:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, Roger Pau Monné <roger.pau@citrix.com>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20220317234646.78158-1-colin.i.king@gmail.com>
References: <20220317234646.78158-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] xen-blkback: remove redundant assignment to variable i
Message-Id: <164786591377.5770.820740111597207436.b4-ty@kernel.dk>
Date: Mon, 21 Mar 2022 06:31:53 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 17 Mar 2022 23:46:46 +0000, Colin Ian King wrote:
> Variable i is being assigned a value that is never read, it is being
> re-assigned later in a for-loop. The assignment is redundant and can
> be removed.
> 
> Cleans up clang scan build warning:
> drivers/block/xen-blkback/blkback.c:934:14: warning: Although the value
> stored to 'i' is used in the enclosing expression, the value is never
> actually read from 'i' [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/1] xen-blkback: remove redundant assignment to variable i
      commit: 93b4e74789dbdefcffc7baac107069e74d98513c

Best regards,
-- 
Jens Axboe


