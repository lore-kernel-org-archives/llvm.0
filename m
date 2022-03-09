Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602935127
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:15:42 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id bn33so5207034ljb.6
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qw8gxVd/jhZj3HT7A23dlpB9LW84F+FNi7JNdvrCukQ=;
        b=hfb8CzPyalPIpFuwiwa0XbPwPxNPzZJjxvpkX0YTX0v7YvhBIERsAprnsVo4Mi1DmR
         4qFwJ01VcC+MJzk9PZGJezEgtQV+T3wEqf8LNqSCwTbbfn6hWblrjmdv5juTbexxLXut
         AtIufaImJ0J1z49EJGYA2H1DuFgPj6qxEGoIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qw8gxVd/jhZj3HT7A23dlpB9LW84F+FNi7JNdvrCukQ=;
        b=wRMglOKzFJ3ixRwsHgM5G65rUKzvPxzmIr6TcR+mUzhWIbWfsu6TZ3J4nU+92G2OFx
         pkL+UxHIQXFLHivqCOe1HANWpnFd5kZLqG+Nkqdq4t7W5oiuvOuI4QCm2SPLoQ8D+vUJ
         lMSd4WNpD63aL3mO/TCLC2VHm92AxHPM6drWyJvQNjT8ll0JjBhtQPuXJHI6jsuJaSFt
         O6vvA4GXXSkdD6qkTbXpdozOFp7s5O7mym2sxHVcWzBCO02BBweQ+PqEMq6eiJlhObqZ
         NaJ6B5E3VA1tIsz5IPK9NqAePfRF6AcQh4ITIGWY3zJdB4/xbKPFespJqCRPJHWH3bZx
         goSQ==
X-Gm-Message-State: AOAM533FxQLPSHxgaVGfLSOwEhCxakaTrtOlYwtubc7dJUDuHrXIIn2s
	uT2lQdLGdlJoBX0GnjlSgEZNSWVxPEjizZOiPXM=
X-Google-Smtp-Source: ABdhPJzHsYvLDX3ce4EHfeD8HG/JCaqbG5uJOh7XsxyQapjO30I9/ZV34ai5X6jpPbh8TfB/ZMx+sQ==
X-Received: by 2002:a05:651c:210d:b0:247:ec72:d84b with SMTP id a13-20020a05651c210d00b00247ec72d84bmr1060768ljq.15.1646864140227;
        Wed, 09 Mar 2022 14:15:40 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id t6-20020a2e9c46000000b0022d81f4be1esm672512ljj.45.2022.03.09.14.15.39
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 14:15:39 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 3so6241274lfr.7
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 14:15:39 -0800 (PST)
X-Received: by 2002:a05:6512:6c6:b0:447:ca34:b157 with SMTP id
 u6-20020a05651206c600b00447ca34b157mr1112657lff.435.1646864139462; Wed, 09
 Mar 2022 14:15:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220309220726.1525113-1-nathan@kernel.org>
In-Reply-To: <20220309220726.1525113-1-nathan@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Mar 2022 14:15:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi23APrArHX7bcrvKBDZYpHXbeyEW7dRsirwoSPCKgqJg@mail.gmail.com>
Message-ID: <CAHk-=wi23APrArHX7bcrvKBDZYpHXbeyEW7dRsirwoSPCKgqJg@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not use NOCROSSREFS directive with ld.lld
To: Nathan Chancellor <nathan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Russell King <linux@armlinux.org.uk>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 2:11 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> It would be nice if this could be applied directly to unblock our CI if
> there are no objections.

Applied.

Greg - yet another small fixup. It's commit 36168e387fa7 in my tree.

                Linus
