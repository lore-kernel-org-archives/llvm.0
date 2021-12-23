Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8662C80
	for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 12:41:50 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id g17so15947482ybe.13
        for <llvm@lists.linux.dev>; Thu, 23 Dec 2021 04:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMFcygJOqx2hcVsxt5vWXtekAovZBeJCWpY0ATwarLo=;
        b=HI98DRduBhuffS4+1P9Y1dm7p8F5NgMLd3EpBfgpVldac6dM/pfJarkGyCySSc3ig3
         IT3JMr2miSBSH60WGbvGwWwjr3hAUWTdREHK7DnJXhQALkBka5Sn7u3sz+3n0S/d4nAd
         95HIdBf7rxbiBC13koFgFHej7upm3L6oB4Ls8Dh+WMRFi+yHSeI+RyKZps+CgedDvEfc
         IZsaR6Xvs3TXElxeUxWELcsn4JBvfQ1HNSdNi9DQtdS7lvio3sKrQuRVipzXgmfTsOmG
         w+Swm8NRqJJwBgJkyvGTpjnvIVyOg0TlGQc4/AvGBspyC84IjHQ4xCifQEBW3JPQWNa6
         nN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMFcygJOqx2hcVsxt5vWXtekAovZBeJCWpY0ATwarLo=;
        b=3LYJOYojZQ4ZoT4263JGsaC9C0T0JKT666w/7IAGscNlT7PY7wA3Dzta18LVAokozw
         3NXCP2abBBF0hxxD+Ne0ZuRsoyGmaPhF0PI+uxK06XpzV/L6VPyVmzOBkfA/Xb9a3au/
         naAKJ0wF6gtO2aarw6HydgOajn4OKj0AYgXP5jM6rl+Mw+ZN/1jy27ONEVXRRPYNuceY
         PDEx2oQekZNb4q5lTdFI6cHZ9mirOGVHk0QIbwOq5F8oGwtBZlH0X0dvc1byPGD0Y2Rx
         dksnSf2hv7UEHp39Q+tIGtG1uan07CiXT82j3TpZMdLlSBUkX/yWHQxbP9o2Mf3IucvO
         LI4A==
X-Gm-Message-State: AOAM5304YzrrQmEd44A1anv/HHhRZo2jjnTvor5W1MXpB6KmxjwybTpT
	U4GaEiqU6wbhz/54ZOyHHRZwVoIQqFfTcdOoAZI=
X-Google-Smtp-Source: ABdhPJxepOFwSslsh7zK8xgJih6RR3ovUUWt+TYOCT4MJuC+MZVGjLUAvm3k2lglBNCkM7IYXlpEhJ135XhLHlh03fQ=
X-Received: by 2002:a25:dfd1:: with SMTP id w200mr2924404ybg.359.1640263309089;
 Thu, 23 Dec 2021 04:41:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211223123003.6947-1-lukas.bulwahn@gmail.com> <20211223123724.GA23339@lst.de>
In-Reply-To: <20211223123724.GA23339@lst.de>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 23 Dec 2021 13:41:38 +0100
Message-ID: <CAKXUXMxGcJDiw9ZckCEuv-qiYvTZFh7d6PH5oXG-oS1KknDOew@mail.gmail.com>
Subject: Re: [PATCH] block: drop needless assignment in set_task_ioprio()
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 23, 2021 at 1:37 PM Christoph Hellwig <hch@lst.de> wrote:
>
> >               if (task->io_context) {
> >                       kmem_cache_free(iocontext_cachep, ioc);
> > -                     ioc = task->io_context;
> >               } else {
> >                       task->io_context = ioc;
> >               }
>
> Please also drop the now superflous braces.

Will do. Patch v2 will be there in a second... Lukas
