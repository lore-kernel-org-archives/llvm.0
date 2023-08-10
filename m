Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54320CB3
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 18:43:01 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so11017385e9.1
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691692980; x=1692297780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SdKouwlT/oGIo6LiqvsGWbbls1AGv3uLOH1vnufr9x8=;
        b=oV8U1Ycd24HVmZnohFnkQmWKmGg4biBV/LAKF4bVcDXwWYqS4zrvEU0OGthGm/sLjE
         O/fZ/orxxveE9C9NE9YPPm05xd5QKpMfITBvjD4x6ESBe0xQCGFFaDufMQE/uf9qHOum
         Vg2mRl/k5u3m6H51m+6gpjskKLwYVCunlorEIGCw9G58IQzmd5fkQB4qCoodR9FwxaRU
         CKvSuUCbY0Iro+y286MZRFcSsgL8pOyP+SDt2Mxun3zYlvhOG4qCfzH4V75PVcFJL2Kv
         TwddvMqBbLxVXiLcfx7urC+YUIn+jGBqIZZ3i1emMEgUyVNMFpf/vUTJ1TemLn8UNv+9
         iCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691692980; x=1692297780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdKouwlT/oGIo6LiqvsGWbbls1AGv3uLOH1vnufr9x8=;
        b=Wh/HK9l+puWEHs1NtOO6TUprEoVjtdngOPmKj6b7GY4CPco8bG1G6wIOpxg2tBXycN
         gayctSvA8dubIIYIgc+fd3SoSZqLG5fRwW2CuPk+YSufbtOqHFWTWoB2tkrHrwhfkS1Q
         3ANEvo3/sOTMlmM3vnCXsd6hhS21xWLiG9pQ1UUwqn56izUCGtvAPi5Hr5Oh3IvtHOkg
         ghoGRXSEguSO+qFET8ye+k9SJFihepEK5bGGNLDJv1i1Q8lLhZuzFggIocxe+uCue0hO
         6cDD1PsprE2LX1Dzow/4Dc9G5Az9MNjArE94Hc/vf/W4zv7STsEci/TqWKb2af9xILI/
         Kuaw==
X-Gm-Message-State: AOJu0YzLlxbVnXG6AJN+gStfv14gyLmUV1AvbEN63t6aMT7nrWAmkgGO
	LWK4+GzRL/1CU+NIPpozu66ZAD0tghFQjfD5ASU9gg==
X-Google-Smtp-Source: AGHT+IED2Ly4+y2WT66WMkUIU7qKftUG+xMNqKoJ7MinlsMHH0j1IJVgE0xbZn7OOFcOR4mUH90tJAV6k1Y1fSGSX90=
X-Received: by 2002:a05:600c:2181:b0:3fe:45e7:1d6f with SMTP id
 e1-20020a05600c218100b003fe45e71d6fmr2676148wme.21.1691692980051; Thu, 10 Aug
 2023 11:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308091820.0dPY7D6f-lkp@intel.com> <ZNN1WdZ5J/e5OPAt@elver.google.com>
 <CAKwvOd=hgqas-kMxvOgviff43XBmwgERrfGi-ZO45DOcEuG_yw@mail.gmail.com>
 <CANpmjNNjzeKyB7V7r73qW9zzqYeMEEK27pfFV9aBm6yfLjJeng@mail.gmail.com> <20230810100202.93059f4ba94e4400e9a63b39@linux-foundation.org>
In-Reply-To: <20230810100202.93059f4ba94e4400e9a63b39@linux-foundation.org>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Aug 2023 20:42:23 +0200
Message-ID: <CANpmjNMDMmmbgvkHqDRurBmkdyMENDejfg+Vp+VHoO_Maaap0w@mail.gmail.com>
Subject: Re: [linux-next:master 8173/8441] include/linux/list.h:53:13:
 warning: '__preserve_most__' calling convention is not supported for this target
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Aug 2023 at 19:02, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 9 Aug 2023 18:00:32 +0200 Marco Elver <elver@google.com> wrote:
>
> > Andrew, please shout if you'd rather have them as fix patches.
>
> I grabbed it, thanks.

Thanks! This should help with more -next testing. But as a heads up,
there will be a v4, which includes this but also because of the
Kconfig renaming that Kees asked for. I intend to send it by EOD
tomorrow.

Thanks,
-- Marco
