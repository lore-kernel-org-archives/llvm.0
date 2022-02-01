Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C312CA1
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 20:25:08 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id m6so54450408ybc.9
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 12:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NQxBh7W6WQoopd/1GYZljiEFB/ShqPgFHLn5gnNvn8Y=;
        b=eef4eipwpvsL3TFJxxFdmb4L8ZoICrM8iScWq6tOGrxMFYvddvijvxioe1BqimVZjF
         zTxsmOqEWVCWAY9+ljLnftiZEr3qB6atVvG5B6HoLzXW9gcPBgXLSQxYllXa0qwvFBJ2
         3Bgbwo3aF32NYbRzzZ7Twm7RLSpxWMSDOoFAVz01CTJbYtAb03oXc6CiMms5Sv/eX+4X
         vO/IBz1JFEcwD+l02ewZnypRgup2+Va27nOIN8/FplZmyMtqy1nrLlz/p0nyRsphwJrK
         29YI3Ovhcvrh6GkZKwLJLrKxMsb0WTfUzfk6shVmqBJfWny8lYNQkGC3sGqeXvNcRUv0
         9abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NQxBh7W6WQoopd/1GYZljiEFB/ShqPgFHLn5gnNvn8Y=;
        b=LZk4hevR8/p9wPv6Sz40noaWLcosfwM0bxccNbh/2DhCKP+de9UQ/C7RzNtgEXgUK0
         lbF9gyWSso5cqu18mqdY7IAgruFBoy06wAFImkJnuTLd1uaQhCxkmHsyOI0EJ0TbQXZW
         8ZYK+r882pjPtkAjgQQxpYEuYGzvyS+bMig3CxPH9+MHhmdLlFL/Vx4NhpdTNEatlwj/
         OxRL/oYTs3/ZmdZK73nBfA9NiPQ7f2dHef1AiF28+bZuOsvkeI5kUCWgzMCtOzhvCstC
         A6W+UIfxFgBsw6dEaGvSF13auMUnz7ZCKgHUIKOcKeUJ/Q+YucwBmOfCYT4dQGiPJVSg
         Wzmw==
X-Gm-Message-State: AOAM533YpDdL0dJ1sFQoetj3oK4ERlWyndF5K2ZgCE7Z+R7JeRVhP3+l
	Yh5c3pCNV2U8JkUFqzwBJTA3B9UXMJAbJghi+DM=
X-Google-Smtp-Source: ABdhPJzc9Eqbhc8KooDpwUj/fmwXhyfk2NIiX2gE3LH5W4yJw1W0sv5950Z38giEOj+JUOPs3+zTNJgZcQX4aHD/gUo=
X-Received: by 2002:a25:cccb:: with SMTP id l194mr37620366ybf.752.1643747107364;
 Tue, 01 Feb 2022 12:25:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201174256.1690515-1-trix@redhat.com>
In-Reply-To: <20220201174256.1690515-1-trix@redhat.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 1 Feb 2022 12:24:56 -0800
Message-ID: <CABBYNZJx0Yye2f7ZE7d0WeZ6QQTQGUDHhqeobWZHE3PZGmG72A@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_sync: fix undefined return of hci_disconnect_all_sync()
To: trix@redhat.com
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, nathan@kernel.org, 
	ndesaulniers@google.com, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Tom,

On Tue, Feb 1, 2022 at 9:43 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis reports this problem
> hci_sync.c:4428:2: warning: Undefined or garbage value
>   returned to caller
>         return err;
>         ^~~~~~~~~~
>
> If there are no connections this function is a noop but
> err is never set and a false error could be reported.
> Return 0 as other hci_* functions do.
>
> Fixes: 182ee45da083 ("Bluetooth: hci_sync: Rework hci_suspend_notifier")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  net/bluetooth/hci_sync.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 6e71aa6b6feae..9327737da6003 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -4425,7 +4425,7 @@ static int hci_disconnect_all_sync(struct hci_dev *hdev, u8 reason)
>                         return err;
>         }
>
> -       return err;
> +       return 0;
>  }
>
>  /* This function perform power off HCI command sequence as follows:
> --
> 2.26.3

Applied, thanks.

-- 
Luiz Augusto von Dentz
