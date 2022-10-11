Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222E3D62
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 20:50:55 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d24so14353629pls.4
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 13:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hXVOT4cLQG/UjKF5bxvScKtDt4JjDuPp0lInq7z6SZk=;
        b=sqIPnSdL5hOAbhrVhdZG2o8sGZ+fwLZzLOdlefjOihqvUGgLaSJColzIKLls+fnmKc
         I+TNrBcbp3DxnXu9g+CwxTQBCR/0lXT18ueWRQ7SdpO5Jm+/4LysJaFEFJhAZ+nopXLE
         1ZAsm9yxvKs6Z62XTHSFJGC/iB62BnYQcAg63vgJf9ZjDBLDmn6c7iWTQPD6bGwOhLu5
         lObbFdm5P1qYkhBVE/wg3zrMywx6vg4lmS8fqA0fgqGn0Yipmuuqp+gC0/n5gUiJqSBM
         fLmw31GK/0DFXVXnvvEZSGO/eBt5F3sAdVV4i+DtzdT0TcfTs7hW0sfARTyGKIssnxUE
         Tjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXVOT4cLQG/UjKF5bxvScKtDt4JjDuPp0lInq7z6SZk=;
        b=eWVEdgHG3FbcPaNivzse9iiy4x62XkXs02aW+CqVxg5JKQk+FBatYf2oaZVNrf8wwS
         C8rn6SB1zA2grsCORn8CXxVGm0STyCxO8B1BR8Uh68zNm65kx8O9rntubjNbFSP5/Sz3
         FOXPOM8VzItKmYw4DdP8Sgfb8hz3qdZv1psNOW1ACaTdHiWgL5oNmblPiOwq5TlULdvW
         tr6AT3rfU1XEhNNoQuseT/zy8qKk93Dsx2ECVJWY5RdyvVONq5UP617lG2K00cdVdI93
         HOgbNQJWiclX3uveqZqjSPmfN1nAI+oaphpOJFgReES1AFSAMGUMB0FvGNpMlPVvmwFm
         bDlQ==
X-Gm-Message-State: ACrzQf02DuiAXyeR4Z2+rpxvSn0OKO62VKrbtsR/5L9CzMvgz6YgTOdn
	3ybz2m6mxDqbJk0oRp2ksWFb+97AZsX109n0dJpoUQ==
X-Google-Smtp-Source: AMsMyM4uoOmAwILCMQCsBXafyhKXq7+SNA+WhdgnvaxFyUqFj5CAoRyNhw9YCykE9rs7Uze6SEDZvj5fOZdI4rt6f10=
X-Received: by 2002:a17:90b:33c3:b0:20a:ebc3:6514 with SMTP id
 lk3-20020a17090b33c300b0020aebc36514mr1105208pjb.147.1665521454797; Tue, 11
 Oct 2022 13:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20190307090146.1874906-1-arnd@arndb.de> <20221006222124.aabaemy7ofop7ccz@google.com>
 <f0dbc406-11b4-90f7-52fd-ce79f842c356@linux.intel.com>
In-Reply-To: <f0dbc406-11b4-90f7-52fd-ce79f842c356@linux.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Oct 2022 13:50:43 -0700
Message-ID: <CAKwvOdnpMqW_esBd615Fx8VKTfny-yR2PTUejBH0uYkHaL517A@mail.gmail.com>
Subject: Re: [PATCH] fs/select: avoid clang stack usage warning
To: Andi Kleen <ak@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, 
	"Darrick J. Wong" <darrick.wong@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 7, 2022 at 6:46 PM Andi Kleen <ak@linux.intel.com> wrote:
>
>
> On 10/6/2022 3:21 PM, Nick Desaulniers wrote:
> > On Thu, Mar 07, 2019 at 10:01:36AM +0100, Arnd Bergmann wrote:
> >> The select() implementation is carefully tuned to put a sensible amount
> >> of data on the stack for holding a copy of the user space fd_set,
> >> but not too large to risk overflowing the kernel stack.
> >>
> >> When building a 32-bit kernel with clang, we need a little more space
> >> than with gcc, which often triggers a warning:
> >>
> >> fs/select.c:619:5: error: stack frame size of 1048 bytes in function 'core_sys_select' [-Werror,-Wframe-larger-than=]
> >> int core_sys_select(int n, fd_set __user *inp, fd_set __user *outp,
> >>
> >> I experimentally found that for 32-bit ARM, reducing the maximum
> >> stack usage by 64 bytes keeps us reliably under the warning limit
> >> again.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>   include/linux/poll.h | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/include/linux/poll.h b/include/linux/poll.h
> >> index 7e0fdcf905d2..1cdc32b1f1b0 100644
> >> --- a/include/linux/poll.h
> >> +++ b/include/linux/poll.h
> >> @@ -16,7 +16,11 @@
> >>   extern struct ctl_table epoll_table[]; /* for sysctl */
> >>   /* ~832 bytes of stack space used max in sys_select/sys_poll before allocating
> >>      additional memory. */
> >> +#ifdef __clang__
> >> +#define MAX_STACK_ALLOC 768
> > Hi Arnd,
> > Upon a toolchain upgrade for Android, our 32b x86 image used for
> > first-party developer VMs started tripping -Wframe-larger-than= again
> > (thanks -Werror) which is blocking our ability to upgrade our toolchain.
>
>
> I wonder if there is a way to disable the warning or increase the
> threshold just for this function. I don't think attribute optimize would
> work, but perhaps some pragma?

Here's what I would have guessed, the pragma approach seems a little broken.
https://godbolt.org/z/vY7fGYv7f
Maybe I'm holding it wrong?

>
>
> -Andi
>
>
>


-- 
Thanks,
~Nick Desaulniers
