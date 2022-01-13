Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59B2C9C
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 20:00:37 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id p7so9939144iod.2
        for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 12:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=zpxRDMDpjP0eyt7BG8eM1po5m9+B41KQmJKORqe0L/s=;
        b=TjiTCQj2jJ7CoQ8GnN2iLukX9BxHsjzpLEYpz6iZ8+YquZUwRx6w7Vu0FMHHioZotw
         yDBEcF+ZPmiDEqdk94DCGJ8rkkVXDfdkugYUFtIOAWYI84MmArCHsdM40U/JWzuec3xi
         Nmn0DIz5szn0lGVn+2q+HySl2RCTv4z4/jnlMz48nGfth4S2qFbWQefRebpO+RHhNNBg
         0DE5cTCgccLLLgWfF9asCn4aX8ndeNhFVb7MSW8eieDk4nF/SfWU1xwkxSVIZd3P+6TP
         91BeYao6JNv2FN74KGaflTpdVzsK0qW4fYozPSqPKdcsn4AkbkPWpFTKNGkXTC42hqiC
         KbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=zpxRDMDpjP0eyt7BG8eM1po5m9+B41KQmJKORqe0L/s=;
        b=KyoqwQyOSO7IqCHGgZcuJGE6IouVT4lCUrlI9kWKZc8IZ+60EwzyCls6tKAtYVuR7U
         912xendtA9bpr9wmpjlCVeVgn0JqirnuaY7xKlF4t904TgsB6oizi/23jYty2dnr1j+Y
         URZU4SGh0FE1DENcOvR2NGlgpXrS+7M5nme/Wk1S68BxZVL4ue8dsG3dxfeA7gGuT1v/
         4xM0MWK/ubUTolTbd6WqJDiUm7FfoVXe1txEvhnpisXSExuD4VBAEm/DUVafwIecvFNu
         aDXU2qEmaSJN+HeceddS7zIAtluRJPSesmbF6deg/BrQaVQN2bamMAezbh/2JRtTjT1C
         prcg==
X-Gm-Message-State: AOAM5320Auh8umJ4YyLPPwSLRcjw+BfECa+MzDFuHjzvp5HD+aekkr2p
	Dj5gNsOgDlvMemyQpjakE6ktug==
X-Google-Smtp-Source: ABdhPJy93FHoGOJVPE1DdunyieZI/cMIH71wQsT32PPznbncX4AFfK4i6YqaBGZuoilCs5lGW3zZmw==
X-Received: by 2002:a05:6602:2f0e:: with SMTP id q14mr2974399iow.75.1642104037044;
        Thu, 13 Jan 2022 12:00:37 -0800 (PST)
Received: from x1.localdomain ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id s6sm3483277ild.5.2022.01.13.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 12:00:36 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kernel@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20220113001432.1331871-1-colin.i.king@gmail.com>
References: <20220113001432.1331871-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] loop: remove redundant initialization of pointer node
Message-Id: <164210403642.172421.8237866191152253472.b4-ty@kernel.dk>
Date: Thu, 13 Jan 2022 13:00:36 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 13 Jan 2022 00:14:32 +0000, Colin Ian King wrote:
> The pointer node is being initialized with a value that is never
> read, it is being re-assigned the same value a little futher on.
> Remove the redundant initialization. Cleans up clang scan warning:
> 
> drivers/block/loop.c:823:19: warning: Value stored to 'node' during
> its initialization is never read [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/1] loop: remove redundant initialization of pointer node
      commit: 413ec8057bc3d368574abd05dd27e747063b2f59

Best regards,
-- 
Jens Axboe


