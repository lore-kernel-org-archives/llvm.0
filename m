Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C903FC7
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 20:27:30 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id u24so745953eds.11
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 12:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P7fKMSKo+zYB6l0bcCRLZSEvmbTEgZGQHcFcWTESB/8=;
        b=T8XsmF7/RkWSoa1Uofykc8YgJ4ksfOBVQ1W3E/PAqloI2DNVWNHR8DK4/+nARWFYwQ
         HAqBsXl7/U8MFdaDgmNL53zfIDS+/owDmCBKF+Vr/VI7Rb191veqqQzedmj5eEuR+AhJ
         7jkOnAW4G7iRcOb9YrTFFIP89YB37hE+6K+lR+DuhHrBkITgBEoUXNbj7HJ4pISDixZS
         gSNotfzQG9YKFtGdg6IhR1+rAUXSFvxT20JTgRF4IiMTidXOZGyz+kCMa2/SuLniPvJi
         SfDjxssD0L+wzJXmgpw4hRDBZsJvI9PwLlcfj5LEn6l9IDXKjPdOidn/R4LtViAq9a1o
         wd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P7fKMSKo+zYB6l0bcCRLZSEvmbTEgZGQHcFcWTESB/8=;
        b=nrYZY4a0E3C23Ad6qBDrcWQKY9vxfDy88ou0aTpd58QLfKgyAb6Hi+0e++dzyCkwaZ
         W18UG2rFaW0kvL1W5SYbaH/eDETIpM0pMzyAMWfhAtsvyWGKVt5cVRRuolCbum/JEmzt
         cJdha3WrVMjkIb5WH95vdAiygaIKUJOeIhE4//6419gvjR3w+ncl+09KJxjS8+7kQ5hn
         zbvOLETF3TgluVUO8vwWsnAy17ooGrEyoTy/Un9nKi6nl2pKRrWaGOYQgFAphEufU4sq
         O7mtdAR7tOf1Xpp42Nvj8WC5jw4/LN2yLZ/uP32MemM5BUQSLSBjVi5E6PuDB0mP0wRl
         NGcA==
X-Gm-Message-State: AOAM5305dEtEBxEl+IDNDYQaWz82u0ygOLyfxHIVpeve28XEz5XpHttR
	CZzMhbPhT4Lcm7LzdNx8VwG78HqYC57JQohkEMjS
X-Google-Smtp-Source: ABdhPJwpLDsxPl9dSCn/6ZhjVdqQvY+qo0gszHugbTZ1j/RmIs9yltE48w5RGwnPuintOLFvvMDgAvBG1ksxt3bQg78=
X-Received: by 2002:a05:6402:2683:: with SMTP id w3mr604716edd.405.1643228848645;
 Wed, 26 Jan 2022 12:27:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-4-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-4-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Jan 2022 15:27:17 -0500
Message-ID: <CAHC9VhSqp-PCp4rLc9Mgco6_3j5JLuym0EZU1xAvzbtt5O87fA@mail.gmail.com>
Subject: Re: [PATCH 5/9] selinux: drop cast to same type
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>, 
	Serge Hallyn <serge@hallyn.com>, Yang Li <yang.lee@linux.alibaba.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, 
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Jeff Vander Stoep <jeffv@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:14 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Both the lvalue scontextp and rvalue scontext are of the type char*.
> Drop the redundant explicit cast not needed since commit 9a59daa03df7
> ("SELinux: fix sleeping allocation in security_context_to_sid"), where
> the type of scontext changed from const char* to char*.
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/services.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged, thanks.

--=20
paul-moore.com
