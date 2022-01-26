Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D4C2CA3
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 19:34:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w14so583921edd.10
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 11:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XoFExDa1ENUk04Al1efvQv2YdMKhh28iapevdw2sH5o=;
        b=AUUQF21p8HydcBPAQC2Be6rRHyPx6Ac1LW4kCboaKffoUSBtVsK/JQZSbqb9Yj0DWR
         nzci1Sv0xMfjuUzkf3ghEl+PMsbpj2pMLYLIy9FlqAsV59xCUwxg6VYwRjcbCStaT+v3
         seQTWC1Ke91ax6c+LHUB9B+2lXnq4oMoeTsK39DUZAnSzA18wgSryWmUJAcRMpY2EEhB
         ITvpsaBEQMSN7Xv4aqohnLC4wq/CfV2tuhifx3te4Jt8JA2wILYi9aVffJseRf5Up3sX
         +eHYMDuQHBUgHL6yY+eYapLO8NabdqgOH+8fF7S74zrKfK4VKegxqkeC+khvXMfmfhkY
         xVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XoFExDa1ENUk04Al1efvQv2YdMKhh28iapevdw2sH5o=;
        b=PsITvst5DYSt8cBnjPn7nMHoD0SVraBNWXWP3d6jgoeMBq1ZTVX0ZGIpFnTcB1Cy8Q
         E2/9cUyeoGvTSwHzYTpbbM8AhHjVHfScrQtXgiqJoxCJTyjSfshev6vOPEgYm2AOk3xk
         6gOZjQdmDB9NDujMMkyz+uPQHobOowhDgxPWpuxeVfKbxt6SeGt5drJmCKP9kufwQ8J9
         4k1dvmajLYfSQCjrtKgD+kI2hB/sc4BWvStXYC8EqykqzOwgOjNiW8RTlkqoMqgnBzOZ
         VqYlqDXA43byzYtFzEybgNaBa0rkQGYeAxNPUjyjOaAJnUnBxcnD+qxTw4aYgvK8M4Qf
         s+Zg==
X-Gm-Message-State: AOAM5301T1teRpAEn5mw8jxEjZi/FH1bdrKGfmXrrxcsiZ9Fu6LtwyHu
	WdssQQByxGzQG0MndlyVDty7cY1IjSBcABQeaBht
X-Google-Smtp-Source: ABdhPJwMNAGOoZ0ZcWzskRXSV/A8+ulNIietH06lvGLxvhYly1IJ5wOyPEQyIJT/E6WZTgtRd8P+c29lJ7sutsYzSLM=
X-Received: by 2002:a05:6402:270f:: with SMTP id y15mr425193edd.409.1643225680204;
 Wed, 26 Jan 2022 11:34:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-2-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-2-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Jan 2022 14:34:28 -0500
Message-ID: <CAHC9VhSV17NFrTAT9rUV-cYBtPJg9ZTnn2Cd2Af3Xpe7e_UtJw@mail.gmail.com>
Subject: Re: [PATCH 3/9] selinux: declare name parameter of hash_eval const
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Xiu Jianfeng <xiujianfeng@huawei.com>, Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:14 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> String literals are passed as second argument to hash_eval(). Also the
> parameter is already declared const in the DEBUG_HASHES configuration.
>
> Reported by clang [-Wwrite-strings]:
>
>     security/selinux/ss/policydb.c:1881:26: error: passing 'const char [8=
]' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatibl=
e-pointer-types-discards-qualifiers]
>             hash_eval(&p->range_tr, rangetr);
>                                     ^~~~~~~~~
>     security/selinux/ss/policydb.c:707:55: note: passing argument to para=
meter 'hash_name' here
>     static inline void hash_eval(struct hashtab *h, char *hash_name)
>                                                           ^
>     security/selinux/ss/policydb.c:2099:32: error: passing 'const char [1=
1]' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatib=
le-pointer-types-discards-qualifiers]
>             hash_eval(&p->filename_trans, filenametr);
>                                           ^~~~~~~~~~~~
>     security/selinux/ss/policydb.c:707:55: note: passing argument to para=
meter 'hash_name' here
>     static inline void hash_eval(struct hashtab *h, char *hash_name)
>                                                           ^
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/policydb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into selinux/next, thanks!

--=20
paul-moore.com
