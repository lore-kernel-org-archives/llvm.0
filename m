Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFED3FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 23:08:08 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id s3so20114131ljp.11
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WKl+vSgoVtwUpDwTiYFeDbvOkP5sbvNaiiVprss03Dw=;
        b=A1SYNoXPXp9aR+QbDKLZgTKR12NmkzDsOFeCyOq0tPMxICI8eICyWtmYqdV3M1oPuP
         9MBd9pl8eNdfQkXn+0HNWq9vz63p8ZK8e3uwgCGxvf635skYTr0/yvFcHK4U/9Wsbopw
         8ecObmvzNF+VlYoo92Jv4arrMr190jRmGZWA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WKl+vSgoVtwUpDwTiYFeDbvOkP5sbvNaiiVprss03Dw=;
        b=11Qyjmr6jyCtr6V7oeffTc3/jmC+QfV6qTBpuVoxQuvicvHgjgKDhCVdl3tvHsbm4K
         173NlK98irON9dHXxQCdcdbYOK+KlM0IiXQrMZ9JI2afsUzDPcmK5FEvGyEj2Obnj7Y9
         4kj4fzre0RtubihbIUb90E5yVdfdYuBB+HqoWpqCPCLMz/pR7jyF8GBfpJ20PCpmWSoF
         gXiHOCMhmI0zVGLhSzDxuORzkQy6Wds4HxwVjA1YKJ4MIBbbOu6VVwmt+CjUzB/l9w2w
         t00FpQjgpyZdMkvjKOQD8VFIQr231vbIS/tS9NZUMcoUXwjj0TftDoBY7c8zISNqQnJK
         sqIA==
X-Gm-Message-State: AOAM533vu5YbeU3eV2u5TZODBLbPMJi3ER9zYOBa8VugjIDsoIBZTj3F
	3bE9JGOZq7wL6v8BAdcpqHQR/18zsqjMUsuZbnU=
X-Google-Smtp-Source: ABdhPJxC0LgGR8sRTrTv4qbHZr7CTHw45cJn2QjnRCHn5V37ejn2tyG4ELD1WRUkhQdPf/+q85moSA==
X-Received: by 2002:a2e:2414:: with SMTP id k20mr12818120ljk.482.1631574486051;
        Mon, 13 Sep 2021 16:08:06 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id u21sm952398lfs.111.2021.09.13.16.08.05
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 16:08:05 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id o11so12622621ljp.8
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:08:05 -0700 (PDT)
X-Received: by 2002:a05:6512:3984:: with SMTP id j4mr963725lfu.280.1631574034860;
 Mon, 13 Sep 2021 16:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <20210913131114.028340332@linuxfoundation.org>
 <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
 <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com>
 <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
 <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
 <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com>
 <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com>
 <CAHk-=wjP2ijctPt2Hw3DagSZ-KgdRsO6zWTTKQNnSk0MajtJgA@mail.gmail.com>
 <CAKwvOd=ZG8sf1ZOkuidX_49VGkQE+BJDa19_vR4gh2FNQ2F_9Q@mail.gmail.com>
 <CAKwvOdkz4e3HdNKFvOdDDWVijB7AKaeP14_vAEbxWXD1AviVhA@mail.gmail.com> <CAKwvOdmtX8Y8eWESYj4W-H-KF7cZx6w1NbSjoSPt5x5U9ezQUQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmtX8Y8eWESYj4W-H-KF7cZx6w1NbSjoSPt5x5U9ezQUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 16:00:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjhJgk7hD-ftUy-8+9cenhMDHqaNKXOyeNVoMxZRD-_A@mail.gmail.com>
Message-ID: <CAHk-=whjhJgk7hD-ftUy-8+9cenhMDHqaNKXOyeNVoMxZRD-_A@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <natechancellor@gmail.com>, Baokun Li <libaokun1@huawei.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-stable <stable@vger.kernel.org>, 
	Hulk Robot <hulkci@huawei.com>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Sasha Levin <sashal@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 2:15 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Sorry wrong diff:

Well, this second diff was seriously whitespace-damaged and hard to
read, but while it seems to be the same number of lines, it sure looks
a lot more readable in this format.

Except I think that

                default: dividend / divisor);

should really have parentheses around both of those macro arguments.

That's a preexisting problem, but it should be fixed while at it.

I'm also not sure why that (again, preexisting) BUILD_BUG_ON_MSG()
only checks the size of the dividend, not the divisor. Very strange.
But probably not worth worrying about.

               Linus
