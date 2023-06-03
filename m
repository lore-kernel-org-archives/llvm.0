Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67413101EF
	for <llvm@lists.linux.dev>; Sat,  3 Jun 2023 23:20:16 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-256200b49cdso433164a91.1
        for <llvm@lists.linux.dev>; Sat, 03 Jun 2023 16:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1685834416; x=1688426416;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/ltOYCrz5Gre+gjDsbk1Be4DpGcOqJcdi+9ePuaFY4=;
        b=z8NX9JHNofAWnIVC2N7/YrvOeLd1Oi+//P9hf+0F3xTS4mvG1K3eHfE88EAWRTS4AS
         yzBNGDqWGQEfASUNhk/LqE4g6FwcqvvFvsfGVsBpL9ZOCnFxIMARrQQrT861W70wcbdC
         ppjX3q20vO6Z7dIwhiRpaLXfus2+EYqRHUtZrCGoo7i2nqs4z3GUS3gut5SH8uilwQtv
         SomCR7sCBFeVWNLQvO7SJ15oPSd2eJ/p4UPYNsUi4tS/yKe+Se/qStLE2Vb+/UGugh0w
         D6iOACUgWuaJAXiKQIiDyYQKozafpdIWgT/cYmpylyJHCo0dJL+Cg2oZ9zOIt7s8tLMA
         Z/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685834416; x=1688426416;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/ltOYCrz5Gre+gjDsbk1Be4DpGcOqJcdi+9ePuaFY4=;
        b=L731HqjoXzY/z12b4nNJO9WeL9a5PhcgcVrJDbWeuhA2EFHKnwRf71L1QtKq3HtDzw
         en7+MENx9LvLr6U+u+j9ddzNed2SmSAgqBtzLSgQH1lGWxP05Q7LhfOkOTGnN2ROPevD
         TpsJdPCgZpThwAdbcf4oSo8z7mbocew7svSMy6LsRlPea6BgQiIpsR+xkoObtenUU9qb
         VTbiH/jrYtKicluVEhmKUHGKmNQ+tVNGYiMl1z4lDx1R7TTM87lTOoL67l5jodNkSMPT
         1qqETIRTV0E66lQdS0Lfr4ntZ8fIJ8B/H744MuYNY1o8ZYTlEGbNj1w8H01DvH1TYWyH
         vC/A==
X-Gm-Message-State: AC+VfDz6bVe6ZUI4BL8jm9PSGDe7wbRp/H6Ygtq5U7zGONAcsxJ0VSxg
	7eEaMrD9SDZOvYg84FtGdDS+xw==
X-Google-Smtp-Source: ACHHUZ7kDTOOZTJhM+DY91mb4utzbmrJBKlaQ0Rn/Z6XlhWzjp5MWzNDOBoL1N7Ed5epc5Crew+f1A==
X-Received: by 2002:a17:902:d4c8:b0:1a9:581b:fbaa with SMTP id o8-20020a170902d4c800b001a9581bfbaamr13664596plg.2.1685834416255;
        Sat, 03 Jun 2023 16:20:16 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902758600b001a260b5319bsm3708556pll.91.2023.06.03.16.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 16:20:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Tian Lan <tilan7663@gmail.com>
Cc: horms@kernel.org, linux-block@vger.kernel.org, lkp@intel.com, 
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tian.lan@twosigma.com
In-Reply-To: <20230513221227.497327-1-tilan7663@gmail.com>
References: <892f5292-884b-42ef-fe24-05cfac56e527@kernel.dk>
 <20230513221227.497327-1-tilan7663@gmail.com>
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request
 accounting
Message-Id: <168583441458.548598.9269465063341391809.b4-ty@kernel.dk>
Date: Sat, 03 Jun 2023 17:20:14 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835


On Sat, 13 May 2023 18:12:27 -0400, Tian Lan wrote:
> The nr_active counter continues to increase over time which causes the
> blk_mq_get_tag to hang until the thread is rescheduled to a different
> core despite there are still tags available.
> 
> kernel-stack
> 
>   INFO: task inboundIOReacto:3014879 blocked for more than 2 seconds
>   Not tainted 6.1.15-amd64 #1 Debian 6.1.15~debian11
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:inboundIOReacto state:D stack:0  pid:3014879 ppid:4557 flags:0x00000000
>     Call Trace:
>     <TASK>
>     __schedule+0x351/0xa20
>     scheduler+0x5d/0xe0
>     io_schedule+0x42/0x70
>     blk_mq_get_tag+0x11a/0x2a0
>     ? dequeue_task_stop+0x70/0x70
>     __blk_mq_alloc_requests+0x191/0x2e0
> 
> [...]

Applied, thanks!

[1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
      commit: ddad59331a4e16088468ca0ad228a9fe32d7955a

Best regards,
-- 
Jens Axboe



