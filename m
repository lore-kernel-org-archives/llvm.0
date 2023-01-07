Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9200BA5C;
	Sat,  7 Jan 2023 00:42:35 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-482363a1232so43456097b3.3;
        Fri, 06 Jan 2023 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tkm822KFA7O70xjFUbGjoKrxdnp/lV7pa30aR+G6h6I=;
        b=o9W/gaM3fn47LOd7POMDZ8i9vl9f/OHcWzd7hBhPC0kLKq/s43yB/eN6TAGru9C4d1
         rUIU+Z+yCDI3L5ZXqRwJz0F6t98I+CEigg33clqSsu5vjSYCaG2516RqOPDslVN7Mr1k
         FQ+eTK9WRZBmYeCJmKKud2JOLA6BTNcG6aehDGF7EzUmy+HVW2bdwliVsDm0zMQQB5qz
         erqWjACw11azY4gNrN9djQfA+SJ5ZHU7r9LtT1TtG7NWfXjYS4tDsrPCAlW3DU/Eq+D+
         C36+Aw0wV4RH+icLmdNqRg2Im2alMtBwRvOVOIM7aY/L7Isf9WJ4f/HtYgFozSlQ+mje
         lcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkm822KFA7O70xjFUbGjoKrxdnp/lV7pa30aR+G6h6I=;
        b=obppQLX5nDh7ZiqZvOtqC4SpVgQcW3eWlMEyzMS16uMbnfqkh3OJgos2Z88oumUNiE
         eP1s2FRAS2Le3DM8wsaKYpIQtrZxd3k5zpOI6nfV1yd5A4tQ4UA+6Ly1vpTGVPzACYS6
         UMHODzbk8gP7eor0HhG1vruANyxt+mUssp313R+QocUVCbFh3mKyV6fnO06EvA03obuv
         aIop8PNesMEspTZUsQVFJxeo7fFBhyys93QfnWexSxpJI8Ne/ax3ktae5rjVJHXZwaFL
         CWDL+XoPugdBZihAEyG0sC8kFAID6O2ZftOHzM7ZEQ5PcNlmIQG1MulHd9TfjBA08Xrk
         WxZg==
X-Gm-Message-State: AFqh2koe5uLjlpbGbAqkaqF1k/8MNM39r4/cm2CFTFpXXAn5q4hfZBvy
	CZLtd0GLT0cP0dGxue1NOhJSeyYpwNMnlJsgs/CRDNLo2ohOkLxG
X-Google-Smtp-Source: AMrXdXuRmVixv/9TM2vRgBkRFrqbpcZA4QypjP56433k+YSkWJljZtLiG6XZHpJg90uoSrb8bxQ20YmcdXFVROE8/n4=
X-Received: by 2002:a81:94d:0:b0:3bc:7270:cb70 with SMTP id
 74-20020a81094d000000b003bc7270cb70mr6962053ywj.83.1673052154532; Fri, 06 Jan
 2023 16:42:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212272003.rgQDX8DQ-lkp@intel.com> <Y6r4mXz5NS0+HVXo@zn.tnic> <Y6r+UbfkXruwHU2v@zn.tnic>
In-Reply-To: <Y6r+UbfkXruwHU2v@zn.tnic>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jan 2023 01:42:23 +0100
Message-ID: <CANiq72kqfva8ZcLSLbq7=yGdVUHra=eh3etUo5vh1rGbM+eZug@mail.gmail.com>
Subject: Re: [bp:tip-x86-alternatives 1/1] error[E0588]: packed type cannot
 transitively contain a `#[repr(align)]` type
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 27, 2022 at 3:16 PM Borislav Petkov <bp@alien8.de> wrote:
>
> Resending because rust ML doesn't like big messages:
>
> Rust folks, you can check out the whole thing here:
>
> https://lore.kernel.org/all/202212272003.rgQDX8DQ-lkp@intel.com/
>
> (and maybe raise the limit on that ML of yours :))

Thanks for the resend, by the way! Yeah, we had trouble with the limit
for the big initial patches too... I can ask the vger admins if they
are willing to raise it given we get these reports now.

Cheers,
Miguel
