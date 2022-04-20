Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A087A
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 20:56:24 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id c125so3211231iof.9
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 13:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RyBXxxIH/nLXI3G0qXD2cOtw9sd5zWd0oLZhbOg6kmM=;
        b=Nas5cf2D8yuFWDtgt5Rq8i1udp0jfH0r++qOT7EtKk3M1w5904AY+C2TM5LTb3SHy/
         eZFgsfhblj24Lq9GkYIOWFG6cVxnngLzUXL9ciEf3HYxYaaSGt2ohuVHEqEFRB0PvSVR
         XBHKsVoOCOjPCJ5iVbch9d8881Vjc/PDkiQDqEwLug5o0GXCFxG3yD2EGVJIkNd+JyPy
         oTIJrc9ZyvlQO5HWfRFB5DGWLruqOsSbkCwWuEljLB9FX1OFYwuEK/xZSH3QZaEf04MR
         7vnJ7w6g0D5XWRUtimE1ey3EVwq/UnOSfHkICByDbb/i0p7yzhZcxv0IsXyD7l8Fs3zS
         Vklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RyBXxxIH/nLXI3G0qXD2cOtw9sd5zWd0oLZhbOg6kmM=;
        b=dHYxI1s5NxOa/Rm2zpDrmWyQ6BKMJUzGSBdFDK5UZOHR8/0XJwYUGnQQYhya7uiN28
         MlPYkEKIF9/bwTl4iGNy1jlTNti1KPwM641hN1j4gQpw7/1Q5bqBlpJ2vJb9i3iEz/e1
         joLyC/X/I3guBWd6FufPnsg7cTagNFLNYcqiMZel6ao42jgqiIUfSI6c++XLI9I1KVPJ
         LaMOmlYFgvngCHGZlcWROyxmdNZn+2tyAS1b18CXdVZ+oj4MUMh6Md7fUH93hMmspOYB
         DAf0Tick9c7Cofi0y+aFzS1GVO4sgBbDqAfHphJaOvKvWPoUL52P/HNyS0wlv1KCBEIW
         IT6Q==
X-Gm-Message-State: AOAM533XpZpxpeqi3ASe+vSOdQFikWCDBokmq1UDv9CfsA6w6utVE+1w
	/+tDvCUsgkb0hT+TV5KqA0JYokKGPYMnxAchkVJLeV5QDtU=
X-Google-Smtp-Source: ABdhPJxkhTGy7FOTlWARsPgxbu2EhND0YDaee5yx9j6CACvFF2cHYCBtYiFwvCbBrAxDCZt2bzo6miS29qrYah1J974=
X-Received: by 2002:a6b:6b0c:0:b0:651:95fa:bf33 with SMTP id
 g12-20020a6b6b0c000000b0065195fabf33mr9832103ioc.64.1650488183860; Wed, 20
 Apr 2022 13:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220420140521.45361-1-kernelfans@gmail.com> <20220420140521.45361-4-kernelfans@gmail.com>
In-Reply-To: <20220420140521.45361-4-kernelfans@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 20 Apr 2022 22:56:13 +0200
Message-ID: <CANiq72n98uuJS4ao7p==nwwfWeGfekm6X8xz667Hn7EPM+qQRA@mail.gmail.com>
Subject: Re: [PATCH 3/9] irq/manage: remove some unreferenced code
To: Pingfan Liu <kernelfans@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 4:05 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> Neither remove_percpu_irq() nor for_each_irq_nr() has any users, so they
> can be removed.

For `.clang-format`:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
