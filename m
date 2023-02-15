Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13707B
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 17:23:17 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l2so3285862wry.0
        for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqtBdN+1ppp8e/CSn0vupSzwChby4224H0BfpXodQLA=;
        b=KUjhCHq/IyaBxJIaBshTwK5EQy/ynz7jLapyf7e2pN9XEQE1moQhCOl/Mj+qbRrfSy
         3q+6cXGQF/jwUKdmo8XEUZ4a+Eho+aCAZT0nMGYMZVwCmsArr96yhUZfmXcjOqgInGRt
         eLPd7AuccY2D8L6b90YVy5eIQAO1JxPA82NVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqtBdN+1ppp8e/CSn0vupSzwChby4224H0BfpXodQLA=;
        b=lVq4AwOrA9XY/HWRjUJ/LnP1bvmkwpWWB5X/HR1iHCFZhJfrnT0xygLOTpMOhvX25e
         gC1v7IzAGxQ3upoYY18H8z5WRdcKVIzSlvX5wuqjoIgfg99vpWeYnpL55XXjFz6MVlek
         yqUuJW6lTst7JtmN6oPFQuP3XhtfugtDFwHcy0sR62es5S1QvSm078wKuYZvoP8bi+2m
         LF4nxDmGkl1bTGggCrrHfklZ1EpNTuYX+3EpB2h9MLE8nIhLDPEvTLw71AT3MknLB+9U
         +nArx9swrvC/ZrCupzhWDsRmhA7Q7Fmo1A9IHBEIPN/jurHRIK7Pb9J5nbiuf8lyCAYP
         X/eQ==
X-Gm-Message-State: AO0yUKUyK6OcM++7KR2MQc5VnycxHpZtek3C/h8k733At02AysFSnhhI
	VvlgktO0OK3kr+WlBwH8eaU/AA==
X-Google-Smtp-Source: AK7set9OHudQqPkdfMrIhN61SvMXrhUrNNXk+iAP3BJDjiL/w2O5ZVFfBlp2c3m/PeRCYgaHEFmw1w==
X-Received: by 2002:adf:f30d:0:b0:2c5:4cf1:a57b with SMTP id i13-20020adff30d000000b002c54cf1a57bmr2257952wro.35.1676481795981;
        Wed, 15 Feb 2023 09:23:15 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::4:270c])
        by smtp.gmail.com with ESMTPSA id n27-20020a05600c3b9b00b003e206cc7237sm1211706wms.24.2023.02.15.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:23:15 -0800 (PST)
Date: Wed, 15 Feb 2023 17:23:14 +0000
From: Chris Down <chris@chrisdown.name>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, mcgrof@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev,
	Abaci Robot <abaci@linux.alibaba.com>, Song Liu <song@kernel.org>
Subject: Re: [PATCH] module: Remove the unused function within
Message-ID: <Y+0VAr21hlIdrxyp@chrisdown.name>
References: <20230210064243.116335-1-jiapeng.chong@linux.alibaba.com>
 <Y+0MsMomkcDBdjNI@chrisdown.name>
 <Y+0PzlA0LijhfD8R@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y+0PzlA0LijhfD8R@dev-arch.thelio-3990X>
User-Agent: Mutt/2.2.9 (2022-11-12)

+Cc: Song

Nathan Chancellor writes:
>On Wed, Feb 15, 2023 at 04:47:44PM +0000, Chris Down wrote:
>> Jiapeng Chong writes:
>> > The function within is defined in the main.c file, but not called
>> > elsewhere, so remove this unused function.
>>
>> Huh? It's used by __module_text_address(), no?
>
>Not after commit 2ece476a2346 ("module: replace module_layout with
>module_memory") in -next. This patch should have a fixes tag, even if
>the warning is currently hidden behind W=1.

Huh, I thought I had checked out latest -next, but must have not done so 
somehow :-) Mea culpa.

If it's only in -next then no Fixes needed, since there's no stable rev yet.

Jiapeng, in future, please make sure to cc the author of related commits when 
reporting stuff like this :-) It helps people to update their patches.

Song, you probably want to update your patch.
