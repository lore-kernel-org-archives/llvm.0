Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9872C83
	for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 12:08:41 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id w10so10337036ilc.13
        for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S3e8pqbxO9kRMVq8vTunu1hvd4DX3hvFiOfDtzQfJiw=;
        b=vDb11hdP7H142tuAwbW3fpRhtcsPF8+mDNWdkpY8XDnvO54fGT4iV2BLa1A2nTyboS
         9YfOqV622Xaiww6i1aDyRsh1x4jvfyd8V3kOdmf7OFJ7Q9KR86zwKzVfaKSqmxxTCve8
         FdT5PePhvMq0J/UvD+j5pvJECeiHON0NUCu+/ovOjNRAkK0Ns+GThHxybtl/xIu4PBKl
         Bc1lXbseEXeud9gSkwXsCqIQGq/R1MkybMwALEelm4/LVOet5K53Oc+z32vZaoxfHq5S
         H7vH1XN98l8vZFb4H/jAIAvaaUX/W579IFlqPoMAckwB0xdNZ60jtcK2Pt0EKPbntJz0
         fjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S3e8pqbxO9kRMVq8vTunu1hvd4DX3hvFiOfDtzQfJiw=;
        b=OwHCX7+/e28ltfbFJ6niI0s2mFq6Qm6lNOVSd9U9Z6uoC5D9evy6Y0NdArVUnPNMDo
         22anjPdMLgqsvTKI8RPE9NwXyRoW6Wxy4xCGr7oCeZ5fvUVRfg5uzmnIZkghZQA8+DG1
         xosPp/eIaFSRr/4xbh6oYvVxRMtHxwbI3vYCo67mGYGGlznQlVzHTa0/eIUQn9VO1MMy
         oiBNX4ERI/karSL1KseC3rN7zV3VB3cmtS6A0YJ9N+3KA083QGGlh7xajfnsvhmxf8YV
         OYJujYENXXTfoRfdoN8LWJetNPjtxmnPVJHnnGd41Fdzc3jNlmvoYdUoyOggAiimEkqd
         LeSw==
X-Gm-Message-State: AOAM531hBTOs3WJ2HpkyWR6vLKdyiVg75l9P1/DLgg1Mcxe6CpZ5G4Vu
	hE9hznOONipCEu56FtOAipHyBMvOEZ3aZXRuqnZULg==
X-Google-Smtp-Source: ABdhPJw7l9tTUHM1yjutTmZWrPVU1tYWmwCykIMHpGpIY9tktiGxDmCCtsSRhTXKzw5/yB3eWydyUujIuks7RoqM8kM=
X-Received: by 2002:a05:6e02:1d9d:: with SMTP id h29mr4170466ila.29.1635509320573;
 Fri, 29 Oct 2021 05:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YXlxhpZWf2mxJaMi@fedora> <20211028064513.guziv6uaivzlk6ki@pengutronix.de>
 <20211028091442.GA16514@gofer.mess.org> <20211028111535.x7xgz7domx2lpyfh@pengutronix.de>
 <20211028122610.GA18767@gofer.mess.org> <20211028180516.t2tpfbzztm7s6cqm@pengutronix.de>
 <20211029071608.GA28997@gofer.mess.org> <20211029110602.uugnbm5vtfpghiwh@pengutronix.de>
 <20211029115412.GA32383@gofer.mess.org>
In-Reply-To: <20211029115412.GA32383@gofer.mess.org>
From: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date: Fri, 29 Oct 2021 09:08:29 -0300
Message-ID: <CAH7FV3njgZ7sOnZZF88KZ2C4UwqxoodpUuLsnucvBxYXmaZo1Q@mail.gmail.com>
Subject: Re: [PATCH v4] media: rc: pwm-ir-tx: Switch to atomic PWM API
To: Sean Young <sean@mess.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	kernel test robot <lkp@intel.com>, mchehab@kernel.org, thierry.reding@gmail.com, 
	Lee Jones <lee.jones@linaro.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would like to thank you guys for the attention and this interesting
discussion. I'm looking for some work in the kernel and I would like
to know if you guys have any suggestions for beginner tasks in this
subsystem. I have solid knowledge in C programming, but I started in
the kernel a couple of weeks ago. Anyway, thank you for all the
feedback.

Ma=C3=ADra
