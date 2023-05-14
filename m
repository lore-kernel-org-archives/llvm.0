Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178F110D
	for <llvm@lists.linux.dev>; Sun, 14 May 2023 01:52:40 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1a69e101070so22085765ad.1
        for <llvm@lists.linux.dev>; Sat, 13 May 2023 18:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1684029159; x=1686621159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYTLjSURSYHVU2rpRc9lA2aRFMXcyJmFXv9MzBM+Tuc=;
        b=rkIuz56VoEWdSOE4dcBRejNDyVWfz8b7UFzyDD0seSF3wjb4AkUTdKrhbOkwo7p0IX
         beqJoSEh0dL3nU3V9fRQ4gR1zvjzOlD8f2Ou49bu9861odVnM+MaMuAdMp/uAjHzcwKM
         wyIVRTbUajPB/DGXHwYDjkMvED0K/PWZBBseyoiKnPbZkTd2nlYaEsrMhRqJ+cTLXcsr
         Tjyu1Zv/1fCp5BzyfvDDArqDJaKcaPQN4Hr5Sf+ru+vs8xN/FuchC+hBUiesyY9D8SSj
         aM5+M7j1xZT507n9NmblvEssp9QyxyJjo5Z/7+l4EGyXVmo7DA9skMF6qBUpT94DirpS
         6y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684029159; x=1686621159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYTLjSURSYHVU2rpRc9lA2aRFMXcyJmFXv9MzBM+Tuc=;
        b=lYRQH5xVHN68N7qOxx28lqO+vETTbvTRLnO8d7YxUR7DDOEQ3vXwGp0lK4V/dF6aRI
         t0zZt1s/Ers/6sKskgx9CI30JKbKAwky4wUMWzCpA1RgP+7DF53RRPkVCNGnHKpSDyeD
         go0///uqeLlmoSesBeNi+UHa6jRCvU/iU+xOD4t/Z86sFPf2shLtBLhy5ZxqBfnDD/+5
         eKIjVycQ5fOFzZ0EEgyJ8PDdldztHU+5V11rqWR/UgsUjWcm0UOaoGUnpSh5YYZV16Ns
         9hm97Zj4s49bwqhPr6JT6JQI6Nnhxf4doWP6WS9E3xddlanmagSvc+vbZ0wsBzA0W0T6
         +xTg==
X-Gm-Message-State: AC+VfDxRqPva8Ma1ZSE32bIMmCu/H5VFD4DEqhV5zOP/GVUda01GKcAi
	87VZte7UtO7kGuLtoRWvgY0WRg==
X-Google-Smtp-Source: ACHHUZ7vWekjpSO9fr8o8GUMMJGghmlRyA/1nKUzo/CINXVA4mZrF8FEO1gazciJX0tN9sPoKXa70w==
X-Received: by 2002:a17:902:f547:b0:1a9:581b:fbaa with SMTP id h7-20020a170902f54700b001a9581bfbaamr34696152plf.2.1684029159469;
        Sat, 13 May 2023 18:52:39 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d7-20020a170903230700b001a661000398sm10497035plh.103.2023.05.13.18.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 18:52:38 -0700 (PDT)
Message-ID: <da0ae57e-71c2-9ad5-1134-c12309032402@kernel.dk>
Date: Sat, 13 May 2023 19:52:37 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Content-Language: en-US
To: Tian Lan <tilan7663@gmail.com>
Cc: horms@kernel.org, linux-block@vger.kernel.org, lkp@intel.com,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, tian.lan@twosigma.com,
 Ming Lei <ming.lei@redhat.com>
References: <892f5292-884b-42ef-fe24-05cfac56e527@kernel.dk>
 <20230513221227.497327-1-tilan7663@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230513221227.497327-1-tilan7663@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/13/23 4:12 PM, Tian Lan wrote:
> From: Tian Lan <tian.lan@twosigma.com>
> 
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
> kprobe output showing RQF_MQ_INFLIGHT bit is not cleared before
> __blk_mq_free_request being called.
> 
>   320    320  kworker/29:1H __blk_mq_free_request rq_flags 0x220c0 in-flight 1
>          b'__blk_mq_free_request+0x1 [kernel]'
>          b'bt_iter+0x50 [kernel]'
>          b'blk_mq_queue_tag_busy_iter+0x318 [kernel]'
>          b'blk_mq_timeout_work+0x7c [kernel]'
>          b'process_one_work+0x1c4 [kernel]'
>          b'worker_thread+0x4d [kernel]'
>          b'kthread+0xe6 [kernel]'
>          b'ret_from_fork+0x1f [kernel]'
> 
> Signed-off-by: Tian Lan <tian.lan@twosigma.com>

I think this needs:

Cc: stable@vger.kernel.org
Fixes: 2e315dc07df0 ("blk-mq: grab rq->refcount before calling ->fn in blk_mq_tagset_busy_iter")

tags, but I'm also now confused as to whether the flush handling part
of that patch. Ming, what am I missing in terms of not honoring the
flush ref on put? What happens if two iterators both grab the
flush at the same time, and then subsequently put them?

-- 
Jens Axboe


