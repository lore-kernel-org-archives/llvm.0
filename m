Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE67C
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 13:15:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id a15so10526721pfv.11
        for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=DkpznYvxl1/xMx0A04k/2Fl0ZC/HbF/iN3ydwHQpN/4=;
        b=4uaKF5hlFr8mNsqJ8TWB7F13SlhEEPo6NAAmtKTt7hIpuOSLzZWSskb28us+DcoQai
         09KbaV2Jk+l5ZnE7rzVymd9zCGCRy8hf4ZQquJgFVgtYVhmnJTTi9egqygeeC6Eau+0I
         k2CdEmIWlEgDev5uEE2Qlex6Z0WJIf2G0lkFBf3uql+/uYQ27+tlRpNSxJzb3FsIx0kR
         lKVexeAUZv+LP6mLjN3G/Hc1to0dpN6PfwdsZ+w/dkw6VE8StSH8H+kgWrMPLs8MvIFe
         O2soPkbclypAAE5smTL11bCHL13QTHaCSvsIKTgQh4ocExW52yAe45JL6xrsvJSjbrkY
         LtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=DkpznYvxl1/xMx0A04k/2Fl0ZC/HbF/iN3ydwHQpN/4=;
        b=wNeSmEkMa9BqXYLQa/b/aosTD4qblBSBwAVmx5mnwlwJX+G3jauSoYI85BBVueVudh
         OvCFA4WtbakLGUWpZtdp5NLYqkuEUgW50lyu4I0dkkM+ut6mfCKiZ+MGMk75a4VMI0Qh
         WqW1OAWofJTiUUX/CM1To52QuFQmhuJnYJkEHRxhLGiID80ZH32cENTwFHgyNsDhvZhj
         LOUqI2TeQNvdSk/SIPULL4XGcvj1UcQtRXG+PhLqk6CROVPvcuLEcu1VJ9eYKhLEsZG/
         TDPM0CGeJ+5z4W5T+b4ufbQKK0CxiNzj+dlntUqI/o3+KaKe6z3ahRc+CRX6SvkMp2vJ
         IY/g==
X-Gm-Message-State: AOAM531Kikap1DRrwZRwEEHA9fx6cATWwGx3mz8yMIwTCKoNals1yK7H
	M07Sn4gQWnOxeZwpOP4cnJPeCdOL79nvz7aF
X-Google-Smtp-Source: ABdhPJzi//fAeVhht0V7uQhZj5Kv/AcBUYnzTjirTu0TP+mQl1OLLisyNtf8gYG/7eAbKd4x7ErVrQ==
X-Received: by 2002:a05:6a00:b52:b0:508:31e1:7d35 with SMTP id p18-20020a056a000b5200b0050831e17d35mr10083737pfo.33.1650719745503;
        Sat, 23 Apr 2022 06:15:45 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id t66-20020a628145000000b0050ca37e60eesm5935627pfd.57.2022.04.23.06.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:15:45 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: ndesaulniers@google.com, michalorzel.eng@gmail.com, trix@redhat.com, nathan@kernel.org
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20220423113811.13335-1-michalorzel.eng@gmail.com>
References: <20220423113811.13335-1-michalorzel.eng@gmail.com>
Subject: Re: [PATCH RESEND v2 1/5] block/badblocks: Remove redundant assignments
Message-Id: <165071974452.502130.12676791188164630002.b4-ty@kernel.dk>
Date: Sat, 23 Apr 2022 07:15:44 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 23 Apr 2022 13:38:07 +0200, Michal Orzel wrote:
> Get rid of redundant assignments to a variable sectors from functions
> badblocks_check and badblocks_clear. This variable, that is a function
> parameter, is being assigned a value that is never read until the end of
> function.
> 
> Reported by clang-tidy [deadcode.DeadStores]
> 
> [...]

Applied, thanks!

[1/5] block/badblocks: Remove redundant assignments
      commit: 3de2e5f28cb133f1d9c1b2403079722d0e7b671e
[2/5] block/blk-map: Remove redundant assignment
      commit: 7ab89db979017255c2163880de5c63d8c9726aef
[3/5] block/partitions/acorn: Remove redundant assignments
      commit: 834726828b47c08e84df02f975e30c5c65bf316b
[4/5] block/partitions/atari: Remove redundant assignment
      commit: 87420fa94f6cdd2ae8aa3e1d8602bfa549794fac
[5/5] block/partitions/ldm: Remove redundant assignments
      commit: e233fe1aa02815f38588a5a965a197bbcabfb125

Best regards,
-- 
Jens Axboe


